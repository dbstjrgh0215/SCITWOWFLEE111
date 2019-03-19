package com.scit.flee2;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.scit.flee2.dao.MemberDAO;
import com.scit.flee2.vo.Member;
import com.scit.flee2.vo.Product;
import com.scit.flee2.vo.Seller;
import com.scit.flee2.vo.Space;

@Controller
public class MemberController {
	private static final String UPLOADPATH="C:/upload/";
	
	@Autowired
	MemberDAO memberDAO;
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public @ResponseBody String login(Member mem, HttpSession hs, Model model) {
		Member result = new Member();
		
		result = login(mem);
		
		if(result==null) {
			return "fail"; 
		}else {
			hs.setAttribute("sessionMember", result);
			return "success";
		}
	}
	
	public Member login(Member mem) {
		Member result = new Member();
		try {
			result = memberDAO.loginMember(mem);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping(value="/signUp", method=RequestMethod.POST)
	public @ResponseBody int signUp(Member mem, HttpSession hs) {
		int result = 0;
		
		try {
			result = memberDAO.insertMember(mem);
		} catch(Exception e) {
			e.printStackTrace();
		}
		Member member = login(mem);
		if(member!=null) {
			hs.setAttribute("sessionMember", member);
		}
		
		return result;
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession hs) {
		hs.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/insertExtraInfo", method=RequestMethod.POST)
	public String fileUpload(String id, String membertype, Product prod, Seller seller, Space space, MultipartFile uploadFile, MultipartHttpServletRequest request, HttpSession hs) {
		
		String fileName;
		
		List<MultipartFile> fileList = request.getFiles("uploadFile");

		String files = "";
		
		try {
			Iterator<MultipartFile> it = fileList.iterator();
			while (it.hasNext()) {
				MultipartFile file = (MultipartFile) it.next();
				fileName = file.getOriginalFilename();
				file.transferTo(new File(UPLOADPATH+fileName));	// 파일의 내용을 가져오고 업로드 저장되는 이름은 (+fileName)으로 저장
				files=files+"&"+fileName;
			}
			if(files.indexOf("&")==0) {
				files = files.substring(1);
			}
			
			
			
		} catch(Exception e) {
			e.printStackTrace();
			hs.invalidate();
		}
		
		try {
			if(membertype.equals("space")) {
				space.setImage(files);
				try {
					memberDAO.insertSpace(space);
				}catch(Exception e) {
					e.printStackTrace();
					memberDAO.deleteMember(id);
					hs.invalidate();
				}
			} else {
				prod.setImage(files);
				try {
					memberDAO.insertSeller(seller);
					try {
						memberDAO.insertProduct(prod);
					}catch(Exception e) {
						e.printStackTrace();
						memberDAO.deleteMember(id);
						hs.invalidate();
					}
				}catch(Exception e) {
					e.printStackTrace();
					memberDAO.deleteMember(id);
					hs.invalidate();
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
			memberDAO.deleteMember(id);
			hs.invalidate();
		}
		
		
		return "signEnd";
	}
}
