package com.naver.springbox.dto;

public class ThemeMusicBean {

	private int theme_music_num;
	private String theme_music_title;
	private String user_id;
	private int like_num;
	private int view_num;
	
	public int getTheme_music_num() {
		return theme_music_num;
	}
	public void setTheme_music_num(int theme_music_num) {
		this.theme_music_num = theme_music_num;
	}
	public String getTheme_music_title() {
		return theme_music_title;
	}
	public void setTheme_music_title(String theme_music_title) {
		this.theme_music_title = theme_music_title;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getLike_num() {
		return like_num;
	}
	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}
	public int getView_num() {
		return view_num;
	}
	public void setView_num(int view_num) {
		this.view_num = view_num;
	}

	

}