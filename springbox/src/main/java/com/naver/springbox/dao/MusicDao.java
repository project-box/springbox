package com.naver.springbox.dao;

import java.util.List;

import com.naver.springbox.dto.MusicBean;

public interface MusicDao {
	public List<MusicBean> getMusicList();
}
