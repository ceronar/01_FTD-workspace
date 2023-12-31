package com.kh.ftd.inquiry.model.service;

import java.util.ArrayList;

import com.kh.ftd.inquiry.model.vo.Inquiry;
import com.kh.ftd.inquiry.model.vo.InquiryFile;
import com.kh.ftd.inquiry.model.vo.InquiryReply;
import com.kh.ftd.seller.model.vo.Seller;



public interface InquiryService {
	

	// 게시글 전체조회
	ArrayList<Inquiry> ajaxSelectInquiryList(int sellerNo);
	
	// 게시글 작성하기
	int insertInquiry(Inquiry i);
	
	// 게시글 조회수 증가
	int increaseInquiryCount(Inquiry i);
	
	// 게시글 상세조회
	Inquiry selectInquiry(Inquiry i);
	
	// 게시글 삭제
	int deleteInquiry(int inquiryNo);
	
	// 게시글 수정
	int updateInquiry(Inquiry i);
	
	// 답변 등록 (update)
	int insertAnswer(Inquiry i);
	
	// 댓글 작성 서비스
	int insertReply(InquiryReply r);

	Seller sellectSeller(int sno);

	int insertInquiryFile(InquiryFile inf);

	ArrayList<InquiryFile> selectInquiryFile(Inquiry i);

	ArrayList<InquiryReply> selectInquiryReplyList(Inquiry i);

	int deleteInquiryFile(int inqNo);

	int updateInquiryFile(InquiryFile inf);

	int deleteResponse(Inquiry i);

	int updateResponse(Inquiry i);
	
	// 구매자 작성 문의 리스트 조회
	ArrayList<Inquiry> memberBoardList(int memberNo);

	int updateReply(InquiryReply ir);

	int deleteReply(int replyNo);
}
