package com.naver.springbox.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.naver.springbox.dao.MusicDao;
import com.naver.springbox.dto.MusicBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class MusicAction {
	
	@Autowired
	private MusicDao musicDao;

	/*-----------------------음악 추가(관리자)----------------------------------*/
	public boolean add(MusicBean dto) {
				
				System.out.println("addAction");
	
		boolean r = musicDao.insertMusic(dto);
		return r;
	}
	
 /* ----------------------음악 목록----------------------------------------------------*/
	
	public Map<String, Object> musicList(HttpServletRequest request){
		 
		int page =1 ;
		 
		int limit = 10;
		
		System.out.println("listAction");
		
		if (request.getParameter("page") != null){
			 page = Integer.parseInt(request.getParameter("page"));
		 }
		 
		 int start = (page -1)* limit +1;
		 int end = start + limit -1;
		 
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("start", start);
		 map.put("end", end);
		 
		 int listcount = musicDao.getMusicListCount();
		 System.out.println("listcount="+listcount);
		 
		 List<MusicBean> list = musicDao.getMusicList(map);		 
		 
		 int maxpage = (int)((double) listcount / limit +0.95);
		 int startpage = (((int)((double)page/10 + 0.9)) -1)* 10 +1;
		 int endpage = maxpage;
		 if(endpage > (startpage +9)){
			 endpage = startpage +9;
		 }
		 ModelAndView mv = new ModelAndView("music/music_list");
		 
		 Map<String, Object> resultMap = new HashMap<String, Object>();		 
		 resultMap.put("page", page);
		 resultMap.put("listcount", listcount);
		 resultMap.put("list", list);
		 resultMap.put("maxpage", maxpage);
		 resultMap.put("startpage", startpage);
		 resultMap.put("endpage", endpage);
		 
		 return resultMap;
	}
	
/*----------------------음악 상세-------------------------------------------*/
	
	public MusicBean musicDetail(int num) {
		
		System.out.println("detailAction");
			
		MusicBean dto = musicDao.getMusicDetail(num);

		return dto;
	}
	
	/*-----------------------음악 수정페이지-----------------------------------------------------*/

	
	public MusicBean musicmodify(int num){
		System.out.println("서비스 musicmodify 들어옴");
		System.out.println("num="+num);
		MusicBean bean = musicDao.musicmodify(num);

		return bean;
  }
	
	/*	---------------곡 수정----------------------*/		

	public boolean music_update(MusicBean dto) {
		System.out.println("music_update 서비스");
		
		boolean r = musicDao.music_update(dto);
		
		return r;
		
		
	}
/*-----------------------음악 삭제-----------------------------------------------------*/
	
	public boolean musicDelete(int num) {
	
		System.out.println("deleteAction");
		
		return musicDao.deleteMusic(num);
	}
	
	/*------------------------팝업창--------------------------------------------------------*/

	public MusicBean musicPop(int num) {

		System.out.println("팝업Action");
			
		MusicBean dto = musicDao.getMusicPop(num);

		return dto;
	}

}