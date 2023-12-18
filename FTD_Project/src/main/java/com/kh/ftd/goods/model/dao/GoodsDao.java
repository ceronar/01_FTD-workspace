package com.kh.ftd.goods.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ftd.goods.model.vo.Goods;
import com.kh.ftd.goods.model.vo.GoodsFile;
import com.kh.ftd.goods.model.vo.GoodsSell;
import com.kh.ftd.member.model.vo.Like;
import com.kh.ftd.order.model.vo.Cart;
import com.kh.ftd.order.model.vo.OrderGoods;
import com.kh.ftd.review.model.vo.Review;

@Repository
public class GoodsDao {

	public ArrayList<GoodsSell> ajaxSelectGoodsSellList(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("goodsMapper.ajaxSelectGoodsSellList");
	}
	
	public Goods ajaxSelectGoodsList(SqlSessionTemplate sqlSession, int goodNo) {
		
		return sqlSession.selectOne("goodsMapper.ajaxSelectGoodsList", goodNo);
	}

	public double ajaxSelectStarRating(SqlSessionTemplate sqlSession, int goodNo) {

		return sqlSession.selectOne("goodsMapper.ajaxSelectStarRating", goodNo);
	}
	
	public ArrayList<Goods> ajaxSelectSellerGoodsList(SqlSessionTemplate sqlSession, int sellerNo) {

		return (ArrayList)sqlSession.selectList("goodsMapper.ajaxSelectSellerGoodsList", sellerNo);
	}

	public ArrayList<Goods> memberOrderDetail(SqlSessionTemplate sqlSession, int orderNo) {
		return (ArrayList)sqlSession.selectList("goodsMapper.memberOrderDetail", orderNo);
	}
	
	public int insertSellerGoods(SqlSessionTemplate sqlSession, Goods goods) {

		return sqlSession.insert("goodsMapper.insertSellerGoods", goods);
	}
	
	public ArrayList<GoodsSell> ajaxSelectSellerGoodsTextList(SqlSessionTemplate sqlSession, int sellerNo) {

		return (ArrayList)sqlSession.selectList("goodsMapper.ajaxSelectSellerGoodsTextList", sellerNo);
	}
	
	public Goods ajaxSelectGoodsByGoodNo(SqlSessionTemplate sqlSession, int goodNo) {

		return sqlSession.selectOne("goodsMapper.ajaxSelectGoodsByGoodNo", goodNo);
	}
	
	public GoodsFile ajaxSelectGoodsMainFileList(SqlSessionTemplate sqlSession, int sellNo) {

		return sqlSession.selectOne("goodsMapper.ajaxSelectGoodsMainFileList", sellNo);
	}
	
	public int ajaxSelectReplyCount(SqlSessionTemplate sqlSession, int sellNo) {

		return sqlSession.selectOne("goodsMapper.ajaxSelectReplyCount", sellNo);
	}

	public ArrayList<Goods> memberLikeList(SqlSessionTemplate sqlSession, int memberNo) {
		
		return (ArrayList)sqlSession.selectList("goodsMapper.memberLikeList", memberNo);
	}
	
	public ArrayList<Goods> ajaxSelectSellerGoodTitle(SqlSessionTemplate sqlSession, int sellerNo) {
		
		return (ArrayList)sqlSession.selectList("goodsMapper.ajaxSelectSellerGoodTitle", sellerNo);
	}
	
	public int insertSellerGoodsText(SqlSessionTemplate sqlSession, GoodsSell goodsSell) {
		
		return sqlSession.insert("goodsMapper.insertSellerGoodsText", goodsSell);
	}
	
	public int updateGoodsCount(SqlSessionTemplate sqlSession, int sellNo) {
				
		return sqlSession.update("goodsMapper.updateGoodsCount", sellNo);
	}
	
	public GoodsSell selectGoodsSell(SqlSessionTemplate sqlSession, int sellNo) {
		
		return sqlSession.selectOne("goodsMapper.selectGoodsSell", sellNo);
	}
	
	public Goods selectGoodsByGoodNo(SqlSessionTemplate sqlSession, int goodNo) {
		
		return sqlSession.selectOne("goodsMapper.selectGoodsByGoodNo", goodNo);
	}

	public int updateBuyGoodsStock(SqlSessionTemplate sqlSession, OrderGoods orderGoods) {
		return sqlSession.update("goodsMapper.updateBuyGoodsStock", orderGoods);
	}
	
	public int insertCart(SqlSessionTemplate sqlSession, Cart cart) {
		
		return sqlSession.insert("goodsMapper.insertCart", cart);
	}
	
	public int selectLike(SqlSessionTemplate sqlSession, Like like) {
		
		return sqlSession.selectOne("goodsMapper.selectLike", like);
	}
	
	public int deleteLike(SqlSessionTemplate sqlSession, Like like) {
		
		return sqlSession.delete("goodsMapper.deleteLike", like);
	}
	
	public int insertLike(SqlSessionTemplate sqlSession, Like like) {
		
		return sqlSession.insert("goodsMapper.insertLike", like);
	}

	public int insertGoodsFile(SqlSessionTemplate sqlSession, GoodsFile goodsFile) {
		
		return sqlSession.insert("goodsMapper.insertGoodsFile", goodsFile);
	}
	
	public GoodsSell selectGoodsTextByGoodNo(SqlSessionTemplate sqlSession, int goodNo) {
		
		return sqlSession.selectOne("goodsMapper.selectGoodsTextByGoodNo", goodNo);
	}
	
	public int updateSellerGoodsText(SqlSessionTemplate sqlSession, GoodsSell goodsSell) {
		
		return sqlSession.update("goodsMapper.updateSellerGoodsText", goodsSell);
	}
	
	public int updateGoodsFile(SqlSessionTemplate sqlSession, GoodsFile goodsFile) {
		
		return sqlSession.update("goodsMapper.updateGoodsFile", goodsFile);
	}

	public ArrayList<Review> selectGoodReview(SqlSessionTemplate sqlSession, int goodNo) {
	
		System.out.println(goodNo);
		return (ArrayList)sqlSession.selectList("goodsMapper.selectGoodReview", goodNo);
	}
	
	public int deleteGoodsFile(SqlSessionTemplate sqlSession, int sellNo) {
		
		return sqlSession.update("goodsMapper.deleteGoodsFile", sellNo);
	}
	
	public int deleteSellerGoodsText(SqlSessionTemplate sqlSession, int sellNo) {
		
		return sqlSession.update("goodsMapper.deleteSellerGoodsText", sellNo);
	}
	
	public int updateSellerGoods(SqlSessionTemplate sqlSession, Goods goods) {
		
		return sqlSession.update("goodsMapper.updateSellerGoods", goods);
	}
	
	public int deleteSellerGoods(SqlSessionTemplate sqlSession, int goodNo) {
		
		return sqlSession.update("goodsMapper.deleteSellerGoods", goodNo);
	}
	
}
