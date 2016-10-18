package com.naver.springbox.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.springbox.dao.ReplyDao;
import com.naver.springbox.dto.MemberBean;


@Service
public class ReplyInsertAction {
	
	@Autowired
	private ReplyDao replyDao;

	
	// request를 매개변수로 받아서 Dao를 호출하는 메소드
	public boolean execute(HttpServletRequest request) {
		// 파라미터 가져오기
		int s_num = Integer.parseInt(request.getParameter("num"));
		String sr_content = request.getParameter("comment");
		// 세션 가져오기
		HttpSession session = request.getSession();
		MemberBean users = (MemberBean)session.getAttribute("users");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sr_content", sr_content);
		map.put("s_num", s_num);		
		map.put("user_id", users.getUser_id());
		
		
		return replyDao.insertReply(map);
	}
}
	


