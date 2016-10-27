package com.naver.springbox.dao;

import java.util.List;
import java.util.Map;

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

	//로그인 횟수 업데이트
	@Override
	@Transactional// 메소드 수행 중에 예외가 발생하면 rollback 그렇지 않으면 commit
	public void Logincont(String id) {
		sqlSession.update("member.Login_count", id);
	}
	
	//비밀번호 생성하여 보내주기
	@Override
	@Transactional
	public boolean Update_pass(Map<String, Object> map) {
		int r = sqlSession.update("member.updatePass", map);
		if (r > 0)
			return true;
		else
			return false;
	}

	@Override
	public MemberBean getMember(String email) {
		// TODO Auto-generated method stub
		return null;
	}
	
	//회원정보 확인을 위한 DB에서 값 꺼내기
	/*@Override
	public List<MemberBean> getUpdate_getInfo(MemberBean member) {
		List<MemberBean> list = sqlSession.selectList("member.update_getInfo", member);
		if (list.size() >0)
			return list;
		else
		return null;
	}*/
	
	@Override
	public MemberBean getUpdate_getInfo(String loginId) {
		List<MemberBean> list = sqlSession.selectList("member.update_getInfo", loginId);
		
		return (MemberBean) list.get(0);
	}
	
	//회원정보 확인 후 수정하기
	@Override
	public boolean updateMember(MemberBean member){
		int e = sqlSession.update("member.member_Update", member);
		// 검색된 데이터가 없다면
		if (e > 0)
			return true;
		else
			return false;
	}

	
}
