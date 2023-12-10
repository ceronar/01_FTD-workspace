package com.kh.ftd.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ftd.common.model.vo.PageInfo;
import com.kh.ftd.member.model.dao.MemberDao;
import com.kh.ftd.member.model.vo.Member;
import com.kh.ftd.member.model.vo.Subscribe;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	
	@Override
	public Member loginMember(Member m) {
		
		return memberDao.loginMember(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		
		return memberDao.insertMember(sqlSession, m);
	}

	@Override
	public int updateMember(Member m) {
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
		return null;
	}

	
	@Override
    public String findMemberIdByEmail(String email) {
        return memberDao.findId(sqlSession, email);
    }
	
	@Override
	public int updatePwd(Member m) {
		return memberDao.updatePwd(sqlSession, m);
	}
	
	
	@Override
	public Subscribe ajaxSelectSubscribe(Subscribe subscribeNo) {
		
		return memberDao.ajaxSelectSubscribe(sqlSession, subscribeNo);
	}

	@Override
	public int ajaxDeleteSubscribe(Subscribe checkSubscribe) {
		
		return memberDao.ajaxDeleteSubscribe(sqlSession, checkSubscribe);
	}

	@Override
	public int ajaxInsertSubscribe(Subscribe subscribeNo) {
		
		return memberDao.ajaxInsertSubscribe(sqlSession, subscribeNo);
	}
	
	// 구매자 리스트 페이징 조회
	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi) {
		return memberDao.selectMemberList(sqlSession, pi);
	}

	@Override
	public Member selectMember(int memberNo) {
		return memberDao.selectMember(sqlSession, memberNo);
	}
}
