package com.scit.flee2;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;
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
import com.scit.flee2.vo.Product;
import com.scit.flee2.vo.Proposal;
import com.scit.flee2.vo.Qna;
import com.scit.flee2.vo.Seller;
import com.scit.flee2.vo.Space;

@Controller
public class BoardController {
	
	private static final String UPLOADPATH="C:\\Users\\kita\\Documents\\workspace-sts-3.9.6.RELEASE\\WowFlee2\\src\\main\\webapp\\resources\\images\\userImage\\";

	@Autowired
	BoardDAO boardDAO;
	
	@RequestMapping(value="/goProposalWrite", method=RequestMethod.GET)
	public String goProposalWrite(Model model, HttpSession hs) {
		ArrayList<HashMap<String,String>> contentDetail = new ArrayList<HashMap<String,String>>();
		HashMap<String,String> map = new HashMap<String,String>();
		Member mem = (Member)hs.getAttribute("sessionMember");
		
		if(mem.getMembertype().equals("셀러")) {
			Seller seller = (Seller)hs.getAttribute("sessionType");
			Product product = (Product)hs.getAttribute("sessionProd");
			String keyword = product.getKeyword();
			if(keyword!=null) {
				for(int j=0; j<5; j++) {
					int cnt = 0;
					keyword = keyword.substring(cnt+1);
					cnt = keyword.indexOf("&");
					if(cnt==-1) {
						map.put("keyword"+(j+1), keyword);
						break;
					}
					map.put("keyword"+(j+1), keyword.substring(0, cnt));
					keyword = keyword.substring(cnt);
				}
			}
			String type = product.getProd_type();
			if(type!=null) {
				for(int j=0; j<5; j++) {
					int cnt = 0;
					type = type.substring(cnt+1);
					cnt = type.indexOf("&");
					if(cnt==-1) {
						map.put("type"+(j+1), type);
						break;
					}
					map.put("type"+(j+1), type.substring(0, cnt));
					type = type.substring(cnt);
				}
			}
		} else {
			Space space = (Space)hs.getAttribute("sessionType");
			String keyword = space.getKeyword();
			if(keyword!=null) {
				for(int j=0; j<5; j++) {
					int cnt = 0;
					keyword = keyword.substring(cnt+1);
					cnt = keyword.indexOf("&");
					if(cnt==-1) {
						map.put("keyword"+(j+1), keyword);
						break;
					}
					map.put("keyword"+(j+1), keyword.substring(0, cnt));
					keyword = keyword.substring(cnt);
				}
			}
			String type = space.getSpace_type();
			if(type!=null) {
				for(int j=0; j<5; j++) {
					int cnt = 0;
					type = type.substring(cnt+1);
					cnt = type.indexOf("&");
					if(cnt==-1) {
						map.put("type"+(j+1), type);
						break;
					}
					map.put("type"+(j+1), type.substring(0, cnt));
					type = type.substring(cnt);
				}
			}
		}
		
		
		contentDetail.add(map);
		
		model.addAttribute("contentDetail", contentDetail);
		
		return "proposalWrite";
	}
	
	@RequestMapping(value="/checkTitle", method=RequestMethod.GET)
	public @ResponseBody String checkTitle(HttpSession hs, Proposal prop) {
		Member mem = (Member) hs.getAttribute("sessionMember");
		ArrayList<Proposal> list = boardDAO.listProposal(mem);
		for(int i=0; i<list.size(); i++) {
			String title = list.get(i).getTitle();
			if(title.equals(prop.getTitle())) {
				return "fail";
			}
		}
		return "success";
	}
	
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
				if(originalFileName.equals("")) {
					break;
				}
				fileName = mem.getId()+"_prop_"+prop.getTitle()+"_image"+index+originalFileName.substring(originalFileName.indexOf("."));
				File f = new File(UPLOADPATH+mem.getId()+"\\prop\\"+prop.getTitle()+"\\"+fileName);
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
	
