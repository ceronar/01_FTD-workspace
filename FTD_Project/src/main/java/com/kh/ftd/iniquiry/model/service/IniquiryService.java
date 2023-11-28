package com.kh.ftd.iniquiry.model.service;

import java.util.ArrayList;

import com.kh.ftd.common.model.vo.PageInfo;
import com.kh.ftd.iniquiry.model.vo.Iniquiry;
import com.kh.ftd.iniquiry.model.vo.IniquiryReply;



public interface IniquiryService {
	

	// 총 게시글 갯수
	int selectIniquiryListCount();
	
	// 게시글 리스트 조회
	ArrayList<Iniquiry> selectNoticeList(PageInfo pi);
	
	// 게시글 작성하기
	int insertNotice(Iniquiry i);
	
	// 게시글 조회수 증가
	int increaseIniquiryCount(int iniquiryNo);
	
	// 게시글 상세조회
	Iniquiry selectNotice(int inquiryNo);
	
	// 게시글 삭제
	int deleteIniquiry(int iniquiryNo);
	
	// 게시글 수정
	int updateNotice(Iniquiry i);
	
	// 답변 등록 (update)
	int insertAnswer(Iniquiry i);
	
	// 댓글 리스트 조회 서비스
	ArrayList<IniquiryReply> selectReplyList(int boardNo);
	
	// 댓글 작성 서비스
	int insertReply(IniquiryReply r);
}
