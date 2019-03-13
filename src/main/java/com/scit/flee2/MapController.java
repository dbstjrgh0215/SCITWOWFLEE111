package com.scit.flee2;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.scit.flee2.dao.MemberDAO;
import com.scit.flee2.vo.Space;

@Controller
public class MapController {
	
	@Autowired
	MemberDAO memberDAO;

	@RequestMapping(value="/clickBtn1", method=RequestMethod.GET)
	public @ResponseBody ArrayList<Space> clickBtn1(Space space){
		ArrayList<Space> result = new ArrayList<Space>();
		
		try {
			result = memberDAO.searchSpace(space);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@RequestMapping(value="/clickBtn2", method=RequestMethod.GET)
	public @ResponseBody ArrayList<Space> clickBtn2(Space space){
		ArrayList<Space> result = new ArrayList<Space>();
		
		try {
			result = memberDAO.searchSpace(space);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
