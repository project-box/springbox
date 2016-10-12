package com.naver.springbox.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.naver.springbox.dto.MusicBean;
import com.naver.springbox.service.MusicAction;

@Controller
public class MusicController {
	/*
	@RequestMapping(value = "/music_list.box", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "music/music_list";
	}*/
	@Autowired
	private MusicAction MusicAction;
	
	/*--------------------글쓰기(관리자)-----------------------*/
	
	@RequestMapping(value = "/music_write.box", method = RequestMethod.GET)
	public String musicWrite(Locale locale, Model model) {

		return "music/music_write";
	}
	
/*--------------------추천곡 등록---------------------*/

	@RequestMapping("/music_add.box")
	public ModelAndView writeBoard(MusicBean dto, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		boolean r = MusicAction.add(dto, request);
		if (r) {
			// 목록보기로 리다이렉트
			mav.setViewName("redirect:music_list.box");
		} else {
			// 글쓰기 페이지로 포워딩
			mav.setViewName("music/music_write");
		}
		return mav;
	}

	
	/*---------------------음악 목록------------------------*/
	
	@RequestMapping("/music_list.box")
	public ModelAndView getMusicList(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		System.out.println("리스트 controller");
			// 게시물 목록 가져오기
			Map<String, Object> map = MusicAction.musicList(request);
			// 여러 개의 데이터를 묶어서 저장할 때는
			// addObject를 사용하지 않고 Map을 저장할 수
			// 있습니다.
			mav.addAllObjects(map);
			// 공지사항을 다음페이지에 전달하기 위해서
			// 저장하기
			mav.setViewName("/music/music_list");
		
		return mav;
	}

	/*--------------------디테일 페이지--------------------------*/
	
	
	@RequestMapping("/music_detail.box")
	public ModelAndView getMusicDetail(int num, HttpServletRequest request){
		
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		System.out.println("디테일 controller");
		
//		// 로그인 정보를 확인해서 로그인 안되어
//		// 있으면 로그인 페이지로 이동
//		if (session.getAttribute("member") == null) {
//			mav.setViewName("/member/login");
//		} else {
			MusicBean dto = MusicAction.musicDetail(num);
//			List<Map<String, Object>> list = replyListAction.getReplyList(num);
			// 데이터를 저장
			mav.addObject("music", dto);
			
			// 출력할 뷰 파일 설정
			mav.setViewName("/music/music_detail");
//		}
		return mav;
	}
	/*----------------------------목록 삭제(관리자)-------------------------*/
	
	@RequestMapping("/music_delete.box")
	public ModelAndView getMusicDetail(@RequestParam("num") int music_num,HttpSession session) {
		ModelAndView mav = new ModelAndView();		
		
		boolean r = (MusicAction).musicDelete(music_num);
		System.out.println("들어옴");
		if (r) {
			mav.setViewName("redirect:music_list.box");
		} else {
			mav.setViewName("index");
		}
		return mav;
	}

}
