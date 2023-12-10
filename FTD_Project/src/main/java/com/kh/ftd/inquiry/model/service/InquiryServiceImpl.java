package com.kh.ftd.inquiry.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.kh.ftd.common.model.vo.PageInfo;
import com.kh.ftd.inquiry.model.dao.InquiryDao;
import com.kh.ftd.inquiry.model.vo.Inquiry;
import com.kh.ftd.inquiry.model.vo.InquiryFile;
import com.kh.ftd.inquiry.model.vo.InquiryReply;
import com.kh.ftd.seller.model.vo.Seller;

@Service
@EnableTransactionManagement
public class InquiryServiceImpl implements InquiryService{

	@Autowired
	private InquiryDao inquiryDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Inquiry> ajaxSelectInquiryList(int sellerNo) {
		return inquiryDao.ajaxSelectInquiryList(sqlSession, sellerNo);
	}
	
	@Override
	public Seller sellectSeller(int sno) {
		return inquiryDao.selectSeller(sqlSession, sno);
	}
	
	@Override
	public int insertInquiry(Inquiry i) {
		return inquiryDao.insertInquiry(sqlSession, i);
	}

	@Override
	public int insertInquiryFile(InquiryFile inf) {
		return inquiryDao.insertInquiryFile(sqlSession, inf);
	}
	
	@Override
	public int increaseInquiryCount(int inquiryNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Inquiry selectInquiry(int inquiryNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteInquiry(int inquiryNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateInquiry(Inquiry i) {
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
