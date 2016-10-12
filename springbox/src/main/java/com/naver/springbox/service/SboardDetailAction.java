package com.naver.springbox.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.springbox.dao.SboardDao;
import com.naver.springbox.dto.SboardDto;


@Service
public class SboardDetailAction {
	
	
	@Autowired
	private SboardDao sboardDao;

	public SboardDto execute(int num) {
		SboardDto dto = sboardDao.getSboard(num);
		return dto;
	}
}
	


