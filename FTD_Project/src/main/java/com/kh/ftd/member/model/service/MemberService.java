package com.kh.ftd.member.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.ftd.member.model.vo.Member;
import com.kh.ftd.member.model.vo.Subscribe;

public interface MemberService {
	
	// 구매자 로그인 (select)
	Member loginMember(Member m);
	
	// 구매자 회원가입 (insert)
	int insertMember(Member m);
	
	// 구매자 회원정보수정 (update)
	int updateMember(Member m);
	
	// 구매자 회원탈퇴 (update)
	int deleteMember(String MemberId);
	
	// 구매자 아이디중복체크 (select)
	int memberIdCheck(String checkId);
	
	// 관리자 파트 - 구매자 회원 목록 조회 (select)
	ArrayList<Member> selectMemberList();
	
	// 이메일로 아이디 찾기 
	String findMemberIdByEmail(String email);

	// 비밀번호 변경
	int updatePwd(Member m);
	
	// 구매자 마켓 찜 조회 (select)
	Subscribe ajaxSelectSubscribe(Subscribe subscribeNo);
	
	// 구매자 마켓 찜 삭제 (delete)
	int ajaxDeleteSubscribe(Subscribe checkSubscribe);
	
	// 구매자 마켓 찜 추가 (insert)
	int ajaxInsertSubscribe(Subscribe subscribeNo);
}
