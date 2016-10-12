package com.naver.springbox.dto;

public class SreplyDto {
	
	private int sr_num;
	private String s_num;
	private String sr_content;
	private String user_id;
	
	
	public SreplyDto() {
		super();
	}
	
	public SreplyDto(int sr_num, String s_num,String sr_content, String user_id){

		this.sr_num = sr_num;
		this.s_num =  s_num;
		this.sr_content = sr_content;
		this.user_id = user_id;
	
	}

	public int getSr_num() {
		return sr_num;
	}

	public void setSr_num(int sr_num) {
		this.sr_num = sr_num;
	}

	public String getS_num() {
		return s_num;
	}

	public void setS_num(String s_num) {
		this.s_num = s_num;
	}

	public String getSr_content() {
		return sr_content;
	}

	public void setSr_content(String sr_content) {
		this.sr_content = sr_content;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	@Override
	public String toString() {
		return "SreplyDto [s_num=" + s_num + ",sr_num=" + sr_num + "sr_content=" + sr_content
				+ ",user_id=" + user_id + "]";
	}

	
	

}
