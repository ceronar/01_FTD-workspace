package com.kh.ftd.seller.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ftd.review.model.vo.Review;
import com.kh.ftd.seller.model.vo.Seller;
import com.kh.ftd.seller.model.vo.SellerFile;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.ftd.seller.model.vo.Seller;

@Repository
public class SellerDao {

	public ArrayList<Seller> ajaxSelectSellerList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("sellerMapper.ajaxSelectSellerList");
	}
	
	public SellerFile ajaxSelectSellerFileList(SqlSessionTemplate sqlSession, int sellerNo) {
		
		return sqlSession.selectOne("sellerMapper.ajaxSelectSellerFileList", sellerNo);
	}
	
	public double ajaxSelectStarRating(SqlSessionTemplate sqlSession, int sellerNo) {
		
		return sqlSession.selectOne("sellerMapper.ajaxSelectStarRating", sellerNo);
	}
	
	public int ajaxSelectReviews(SqlSessionTemplate sqlSession, int sellerNo) {
		
		return sqlSession.selectOne("sellerMapper.ajaxSelectReviews", sellerNo);
	}
	
	public int ajaxSelectSubscribeCount(SqlSessionTemplate sqlSession, int sellerNo) {
		
		return sqlSession.selectOne("sellerMapper.ajaxSelectSubscribeCount", sellerNo);
	}

	public Seller loginSeller(SqlSession sqlSession, Seller s) {
		return sqlSession.selectOne("sellerMapper.loginSeller", s);
	}

	public int insertSeller(SqlSessionTemplate sqlSession, Seller s) {

		return sqlSession.insert("sellerMapper.insertSeller", s);
	}
	
	public Seller ajaxSelectSellerMarketList(SqlSessionTemplate sqlSession, int sellerNo) {
		
		return sqlSession.selectOne("sellerMapper.ajaxSelectSellerMarketList", sellerNo);
	}

	public String findId(SqlSessionTemplate sqlSession, String email) {

		return sqlSession.selectOne("sellerMapper.findId", email);
	}

	public int updateSeller(SqlSessionTemplate sqlSession, Seller s) {

		return sqlSession.update("sellerMapper.updateSeller", s);
	}

}
