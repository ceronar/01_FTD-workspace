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

	public int dayMember(SqlSession sqlSession) {
		return 0;
	}

	public int totalBoard(SqlSession sqlSession) {
		return 0;
	}

	public int totalSales(SqlSession sqlSession) {
		return 0;
	}

}
