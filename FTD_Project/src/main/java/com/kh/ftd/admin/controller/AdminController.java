package com.kh.ftd.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ftd.admin.model.service.AdminService;
import com.kh.ftd.member.model.service.MemberService;
import com.kh.ftd.seller.model.service.SellerService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("menu.ad")
	public String adminMenu(Model model) {
		
		// 전체 회원 수
		int totalUser = adminService.totalMember() + adminService.totalSeller();
		// 일일 가입 회원 수
		int dayMember;
		// 누적 전체 게시글 수
		int totalBoard;
		// 누적 전체 매출
		int totalSales;
		
		System.out.println(totalUser);
		
		
		
		return "admin/adminMenu";
	}
	
	
}
