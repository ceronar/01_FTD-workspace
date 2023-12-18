package com.kh.ftd.promotion.model.service;

import java.util.ArrayList;

import com.kh.ftd.goods.model.vo.GoodsFile;
import com.kh.ftd.goods.model.vo.GoodsSell;
import com.kh.ftd.member.model.vo.Subscribe;
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
		Seller selectSellerList(int sellerNo);		
		
		//홍보리스트 마켓프로필사진조회
		SellerFile selectSellerFileProfileList(int sellerNo);
		
		//홍보리스트 사진조회
		ArrayList<PromotionFile> selectPromotionFileList(int promotionNo);
		
		//홍보리스트 댓글조회
		int PromotionReplyCount(int promotionNo); 
		
	
		
	//홍보리스트 작성하기 서비스
		int insertPromotion(Promotion p);
	
		int insertFile(PromotionFile pf);
		
	//홍보리스트 수정하기 서비스
		
		//int deletePromotionFile(int pno);
		
		int updatePromotion(Promotion p);
		
		int updateFile(PromotionFile pf);

	//홍보리스트 삭제하기 서비스
		
		int deletePromotion(int pno);
		
		int deletePromotionFile(int pno);

		
		
	// 홍보리스트 상세조회 서비스
	
		// 홍보리스트 조회수 증가
		int increaseCount(int promotionNo);
		
		// 홍보리스트 내용상세조회
		Promotion selectPromotion(int promotionNo);
		
		
		// 이 마켓의 평균별점조회
		double marketStarRating(int sellerNo);
		
		// 이 마켓의 후기갯수조회
		int reviewCount(int sellerNo);
		
	// 댓글 리스트 조회 서비스 
	ArrayList<PromotionReply> selectPromotionReplyList(int promotionNo);
		
	// 댓글 작성 서비스 
	int insertPromotionReply(PromotionReply pr);

	//댓글 삭제 서비스
	int deletePromotionReply(PromotionReply prno);

	//댓글 수정 서비스
	int updatePromotionReply(PromotionReply prno);

	
	//판매자 서브메뉴 그마켓 홍보리스트 조회
	ArrayList<Promotion> selectPromotionSellerList(int sellerNo);

	//이 마켓에서 지금 파는 상품
	ArrayList<GoodsSell> goodSell(int sno);

	//이 마켓에서 지금 파는 상품게시글의 이미지
	ArrayList<GoodsFile> goodFile(int sno);

	//찜기능
	int selectSubscribeCount(Subscribe s);

	int deleteSubscribeCount(Subscribe s);

	int insertSubscribeCount(Subscribe s);

	


	
	
	

	





	
	
}
