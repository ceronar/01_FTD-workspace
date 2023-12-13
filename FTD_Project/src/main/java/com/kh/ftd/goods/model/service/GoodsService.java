package com.kh.ftd.goods.model.service;

import java.util.ArrayList;

import com.kh.ftd.goods.model.vo.Goods;
import com.kh.ftd.goods.model.vo.GoodsFile;
import com.kh.ftd.goods.model.vo.GoodsSell;

public interface GoodsService {

	// 상품 리스트 조회 (select)
	ArrayList<Goods> ajaxSelectGoodsList();
	
	// 상품 판매 정보 조회 (select)
	GoodsSell ajaxSelectGoodsSellList(int goodNo);
	
	// 상품 마켓 파일 조회 (select)
	GoodsFile ajaxSelectGoodsFileList(int sellNo);
	
	// 상품 마켓 평균 별점 조회 (select)
	double ajaxSelectStarRating(int goodNo);
	
	// 상품 마켓 리뷰 수 조회 (select)
	int ajaxSelectReviews(int goodNo);
	
	// 판매자 상품 리스트 조회 (select)
	ArrayList<Goods> ajaxSelectSellerGoodsList(int sellerNo);
	
	// 판매자 상품 등록 (insert)
	int insertSellerGoods(Goods goods);
	
	// 판매자 상품 글 리스트 조회 (select)
	ArrayList<GoodsSell> ajaxSelectSellerGoodsTextList(int sellerNo);
	
	// 판매자 상품 정보 조회 (select)
	Goods ajaxSelectGoodsByGoodNo(int goodNo);
	
	// 판매자 상품 글 메인 파일 조회 (select)
	GoodsFile ajaxSelectGoodsMainFileList(int sellNo);
	
	// 판매자  상품 글 댓글 조회 (select)
	int ajaxSelectReplyCount(int sellNo);
	
	// 주문에 속한 상품 리스트 조회
	ArrayList<Goods> memberOrderDetail(int orderNo);
	
	// 구매자 좋아요 상품 리스트 조회
	ArrayList<Goods> memberLikeList(int memberNo);
}
