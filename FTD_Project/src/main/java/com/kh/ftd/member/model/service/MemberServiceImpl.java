package com.kh.ftd.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ftd.member.model.dao.MemberDao;
import com.kh.ftd.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	
	@Override
	public Member loginMember(Member m) {
		// System.out.println("서비스 도착");
		return memberDao.loginMember(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		
		return memberDao.insertMember(sqlSession, m);
	}

	@Override
	public int updateMember(Member m) {
		// TODO Auto-generated method stub
		return memberDao.updateMember(sqlSession, m);
	}

	@Override
	public int deleteMember(String memberId) {
		
		return memberDao.deleteMember(sqlSession, memberId);
	}

	@Override
	public int memberIdCheck(String checkId) {
		
		return memberDao.idCheck(sqlSession, checkId);
	}

	@Override
	public ArrayList<Member> selectMemberList() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
