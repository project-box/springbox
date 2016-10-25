package com.naver.springbox.dao;

import java.util.List;
import java.util.Map;

import com.naver.springbox.dto.ConcertBean;
import com.naver.springbox.dto.ConcertBoardBean;
import com.naver.springbox.dto.PaymentBean;
import com.naver.springbox.dto.SeatBean;


public interface ConcertDao {
	
	// 전체 데이터 개수를 리턴하는 메소드
	public int getConcertListCount();

//	public List<ConcertBean> getConcertList();	
	
	// 맵을 받아서 데이터 목록을 리턴하는 메소드
	public List<ConcertBean> getConcertList(Map<String, Object> map);
	
	// 조회수를 1증가시키고 하나의 데이터를 가져오는 메소드
	public ConcertBean getConcertDetail(int concert_num);
	
	// 데이터를 삽입하는 메소드
	public boolean insertConcert(ConcertBean dto);

	// 정수 1개를 받아서 데이터를 삭제하는 메소드
	public boolean deleteConcert(int num);

	public boolean insertConcertboard(ConcertBoardBean dto);

	public List<ConcertBoardBean> getConcertBoardList(int num);

	public int getConcertBoardListCount(int num);

	boolean getConcertBoardDelete(int num);

	void book_add(PaymentBean pb);
//	public boolean insertPayment(PaymentBean dto);
	
	void seat_add(SeatBean sb);
	
	public List<PaymentBean> book_list(String user_id);
	
	public PaymentBean book_detail(int payment_num);



}
