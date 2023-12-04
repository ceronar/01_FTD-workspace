package com.kh.ftd.promotion.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
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
	
	@RequestMapping(value = "pdlist.bo")
	public ModelAndView  promotionDetailView(int pno, ModelAndView mv) {
		
		ArrayList<PromotionFile> pfList = new ArrayList<PromotionFile>();
		System.out.println(pno);
		
		//1. 해당 게시글의 조회수 증가용 서비스 호출
				int result = promotionService.increaseCount(pno);
				
				// 2. 조회수 증가에 성공했다면 해당 게시글 상세조회 서비스 호출
				if(result > 0) { // 성공
					
					System.out.println("성공");
					
					//이 홍보게시글의 내용 , 조횟수
					Promotion p = promotionService.selectPromotion(pno);
					//System.out.println(p);
					
					//이 홍보게시글의 사진
					pfList = promotionService.selectPromotionFileList2(pno);
					//System.out.println(pfList);
					
					// 조회된 데이터를 담아서 상세보기 페이지로 포워딩
					mv.addObject("p", p)
					  .setViewName("promotion/promotionDetailView"); 
					// /WEB-INF/views/board/boardDetailView.jsp
					
				} else { // 실패
					
					// 에러문구를 담아서 에러페이지로 포워딩
					mv.addObject("errorMsg", "게시글 상세조회 실패")
					  .setViewName("common/errorPage");
				}
				
				return mv;
		
		
		
	}
	
	@ResponseBody
	@RequestMapping(value = "getLegacyData.bo" , produces = "application/json; charset=UTF-8")
	public String ajaxpromotionListView(int page, int size) {
		
		
		int promotionNo = 0;
		String sellerNo = "";
		
		
		
		//홍보리스트 내용
		ArrayList<Promotion> pList = promotionService.selectPromotionList();
		//System.out.println(pList); //홍보리스트 다 불어와짐
		
		//홍보리스트 판매자용 어레이 리스트
		ArrayList<Object> sList = new ArrayList<Object>();
		
		//홍보리스트 마켓프로필사진조회 어레이 리스트
		ArrayList<SellerFile> sfList = new ArrayList<SellerFile>();
		
		//홍보리스트 사진조회 어레이 리스트
		ArrayList<PromotionFile> pfList = new ArrayList<PromotionFile>();
		
		//댓글 개수 담을 곳
		ArrayList<Object> rList = new ArrayList<Object>();
		
	
			
		//진짜 다 담을 곳
				ArrayList<Object> arrList2 = new ArrayList<Object>();
		
		//총 DB의 홍보게시글개수
		int TOTAL_ITEMS = pList.size();
		//System.out.println(pList.size());
		
		int start = page * size;
		 
	    int end = Math.min(start + size, TOTAL_ITEMS);
		
		for(Promotion p : pList) {
			promotionNo = p.getPromotionNo();
			sellerNo = p.getSellerNo();
		
		//홍보리스트 판매자
		Seller sellerList = promotionService.selectSellerList(sellerNo);
		//System.out.println(sellerList);
		sList.add(sellerList);
		
		//홍보리스트 마켓프로필사진조회 리스트
		SellerFile sellerFileList = promotionService.selectSellerFileProfileList(sellerNo);
		//System.out.println(sellerFileList); 
		sfList.add(sellerFileList);
		
		//홍보리스트 사진조회 리스트
		PromotionFile pFileList = promotionService.selectPromotionFileList(promotionNo);
		//System.out.println(pFileList);
		pfList.add(pFileList);
		
		//각 홍보리스트 댓글갯수
		int replyList =  promotionService.PromotionReplyCount(promotionNo);
		//System.out.println(replyList); 
	
		rList.add(replyList);
		
		
		}
		
		//System.out.println(pList);
		//System.out.println(sList);
		//System.out.println(sfList);
		//System.out.println(pfList);
		//System.out.println(rList);
		
		

		
	
		
	
	  
//	  // * 테스트용
//	    ArrayList<String> list 
//					=  new ArrayList<String>();
//
		
	        for (int i = start; i < end; i++) {
	        	
	        	ArrayList<Object> arrList = new ArrayList<Object>();
	        	
	        	arrList.add(pList.get(i));
	        	arrList.add(sList.get(i));
	        	arrList.add(sfList.get(i));
	        	arrList.add(pfList.get(i));
	        	arrList.add(rList.get(i));
	        	
	        	//System.out.println(arrList);
	        	arrList2.add(arrList);
	        	//System.out.println(i); // 순서대로 0~4 5개라쳣을때
	    		
  }
	        //System.out.println(arrList2);
	       // System.out.println("*"+arrList2.size()); //띄워질요소사이즈

		// Gson gson = new Gson();
		// return gson.toJson(list);
		
	        return new Gson().toJson(arrList2);
	}
	
	
}
