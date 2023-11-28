package com.kh.ftd.iniquiry.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IniquiryController {
	
	@RequestMapping("detail.in")
	public String selectIniquiry() {
		
		return "iniquiry/iniquiryDetailView";
	}
	
	@RequestMapping("list.in")
	public String selectIniquiryList() {
		
		return "iniquiry/iniquiryListView";
	}

}
