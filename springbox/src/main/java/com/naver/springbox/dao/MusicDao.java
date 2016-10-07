package com.naver.springbox.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.naver.springbox.dto.ConcertBean;
import com.naver.springbox.dto.MusicBean;


public interface MusicDao {
	
	public int getMusicListCount();
	
	public List<MusicBean> getMusicList(Map<String, Object>map);

	public MusicBean getMusicDetail(int num);
	
	public boolean insertMusic(MusicBean dto);
	
	public boolean deleteMusic(int num);

	
}