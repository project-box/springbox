package com.naver.springbox.dao;

import java.util.List;
import java.util.Map;

import com.naver.springbox.dto.SboardDto;


public interface SboardDao {
	
	public int getListCount();

	public List<SboardDto> getSboardList(Map<String, Object> map);
	
	
	// 조회수를 1증가시키고 하나의 데이터를 가져오는 메소드
    public SboardDto getSboard(int num);
    
 // 가장 큰 Board_Num을 찾아오는 메소드
 	public int maxSboardNum();

 	// 데이터를 삽입하는 메소드
 	public boolean insertSboard(SboardDto dto);

 	// 데이터를 갱신하는 메소드
 	public boolean updateSboard(Map<String, Object> map);

 	// 정수 1개를 받아서 데이터를 삭제하는 메소드
 	public boolean deleteSboard(int num);
	
	
}
