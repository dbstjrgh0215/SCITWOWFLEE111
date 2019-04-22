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
import com.scit.flee2.vo.Request;

@Controller
public class HomeController {
	
	@Autowired
	BoardDAO boardDAO;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession hs, Model model) {
		ArrayList<Board> listSeller = boardDAO.listRecommend("셀러");
		ArrayList<Board> listSpace = boardDAO.listRecommend("공간제공자");
		ArrayList<HashMap<String,String>> recommendSellerList = new ArrayList<HashMap<String,String>>();
		ArrayList<HashMap<String,String>> recommendSpaceList = new ArrayList<HashMap<String,String>>();
		
		//셀러 추천리스트
		for(int i=0; i<listSeller.size(); i++) {		// keyword 자르는 구문
			HashMap<String,String> recommendMap = new HashMap<String,String>();
			String keyword = listSeller.get(i).getKeyword();
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
			
			String image = listSeller.get(i).getImage();
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
			recommendMap.put("id",listSeller.get(i).getId());
			recommendMap.put("title",listSeller.get(i).getTitle());
			recommendMap.put("boardnum",Integer.toString(listSeller.get(i).getBoardnum()));
			recommendSellerList.add(recommendMap);
		}
		
		
		//셀러 추천리스트
		for(int i=0; i<listSpace.size(); i++) {		// keyword 자르는 구문
			HashMap<String,String> recommendMap = new HashMap<String,String>();
			String keyword = listSpace.get(i).getKeyword();
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
			
			String image = listSpace.get(i).getImage();
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
			recommendMap.put("recommendNum","rsp"+Integer.toString(i+1));
			recommendMap.put("id",listSpace.get(i).getId());
			recommendMap.put("title",listSpace.get(i).getTitle());
			recommendMap.put("boardnum",Integer.toString(listSpace.get(i).getBoardnum()));
			recommendSpaceList.add(recommendMap);
		}
		
		model.addAttribute("recommendSpaceList", recommendSpaceList);
		model.addAttribute("recommendSellerList", recommendSellerList);
		return "home";
	}
	
	@RequestMapping(value="/goHome", method=RequestMethod.GET)
	public String goHome(HttpSession hs, Model model) {
		ArrayList<Board> listSeller = boardDAO.listRecommend("셀러");
		ArrayList<Board> listSpace = boardDAO.listRecommend("공간제공자");
		ArrayList<HashMap<String,String>> recommendSellerList = new ArrayList<HashMap<String,String>>();
		ArrayList<HashMap<String,String>> recommendSpaceList = new ArrayList<HashMap<String,String>>();
		
		//셀러 추천리스트
		for(int i=0; i<listSeller.size(); i++) {		// keyword 자르는 구문
			HashMap<String,String> recommendMap = new HashMap<String,String>();
			String keyword = listSeller.get(i).getKeyword();
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
			
			String image = listSeller.get(i).getImage();
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
			
			recommendMap.put("cntZzim", Integer.toString(listSeller.get(i).getZzimCount()));
			recommendMap.put("cntQna", Integer.toString(listSeller.get(i).getQnaCount()));
			recommendMap.put("count",Integer.toString(listSeller.get(i).getCount()));
			recommendMap.put("recommendNum","rs"+Integer.toString(i+1));
			recommendMap.put("id",listSeller.get(i).getId());
			recommendMap.put("title",listSeller.get(i).getTitle());
			recommendMap.put("boardnum",Integer.toString(listSeller.get(i).getBoardnum()));
			recommendSellerList.add(recommendMap);
			
		}
		
		
		//공간 추천리스트
		for(int i=0; i<listSpace.size(); i++) {		// keyword 자르는 구문
			HashMap<String,String> recommendMap = new HashMap<String,String>();
			String keyword = listSpace.get(i).getKeyword();
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
			
			String image = listSpace.get(i).getImage();
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
			
			recommendMap.put("cntZzim", Integer.toString(listSpace.get(i).getZzimCount()));
			recommendMap.put("cntQna", Integer.toString(listSpace.get(i).getQnaCount()));
			recommendMap.put("count",Integer.toString(listSpace.get(i).getCount()));			
			recommendMap.put("recommendNum","rsp"+Integer.toString(i+1));
			recommendMap.put("id",listSpace.get(i).getId());
			recommendMap.put("title",listSpace.get(i).getTitle());
			recommendMap.put("boardnum",Integer.toString(listSpace.get(i).getBoardnum()));
			recommendSpaceList.add(recommendMap);
		}
		
		model.addAttribute("recommendSpaceList", recommendSpaceList);
		model.addAttribute("recommendSellerList", recommendSellerList);
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
	
}
