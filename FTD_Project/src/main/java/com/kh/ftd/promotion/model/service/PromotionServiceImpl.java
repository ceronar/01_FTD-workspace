package com.kh.ftd.promotion.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ftd.promotion.model.dao.PromotionDao;
import com.kh.ftd.promotion.model.vo.Promotion;
import com.kh.ftd.promotion.model.vo.PromotionReply;

@Service
public class PromotionServiceImpl implements PromotionService{

	@Autowired
	private PromotionDao promotionDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Promotion> selectPromotionList() {
	
		return promotionDao.selectPromotionList(sqlSession);
	}

	@Override
	public int insertPromotion(Promotion p) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int increaseCount(int promotionNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Promotion selectPromotion(int promotionNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<PromotionReply> selectPromotionReplyList(int promotionNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertPromotionReply(PromotionReply pr) {
		// TODO Auto-generated method stub
		return 0;
	}

}
