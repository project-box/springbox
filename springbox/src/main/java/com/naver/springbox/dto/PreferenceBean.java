package com.naver.springbox.dto;

public class PreferenceBean {
	private int preference_num;
	private int music_num;
	private String user_id;
	private float rate;
	
	public int getPreference_num() {
		return preference_num;
	}
	public void setPreference_num(int preference_num) {
		this.preference_num = preference_num;
	}
	public int getMusic_num() {
		return music_num;
	}
	public void setMusic_num(int music_num) {
		this.music_num = music_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public float getRate() {
		return rate;
	}
	public void setRate(float rate) {
		this.rate = rate;
	}
}
