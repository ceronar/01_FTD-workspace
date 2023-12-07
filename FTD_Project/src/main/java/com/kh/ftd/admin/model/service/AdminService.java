package com.kh.ftd.admin.model.service;

public interface AdminService {
	
	// 전체 구매자 수 조회 (select)
	int totalMember();
	
	// 전체 판매자 수 조회 (select)
	int totalSeller();
	
	// 누적 전체 게시글수 용
	// 구매자가 쓴 리뷰, 문의 게시글수 조회 (select)
	int totalMemberBoard();
	
	// 판매자가 쓴 홍보 게시글수 조회 (select)
	int totalSellerBoard();
	
	// 누적 전체 매출(select)
	int totalSales();
	
}
