package com.kh.ftd.promotion.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.ftd.promotion.model.service.PromotionService;
import com.kh.ftd.promotion.model.vo.Promotion;


@Controller
public class PromotionController {

	@Autowired
	private PromotionService promotionService;
	
	
	@ResponseBody
	@RequestMapping(value = "plist.bo", produces = "application/json; charset=UTF-8")
	public String ajaxSelectReplyList() {
		
		ArrayList<Promotion> list = promotionService.selectPromotionList();
		System.out.println(list);
		
		
		// Gson gson = new Gson();
		// return gson.toJson(list);
		
		return new Gson().toJson(list);
	}
	
	
}
