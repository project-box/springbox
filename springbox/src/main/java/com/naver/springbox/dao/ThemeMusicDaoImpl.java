package com.naver.springbox.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.springbox.dto.ThemeMusicBean;

@Repository
public class ThemeMusicDaoImpl implements ThemeMusicDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ThemeMusicBean> getThemeMusicList() {
		
		List<ThemeMusicBean> list = sqlSession.selectList("theme.theme_list");
		return list;
		
	}
	
}
