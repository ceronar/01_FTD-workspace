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
	
	// 주문에 속한 상품 리스트 조회
	ArrayList<Goods> memberOrderDetail(int orderNo);
}
