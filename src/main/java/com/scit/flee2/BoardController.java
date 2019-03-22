package com.scit.flee2;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.scit.flee2.dao.BoardDAO;
import com.scit.flee2.vo.Member;
import com.scit.flee2.vo.Proposal;

@Controller
public class BoardController {
	
	private static final String UPLOADPATH="C:\\Users\\kita\\Documents\\workspace-sts-3.9.6.RELEASE\\WowFlee2\\src\\main\\webapp\\resources\\images\\userImage\\";

	@Autowired
	BoardDAO boardDAO;
	
	@RequestMapping(value="/insertProposal", method=RequestMethod.POST)
	public String insertProposal(Proposal prop, MultipartFile uploadFile, MultipartHttpServletRequest request, HttpSession hs) {
		
		String fileName, originalFileName;
		
		List<MultipartFile> fileList = request.getFiles("uploadFile");
		String files = "";
		
		Member mem = (Member) hs.getAttribute("sessionMember");
		
		try {
			Iterator<MultipartFile> it = fileList.iterator();
			int index = 0;
			while (it.hasNext()) {
				index++;
				MultipartFile file = (MultipartFile) it.next();
				originalFileName = file.getOriginalFilename();
				fileName = mem.getId()+"_prop_"+prop.getTitle()+"_image"+index+originalFileName.substring(originalFileName.indexOf("."));
				File f = new File(UPLOADPATH+mem.getId()+"\\"+fileName);
				if(!f.exists()) { //폴더가 없으면 생성
				   f.mkdirs();
				}
				file.transferTo(f);	// 파일의 내용을 가져오고 업로드 저장되는 이름은 (+fileName)으로 저장
				files=files+"&"+fileName;
			}
			if(files.indexOf("&")==0) {
				files = files.substring(1);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		prop.setImage(files);
		boardDAO.insertProposal(prop);
		
		return "redirect:/goProposal";
	}
	
	@RequestMapping(value="/goProposal", method=RequestMethod.GET)
	public String goProposal(Model model, HttpSession hs) {
		Member mem = (Member) hs.getAttribute("sessionMember");
		ArrayList<Proposal> list = boardDAO.listProposal(mem);
		model.addAttribute("listProposal", list);
		
		return "proposal";
	}
	
	@RequestMapping(value="/goProposal2", method=RequestMethod.GET)
	public @ResponseBody Proposal goProposal2(int clickNo){
		Proposal result = new Proposal();
		
		result = boardDAO.selectProposal(clickNo);
		
		return result;
	}
	
	@RequestMapping(value="/goUpdateProposal", method=RequestMethod.GET)
	public String goUpdateProposal(int clickNo, Model model, HttpServletResponse response, HttpSession hs){
		Proposal result = new Proposal();
		ArrayList<String> fileList = new ArrayList<String>();
		
		result = boardDAO.selectProposal(clickNo);
		model.addAttribute("udtProposal", result);
		Member mem = (Member) hs.getAttribute("sessionMember");
		
		for(int index=1; index<4; index++) {
			String fileName = mem.getId()+"_prop_"+result.getTitle()+"_image"+index+".jpg";
			String path = "resources/images/userImage/"+mem.getId()+"/"+fileName;
			fileList.add(path);
		}
		model.addAttribute("fileList", fileList);
		
		return "proposalWrite";
	}
	
	@RequestMapping(value="/delProposal", method=RequestMethod.GET)
	public @ResponseBody int delProposal(int clickNo){
		int result = 0;
		
		result = boardDAO.deleteProposal(clickNo);
		
		return result;
	}
	
	@RequestMapping(value="/goProposalDetail", method=RequestMethod.GET)
	public String goProposalDetail(int clickNo, Model model, HttpSession hs){
		
		Proposal result = new Proposal();
		ArrayList<String> fileList = new ArrayList<String>();
		
		result = boardDAO.selectProposal(clickNo);
		model.addAttribute("udtProposal", result);
		Member mem = (Member) hs.getAttribute("sessionMember");
		
		for(int index=1; index<4; index++) {
			String fileName = mem.getId()+"_prop_"+result.getTitle()+"_image"+index+".jpg";
			String path = "resources/images/userImage/"+mem.getId()+"/"+fileName;
			fileList.add(path);
		}
		model.addAttribute("fileList", fileList);
		return "proposalDetail";
	}
	
	@RequestMapping(value="/keyword", method=RequestMethod.GET)
	public String keyword(String membertype) {
		
		return "keyword";
	}
}
