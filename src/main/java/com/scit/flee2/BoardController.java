package com.scit.flee2;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
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
import com.scit.flee2.vo.Contract;
import com.scit.flee2.vo.ContractHanasi;
import com.scit.flee2.vo.Member;
import com.scit.flee2.vo.Notice;
import com.scit.flee2.vo.Product;
import com.scit.flee2.vo.Proposal;
import com.scit.flee2.vo.Qna;
import com.scit.flee2.vo.Request;
import com.scit.flee2.vo.Seller;
import com.scit.flee2.vo.Space;
import com.scit.flee2.vo.Zzim;

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
					break;
				}
				fileDelete(mem.getId(), prop.getTitle(), "prop");
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
		String precaution = result.getPrecaution();
		if(precaution!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				precaution = precaution.substring(cnt+1);
				cnt = precaution.indexOf("&");
				if(cnt==-1) {
					map.put("precaution"+(j+1), precaution);
					break;
				}
				map.put("precaution"+(j+1), precaution.substring(0, cnt));
				precaution = precaution.substring(cnt);
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
		String precaution = result.getPrecaution();
		if(precaution!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				precaution = precaution.substring(cnt+1);
				cnt = precaution.indexOf("&");
				if(cnt==-1) {
					map.put("precaution"+(j+1), precaution);
					break;
				}
				map.put("precaution"+(j+1), precaution.substring(0, cnt));
				precaution = precaution.substring(cnt);
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
		String precaution = result.getPrecaution();
		if(precaution!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				precaution = precaution.substring(cnt+1);
				cnt = precaution.indexOf("&");
				if(cnt==-1) {
					map.put("precaution"+(j+1), precaution);
					break;
				}
				map.put("precaution"+(j+1), precaution.substring(0, cnt));
				precaution = precaution.substring(cnt);
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
		String precaution = result.getPrecaution();
		if(precaution!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				precaution = precaution.substring(cnt+1);
				cnt = precaution.indexOf("&");
				if(cnt==-1) {
					map.put("precaution"+(j+1), precaution);
					break;
				}
				map.put("precaution"+(j+1), precaution.substring(0, cnt));
				precaution = precaution.substring(cnt);
			}
		}
		
		contentDetail.add(map);
		model.addAttribute("clickNo",clickNo);
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
					break;
				}
				fileDelete(mem.getId(), board.getTitle(), "board");
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
		fileDelete(board.getId(),board.getTitle(),"board");
		
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
			
			recommendMap.put("cntZzim", Integer.toString(list.get(i).getZzimCount()));
			recommendMap.put("cntQna", Integer.toString(list.get(i).getQnaCount()));
			recommendMap.put("count",Integer.toString(list.get(i).getCount()));
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
			sellerMap.put("cntZzim", Integer.toString(seller.get(i).getZzimCount()));
			sellerMap.put("cntQna", Integer.toString(seller.get(i).getQnaCount()));
			sellerMap.put("count", Integer.toString(seller.get(i).getCount()));
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
			recommendMap.put("cntZzim", Integer.toString(list.get(i).getZzimCount()));
			recommendMap.put("cntQna", Integer.toString(list.get(i).getQnaCount()));
			recommendMap.put("count", Integer.toString(list.get(i).getCount()));
			
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
			spaceMap.put("cntZzim", Integer.toString(space.get(i).getZzimCount()));
			spaceMap.put("cntQna", Integer.toString(space.get(i).getQnaCount()));
			spaceMap.put("count", Integer.toString(space.get(i).getCount()));
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
	public String goSellerDetail(int boardnum, Model model, HttpSession hs) {
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
		String precaution = board.getPrecaution();
		if(precaution!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				precaution = precaution.substring(cnt+1);
				cnt = precaution.indexOf("&");
				if(cnt==-1) {
					sellerMap.put("precaution"+(j+1), precaution);
					break;
				}
				sellerMap.put("precaution"+(j+1), precaution.substring(0, cnt));
				precaution = precaution.substring(cnt);
			}
		}
		
		String keywordSimilar1 = sellerMap.get("keyword1");
		String keywordSimilar2 = sellerMap.get("keyword2");
		String keywordSimilar3 = sellerMap.get("keyword3");
		ArrayList<Board> list = boardDAO.searchSeller(keywordSimilar1);
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getBoardnum()==boardnum) {
				list.remove(i);
			}
		}
		if(!keywordSimilar2.equals("")) {
			list.addAll(boardDAO.searchSeller(keywordSimilar2));
			for(int i=0;i<list.size();i++) {
				if(list.get(i).getBoardnum()==boardnum) {
					list.remove(i);
				}
			}
		} 
		if(!keywordSimilar3.equals("")) {
			list.addAll(boardDAO.searchSeller(keywordSimilar3));
			for(int i=0;i<list.size();i++) {
				if(list.get(i).getBoardnum()==boardnum) {
					list.remove(i);
				}
			}
		}
		for(int i=0;i<list.size();i++) {
			for(int j=i+1;j<list.size();j++) {
				if(list.get(i).getBoardnum()==list.get(j).getBoardnum()) {
					list.remove(j);
				}
			}
		}
		if(list.size()>9) {
			for(int j=8;j<list.size();j++) {
				list.remove(j);
			}
		}
		
		ArrayList<HashMap<String,String>> recommendSellerList = new ArrayList<HashMap<String,String>>();
		
		for(int i=0; i<list.size(); i++) {		// keyword 자르는 구문
			HashMap<String,String> recommendMap = new HashMap<String,String>();
			String similarKeyword = list.get(i).getKeyword();
			for(int j=0; j<5; j++) {
				int cnt = 0;
				similarKeyword = similarKeyword.substring(cnt+1);
				cnt = similarKeyword.indexOf("&");
				if(cnt==-1) {
					break;
				}
				recommendMap.put("similarKeyword"+(j+1), similarKeyword.substring(0, cnt));
				similarKeyword = similarKeyword.substring(cnt);
			}
			
			String similarImage = list.get(i).getImage();
			for(int j=0; j<3; j++) {		// image 자르는 구문
				int cnt = 0;
				cnt = similarImage.indexOf("&");
				if(cnt==-1) {
					recommendMap.put("similarImage"+(j+1), similarImage);
					break;
				}
				recommendMap.put("similarImage"+(j+1), similarImage.substring(0, cnt));
				similarImage = similarImage.substring(cnt+1);
			}
			
			recommendMap.put("cntZzim", Integer.toString(list.get(i).getZzimCount()));
			recommendMap.put("cntQna", Integer.toString(list.get(i).getQnaCount()));
			recommendMap.put("count", Integer.toString(list.get(i).getCount()));
			
			recommendMap.put("recommendNum","rs"+Integer.toString(i+1));
			recommendMap.put("id",list.get(i).getId());
			recommendMap.put("title",list.get(i).getTitle());
			recommendMap.put("boardnum",Integer.toString(list.get(i).getBoardnum()));
			recommendMap.put("membertype",list.get(i).getMembertype());
			recommendSellerList.add(recommendMap);
		}
		
		
		ArrayList<HashMap<String,String>> anotherList = new ArrayList<HashMap<String,String>>();
		ArrayList<Board> anotherResult = boardDAO.searchAnother(board.getId());
		for(int i=0; i<anotherResult.size(); i++) {		// keyword 자르는 구문
			HashMap<String,String> recommendMap = new HashMap<String,String>();
			String anotherKeyword = anotherResult.get(i).getKeyword();
			for(int j=0; j<5; j++) {
				int cnt = 0;
				anotherKeyword = anotherKeyword.substring(cnt+1);
				cnt = anotherKeyword.indexOf("&");
				if(cnt==-1) {
					break;
				}
				recommendMap.put("anotherKeyword"+(j+1), anotherKeyword.substring(0, cnt));
				anotherKeyword = anotherKeyword.substring(cnt);
			}
			
			String anotherImage = anotherResult.get(i).getImage();
			for(int j=0; j<3; j++) {		// image 자르는 구문
				int cnt = 0;
				cnt = anotherImage.indexOf("&");
				if(cnt==-1) {
					recommendMap.put("anotherImage"+(j+1), anotherImage);
					break;
				}
				recommendMap.put("anotherImage"+(j+1), anotherImage.substring(0, cnt));
				anotherImage = anotherImage.substring(cnt+1);
			}
			recommendMap.put("recommendNum","rs"+Integer.toString(i+1));
			recommendMap.put("id",anotherResult.get(i).getId());
			recommendMap.put("title",anotherResult.get(i).getTitle());
			recommendMap.put("boardnum",Integer.toString(anotherResult.get(i).getBoardnum()));
			recommendMap.put("membertype",anotherResult.get(i).getMembertype());
			anotherList.add(recommendMap);
		}
		
		model.addAttribute("anotherList", anotherList);
		
		model.addAttribute("recommendSellerList", recommendSellerList);
		
		//찜 카운트
		Zzim zzim = new Zzim();
		zzim.setBoardnum(board.getBoardnum());
		Member mem = (Member)hs.getAttribute("sessionMember");
		zzim.setId(mem.getId());
		Zzim zzimCheck = boardDAO.checkZzim(zzim);
		
		boardDetail.add(sellerMap);
		ArrayList<Qna> qnaList = boardDAO.listQna(boardnum);
		
		ArrayList<Proposal> listProposal = boardDAO.listProposal(mem);
		model.addAttribute("listProposal", listProposal);
		
		model.addAttribute("zzimCheck", zzimCheck);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("board",board);
		model.addAttribute("boardDetail", boardDetail);
		
		boardDAO.updateCnt(boardnum);
		
		return "seller";
	}
	
	@RequestMapping(value="/goSpaceDetail", method=RequestMethod.GET)
	public String goSpaceDetail(int boardnum, Model model, HttpSession hs) {
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
		String precaution = board.getPrecaution();
		if(precaution!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				precaution = precaution.substring(cnt+1);
				cnt = precaution.indexOf("&");
				if(cnt==-1) {
					spaceMap.put("precaution"+(j+1), precaution);
					break;
				}
				spaceMap.put("precaution"+(j+1), precaution.substring(0, cnt));
				precaution = precaution.substring(cnt);
			}
		}
		
		String keywordSimilar1 = spaceMap.get("keyword1");
		String keywordSimilar2 = spaceMap.get("keyword2");
		String keywordSimilar3 = spaceMap.get("keyword3");
		ArrayList<Board> list = boardDAO.searchSpace(keywordSimilar1);
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getBoardnum()==boardnum) {
				list.remove(i);
			}
		}
		if(!keywordSimilar2.equals("")) {
			list.addAll(boardDAO.searchSpace(keywordSimilar2));
			for(int i=0;i<list.size();i++) {
				if(list.get(i).getBoardnum()==boardnum) {
					list.remove(i);
				}
			}
		} 
		if(!keywordSimilar3.equals("")) {
			list.addAll(boardDAO.searchSpace(keywordSimilar3));
			for(int i=0;i<list.size();i++) {
				if(list.get(i).getBoardnum()==boardnum) {
					list.remove(i);
				}
			}
		}
		for(int i=0;i<list.size();i++) {
			for(int j=i+1;j<list.size();j++) {
				if(list.get(i).getBoardnum()==list.get(j).getBoardnum()) {
					list.remove(j);
				}
			}
		}
		if(list.size()>9) {
			for(int j=8;j<list.size();j++) {
				list.remove(j);
			}
		}
		
		ArrayList<HashMap<String,String>> recommendSpaceList = new ArrayList<HashMap<String,String>>();
		
		for(int i=0; i<list.size(); i++) {		// keyword 자르는 구문
			HashMap<String,String> recommendMap = new HashMap<String,String>();
			String similarKeyword = list.get(i).getKeyword();
			for(int j=0; j<5; j++) {
				int cnt = 0;
				similarKeyword = similarKeyword.substring(cnt+1);
				cnt = similarKeyword.indexOf("&");
				if(cnt==-1) {
					break;
				}
				recommendMap.put("similarKeyword"+(j+1), similarKeyword.substring(0, cnt));
				similarKeyword = similarKeyword.substring(cnt);
			}
			
			String similarImage = list.get(i).getImage();
			for(int j=0; j<3; j++) {		// image 자르는 구문
				int cnt = 0;
				cnt = similarImage.indexOf("&");
				if(cnt==-1) {
					recommendMap.put("similarImage"+(j+1), similarImage);
					break;
				}
				recommendMap.put("similarImage"+(j+1), similarImage.substring(0, cnt));
				similarImage = similarImage.substring(cnt+1);
			}
			
			recommendMap.put("cntZzim", Integer.toString(list.get(i).getZzimCount()));
			recommendMap.put("cntQna", Integer.toString(list.get(i).getQnaCount()));
			recommendMap.put("count", Integer.toString(list.get(i).getCount()));
			recommendMap.put("recommendNum","rs"+Integer.toString(i+1));
			recommendMap.put("id",list.get(i).getId());
			recommendMap.put("title",list.get(i).getTitle());
			recommendMap.put("boardnum",Integer.toString(list.get(i).getBoardnum()));
			recommendMap.put("membertype",list.get(i).getMembertype());
			recommendSpaceList.add(recommendMap);
		}
		
		model.addAttribute("recommendSpaceList", recommendSpaceList);
		
		//찜 카운트
		Zzim zzim = new Zzim();
		zzim.setBoardnum(board.getBoardnum());
		Member mem = (Member)hs.getAttribute("sessionMember");
		zzim.setId(mem.getId());
		Zzim zzimCheck = boardDAO.checkZzim(zzim);
		model.addAttribute("zzimCheck", zzimCheck);
		
		boardDetail.add(spaceMap);
		ArrayList<Qna> qnaList = boardDAO.listQna(boardnum);
		
		ArrayList<Proposal> listProposal = boardDAO.listProposal(mem);
		model.addAttribute("listProposal", listProposal);
		
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("board",board);
		model.addAttribute("boardDetail", boardDetail);
		
		boardDAO.updateCnt(boardnum);
		
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
	public @ResponseBody ArrayList<Qna> insertQna(Qna qna, String go, String receiveId, HttpSession hs) {
		boardDAO.insertQna(qna);
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("boardnum", qna.getBoardnum());
		map.put("updown",1);
		boardDAO.updateCntQna(map);
		ArrayList<Qna> qnaList = boardDAO.listQna(qna.getBoardnum());
		
		//알림메세지 만들기
		Member mem = (Member)hs.getAttribute("sessionMember");
		String id = mem.getId();
		Notice notice = new Notice();
		notice.setId(id);
		notice.setGo(go);
		notice.setConfirm("0");
		notice.setReceiveid(receiveId);
		notice.setMessage("님이 Q&A를 작성하였습니다.");
		boardDAO.insertNotice(notice);
				
		return qnaList;
	}
	
	@RequestMapping(value="/insertReply", method=RequestMethod.GET)
	public @ResponseBody ArrayList<Qna> insertReply(Qna qna, String go, String receiveId, HttpSession hs){
		boardDAO.insertReply(qna);
		ArrayList<Qna> qnaList = boardDAO.listQna(qna.getBoardnum());
		
		//알림메세지 만들기
		Member mem = (Member)hs.getAttribute("sessionMember");
		String id = mem.getId();
		Notice notice = new Notice();
		notice.setId(id);
		notice.setGo(go);
		notice.setConfirm("0");
		notice.setReceiveid(receiveId);
		notice.setMessage("님이 답글을 작성하였습니다.");
		boardDAO.insertNotice(notice);
		return qnaList;
	}
	
	@RequestMapping(value="/goCommentsDetail", method=RequestMethod.GET)
	public @ResponseBody Qna goCommentsDetail(String qnanum){
		ArrayList<Qna> qnaList = boardDAO.goQnaDetail(Integer.parseInt(qnanum));
		Qna qna = qnaList.get(0);
		return qna;
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
		ArrayList<Board> result = boardDAO.searchSpace(text);
		return result; 
	}
	
	@RequestMapping(value="/searchPopular", method=RequestMethod.GET)
	public @ResponseBody ArrayList<Board> searchPopular(String type){
		ArrayList<Board> result = boardDAO.searchPopular();
		return result; 
	}
	
	@RequestMapping(value="/searchMapDetail", method=RequestMethod.GET)
	public @ResponseBody ArrayList<HashMap<String,String>> searchMapDetail(String text){
		ArrayList<Board> search = new ArrayList<Board>();
		search = boardDAO.searchSpace(text);
		
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
			String type = search.get(i).getType();
			if(type!=null) {
				for(int j=0; j<5; j++) {
					int cnt = 0;
					type = type.substring(cnt+1);
					cnt = type.indexOf("&");
					if(cnt==-1) {
						searchMap.put("type"+(j+1), type);
						break;
					}
					searchMap.put("type"+(j+1), type.substring(0, cnt));
					type = type.substring(cnt);
				}
			}
			String image = search.get(i).getImage();
			if(image!=null) {
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
			}
			searchMap.put("searchNum","s"+Integer.toString(i+1));
			searchMap.put("id",search.get(i).getId());
			searchMap.put("title",search.get(i).getTitle());
			searchMap.put("boardnum", Integer.toString(search.get(i).getBoardnum()));
			searchMap.put("membertype", search.get(i).getMembertype());
			searchList.add(searchMap);
		}
		
		return searchList;
	}
	
	@RequestMapping(value="/goRequest", method=RequestMethod.GET)
	public String goRequest(HttpSession hs, Model model) {
		Member mem = (Member) hs.getAttribute("sessionMember");
		ArrayList<Board> result = boardDAO.listUserBoard(mem);
		ArrayList<HashMap<String,String>> resultDetail = new ArrayList<HashMap<String,String>>();
		ArrayList<Board> myResult = new ArrayList<Board>();
		ArrayList<Request> list = new ArrayList<Request>();
		list = boardDAO.myRequest(mem.getId());
		for(int i=0;i<list.size();i++) {
			int boardnum = list.get(i).getBoardnum();
			myResult.add(boardDAO.selectBoard(boardnum));
		}
		HashMap<String,String> searchMap = new HashMap<String,String>();
		if(result.size()!=0) {
			String type = result.get(0).getType();
			if(type!=null) {
				for(int j=0; j<5; j++) {
					int cnt = 0;
					type = type.substring(cnt+1);
					cnt = type.indexOf("&");
					if(cnt==-1) {
						searchMap.put("type"+(j+1), type);
						break;
					}
					searchMap.put("type"+(j+1), type.substring(0, cnt));
					type = type.substring(cnt);
				}
			}
			int boardnum = result.get(0).getBoardnum();
			int cnt = 0;
			if(boardnum!=0) {
				cnt = boardDAO.countApproval(boardnum);
			}
			//찜개수 요청개수
			ArrayList<Request> list2 = new ArrayList<Request>();
			ArrayList<Integer> listCnt = new ArrayList<Integer>();
			ArrayList<Integer> listZzim = new ArrayList<Integer>();
			int cntZzim = 0;
			for(int j=0;j<result.size();j++) {
				int clickNo = result.get(j).getBoardnum();
				cntZzim = boardDAO.countZzim(clickNo);
				listZzim.add(cntZzim);
				list2 = boardDAO.listRequest(clickNo);
				listCnt.add(list2.size());
			}
			searchMap.put("countApproval",Integer.toString(cnt));
			searchMap.put("indate",result.get(0).getIndate());
			resultDetail.add(searchMap);
			
			model.addAttribute("listZzim", listZzim);
			model.addAttribute("listCnt", listCnt);
		}
		model.addAttribute("resultDetail",resultDetail);
		model.addAttribute("listUserBoard", result);
		model.addAttribute("listRequestBoard", myResult);
		
		return "request";
	}
	
	@RequestMapping(value="/listMyRequest", method=RequestMethod.GET)
	public @ResponseBody ArrayList<Request> listMyRequest(String clickNo, HttpSession hs) {
		Member mem = (Member) hs.getAttribute("sessionMember");
		ArrayList<Request> list = new ArrayList<Request>();
		list = boardDAO.listRequest(Integer.parseInt(clickNo));
		for(int i=0;i<list.size();i++) {
			if(!list.get(i).getId().equals(mem.getId())) {
				list.remove(i);
			}
		}
		return list; 
	}
	
	@RequestMapping(value="/listRequest", method=RequestMethod.GET)
	public @ResponseBody ArrayList<Request> listRequest(String clickNo) {
		ArrayList<Request> list = new ArrayList<Request>();
		list = boardDAO.listRequest(Integer.parseInt(clickNo));
		
		return list; 
	}
	
	@RequestMapping(value="/goContract", method=RequestMethod.GET)
	public String goContract(HttpSession hs, Model model) {
		Member mem = (Member)hs.getAttribute("sessionMember");
		String id = mem.getId();
		ArrayList<Contract> list = boardDAO.listContract(id);
		ArrayList<String> listSellerNickname = new ArrayList<String>();
		ArrayList<String> listSpacerNickname = new ArrayList<String>();
		for(int i=0; i<list.size(); i++) {
			String sellerId = list.get(i).getSellerId();
			String spacerId = list.get(i).getSpacerId();
			String sellerNickname = boardDAO.searchNickName(sellerId);
			String spacerNickname = boardDAO.searchNickName(spacerId);
			listSellerNickname.add(sellerNickname);
			listSpacerNickname.add(spacerNickname);
		}
		int cntContract = 0;
		try{
			cntContract = boardDAO.countContract(id);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("cntContract", cntContract);
		model.addAttribute("listSellerNickname", listSellerNickname);
		model.addAttribute("listSpacerNickname", listSpacerNickname);
		model.addAttribute("listContract", list);
		
		return "contract";
	}
	
	@RequestMapping(value="/selectContract", method=RequestMethod.GET)
	public @ResponseBody Contract selectContract(String contractnum) {
		Contract contract = new Contract();
		contract = boardDAO.selectContract(Integer.parseInt(contractnum));
		String sellerType=contract.getSellerType();
		if(sellerType!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				sellerType = sellerType.substring(cnt+1);
				cnt = sellerType.indexOf("&");
				if(cnt==-1) {
					contract.setSellerType(sellerType);
					break;
				}
				contract.setSellerType(sellerType.substring(0,cnt));
				break;
			}
		}
		String spaceType=contract.getSpaceType();
		if(spaceType!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				spaceType = spaceType.substring(cnt+1);
				cnt = spaceType.indexOf("&");
				if(cnt==-1) {
					contract.setSpaceType(spaceType);
					break;
				}
				contract.setSpaceType(spaceType.substring(0,cnt));
				break;
			}
		}
		return contract;
	}
	
	@RequestMapping(value="/searchNickname", method=RequestMethod.GET)
	public @ResponseBody ArrayList<String> searchNickname(String sellerId, String spacerId){
		ArrayList<String> searchNickname = new ArrayList<String>();
		String sellerNickname = boardDAO.searchNickName(sellerId);
		String spacerNickname = boardDAO.searchNickName(spacerId);
		searchNickname.add(sellerNickname);
		searchNickname.add(spacerNickname);
		
		return searchNickname;
	}
	
	@RequestMapping(value="/insertRequest", method=RequestMethod.GET)
	public @ResponseBody String insertRequest(Request req, String boardId) {
		boardDAO.insertRequest(req);
		Notice notice = new Notice();
		notice.setId(req.getId());
		notice.setGo("goRequest");
		notice.setConfirm("0");
		notice.setReceiveid(boardId);
		notice.setMessage("님이 계약신청을 하였습니다.");
		boardDAO.insertNotice(notice);
		return "success";
	}
	
	@RequestMapping(value="/clickApproval", method=RequestMethod.GET)
	public @ResponseBody String clickApproval(String requestnum, String select, HttpSession hs, String go, String receiveId, String contractPeriod) {
		HashMap<String,String> map = new HashMap<String,String>();
		map.put("requestnum", requestnum);
		map.put("select",select);
		boardDAO.clickApproval(map);
		Contract contract = new Contract();
		//알림메세지 만들기
		Member mem = (Member)hs.getAttribute("sessionMember");
		String id = mem.getId();
		Notice notice = new Notice();
		notice.setId(id);
		notice.setGo(go);
		notice.setConfirm("0");
		notice.setReceiveid(receiveId);
		if(select.equals("승인")) {
			notice.setMessage("님과의 계약요청이 승인되었습니다.");
			if(mem.getMembertype().equals("셀러")) {
				contract.setSellerId(id);
				contract.setSpacerId(receiveId);
				Seller seller = boardDAO.selectSellerInfo(id);
				Product product = boardDAO.selectProductInfo(seller.getSellernum());
				contract.setSellerType(product.getProd_type());
				Space space = boardDAO.selectSpaceInfo(receiveId);
				contract.setLatitude(space.getLatitude());
				contract.setLongitude(space.getLongitude());
				contract.setSpaceaddr1(space.getSpaceaddr1());
				contract.setSpaceaddr2(space.getSpaceaddr2());
				contract.setSpaceType(space.getSpace_type());
			} else {
				contract.setSellerId(receiveId);
				contract.setSpacerId(id);
				Seller seller = boardDAO.selectSellerInfo(receiveId);
				Product product = boardDAO.selectProductInfo(seller.getSellernum());
				contract.setSellerType(product.getProd_type());
				Space space = boardDAO.selectSpaceInfo(id);
				contract.setLatitude(space.getLatitude());
				contract.setLongitude(space.getLongitude());
				contract.setSpaceaddr1(space.getSpaceaddr1());
				contract.setSpaceaddr2(space.getSpaceaddr2());
				contract.setSpaceType(space.getSpace_type());
			}
			contract.setContractPeriod(contractPeriod);
			boardDAO.insertContract(contract);
		} else {
			notice.setMessage("님과의 계약요청이 거절되었습니다.");
		}
		boardDAO.insertNotice(notice);
		return "success";
	}
	
	@RequestMapping(value="/updateContract", method=RequestMethod.GET)
	public @ResponseBody Contract updateContract(Contract contract) {
		Contract updateContract = new Contract();
		boardDAO.updateContract(contract);
		updateContract = boardDAO.selectContract(contract.getContractnum());
		String sellerType=updateContract.getSellerType();
		if(sellerType!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				sellerType = sellerType.substring(cnt+1);
				cnt = sellerType.indexOf("&");
				if(cnt==-1) {
					updateContract.setSellerType(sellerType);
					break;
				}
				updateContract.setSellerType(sellerType.substring(0,cnt));
				break;
			}
		}
		String spaceType=updateContract.getSpaceType();
		if(spaceType!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				spaceType = spaceType.substring(cnt+1);
				cnt = spaceType.indexOf("&");
				if(cnt==-1) {
					updateContract.setSpaceType(spaceType);
					break;
				}
				updateContract.setSpaceType(spaceType.substring(0,cnt));
				break;
			}
		}
		
		return updateContract;
	}
	
	@RequestMapping(value="/startContract", method=RequestMethod.GET)
	public @ResponseBody Contract startContract(Contract contract) {
		Contract updateContract = new Contract();
		boardDAO.startContract(contract);
		updateContract = boardDAO.selectContract(contract.getContractnum());
		String sellerType=updateContract.getSellerType();
		if(sellerType!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				sellerType = sellerType.substring(cnt+1);
				cnt = sellerType.indexOf("&");
				if(cnt==-1) {
					updateContract.setSellerType(sellerType);
					break;
				}
				updateContract.setSellerType(sellerType.substring(0,cnt));
				break;
			}
		}
		String spaceType=updateContract.getSpaceType();
		if(spaceType!=null) {
			for(int j=0; j<5; j++) {
				int cnt = 0;
				spaceType = spaceType.substring(cnt+1);
				cnt = spaceType.indexOf("&");
				if(cnt==-1) {
					updateContract.setSpaceType(spaceType);
					break;
				}
				updateContract.setSpaceType(spaceType.substring(0,cnt));
				break;
			}
		}
		return updateContract;
	}
	
	@RequestMapping(value="/insertZzim", method=RequestMethod.GET)
	public @ResponseBody int insertZzim(Zzim zzim, String go, String boardId, HttpSession hs) {
		boardDAO.insertZzim(zzim);
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("boardnum", zzim.getBoardnum());
		map.put("updown",1);
		boardDAO.updateCntZzim(map);
		//알림메세지 만들기
		Member mem = (Member)hs.getAttribute("sessionMember");
		String id = mem.getId();
		Notice notice = new Notice();
		notice.setId(id);
		notice.setGo(go);
		notice.setConfirm("0");
		notice.setReceiveid(boardId);
		notice.setMessage("님이 게시물을 찜하였습니다.");
		boardDAO.insertNotice(notice);
		int zzimCount = boardDAO.countZzim(zzim.getBoardnum());
		return zzimCount;
	}
	
	@RequestMapping(value="/deleteZzim", method=RequestMethod.GET)
	public @ResponseBody int delteZzim(Zzim zzim) {
		boardDAO.deleteZzim(zzim);
		HashMap<String,Integer> map = new HashMap<String,Integer>();
		map.put("boardnum", zzim.getBoardnum());
		map.put("updown",-1);
		boardDAO.updateCntZzim(map);
		int zzimCount = boardDAO.countZzim(zzim.getBoardnum());
		return zzimCount;
	}
	
	@RequestMapping(value="/goZzimList", method=RequestMethod.GET)
	public String goZzimList(HttpSession hs, Model model) {
		Member mem = (Member)hs.getAttribute("sessionMember");
		String id = mem.getId();
		ArrayList<Integer> list = boardDAO.zzimList(id);
		ArrayList<Board> listBoard = new ArrayList<Board>();
		for(int i=0; i<list.size(); i++) {
			int boardnum = list.get(i);
			Board board = new Board();
			board = boardDAO.selectBoard(boardnum);
			listBoard.add(board);
		}
		
		ArrayList<HashMap<String,String>> zzimList = new ArrayList<HashMap<String,String>>();
		
		for(int i=0; i<listBoard.size(); i++) {		// keyword 자르는 구문
			HashMap<String,String> recommendMap = new HashMap<String,String>();
			String keyword = listBoard.get(i).getKeyword();
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
			
			String image = listBoard.get(i).getImage();
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
			
			recommendMap.put("cntZzim", Integer.toString(listBoard.get(i).getZzimCount()));
			recommendMap.put("cntQna", Integer.toString(listBoard.get(i).getQnaCount()));
			recommendMap.put("count",Integer.toString(listBoard.get(i).getCount()));
			recommendMap.put("recommendNum","rs"+Integer.toString(i+1));
			recommendMap.put("id",listBoard.get(i).getId());
			recommendMap.put("title",listBoard.get(i).getTitle());
			recommendMap.put("boardnum",Integer.toString(listBoard.get(i).getBoardnum()));
			zzimList.add(recommendMap);
		}
		
		model.addAttribute("zzimList", zzimList);
		
		return "zzimList";
	}
	
	@RequestMapping(value="/insertHanasi", method=RequestMethod.GET)
	public @ResponseBody ArrayList<ContractHanasi> insertHanasi(ContractHanasi hanasi){
		boardDAO.insertHanasi(hanasi);
		
		ArrayList<ContractHanasi> list = new ArrayList<ContractHanasi>();
		
		try {
			list = boardDAO.listHanasi(hanasi.getContractnum());
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		Notice notice = new Notice();
		notice.setId(hanasi.getSendId());
		notice.setGo("goContract");
		notice.setConfirm("0");
		notice.setReceiveid(hanasi.getReceiveId());
		notice.setMessage("님이 메세지를 보냈습니다.");
		boardDAO.insertNotice(notice);
		
		return list;
	}
	
	@RequestMapping(value="/listHanasi", method=RequestMethod.GET)
	public @ResponseBody ArrayList<ContractHanasi> listHanasi(int contractnum){
		ArrayList<ContractHanasi> list = new ArrayList<ContractHanasi>();
		
		try {
			list = boardDAO.listHanasi(contractnum);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
