package com.kh.ftd.seller.model.service;

import java.util.ArrayList;

import com.kh.ftd.common.model.vo.PageInfo;
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
	double ajaxSelectStarRating(int sellerNo);
	
	// 판매자 마켓 리뷰 수 조회 (select)
	int ajaxSelectReviews(int sellerNo);
	
	// 판매자 마켓 찜 수 조회 (select)
	int ajaxSelectSubscribeCount(int sellerNo);
	
	// 판매자 마켓 상세 조회 (select)
	Seller ajaxSelectSellerMarketList(int sellerNo);
		
	// 판매자 아이디 찾기 (selesct)
	String findSellerIdByEmail(String email);
	
	// 판매자 비밀번호 변경
	int updateSellerPwd(Seller s);
	
	// 판매자 리스트 페이징 조회 (관리자용)
	ArrayList<Seller> selectSellerList(PageInfo pi);
	
	// 판매자 상세조회
	Seller selectSeller(int sellerNo);
}
