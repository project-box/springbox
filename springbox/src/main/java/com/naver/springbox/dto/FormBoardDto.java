package com.naver.springbox.dto;

import org.springframework.web.multipart.MultipartFile;

public class FormBoardDto {
	
	private String user_id;
	private String s_subject;
	private String s_content;
	private MultipartFile s_File;

	

	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	public String getS_subject() {
		return s_subject;
	}



	public void setS_subject(String s_subject) {
		this.s_subject = s_subject;
	}



	public String getS_content() {
		return s_content;
	}



	public void setS_content(String s_content) {
		this.s_content = s_content;
	}



	public MultipartFile getS_File() {
		return s_File;
	}



	public void setS_File(MultipartFile s_File) {
		this.s_File = s_File;
	}



	@Override
	public String toString() {
		return "FormBoardDto [user_id=" + user_id + ", s_subject="
				+ s_subject + ", s_content=" + s_content
				+ ", s_File=" + s_File + "]";
	}

}
	


