package com.naver.springbox.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BookController {

//		@Autowired
//		private BookAction bookAction;
		
		/*------------------------좌석선택 완료-----------------*/
		
		@RequestMapping(value = "/payment.box", method = RequestMethod.POST)
		public String getPayment(Locale locale, Model model, HttpServletRequest request) {

			
			String payment_seat = request.getParameter("payment_seat");
			String payment_time = request.getParameter("payment_time");
			
			System.out.println(payment_seat);
			System.out.println(payment_time);
			
			return "concert/payment";
		}
}
