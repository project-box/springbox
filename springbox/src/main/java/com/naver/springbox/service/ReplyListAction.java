package com.naver.springbox.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.springbox.dao.ReplyDao;


@Service
public class ReplyListAction {
	
	

	@Autowired
	private ReplyDao replyDao;
	
	public List<Map<String, Object>> getReplyList(int num) {
		List<Map<String, Object>> list = replyDao.getReplyList(num);
		
		
		return list;
	}
}


