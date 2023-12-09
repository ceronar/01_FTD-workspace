package com.kh.ftd.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ftd.admin.model.vo.Chart;
import com.kh.ftd.common.model.vo.PageInfo;
import com.kh.ftd.member.model.vo.Member;

@Repository
public class AdminDao {

	public int countMember(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.countMember");
	}

	public int countSeller(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.countSeller");
	}

	public int totalSales(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.totalSales");
	}

	public int countReviewBoard(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.countReviewBoard");
	}

	public int countInquiryBoard(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.countInquiryBoard");
	}

	public int countPromotionBoard(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.countPromotionBoard");
	}

	public int countGoodsSellBoard(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.countGoodsSellBoard");
	}

	public int countNoticeBoard(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.countNoticeBoard");
	}

	public ArrayList<Chart> dailyBoardCount(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.dailyBoardCount");
	}

	public ArrayList<Chart> dailyOrderPrice(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.dailyOrderPrice");
	}
}
