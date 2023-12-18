package com.kh.ftd.member.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.ftd.common.model.vo.PageInfo;
import com.kh.ftd.member.model.vo.Like;
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
		
	public int ajaxSelectSubscribe(SqlSessionTemplate sqlSession, Subscribe subscribeNo) {
		
		return sqlSession.selectOne("memberMapper.ajaxSelectSubscribe", subscribeNo);
	}
	
	public int ajaxDeleteSubscribe(SqlSessionTemplate sqlSession, Subscribe checkSubscribe) {
		
		return sqlSession.delete("memberMapper.ajaxDeleteSubscribe", checkSubscribe);
	}
	
	public int ajaxInsertSubscribe(SqlSessionTemplate sqlSession, Subscribe subscribeNo) {
		
		return sqlSession.insert("memberMapper.ajaxInsertSubscribe", subscribeNo);
	}
	
	public String selectEncPw(int memberNo) {
		return sqlSession.selectOne("memberMapper.selectEncPw", memberNo);
	}

	public int updatePwd(SqlSessionTemplate sqlSession2, Member m) {
		
		return sqlSession.update("memberMapper.updatePwd", m);
	}
	
	public ArrayList<Member> selectMemberList(SqlSession sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberList", null, new RowBounds(offset, limit));
	}

	public Member selectMember(SqlSession sqlSession, int memberNo) {
		return sqlSession.selectOne("memberMapper.selectMember", memberNo);
	}

	public int memberStatusChange(SqlSession sqlSession, Member m) {
		return sqlSession.update("memberMapper.memberStatusChange", m);
	}

	public int ajaxMemberDeleteLike(SqlSession sqlSession, Like like) {
		return sqlSession.delete("memberMapper.ajaxMemberDeleteLike", like);
	}
	
}
