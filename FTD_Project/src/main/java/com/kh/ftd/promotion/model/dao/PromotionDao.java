package com.kh.ftd.promotion.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ftd.promotion.model.vo.Promotion;
import com.kh.ftd.promotion.model.vo.PromotionFile;
import com.kh.ftd.seller.model.vo.Seller;
import com.kh.ftd.seller.model.vo.SellerFile;

@Repository
public class PromotionDao {

	public ArrayList<Promotion> selectPromotionList(SqlSessionTemplate sqlSession) {
	
		return (ArrayList)sqlSession.selectList("promotionMapper.selectPromotionList");
		
	}

	public Seller selectSellerList(SqlSessionTemplate sqlSession, String sellerNo) {
	
		return sqlSession.selectOne("promotionMapper.selectSellerList", sellerNo);
	}

	public ArrayList<SellerFile> selectSellerFileProfileList(SqlSessionTemplate sqlSession, String sellerNo) {
	
	
		
		return (ArrayList)sqlSession.selectList("promotionMapper.selectSellerFileProfileList", sellerNo);
	}

	public ArrayList<PromotionFile> selectPromotionFileList(SqlSessionTemplate sqlSession, int promotionNo) {
		
		return (ArrayList)sqlSession.selectList("promotionMapper.selectPromotionFileList", promotionNo);
	}

	public int selectPromotionReplyCount(SqlSessionTemplate sqlSession, int promotionNo) {
		
		return sqlSession.selectOne("promotionMapper.selectPromotionReplyCount", promotionNo);
	}

	
	

}
