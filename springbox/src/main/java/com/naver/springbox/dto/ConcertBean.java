package com.naver.springbox.dto;

import java.util.Date;

public class ConcertBean {
	private int concert_num;
	private String concert_place;
	private Date startdate;
	private Date enddate;
	private String showtime;
	private String concert_title;
	private String posterfilepath;
	private String concert_artist;
	private float locationx;
	private float locationy;
	
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
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public String getShowtime() {
		return showtime;
	}
	public void setShowtime(String showtime) {
		this.showtime = showtime;
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
	
	
}
