package com.naver.springbox.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.naver.springbox.dao.SboardDao;
import com.naver.springbox.dto.FormBoardDto;
import com.naver.springbox.dto.SboardDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;





@Service
public class SboardInsertAction {
	
	@Autowired
	private SboardDao sboardDao;
	
	
	/* 회원 가입 저장 */
	public boolean execute(HttpServletRequest request, HttpServletResponse response)
	 throws Exception {
		SboardDto dto = new SboardDto();
		System.out.println("SboardInsertAction 들어옴");

		String sboarduploadPath = request.getRealPath("sboardupload");		
		int size = 10 * 1024 * 1024; // 10MB까지 업로드 가능

		MultipartRequest multi = new MultipartRequest(request, sboarduploadPath, size, "utf-8", 
				                 new DefaultFileRenamePolicy());

	/*	String user_id = multi.getParameter("user_id").trim()//  회원아이디
		String join_pwd = multi.getParameter("join_pwd1").trim();// 회원비번
		String join_name = multi.getParameter("join_name").trim();// 회원이름
		String join_zip1 = multi.getParameter("join_zip1").trim();
		String join_zip2 = multi.getParameter("join_zip2").trim();
		String join_addr1 = multi.getParameter("join_addr1").trim();
		String join_addr2 = multi.getParameter("join_addr2").trim();
		String join_tel1 = multi.getParameter("join_tel1").trim();
		String join_tel2 = multi.getParameter("join_tel2").trim();
		String join_tel3 = multi.getParameter("join_tel3").trim();
		String join_tel = join_tel1 + "-" + join_tel2 + "-" + join_tel3;*/
		String user_id = multi.getParameter("user_id").trim();
		String s_subject = multi.getParameter("s_subject").trim();
		String s_content = multi.getParameter("s_content").trim();
	
	

		// 첨부 파일 받는 부분
		dto.setS_file(multi.getFilesystemName((String) multi.getFileNames()
				.nextElement()));

		dto.setUser_id(user_id);
		dto.setS_subject(s_subject);
		dto.setS_content(s_content);
	
		System.out.println("SboardInsertAction에서  Dao.insertSboard로 나감");
		boolean r = sboardDao.insertSboard(dto);
			
		System.out.println("SboardInsertAction 나감");
		return r;
	}
}
	
	

	/*public boolean execute(FormBoardDto formDto, HttpServletRequest request) {
		// 실제 파일 업로드 처리
		// 업로드할 폴더의 경로를 생성
		String realFolder = request.getSession().getServletContext().getRealPath("sboardupload");
		// 업로드할 파일의 이름을 가져오기
		String filename = formDto.getS_File().getOriginalFilename();
		String filepath = realFolder + "\\" + filename;
		File f = new File(filepath);
		
		System.out.println("들어옴0");
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

		System.out.println("들어옴1");
		// 데이터 삽입
		boolean r = sboardDao.insertSboard(dto);
        System.out.println("들어옴2");
		
		return r;
	}*/


	
	


