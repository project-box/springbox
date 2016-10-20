package com.naver.springbox.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.springbox.dao.ConcertDao;
import com.naver.springbox.dto.ConcertBean;
import com.naver.springbox.dto.ConcertBoardBean;
import com.naver.springbox.dto.PaymentBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class BookAction {

	@Autowired
	private ConcertDao concertDao;
	
	
	/*--------------결제완료--------------------------------------*/

	public void book_add(PaymentBean pb) {
		
		concertDao.book_add(pb);
		
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