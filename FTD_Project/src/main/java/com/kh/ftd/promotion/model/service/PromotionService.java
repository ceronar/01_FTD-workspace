package com.kh.ftd.promotion.model.service;

import java.util.ArrayList;

import com.kh.ftd.promotion.model.vo.Promotion;
import com.kh.ftd.promotion.model.vo.PromotionReply;

public interface PromotionService {

	//전체 홍보리스트 조회(ajax)
	ArrayList<Promotion> selectPromotionList();
	
	//홍보리스트 작성하기 서비스
	int insertPromotion(Promotion p);
	
	// 홍보리스트 상세조회 서비스
	// 홍보리스트 조회수 증가
	int increaseCount(int promotionNo);
	

	// 댓글 리스트 조회 서비스 
	ArrayList<PromotionReply> selectPromotionReplyList(int promotionNo);
		
	// 댓글 작성 서비스 
	int insertPromotionReply(PromotionReply pr);

	// 홍보리스트 상세조회
	Promotion selectPromotion(int promotionNo);

	// 댓글 리스트 조회 서비스 (ajax)
	ArrayList<Reply> selectReplyList(int boardNo);
	
	// 댓글 작성 서비스 (ajax)
	int insertReply(Reply r);

	
	
}
