package com.scit.flee2;

import java.io.File;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.scit.flee2.dao.BoardDAO;
import com.scit.flee2.vo.Proposal;

@Controller
public class BoardController {
	
	private static final String UPLOADPATH="C:/upload/";

	@Autowired
	BoardDAO boardDAO;
	
	@RequestMapping(value="/insertProposal", method=RequestMethod.POST)
	public String insertProposal(Proposal prop, MultipartFile uploadFile, MultipartHttpServletRequest request) {
		
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
		}
		
		prop.setImage(files);
		boardDAO.insertProposal(prop);
		
		return "proposal";
	}
	
}
