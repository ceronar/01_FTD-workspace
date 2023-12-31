package com.kh.ftd.review.model.service;

import java.util.ArrayList;

import com.kh.ftd.goods.model.vo.GoodsFile;
import com.kh.ftd.goods.model.vo.GoodsSell;
import com.kh.ftd.review.model.vo.Review;
import com.kh.ftd.review.model.vo.ReviewFile;
import com.kh.ftd.review.model.vo.ReviewReply;

public interface ReviewService {

	//천체 후기 리스트 조회
	ArrayList<Review> selectReviewList();

	//후기 리스트 사진 조회
	ArrayList<ReviewFile> selectReviewFileList(int rno);

	//댓글 개수 조회
	int ReviewReplyCount(int rno);

	//후기 리스트 상품 사진 조회
	GoodsFile selectGoodsFileList(int gno);

	//후기 리스트 상세조회
	
		// 후기 리스트 조횟수 증가
		int increaseCount(int rno);
		
		// 후기 리스트 내용 조횟수 가지고있음 (조회)
		Review selectReview(int rno);

		//이 후기 리스트의 댓글리스트
		ArrayList<ReviewReply> selectReviewReplyList(int rno);

		//이 후기 리스트의 상품 제목,상세정보
		GoodsSell selectGoodsList(int gno);

		//댓글 작성 기능
		int insertReviewReply(ReviewReply rr);

		//댓글 수정 기능
		int updateReviewReply(ReviewReply rr);

		//댓글 삭제 기능
		int deleteReviewReply(ReviewReply rr);

		//후기 리스트 삭제 기능
		int deleteReview(int rno);

		//기존에 후기게시글에 첨부파일이있었다면 삭제 기능
		int deleteReviewFile(int rno);

		//판매자용 마켓 서브메뉴 후기리스트
		ArrayList<Review> selectReviewSellerList(int sno);

	
	// 구매자 작성 리뷰 리스트 조회
	ArrayList<Review> memberBoardList(int memberNo);
	
	// 리뷰 작성 기능
	int insertReview(Review rev);
	
	// 후기 조회수 기준 조회
	ArrayList<Review> selectReviewListTop();

	// 리뷰 수정 기능
	int updateReview(Review r);

}
