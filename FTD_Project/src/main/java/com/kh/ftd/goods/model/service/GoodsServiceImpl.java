package com.kh.ftd.goods.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ftd.goods.model.dao.GoodsDao;
import com.kh.ftd.goods.model.vo.Goods;
import com.kh.ftd.goods.model.vo.GoodsFile;
import com.kh.ftd.goods.model.vo.GoodsSell;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsDao goodsDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Goods> ajaxSelectGoodsList() {

		return goodsDao.ajaxSelectGoodsList(sqlSession);
	}
	
	@Override
	public GoodsSell ajaxSelectGoodsSellList(int goodNo) {
		
		return goodsDao.ajaxSelectGoodsSellList(sqlSession, goodNo);
	}

	@Override
	public GoodsFile ajaxSelectGoodsFileList(int sellNo) {

		return goodsDao.ajaxSelectGoodsFileList(sqlSession, sellNo);
	}

	@Override
	public double ajaxSelectStarRating(int goodNo) {

		return goodsDao.ajaxSelectStarRating(sqlSession, goodNo);
	}

	@Override
	public int ajaxSelectReviews(int goodNo) {

		return goodsDao.ajaxSelectReviews(sqlSession, goodNo);
	}

	@Override
	public ArrayList<Goods> ajaxSelectSellerGoodsList(int sellerNo) {

		return goodsDao.ajaxSelectSellerGoodsList(sqlSession, sellerNo);
	}


}
