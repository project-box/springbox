package com.naver.springbox.dto;

public class MusicerrorBean {
	
		private int music_num;
		private String mservice_channel;
		private String msproblem_type;	
		private String title;
		private String artist;
		private String music_content;
		
		
		public MusicerrorBean() {
			super();
		}
		
		public MusicerrorBean(int music_num, String mservice_channel,
		String msproblem_type, String title, String artist, String music_content) {
			super();
			this.music_num = music_num;
			this.mservice_channel = mservice_channel;
			this.msproblem_type = msproblem_type;
			this.title = title;
			this.artist = artist;
			this.music_content = music_content;		
		}

		public int getMusic_num() {
			return music_num;
		}

		public void setMusic_num(int music_num) {
			this.music_num = music_num;
		}

		public String getMservice_channel() {
			return mservice_channel;
		}

		public void setMservice_channel(String mservice_channel) {
			this.mservice_channel = mservice_channel;
		}

		public String getMsproblem_type() {
			return msproblem_type;
		}

		public void setMsproblem_type(String msproblem_type) {
			this.msproblem_type = msproblem_type;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getArtist() {
			return artist;
		}

		public void setArtist(String artist) {
			this.artist = artist;
		}

		public String getMusic_content() {
			return music_content;
		}

		public void setMusic_content(String music_content) {
			this.music_content = music_content;
		}	
	
}
