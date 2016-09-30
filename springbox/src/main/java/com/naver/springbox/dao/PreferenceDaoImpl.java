package com.naver.springbox.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.naver.springbox.dto.ConcertBean;
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

	/* 공연 목록 */
	@Override
	@Transactional
	public List<ConcertBean> getConcertList(int count) throws SQLException {
		List<ConcertBean> list = sqlSession.selectList("preference.recent_concert_list", count);
		return list;
	}

}
