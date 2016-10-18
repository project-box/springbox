package com.naver.springbox.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.springbox.dao.FaqDao;
import com.naver.springbox.dto.FaqBean;



@Service
public class FaqWriteAction {
	
	@Autowired
	private FaqDao faqDao;

	public boolean execute(FaqBean dto) {
		// 가장 큰 글번호를 가져오기
		int num = faqDao.getMaxFaqNum();
		// 글번호 설정
		dto.setFaq_num(num + 1);
		// 공지사항을 데이터베이스에 추가
		boolean r = faqDao.faqWrite(dto);
		return r;
	}
}
	
	
	

