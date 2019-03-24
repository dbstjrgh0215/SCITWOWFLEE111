package com.scit.flee2;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession hs) {
		hs.invalidate();
		return "home";
	}
	
	@RequestMapping(value="/goHome", method=RequestMethod.GET)
	public String goHome() {
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
	
	@RequestMapping(value="/goBoardSeller", method=RequestMethod.GET)
	public String goBoardSeller() { 
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
	
	@RequestMapping(value="/goProposalWrite", method=RequestMethod.GET)
	public String goProposalWrite() {
		return "proposalWrite";
	}
	
	@RequestMapping(value="/goMap", method=RequestMethod.GET)
	public String goMap() { 
		return "map"; 
	}
}
