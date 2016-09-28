package com.naver.springbox.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.naver.springbox.dto.PreferenceBean;

@Repository
public class PreferenceDaoImpl implements PreferenceDao {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	@Transactional
	public List<PreferenceBean> getPreferenceList() {
		return sqlSession.selectList("preference.preference_list");
	}

}
