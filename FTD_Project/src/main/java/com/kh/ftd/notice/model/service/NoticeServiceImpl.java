package com.kh.ftd.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ftd.common.model.vo.PageInfo;
import com.kh.ftd.notice.model.dao.NoticeDao;
import com.kh.ftd.notice.model.vo.Notice;
import com.kh.ftd.notice.model.vo.NoticeFile;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public int selectNoticeCount() {
		return noticeDao.selectNoticeCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return noticeDao.selectNoticeList(sqlSession, pi);
	}

	@Override
	public int insertNotice(Notice n) {
		return noticeDao.insertNotice(sqlSession, n);
	}

	@Override
	public int insertFile(NoticeFile nf) {
		return noticeDao.insertFile(sqlSession, nf);
	}
	
	@Override
	public int increaseNoticeCount(int noticeNo) {
		return noticeDao.increaseNoticeCount(sqlSession, noticeNo);
	}

	@Override
	public Notice selectNotice(int noticeNo) {
		return noticeDao.selectNotice(sqlSession, noticeNo);
	}
	
	@Override
	public ArrayList<NoticeFile> selectNoticeFile(int noticeNo) {
		return noticeDao.selectNoticeFile(sqlSession, noticeNo);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateNotice(Notice n) {
		// TODO Auto-generated method stub
		return 0;
	}

}
