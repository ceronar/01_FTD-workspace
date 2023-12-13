package com.kh.ftd.review.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ftd.goods.model.vo.GoodsFile;
import com.kh.ftd.goods.model.vo.GoodsSell;
import com.kh.ftd.review.model.dao.ReviewDao;
import com.kh.ftd.review.model.vo.Review;
import com.kh.ftd.review.model.vo.ReviewFile;
import com.kh.ftd.review.model.vo.ReviewReply;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Review> selectReviewList() {

		return reviewDao.selectReviewList(sqlSession);
	}

	@Override
	public ArrayList<ReviewFile> selectReviewFileList(int rno) {
		
		return reviewDao.selectReviewFileList(sqlSession,rno);
	}

	@Override
	public int ReviewReplyCount(int rno) {
		
		return reviewDao.ReviewReplyCount(sqlSession,rno);
	}

	@Override
	public GoodsFile selectGoodsFileList(int gno) {
	
		return reviewDao.selectGoodsFileList(sqlSession,gno);
	}

	@Override
	public int increaseCount(int rno) {
		
		return reviewDao.increaseCount(sqlSession,rno);
	}

	@Override
	public Review selectReview(int rno) {
		
		return reviewDao.selectReview(sqlSession,rno);
	}

	@Override
	public ArrayList<ReviewReply> selectReviewReplyList(int rno) {
		
		return reviewDao.selectReviewReplyList(sqlSession,rno);
	}

	@Override
	public GoodsSell selectGoodsList(int gno) {
		
		return reviewDao.selectGoodsList(sqlSession,gno);
	}



}
