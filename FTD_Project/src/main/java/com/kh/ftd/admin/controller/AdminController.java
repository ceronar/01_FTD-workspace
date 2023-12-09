package com.kh.ftd.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ftd.admin.model.service.AdminService;
import com.kh.ftd.admin.model.vo.Chart;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
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
	public String userAdminPage() {
		return "admin/userAdminPage";
	}
}
