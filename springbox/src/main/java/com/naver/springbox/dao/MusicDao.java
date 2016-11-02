package com.naver.springbox.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.naver.springbox.dto.ConcertBean;
import com.naver.springbox.dto.MusicBean;


public interface MusicDao {
	
	// 전체 데이터 개수를 리턴하는 메소드
	public int getMusicListCount();
	
	//데이터 목록을 리턴하는 메소드
	public List<MusicBean> getMusicList(Map<String, Object>map);

	//하나의 데이터를 가져오는 메소드(상세보기)
	public MusicBean getMusicDetail(int num);
	
	//데이터를 삽입하는 메소드
	public boolean insertMusic(MusicBean dto);
	
	//데이터를 삭제하는 메소드
	public boolean deleteMusic(int num);
	
	//하나의 데이터를 가져오는 메소드(팝업창)
	public MusicBean getMusicPop(int num);

	//곡내용수정불러오기
	public MusicBean musicmodify(int num);
	
	// 곡내용수정
	public boolean music_update(MusicBean dto);

}