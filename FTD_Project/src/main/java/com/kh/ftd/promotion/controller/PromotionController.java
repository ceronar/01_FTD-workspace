package com.kh.ftd.promotion.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.ftd.promotion.model.service.PromotionService;

import com.kh.ftd.promotion.model.vo.Promotion;
import com.kh.ftd.promotion.model.vo.PromotionFile;
import com.kh.ftd.seller.model.vo.Seller;


@Controller
public class PromotionController {

	@Autowired
	private PromotionService promotionService;
	
	
	
	@RequestMapping(value = "plist.bo")
	public String ajaxSelectReplyList() {
		
		
		int promotionNo = 0;
		String sellerNo = "";
		//홍보리스트 내용
		ArrayList<Promotion> pList = promotionService.selectPromotionList();
		//System.out.println(pList);
		
		for(Promotion p : pList) {
			promotionNo = p.getPromotionNo();
			sellerNo = p.getSellerNo();
		

		Seller sellerList = promotionService.selectSellerList(sellerNo);
		System.out.println(sellerList);
	
//		ArrayList<SellerFile> sellerFileList = promotionService.selectSellerFileProfileList();
//		
//		ArrayList<PromotionFile> pFileList = promotionService.selectPromotionFileList();
//		
//		int replyList =  promotionService.PromotionReplyCount();
	
		}
		
		// Gson gson = new Gson();
		// return gson.toJson(list);
		
		return "";
	}
	
	
}
