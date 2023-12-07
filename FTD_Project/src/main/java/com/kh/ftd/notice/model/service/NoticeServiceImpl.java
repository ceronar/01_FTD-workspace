package com.kh.ftd.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	@Transactional
	public int insertNotice(Notice n) {
		return noticeDao.insertNotice(sqlSession, n);
	}

	@Override
	@Transactional
	public int insertFile(NoticeFile nf) {
		return noticeDao.insertFile(sqlSession, nf);
	}
	
	@Override
	@Transactional
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
		return noticeDao.deleteNotice(sqlSession, noticeNo);
	}

	@Override
	@Transactional
	public int updateNotice(Notice n) {
		return noticeDao.updateNotice(sqlSession, n);
	}

	@Override
	@Transactional
	public int deleteNoticeFile(int noticeNo) {
		return noticeDao.deleteNoticeFile(sqlSession, noticeNo);
	}

	@Override
	public int deleteNoticeList(String nnoList) {
		return noticeDao.deleteNoticeList(sqlSession, nnoList);
	}

	@Override
	public int deleteNoticeFileList(String nnoList) {
		return noticeDao.deleteNoticeFileList(sqlSession, nnoList);
	}

}
