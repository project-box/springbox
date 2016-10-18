package com.naver.springbox.service;

import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.naver.springbox.dao.MemberDao;
import com.naver.springbox.dto.MemberBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class MemberJoinAction {

	@Autowired
	private MemberDao memberDao; 		//의존 라이브러리

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

//	public boolean insertMember(HttpServletRequest request) {
	public boolean insertMember(MemberBean member) throws Exception {
		boolean result = false;
				
		
//		String uploadPath = request.getRealPath("sboardupload");		
//		int size = 10 * 1024 * 1024; // 10MB까지 업로드 가능
//
//		multi = new MultipartRequest(
//				request, 
//				uploadPath,
//				size, 
//				"utf-8", 
//				new DefaultFileRenamePolicy());		
//		
//		member.setUser_id(multi.getParameter("user_id"));
//		member.setPassword(multi.getParameter("password"));
//		member.setName(multi.getParameter("name"));
//		member.setEmail(multi.getParameter("email"));
//		member.setGender(multi.getParameter("gender"));
//		member.setPhone(multi.getParameter("phone"));
//		member.setAge(Integer.parseInt(multi.getParameter("age")));
////		member.setLogincont(Integer.parseInt(multi.getParameter("logincont")));
////		member.setStatus(multi.getParameter("status"));		
//		member.setImage(multi.getFilesystemName((String) multi.getFileNames().nextElement()));		
		
		
		if (memberDao.insertMember(member))
			result = true;

		return result;
	}
}
