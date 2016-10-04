package com.naver.springbox.dto;

import java.util.Date;

public class ConcertBean {
	private int concert_num;
	private String concert_place;
	private Date concert_startdate;
	private Date concert_enddate;
	private String concert_title;
	private String posterfilepath;
	private String concert_artist;
	private float locationx;
	private float locationy;
	private String concert_price;
	
	
	public int getConcert_num() {
		return concert_num;
	}
	public void setConcert_num(int concert_num) {
		this.concert_num = concert_num;
	}
	public String getConcert_place() {
		return concert_place;
	}
	public void setConcert_place(String concert_place) {
		this.concert_place = concert_place;
	}
	public Date getConcert_startdate() {
		return concert_startdate;
	}
	public void setConcert_startdate(Date concert_startdate) {
		this.concert_startdate = concert_startdate;
	}
	public Date getConcert_enddate() {
		return concert_enddate;
	}
	public void setConcert_enddate(Date concert_enddate) {
		this.concert_enddate = concert_enddate;
	}
	public String getConcert_title() {
		return concert_title;
	}
	public void setConcert_title(String concert_title) {
		this.concert_title = concert_title;
	}
	public String getPosterfilepath() {
		return posterfilepath;
	}
	public void setPosterfilepath(String posterfilepath) {
		this.posterfilepath = posterfilepath;
	}
	public String getConcert_artist() {
		return concert_artist;
	}
	public void setConcert_artist(String concert_artist) {
		this.concert_artist = concert_artist;
	}
	public float getLocationx() {
		return locationx;
	}
	public void setLocationx(float locationx) {
		this.locationx = locationx;
	}
	public float getLocationy() {
		return locationy;
	}
	public void setLocationy(float locationy) {
		this.locationy = locationy;
	}
	public String getConcert_price() {
		return concert_price;
	}
	public void setConcert_price(String concert_price) {
		this.concert_price = concert_price;
	}
	
	
	
	
}
