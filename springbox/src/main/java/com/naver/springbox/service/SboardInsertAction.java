package com.naver.springbox.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.springbox.dao.SboardDao;
import com.naver.springbox.dto.FormBoardDto;
import com.naver.springbox.dto.SboardDto;



@Service
public class SboardInsertAction {
	
	@Autowired
	private SboardDao sboardDao;

	public boolean execute(FormBoardDto formDto, HttpServletRequest request) {
		// 실제 파일 업로드 처리
		// 업로드할 폴더의 경로를 생성
		String realFolder = request.getSession().getServletContext().getRealPath("sboardupload");
		// 업로드할 파일의 이름을 가져오기
		String filename = formDto.getS_File().getOriginalFilename();
		String filepath = realFolder + "\\" + filename;
		File f = new File(filepath);
		try {
			// 업로드할려고 선택한 파일을 f에 전송
			formDto.getS_File().transferTo(f);
		} catch (Exception e) {
		}

		// Dao에서 사용할 데이터 만들기
		SboardDto dto = new SboardDto();
		// 글번호 설정
		dto.setS_num(sboardDao.maxSboardNum() + 1);
		// 글제목 설정
		dto.setS_subject(formDto.getS_subject());
		// 글내용 설정
		dto.setS_content(formDto.getS_content());
		// 글쓴이 설정
		dto.setUser_id(formDto.getUser_id());
		// 파일이름 설정
		dto.setS_file(filename);
		// 글쓴 곳의 아이피 설정
		dto.setS_ip(request.getRemoteAddr());

		// 데이터 삽입
		boolean r = sboardDao.insertSboard(dto);

		return r;
	}
}

	
	


