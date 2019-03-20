package com.scit.flee2.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.scit.flee2.vo.Member;

public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession hs = request.getSession();
		Member mem = (Member) hs.getAttribute("sessionMember");
		
		if(mem==null) {
			response.sendRedirect(request.getContextPath()+"/goLogin");
			return false;
		} else {
			return true;
		}
	}
}
