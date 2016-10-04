package com.naver.springbox.dao;

import java.util.List;
import java.util.Map;

import com.naver.springbox.dto.ConcertBean;


public interface ConcertDao {
	
	// 전체 데이터 개수를 리턴하는 메소드
	public int getConcertListCount();

//	public List<ConcertBean> getConcertList();	
	
	// 맵을 받아서 데이터 목록을 리턴하는 메소드
	public List<ConcertBean> getConcertList(Map<String, Object> map);
	
	// 조회수를 1증가시키고 하나의 데이터를 가져오는 메소드
	public ConcertBean getConcertDetail(int concert_num);
		

//	// 가장 큰 Concert_Num을 찾아오는 메소드
//	public int maxConcertNum();
//	
//		
	// 데이터를 삽입하는 메소드
	public boolean insertConcert(ConcertBean dto);
	
	/*
	// 데이터를 갱신하는 메소드
	public boolean updateConcert(Map<String, Object> map);

	// 정수 1개를 받아서 데이터를 삭제하는 메소드
	public boolean deleteConcert(int num);*/


}
