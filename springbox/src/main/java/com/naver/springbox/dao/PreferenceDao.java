package com.naver.springbox.dao;

import java.sql.SQLException;
import java.util.List;

import com.naver.springbox.dto.ConcertBean;
import com.naver.springbox.dto.MusicBean;
import com.naver.springbox.dto.PreferenceBean;

public interface PreferenceDao {
	public List<PreferenceBean> getPreferenceList();
	public List<MusicBean> getRecentMusicList(int count) throws SQLException;
	public List<ConcertBean> getConcertList(int count) throws SQLException;
}
