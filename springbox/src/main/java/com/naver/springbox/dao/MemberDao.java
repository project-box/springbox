package com.naver.springbox.dao;

import com.naver.springbox.dto.MemberBean;

public interface MemberDao {
	MemberBean getMemberInfo(String memberId);
}
