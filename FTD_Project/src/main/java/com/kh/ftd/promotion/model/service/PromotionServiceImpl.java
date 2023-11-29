package com.kh.ftd.promotion.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ftd.promotion.model.dao.PromotionDao;
import com.kh.ftd.promotion.model.vo.Promotion;
import com.kh.ftd.promotion.model.vo.PromotionFile;
import com.kh.ftd.promotion.model.vo.PromotionReply;
import com.kh.ftd.seller.model.vo.Seller;

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
	public Seller selectSellerList(String sellerNo) {
		// 
		return promotionDao.selectSellerList(sqlSession,sellerNo);
	}


//	@Override
//	public ArrayList<SellerFile> selectSellerFileProfileList() {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public ArrayList<PromotionFile> selectPromotionFileList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int PromotionReplyCount() {
		// TODO Auto-generated method stub
		return 0;
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
