package com.naver.springbox.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.mail.SimpleEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.springbox.dao.MemberDao;
import com.naver.springbox.dto.MemberBean;



@Service
public class Member_passset {
	
	@Autowired
	private MemberDao memberDao;

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	public boolean Update_pass(HttpServletRequest request) {
		boolean result = false;
		String email = request.getParameter("email");
		MemberBean member = memberDao.getMember(email);
		
		if (member == null) {
			request.setAttribute("result", "1");
		} else {
			SimpleEmail simpleEmail = new SimpleEmail();
			simpleEmail.setHostName("smtp.naver.com");
			simpleEmail.setSmtpPort(587);
			simpleEmail.setAuthentication("master", "0000");

			try {
				simpleEmail.setSSL(true);
				simpleEmail.setTLS(true);
				simpleEmail.setCharset("utf-8");

				simpleEmail.addTo(email, "이름", "utf-8");
				simpleEmail.setFrom("master@domin", "관리자", "utf-8");
				simpleEmail.setSubject("비번 보내기");

				Random r = new Random();
				String pw = "";
				
				for (int i = 0; i < 7; i++) {
					int x = Math.abs(r.nextInt(62));
					if (x >= 0 && x <= 9) {
						x = x + 48;
					} else if (x >= 10 && x < 36) {
						x = x + 55;
					} else {
						x = x + 61;
					}
					pw = pw + (char) x;
				}
				simpleEmail.setMsg("새로운 비번\n" + pw);

				simpleEmail.send();

				Map<String, Object> map = new HashMap<String, Object>();
				map.put("email", email);
				map.put("pw", pw);
				result = memberDao.Update_pass(map);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
}
