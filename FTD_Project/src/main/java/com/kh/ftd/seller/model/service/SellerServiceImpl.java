package com.kh.ftd.seller.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ftd.common.model.vo.PageInfo;
import com.kh.ftd.review.model.vo.Review;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ftd.seller.model.dao.SellerDao;
import com.kh.ftd.seller.model.vo.Seller;
import com.kh.ftd.seller.model.vo.SellerFile;

@Service
public class SellerServiceImpl implements SellerService{
	
	@Autowired
	private SellerDao sellerDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Seller loginSeller(Seller s) {
		return sellerDao.loginSeller(sqlSession, s);
	}

	@Override
	public int insertSeller(Seller s) {
		return sellerDao.insertSeller(sqlSession, s);
	}

	@Override
	public int updateSeller(Seller s) {
		return sellerDao.updateSeller(sqlSession, s);
	}

	@Override
	public int deleteSeller(String sellerId) {
		
		System.out.println(sellerId);
		
		return sellerDao.deleteSeller(sqlSession, sellerId);
	}

	@Override
	public int sellerIdCheck(String checkId) {
		return 0;
	}
	
	public ArrayList<Seller> selectSellerList() {
		return null;
	}
	
	@Override
	public ArrayList<Seller> ajaxSelectSellerList() {
		
		return sellerDao.ajaxSelectSellerList(sqlSession);
	}


	@Override
	public SellerFile ajaxSelectSellerFileList(int sellerNo) {
		
		return sellerDao.ajaxSelectSellerFileList(sqlSession, sellerNo);
	}

	@Override
	public double ajaxSelectStarRating(int sellerNo) {
		
		return sellerDao.ajaxSelectStarRating(sqlSession, sellerNo);
	}

	@Override
	public int ajaxSelectReviews(int sellerNo) {
	
		return sellerDao.ajaxSelectReviews(sqlSession, sellerNo);
	}

	@Override
	public int ajaxSelectSubscribeCount(int sellerNo) {
		
		return sellerDao.ajaxSelectSubscribeCount(sqlSession, sellerNo);
	}

	@Override
	public Seller ajaxSelectSellerMarketList(int sellerNo) {
		
		return sellerDao.ajaxSelectSellerMarketList(sqlSession, sellerNo);
	}
	
	
	@Override
    public String findSellerIdByEmail(String email) {
        return sellerDao.findId(sqlSession, email);
    }
	
	public int updateSellerPwd(Seller s) {
		return sellerDao.updateSellerPwd(sqlSession, s);
	}

	@Override
	public ArrayList<Seller> selectSellerList(PageInfo pi) {
		return sellerDao.selectSellerList(sqlSession, pi);
	}

	@Override
	public Seller selectSeller(int sellerNo) {
		return sellerDao.selectSeller(sqlSession, sellerNo);
	}

	@Override
	public int inactiveSeller(Seller s) {
		return sellerDao.inactiveSeller(sqlSession, s);
	}

	@Override
	public int activeSeller(int sellerNo) {
		return sellerDao.activeSeller(sqlSession, sellerNo);
	}
	
}
