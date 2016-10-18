package com.naver.springbox.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.naver.springbox.dto.ConcertBean;
import com.naver.springbox.service.ConcertAction;

@Controller
public class BookController {

		@Autowired
		private ConcertAction concertAction;	
		
		
		/*------------------------결제페이지로 이동-----------------*/
		
		@RequestMapping(value = "/payment.box",  method = RequestMethod.POST)
		public ModelAndView getPayment(HttpServletRequest request, HttpSession session)throws Exception {

			System.out.println("payment.box 들어옴");
						
			String payment_date = request.getParameter("payment_date");
			String payment_seat = request.getParameter("payment_seat");
			String payment_time = request.getParameter("payment_time");
			int concert_num = Integer.parseInt(request.getParameter("concert_num"));
			
			ConcertBean dto = concertAction.concertDetail(concert_num);
			
			
			ModelAndView mav = new ModelAndView();
			
			// 데이터를 저장
			mav.addObject("concertdata", dto);
			mav.addObject("payment_seat", payment_seat);
			mav.addObject("payment_date", payment_date);
			mav.addObject("payment_time", payment_time);
			
			// 출력할 뷰 파일 설정
			mav.setViewName("/concert/payment");
//		}

		return mav;
	}
}
