package com.kh.ftd.member.model.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ftd.member.model.vo.Member;
import com.kh.ftd.member.model.vo.Subscribe;

@Repository
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.updateMember", m);
	}
	
	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String memberId) {
		
		return sqlSession.update("memberMapper.deleteMember", memberId);
	}

	public String findId(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.findId", email);
	}
	
	
	public Subscribe ajaxSelectSubscribe(SqlSessionTemplate sqlSession, Subscribe subscribe) {
		
		return sqlSession.selectOne("memberMapper.ajaxSelectSubscribe", subscribe);
	}
	
	public String selectEncPw(int memberNo) {
		return sqlSession.selectOne("memberMapper.selectEncPw", memberNo);
	}

	public int updatePwd(SqlSessionTemplate sqlSession2, Member m) {
		
		return sqlSession.update("memberMapper.updatePwd", m);
	}
		
}
