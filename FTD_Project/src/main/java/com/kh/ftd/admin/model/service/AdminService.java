package com.kh.ftd.admin.model.service;

import java.util.ArrayList;

import com.kh.ftd.admin.model.vo.Chart;
import com.kh.ftd.common.model.vo.PageInfo;
import com.kh.ftd.member.model.vo.Member;

public interface AdminService {
	
	// 전체 구매자 수 조회 (select)
	int countMember();
	
	// 전체 판매자 수 조회 (select)
	int countSeller();
	
	// 누적 전체 매출(select)
	int totalSales();
	
	// 누적 전체 게시글수 용
	// 구매자가 쓴 리뷰 게시글수 조회 (select)
	int countReviewBoard();
	// 구매자가 쓴 문의 게시글수 조회 (select)
	int countInquiryBoard();
	// 판매자가 쓴 홍보 게시글수 조회 (select)
	int countPromotionBoard();
	// 판매자가 쓴 판매 게시글수 조회 (select)
	int countGoodsSellBoard();
	// 관리자가 쓴 공지 수 조회 (select)
	int countNoticeBoard();
	
	// 일주일간 일일 글 작성 수
	ArrayList<Chart> dailyBoardCount();
	// 일주일간 일일 매출
	ArrayList<Chart> dailyOrderPrice();
	
}
