package com.kh.ftd.seller.model.service;

import java.util.ArrayList;

import com.kh.ftd.common.model.vo.PageInfo;
import com.kh.ftd.member.model.vo.Subscribe;
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
	
	// 판매자 정지
	int inactiveSeller(Seller s);
	
	// 판매자 활성화
	int activeSeller(int sellerNo);

	// 업데이트시 프로필 사진 업로드
	int sellerFile(SellerFile sf);

	// 판매자 마이페이지 사진 불러오기 준비
	SellerFile getSellerFile(int sellerNo);

	// 업데이트시 기존 프로필 이미지 제거
	int deleteSellerFile(int sellerNo);
	
	// 구매자 찜한 목록 조회
	ArrayList<Seller> memberSubscribeList(int memberNo);
	
	// 판매자 배송 상태 변경 메소드 to Y
	int sellerOrderDetailChangeStatusToY(int orderDetailNo);
	// 판매자 배송 상태 변경 메소드 to E
	int sellerOrderDetailChangeStatusToE(int orderDetailNo);
	
	// 추천가게 리스트 조회 top 10
	ArrayList<Seller> sellerListTop();
}
