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
import com.kh.ftd.seller.model.vo.SellerFile;

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
	public Seller selectSellerList(int sellerNo) {
		// 
		return promotionDao.selectSellerList(sqlSession,sellerNo);
	}


	@Override
	public SellerFile selectSellerFileProfileList(int sellerNo) {
	
		return promotionDao.selectSellerFileProfileList(sqlSession,sellerNo);
	}

	@Override
	public PromotionFile selectPromotionFileList(int promotionNo) {
	
		return promotionDao.selectPromotionFileList(sqlSession,promotionNo);
	}

	@Override
	public int PromotionReplyCount(int promotionNo) {
		
		return promotionDao.selectPromotionReplyCount(sqlSession,promotionNo);
	}


	@Override
	public int insertPromotion(Promotion p) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public int insertFile(PromotionFile pf) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int increaseCount(int promotionNo) {
		
		return promotionDao.increaseCount(sqlSession,promotionNo);
	}

	@Override
	public Promotion selectPromotion(int promotionNo) {
	
		return promotionDao.selectPromotion(sqlSession, promotionNo);
	}
	
	@Override
	public ArrayList<PromotionFile> selectPromotionFileList2(int promotionNo) {
		
		return promotionDao.selectPromotionFileList2(sqlSession, promotionNo);
	}

	@Override
	public ArrayList<PromotionReply> selectPromotionReplyList(int promotionNo) {
		
		return promotionDao.selectPromotionReplyList(sqlSession,promotionNo);
	}
	
	@Override
	public double marketStarRating(int sellerNo) {
		
		return promotionDao.marketStarRating(sqlSession,sellerNo);
	}
	
	@Override
	public int reviewCount(int sellerNo) {
		
		return promotionDao.reviewCount(sqlSession,sellerNo);
	}

	@Override
	public int insertPromotionReply(PromotionReply pr) {
		// TODO Auto-generated method stub
		return 0;
	}

	







	
}