	@RequestMapping(value="/updateProposal", method=RequestMethod.POST)
	public String updateProposal(Proposal prop, String clickNo, MultipartFile uploadFile, MultipartHttpServletRequest request, HttpSession hs) {
		
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
				if(originalFileName.equals("")) {
					fileDelete(mem.getId(), prop.getTitle(), "prop");
					break;
				}
				fileName = mem.getId()+"_prop_"+prop.getTitle()+"_image"+index+originalFileName.substring(originalFileName.indexOf("."));
				File f = new File(UPLOADPATH+mem.getId()+"\\prop\\"+prop.getTitle()+"\\"+fileName);
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
		
		if(files.equals("")) {
			Proposal prop2 = boardDAO.selectProposal(Integer.parseInt(clickNo));
			prop.setImage(prop2.getImage());
		} else {
			prop.setImage(files);
		}
		prop.setProposalnum(Integer.parseInt(clickNo));
		boardDAO.updateProposal(prop);
		
		return "redirect:/goProposal";
	}
	
	public void fileDelete(String id, String title, String type) {
		File file = new File(UPLOADPATH+id+"\\"+type+"\\"+title);
		if( file.exists() ){ //파일존재여부확인
            
            if(file.isDirectory()){ //파일이 디렉토리인지 확인
                 
                File[] files = file.listFiles();
                 
                for( int i=0; i<files.length; i++){
                    if( files[i].delete() ){
                        System.out.println(files[i].getName()+" 삭제성공");
                    }else{
                        System.out.println(files[i].getName()+" 삭제실패");
                    }
                }
                 
            }
            if(file.delete()){
                System.out.println("파일삭제 성공");
            }else{
                System.out.println("파일삭제 실패");
            }
             
        }else{
            System.out.println("파일이 존재하지 않습니다.");
        }

	}
	
	public void fileCopy(String inFileName, String outFileName, String outPath) {
		try {
			File f = new File(outPath);
			if(!f.exists()) { //폴더가 없으면 생성
				f.mkdirs();
			}
			
		   FileInputStream fis = new FileInputStream(inFileName);
		   FileOutputStream fos = new FileOutputStream(outFileName);
		   

		   int data = 0;
		   while((data=fis.read())!=-1) {
		    fos.write(data);
		   }
		   fis.close();
		   fos.close();
		   
		  } catch (IOException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  }

	}
	
	//파일을 존재여부를 확인하는 메소드
	 public static Boolean fileIsLive(String isLivefile) {
	  File f1 = new File(isLivefile);
	  
	  if(f1.exists())
	  {
	   return true;
	  }else
	  {
		  f1.mkdirs();
	   return false;
	  }
	 }
	 
