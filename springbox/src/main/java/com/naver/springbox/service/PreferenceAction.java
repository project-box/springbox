package com.naver.springbox.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.springbox.dao.PreferenceDao;
import com.naver.springbox.dto.ConcertBean;
import com.naver.springbox.dto.MusicBean;
import com.naver.springbox.dto.PreferenceBean;

@Service
public class PreferenceAction {

	@Autowired
	private PreferenceDao preferenceDao;

	public void TestMethod() {
		// 테스트 테스트 코드
		List<PreferenceBean> preferenceList = preferenceDao.getPreferenceList();

		for (PreferenceBean preference : preferenceList) {
			System.out.println(preference.getRate());
		}
	}

	// 추천곡 목록을 가져오는 메서드(예정)
	public List<MusicBean> suggestMusic(String userId) {
		return getMusicList(10);
	}

	// 추천공연 목록을 가져오는 메서드(예정)
	public List<ConcertBean> suggestConcert(String userId) {
		return getConcertList(10);
	}
	
	// ToDo: try~catch 밑에 null을 리턴하는게 맞는가?
	public List<MusicBean> getMusicList(int count){
		try {
			return preferenceDao.getRecentMusicList(count);	
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// ToDo: try~catch 밑에 null을 리턴하는게 맞는가?
	public List<ConcertBean> getConcertList(int count){
		try{
			return preferenceDao.getConcertList(count);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
