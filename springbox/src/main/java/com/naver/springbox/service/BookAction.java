package com.naver.springbox.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.springbox.dao.ConcertDao;
import com.naver.springbox.dto.PaymentBean;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class BookAction {

	@Autowired
	private ConcertDao concertDao;
	
	
	/*--------------결제완료--------------------------------------*/

	public void book_list(PaymentBean pb) {
		System.out.println("book_list 서비스2");
		
		concertDao.book_list(pb);
		
	}
	
	
	
}