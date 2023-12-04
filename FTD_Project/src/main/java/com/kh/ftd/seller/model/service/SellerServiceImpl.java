package com.kh.ftd.seller.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ftd.review.model.vo.Review;
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertSeller(Seller s) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateSeller(Seller s) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteSeller(String sellerId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int sellerIdCheck(String checkId) {
		// TODO Auto-generated method stub
		return 0;
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
	public int ajaxSelectStarRating(int sellerNo) {
		
		return sellerDao.ajaxSelectStarRating(sqlSession, sellerNo);
	}

	@Override
	public int ajaxSelectReviews(int sellerNo) {
	
		return sellerDao.ajaxSelectReviews(sqlSession, sellerNo);
	}

	@Override
	public int ajaxSelectSubscribe(int sellerNo) {
		
		return sellerDao.ajaxSelectSubscribe(sqlSession, sellerNo);
	}
	

}
