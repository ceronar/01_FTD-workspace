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
	
	
}
