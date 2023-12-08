package com.kh.ftd.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ftd.member.model.vo.Member;
import com.kh.ftd.member.model.vo.Subscribe;

@Repository
public class MemberDao {

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
	
	public Subscribe ajaxSelectSubscribe(SqlSessionTemplate sqlSession, Subscribe subscribeNo) {
		
		return sqlSession.selectOne("memberMapper.ajaxSelectSubscribe", subscribeNo);
	}
	
	public int ajaxDeleteSubscribe(SqlSessionTemplate sqlSession, Subscribe checkSubscribe) {
		
		return sqlSession.delete("memberMapper.ajaxDeleteSubscribe", checkSubscribe);
	}
	
	public int ajaxInsertSubscribe(SqlSessionTemplate sqlSession, Subscribe subscribeNo) {
		
		return sqlSession.insert("memberMapper.ajaxInsertSubscribe", subscribeNo);
	}
}
