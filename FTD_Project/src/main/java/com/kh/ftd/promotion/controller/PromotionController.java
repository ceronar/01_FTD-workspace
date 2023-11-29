package com.kh.ftd.promotion.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.ftd.promotion.model.service.PromotionService;
import com.kh.ftd.promotion.model.vo.Promotion;
import com.kh.ftd.promotion.model.vo.PromotionFile;
import com.kh.ftd.seller.model.vo.Seller;
import com.kh.ftd.seller.model.vo.SellerFile;


@Controller
public class PromotionController {

	@Autowired
	private PromotionService promotionService;
	
	@RequestMapping(value = "plist.bo")
	public String promotionListView() {
		
		return "promotion/promotionListView";
	}
	
	@ResponseBody
	@RequestMapping(value = "getLegacyData.bo" , produces = "application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int page, int size) {
		
		
		int promotionNo = 0;
		String sellerNo = "";
		
		//홍보리스트 내용
		ArrayList<Promotion> pList = promotionService.selectPromotionList();
		//System.out.println(pList);
		
		//다 담을곳 
		ArrayList<Object> arrList = new ArrayList<Object>();
		
		for(Promotion p : pList) {
			promotionNo = p.getPromotionNo();
			sellerNo = p.getSellerNo();
		
		//홍보리스트 판매자
		Seller sellerList = promotionService.selectSellerList(sellerNo);
		//System.out.println(sellerList);
	
		//홍보리스트 마켓프로필사진조회 리스트
		ArrayList<SellerFile> sellerFileList = promotionService.selectSellerFileProfileList(sellerNo);
		//System.out.println(sellerFileList);
		
		//홍보리스트 사진조회 리스트
		ArrayList<PromotionFile> pFileList = promotionService.selectPromotionFileList(promotionNo);
		//System.out.println(pFileList);
		
		//각 홍보리스트 댓글갯수
		int replyList =  promotionService.PromotionReplyCount(promotionNo);
		//System.out.println(replyList);
	
		
		
		
		arrList.add(pList);
		arrList.add(sellerList);
		arrList.add(sellerFileList);
		arrList.add(pFileList);
		arrList.add(replyList);
		
		}
		
		System.out.println(arrList);
		
		int TOTAL_ITEMS = 100;
		
		int start = page * size;
		 
	    int end = Math.min(start + size, TOTAL_ITEMS);
		
		
	   
	    ArrayList<String> list 
					=  new ArrayList<String>();

		
	        for (int i = start; i < end; i++) {
	        	
	        	list.add(new String("Legacy Item " + i));
	    	
	   }
	        System.out.println(list);

		// Gson gson = new Gson();
		// return gson.toJson(list);
		
	        return new Gson().toJson(list);
	}
	
	
}
