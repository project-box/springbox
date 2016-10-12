package com.naver.springbox.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.springbox.dao.FaqDao;
import com.naver.springbox.dto.FaqBean;


@Service
public class FaqListAction {
	
	@Autowired
	private FaqDao faqDao;

	public List<FaqBean> execute() {
		return faqDao.faqList();
	}
}
	
	


