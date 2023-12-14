package com.kh.ftd.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ftd.common.model.vo.PageInfo;
import com.kh.ftd.notice.model.vo.Notice;
import com.kh.ftd.notice.model.vo.NoticeFile;

@Repository
public class NoticeDao {
	
	public int selectNoticeCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("noticeMapper.selectNoticeCount");
	}
	
	public ArrayList<Notice> selectNoticeList (SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNoticeList", null, rowBounds);
	}

	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("noticeMapper.insertNotice", n);
	}
	
	public int insertFile(SqlSessionTemplate sqlSession, NoticeFile nf) {
		return sqlSession.insert("noticeMapper.insertFile", nf);
	}

	public int increaseNoticeCount(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.update("noticeMapper.increaseNoticeCount", noticeNo);
	}
	
	public Notice selectNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.selectOne("noticeMapper.selectNotice", noticeNo);
	}

	public ArrayList<NoticeFile> selectNoticeFile(SqlSessionTemplate sqlSession, int noticeNo) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNoticeFile", noticeNo);
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.update("noticeMapper.deleteNotice", noticeNo);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("noticeMapper.updateNotice", n);
	}

	public int deleteNoticeFile(SqlSessionTemplate sqlSession, int noticeNo) {
		return sqlSession.update("noticeMapper.deleteNoticeFile", noticeNo);
	}

	public int deleteNoticeList(SqlSessionTemplate sqlSession, String nnoList) {
		System.out.println(nnoList);
		return sqlSession.update("noticeMapper.deleteNoticeList", nnoList);
	}

	public int deleteNoticeFileList(SqlSessionTemplate sqlSession, String nnoList) {
		
		return sqlSession.update("noticeMapper.deleteNoticeFileList", nnoList);
	}

	public int updateFile(SqlSessionTemplate sqlSession, NoticeFile nf) {
		return sqlSession.insert("noticeMapper.updateFile", nf);
	}
	
	
	
}
