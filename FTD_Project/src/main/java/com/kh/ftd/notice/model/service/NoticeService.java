package com.kh.ftd.notice.model.service;

import java.util.ArrayList;

import com.kh.ftd.common.model.vo.PageInfo;
import com.kh.ftd.notice.model.vo.Notice;
import com.kh.ftd.notice.model.vo.NoticeFile;

public interface NoticeService {

	// 총 게시글 갯수
	int selectNoticeCount();
	
	// 게시글 리스트 조회
	ArrayList<Notice> selectNoticeList(PageInfo pi);
	
	// 게시글 작성하기
	int insertNotice(Notice n);
	
	// 게시글 첨부파일 넣기
	int insertFile(NoticeFile nf);
	
	// 게시글 조회수 증가
	int increaseNoticeCount(int noticeNo);
	
	// 게시글 상세조회
	Notice selectNotice(int noticeNo);
	
	ArrayList<NoticeFile> selectNoticeFile(int noticeNo);
	
	// 게시글 삭제
	int deleteNotice(int noticeNo);
	
	// 게시글 수정
	int updateNotice(Notice n);

	int deleteNoticeFile(int noticeNo);

	int deleteNoticeList(String nnoList);

	int deleteNoticeFileList(String nnoList);

	int updateFile(NoticeFile nf);
	
}
