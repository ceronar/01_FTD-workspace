package com.kh.ftd.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ftd.member.model.vo.Member;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		// System.out.println("디에이오도착");
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
}
