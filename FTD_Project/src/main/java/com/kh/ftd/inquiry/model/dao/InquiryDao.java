package com.kh.ftd.inquiry.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ftd.common.model.vo.PageInfo;
import com.kh.ftd.inquiry.model.vo.Inquiry;

@Repository
public class InquiryDao {

	public ArrayList<Inquiry> ajaxSelectInquiryList(SqlSessionTemplate sqlSession, int sellerNo) {
		return (ArrayList)sqlSession.selectList("inquiryMapper.ajaxSelect", sellerNo);
	}

}
