package com.naver.springbox.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.naver.springbox.dto.ConcertBean;
import com.naver.springbox.dto.MemberBean;
import com.naver.springbox.dto.MusicBean;
import com.naver.springbox.dto.PreferenceBean;

public interface PreferenceDao {
	public List<PreferenceBean> getPreferenceList();
	public List<MusicBean> getRecentMusicList(int count) throws SQLException;
	public List<ConcertBean> getRecentConcertList(int count) throws SQLException;
	
	public int getPreferenceMusicCount();
	public int getPreferenceConcertCount();
	
	public List<MusicBean> getPreferenceMusicList(Map<String, Object> map);
	public List<ConcertBean> getPreferenceConcertList(Map<String, Object> map);
	
	// 추천곡
	public List<MemberBean> getPreferenceMemberList(String loginId);
	public List<MusicBean> getPreferenceMusicList2(Map<String, Object> map);
	public int getPreferenceMusicCount(Map<String, Object> map);
	
	//test
	public List<PreferenceBean> getPreferenceMusicList();
}
