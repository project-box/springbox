package com.naver.springbox.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.naver.springbox.dto.ConcertBean;
import com.naver.springbox.dto.HistoryBean;
import com.naver.springbox.dto.MemberBean;
import com.naver.springbox.dto.MusicBean;
import com.naver.springbox.dto.PreferenceBean;

public interface PreferenceDao {
	public List<PreferenceBean> getPreferenceList();
	public List<MusicBean> getRecentMusicList(int count) throws SQLException;
	public List<MusicBean> getSubjectMusicList(Map<String, Object> map) throws SQLException;
	public List<ConcertBean> getRecentConcertList(int count) throws SQLException;
	
	public int countPreferenceMusic();
	public int countPreferenceConcert();
	public int countPreferenceByUser(String userId);
	
	//public List<MusicBean> getPreferenceMusicList(Map<String, Object> map);
	public List<ConcertBean> getPreferenceConcertList(Map<String, Object> map);
	
	// 추천곡
	public List<MemberBean> getPreferenceMemberList(String loginId);
	public List<MusicBean> getPreferenceMusicList2(Map<String, Object> map);
	public int getPreferenceMusicCount(Map<String, Object> map);
	
	// 추천공연
	public List<ConcertBean> getPreferenceConcertList2(Map<String, Object> map);
	public int getPreferenceConcertCount(Map<String, Object> map);
	
	// 로그인한 사용자의 선호도 수정 시 초기 로드에 사용.
	public List<PreferenceBean> getPreferenceMusicList(String userId);
	
	// 선호도 조회
	public boolean isExistPreferenceItem(PreferenceBean preference);
	// 선호도 추가
	public void addPreferenceItem(PreferenceBean preference);
	// 선호도 수정
	public void updatePreferenceItem(PreferenceBean preference);
	// 선호도 삭제
	public void removePreferenceItem(PreferenceBean preference);
	
	// 키워드검색
	public List<String> searchKeyword(String keyword);
	// 음악검색
	public List<MusicBean> searchMusic(String keyword);
	// 공연검색
	public List<ConcertBean> searchConcert(String keyword);
	
	// 공연 히스토리
	public void addConcertHistory(HistoryBean history);
}
