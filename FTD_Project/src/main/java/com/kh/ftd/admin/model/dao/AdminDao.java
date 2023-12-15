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

	public Integer countMember(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.countMember");
	}

	public Integer countSeller(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.countSeller");
	}

	public Integer totalSales(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.totalSales");
	}

	public Integer countReviewBoard(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.countReviewBoard");
	}

	public Integer countInquiryBoard(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.countInquiryBoard");
	}

	public Integer countPromotionBoard(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.countPromotionBoard");
	}

	public Integer countGoodsSellBoard(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.countGoodsSellBoard");
	}

	public Integer countNoticeBoard(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.countNoticeBoard");
	}

	public ArrayList<Chart> dailyBoardCount(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.dailyBoardCount");
	}

	public ArrayList<Chart> dailyOrderPrice(SqlSession sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.dailyOrderPrice");
	}
}
