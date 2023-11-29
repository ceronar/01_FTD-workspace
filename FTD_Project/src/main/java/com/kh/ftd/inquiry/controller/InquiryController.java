package com.kh.ftd.inquiry.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InquiryController {
	
	@RequestMapping("detail.in")
	public String selectIniquiry() {
		
		return "inquiry/inquiryDetailView";
	}
	
	@RequestMapping("list.in")
	public String selectIniquiryList() {
		
		return "inquiry/inquiryListView";
	}

}
