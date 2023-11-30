package com.kh.ftd.inquiry.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ftd.common.model.vo.PageInfo;
import com.kh.ftd.common.template.Pagination;
import com.kh.ftd.inquiry.model.service.InquiryService;
import com.kh.ftd.inquiry.model.vo.Inquiry;

@Controller
public class InquiryController {
	
//	@Autowired
//	private InquiryService inquiryService;
//	
//	@GetMapping("list.in")
//	public ModelAndView selectIniquiryList(@RequestParam(value = "ipage", defaultValue = "1") int currentPage,
//			ModelAndView mv, String sellerNo) {
//		
//		int listCount = inquiryService.selectInquiryCount(sellerNo);
//		
//		int pageLimit = 5;
//		int boardLimit = 10;
//		
//		PageInfo pi = Pagination.getPageInfo(listCount, 
//						currentPage, pageLimit, boardLimit);
//		
//		ArrayList<Inquiry> list = inquiryService.selectInquiryList(pi, sellerNo);
//		
//		mv.addObject("list", list).addObject("pi", pi).setViewName("inquiry/inquiryListView");		
//		
//		return mv;
//	}
//
//	@RequestMapping("detail.in")
//	public String selectIniquiry() {
//		
//		return "inquiry/inquiryDetailView";
//	}
}
