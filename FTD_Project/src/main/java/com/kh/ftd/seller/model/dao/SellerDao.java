package com.kh.ftd.seller.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ftd.review.model.vo.Review;
import com.kh.ftd.seller.model.vo.Seller;
import com.kh.ftd.seller.model.vo.SellerFile;

@Repository
public class SellerDao {

	public ArrayList<Seller> ajaxSelectSellerList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("sellerMapper.ajaxSelectSellerList");
	}
	
	public SellerFile ajaxSelectSellerFileList(SqlSessionTemplate sqlSession, int sellerNo) {
		
		return sqlSession.selectOne("sellerMapper.ajaxSelectSellerFileList", sellerNo);
	}
	
	public int ajaxSelectStarRating(SqlSessionTemplate sqlSession, int sellerNo) {
		
		return sqlSession.selectOne("sellerMapper.ajaxSelectStarRating", sellerNo);
	}
	
	public int ajaxSelectReviews(SqlSessionTemplate sqlSession, int sellerNo) {
		
		return sqlSession.selectOne("sellerMapper.ajaxSelectReviews", sellerNo);
	}
	
	public int ajaxSelectSubscribe(SqlSessionTemplate sqlSession, int sellerNo) {
		
		return sqlSession.selectOne("sellerMapper.ajaxSelectSubscribe", sellerNo);
	}
}
