package com.naver.springbox.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.naver.springbox.dto.ConcertBean;
import com.naver.springbox.dto.HistoryBean;
import com.naver.springbox.dto.MemberBean;
import com.naver.springbox.dto.MusicBean;
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

	/* 최신 곡 목록 */
	@Override
	@Transactional
	public List<MusicBean> getRecentMusicList(int count) throws SQLException {
		List<MusicBean> list = sqlSession.selectList("preference.recent_music_list", count);
		return list;
	}
	
	@Override
	@Transactional
	public List<MusicBean> getSubjectMusicList(Map<String, Object> map) {
		List<MusicBean> list = sqlSession.selectList("preference.subject_music_list", map);
		return list;
	}

	/* 공연 목록 */
	@Override
	@Transactional
	public List<ConcertBean> getRecentConcertList(int count) throws SQLException {
		List<ConcertBean> list = sqlSession.selectList("preference.recent_concert_list", count);
		return list;
	}

	@Override
	public int countPreferenceMusic() {
		return Integer.parseInt(sqlSession.selectOne("preference.count_preference_music_list").toString());
	}

	@Override
	public int countConcertList() {
		return Integer.parseInt(sqlSession.selectOne("preference.count_preference_concert_list").toString());
	}
	
	@Override
	public int countPreferenceByUser(String userId){
		return Integer.parseInt(sqlSession.selectOne("preference.count_preference_music_by_user", userId).toString());
	}

	@Override
	public List<ConcertBean> getConcertList(Map<String, Object> map) {
		List<ConcertBean> list = sqlSession.selectList("preference.preference_concert_list", map);
		return list;
	}

	@Override
	public List<MemberBean> getPreferenceMemberList(String userId) {
		List<MemberBean> list = sqlSession.selectList("preference.preference_member_list", userId);
		return list;
	}

	@Override
	public List<MusicBean> getPreferenceMusicList(Map<String, Object> map) {
		List<MusicBean> list = sqlSession.selectList("preference.preference_music_list2", map);
		return list;
	}

	@Override
	public int countPreferenceMusic(Map<String, Object> map) {
		return Integer.parseInt(sqlSession.selectOne("preference.preference_music_count", map).toString());
	}
	
	@Override
	public List<ConcertBean> getPreferenceConcertList(Map<String, Object> map) {
		List<ConcertBean> list = sqlSession.selectList("preference.preference_concert_list2", map);
		return list;
	}

	@Override
	public int getPreferenceConcertCount(Map<String, Object> map) {
		return Integer.parseInt(sqlSession.selectOne("preference.preference_concert_count", map).toString());
	}

	@Override
	public List<PreferenceBean> getPreferenceItems(String userId) {
		List<PreferenceBean> list = sqlSession.selectList("preference.preference_music", userId);
		return list;
	}

	@Override
	public boolean isExistPreferenceItem(PreferenceBean preference) {

		int count = sqlSession.selectOne("preference.count_preference_music", preference);

		if (count == 0)
			return false;
		else
			return true;
	}

	@Override
	public void addPreferenceItem(PreferenceBean preference) {
		sqlSession.insert("preference.add_preference_item", preference);
	}

	@Override
	public void updatePreferenceItem(PreferenceBean preference) {
		sqlSession.update("preference.update_preference_item", preference);
	}

	@Override
	public void removePreferenceItem(PreferenceBean preference) {
		sqlSession.delete("preference.remove_preference_item", preference);
	}
	
	@Override
	public List<String> searchKeyword(String keyword){
		// 한쪽에 % 기호를 마이바티스에서 넣는 방법을 찾지 못해 호출 할 때 % 넣어줌.
		// searchMusic, searchConcert에서는 마이바티스 xml 에서 처리
		List<String> list = sqlSession.selectList("search_content_title", keyword + "%");
		return list;
	}
	
	@Override
	public List<MusicBean> searchMusic(String keyword){
		List<MusicBean> list = sqlSession.selectList("search_content_music", keyword);
		return list;
	}
	
	@Override
	public List<ConcertBean> searchConcert(String keyword){
		List<ConcertBean> list = sqlSession.selectList("search_content_concert", keyword);
		return list;
	}
	
	@Override
	public void addConcertHistory(HistoryBean history){
		sqlSession.insert("add_concert_history", history);
	}
}
