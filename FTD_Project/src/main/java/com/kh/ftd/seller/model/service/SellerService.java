package com.kh.ftd.seller.model.service;

import java.util.ArrayList;

import com.kh.ftd.review.model.vo.Review;
import com.kh.ftd.seller.model.vo.Seller;
import com.kh.ftd.seller.model.vo.SellerFile;

public interface SellerService {
	
	
	// 판매자 로그인 (select)
	Seller loginSeller(Seller s);
		
	// 판매자 회원가입 (insert)
	int insertSeller(Seller s);
		
	// 판매자 회원정보수정 (update)
	int updateSeller(Seller s);
	
	// 판매자 회원탈퇴 (update)
	int deleteSeller(String sellerId);
	
	// 판매자 아이디중복체크 (select)
	int sellerIdCheck(String checkId);
	
	// 판매자 마켓 조회 (select)
	ArrayList<Seller> ajaxSelectSellerList();
	
	// 판매자 마켓 파일 조회 (select)
	SellerFile ajaxSelectSellerFileList(int sellerNo);
	
	// 판매자 마켓 평균 별점 조회 (select)
	int ajaxSelectStarRating(int sellerNo);
	
	// 판매자 마켓 리뷰 수 조회 (select)
	int ajaxSelectReviews(int sellerNo);
	
	// 판매자 마켓 찜 수 조회 (select)
	int ajaxSelectSubscribe(int sellerNo);
}
