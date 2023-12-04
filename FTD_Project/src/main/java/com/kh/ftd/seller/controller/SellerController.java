package com.kh.ftd.seller.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ftd.seller.model.service.SellerService;
import com.kh.ftd.seller.model.vo.Seller;

@Controller
public class SellerController {

	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("list.se")
	public String sellerList() {
		
		return "seller/sellerListView";
	}
	
	@RequestMapping(value = "ajaxSelectSellerList.se" , produces = "application/json; charset=UTF-8")
	public String ajaxSelectSellerList(int page, int pageSize) {
		return "";
	}
	
	@RequestMapping("loginForm.se")
	public String sellerLoginForm() {
		return "seller/sellerLogin";
	}
	
	@RequestMapping("login.se")
	public ModelAndView sellerLogin(Seller s, ModelAndView mv, HttpSession session) {
		System.out.println(s.getSellerPwd());
		System.out.println(bcryptPasswordEncoder.encode(s.getSellerPwd()));
		Seller loginSeller = sellerService.loginSeller(s);
		if(loginSeller != null && bcryptPasswordEncoder.matches(s.getSellerPwd(), loginSeller.getSellerPwd())) { 
			// 로그인 성공
			session.setAttribute("loginSeller", loginSeller);
			session.setAttribute("alertMsg", "로그인에 성공했습니다.");
			mv.setViewName("redirect:/");
		} else { 
			// 로그인 실패
			mv.addObject("errorMsg", "로그인 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
}
