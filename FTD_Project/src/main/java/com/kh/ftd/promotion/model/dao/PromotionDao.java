package com.kh.ftd.promotion.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ftd.goods.model.vo.GoodsFile;
import com.kh.ftd.goods.model.vo.GoodsSell;
import com.kh.ftd.member.model.vo.Subscribe;
import com.kh.ftd.promotion.model.vo.Promotion;
import com.kh.ftd.promotion.model.vo.PromotionFile;
import com.kh.ftd.promotion.model.vo.PromotionReply;
import com.kh.ftd.seller.model.vo.Seller;
import com.kh.ftd.seller.model.vo.SellerFile;

@Repository
public class PromotionDao {

	public ArrayList<Promotion> selectPromotionList(SqlSessionTemplate sqlSession) {
	
		return (ArrayList)sqlSession.selectList("promotionMapper.selectPromotionList");
		
	}

	public Seller selectSellerList(SqlSessionTemplate sqlSession, int sellerNo) {
	
		return sqlSession.selectOne("promotionMapper.selectSellerList", sellerNo);
	}

	public SellerFile selectSellerFileProfileList(SqlSessionTemplate sqlSession, int sellerNo) {
	
	
		
		return sqlSession.selectOne("promotionMapper.selectSellerFileProfileList", sellerNo);
	}

	public ArrayList<PromotionFile> selectPromotionFileList(SqlSessionTemplate sqlSession, int promotionNo) {
		
		return (ArrayList)sqlSession.selectList("promotionMapper.selectPromotionFileList", promotionNo);
	}

	public int selectPromotionReplyCount(SqlSessionTemplate sqlSession, int promotionNo) {
		
		return sqlSession.selectOne("promotionMapper.selectPromotionReplyCount", promotionNo);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int promotionNo) {
		
		return sqlSession.update("promotionMapper.increaseCount",promotionNo);
	}

	public Promotion selectPromotion(SqlSessionTemplate sqlSession, int promotionNo) {
	
		return sqlSession.selectOne("promotionMapper.selectPromotion",promotionNo);
	}


	public ArrayList<PromotionReply> selectPromotionReplyList(SqlSessionTemplate sqlSession, int promotionNo) {
		
		return (ArrayList)sqlSession.selectList("promotionMapper.selectPromotionReplyList",promotionNo);
	}

	public double marketStarRating(SqlSessionTemplate sqlSession, int sellerNo) {
		
	double a = sqlSession.selectOne("sellerMapper.ajaxSelectStarRating", sellerNo);
	

	
		return sqlSession.selectOne("sellerMapper.ajaxSelectStarRating", sellerNo);
	}

	public int reviewCount(SqlSessionTemplate sqlSession, int sellerNo) {
		
		return sqlSession.selectOne("promotionMapper.reviewCount", sellerNo);
	}

	public int insertPromotion(SqlSessionTemplate sqlSession, Promotion p) {
		
		return sqlSession.insert("promotionMapper.insertPromotion", p);
	}

	public int insertFile(SqlSessionTemplate sqlSession, PromotionFile pf) {
		
		return sqlSession.insert("promotionMapper.insertFile", pf);
	}


	public int updatePromotion(SqlSessionTemplate sqlSession, Promotion p) {
		
		return sqlSession.update("promotionMapper.updatePromotion",p);
	}

	public int updateFile(SqlSessionTemplate sqlSession, PromotionFile pf) {

		return sqlSession.insert("promotionMapper.updateFile",pf);
	}

	public int deletePromotion(SqlSessionTemplate sqlSession, int pno) {
	
		return sqlSession.update("promotionMapper.deletePromotion",pno);	
	}
	


	public int deletePromotionFile(SqlSessionTemplate sqlSession, int pno) {
		
		return sqlSession.update("promotionMapper.deletePromotionFiles",pno); 
	}

	public int insertPromotionReply(SqlSessionTemplate sqlSession, PromotionReply pr) {
	
		return sqlSession.insert("promotionMapper.insertPromotionReply",pr);
	}

	public int deletePromotionReply(SqlSessionTemplate sqlSession, PromotionReply prno) {
	
		return sqlSession.update("promotionMapper.deletePromotionReply",prno); 
	}

	public int updatePromotionReply(SqlSessionTemplate sqlSession, PromotionReply prno) {
		
		return sqlSession.update("promotionMapper.updatePromotionReply",prno); 
	}

	public ArrayList<Promotion> selectPromotionSellerList(SqlSessionTemplate sqlSession, int sellerNo) {
		
		return (ArrayList)sqlSession.selectList("promotionMapper.selectPromotionSellerList",sellerNo);
	}

	public ArrayList<GoodsSell> goodSell(SqlSessionTemplate sqlSession, int sno) {

		return (ArrayList)sqlSession.selectList("promotionMapper.goodSell",sno);
	}

	public ArrayList<GoodsFile> goodFile(SqlSessionTemplate sqlSession, int sno) {
		
		return (ArrayList)sqlSession.selectList("promotionMapper.goodFile",sno);
	}

	public int selectSubscribeCount(SqlSessionTemplate sqlSession,Subscribe s) {
		
		return sqlSession.selectOne("promotionMapper.selectSubscribeCount",s);
	}

	public int deleteSubscribeCount(SqlSessionTemplate sqlSession, Subscribe s) {
		
		return sqlSession.delete("promotionMapper.deleteSubscribeCount",s);
	}

	public int insertSubscribeCount(SqlSessionTemplate sqlSession, Subscribe s) {
		
		return sqlSession.insert("promotionMapper.insertSubscribeCount",s);
	}

	
	

	
	

}
