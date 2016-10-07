package com.naver.springbox.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naver.springbox.dao.ConcertDao;
import com.naver.springbox.dto.ConcertBean;
import com.naver.springbox.dto.ConcertBoardBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class ConcertAction {

	@Autowired
	private ConcertDao concertDao;

	/*--------------공연 등록--------------------------------------*/

	public boolean add(ConcertBean dto, HttpServletRequest request)  {
		// 실제 파일 업로드 처리
		// 업로드할 폴더의 경로를 생성
		String realFolder = request.getSession().getServletContext()
				.getRealPath("img");
		
		int fileSize = 5 * 1024 * 1024;
		
		try {
			
			MultipartRequest multi = null;
	
		multi = new MultipartRequest(request, realFolder, fileSize, "utf-8", new DefaultFileRenamePolicy());

		DateFormat sdFormat = new SimpleDateFormat("MM/dd/yyyy");
		String d1 = multi.getParameter("concert_startdate1").trim();
		String d2 = multi.getParameter("concert_startdate2").trim();		
		String d3 = multi.getParameter("concert_startdate3").trim();
		String t1 = multi.getParameter("concert_enddate1").trim();
		String t2 = multi.getParameter("concert_enddate2").trim();
		String t3 = multi.getParameter("concert_enddate3").trim();
		
		String d = d2 +"/"+ d3 + "/" + d1;
		
		System.out.println(d);		
		
		String t = t2 +"/"+ t3 + "/" + t1;
		
		System.out.println(t);
		
		Date pDate = sdFormat.parse(d);
		Date pDate2 = sdFormat.parse(t);
		
		dto.setConcert_place(multi.getParameter("concert_place").trim());
		dto.setConcert_startdate(pDate);
		dto.setConcert_enddate(pDate2);		
		dto.setConcert_title(multi.getParameter("concert_title").trim());
		dto.setPosterfilepath(multi.getFilesystemName((String) multi.getFileNames().nextElement()));
		dto.setConcert_artist(multi.getParameter("concert_artist").trim());	
		dto.setLocationx(Float.parseFloat(multi.getParameter("locationx").trim()));
		dto.setLocationy(Float.parseFloat(multi.getParameter("locationy").trim()));
		dto.setConcert_price(multi.getParameter("concert_price").trim());
		
		
		} catch (Exception ex) {
			ex.printStackTrace();
		}	

		// 데이터 삽입
		boolean r = concertDao.insertConcert(dto);

		return r;
	}
	
	
	
	/*----------------콘서트 목록 서비스----------------------------*/

	// HttpServletRequest를 매개변수로 받아서
	// 작업을 수행
	public Map<String, Object> concertList(HttpServletRequest request) {
		// 기본적으로 사용할 페이지 번호 설정
		int page = 1;
		// 한 페이지에 출력할 데이터 개수 설정
		int limit = 10;
		// page 파라미터의 값이 있으면 정수로 변환해서
		// page에 대입
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		// page와 limit을 이용해서 시작하는 데이터 번호와
		// 끝나는 번호를 계산
		// page=1 start=01, page=2 start=11, page=3 start=21
		int start = (page - 1) * limit + 1;
		int end = start + limit - 1;
		// 위 2개의 값을 Map을 생성해서 start와 end라는
		// 키로 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);

		// 데이터 가져오기
		List<ConcertBean> list = concertDao.getConcertList(map);
		// List<ConcertBean> list = concertDao.getConcertList();

		// 전체 데이터 개수 가져오기
		int listcount = concertDao.getConcertListCount();

		// 가장 큰 페이지 번호 계산
		int maxpage = (int) ((double) listcount / limit + 0.95);
		// 시작하는 페이지 번호 계산
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 마지막 페이지 번호 계산
		int endpage = maxpage;
		if (endpage > (startpage + 9)) {
			endpage = startpage + 9;
		}

		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("page", page);
		resultMap.put("listcount", listcount);
		resultMap.put("concertlist", list);
		resultMap.put("maxpage", maxpage);
		resultMap.put("startpage", startpage);
		resultMap.put("endpage", endpage);

		return resultMap;

	}

	/*----------------디테일 서비스----------------------------*/
	public ConcertBean concertDetail(int concert_num) throws Exception {
		ConcertBean dto = concertDao.getConcertDetail(concert_num);

		return dto;
	}
	
	/* -------------------------목록 삭제-------------------------*/
	
	public boolean concertDelete(int num) {
		System.out.println("들어옴2");
		
		return concertDao.deleteConcert(num);
	}
	
	
	/*--------------후기 등록--------------------------------------*/
	
	public boolean concertboardadd(HttpServletRequest request) {
		// 파라미터 가져오기
		int num = Integer.parseInt(request.getParameter("concert_num"));
		String content = request.getParameter("concertboard_content");
		// 세션 가져오기
		HttpSession session = request.getSession();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("concert_num", num);
		map.put("user_id", session);
		map.put("concertboard_content", content);		
		
		return concertDao.insertConcertBoard(map);
		
	}

	
	
}
