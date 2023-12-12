package com.kh.ftd.review.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ftd.review.model.dao.ReviewDao;
import com.kh.ftd.review.model.vo.Review;
import com.kh.ftd.review.model.vo.ReviewFile;

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
	public ArrayList<ReviewFile> selectReviewFileList(int revNo) {
		
		return reviewDao.selectReviewFileList(sqlSession,revNo);
	}

	@Override
	public int ReviewReplyCount(int revNo) {
		
		return reviewDao.ReviewReplyCount(sqlSession,revNo);
	}

}
