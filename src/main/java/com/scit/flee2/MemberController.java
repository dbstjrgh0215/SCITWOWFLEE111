package com.scit.flee2;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.flee2.dao.MemberDAO;
import com.scit.flee2.vo.Member;
import com.scit.flee2.vo.Notice;
import com.scit.flee2.vo.Product;
import com.scit.flee2.vo.Seller;
import com.scit.flee2.vo.Space;

@Controller
public class MemberController {
	private static final String UPLOADPATH="C:\\Users\\kita\\Documents\\workspace-sts-3.9.6.RELEASE\\WowFlee2\\src\\main\\webapp\\resources\\images\\userImage\\";
	
	@Autowired
	MemberDAO memberDAO;
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public @ResponseBody String login(Member mem, HttpSession hs, Model model) {
		Member result = new Member();
		
		result = login(mem);
		
		if(result==null) {
			return "fail"; 
		}else {
			String id = result.getId();
			if(result.getMembertype().equals("셀러")) {
				Seller seller = memberDAO.sessionSeller(id);
				Product product = memberDAO.sessionProduct(id);
				hs.setAttribute("sessionType", seller);
				hs.setAttribute("sessionProd", product);
				
			} else if(result.getMembertype().equals("공간제공자")) {
				Space space = memberDAO.sessionSpace(id);
				hs.setAttribute("sessionType", space);
			}
			ArrayList<Notice> listNewNotice = memberDAO.listNewNotice(id);
			ArrayList<Notice> listOldNotice = memberDAO.listOldNotice(id);
			ArrayList<String> listNewNickname = new ArrayList<String>();
			ArrayList<String> listOldNickname = new ArrayList<String>();
			for(int i=0;i<listNewNotice.size();i++) {
				String nickname = memberDAO.noticeNickname(listNewNotice.get(i).getId());
				listNewNickname.add(nickname);
			}
			for(int i=0;i<listOldNotice.size();i++) {
				String nickname = memberDAO.noticeNickname(listOldNotice.get(i).getId());
				listOldNickname.add(nickname);
			}
			hs.setAttribute("listNewNickname", listNewNickname);
			hs.setAttribute("listNewNotice", listNewNotice);
			hs.setAttribute("listOldNickname", listOldNickname);
			hs.setAttribute("listOldNotice", listOldNotice);
			hs.setAttribute("sessionMember", result);
			
			int cntNewNotice = memberDAO.countNewNotice(id);
			hs.setAttribute("cntNewNotice", cntNewNotice);
			
			return "success";
		}
	}
	
	@RequestMapping(value="/updateHome", method=RequestMethod.GET)
	public String updateHome(HttpSession hs) {
		Member mem = (Member) hs.getAttribute("sessionMember");
		String id = mem.getId();
		ArrayList<Notice> listNewNotice = memberDAO.listNewNotice(id);
		ArrayList<Notice> listOldNotice = memberDAO.listOldNotice(id);
		ArrayList<String> listNewNickname = new ArrayList<String>();
		ArrayList<String> listOldNickname = new ArrayList<String>();
		for(int i=0;i<listNewNotice.size();i++) {
			String nickname = memberDAO.noticeNickname(listNewNotice.get(i).getId());
			listNewNickname.add(nickname);
		}
		for(int i=0;i<listOldNotice.size();i++) {
			String nickname = memberDAO.noticeNickname(listOldNotice.get(i).getId());
			listOldNickname.add(nickname);
		}
		hs.setAttribute("listNewNickname", listNewNickname);
		hs.setAttribute("listNewNotice", listNewNotice);
		hs.setAttribute("listOldNickname", listOldNickname);
		hs.setAttribute("listOldNotice", listOldNotice);
		
		int cntNewNotice = memberDAO.countNewNotice(id);
		hs.setAttribute("cntNewNotice", cntNewNotice);
		
		return "redirect:/goHome";
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
	
	@RequestMapping(value="/checkId", method=RequestMethod.GET)
	public @ResponseBody String checkId(String id) {
		String result ="";
		
		try {
			result = memberDAO.checkId(id);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping(value="/checkPw", method=RequestMethod.GET)
	public @ResponseBody String checkPw() {
		return "success";
	}
	
	@RequestMapping(value="/findId", method=RequestMethod.GET)
	public @ResponseBody String findId(Member mem){
		String result="";
		
		try {
			result = memberDAO.findId(mem);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping(value="/findPw", method=RequestMethod.GET)
	public @ResponseBody String findPw(Member mem){
		String result="";
		
		try {
			result = memberDAO.findPw(mem);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession hs) {
		hs.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/insertExtraInfo", method=RequestMethod.POST)
	public String fileUpload(String id, String membertype, Product prod, Seller seller, Space space, HttpSession hs) {
		

		Member mem = (Member) hs.getAttribute("sessionMember");
		
			
		try {
			if(membertype.equals("space")) {
				try {
					memberDAO.insertSpace(space);
				}catch(Exception e) {
					e.printStackTrace();
					memberDAO.deleteMember(id);
					hs.invalidate();
				}
			} else {
					memberDAO.insertSeller(seller);
					try {
						Seller seller3 = memberDAO.sessionSeller(prod.getId());
						prod.setSellernum(seller3.getSellernum());
						memberDAO.insertProduct(prod);
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
		
		Member member = login(mem);
		if(member!=null) {
			hs.setAttribute("sessionMember", member);
		}
		String id2 = member.getId();
		if(member.getMembertype().equals("셀러")) {
			Seller seller2 = memberDAO.sessionSeller(id2);
			Product product2 = memberDAO.sessionProduct(id2);
			hs.setAttribute("sessionType", seller2);
			hs.setAttribute("sessionProd", product2);
			
		} else if(member.getMembertype().equals("공간제공자")) {
			Space space2 = memberDAO.sessionSpace(id2);
			hs.setAttribute("sessionType", space2);
		}
		
		return "signEnd";
	}
	
	@RequestMapping(value="/goAllConfirm", method=RequestMethod.GET)
	public @ResponseBody String goAllConfirm(String id) {
		memberDAO.goAllConfirm(id);
		return "success";
	}
	
	@RequestMapping(value="/updateConfirm", method=RequestMethod.GET)
	public @ResponseBody String updateConfirm(int noticenum) {
		memberDAO.updateConfirm(noticenum);
		return "success";
	}

	@RequestMapping(value="/deleteNotice", method=RequestMethod.GET)
	public String deleteNotice(int noticenum) {
		memberDAO.deleteNotice(noticenum);
		return "redirect:/goHome";
	}
}
