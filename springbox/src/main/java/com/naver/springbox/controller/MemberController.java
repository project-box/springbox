package com.naver.springbox.controller;

import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.naver.springbox.dao.MemberDao;
import com.naver.springbox.dto.MemberBean;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDao memberDao; 
	
	@RequestMapping(value = "/member_sample.box", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {		
		
		return "member/member_sample";
	}
	
	@RequestMapping(value = "/login.box", method = RequestMethod.GET)
	public String LoginHome(){
		return "member/login";
	}
	
	@RequestMapping(value = "/login_action.box", method = RequestMethod.POST)
	public ModelAndView Login(HttpServletRequest request, HttpServletResponse response){
		
		try{
			// ... 로그인
			String userId = request.getParameter("inputId");
			String userPassword = request.getParameter("inputPassword");

			MemberBean user = memberDao.getMemberInfo(userId);

			if (user != null) {
				if(user.getPassword().equals(userPassword)){
					// 로그인 성공
					HttpSession session=request.getSession();
			   		session.setAttribute("loginId", user.getUser_id());
			   		session.setAttribute("loginName", user.getName());
			   		
				}else{
					// 패스워드 틀림
					response.setContentType("text/html;charset=utf-8");
			   		PrintWriter out=response.getWriter();
			   		out.println("<script>");
			   		out.println("alert('비밀번호가 일치하지 않습니다.');");
			   		out.println("location.href='./login.box';");
			   		out.println("</script>");
			   		out.close();
			   		return null;
				}
			} else {
				// 사용자가 없음.
				response.setContentType("text/html;charset=utf-8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('아이디가 존재하지 않습니다.');");
		   		out.println("location.href='./login.box';");
		   		out.println("</script>");
		   		out.close();
		   		return null;
			}
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:main.box");
			return mav;
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	@RequestMapping(value = "/logout.box", method = RequestMethod.GET)
	public String Logout(HttpServletRequest request){
		HttpSession session=request.getSession();
		session.invalidate();
		
		return "redirect:main.box";
	}
}