	 //파일을 생성하는 메소드
	 public static void fileMake(String makeFileName) {
	  File f1 = new File(makeFileName);
	  try {
	   f1.createNewFile();
	  } catch (IOException e) {
	   // TODO Auto-generated catch block
	   e.printStackTrace();
	  }
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
		ArrayList<HashMap<String,String>> contentDetail = new ArrayList<HashMap<String,String>>();
		HashMap<String,String> map = new HashMap<String,String>();
		
		result = boardDAO.selectProposal(clickNo);
		model.addAttribute("udtProposal", result);
		model.addAttribute("clickNo", clickNo);
		Member mem = (Member) hs.getAttribute("sessionMember");
		
		String keyword = result.getKeyword();
		if(keyword!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				keyword = keyword.substring(cnt+1);
				cnt = keyword.indexOf("&");
				if(cnt==-1) {
					map.put("keyword"+(j+1), keyword);
					break;
				}
				map.put("keyword"+(j+1), keyword.substring(0, cnt));
				keyword = keyword.substring(cnt);
			}
		}
		String type = result.getType();
		if(type!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				type = type.substring(cnt+1);
				cnt = type.indexOf("&");
				if(cnt==-1) {
					map.put("type"+(j+1), type);
					break;
				}
				map.put("type"+(j+1), type.substring(0, cnt));
				type = type.substring(cnt);
			}
		}
		String image = result.getImage();
		for(int j=0; j<3; j++) {		// image 자르는 구문
			int cnt = 0;
			cnt = image.indexOf("&");
			if(cnt==-1) {
				map.put("image"+(j+1), image);
				break;
			}
			map.put("image"+(j+1), image.substring(0, cnt));
			image = image.substring(cnt+1);
		}
		String offday = result.getOffday();
		if(offday!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				offday = offday.substring(cnt+1);
				cnt = offday.indexOf("&");
				if(cnt==-1) {
					map.put("offday"+(j+1), offday);
					break;
				}
				map.put("offday"+(j+1), offday.substring(0, cnt));
				offday = offday.substring(cnt);
			}
		}
		String contractPeriod = result.getContractperiod();
		if(contractPeriod!=null) {
			for(int j=0; j<7; j++) {
				int cnt = 0;
				contractPeriod = contractPeriod.substring(cnt+1);
				cnt = contractPeriod.indexOf("&");
				if(cnt==-1) {
					map.put("contractPeriod"+(j+1), contractPeriod);
					break;
				}
				map.put("contractPeriod"+(j+1), contractPeriod.substring(0, cnt));
				contractPeriod = contractPeriod.substring(cnt);
			}
		}
		
		contentDetail.add(map);
		model.addAttribute("contentDetail", contentDetail);
		
		return "proposalWrite";
	}
	
	@RequestMapping(value="/delProposal", method=RequestMethod.GET)
	public @ResponseBody int delProposal(int clickNo){
		int result = 0;
		Proposal prop = boardDAO.selectProposal(clickNo);
		result = boardDAO.deleteProposal(clickNo);
		fileDelete(prop.getId(),prop.getTitle(),"prop");
		return result;
	}
	
	@RequestMapping(value="/goProposalDetail", method=RequestMethod.GET)
	public String goProposalDetail(int clickNo, Model model, HttpSession hs){
		
		Proposal result = new Proposal();
		ArrayList<HashMap<String,String>> contentDetail = new ArrayList<HashMap<String,String>>();
		HashMap<String,String> map = new HashMap<String,String>();
		
		result = boardDAO.selectProposal(clickNo);
		model.addAttribute("udtProposal", result);
		Member mem = (Member) hs.getAttribute("sessionMember");
		
		String keyword = result.getKeyword();
		if(keyword!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				keyword = keyword.substring(cnt+1);
				cnt = keyword.indexOf("&");
				if(cnt==-1) {
					map.put("keyword"+(j+1), keyword);
					break;
				}
				map.put("keyword"+(j+1), keyword.substring(0, cnt));
				keyword = keyword.substring(cnt);
			}
		}
		String type = result.getType();
		if(type!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				type = type.substring(cnt+1);
				cnt = type.indexOf("&");
				if(cnt==-1) {
					map.put("type"+(j+1), type);
					break;
				}
				map.put("type"+(j+1), type.substring(0, cnt));
				type = type.substring(cnt);
			}
		}
		String image = result.getImage();
		for(int j=0; j<3; j++) {		// image 자르는 구문
			int cnt = 0;
			cnt = image.indexOf("&");
			if(cnt==-1) {
				map.put("image"+(j+1), image);
				break;
			}
			map.put("image"+(j+1), image.substring(0, cnt));
			image = image.substring(cnt+1);
		}
		String optime = result.getOptime();
		if(optime!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				optime = optime.substring(cnt+1);
				cnt = optime.indexOf("&");
				if(cnt==-1) {
					map.put("optime"+(j+1), optime);
					break;
				}
				map.put("optime"+(j+1), optime.substring(0, cnt));
				optime = optime.substring(cnt);
			}
		}
		String offday = result.getOffday();
		if(offday!=null) {
			for(int j=0; j<7; j++) {
				int cnt = 0;
				offday = offday.substring(cnt+1);
				cnt = offday.indexOf("&");
				if(cnt==-1) {
					map.put("offday"+(j+1), offday);
					break;
				}
				map.put("offday"+(j+1), offday.substring(0, cnt));
				offday = offday.substring(cnt);
			}
		}
		String contractPeriod = result.getContractperiod();
		if(contractPeriod!=null) {
			for(int j=0; j<7; j++) {
				int cnt = 0;
				contractPeriod = contractPeriod.substring(cnt+1);
				cnt = contractPeriod.indexOf("&");
				if(cnt==-1) {
					map.put("contractPeriod"+(j+1), contractPeriod);
					break;
				}
				map.put("contractPeriod"+(j+1), contractPeriod.substring(0, cnt));
				contractPeriod = contractPeriod.substring(cnt);
			}
		}
		
		contentDetail.add(map);
		model.addAttribute("contentDetail", contentDetail);
		
		return "proposalDetail";
	}
	
	@RequestMapping(value="/selectProposal", method=RequestMethod.GET)
	public String selectProposal(int proposalnum, Model model){
		Proposal result = goProposal2(proposalnum);
		
		model.addAttribute("selectProposal", result);
		
		return "selectProposal";
	}
	
	@RequestMapping(value="/goBoardWrite", method=RequestMethod.GET)
	public String goBoardWrite(int proposalnum, Model model) {
		Proposal result = goProposal2(proposalnum);
		ArrayList<HashMap<String,String>> contentDetail = new ArrayList<HashMap<String,String>>();
		HashMap<String,String> map = new HashMap<String,String>();
		
		String keyword = result.getKeyword();
		if(keyword!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				keyword = keyword.substring(cnt+1);
				cnt = keyword.indexOf("&");
				if(cnt==-1) {
					map.put("keyword"+(j+1), keyword);
					break;
				}
				map.put("keyword"+(j+1), keyword.substring(0, cnt));
				keyword = keyword.substring(cnt);
			}
		}
		String type = result.getType();
		if(type!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				type = type.substring(cnt+1);
				cnt = type.indexOf("&");
				if(cnt==-1) {
					map.put("type"+(j+1), type);
					break;
				}
				map.put("type"+(j+1), type.substring(0, cnt));
				type = type.substring(cnt);
			}
		}
		String image = result.getImage();
		for(int j=0; j<3; j++) {		// image 자르는 구문
			int cnt = 0;
			cnt = image.indexOf("&");
			if(cnt==-1) {
				map.put("image"+(j+1), image);
				break;
			}
			map.put("image"+(j+1), image.substring(0, cnt));
			image = image.substring(cnt+1);
		}
		String optime = result.getOptime();
		if(optime!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				optime = optime.substring(cnt+1);
				cnt = optime.indexOf("&");
				if(cnt==-1) {
					map.put("optime"+(j+1), optime);
					break;
				}
				map.put("optime"+(j+1), optime.substring(0, cnt));
				optime = optime.substring(cnt);
			}
		}
		String contractPeriod = result.getContractperiod();
		if(contractPeriod!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				contractPeriod = contractPeriod.substring(cnt+1);
				cnt = contractPeriod.indexOf("&");
				if(cnt==-1) {
					map.put("contractPeriod"+(j+1), contractPeriod);
					break;
				}
				map.put("contractPeriod"+(j+1), contractPeriod.substring(0, cnt));
				contractPeriod = contractPeriod.substring(cnt);
			}
		}
		
		
		contentDetail.add(map);
		model.addAttribute("contentDetail", contentDetail);
		model.addAttribute("selectProposal", result);
		return "boardWrite";
	}
	
	@RequestMapping(value="/goBoardWrite2", method=RequestMethod.GET)
	public @ResponseBody Board goBoardWrite2(int clickNo){
		Board result = new Board();
		
		result = boardDAO.selectBoard(clickNo);
		
		return result;
	}
	
	@RequestMapping(value="/goUpdateBoard", method=RequestMethod.GET)
	public String goBoardUpdate(int clickNo, Model model) {
		Board result = goBoardWrite2(clickNo);
		ArrayList<HashMap<String,String>> contentDetail = new ArrayList<HashMap<String,String>>();
		HashMap<String,String> map = new HashMap<String,String>();
		
		String keyword = result.getKeyword();
		if(keyword!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				keyword = keyword.substring(cnt+1);
				cnt = keyword.indexOf("&");
				if(cnt==-1) {
					map.put("keyword"+(j+1), keyword);
					break;
				}
				map.put("keyword"+(j+1), keyword.substring(0, cnt));
				keyword = keyword.substring(cnt);
			}
		}
		String type = result.getType();
		if(type!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				type = type.substring(cnt+1);
				cnt = type.indexOf("&");
				if(cnt==-1) {
					map.put("type"+(j+1), type);
					break;
				}
				map.put("type"+(j+1), type.substring(0, cnt));
				type = type.substring(cnt);
			}
		}
		String image = result.getImage();
		for(int j=0; j<3; j++) {		// image 자르는 구문
			int cnt = 0;
			cnt = image.indexOf("&");
			if(cnt==-1) {
				map.put("image"+(j+1), image);
				break;
			}
			map.put("image"+(j+1), image.substring(0, cnt));
			image = image.substring(cnt+1);
		}
		String optime = result.getOptime();
		if(optime!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				optime = optime.substring(cnt+1);
				cnt = optime.indexOf("&");
				if(cnt==-1) {
					map.put("optime"+(j+1), optime);
					break;
				}
				map.put("optime"+(j+1), optime.substring(0, cnt));
				optime = optime.substring(cnt);
			}
		}
		String contractPeriod = result.getContractperiod();
		if(contractPeriod!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				contractPeriod = contractPeriod.substring(cnt+1);
				cnt = contractPeriod.indexOf("&");
				if(cnt==-1) {
					map.put("contractPeriod"+(j+1), contractPeriod);
					break;
				}
				map.put("contractPeriod"+(j+1), contractPeriod.substring(0, cnt));
				contractPeriod = contractPeriod.substring(cnt);
			}
		}
		String offday = result.getOffday();
		if(offday!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				offday = offday.substring(cnt+1);
				cnt = offday.indexOf("&");
				if(cnt==-1) {
					map.put("offday"+(j+1), offday);
					break;
				}
				map.put("offday"+(j+1), offday.substring(0, cnt));
				offday = offday.substring(cnt);
			}
		}
		
		contentDetail.add(map);
		model.addAttribute("contentDetail", contentDetail);
		model.addAttribute("selectBoard", result);
		return "boardWrite";
	}
	
	@RequestMapping(value="/updateBoard", method=RequestMethod.POST)
	public String updateBoard(Board board, String clickNo, MultipartFile uploadFile, MultipartHttpServletRequest request, HttpSession hs) {
		
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
				if(originalFileName.equals("")) {
					fileDelete(mem.getId(), board.getTitle(), "board");
					break;
				}
				fileName = mem.getId()+"_board_"+board.getTitle()+"_image"+index+originalFileName.substring(originalFileName.indexOf("."));
				File f = new File(UPLOADPATH+mem.getId()+"\\board\\"+board.getTitle()+"\\"+fileName);
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
		
		if(files.equals("")) {
			Board board2 = boardDAO.selectBoard(Integer.parseInt(clickNo));
			board.setImage(board2.getImage());
		} else {
			board.setImage(files);
		}
		board.setBoardnum(Integer.parseInt(clickNo));
		boardDAO.updateBoard(board);
		
		return "redirect:/goUserBoard";
	}
	
	
	@RequestMapping(value="/delBoard", method=RequestMethod.GET)
	public @ResponseBody int delBoard(int clickNo){
		int result = 0;
		Board board = boardDAO.selectBoard(clickNo);
		result = boardDAO.deleteBoard(clickNo);
		/*fileDelete(board.getId(),board.getTitle());*/
		
		return result;
	}
	
	@RequestMapping(value="/keyword", method=RequestMethod.GET)
	public String keyword(String membertype) {
		
		return "keyword";
	}
	
	@RequestMapping(value="/goBoardSeller", method=RequestMethod.GET)
	public String goBoardSeller(Model model) { 
		ArrayList<Board> list = boardDAO.listRecommend("셀러");
		ArrayList<Board> seller = boardDAO.listBoard("셀러");
		ArrayList<HashMap<String,String>> recommendSellerList = new ArrayList<HashMap<String,String>>();
		ArrayList<HashMap<String,String>> sellerList = new ArrayList<HashMap<String,String>>();
		
		for(int i=0; i<list.size(); i++) {		// keyword 자르는 구문
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
			for(int j=0; j<3; j++) {		// image 자르는 구문
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
			recommendMap.put("boardnum",Integer.toString(list.get(i).getBoardnum()));
			recommendSellerList.add(recommendMap);
		}
		
		for(int i=0; i<seller.size(); i++) {		// keyword 자르는 구문
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
			for(int j=0; j<3; j++) {		// image 자르는 구문
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
			sellerMap.put("boardnum", Integer.toString(seller.get(i).getBoardnum()));
			sellerList.add(sellerMap);
		}
		
		
		model.addAttribute("recommendSellerList", recommendSellerList);
		model.addAttribute("sellerList", sellerList);
		return "boardSeller"; 
	}
	
	@RequestMapping(value="/goBoardSpace", method=RequestMethod.GET)
	public String goBoardSpace(Model model) {
		ArrayList<Board> list = boardDAO.listRecommend("공간제공자");
		ArrayList<Board> space = boardDAO.listBoard("공간제공자");
		ArrayList<HashMap<String,String>> recommendSpaceList = new ArrayList<HashMap<String,String>>();
		ArrayList<HashMap<String,String>> spaceList = new ArrayList<HashMap<String,String>>();
		
		for(int i=0; i<list.size(); i++) {		// keyword 자르는 구문
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
			for(int j=0; j<3; j++) {		// image 자르는 구문
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
			recommendMap.put("boardnum",Integer.toString(list.get(i).getBoardnum()));
			recommendSpaceList.add(recommendMap);
		}
		
		for(int i=0; i<space.size(); i++) {		// keyword 자르는 구문
			HashMap<String,String> spaceMap = new HashMap<String,String>();
			String keyword = space.get(i).getKeyword();
			for(int j=0; j<5; j++) {
				int cnt = 0;
				keyword = keyword.substring(cnt+1);
				cnt = keyword.indexOf("&");
				if(cnt==-1) {
					break;
				}
				spaceMap.put("keyword"+(j+1), keyword.substring(0, cnt));
				keyword = keyword.substring(cnt);
			}
			
			String image = space.get(i).getImage();
			for(int j=0; j<3; j++) {		// image 자르는 구문
				int cnt = 0;
				cnt = image.indexOf("&");
				if(cnt==-1) {
					spaceMap.put("image"+(j+1), image);
					break;
				}
				spaceMap.put("image"+(j+1), image.substring(0, cnt));
				image = image.substring(cnt+1);
			}
			spaceMap.put("spaceNum","s"+Integer.toString(i+1));
			spaceMap.put("id",space.get(i).getId());
			spaceMap.put("title",space.get(i).getTitle());
			spaceMap.put("boardnum", Integer.toString(space.get(i).getBoardnum()));
			spaceList.add(spaceMap);
		}
		
		
		model.addAttribute("recommendSpaceList", recommendSpaceList);
		model.addAttribute("spaceList", spaceList);
		
		return "boardSpace"; 
	}
	
	@RequestMapping(value="/goBoardProduct", method=RequestMethod.GET)
	public String goBoardProduct() { 
		return "boardProduct"; 
	}
	
	@RequestMapping(value="/insertBoard", method=RequestMethod.POST)
	public String insertBoard(Board board, String proposalnum, MultipartFile uploadFile, MultipartHttpServletRequest request, HttpSession hs) {

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
				if(originalFileName.equals("")) {
					break;
				}
				fileName = mem.getId()+"_board_"+board.getTitle()+"_image"+index+originalFileName.substring(originalFileName.indexOf("."));
				File f = new File(UPLOADPATH+mem.getId()+"\\board\\"+board.getTitle()+"\\"+fileName);
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
		if(files.equals("")) {
			Proposal prop2 = boardDAO.selectProposal(Integer.parseInt(proposalnum));
			String origin = prop2.getImage();
			String changeDB = origin.replace("_prop_","_board_");
			board.setImage(changeDB);
			String path1 = UPLOADPATH+mem.getId()+"\\prop\\"+board.getTitle()+"\\";
			String path2 = UPLOADPATH+mem.getId()+"\\board\\"+board.getTitle()+"\\";
			
			HashMap<String,String> map = new HashMap<String,String>();
			String image = prop2.getImage();
			if(image!=null) {
				for(int j=0; j<3; j++) {		// image 자르는 구문
					int cnt = 0;
					cnt = image.indexOf("&");
					if(cnt==-1) {
						map.put("image"+(j+1), image);
						break;
					}
					map.put("image"+(j+1), image.substring(0, cnt));
					image = image.substring(cnt+1);
				}
			}
			String change = board.getImage();
			if(change!=null) {
				for(int j=0; j<3; j++) {		// image 자르는 구문
					int cnt = 0;
					cnt = change.indexOf("&");
					if(cnt==-1) {
						map.put("change"+(j+1), change);
						break;
					}
					map.put("change"+(j+1), change.substring(0, cnt));
					change = change.substring(cnt+1);
				}
			}
			fileCopy(path1+map.get("image1"), path2+map.get("change1"), path2);
			fileCopy(path1+map.get("image2"), path2+map.get("change2"), path2);
			fileCopy(path1+map.get("image3"), path2+map.get("change3"), path2);
		} else {
			board.setImage(files);
		}
		
		boardDAO.insertBoard(board);
		
		return "redirect:/goUserBoard";
	}
	
	@RequestMapping(value="/goSellerDetail", method=RequestMethod.GET)
	public String goSellerDetail(int boardnum, Model model) {
		Board board = boardDAO.selectBoard(boardnum);
		ArrayList<HashMap<String,String>> boardDetail = new ArrayList<HashMap<String,String>>();
		
		HashMap<String,String> sellerMap = new HashMap<String,String>();
		
		String keyword = board.getKeyword();
		if(keyword!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				keyword = keyword.substring(cnt+1);
				cnt = keyword.indexOf("&");
				if(cnt==-1) {
					sellerMap.put("keyword"+(j+1), keyword);
					break;
				}
				sellerMap.put("keyword"+(j+1), keyword.substring(0, cnt));
				keyword = keyword.substring(cnt);
			}
		}
		String type = board.getType();
		if(type!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				type = type.substring(cnt+1);
				cnt = type.indexOf("&");
				if(cnt==-1) {
					sellerMap.put("type"+(j+1), type);
					break;
				}
				sellerMap.put("type"+(j+1), type.substring(0, cnt));
				type = type.substring(cnt);
			}
		}
		String image = board.getImage();
		if(image!=null) {
			for(int j=0; j<3; j++) {		// image 자르는 구문
				int cnt = 0;
				cnt = image.indexOf("&");
				if(cnt==-1) {
					sellerMap.put("image"+(j+1), image);
					break;
				}
				sellerMap.put("image"+(j+1), image.substring(0, cnt));
				image = image.substring(cnt+1);
			}
		}
		
		String contractPeriod = board.getContractperiod();
		if(contractPeriod!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				contractPeriod = contractPeriod.substring(cnt+1);
				cnt = contractPeriod.indexOf("&");
				if(cnt==-1) {
					sellerMap.put("contractPeriod"+(j+1), contractPeriod);
					break;
				}
				sellerMap.put("contractPeriod"+(j+1), contractPeriod.substring(0, cnt));
				contractPeriod = contractPeriod.substring(cnt);
			}
		}
		
		
		
		String offday = board.getOffday();
		if(offday!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				offday = offday.substring(cnt+1);
				cnt = offday.indexOf("&");
				if(cnt==-1) {
					sellerMap.put("offday"+(j+1), offday);
					break;
				}
				sellerMap.put("offday"+(j+1), offday.substring(0, cnt));
				offday = offday.substring(cnt);
			}
		}
		
		boardDetail.add(sellerMap);
		
		model.addAttribute("board",board);
		model.addAttribute("boardDetail", boardDetail);
		return "seller";
	}
	
	@RequestMapping(value="/goSpaceDetail", method=RequestMethod.GET)
	public String goSpaceDetail(int boardnum, Model model) {
		Board board = boardDAO.selectBoard(boardnum);
		ArrayList<HashMap<String,String>> boardDetail = new ArrayList<HashMap<String,String>>();
		
		HashMap<String,String> spaceMap = new HashMap<String,String>();
		
		String keyword = board.getKeyword();
		if(keyword!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				keyword = keyword.substring(cnt+1);
				cnt = keyword.indexOf("&");
				if(cnt==-1) {
					spaceMap.put("keyword"+(j+1), keyword);
					break;
				}
				spaceMap.put("keyword"+(j+1), keyword.substring(0, cnt));
				keyword = keyword.substring(cnt);
			}
		}
		String type = board.getType();
		if(type!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				type = type.substring(cnt+1);
				cnt = type.indexOf("&");
				if(cnt==-1) {
					spaceMap.put("type"+(j+1), type);
					break;
				}
				spaceMap.put("type"+(j+1), type.substring(0, cnt));
				type = type.substring(cnt);
			}
		}
		String image = board.getImage();
		if(image!=null) {
			for(int j=0; j<3; j++) {		// image 자르는 구문
				int cnt = 0;
				cnt = image.indexOf("&");
				if(cnt==-1) {
					spaceMap.put("image"+(j+1), image);
					break;
				}
				spaceMap.put("image"+(j+1), image.substring(0, cnt));
				image = image.substring(cnt+1);
			}
		}
		
		String contractPeriod = board.getContractperiod();
		if(contractPeriod!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				contractPeriod = contractPeriod.substring(cnt+1);
				cnt = contractPeriod.indexOf("&");
				if(cnt==-1) {
					spaceMap.put("contractPeriod"+(j+1), contractPeriod);
					break;
				}
				spaceMap.put("contractPeriod"+(j+1), contractPeriod.substring(0, cnt));
				contractPeriod = contractPeriod.substring(cnt);
			}
		}
		
		String optime = board.getOptime();
		if(optime!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				optime = optime.substring(cnt+1);
				cnt = optime.indexOf("&");
				if(cnt==-1) {
					spaceMap.put("optime"+(j+1), optime);
					break;
				}
				spaceMap.put("optime"+(j+1), optime.substring(0, cnt));
				optime = optime.substring(cnt);
			}
		}
		
		String offday = board.getOffday();
		if(offday!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				offday = offday.substring(cnt+1);
				cnt = offday.indexOf("&");
				if(cnt==-1) {
					spaceMap.put("offday"+(j+1), offday);
					break;
				}
				spaceMap.put("offday"+(j+1), offday.substring(0, cnt));
				offday = offday.substring(cnt);
			}
		}
		
		boardDetail.add(spaceMap);
		
		model.addAttribute("board",board);
		model.addAttribute("boardDetail", boardDetail);
		
		return "space";
	}
	
	@RequestMapping(value="/contractSelect", method=RequestMethod.GET, produces="application/text;charset=utf8")
	public @ResponseBody String contractSelect(String type) {
		String result = "";
		
		if(type.equals("online")) {
			result="온라인 신청";
		} else if(type.equals("offline")) {
			result="오프라인 신청";
		}
		
		return result;
	}
	
	@RequestMapping(value="/goProductDetail", method=RequestMethod.GET)
	public String goProductDetail(int boardnum) {
		
		return "product";
	}
	
	@RequestMapping(value="/insertQna", method=RequestMethod.GET)
	public String insertQna(Qna qna, String membertype) {
		String redirect = "";
		boardDAO.insertQna(qna);
		if(membertype=="셀러") {
			redirect = "goSellerDetail?boardnum="+qna.getBoardnum();
		} else {
			redirect = "goSpaceDetail?boardnum="+qna.getBoardnum();
		}
		
		return redirect;
	}
	
	@RequestMapping(value="/goSearch", method=RequestMethod.GET)
	public String goSearch(String text, Model model) {
		ArrayList<Board> search = new ArrayList<Board>();
		search = boardDAO.searchBoard(text);
		
		ArrayList<HashMap<String,String>> searchList = new ArrayList<HashMap<String,String>>();
		
		for(int i=0; i<search.size(); i++) {		// keyword 자르는 구문
			HashMap<String,String> searchMap = new HashMap<String,String>();
			String keyword = search.get(i).getKeyword();
			for(int j=0; j<5; j++) {
				int cnt = 0;
				keyword = keyword.substring(cnt+1);
				cnt = keyword.indexOf("&");
				if(cnt==-1) {
					break;
				}
				searchMap.put("keyword"+(j+1), keyword.substring(0, cnt));
				keyword = keyword.substring(cnt);
			}
			
			String image = search.get(i).getImage();
			for(int j=0; j<3; j++) {		// image 자르는 구문
				int cnt = 0;
				cnt = image.indexOf("&");
				if(cnt==-1) {
					searchMap.put("image"+(j+1), image);
					break;
				}
				searchMap.put("image"+(j+1), image.substring(0, cnt));
				image = image.substring(cnt+1);
			}
			searchMap.put("searchNum","s"+Integer.toString(i+1));
			searchMap.put("id",search.get(i).getId());
			searchMap.put("title",search.get(i).getTitle());
			searchMap.put("boardnum", Integer.toString(search.get(i).getBoardnum()));
			searchMap.put("membertype", search.get(i).getMembertype());
			searchList.add(searchMap);
		}
		
		
		model.addAttribute("searchList", searchList);
		model.addAttribute("text",text);
		return "search";
	}
	
	@RequestMapping(value="/goMap", method=RequestMethod.GET)
	public String goMap(String text, Model model) {
		model.addAttribute("text", text);
		return "map"; 
	}
	
	@RequestMapping(value="/searchMap", method=RequestMethod.GET)
	public @ResponseBody ArrayList<Board> searchMap(String text) {
		ArrayList<Board> result = boardDAO.searchBoard(text);
		return result; 
	}
	
}
