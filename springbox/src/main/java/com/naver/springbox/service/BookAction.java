package com.naver.springbox.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.springbox.dao.ConcertDao;
import com.naver.springbox.dto.PaymentBean;
import com.naver.springbox.dto.SeatBean;

@Service
public class BookAction {

	@Autowired
	private ConcertDao concertDao;
	
	
	/*--------------결제완료--------------------------------------*/

	public void book_add(PaymentBean pb) {
		
		concertDao.book_add(pb);
		
	}
	
	/*--------------좌석 등록--------------------------------------*/

	public void seat_add(SeatBean sb) {
		
		concertDao.seat_add(sb);
		
	}
	
	
	/*-------------------예매내역----------------------------------*/
	
	public List<PaymentBean> book_list(String user_id ,int month) {

		Date nowMinus = new Date (); //오늘 날짜를 기준으루..		
		nowMinus.setMonth(nowMinus.getMonth()-month);//month개월 전....
		
		Map<String, Object> resultMap = new HashMap <String, Object>();
		
		resultMap.put("nowMinus", nowMinus);
		resultMap.put("user_id", user_id);
		
		List<PaymentBean> list = concertDao.book_list(resultMap);
		
		return list;
	}

	/*----------------예매 디테일----------------------------*/
	public PaymentBean book_detail(int payment_num) throws Exception {
		PaymentBean dto = concertDao.book_detail(payment_num);

		return dto;
	}
	
	/*----------------좌석 리스트----------------------------*/
	public List<SeatBean> seat_list(int concert_num) throws Exception {
		
		List<SeatBean> sb = concertDao.seat_list(concert_num);

		return sb;
	}
	
	/*----------------결제하기 버튼----------------------------*/
	public PaymentBean pay_ok(int payment_num) throws Exception {
		
		concertDao.pay_ok(payment_num);

		return null;
	}
	
	/*-------------------예약취소----------------------------------------*/
	
	public PaymentBean book_c(int payment_num) throws Exception {
		
		concertDao.book_c(payment_num);
		
		return null;
		
	}

	/*----------------------payment_num 값 구해오기------------------------------*/
	
	
	public int book_data() throws Exception{
		// TODO Auto-generated method stub
		
		int payment_num = concertDao.book_data();
		
		return payment_num;
	}
	
	
	
	
	
	
}