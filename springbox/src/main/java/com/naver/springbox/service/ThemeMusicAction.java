package com.naver.springbox.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.springbox.dao.ThemeMusicDao;
import com.naver.springbox.dto.ThemeMusicBean;

@Service
public class ThemeMusicAction {
	
	@Autowired
	private ThemeMusicDao themeMusicDao;
	
	public List<ThemeMusicBean> getThemeMusicList(){
		return themeMusicDao.getThemeMusicList();
	}
	
}
