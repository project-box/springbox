package com.naver.springbox.dto;

import java.util.Date;

public class ConcertBoardBean {
	private int concertboard_num;
	private int concert_num;
	private String concertboard_content;
	private String user_id;
	private Date concertboard_registerdate;
	
	
	public int getConcertboard_num() {
		return concertboard_num;
	}
	public void setConcertboard_num(int concertboard_num) {
		this.concertboard_num = concertboard_num;
	}
	public int getConcert_num() {
		return concert_num;
	}
	public void setConcert_num(int concert_num) {
		this.concert_num = concert_num;
	}
	public String getConcertboard_content() {
		return concertboard_content;
	}
	public void setConcertboard_content(String concertboard_content) {
		this.concertboard_content = concertboard_content;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getConcertboard_registerdate() {
		return concertboard_registerdate;
	}
	public void setConcertboard_registerdate(Date concertboard_registerdate) {
		this.concertboard_registerdate = concertboard_registerdate;
	}
	
	
	
}
