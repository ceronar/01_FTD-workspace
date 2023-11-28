package com.kh.ftd.seller.model.service;

import java.util.ArrayList;

import com.kh.ftd.seller.model.vo.Seller;

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
	
	// 판매자 회원 목록 조회 (select)
	ArrayList<Seller> selectSellerList();
	
}
