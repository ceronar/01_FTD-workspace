package com.kh.ftd.inquiry.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.ftd.common.model.vo.PageInfo;
import com.kh.ftd.inquiry.model.vo.Inquiry;
import com.kh.ftd.inquiry.model.vo.InquiryReply;

@Service
public class InquiryServiceImpl implements InquiryService{

	@Override
	public int selectIniquiryListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Inquiry> selectNoticeList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertNotice(Inquiry i) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int increaseIniquiryCount(int iniquiryNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Inquiry selectNotice(int inquiryNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteIniquiry(int iniquiryNo) {
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
