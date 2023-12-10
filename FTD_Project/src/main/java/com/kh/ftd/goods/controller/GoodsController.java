package com.kh.ftd.goods.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.ftd.goods.model.service.GoodsService;
import com.kh.ftd.goods.model.vo.Goods;
import com.kh.ftd.goods.model.vo.GoodsFile;
import com.kh.ftd.goods.model.vo.GoodsSell;

@Controller
public class GoodsController {

	@Autowired
	private GoodsService goodsService;
	
	// 상품 페이지 이동
	@RequestMapping("list.go")
	public String goodsList() {
		
		return "goods/goodsListView";
	}
	
	// 상품 리스트 조회
	@ResponseBody
	@RequestMapping(value = "ajaxSelectGoodsList.go" , produces = "application/json; charset=UTF-8")
	public String ajaxSelectGoodsList(int page, int pageSize) {
		
		// 상품 리스트
		ArrayList<Goods> gList = goodsService.ajaxSelectGoodsList();
		
		System.out.println(gList);
		
		// 상품 판매 정보
		ArrayList<GoodsSell> gsList = new ArrayList<>();
		
		// 상품 파일
		ArrayList<GoodsFile> gfList = new ArrayList<>();
		
		// 상품 평균 별점
		ArrayList<Object> starList = new ArrayList<>();
		
		// 상품 댓글 수
		ArrayList<Object> reviewList = new ArrayList<>();
	
		// 상품 총 리스트 수
		int totalList = gList.size();
		
		System.out.println(totalList);
		
		int startPage = page * pageSize;
		
		int endPage = Math.min(startPage + pageSize, totalList);		
		
		for(Goods g : gList) {
			
			int goodNo = g.getGoodNo();
			// System.out.println(sellerNo);
			
			// 상품 판매 정보
			GoodsSell goodsSell = goodsService.ajaxSelectGoodsSellList(goodNo);
			
			int sellNo = 0; // sellNo 변수 셋팅
			
			if(goodsSell != null) { // 상품 판매 정보가 있을 시
				sellNo = goodsSell.getSellNo();
				gsList.add(goodsSell);			
			
			} else { // 상품 판매 정보가 없을 시
				
				
			}
			
			// 상품 파일
			GoodsFile goodsFile = goodsService.ajaxSelectGoodsFileList(sellNo);
			if(goodsFile != null) { // 상품 파일이 있을 시
				
				gfList.add(goodsFile);
			
			} else { // 상품 파일이 없을 시
				
				
			}
			
			// 상품 평균 별점
			double starRating = goodsService.ajaxSelectStarRating(goodNo);
			starList.add(starRating);
			
			// 상품 댓글 수
			int reviews = goodsService.ajaxSelectReviews(goodNo);
			reviewList.add(reviews);
	
		}
		
		ArrayList<Object> resultList = new ArrayList<>();
		
		for (int i = startPage; i < endPage; i++) {
			
			ArrayList<Object> arrList = new ArrayList<>();
			
			arrList.add(gList.get(i));
			arrList.add(gsList.get(i));
			arrList.add(gfList.get(i));
			arrList.add(starList.get(i));
			arrList.add(reviewList.get(i));
			
			// 상품 전체 리스트
			resultList.add(arrList);		
			
		}	
		System.out.println(startPage);
		System.out.println(endPage);
		
		return new Gson().toJson(resultList);			
	}
	
}
