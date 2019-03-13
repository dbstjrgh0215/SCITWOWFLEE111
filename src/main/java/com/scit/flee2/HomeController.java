package com.scit.flee2;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping(value="/goHome", method=RequestMethod.GET)
	public String goHome() {
		return "home";
	}
	
	@RequestMapping(value="/goLogin", method=RequestMethod.GET)
	public @ResponseBody String goLogin() {
		return "login";
	} 
	
	@RequestMapping(value="/goProposal", method=RequestMethod.GET)
	public @ResponseBody String goProposal() {
		return "������������ ���⿡ �߰��ؼ�";
	}
	
	@RequestMapping(value="/goMap", method=RequestMethod.GET)
	public String goMap() { 
		return "map"; 
	}
}
