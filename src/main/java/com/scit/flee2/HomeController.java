package com.scit.flee2;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.scit.flee2.dao.BoardDAO;
import com.scit.flee2.vo.Board;

@Controller
public class HomeController {
	
	@Autowired
	BoardDAO boardDAO;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession hs, Model model) {
		ArrayList<Board> list = boardDAO.listRecommendSeller();
		ArrayList<HashMap<String,String>> recommendList = new ArrayList<HashMap<String,String>>();
		
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
			recommendList.add(recommendMap);
		}
		
		model.addAttribute("recommendList", recommendList);
		return "home";
	}
	
	@RequestMapping(value="/goHome", method=RequestMethod.GET)
	public String goHome(HttpSession hs, Model model) {
		ArrayList<Board> list = boardDAO.listRecommendSeller();
		ArrayList<HashMap<String,String>> recommendList = new ArrayList<HashMap<String,String>>();
		
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
			recommendList.add(recommendMap);
		}
		
		model.addAttribute("recommendList", recommendList);
		return "home";
	}
	
	@RequestMapping(value="/goLogin", method=RequestMethod.GET)
	public String goLogin() {
		return "login";
	} 
	
	@RequestMapping(value="/goSearchIdPw", method=RequestMethod.GET)
	public String goSearchIdPw(String type, Model model) {
		model.addAttribute("type", type);
		return "searchIdPw";
	}
	
	@RequestMapping(value="/goSignUp", method=RequestMethod.GET)
	public String goSignUp() {
		return "signUp";
	}
	
	@RequestMapping(value="/goExtraInfo", method=RequestMethod.GET)
	public String goExtraInfo(String id, String membertype, String latitude, String longitude, Model model) {
		model.addAttribute("id", id);
		model.addAttribute("memtype", membertype);
		model.addAttribute("latitude", latitude);
		model.addAttribute("longitude", longitude);
		return "extraInfo";
	}
	
	@RequestMapping(value="/goSignEnd", method=RequestMethod.GET)
	public String goSignEnd() {
		return "signEnd";
	}
	
	
	@RequestMapping(value="/goProposalWrite", method=RequestMethod.GET)
	public String goProposalWrite() {
		return "proposalWrite";
	}
	
	@RequestMapping(value="/goMap", method=RequestMethod.GET)
	public String goMap() { 
		return "map"; 
	}
}
