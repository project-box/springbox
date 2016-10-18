package com.naver.springbox.dto;

import java.sql.Date;

public class SboardDto {
	private int s_num;
	private String sp_type;
	private String s_channel;
	private String user_id;
	private String s_phone;	
	private String s_email;
	private String s_subject;
	private String s_content;
	private String s_file;
	private int s_readcount;
	private Date s_date;
	private String s_ip;
	
	
	
	public SboardDto() {
		super();
	}
	
	public SboardDto(int s_num, String sp_type,
	String s_channel, String user_id, String s_phone, String s_email,
	String s_subject, String s_content, String s_file, int s_readCount,
	Date s_date, String s_ip){
		this.s_num = s_num;
		this.sp_type =  sp_type;
		this.s_channel = s_channel;
		this.user_id = user_id;
		this.s_phone = s_phone;
		this.s_email = s_email;
		this.s_subject = s_subject;
		this.s_content = s_content;	
		this.s_file = s_file;
		this.s_readcount= s_readCount;
		this.s_date= s_date;
		this.s_ip= s_ip;
		
	}

	public int getS_num() {
		return s_num;
	}

	public void setS_num(int s_num) {
		this.s_num = s_num;
	}

	public String getSp_type() {
		return sp_type;
	}

	public void setSp_type(String sp_type) {
		this.sp_type = sp_type;
	}

	public String getS_channel() {
		return s_channel;
	}

	public void setS_channel(String s_channel) {
		this.s_channel = s_channel;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getS_phone() {
		return s_phone;
	}

	public void setS_phone(String s_phone) {
		this.s_phone = s_phone;
	}

	public String getS_email() {
		return s_email;
	}

	public void setS_email(String s_email) {
		this.s_email = s_email;
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

	public String getS_file() {
		return s_file;
	}

	public void setS_file(String s_file) {
		this.s_file = s_file;
	}
	
	
	
	public int getS_readcount() {
		return s_readcount;
	}

	public void setS_readcount(int s_readCount) {
		this.s_readcount = s_readCount;
	}

	public Date getS_date() {
		return s_date;
	}

	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}

	public String getS_ip() {
		return s_ip;
	}

	public void setS_ip(String s_ip) {
		this.s_ip = s_ip;
	}

	@Override
	public String toString() {
		return "SboardDto [s_num=" + s_num + ", sp_type=" + sp_type + ", s_channel=" + s_channel
				+ ",user_id=" + user_id + ",s_phone=" + s_phone + ", s_email=" + s_email 
				+ ",s_subject=" + s_subject + ",s_content=" + s_content 
				+ ",s_file="  + s_file + ",s_readcount="  + s_readcount
				+",s_date="  + s_date+ ",s_ip="  + s_ip+"]";
	}
}