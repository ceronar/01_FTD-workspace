package com.kh.ftd.review.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ftd.review.model.vo.Review;
import com.kh.ftd.review.model.vo.ReviewFile;

@Repository
public class ReviewDao {

	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("reviewMapper.selectReviewList");
	}

	public ArrayList<ReviewFile> selectReviewFileList(SqlSessionTemplate sqlSession, int revNo) {
		
		return (ArrayList)sqlSession.selectList("reviewMapper.selectReviewFileList",revNo);
	}

	public int ReviewReplyCount(SqlSessionTemplate sqlSession, int revNo) {
	
		return sqlSession.selectOne("reviewMapper.ReviewReplyCount",revNo);
	}

}
