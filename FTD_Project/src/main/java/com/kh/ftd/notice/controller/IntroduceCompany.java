package com.kh.ftd.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class IntroduceCompany {
	
	@RequestMapping(value = "/IntroduceCompany", method = RequestMethod.GET)
	public String showIntroduceCompany() {
		return "common/IntroduceCompany";
	}
}
