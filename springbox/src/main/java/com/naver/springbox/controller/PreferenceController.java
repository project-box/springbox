package com.naver.springbox.controller;

import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.naver.springbox.service.PreferenceAction;

@Controller
public class PreferenceController {
	
	@Autowired
	private PreferenceAction preferenceAction;
	
	@RequestMapping(value = "/front.box", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		preferenceAction.TestMethod();
		
		return "front/main";
	}
	
	@RequestMapping(value = "/main.box", method = RequestMethod.GET)
	public ModelAndView mainBox(Locale locale, Model model, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("musiclist", preferenceAction.getMusicList(10));
		mav.addObject("concertlist", preferenceAction.getConcertList(5));
		mav.setViewName("front/main");
		
		return mav;
		//return "front/main";
	}
}
