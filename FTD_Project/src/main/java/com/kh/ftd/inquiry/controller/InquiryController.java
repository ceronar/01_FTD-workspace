package com.kh.ftd.inquiry.controller;

import java.util.ArrayList;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.ftd.inquiry.model.service.InquiryService;
import com.kh.ftd.inquiry.model.vo.Inquiry;

@Controller
public class InquiryController {
	
	@Autowired
	private InquiryService inquiryService;
	
	@RequestMapping("list.in")
	public ModelAndView selectInquiryList(String sellerNo,
										  ModelAndView mv) {
		mv.addObject("sellerNo", sellerNo).setViewName("inquiry/inquiryListView");
		
//		System.out.println(sellerNo);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="ajaxSelectList.in")
	public void ajaxSelectInquiryList(int sellerNo, String page, String pageSize) {
		
		int inquiryNo =0;
		
		System.out.println("page : " + page);
		System.out.println("size : " + pageSize);
		System.out.println("sellerNo : " + sellerNo);
		
		ArrayList<Inquiry> list = inquiryService.ajaxSelectInquiryList(sellerNo);
		
//		int totalItems = list.size();
//		
//		int start = page * size;
//		
//		int end = Math.min(start + size, totalItems);
		
//		System.out.println(list);
		
	}
}
