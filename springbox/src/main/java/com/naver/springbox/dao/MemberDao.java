package com.naver.springbox.dao;

import com.naver.springbox.dto.MemberBean;

public interface MemberDao {
	MemberBean getMemberInfo(String memberId);
	
	// 회원가입을 처리해주는 메소드
	public boolean insertMember(MemberBean member);
	
	//로그인 id 불러오기 
	MemberBean getIdCheck(String user_Id);
	
	//id 중복체크를 위한
	public boolean IdCheck(String user_Id);
	
	// email 중복 체크를 위한 메소드
	public boolean EmailCheck(String email);

	
}