package com.naver.springbox.service;

import java.util.List;

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
	
	public List<PaymentBean> book_list(String user_id) {
		List<PaymentBean> list = concertDao.book_list(user_id);

		return list;
	}

	/*----------------예매 디테일----------------------------*/
	public PaymentBean book_detail(int payment_num) throws Exception {
		PaymentBean dto = concertDao.book_detail(payment_num);

		
		System.out.println("예매 디테일 서비스");
		return dto;
	}
	
	
}