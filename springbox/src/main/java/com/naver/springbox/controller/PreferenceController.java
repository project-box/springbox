package com.naver.springbox.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String mainBox(Locale locale, Model model) {
		
		return "front/main";
	}
}
