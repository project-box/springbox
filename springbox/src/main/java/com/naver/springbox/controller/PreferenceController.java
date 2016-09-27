package com.naver.springbox.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naver.springbox.dao.MusicDao;
import com.naver.springbox.dto.MusicBean;

@Controller
public class PreferenceController {
	
	@Autowired
	private MusicDao musicDao;
	
	@RequestMapping(value = "/front.box", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		
		// 테스트 테스트 코드
		List<MusicBean> musicList = musicDao.getMusicList();
		
		for(MusicBean music : musicList){
			System.out.println(music.getMusic_title());
		}
		
		return "front/main";
	}
}
