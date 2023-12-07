package com.kh.ftd.admin.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDao {

	public int totalMember(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.totalMember");
	}

	public int totalSeller(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.totalSeller");
	}

	public int totalMemberBoard(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.totalMemberBoard");
	}

	public int totalSellerBoard(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.totalSellerBoard");
	}

	public int totalSales(SqlSession sqlSession) {
		return sqlSession.selectOne("adminMapper.totalSales");
	}



}
