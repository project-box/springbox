package com.naver.springbox.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.naver.springbox.dao.MemberDao;
import com.naver.springbox.dto.MemberBean;

@Service
public class Member_update {

	@Autowired MemberDao memberdao;
	
	public boolean updateMember(MemberBean member) throws Exception {
		boolean result = false;
		
		if (memberdao.updateMember(member))
			result = true;	
		
		return result;
	}
}
