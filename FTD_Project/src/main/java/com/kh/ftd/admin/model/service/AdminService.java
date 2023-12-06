package com.kh.ftd.admin.model.service;

public interface AdminService {
	
	// 전체 구매자 수 조회 (select)
	int totalMember();
	
	// 전체 판매자 수 조회 (select)
	int totalSeller();
	
	// 누적 전체 게시글 수 조회 (select)
	int totalBoard();
	
	// 누적 전체 매출(select)
	int totalSales();
	
}
