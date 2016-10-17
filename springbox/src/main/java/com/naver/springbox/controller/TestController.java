package com.naver.springbox.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.naver.springbox.dao.PreferenceDao;
import com.naver.springbox.dto.ConcertBean;
import com.naver.springbox.dto.MemberBean;
import com.naver.springbox.dto.MusicBean;
import com.naver.springbox.dto.PreferenceBean;
import com.naver.springbox.service.PreferenceAction;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/root-context.xml" })

public class TestController {
	@Autowired
	private PreferenceAction preferenceAction;

	@Autowired
	private PreferenceDao preferenceDao;

	//@Test
	public void testUpdatePreference(){
		
		PreferenceBean preference = new PreferenceBean();
		preference.setUser_id("dev");
		preference.setMusic_num(62);
		preference.setRate((float)4.5);
		
		System.out.println(preferenceDao.isExistPreferenceItem(preference));	
	}
	
	//@Test
	public void testPreferenceWithMusic(){
		List<PreferenceBean> list = preferenceDao.getPreferenceMusicList();
		
		for(PreferenceBean bean : list){
			System.out.println(bean.getMusic().getMusic_title());
			//System.out.println(bean.getMusic_num());
		}
	}
	
	@Test
	public void testMusic() {

		MockHttpServletRequest request = new MockHttpServletRequest("POST", "");
		request.setAttribute("page", 1);

		Map map = preferenceAction.suggestMusic("dev", request);

		// assertEquals(map, 1);

		List<MusicBean> list = (List<MusicBean>) map.get("musiclist");

		for (MusicBean music : list) {
			System.out.println(music.getMusic_title());
		}
	}

	//@Test
	public void testConcert() {
		MockHttpServletRequest request = new MockHttpServletRequest("POST", "");
		request.setAttribute("page", 1);

		Map map = preferenceAction.suggestConcert("abraham", request);

		// assertEquals(map, 1);

		List<ConcertBean> list = (List<ConcertBean>) map.get("concertlist");

		if (list != null) {
			for (ConcertBean concert : list) {
				System.out.println(concert.getConcert_title());
			}
		}

	}

	// @Test
	public void testPreferenceMusic() {
		List<MemberBean> list = preferenceDao.getPreferenceMemberList("abraham");
		List<String> userList = new ArrayList<String>();

		for (MemberBean member : list) {
			System.out.println(member.getUser_id());
			userList.add(member.getUser_id());
		}

		Map map = new HashMap<String, Object>();
		map.put("userList", userList);
		map.put("start", 1);
		map.put("end", 10);

		List<MusicBean> musicList = preferenceDao.getPreferenceMusicList2(map);

		for (MusicBean music : musicList) {
			System.out.println(music.getMusic_title());
		}

		int count = preferenceDao.getPreferenceMusicCount(map);
		System.out.println("추천곡 카운트: " + count);
	}
}
