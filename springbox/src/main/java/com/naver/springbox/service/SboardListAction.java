package com.naver.springbox.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.springbox.dao.SboardDao;
import com.naver.springbox.dto.SboardDto;




@Service
public class SboardListAction {
	
	
	@Autowired
	private SboardDao sboardDao;
	
	public Map<String, Object> execute(HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		// 기본적으로 사용할 페이지 번호 설정
	/*	int page = 1;
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
		List<SboardDto> list = sboardDao.getSboardList(map);
		// 전체 데이터 개수 가져오기
		int listcount = sboardDao.getListCount();

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
		resultMap.put("sboardlist", list);
		resultMap.put("maxpage", maxpage);
		resultMap.put("startpage", startpage);
		resultMap.put("endpage", endpage);
        
		System.out.println("서비스 리스트");

		return resultMap;
*/
		
		List<SboardDto> sboardlist = new ArrayList<SboardDto>();
		// BoardDAOImpl bd=new BoardDAOImpl();

		int page = 1;
		int limit = 10; // 한 화면에 출력할 레코드수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		/* int listcount=this.boardService.getListCount(); */// 총 리스트 수를 받아옴.
		int listcount = sboardDao.getListCount();

		// int startRow = (page - 1) * limit + 1;
		// int endRow = page * limit ;
		// Map<String,Integer> m = new HashMap<String,Integer>();
		// m.put("startRow", startRow);
		// m.put("endRow", endRow);
		// m.put("page", page);
		// m.put("limit", limit);

		// 페이지 번호(page)를 DAO클래스에게 전달한다.
		sboardlist = sboardDao.getSboardList( page); // 리스트를 받아옴.

		// 총 페이지 수.
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림
																	// 처리.
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

//		request.setAttribute("page", page); // 현재 페이지 수.
//		request.setAttribute("maxpage", maxpage); // 최대 페이지 수.
//		request.setAttribute("startpage", startpage); // 현재 페이지에 표시할 첫 페이지 수.
//		request.setAttribute("endpage", endpage); // 현재 페이지에 표시할 끝 페이지 수.
//		request.setAttribute("listcount", listcount); // 글 수.
//		request.setAttribute("boardlist", boardlist);

	/*	ModelAndView sboardListM = new ModelAndView("gogaek/sboardList");
		sboardListM.addObject("page", page);
		sboardListM.addObject("maxpage", maxpage);
		sboardListM.addObject("startpage", startpage);
		sboardListM.addObject("endpage", endpage);
		sboardListM.addObject("listcount", listcount);
		sboardListM.addObject("sboardlist", sboardlist);*/	
		
		Map<String, Object> resultMap = new HashMap<String, Object>();

		resultMap.put("page", page);
		resultMap.put("listcount", listcount);
		resultMap.put("sboardlist", sboardlist);
		resultMap.put("maxpage", maxpage);
		resultMap.put("startpage", startpage);
		resultMap.put("endpage", endpage);
        
		System.out.println("서비스 리스트");

		return resultMap;
		
	

		
		
				
	}

}