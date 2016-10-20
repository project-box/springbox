package com.naver.springbox.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.naver.springbox.dto.ConcertBean;
import com.naver.springbox.dto.ConcertBoardBean;
import com.naver.springbox.dto.PaymentBean;
import com.naver.springbox.service.BookAction;
import com.naver.springbox.service.ConcertAction;

@Controller
public class BookController {

		@Autowired
		private ConcertAction concertAction;	
		
		
		/*------------------------결제페이지로 이동-----------------*/
		
		@RequestMapping(value = "/payment.box",  method = RequestMethod.POST)
		public ModelAndView payment(HttpServletRequest request, HttpSession session)throws Exception {
				
			String payment_date = request.getParameter("payment_date");
			String payment_seat = request.getParameter("payment_seat");
			String payment_time = request.getParameter("payment_time");
			int payment_amount = Integer.parseInt(request.getParameter("payment_amount"));
			int concert_num = Integer.parseInt(request.getParameter("concert_num"));

			ConcertBean dto = concertAction.concertDetail(concert_num);
			
			
			ModelAndView mav = new ModelAndView();
			
			// 데이터를 저장
			mav.addObject("concertdata", dto);
			mav.addObject("payment_seat", payment_seat);
			mav.addObject("payment_date", payment_date);
			mav.addObject("payment_time", payment_time);
			mav.addObject("payment_amount", payment_amount);
			
			
			// 출력할 뷰 파일 설정
			mav.setViewName("/concert/payment");
//		}

		return mav;
	}
		
		
		
		@Autowired
		private BookAction bookAction;
		
	/*----------------------결제정보 등록----------------------------*/
		
		
		@RequestMapping("/book_add.box")
		public ModelAndView book_list(@ModelAttribute PaymentBean pb, HttpSession session) {
			
			String id= (String) session.getAttribute("loginId");			
			pb.setUser_id(id);	
			
			String check = pb.getPayment_check(); 
			
			if(check.equals("신용카드") || check.equals("실시간계좌이체")){
				
				pb.setPayment_check("결제완료");
				
			}else if(check.equals("무통장입금")){
				
				pb.setPayment_check("결제대기");
			}
			
			bookAction.book_add(pb);
			
			int concert_num=pb.getConcert_num();
			
			ModelAndView mav = new ModelAndView();

			mav.setViewName("redirect:book_list.box?concert_num="+concert_num);
			return mav;

		}
		
		/*-------------------------------예매내역------------------------------*/
		
		@RequestMapping("/book_list.box")
		public ModelAndView book_list(int concert_num, HttpServletRequest request) throws Exception {

			
				// 게시물 목록 가져오기		
			ConcertBean dto = concertAction.concertDetail(concert_num);
			List <PaymentBean> list= bookAction.book_list(concert_num);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("concertdata", dto);
			mav.addObject("paymentdata", list);
			mav.setViewName("/concert/book_list");
				
			
			return mav;
		}
		
		
		/*------------------------예매상세보기-------------------------------*/
		
		@RequestMapping(value = "/book_detail.box")
		public ModelAndView book_detail(int payment_num, int concert_num, HttpServletRequest request) throws Exception {
			
			
			System.out.println("디테일 페이지 컨트롤");
			
			
			PaymentBean pb = bookAction.book_detail(payment_num);
			ConcertBean cb = concertAction.concertDetail(concert_num);
			
			ModelAndView mav = new ModelAndView();
			// 데이터를 저장
			mav.addObject("concertdata", cb);
			mav.addObject("paymentdata", pb);
			// 출력할 뷰 파일 설정
			mav.setViewName("/concert/book_detail");


		return mav;
	}
			
		
		
		
}
