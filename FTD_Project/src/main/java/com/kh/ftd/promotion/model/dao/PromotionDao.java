package com.kh.ftd.promotion.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ftd.promotion.model.vo.Promotion;
import com.kh.ftd.promotion.model.vo.PromotionFile;
import com.kh.ftd.promotion.model.vo.PromotionReply;
import com.kh.ftd.seller.model.vo.Seller;
import com.kh.ftd.seller.model.vo.SellerFile;

@Repository
public class PromotionDao {

	public ArrayList<Promotion> selectPromotionList(SqlSessionTemplate sqlSession) {
	
		return (ArrayList)sqlSession.selectList("promotionMapper.selectPromotionList");
		
	}

	public Seller selectSellerList(SqlSessionTemplate sqlSession, int sellerNo) {
	
		return sqlSession.selectOne("promotionMapper.selectSellerList", sellerNo);
	}

	public SellerFile selectSellerFileProfileList(SqlSessionTemplate sqlSession, int sellerNo) {
	
	
		
		return sqlSession.selectOne("promotionMapper.selectSellerFileProfileList", sellerNo);
	}

	public PromotionFile selectPromotionFileList(SqlSessionTemplate sqlSession, int promotionNo) {
		
		return sqlSession.selectOne("promotionMapper.selectPromotionFileList", promotionNo);
	}

	public int selectPromotionReplyCount(SqlSessionTemplate sqlSession, int promotionNo) {
		
		return sqlSession.selectOne("promotionMapper.selectPromotionReplyCount", promotionNo);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int promotionNo) {
		
		return sqlSession.update("promotionMapper.increaseCount",promotionNo);
	}

	public Promotion selectPromotion(SqlSessionTemplate sqlSession, int promotionNo) {
	
		return sqlSession.selectOne("promotionMapper.selectPromotion",promotionNo);
	}

	public ArrayList<PromotionFile> selectPromotionFileList2(SqlSessionTemplate sqlSession, int promotionNo) {
		
		return (ArrayList)sqlSession.selectList("promotionMapper.selectPromotionFileList2",promotionNo);
	}

	public ArrayList<PromotionReply> selectPromotionReplyList(SqlSessionTemplate sqlSession, int promotionNo) {
		
		return (ArrayList)sqlSession.selectList("promotionMapper.selectPromotionReplyList",promotionNo);
	}

	public double marketStarRating(SqlSessionTemplate sqlSession, int sellerNo) {
		
		return sqlSession.selectOne("sellerMapper.ajaxSelectStarRating", sellerNo);
	}

	public int reviewCount(SqlSessionTemplate sqlSession, int sellerNo) {
		
		return sqlSession.selectOne("promotionMapper.reviewCount", sellerNo);
	}

	
	

}
