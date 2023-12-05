package com.kh.ftd.seller.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.ftd.seller.model.service.SellerService;
import com.kh.ftd.seller.model.vo.Seller;
import com.kh.ftd.seller.model.vo.SellerFile;

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
	
	@ResponseBody
	@RequestMapping(value = "ajaxSelectSellerList.se" , produces = "application/json; charset=UTF-8")
	public String ajaxSelectSellerList(int page, int pageSize) {
	
		// 마켓 리스트
		ArrayList<Seller> sList = sellerService.ajaxSelectSellerList();
		
		// 마켓 파일
		ArrayList<SellerFile> sfList = new ArrayList<>();
		
		// 마켓 평균 별점
		ArrayList<Object> starList = new ArrayList<>();
		
		// 마켓 리뷰 수
		ArrayList<Object> reviewList = new ArrayList<>();
		
		// 마켓 찜 수
		ArrayList<Object> subscribeList = new ArrayList<>();
		
		
		// 마켓 총 리스트 수
		int totalList = sList.size();
		System.out.println(totalList);
		
		int endPage = Math.min(page * pageSize, totalList);		
		
		for(Seller s : sList) {
			
			int sellerNo = s.getSellerNo();
			System.out.println(sellerNo);
			
			// 마켓 파일
			SellerFile sellerFile = sellerService.ajaxSelectSellerFileList(sellerNo);
			sfList.add(sellerFile);
			
			// 마켓 평균 별점
			int starRating = sellerService.ajaxSelectStarRating(sellerNo);
			starList.add(starRating);
			
			// 마켓 리뷰 수
			int reviews = sellerService.ajaxSelectReviews(sellerNo);
			reviewList.add(reviews);
			
			// 마켓 찜 수
			int subscribe = sellerService.ajaxSelectSubscribe(sellerNo);
			subscribeList.add(subscribe);
		}
		
		ArrayList<Object> resultList = new ArrayList<>();
		
		for (int i = 0; i < endPage; i++) {
			
			ArrayList<Object> arrList = new ArrayList<>();
			
			arrList.add(sList.get(i));
			arrList.add(sfList.get(i));
			arrList.add(starList.get(i));
			arrList.add(reviewList.get(i));
			arrList.add(subscribeList.get(i));
			
			// 마켓 전체 리스트
			resultList.add(arrList);		
		}
		
		return new Gson().toJson(resultList);
	}
	
	@RequestMapping("loginForm.se")
	public String sellerLoginForm() {
		return "seller/sellerLogin";
	}
	
	@RequestMapping("login.se")
	public ModelAndView loginSeller(Seller s, ModelAndView mv, HttpSession session) {
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
	
	@RequestMapping("logout.se")
	public String logoutSeller(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("insertSellerForm.se")
	public String insertSellerForm() {
		return "seller/insertSeller";
	}
	
	@RequestMapping(value = "insertSeller.se", produces = "text/html; charset=UTF-8")
	public String insertSeller(Seller s,
							   Model model,
							   HttpSession session) {
		System.out.println(s);
		
		String encPwd = bcryptPasswordEncoder.encode(s.getSellerPwd());
		
		
		
		System.out.println(encPwd);
		
		s.setSellerPwd(encPwd);
		
		
		
		int result = sellerService.insertSeller(s);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "회원가입 성공");
			
			return "redirect:/";
		
		} else {
			
			model.addAttribute("errorMsg", "회원가입 실패");
			
			return "common/errorPage";
			
		}
		
	}
	
	
	@RequestMapping("sellerPage")
	public String sellerPage() {
		return "seller/sellerPage";
	}
	
	@RequestMapping("update.se")
	public void updateSeller(Seller s, HttpServletRequest upFile) {
		
		int result = sellerService.updateSeller(s);
		
		if(result > 0) {
			
			Seller updateSel = sellerService.loginSeller(s);
			
			
			
		}
		
		
	}
	
}
