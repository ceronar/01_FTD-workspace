package com.kh.ftd.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.ftd.member.model.vo.Member;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser") != null) {
		
			Member m = (Member)session.getAttribute("loginUser");
			
			if(m.getMemberId().equals("admin")) {
				
				return true;
				
			}
		}
		
		session.setAttribute("alertMsg", "어드민 전용 페이지 입니다.");
		
		response.sendRedirect("redirect:/");
		
		return false;
		
	}
}
