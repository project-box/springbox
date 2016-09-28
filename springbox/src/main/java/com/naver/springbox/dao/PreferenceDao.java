package com.naver.springbox.dao;

import java.util.List;

import com.naver.springbox.dto.PreferenceBean;

public interface PreferenceDao {
	public List<PreferenceBean> getPreferenceList();
}
