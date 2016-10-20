package com.naver.springbox.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.springbox.service.PreferenceAction;

// FrontController로 바꾸는게 좋지 않을까?
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
		// return "front/main";
	}

	@RequestMapping(value = "/make_preference.box", method = RequestMethod.GET)
	public ModelAndView makePreference(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("loginId");
		
		mav.addObject("musiclist", preferenceAction.getSubjectMusicList(loginId, 50));
		mav.addObject("preferenceCount", preferenceAction.getPreferenceCountByUser(loginId));
		mav.setViewName("preference/make_preference");
		return mav;
	}

	@RequestMapping(value = "/edit_preference.box", method = RequestMethod.GET)
	public ModelAndView editPreference(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("loginId");
		
		mav.addObject("preferenceList", preferenceAction.getPreferenceMusic(loginId));
		mav.addObject("preferenceCount", preferenceAction.getPreferenceCountByUser(loginId));
		mav.setViewName("preference/edit_preference");
		return mav;
	}

	@RequestMapping(value = "/update_preference.box", method = RequestMethod.POST)
	@ResponseBody
	public int updatePreference(HttpServletRequest request) {

		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("loginId");

		int musicNum = Integer.parseInt(request.getParameter("music_num").toString());
		float rate = Float.parseFloat(request.getParameter("rate").toString());

		return preferenceAction.updatePreference(loginId, musicNum, rate);
	}

	@RequestMapping(value = "/remove_preference.box", method = RequestMethod.POST)
	@ResponseBody
	public int removePreference(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String loginId = (String) session.getAttribute("loginId");
		
		int musicNum = Integer.parseInt(request.getParameter("music_num").toString());
		
		preferenceAction.removePreference(loginId, musicNum);
		
		return musicNum;
	}

	@RequestMapping(value = "/search_content.box")
	public ModelAndView searchContent(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		String keyword = request.getParameter("keyword");
		
		if(keyword != null){
			mav.addAllObjects(preferenceAction.searchContent(keyword));
		}
		mav.setViewName("front/Search");
		return mav;
	}
	
	@RequestMapping(value="/get_keyword.box")
	@ResponseBody
	public List getKeyword(HttpServletRequest request){
		String keyword = request.getParameter("query");
		return preferenceAction.searchKeyword(keyword);
	}
}
