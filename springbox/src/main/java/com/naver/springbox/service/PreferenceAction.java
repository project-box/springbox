package com.naver.springbox.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.springbox.dao.PreferenceDao;
import com.naver.springbox.dto.PreferenceBean;

@Service
public class PreferenceAction {
	
	@Autowired
	private PreferenceDao preferenceDao;

	public void TestMethod() {
		// 테스트 테스트 코드
		List<PreferenceBean> preferenceList = preferenceDao.getPreferenceList();

		for (PreferenceBean preference : preferenceList) {
			System.out.println(preference.getRate());
		}
	}
}
