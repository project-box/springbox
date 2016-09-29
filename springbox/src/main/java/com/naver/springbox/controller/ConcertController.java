package com.naver.springbox.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




@Controller
public class ConcertController {
	
	@RequestMapping(value = "/concert_list.box", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "concert/concert_list";
	}
	
	@RequestMapping(value = "/concert_detail.box", method = RequestMethod.GET)
	public String detail(Locale locale, Model model) {
		
		return "concert/concert_detail";
	}
	
	@RequestMapping(value = "/book.box", method = RequestMethod.GET)
	public String book(Locale locale, Model model) {
		
		return "concert/book";
	}
	
	@RequestMapping(value = "/book_list.box", method = RequestMethod.GET)
	public String bookList(Locale locale, Model model) {
		
		return "concert/book_list";
	}
	
	
	
	
	
	
}
