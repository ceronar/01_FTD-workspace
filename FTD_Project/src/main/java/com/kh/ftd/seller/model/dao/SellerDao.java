package com.kh.ftd.seller.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ftd.seller.model.vo.Seller;

@Repository
public class SellerDao {

	public Seller loginSeller(SqlSession sqlSession, Seller s) {
		return sqlSession.selectOne("sellerMapper.loginSeller", s);
	}

}
