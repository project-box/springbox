package com.naver.springbox.dao;

import java.util.Map;

import com.naver.springbox.dto.MemberBean;

public interface MemberDao {
	
	MemberBean getMemberInfo(String userId);
	
	// 회원가입을 처리해주는 메소드
	public boolean insertMember(MemberBean member);
	
	//로그인 id 불러오기 
	MemberBean getIdCheck(String user_Id);
	
	//id 중복체크를 위한
	public boolean IdCheck(String user_Id);
	
	// email 중복 체크를 위한 메소드
	public boolean EmailCheck(String email);
	
	// 로그인 성공에 따라서 로그인횟수 증가시키기
	public void Logincont(String id);
	
	// 비밀번호 생성으로 변경하기
	public boolean Update_pass(Map<String, Object> map);

	//비밀번호 변경을 위한 email 불러오기
	MemberBean getMember(String email);
	
	//회원정보변경을 위해 DB에서 관련 값을 불러오기 위한 아이디 전달하기
	MemberBean getUpdate_getInfo(String loginId);
	
	//회원정보수정을 처리해 주는 메소드
	public boolean updateMember(MemberBean member);




	

	

	

	

	
	

	
}