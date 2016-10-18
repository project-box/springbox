package com.naver.springbox.service;

import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;
import com.naver.springbox.dao.MemberDao;
import com.naver.springbox.dto.MemberBean;

@Service
public class IdCheckAction {
	@Autowired
	private MemberDao memberDao;

	// id 중복 검사를 위한 메소드
	public boolean IdCheck(String user_id) {
		return memberDao.IdCheck(user_id);
	}
}