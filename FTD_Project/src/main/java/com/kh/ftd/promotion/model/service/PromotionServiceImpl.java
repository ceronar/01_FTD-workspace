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
	public ArrayList<PromotionFile> selectPromotionFileList(int promotionNo) {
	
		return promotionDao.selectPromotionFileList(sqlSession,promotionNo);
	}

	@Override
	public int PromotionReplyCount(int promotionNo) {
		
		return promotionDao.selectPromotionReplyCount(sqlSession,promotionNo);
	}


	@Override
	public int insertPromotion(Promotion p) {
		
		return promotionDao.insertPromotion(sqlSession,p);
	}
	
	@Override
	public int insertFile(PromotionFile pf) {
		
		return promotionDao.insertFile(sqlSession,pf);
	}
	

	
	@Override
	public int updatePromotion(Promotion p) {
		
		return promotionDao.updatePromotion(sqlSession,p);
	}
	
	@Override
	public int updateFile(PromotionFile pf) {
		
		return promotionDao.updateFile(sqlSession, pf);
	}

	
	@Override
	public int deletePromotion(int pno) {

		return promotionDao.deletePromotion(sqlSession, pno);
	}

	@Override
	public int deletePromotionFile(int pno) {

		return promotionDao.deletePromotionFile(sqlSession, pno);
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
	
		return promotionDao.insertPromotionReply(sqlSession, pr);
	}

	@Override
	public int deletePromotionReply(PromotionReply prno) {
		
		return promotionDao.deletePromotionReply(sqlSession, prno);
	}

	@Override
	public int updatePromotionReply(PromotionReply prno) {

		return promotionDao.updatePromotionReply(sqlSession, prno);
	}

	@Override
	public ArrayList<Promotion> selectPromotionSellerList(int sellerNo) {
		
		return promotionDao.selectPromotionSellerList(sqlSession,sellerNo);
	}

	

	
	
	

	







	
}
