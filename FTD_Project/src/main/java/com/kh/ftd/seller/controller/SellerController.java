package com.kh.ftd.seller.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ftd.seller.model.service.SellerService;

@Controller
public class SellerController {

	@Autowired
	private SellerService sellerService;
	
	@RequestMapping("list.se")
	public String sellerList() {
		
		return "seller/sellerListView";
	}
	
	@RequestMapping(value = "ajaxSelectSellerList.se" , produces = "application/json; charset=UTF-8")
	public String ajaxSelectSellerList(int page, int pageSize) {
		
	}
}
