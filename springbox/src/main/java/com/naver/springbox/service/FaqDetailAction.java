package com.naver.springbox.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.springbox.dao.FaqDao;
import com.naver.springbox.dto.FaqBean;


@Service
public class FaqDetailAction {
	
		@Autowired
		private FaqDao faqDao;

		public FaqBean execute(String num) {
			int faqnum = Integer.parseInt(num);
			boolean r = faqDao.readCountUpdate(faqnum);
			if (r == false)
				return null;
			else
				return faqDao.getFaq(faqnum);
			// noticeNum 에 해당하는 DTO를 전달

		}

	}



