package com.naver.springbox.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.springbox.dao.ReplyDao;
import com.naver.springbox.dto.PreferenceBean;


@Service
public class ReplyInsertAction {
	
	@Autowired
	private ReplyDao replyDao;

	
	// request를 매개변수로 받아서 Dao를 호출하는 메소드
	public boolean execute(HttpServletRequest request) {
		// 파라미터 가져오기
		int num = Integer.parseInt(request.getParameter("num"));
		String content = request.getParameter("comment");
		// 세션 가져오기
		HttpSession session = request.getSession();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("content", content);
		map.put("s_num", num);
		PreferenceBean member = (PreferenceBean) session.getAttribute("member");
		map.put("user_id", member.getUser_id());
		return replyDao.insertReply(map);
	}
}
	


