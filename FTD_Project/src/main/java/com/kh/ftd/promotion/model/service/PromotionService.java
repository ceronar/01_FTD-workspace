package com.kh.ftd.promotion.model.service;

import java.util.ArrayList;

import com.kh.ftd.promotion.model.vo.Promotion;
import com.kh.ftd.promotion.model.vo.PromotionFile;
import com.kh.ftd.promotion.model.vo.PromotionReply;
import com.kh.ftd.seller.model.vo.Seller;
import com.kh.ftd.seller.model.vo.SellerFile;

public interface PromotionService {

	//전체 홍보리스트 조회
	
		//홍보리스트 내용 조회
		ArrayList<Promotion> selectPromotionList();
	
		//홍보리스트 판매자조회(마켓이름조회)
		Seller selectSellerList(String sellerNo);		
		
		//홍보리스트 마켓프로필사진조회
		ArrayList<SellerFile> selectSellerFileProfileList(String sellerNo);
		
		//홍보리스트 사진조회
		ArrayList<PromotionFile> selectPromotionFileList(int promotionNo);
		
		//홍보리스트 댓글조회
		int PromotionReplyCount(int promotionNo); 
		
	
		
	//홍보리스트 작성하기 서비스
	int insertPromotion(Promotion p);
	
	// 홍보리스트 상세조회 서비스
	
		// 홍보리스트 조회수 증가
		int increaseCount(int promotionNo);
		
		// 홍보리스트 상세조회
		Promotion selectPromotion(int promotionNo);

	// 댓글 리스트 조회 서비스 
	ArrayList<PromotionReply> selectPromotionReplyList(int promotionNo);
		
	// 댓글 작성 서비스 
	int insertPromotionReply(PromotionReply pr);



	
	
}
