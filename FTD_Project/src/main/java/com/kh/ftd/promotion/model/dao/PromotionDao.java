package com.kh.ftd.promotion.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ftd.promotion.model.vo.Promotion;

@Repository
public class PromotionDao {

	public ArrayList<Promotion> selectPromotionList(SqlSessionTemplate sqlSession) {
	
		
		
		return (ArrayList)sqlSession.selectList("promotionMapper.selectReplyList");
	}

}
