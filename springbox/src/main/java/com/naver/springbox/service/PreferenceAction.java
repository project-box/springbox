package com.naver.springbox.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.springbox.dao.PreferenceDao;
import com.naver.springbox.dto.ConcertBean;
import com.naver.springbox.dto.MemberBean;
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

	// 추천곡 목록을 가져오는 메서드
	public Map<String, Object> suggestMusic(String userId, HttpServletRequest request) {

		// 기본적으로 사용할 페이지 번호 설정
		int page = 1;
		// 한 페이지에 출력할 데이터 개수 설정
		int limit = 10;
		// page 파라미터의 값이 있으면 정수로 변환해서
		// page에 대입
		System.out.println("추천곡 Action1");
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		// page와 limit을 이용해서 시작하는 데이터 번호와
		// 끝나는 번호를 계산
		// page=1 start=01, page=2 start=11, page=3 start=21

		int start = (page - 1) * limit + 1;
		int end = start + limit - 1;
		// 위 2개의 값을 Map을 생성해서 start와 end라는
		// 키로 저장
		Map<String, Object> map = new HashMap<String, Object>();

		System.out.println("추천곡 Action2");
		
		// 로그인 사용자에 따른 추천곡을 가져오기 위한 코드
		// 1. 로그인 사용자와 취향이 유사한 사용자들을 조회한다.
		List<MemberBean> memberList = preferenceDao.getPreferenceMemberList(userId);
		System.out.println("memberList="+memberList);
		List<String> userList = new ArrayList<String>();

		System.out.println("추천곡 Action3");
		for (MemberBean member : memberList) {
			userList.add(member.getUser_id());
		}

		map.put("userList", userList);
		map.put("start", start);
		map.put("end", end);

		System.out.println("userList="+userList);
		// 2. 사용자들을 통해 선호도가 높은 곡들을 가져온다.
		List<MusicBean> list = preferenceDao.getPreferenceMusicList2(map);

		System.out.println("list="+list);
		System.out.println("추천곡 Action4");
		// 데이터 가져오기
		// List<MusicBean> list = preferenceDao.getPreferenceMusicList(map);

		// 전체 데이터 개수 가져오기
		// int listcount = preferenceDao.getPreferenceMusicCount();
		int listcount = preferenceDao.getPreferenceMusicCount(map);
		System.out.println("listcount="+listcount);
		
		// 가장 큰 페이지 번호 계산
		int maxpage = (int) ((double) listcount / limit + 0.95);
		// 시작하는 페이지 번호 계산
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 마지막 페이지 번호 계산
		int endpage = maxpage;
		System.out.println("추천곡 Action5");
		if (endpage > (startpage + 9)) {
			endpage = startpage + 9;
		}

		Map<String, Object> resultMap = new HashMap<String, Object>();
		System.out.println("추천곡 Action6");
		resultMap.put("page", page);
		resultMap.put("listcount", listcount);
		resultMap.put("musiclist", list);
		resultMap.put("maxpage", maxpage);
		resultMap.put("startpage", startpage);
		resultMap.put("endpage", endpage);

		return resultMap;
	}

	// 추천공연 목록을 가져오는 메서드(추천 알고리즘 변경 예정)
	public Map<String, Object> suggestConcert(String userId, HttpServletRequest request) {
		// 기본적으로 사용할 페이지 번호 설정
		int page = 1;
		// 한 페이지에 출력할 데이터 개수 설정
		int limit = 10;
		// page 파라미터의 값이 있으면 정수로 변환해서
		// page에 대입
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		// page와 limit을 이용해서 시작하는 데이터 번호와
		// 끝나는 번호를 계산
		// page=1 start=01, page=2 start=11, page=3 start=21
		int start = (page - 1) * limit + 1;
		int end = start + limit - 1;
		// 위 2개의 값을 Map을 생성해서 start와 end라는
		// 키로 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		// 데이터 가져오기
		List<ConcertBean> list = preferenceDao.getPreferenceConcertList(map);
		// 전체 데이터 개수 가져오기
		int listcount = preferenceDao.countPreferenceConcert();

		// 가장 큰 페이지 번호 계산
		int maxpage = (int) ((double) listcount / limit + 0.95);
		// 시작하는 페이지 번호 계산
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 마지막 페이지 번호 계산
		int endpage = maxpage;
		if (endpage > (startpage + 9)) {
			endpage = startpage + 9;
		}

		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("page", page);
		resultMap.put("listcount", listcount);
		resultMap.put("concertlist", list);
		resultMap.put("maxpage", maxpage);
		resultMap.put("startpage", startpage);
		resultMap.put("endpage", endpage);

		return resultMap;
	}

	// ToDo: try~catch 밑에 null을 리턴하는게 맞는가?
	public List<MusicBean> getMusicList(int count) {
		try {
			return preferenceDao.getRecentMusicList(count);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// ToDo: try~catch 밑에 null을 리턴하는게 맞는가?
	public List<ConcertBean> getConcertList(int count) {
		try {
			return preferenceDao.getRecentConcertList(count);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int updatePreference(String loginId, int musicNum, float rate) {

		PreferenceBean preference = new PreferenceBean();
		preference.setUser_id(loginId);
		preference.setMusic_num(musicNum);
		preference.setRate(rate);

		if (preferenceDao.isExistPreferenceItem(preference)) {
			// update
			preferenceDao.updatePreferenceItem(preference);
			return 0;

		} else {
			// insert
			preferenceDao.addPreferenceItem(preference);
			return 1;
		}

	}

	public void removePreference(String loginId, int musicNum) {
		PreferenceBean preference = new PreferenceBean();
		preference.setUser_id(loginId);
		preference.setMusic_num(musicNum);

		preferenceDao.removePreferenceItem(preference);
	}

	public List<MusicBean> getSubjectMusicList(String loginId, int count) {
		try {

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userId", loginId);
			map.put("count", count);

			return preferenceDao.getSubjectMusicList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<PreferenceBean> getPreferenceMusic(String loginId) {
		return preferenceDao.getPreferenceMusicList(loginId);
	}

	public int getPreferenceCountByUser(String userId) {
		return preferenceDao.countPreferenceByUser(userId);
	}

	public ArrayList<Map<String, String>> searchKeyword(String keyword) {

		List<String> results = preferenceDao.searchKeyword(keyword);

		Map<String, String> jsonSubObject = null;
		ArrayList<Map<String, String>> jsonList = new ArrayList<Map<String, String>>();

		for (String result : results) {
			jsonSubObject = new HashMap<String, String>();
			jsonSubObject.put("keyword", result);
			jsonList.add(jsonSubObject);
		}

		return jsonList;
	}
	
	public Map<String, Object> searchContent(String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("resultMusic", preferenceDao.searchMusic(keyword));
		map.put("resultConcert", preferenceDao.searchConcert(keyword));
		
		return map;
	}
}
