package com.naver.springbox.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.springbox.dao.SboardDao;
import com.naver.springbox.dto.SboardDto;



@Service
public class SboardModifyView {
	
	@Autowired
	private SboardDao sboardDao;

	// 글번호를 매개변수로 받아서 하나의 BoardDto를
	// 리턴해주는 메소드
	public SboardDto execute(int num) {
		SboardDto dto = sboardDao.getSboard(num);
		return dto;
	}

}