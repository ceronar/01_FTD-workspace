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
	public int increaseInquiryCount(Inquiry i) {
		return inquiryDao.increaseInquiryCount(sqlSession, i);
	}

	@Override
	public Inquiry selectInquiry(Inquiry i) {
		return inquiryDao.selectInquiry(sqlSession, i);
	}

	@Override
	public ArrayList<InquiryFile> selectInquiryFile(Inquiry i) {
		return inquiryDao.selectInquiryFileList(sqlSession, i);
	}
	
	@Override
	public ArrayList<InquiryReply> selectInquiryReplyList(Inquiry i) {
		return inquiryDao.selectInquiryReplyList(sqlSession, i);
	}
	
	@Override
	public int deleteInquiryFile(int inqNo) {
		return inquiryDao.deleteInquiryFile(sqlSession, inqNo);
	}
	
	public int deleteInquiry(int inquiryNo) {
		return inquiryDao.deleteInquiry(sqlSession, inquiryNo);
	}

	@Override
	public int updateInquiry(Inquiry i) {
		return inquiryDao.updateInquiry(sqlSession, i);
	}

	@Override
	public int insertAnswer(Inquiry i) {
		return inquiryDao.insertAnswer(sqlSession, i);
	}
	
	@Override
	public int deleteResponse(Inquiry i) {
		return inquiryDao.deleteResponse(sqlSession, i);
	}
	
	@Override
	public int updateResponse(Inquiry i) {
		return inquiryDao.updateResponse(sqlSession, i);
	}
	
	@Override
	public int updateInquiryFile(InquiryFile inf) {
		return inquiryDao.updateInquiryFile(sqlSession, inf);
	}
	

	@Override
	public int insertReply(InquiryReply r) {
		return inquiryDao.insertReply(sqlSession, r);
	}

	

	

	

	








	


}
