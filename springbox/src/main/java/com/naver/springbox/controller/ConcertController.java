package com.naver.springbox.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ConcertController {
private static final Logger logger = LoggerFactory.getLogger(MusicController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/concertSample.box", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		System.out.println("콘서트!");
		
		return "concert/concert_sample";
	}
}
