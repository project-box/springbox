package com.naver.springbox.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.springbox.dao.MemberDao;
import com.naver.springbox.dto.MemberBean;

@Service
public class Member_getInfo {

	@Autowired
	private MemberDao memberdao;

	public MemberBean getUpdate_getInfo(String loginId) {
		return memberdao.getUpdate_getInfo(loginId);
	}
}
