package com.kh.ftd.inquiry.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ftd.common.model.vo.PageInfo;
import com.kh.ftd.inquiry.model.vo.Inquiry;
import com.kh.ftd.inquiry.model.vo.InquiryFile;
import com.kh.ftd.inquiry.model.vo.InquiryReply;
import com.kh.ftd.seller.model.vo.Seller;

@Repository
public class InquiryDao {

	public ArrayList<Inquiry> ajaxSelectInquiryList(SqlSessionTemplate sqlSession, int sellerNo) {
		return (ArrayList)sqlSession.selectList("inquiryMapper.selectInquiryList", sellerNo);
	}

	public Seller selectSeller(SqlSessionTemplate sqlSession, int sno) {
		return sqlSession.selectOne("inquiryMapper.selectSeller", sno);
	}

	public int insertInquiry(SqlSessionTemplate sqlSession, Inquiry i) {
		System.out.println(i);
		return sqlSession.insert("inquiryMapper.insertInquiry", i);
	}

	public int insertInquiryFile(SqlSessionTemplate sqlSession, InquiryFile inf) {
		return sqlSession.insert("inquiryMapper.insertInquiryFile", inf);
	}

	public int increaseInquiryCount(SqlSessionTemplate sqlSession, Inquiry i) {
		return sqlSession.update("inquiryMapper.increaseInquiryCount", i);
	}

	public Inquiry selectInquiry(SqlSessionTemplate sqlSession, Inquiry i) {
		return sqlSession.selectOne("inquiryMapper.selectInquiry", i);
	}

	public ArrayList<InquiryFile> selectInquiryFileList(SqlSessionTemplate sqlSession, Inquiry i) {
		return (ArrayList)sqlSession.selectList("inquiryMapper.selectInquiryFileList", i);
	}

	public ArrayList<InquiryReply> selectInquiryReplyList(SqlSessionTemplate sqlSession, Inquiry i) {
		return (ArrayList)sqlSession.selectList("inquiryMapper.selectInquiryReplyList", i);
	}
	
	

}
