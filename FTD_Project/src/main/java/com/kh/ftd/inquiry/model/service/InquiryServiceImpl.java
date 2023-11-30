package com.kh.ftd.inquiry.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.kh.ftd.common.model.vo.PageInfo;
import com.kh.ftd.inquiry.model.dao.InquiryDao;
import com.kh.ftd.inquiry.model.vo.Inquiry;
import com.kh.ftd.inquiry.model.vo.InquiryReply;

@Service
@EnableTransactionManagement
public class InquiryServiceImpl implements InquiryService{

	@Autowired
	private InquiryDao inquiryDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
//	@Override
//	public int selectInquiryCount(String sellerNo) {
//		return inquiryDao.selectInquiryCount(sqlSession, sellerNo);
//	}
//
//	@Override
//	public ArrayList<Inquiry> selectInquiryList(PageInfo pi, String sellerNo) {
//		return inquiryDao.selectInquiryList(sqlSession, pi, sellerNo);
//	}
	
	@Override
	public int insertNotice(Inquiry i) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int increaseInquiryCount(int inquiryNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Inquiry selectNotice(int inquiryNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteInquiry(int inquiryNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateNotice(Inquiry i) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAnswer(Inquiry i) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<InquiryReply> selectReplyList(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReply(InquiryReply r) {
		// TODO Auto-generated method stub
		return 0;
	}

	


}
