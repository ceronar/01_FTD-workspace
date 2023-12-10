package com.kh.ftd.admin.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ftd.admin.model.dao.AdminDao;
import com.kh.ftd.admin.model.vo.Chart;
import com.kh.ftd.common.model.vo.PageInfo;
import com.kh.ftd.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	// 전체 구매자 수 조회 (select)
	@Override
	public int countMember() {
		return adminDao.countMember(sqlSession);
	}
	// 전체 판매자 수 조회 (select)
	@Override
	public int countSeller() {
		return adminDao.countSeller(sqlSession);
	}
	// 누적 전체 매출(select)
	@Override
	public int totalSales() {
		return adminDao.totalSales(sqlSession);
	}
	
	// 구매자가 쓴 리뷰 게시글수 조회 (select)
	@Override
	public int countReviewBoard() {
		return adminDao.countReviewBoard(sqlSession);
	}
	// 구매자가 쓴 문의 게시글수 조회 (select)
	@Override
	public int countInquiryBoard() {
		return adminDao.countInquiryBoard(sqlSession);
	}
	// 판매자가 쓴 홍보 게시글수 조회 (select)
	@Override
	public int countPromotionBoard() {
		return adminDao.countPromotionBoard(sqlSession);
	}
	// 판매자가 쓴 판매 게시글수 조회 (select)
	@Override
	public int countGoodsSellBoard() {
		return adminDao.countGoodsSellBoard(sqlSession);
	}
	// 관리자가 쓴 공지 수 조회 (select)
	@Override
	public int countNoticeBoard() {
		return adminDao.countNoticeBoard(sqlSession);
	}
	
	// 일주일간 일일 글 작성 수
	@Override
	public ArrayList<Chart> dailyBoardCount() {
		return adminDao.dailyBoardCount(sqlSession);
	}
	// 일주일간 일일 매출
	@Override
	public ArrayList<Chart> dailyOrderPrice() {
		return adminDao.dailyOrderPrice(sqlSession);
	}
}
