package com.naver.springbox.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.naver.springbox.dto.MusicBean;
import com.naver.springbox.service.MusicAction;
import com.naver.springbox.service.PreferenceAction;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class MusicController {

	@Autowired
	private MusicAction musicAction;
	@Autowired 
	private PreferenceAction preferenceAction;

	@RequestMapping(value="/music_write.box", method = RequestMethod.GET)
	public ModelAndView musicWrite (){
		
		System.out.println("곡등록controller");
		
		ModelAndView mav = new ModelAndView("music/music_write");

		return mav;
	}
	
	/* ---------------최신곡 등록-----------------*/
	@RequestMapping(value="/MusicAction.box", method = RequestMethod.POST)
	public ModelAndView musicWrite (HttpServletRequest request){
		
		System.out.println("곡등록controller0");
		
		ModelAndView mav = new ModelAndView();
		MusicBean dto = new MusicBean(); 		
				
		String realFolder = "";
		String saveFolder = "upload";

		int fileSize = 5 * 1024 * 1024;

		realFolder = request.getRealPath(saveFolder);

		boolean r = false;
		try {

			MultipartRequest multi = null;

			multi = new MultipartRequest(request, realFolder, fileSize, "utf-8", new DefaultFileRenamePolicy());

			DateFormat sdFormat = new SimpleDateFormat("MM/dd/yyyy");
			String d = multi.getParameter("music_publishdate").trim();
			Date pDate = sdFormat.parse(d);
			System.out.println("d="+d);
			System.out.println("date="+pDate.toString());
			

			dto.setMusic_title(multi.getParameter("music_title").trim());
			dto.setMusic_artist(multi.getParameter("music_artist").trim());
			dto.setMusic_genre(multi.getParameter("music_genre").trim());
			dto.setMusic_publishdate(pDate);
			dto.setMusic_lyrics(multi.getParameter("music_lyrics").trim());
			dto.setMusic_album(multi.getParameter("music_album").trim());
			dto.setAlbumcoverfilepath(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));

			/*System.out.println("music_title="+dto.getMusic_title());*/
			r = musicAction.add(dto);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		if (r){
			mav.setViewName("redirect:/music_list.box");
		}else{
			mav.setViewName("./music_write");
		}
		return mav;	
	}

	/*---------------------최신곡 목록------------------------*/
	
	@RequestMapping("/music_list.box")
	public ModelAndView getMusicList(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println("리스트 controller");
			// 게시물 목록 가져오기
			Map<String, Object> map = musicAction.musicList(request);
			// 여러 개의 데이터를 묶어서 저장할 때는
			// addObject를 사용하지 않고 Map을 저장할 수
			// 있습니다.
			mav.addAllObjects(map);
			// 공지사항을 다음페이지에 전달하기 위해서
			// 저장하기
			mav.setViewName("/music/music_list");
		
		return mav;
	}
	/*--------------------팝업창 페이지--------------------------*/
	
	
	@RequestMapping("/music_pop.box")
	public ModelAndView getMusicPop(int num){
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println("팝업창 controller");

			MusicBean dto = musicAction.musicPop(num);

			mav.addObject("music", dto);
			mav.setViewName("/music/music_pop");

		return mav;
	}

	/*--------------------디테일 페이지--------------------------*/

	@RequestMapping("/music_detail.box")
	public ModelAndView getMusicDetail(int num){
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println("디테일 controller");
		
//		// 로그인 정보를 확인해서 로그인 안되어
//		// 있으면 로그인 페이지로 이동
//		if (session.getAttribute("member") == null) {
//			mav.setViewName("/member/login");
//		} else {
			MusicBean dto = musicAction.musicDetail(num);
//			List<Map<String, Object>> list = replyListAction.getReplyList(num);
			// 데이터를 저장
			mav.addObject("music", dto);
			
			// 출력할 뷰 파일 설정
			mav.setViewName("/music/music_detail");
//		}
		return mav;
	}
	
/*----------------------------곡 수정페이지 불러오기(관리자)-------------------------*/
	
	@RequestMapping("/music_modify.box")
	public ModelAndView musicmodify(@RequestParam("num") int num, HttpServletRequest request){
		System.out.println("곡 수정 Controller");
		
		ModelAndView mav = new ModelAndView();
		
		MusicBean dto = musicAction.musicmodify(num);
				
		mav.addObject("music", dto);
		mav.setViewName("/music/music_modify");
		
		return mav;
		
}
	/*----------------------------곡 수정(관리자)-------------------------*/
	
	@RequestMapping(value="/music_update.box", method = RequestMethod.POST)
	public ModelAndView musicupdate(HttpServletRequest request){

		ModelAndView mav = new ModelAndView();
		MusicBean dto = new MusicBean(); 		
				
		String realFolder = "";
		String saveFolder = "upload";

		int fileSize = 5 * 1024 * 1024;

		realFolder = request.getRealPath(saveFolder);
		
		System.out.println("곡수정controller1");
		boolean r = false;
		
		try {

			MultipartRequest multi = null;

			multi = new MultipartRequest(request, realFolder, fileSize, "utf-8", new DefaultFileRenamePolicy());
			
			
			DateFormat sdFormat = new SimpleDateFormat("MM/dd/yyyy");
			String d = multi.getParameter("music_publishdate").trim();
			Date pDate = sdFormat.parse(d);
			System.out.println("d="+d);
			System.out.println("date="+pDate.toString());
			System.out.println("pDate="+pDate);
			
			dto.setMusic_num(Integer.parseInt(multi.getParameter("music_num").trim()));

			dto.setMusic_title(multi.getParameter("music_title").trim());
			dto.setMusic_artist(multi.getParameter("music_artist").trim());
			dto.setMusic_genre(multi.getParameter("music_genre").trim());
			dto.setMusic_publishdate(pDate);
			dto.setMusic_lyrics(multi.getParameter("music_lyrics").trim());
			dto.setMusic_album(multi.getParameter("music_album").trim());
			dto.setAlbumcoverfilepath(multi.getOriginalFileName((String) multi.getFileNames().nextElement()));

			/*System.out.println("music_title="+dto.getMusic_title());*/
			r = musicAction.music_update(dto);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
		if (r){
			mav.setViewName("redirect:/music_list.box");
		}else{
			mav.setViewName("/music_modify");
		}
		return mav;	
	}
	
/*----------------------------곡 삭제(관리자)-------------------------*/
	
	@RequestMapping(value="/music_delete.box", method = RequestMethod.GET)
	
	public ModelAndView MusicDelete (@RequestParam("num") int num){
		System.out.println("num="+num);
		System.out.println(" 삭제 controller1");
		

		ModelAndView mav = new ModelAndView();
		
		boolean r = (musicAction).musicDelete(num);
		
		System.out.println("삭제controller2");
		
		if(r){
			mav.setViewName("redirect:music_list.box");
		}else{
			mav.setViewName("index");
		}
		return mav;
	}
	
	
	/*------------------추천곡 목록--------------------------------------*/
	@RequestMapping("/recommend_music_list.box")
	public ModelAndView suggestMusic(HttpSession session, HttpServletRequest request) {
		String  loginId = (String) session.getAttribute("loginId");
		System.out.println("loginId="+loginId);
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println("추천곡 리스트 controller");
			// 게시물 목록 가져오기
			Map<String, Object> map = preferenceAction.suggestMusic(loginId, request);
			// 여러 개의 데이터를 묶어서 저장할 때는
			// addObject를 사용하지 않고 Map을 저장할 수
			// 있습니다.
			mav.addAllObjects(map);
			// 공지사항을 다음페이지에 전달하기 위해서
			// 저장하기
			mav.setViewName("/music/recommend_music_list");
		
		return mav;
	}

}
