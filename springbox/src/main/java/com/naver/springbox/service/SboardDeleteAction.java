package com.naver.springbox.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.springbox.dao.SboardDao;



@Service
public class SboardDeleteAction {
	

	@Autowired
	private SboardDao sboardDao;

	public boolean execute(int num) {
		return sboardDao.deleteSboard(num);
	}
}



