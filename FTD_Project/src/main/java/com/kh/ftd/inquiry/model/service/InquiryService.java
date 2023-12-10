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
	int increaseInquiryCount(int inquiryNo);
	
	// 게시글 상세조회
	Inquiry selectInquiry(int inquiryNo);
	
	// 게시글 삭제
	int deleteInquiry(int inquiryNo);
	
	// 게시글 수정
	int updateInquiry(Inquiry i);
	
	// 답변 등록 (update)
	int insertAnswer(Inquiry i);
	
	// 댓글 리스트 조회 서비스
	ArrayList<InquiryReply> selectReplyList(int boardNo);
	
	// 댓글 작성 서비스
	int insertReply(InquiryReply r);

	Seller sellectSeller(int sno);

	int insertInquiryFile(InquiryFile inf);
	
}
