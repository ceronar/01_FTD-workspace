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

	@Override
	public int insertSellerGoods(Goods goods) {
		
		return goodsDao.insertSellerGoods(sqlSession, goods);
	}

	@Override
	public ArrayList<GoodsSell> ajaxSelectSellerGoodsTextList(int sellerNo) {
	
		return goodsDao.ajaxSelectSellerGoodsTextList(sqlSession, sellerNo);
	}

	@Override
	public Goods ajaxSelectGoodsByGoodNo(int goodNo) {
		
		return goodsDao.ajaxSelectGoodsByGoodNo(sqlSession, goodNo);
	}

	@Override
	public GoodsFile ajaxSelectGoodsMainFileList(int sellNo) {

		return goodsDao.ajaxSelectGoodsMainFileList(sqlSession, sellNo);
	}

	@Override
	public int ajaxSelectReplyCount(int sellNo) {

		return goodsDao.ajaxSelectReplyCount(sqlSession, sellNo);
	}
	
	@Override
	public ArrayList<Goods> memberOrderDetail(int orderNo) {

		return goodsDao.memberOrderDetail(sqlSession, orderNo);
	}

	@Override
	public ArrayList<Goods> memberLikeList(int memberNo) {
		return goodsDao.memberLikeList(sqlSession, memberNo);
	}


}
