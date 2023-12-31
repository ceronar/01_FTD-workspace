package com.kh.ftd.goods.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ftd.goods.model.dao.GoodsDao;
import com.kh.ftd.goods.model.vo.Goods;
import com.kh.ftd.goods.model.vo.GoodsFile;
import com.kh.ftd.goods.model.vo.GoodsSell;
import com.kh.ftd.goods.model.vo.SellReply;
import com.kh.ftd.member.model.vo.Like;
import com.kh.ftd.order.model.vo.Cart;
import com.kh.ftd.order.model.vo.OrderGoods;
import com.kh.ftd.review.model.vo.Review;

@Service
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	private GoodsDao goodsDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<GoodsSell> ajaxSelectGoodsSellList() {

		return goodsDao.ajaxSelectGoodsSellList(sqlSession);
	}
	
	@Override
	public Goods ajaxSelectGoodsList(int goodNo) {
		
		return goodsDao.ajaxSelectGoodsList(sqlSession, goodNo);
	}

	@Override
	public double ajaxSelectStarRating(int goodNo) {

		return goodsDao.ajaxSelectStarRating(sqlSession, goodNo);
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

	@Override
	public ArrayList<Goods> ajaxSelectSellerGoodTitle(int sellerNo) {
		
		return goodsDao.ajaxSelectSellerGoodTitle(sqlSession, sellerNo);
	}

	@Override
	public int insertSellerGoodsText(GoodsSell goodsSell) {
	
		return goodsDao.insertSellerGoodsText(sqlSession, goodsSell);
	}

	@Override
	public int updateGoodsCount(int sellNo) {
			
		return goodsDao.updateGoodsCount(sqlSession, sellNo);
	}

	@Override
	public GoodsSell selectGoodsSell(int sellNo) {
		
		return goodsDao.selectGoodsSell(sqlSession, sellNo);
	}

	@Override
	public Goods selectGoodsByGoodNo(int goodNo) {

		return goodsDao.selectGoodsByGoodNo(sqlSession, goodNo);
	}

	@Override
	public int updateBuyGoodsStock(OrderGoods orderGoods) {
		return goodsDao.updateBuyGoodsStock(sqlSession, orderGoods);
	}

	@Override
	public int insertCart(Cart cart) {
		
		return goodsDao.insertCart(sqlSession, cart);
	}

	@Override
	public int selectLike(Like like) {

		return goodsDao.selectLike(sqlSession, like);
	}

	@Override
	public int deleteLike(Like like) {
		
		return goodsDao.deleteLike(sqlSession, like);
	}

	@Override
	public int insertLike(Like like) {
	
		return goodsDao.insertLike(sqlSession, like);
	}

	@Override
	public int insertGoodsFile(GoodsFile goodsFile) {
		
		return goodsDao.insertGoodsFile(sqlSession, goodsFile);
	}

	@Override
	public GoodsSell selectGoodsTextByGoodNo(int goodNo) {
		
		return goodsDao.selectGoodsTextByGoodNo(sqlSession, goodNo);
	}

	@Override
	public int updateSellerGoodsText(GoodsSell goodsSell) {
		
		return goodsDao.updateSellerGoodsText(sqlSession, goodsSell);
	}

	@Override
	public int updateGoodsFile(GoodsFile goodsFile) {

		return goodsDao.updateGoodsFile(sqlSession, goodsFile);
	}

	@Override
	public ArrayList<Review> selectGoodReview(int goodNo) {
		
		return goodsDao.selectGoodReview(sqlSession,goodNo);
	}
	
	@Override
	public int deleteGoodsFile(int sellNo) {

		return goodsDao.deleteGoodsFile(sqlSession, sellNo);
	}

	@Override
	public int deleteSellerGoodsText(int sellNo) {

		return goodsDao.deleteSellerGoodsText(sqlSession, sellNo);
	}

	@Override
	public int updateSellerGoods(Goods goods) {
		
		return goodsDao.updateSellerGoods(sqlSession, goods);
	}

	@Override
	public int deleteSellerGoods(int goodNo) {
		// TODO Auto-generated method stub
		return goodsDao.deleteSellerGoods(sqlSession, goodNo);
	}

	@Override
	public ArrayList<SellReply> selectReplyList(int sno) {
		
		return goodsDao.selectReplyList(sqlSession, sno);
	}

	@Override
	public int ajaxInsertReply(SellReply r) {
		
		return goodsDao.ajaxInsertReply(sqlSession, r);
	}

	@Override
	public ArrayList<Goods> selectGoodsListTop() {

		return goodsDao.selectGoodsListTop(sqlSession);
	}
	
	
	
	

	
	
}
