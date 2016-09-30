package com.naver.springbox.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.naver.springbox.dto.ConcertBean;
import com.naver.springbox.service.ConcertAction;


@Controller
public class ConcertController {

	@Autowired
	private ConcertAction concertAction;
	
	
	@RequestMapping(value = "/concert_list.box", method = RequestMethod.GET)
	public String list(Locale locale, Model model) {

		return "concert/concert_list";
	}
	
	
	
	/*@RequestMapping("/concert_list.box")
	public ModelAndView getConcertList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
			// 게시물 목록 가져오기
			Map<String, Object> map = concertAction.execute(request);
			// 여러 개의 데이터를 묶어서 저장할 때는
			// addObject를 사용하지 않고 Map을 저장할 수
			// 있습니다.
			mav.addAllObjects(map);
			// 공지사항을 다음페이지에 전달하기 위해서
			// 저장하기
			mav.setViewName("/concert/concert_list");
		
		return mav;
	}*/


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
