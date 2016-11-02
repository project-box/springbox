package com.naver.springbox.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.springbox.dao.MemberDao;

@Service
public class MemberLogincont {
	
	@Autowired
	private MemberDao memberDao;
	
	public void Logincont(String id) throws Exception{
		memberDao.Logincont(id);
	}
}
