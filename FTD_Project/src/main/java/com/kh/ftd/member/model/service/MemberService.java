package com.kh.ftd.member.model.service;

import java.util.ArrayList;

import com.kh.ftd.common.model.vo.PageInfo;
import com.kh.ftd.member.model.vo.Like;
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
	int ajaxSelectSubscribe(Subscribe subscribeNo);
	
	// 구매자 마켓 찜 삭제 (delete)
	int ajaxDeleteSubscribe(Subscribe checkSubscribe);
	
	// 구매자 마켓 찜 추가 (insert)
	int ajaxInsertSubscribe(Subscribe subscribeNo);
	
	// 구매자 리스트 페이징 조회
	ArrayList<Member> selectMemberList(PageInfo pi);
	
	// memberNo으로 구매자 한명 정보 조회
	Member selectMember(int memberNo);
	
	// memberNo으로 구매자 한명 상태 수정
	int memberStatusChange(Member m);
	
	// 좋아요한 항목 지우기
	int ajaxMemberDeleteLike(Like like);
	
}
