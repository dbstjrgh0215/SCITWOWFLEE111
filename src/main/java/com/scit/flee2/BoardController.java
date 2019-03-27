package com.scit.flee2;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.scit.flee2.dao.BoardDAO;
import com.scit.flee2.vo.Board;
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
				if(!f.exists()) { //������ ������ ����
				   f.mkdirs();
				}
				file.transferTo(f);	// ������ ������ �������� ���ε� ����Ǵ� �̸��� (+fileName)���� ����
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
	
	@RequestMapping(value="/goUserBoard", method=RequestMethod.GET)
	public String goUserBoard(Model model, HttpSession hs) {
		Member mem = (Member) hs.getAttribute("sessionMember");
		ArrayList<Proposal> list = boardDAO.listProposal(mem);
		ArrayList<Board> result = boardDAO.listUserBoard(mem);
		model.addAttribute("listProposal", list);
		model.addAttribute("listUserBoard", result);
		
		return "userBoard";
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
	
	@RequestMapping(value="/selectProposal", method=RequestMethod.GET)
	public String selectProposal(int proposalnum, Model model){
		Proposal result = goProposal2(proposalnum);
		
		model.addAttribute("selectProposal", result);
		
		return "selectProposal";
	}
	
	@RequestMapping(value="/goBoardWrite", method=RequestMethod.POST)
	public String goBoardWrite(int proposalnum, Model model) {
		Proposal result = goProposal2(proposalnum);
		
		model.addAttribute("selectProposal", result);
		return "boardWrite";
	}
	
	@RequestMapping(value="/keyword", method=RequestMethod.GET)
	public String keyword(String membertype) {
		
		return "keyword";
	}
	
	@RequestMapping(value="/goBoardSeller", method=RequestMethod.GET)
	public String goBoardSeller(Model model) { 
		ArrayList<Board> list = boardDAO.listRecommendSeller();
		ArrayList<Board> seller = boardDAO.listBoard("����");
		ArrayList<HashMap<String,String>> recommendList = new ArrayList<HashMap<String,String>>();
		ArrayList<HashMap<String,String>> sellerList = new ArrayList<HashMap<String,String>>();
		
		for(int i=0; i<list.size(); i++) {		// keyword �ڸ��� ����
			HashMap<String,String> recommendMap = new HashMap<String,String>();
			String keyword = list.get(i).getKeyword();
			for(int j=0; j<5; j++) {
				int cnt = 0;
				keyword = keyword.substring(cnt+1);
				cnt = keyword.indexOf("&");
				if(cnt==-1) {
					break;
				}
				recommendMap.put("keyword"+(j+1), keyword.substring(0, cnt));
				keyword = keyword.substring(cnt);
			}
			
			String image = list.get(i).getImage();
			for(int j=0; j<3; j++) {		// image �ڸ��� ����
				int cnt = 0;
				cnt = image.indexOf("&");
				if(cnt==-1) {
					recommendMap.put("image"+(j+1), image);
					break;
				}
				recommendMap.put("image"+(j+1), image.substring(0, cnt));
				image = image.substring(cnt+1);
			}
			recommendMap.put("recommendNum","rs"+Integer.toString(i+1));
			recommendMap.put("id",list.get(i).getId());
			recommendMap.put("title",list.get(i).getTitle());
			recommendList.add(recommendMap);
		}
		
		for(int i=0; i<seller.size(); i++) {		// keyword �ڸ��� ����
			HashMap<String,String> sellerMap = new HashMap<String,String>();
			String keyword = seller.get(i).getKeyword();
			for(int j=0; j<5; j++) {
				int cnt = 0;
				keyword = keyword.substring(cnt+1);
				cnt = keyword.indexOf("&");
				if(cnt==-1) {
					break;
				}
				sellerMap.put("keyword"+(j+1), keyword.substring(0, cnt));
				keyword = keyword.substring(cnt);
			}
			
			String image = seller.get(i).getImage();
			for(int j=0; j<3; j++) {		// image �ڸ��� ����
				int cnt = 0;
				cnt = image.indexOf("&");
				if(cnt==-1) {
					sellerMap.put("image"+(j+1), image);
					break;
				}
				sellerMap.put("image"+(j+1), image.substring(0, cnt));
				image = image.substring(cnt+1);
			}
			sellerMap.put("sellerNum","s"+Integer.toString(i+1));
			sellerMap.put("id",seller.get(i).getId());
			sellerMap.put("title",seller.get(i).getTitle());
			sellerList.add(sellerMap);
		}
		
		
		model.addAttribute("recommendList", recommendList);
		model.addAttribute("sellerList", sellerList);
		return "boardSeller"; 
	}
	
	@RequestMapping(value="/goBoardSpace", method=RequestMethod.GET)
	public String goBoardSpace() { 
		return "boardSpace"; 
	}
	
	@RequestMapping(value="/goBoardProduct", method=RequestMethod.GET)
	public String goBoardProduct() { 
		return "boardProduct"; 
	}
	
	@RequestMapping(value="/insertBoard", method=RequestMethod.POST)
	public String insertBoard(Board board, MultipartFile uploadFile, MultipartHttpServletRequest request, HttpSession hs) {

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
				fileName = mem.getId()+"_board_"+board.getTitle()+"_image"+index+originalFileName.substring(originalFileName.indexOf("."));
				File f = new File(UPLOADPATH+mem.getId()+"\\"+fileName);
				if(!f.exists()) { //������ ������ ����
				   f.mkdirs();
				}
				file.transferTo(f);	// ������ ������ �������� ���ε� ����Ǵ� �̸��� (+fileName)���� ����
				files=files+"&"+fileName;
			}
			if(files.indexOf("&")==0) {
				files = files.substring(1);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		board.setImage(files);
		
		boardDAO.insertBoard(board);
		
		return "redirect:/goUserBoard";
	}
}
