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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.naver.springbox.dto.ConcertBean;
import com.naver.springbox.dto.ConcertBoardBean;
import com.naver.springbox.service.ConcertAction;
import com.naver.springbox.service.PreferenceAction;

@Controller
public class ConcertController {

	@Autowired
	private ConcertAction concertAction;
	
	
	/*--------------------글쓰기(관리자)-----------------------*/
	
	@RequestMapping(value = "/concert_write.box", method = RequestMethod.GET)
	public String concertWrite(Locale locale, Model model) {

		return "concert/concert_write";
	}
	
/*--------------------추천공연 등록---------------------*/

	
	@RequestMapping("concert_add.box")
	public ModelAndView writeBoard(ConcertBean dto, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		boolean r = concertAction.add(dto, request);

		
		
		if (r) {
			// 목록보기로 리다이렉트
			mav.setViewName("redirect:concert_list.box");
		} else {
			// 글쓰기 페이지로 포워딩
			mav.setViewName("concert/concert_write");
		}
		return mav;
	}
	
	
//	@RequestMapping(value = "/concert_list.box", method = RequestMethod.GET)
//	public String list(Locale locale, Model model) {
//
//		return "concert/concert_list";
//	}
	
	/*---------------------콘서트목록------------------------*/
	
	@Autowired
	private PreferenceAction preferenceAction;
	
	
	@RequestMapping("/concert_list.box")
	public ModelAndView getConcertList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		String userId = (String) session.getAttribute("loginId");		
	
			// 게시물 목록 가져오기
			Map<String, Object> map = preferenceAction.suggestConcert(userId, request);
			// 여러 개의 데이터를 묶어서 저장할 때는
			// addObject를 사용하지 않고 Map을 저장할 수
			// 있습니다.
			mav.addAllObjects(map);
			// 공지사항을 다음페이지에 전달하기 위해서
			// 저장하기
			mav.setViewName("/concert/concert_list");
			
			
		
		return mav;
	}

//	@RequestMapping(value = "/concert_detail.box", method = RequestMethod.GET)
//	public String detail(Locale locale, Model model) {
//	
//		return "concert/concert_detail";
//	}
	
	/*--------------------디테일페이지--------------------------*/
	
	
//	@Autowired
//	private ConcertBoardBean concertboardDao;
	
	@RequestMapping("/concert_detail.box")
	public ModelAndView getConcertDetail(int concert_num, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
			ConcertBean dto = concertAction.concertDetail(concert_num);
			List <ConcertBoardBean> list= concertAction.concertboardList(concert_num);
			int listcount=concertAction.concertboardListCount(concert_num);
			
			// 데이터를 저장
			mav.addObject("concertdata", dto);
			mav.addObject("concertboarddata", list);
			mav.addObject("concertboardlistcount",listcount);
			// 출력할 뷰 파일 설정
			mav.setViewName("/concert/concert_detail");
//		}

		return mav;
	}
	
	/*----------------------------목록 삭제(관리자)-------------------------*/
	
	@RequestMapping("/concert_delete.box")
	public ModelAndView getConcertDelete(int num,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();		
		
		boolean r = (concertAction).concertDelete(num);
		System.out.println("들어옴");
		if (r) {
			mav.setViewName("redirect:concert_list.box");
		} else {
			mav.setViewName("index");
		}
		
		return mav;
	}
	
	
	

	@RequestMapping(value = "/book.box", method = RequestMethod.GET)
	public String book(Locale locale, Model model) {

		return "concert/book";
	}

	@RequestMapping(value = "/book_list.box", method = RequestMethod.GET)
	public String bookList(Locale locale, Model model) {

		return "concert/book_list";
	}
	
	/*-----------------------후기 등록-----------------------------------*/
	
	@RequestMapping("/concertboard_add.box")
	public ModelAndView getConcertboardAdd(ConcertBoardBean dto, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// 로그인 되어 있지 않으면 로그인 페이지로 이동
		HttpSession session = request.getSession();
		
			// 데이터 삽입
			boolean r = concertAction.concertboardadd(dto, request);
		
				// 상세보기 수행
				// 글번호가져오기
				int num = Integer.parseInt(request.getParameter("concert_num"));
				// redirect 할 때는 출력할 파일이름을
				// 직접 사용하지 않고 요청 주소를 이용합니다.
				mav.setViewName("redirect:concert_detail.box?concert_num=" + num+"&param=123");
			
		
		return mav;
	}
	
/*----------------------------후기 삭제(관리자)-------------------------*/
	
	@RequestMapping("/concertboard_delete.box")
	public String getConcertBoardDelete(int concertboard_num, int concert_num,
			HttpSession session) {	
		
		concertAction.concertboardDelete(concertboard_num);

		return "redirect:concert_detail.box?concert_num=" + concert_num+"&param=123";
	}
	

	

}
