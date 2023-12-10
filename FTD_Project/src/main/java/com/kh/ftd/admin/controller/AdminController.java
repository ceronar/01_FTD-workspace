package com.kh.ftd.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.ftd.admin.model.service.AdminService;
import com.kh.ftd.admin.model.vo.Chart;
import com.kh.ftd.common.model.vo.PageInfo;
import com.kh.ftd.common.template.Pagination;
import com.kh.ftd.member.model.service.MemberService;
import com.kh.ftd.member.model.vo.Member;
import com.kh.ftd.seller.model.service.SellerService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SellerService sellerService;
	
	@RequestMapping("menu.ad")
	public String adminMenu(Model model) {
		
		// 전체 회원 수
		int countMember = adminService.countMember();
		int countSeller = adminService.countSeller();
		// 누적 전체 매출
		int totalSales = adminService.totalSales();
		
		// 구매자가 쓴 리뷰 게시글수 조회
		int countReview = adminService.countReviewBoard();
		// 구매자가 쓴 문의 게시글수 조회
		int countInquiry = adminService.countInquiryBoard();
		// 판매자가 쓴 홍보 게시글수 조회
		int countPromotion = adminService.countPromotionBoard();
		// 판매자가 쓴 판매 게시글수 조회
		int countGoodsSell = adminService.countGoodsSellBoard();
		// 관리자가 쓴 공지 수 조회
		int countNotice = adminService.countNoticeBoard();
		
		// 일주일간 일일 글 작성 수
		ArrayList<Chart> dailyBoardCount = adminService.dailyBoardCount();
		// 일주일간 일일 매출
		ArrayList<Chart> dailyOrderPrice = adminService.dailyOrderPrice();
		
		model.addAttribute("countMember", countMember)
			 .addAttribute("countSeller", countSeller)
			 .addAttribute("totalSales", totalSales)
			 .addAttribute("countReview", countReview)
			 .addAttribute("countInquiry", countInquiry)
			 .addAttribute("countPromotion", countPromotion)
			 .addAttribute("countGoodsSell", countGoodsSell)
			 .addAttribute("countNotice", countNotice)
			 .addAttribute("dailyBoardCount", dailyBoardCount)
			 .addAttribute("dailyOrderPrice", dailyOrderPrice);
		
		return "admin/adminMenu";
	}
	
	@RequestMapping("user.ad")
	public ModelAndView userAdminPage(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,
			ModelAndView mv) {
		
		int listCount = adminService.countMember();
		int pageLimit = 5;
		int boardLimit = 10;
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		// 구매자 리스트 페이징 조회
		ArrayList<Member> list = memberService.selectMemberList(pi);
		
		mv.addObject("list", list)
		  .addObject("pi", pi)
		  .setViewName("admin/userAdminPage");
		  
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("userDetails.ad")
	public Member ajaxAdminUserDetails(int memberNo) {
		
		Member m = memberService.selectMember(memberNo);
		
		return m;
	}
	
	@ResponseBody
	@RequestMapping("memberStatusChange.ad")
	public String ajaxMemberStatusChange(Member m) {
		
		int result = memberService.memberStatusChange(m);
		if(result > 0) {
			return "Y";
		} else {
			return "N";
		}
	}
	
}
