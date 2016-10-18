package com.naver.springbox.service;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.springbox.dao.SboardDao;
import com.naver.springbox.dto.FormBoardDto;
import com.naver.springbox.dto.SboardDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;





@Service
public class SboardUpdateAction {
	
	@Autowired
	private SboardDao sboardDao;

	
			public boolean execute(HttpServletRequest request, HttpServletResponse response)
					 throws Exception {
						SboardDto dto = new SboardDto();

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
						/*String s_ip = multi.getParameter("request.getRemoteAddr()").trim();*/
						
					
					

						// 첨부 파일 받는 부분
						dto.setS_file(multi.getFilesystemName((String) multi.getFileNames()
								.nextElement()));
						dto.setUser_id(user_id);
					
						dto.setS_subject(s_subject);
						dto.setS_content(s_content);
						/*dto.setS_content(s_ip);*/
					

						boolean r = sboardDao.insertSboard(dto);
							
						
						return r;
					}
				}



