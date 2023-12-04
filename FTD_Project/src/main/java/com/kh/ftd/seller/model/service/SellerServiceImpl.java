package com.kh.ftd.seller.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ftd.seller.model.dao.SellerDao;
import com.kh.ftd.seller.model.vo.Seller;

@Service
public class SellerServiceImpl implements SellerService{
	
	@Autowired
	private SellerDao sellerDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public Seller loginSeller(Seller s) {
		return sellerDao.loginSeller(sqlSession, s);
	}

	@Override
	public int insertSeller(Seller s) {
		return 0;
	}

	@Override
	public int updateSeller(Seller s) {
		return 0;
	}

	@Override
	public int deleteSeller(String sellerId) {
		return 0;
	}

	@Override
	public int sellerIdCheck(String checkId) {
		return 0;
	}

	@Override
	public ArrayList<Seller> selectSellerList() {
		return null;
	}

}
