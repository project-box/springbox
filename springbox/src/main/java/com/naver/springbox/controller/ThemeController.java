package com.naver.springbox.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.naver.springbox.service.ThemeMusicAction;

@Controller
public class ThemeController {
	
	@Autowired
	private ThemeMusicAction themeMusicAction;

	@RequestMapping(value = "/theme_sample.box", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {		
		
		return "theme/theme_sample";
	}
	
	@RequestMapping(value = "/theme_music_list.box", method = RequestMethod.GET)
	public ModelAndView themeMusicList(Locale locale, Model model) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("themeMusicList", themeMusicAction.getThemeMusicList());
		mav.setViewName("theme/themeMusicList");
		
		return mav;
	}
}
