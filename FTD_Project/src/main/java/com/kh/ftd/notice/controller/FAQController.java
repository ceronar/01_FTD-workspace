package com.kh.ftd.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FAQController {

    @RequestMapping(value = "/FAQ", method = RequestMethod.GET)
    public String showFAQPage() {
        return "common/FAQ"; // Assuming your HTML file is named "faq.html"
    }
}
