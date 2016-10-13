package com.naver.springbox.service;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.springbox.dao.SboardDao;
import com.naver.springbox.dto.FormBoardDto;



@Service
public class SboardUpdateAction {
	
	@Autowired
	private SboardDao sboardDao;

	public boolean execute(FormBoardDto formdto, HttpServletRequest request) {
		// Dao에게 넘겨줄 Map 생성
		Map<String, Object> map = new HashMap<String, Object>();
		// 파일이 실제 업로드 될 폴더 경로 생성
		String realFolder = request.getSession().getServletContext().getRealPath("sboardupload");
		// 맵 설정
		map.put("s_num", request.getParameter("s_num"));
		map.put("s_subject", formdto.getS_subject());
		map.put("s_content", formdto.getS_content());
		// request의 getRemoteAddr()을 호출하면
		// 현재 접속된 곳의 ip 주소를 문자열로
		// 리턴합니다.
		map.put("s_ip", request.getRemoteAddr());
		boolean result = false;
		try {
			// 선택된 파일이 있다면
			if (formdto.getS_File().getOriginalFilename().length() > 0) {
				// 맵에 새로 선택한 파일명을 입력
				map.put("s_file", formdto.getS_File().getOriginalFilename());
				// 파일을 다시 업로드
				File f = new File(realFolder + "\\"+ formdto.getS_File().getOriginalFilename());
				formdto.getS_File().transferTo(f);
			}
			// 선택한 파일이 없으면 기존 파일 이름 설정
			else {
				map.put("s_file", request.getParameter("s_oldfile"));
			}
			// 데이터 수정
			result = sboardDao.updateSboard(map);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;

	}
}



