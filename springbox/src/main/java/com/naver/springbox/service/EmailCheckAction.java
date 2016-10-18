package com.naver.springbox.service;

import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;
import com.naver.springbox.dao.MemberDao;
import com.naver.springbox.dto.MemberBean;

@Service
public class EmailCheckAction {
	
	@Autowired
	private MemberDao memberDao;

	// email 중복 검사를 위한 메소드
	public boolean EmailCheck(String email) {
		return memberDao.EmailCheck(email);
	}

}
