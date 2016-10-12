package com.naver.springbox.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.springbox.dto.MemberBean;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberBean getMemberInfo(String memberId) {
		return (MemberBean) sqlSession.selectOne("member.select_member", memberId);
	}

}
