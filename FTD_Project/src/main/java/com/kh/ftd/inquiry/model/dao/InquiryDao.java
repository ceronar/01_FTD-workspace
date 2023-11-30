package com.kh.ftd.inquiry.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ftd.common.model.vo.PageInfo;
import com.kh.ftd.inquiry.model.vo.Inquiry;

@Repository
public class InquiryDao {

//	public int selectInquiryCount(SqlSessionTemplate sqlSession, String sellerNo) {
//		
//		return sqlSession.selectOne("inquiryMapper.selectInquiryCount", sellerNo);
//	}
//	
//	public ArrayList<Inquiry> selectInquiryList(SqlSessionTemplate sqlSession, PageInfo pi, String sellerNo) {
//		int limit = pi.getBoardLimit();
//		int offset = (pi.getCurrentPage() - 1) * limit;
//		
//		RowBounds rowBounds = new RowBounds(offset, limit);
//		
//		return (ArrayList)sqlSession.selectList("inquiryMapper.selectInquiryList", sellerNo, rowBounds);
//	}
}
