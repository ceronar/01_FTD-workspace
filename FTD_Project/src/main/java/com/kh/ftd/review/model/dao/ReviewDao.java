package com.kh.ftd.review.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ftd.goods.model.vo.GoodsFile;
import com.kh.ftd.goods.model.vo.GoodsSell;
import com.kh.ftd.review.model.vo.Review;
import com.kh.ftd.review.model.vo.ReviewFile;
import com.kh.ftd.review.model.vo.ReviewReply;

@Repository
public class ReviewDao {

	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("reviewMapper.selectReviewList");
	}

	public ArrayList<ReviewFile> selectReviewFileList(SqlSessionTemplate sqlSession, int rno) {
		
		return (ArrayList)sqlSession.selectList("reviewMapper.selectReviewFileList",rno);
	}

	public int ReviewReplyCount(SqlSessionTemplate sqlSession, int rno) {
	
		return sqlSession.selectOne("reviewMapper.ReviewReplyCount",rno);
	}

	public GoodsFile selectGoodsFileList(SqlSessionTemplate sqlSession, int gno) {

		return sqlSession.selectOne("reviewMapper.selectGoodsFileList",gno);
	}
	
	public GoodsSell selectGoodsList(SqlSessionTemplate sqlSession, int gno) {

		return sqlSession.selectOne("reviewMapper.selectGoodsList",gno);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int rno) {
		
		return sqlSession.update("reviewMapper.increaseCount",rno);
	}

	public Review selectReview(SqlSessionTemplate sqlSession, int rno) {
		
		return sqlSession.selectOne("reviewMapper.selectReview",rno);
	}

	public ArrayList<ReviewReply> selectReviewReplyList(SqlSessionTemplate sqlSession, int rno) {
		
		return (ArrayList)sqlSession.selectList("reviewMapper.selectReviewReplyList",rno);
	}

	public int insertReviewReply(SqlSessionTemplate sqlSession, ReviewReply rr) {

		return sqlSession.insert("reviewMapper.insertReviewReply",rr);
	}

	public int updateReviewReply(SqlSessionTemplate sqlSession, ReviewReply rr) {
		
		return sqlSession.update("reviewMapper.updateReviewReply",rr);
	}

	public int deleteReviewReply(SqlSessionTemplate sqlSession, ReviewReply rr) {

		return sqlSession.update("reviewMapper.deleteReviewReply",rr);
	}

	public int deleteReview(SqlSessionTemplate sqlSession, int rno) {
		
		return sqlSession.update("reviewMapper.deleteReview",rno);
	}

	public int deleteReviewFile(SqlSessionTemplate sqlSession, int rno) {

		return sqlSession.update("reviewMapper.deleteReviewFile",rno);
	}


	public ArrayList<Review> selectReviewSellerList(SqlSessionTemplate sqlSession, int sno) {
	
		return (ArrayList)sqlSession.selectList("reviewMapper.selectReviewSellerList",sno);
	}
	public ArrayList<Review> memberBoardList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("reviewMapper.memberBoardList", memberNo);

	}

	public int insertReview(SqlSessionTemplate sqlSession, Review rev) {
		return sqlSession.insert("reviewMapper.insertReview", rev);
	}

	



}
