package com.kh.ftd.inquiry.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.ftd.inquiry.model.service.InquiryService;
import com.kh.ftd.inquiry.model.vo.Inquiry;

@Controller
public class InquiryController {
	
	@Autowired
	private InquiryService inquiryService;
	
	@ResponseBody
	@RequestMapping(value="ajaxSelectList.in")
	public void ajaxSelectInquiryList(int sellerNo, int page, int size) {
		
		int inquiryNo =0;
		
		ArrayList<Inquiry> list = inquiryService.ajaxSelectInquiryList(sellerNo);
		
//		int totalItems = list.size();
//		
//		int start = page * size;
//		
//		int end = Math.min(start + size, totalItems);
		
		System.out.println(list);
		
	}
}
