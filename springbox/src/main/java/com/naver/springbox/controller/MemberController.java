package com.naver.springbox.controller;

import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.naver.springbox.dao.MemberDao;
import com.naver.springbox.dto.MemberBean;
import com.naver.springbox.service.EmailCheckAction;
import com.naver.springbox.service.IdCheckAction;
import com.naver.springbox.service.MemberJoinAction;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class MemberController {

	@Autowired
	private MemberDao memberDao;

	@RequestMapping(value = "/member_sample.box", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		return "member/member_sample";
	}

	@RequestMapping(value = "/login.box", method = RequestMethod.GET)
	public String LoginHome() {
		return "member/login";
	}

	@RequestMapping(value = "/login_action.box", method = RequestMethod.POST)
	public ModelAndView Login( HttpServletRequest request, HttpServletResponse response) {

		try {
			// ... 濡쒓렇�씤
			String userId = request.getParameter("inputId");
			String userPassword = request.getParameter("inputPassword");
			HttpSession session =request.getSession();

			MemberBean users = memberDao.getMemberInfo(userId);

<<<<<<< HEAD
			if (user != null) {
				if (user.getPassword().equals(userPassword)) {
					// 濡쒓렇�씤 �꽦怨�
					HttpSession session = request.getSession();
					session.setAttribute("loginId", user.getUser_id());
					session.setAttribute("loginName", user.getName());
=======
			if (users != null) {
				if (users.getPassword().equals(userPassword)) {
					// 로그인 성공
					
				    session.setAttribute("users", users);
					session.setAttribute("loginId", users.getUser_id());
					session.setAttribute("loginName", users.getName());
>>>>>>> branch 'master' of https://github.com/project-box/springbox.git

				} else {
					// �뙣�뒪�썙�뱶 ��由�
					response.setContentType("text/html;charset=utf-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('鍮꾨�踰덊샇媛� �씪移섑븯吏� �븡�뒿�땲�떎.');");
					out.println("location.href='./login.box';");
					out.println("</script>");
					out.close();
					return null;
				}
			} else {
				// �궗�슜�옄媛� �뾾�쓬.
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('�븘�씠�뵒媛� 議댁옱�븯吏� �븡�뒿�땲�떎.');");
				out.println("location.href='./login.box';");
				out.println("</script>");
				out.close();
				return null;
			}

			ModelAndView mav = new ModelAndView();
			
			mav.setViewName("redirect:main.box");
			
			return mav;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(value = "/logout.box", method = RequestMethod.GET)
	public String Logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();

		return "redirect:main.box";
	}

	//회원가입시 id 중복확인
		@Autowired
		private IdCheckAction idCheckAction;
		
		@RequestMapping("/id_Check.member")	//servlet 1단계-HTTP 요청
		public ModelAndView idcheck(String user_id) {	//servlet 4단계
			ModelAndView mav = new ModelAndView();
			boolean result = idCheckAction.IdCheck(user_id); //servlet 2단계
			mav.addObject("result", result);	//servlet 4단계
			mav.setViewName("idCheck");	//servlet 5단계
			return mav;			//
		}
	
	//회원가입시 email 중복확인
	@Autowired
	private EmailCheckAction emailCheckAction;
	
	@RequestMapping("/Email_Check.member")	//servlet 1단계-HTTP 요청
	public ModelAndView check(String email) {	//servlet 4단계
		ModelAndView mav = new ModelAndView();
		boolean result = emailCheckAction.EmailCheck(email); //servlet 2단계
		mav.addObject("result", result);	//servlet 4단계
		mav.setViewName("emailCheck");	//servlet 5단계
		return mav;			//
	}
	
	
	//회원가입
	@RequestMapping("/member_join.member")
	public ModelAndView join() {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("/member/member_join");

		return mav;
	}
	
	@Autowired
	private MemberJoinAction memberJoinAction;

	// 회원 가입
	@RequestMapping(value="/join_process.member", method = RequestMethod.POST)
//	public ModelAndView insertMember(HttpServletRequest request) {
//	public ModelAndView insertMember(@ModelAttribute MemberBean member) {
	public ModelAndView insertMember(HttpServletRequest request) throws Exception {
		System.out.println("가입 들어옴");	
		MemberBean member = new MemberBean();
		
		String uploadPath = request.getRealPath("sboardupload");		
		int size = 10 * 1024 * 1024; // 10MB까지 업로드 가능

		MultipartRequest multi=null;
		multi = new MultipartRequest(
				request, 
				uploadPath,
				size, 
				"utf-8", 
				new DefaultFileRenamePolicy());		
		
		member.setUser_id(multi.getParameter("user_id"));
		member.setPassword(multi.getParameter("password"));
		member.setName(multi.getParameter("name"));
		member.setEmail(multi.getParameter("email"));
		member.setGender(multi.getParameter("gender"));
		member.setPhone(multi.getParameter("phone"));
		member.setAge(Integer.parseInt(multi.getParameter("age")));
//		member.setLogincont(Integer.parseInt(multi.getParameter("logincont")));
//		member.setStatus(multi.getParameter("status"));		
		member.setImage(multi.getFilesystemName((String) multi.getFileNames().nextElement()));	
		
		
		ModelAndView mav = new ModelAndView();
		boolean result = memberJoinAction.insertMember(member);
		System.out.println("result="+result);
		
		if (result) {
			mav.setViewName("redirect:login.box");
		} else {
			mav.addObject("result", result);
			mav.setViewName("/member/member_join");
		}
		return mav;
	}
	
	@RequestMapping(value = "/mypage.box")
	public String myPage(HttpServletRequest request, HttpServletResponse response) {

		try {
			HttpSession session = request.getSession();
			if (session.getAttribute("loginId") == null) {

				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('留덉씠�럹�씠吏�濡� 媛��젮硫� 濡쒓렇�씤�씠 �븘�슂�빀�땲�떎.');");
				out.println("location.href='./login.box';");
				out.println("</script>");
				return null;
			} else {
				return "member/mypage";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
