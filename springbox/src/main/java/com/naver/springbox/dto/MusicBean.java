package com.naver.springbox.dto;

import java.util.Date;

public class MusicBean {
	private int music_num;
	private String music_genre;
	private String music_artist;
	private String music_title;
	private String music_album;
	private Date music_publishdate;
	private String albumcoverfilepath;
	private String music_lyrics;
	
	public int getMusic_num() {
		return music_num;
	}
	public void setMusic_num(int music_num) {
		this.music_num = music_num;
	}
	public String getMusic_genre() {
		return music_genre;
	}
	public void setMusic_genre(String music_genre) {
		this.music_genre = music_genre;
	}
	public String getMusic_artist() {
		return music_artist;
	}
	public void setMusic_artist(String music_artist) {
		this.music_artist = music_artist;
	}
	public String getMusic_title() {
		return music_title;
	}
	public void setMusic_title(String music_title) {
		this.music_title = music_title;
	}
	public String getMusic_album() {
		return music_album;
	}
	public void setMusic_album(String music_album) {
		this.music_album = music_album;
	}
	public Date getMusic_publishdate() {
		return music_publishdate;
	}
	public void setMusic_publishdate(Date music_publishdate) {
		this.music_publishdate = music_publishdate;
	}
	public String getAlbumcoverfilepath() {
		return albumcoverfilepath;
	}
	public void setAlbumcoverfilepath(String albumcoverfilepath) {
		this.albumcoverfilepath = albumcoverfilepath;
	}
	public String getMusic_lyrics() {
		return music_lyrics;
	}
	public void setMusic_lyrics(String music_lyrics) {
		this.music_lyrics = music_lyrics;
	}
	
	
}
