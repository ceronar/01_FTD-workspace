package com.kh.ftd.iniquiry.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.ftd.common.model.vo.PageInfo;
import com.kh.ftd.iniquiry.model.vo.Iniquiry;
import com.kh.ftd.iniquiry.model.vo.IniquiryReply;

@Service
public class IniquiryServiceImpl implements IniquiryService{

	@Override
	public int selectIniquiryListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<Iniquiry> selectNoticeList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertNotice(Iniquiry i) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int increaseIniquiryCount(int iniquiryNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Iniquiry selectNotice(int inquiryNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteIniquiry(int iniquiryNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateNotice(Iniquiry i) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAnswer(Iniquiry i) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<IniquiryReply> selectReplyList(int boardNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReply(IniquiryReply r) {
		// TODO Auto-generated method stub
		return 0;
	}

}
