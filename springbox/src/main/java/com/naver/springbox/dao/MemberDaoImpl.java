package com.naver.springbox.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.naver.springbox.dto.MemberBean;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberBean getMemberInfo(String memberId) {
		return (MemberBean) sqlSession.selectOne("member.select_member", memberId);
	}
	
	@Override
	public MemberBean getIdCheck(String user_Id) {
		return (MemberBean) sqlSession.selectOne("member.select_member", user_Id);
	}
		
	@Override
	public boolean insertMember(MemberBean member) {
		//System.out.println(member);
		
		int r = sqlSession.insert("member.join_process", member);
		System.out.println("r="+r);
		
		if (r > 0)
			return true;
		else
			return false;
	}
	
	//id 중복체크
		@Override
		@Transactional// 메소드 수행 중에 예외가 발생하면 rollback 그렇지 않으면 commit
		public boolean IdCheck(String user_Id) {
			boolean result = false;
			int e = sqlSession.selectOne("member.select_member", user_Id);
			// 검색된 데이터가 없다면
			if (e > 0)
				return true;
			else
				return false;
		}
	
	//email 중복체크
	@Override
	@Transactional// 메소드 수행 중에 예외가 발생하면 rollback 그렇지 않으면 commit
	public boolean EmailCheck(String email) {
		boolean result = false;
		int e = sqlSession.selectOne("member.email_Check", email);
		// 검색된 데이터가 없다면
		if (e > 0)
			return true;
		else
			return false;
	}

}
