package com.kh.ftd.goods.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ftd.goods.model.vo.Goods;
import com.kh.ftd.goods.model.vo.GoodsFile;
import com.kh.ftd.goods.model.vo.GoodsSell;

@Repository
public class GoodsDao {

	public ArrayList<Goods> ajaxSelectGoodsList(SqlSessionTemplate sqlSession) {

		return (ArrayList)sqlSession.selectList("goodsMapper.ajaxSelectGoodsList");
	}
	
	public GoodsSell ajaxSelectGoodsSellList(SqlSessionTemplate sqlSession, int goodNo) {
		
		return sqlSession.selectOne("goodsMapper.ajaxSelectGoodsSellList", goodNo);
	}

	public GoodsFile ajaxSelectGoodsFileList(SqlSessionTemplate sqlSession, int sellNo) {

		return sqlSession.selectOne("goodsMapper.ajaxSelectGoodsFileList", sellNo);
	}

	public double ajaxSelectStarRating(SqlSessionTemplate sqlSession, int goodNo) {

		return sqlSession.selectOne("goodsMapper.ajaxSelectStarRating", goodNo);
	}

	public int ajaxSelectReviews(SqlSessionTemplate sqlSession, int goodNo) {

		return sqlSession.selectOne("goodsMapper.ajaxSelectReviews", goodNo);
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
}
