package com.kh.ftd.member.model.service;

import java.util.ArrayList;

import com.kh.ftd.member.model.vo.Member;

public interface MemberService {
	
	// 구매자 로그인 (select)
	Member loginMember(Member m);
	
	// 구매자 회원가입 (insert)
	int insertMember(Member m);
	
	// 구매자 회원정보수정 (update)
	int updateMember(Member m);
	
	// 구매자 회원탈퇴 (update)
	int deleteMember(String userId);
	
	// 구매자 아이디중복체크 (select)
	int memberIdCheck(String checkId);
	
	// 구매자 회원 목록 조회 (select)
	ArrayList<Member> selectMemberList();
	
}
