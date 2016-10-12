package com.naver.springbox.dto;

import java.util.Date;

public class HistoryBean {
	private int history_num;
	private int concert_num;
	private String user_id;
	private Date history_registerdate;
	

	public int getHistory_num() {
		return history_num;
	}
	public void setHistory_num(int history_num) {
		this.history_num = history_num;
	}
	public int getConcert_num() {
		return concert_num;
	}
	public void setConcert_num(int concert_num) {
		this.concert_num = concert_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getHistory_registerdate() {
		return history_registerdate;
	}
	public void setHistory_registerdate(Date history_registerdate) {
		this.history_registerdate = history_registerdate;
	}
	
}

	
	
	
	
