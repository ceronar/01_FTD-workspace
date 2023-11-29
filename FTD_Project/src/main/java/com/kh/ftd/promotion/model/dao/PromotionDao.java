package com.kh.ftd.promotion.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ftd.promotion.model.vo.Promotion;
import com.kh.ftd.seller.model.vo.Seller;

@Repository
public class PromotionDao {

	public ArrayList<Promotion> selectPromotionList(SqlSessionTemplate sqlSession) {
	
		return (ArrayList)sqlSession.selectList("promotionMapper.selectPromotionList");
	}

	public Seller selectSellerList(SqlSessionTemplate sqlSession, String sellerNo) {
	
		return sqlSession.selectOne("promotionMapper.selectSellerList", sellerNo);
	}

	
	

}
