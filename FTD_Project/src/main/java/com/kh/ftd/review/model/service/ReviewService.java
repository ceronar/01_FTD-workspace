package com.kh.ftd.review.model.service;

import java.util.ArrayList;

import com.kh.ftd.review.model.vo.Review;
import com.kh.ftd.review.model.vo.ReviewFile;

public interface ReviewService {

	//천체 후기 리스트 조회
	ArrayList<Review> selectReviewList();

	//후기 리스트 사진 조회
	ArrayList<ReviewFile> selectReviewFileList(int revNo);

	//댓글 개수 조회
	int ReviewReplyCount(int revNo);

}
