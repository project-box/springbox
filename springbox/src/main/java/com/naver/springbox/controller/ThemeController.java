package com.naver.springbox.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ThemeController {

	@RequestMapping(value = "/theme_sample.box", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {		
		
		return "theme/theme_sample";
	}
}
