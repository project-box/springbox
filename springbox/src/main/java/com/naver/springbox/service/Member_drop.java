package com.naver.springbox.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.springbox.dao.MemberDao;
import com.naver.springbox.dto.MemberBean;

@Service
public class Member_drop {
	
	@Autowired
	private MemberDao memberDao;
	
	public boolean memberDown(MemberBean user){
		return memberDao.memberDown(user);
	}
		

}
