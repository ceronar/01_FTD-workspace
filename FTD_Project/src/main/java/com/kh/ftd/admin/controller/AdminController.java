package com.kh.ftd.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ftd.admin.model.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("menu.ad")
	public String adminMenu(Model model) {
		
		// 전체 회원 수
		int totalUser = adminService.totalMember() + adminService.totalSeller();
		// 누적 전체 게시글 수
		int totalBoard = adminService.totalMemberBoard() + adminService.totalSellerBoard();
		// 누적 전체 매출
		int totalSales = adminService.totalSales();
		
		
		model.addAttribute("totalUser", totalUser)
			 .addAttribute("totalBoard", totalBoard)
			 .addAttribute("totalSales", totalSales);
		
		return "admin/adminMenu";
	}
	
	@RequestMapping("user.ad")
	public String userAdminPage() {
		return "admin/userAdminPage";
	}
}
