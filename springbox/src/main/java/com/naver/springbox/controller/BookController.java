package com.naver.springbox.controller;

import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.naver.springbox.dto.ConcertBean;
import com.naver.springbox.dto.PaymentBean;
import com.naver.springbox.dto.SeatBean;
import com.naver.springbox.service.BookAction;
import com.naver.springbox.service.ConcertAction;

@Controller
public class BookController {

	@Autowired
	private ConcertAction concertAction;

	/*------------------------결제페이지로 이동-----------------*/

	@RequestMapping(value = "/payment.box", method = RequestMethod.POST)
	public ModelAndView payment(HttpServletRequest request, HttpSession session) throws Exception {

		String payment_date = request.getParameter("payment_date");
		String payment_time = request.getParameter("payment_time");
		int payment_amount = Integer.parseInt(request.getParameter("payment_amount"));
		int concert_num = Integer.parseInt(request.getParameter("concert_num"));
		String seat_seat = request.getParameter("seat_seat");

		ConcertBean dto = concertAction.concertDetail(concert_num);

		ModelAndView mav = new ModelAndView();

		// 데이터를 저장
		mav.addObject("concertdata", dto);
		mav.addObject("seat_seat", seat_seat);
		mav.addObject("payment_date", payment_date);
		mav.addObject("payment_time", payment_time);
		mav.addObject("payment_amount", payment_amount);

		// 출력할 뷰 파일 설정
		mav.setViewName("/concert/payment");
		// }

		return mav;
	}

	@Autowired
	private BookAction bookAction;

	/*----------------------결제정보 등록----------------------------*/

	@RequestMapping("/book_add.box")
	public ModelAndView book_list(@ModelAttribute PaymentBean pb, SeatBean sb, HttpServletRequest request,
			HttpSession session) throws Exception {

		String id = (String) session.getAttribute("loginId");
		pb.setUser_id(id);

		int concert_num = pb.getConcert_num();
		ConcertBean cb = concertAction.concertDetail(concert_num);

		pb.setPayment_title(cb.getConcert_title());
		pb.setPayment_poster(cb.getPosterfilepath());
		bookAction.book_add(pb);
		
				
		String seat_seat = request.getParameter("seat_seat");
		int payment_num = bookAction.book_data();
		
		System.out.println("payment_num="+payment_num);
		
		
		String[] values = seat_seat.split("/");
		for (int x = 0; x < values.length; x++) {

			sb.setSeat_seat(values[x]);
			sb.setConcert_num(concert_num);
			sb.setSeat_date(pb.getPayment_date());
			sb.setSeat_time(pb.getPayment_time());
			sb.setPayment_num(payment_num);
			
			bookAction.seat_add(sb);
		}		
		

		ModelAndView mav = new ModelAndView();

		mav.setViewName("redirect:book_list.box");
		return mav;

	}

	/*-------------------------------예매내역------------------------------*/

	@RequestMapping("/book_list.box")
	public ModelAndView book_list(HttpSession session) throws Exception {

		String user_id = (String) session.getAttribute("loginId");

		// 게시물 목록 가져오기
		List<PaymentBean> list = bookAction.book_list(user_id);

		ModelAndView mav = new ModelAndView();
		mav.addObject("paymentdata", list);
		mav.setViewName("/concert/book_list");

		return mav;
	}

	/*------------------------예매상세보기-------------------------------*/

	@RequestMapping(value = "/book_detail.box")
	public ModelAndView book_detail(int payment_num, HttpServletRequest request) throws Exception {

		PaymentBean pb = bookAction.book_detail(payment_num);

		ModelAndView mav = new ModelAndView();
		// 데이터를 저장
		mav.addObject("paymentdata", pb);
		// 출력할 뷰 파일 설정
		mav.setViewName("/concert/book_detail");

		return mav;
	}
	
	/*------------------------결제하기 버튼-------------------------------*/
	@RequestMapping(value = "/pay_check.box")
	public ModelAndView pay_check(int payment_num, HttpServletRequest request) throws Exception {


		ModelAndView mav = new ModelAndView();
		// 데이터를 저장
		mav.addObject("payment_num", payment_num);
		// 출력할 뷰 파일 설정
		mav.setViewName("/concert/pay_check");

		return mav;
	}
	
	/*------------------------결제완료 버튼-------------------------------*/
	@RequestMapping(value = "/pay_ok.box")
	public ModelAndView pay_ok(int payment_num) throws Exception {

		bookAction.pay_ok(payment_num);

		ModelAndView mav = new ModelAndView();

		// 출력할 뷰 파일 설정
		mav.setViewName("redirect:book_list.box");

		return mav;
	}
	
	
	/*------------------------------예약취소---------------------------*/
	@RequestMapping(value = "/book_c.box")
	public ModelAndView book_c(int payment_num) throws Exception {
		
		bookAction.book_c(payment_num);
		
		ModelAndView mav = new ModelAndView();

		// 출력할 뷰 파일 설정
		mav.setViewName("redirect:book_list.box");

		return mav;
		
		
		
	}
	
	
	
	
	
	

}
