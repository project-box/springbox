package com.naver.springbox.controller;

import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.ServletRequest;
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
import com.naver.springbox.service.EmailCheckAction;
import com.naver.springbox.service.IdCheckAction;
import com.naver.springbox.service.MemberJoinAction;
import com.naver.springbox.service.MemberLogincont;
import com.naver.springbox.service.Member_drop;
import com.naver.springbox.service.Member_getInfo;
import com.naver.springbox.service.Member_passset;
import com.naver.springbox.service.Member_update;
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

	@Autowired 
	private MemberLogincont memberLogincont;		//로그인횟수증가시키기
	
	@RequestMapping(value = "/login_action.box", method = RequestMethod.POST)
	public ModelAndView Login( HttpServletRequest request, HttpServletResponse response) {

		try {
			// 입력창에서 값 가져오기
			String userId = request.getParameter("inputId");
			String userPassword = request.getParameter("inputPassword");
			HttpSession session =request.getSession();

			MemberBean users = memberDao.getMemberInfo(userId);

			if (users != null) {
				if (users.getPassword().equals(userPassword)) {
					// 로그인 성공
				    session.setAttribute("users", users);
					session.setAttribute("loginId", users.getUser_id());
					session.setAttribute("loginName", users.getName());
					session.setAttribute("loginPhone", users.getPhone());
					
					//로그인 성공에 따라서 로그인 횟수 증가시키기
					memberLogincont.Logincont(users.getUser_id());
					
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


	@RequestMapping(value="/join_process.member", method = RequestMethod.POST)
	public ModelAndView insertMember(HttpServletRequest request) throws Exception {
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
		member.setStatus(multi.getParameter("status"));		
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
	
	//비밀번호 찾기-새로운 비빌번호를 생성하여 이메일 전송
	@RequestMapping(value = "/PassView.member")
	public ModelAndView passView() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/find");
		return mav;
	}
	
	@Autowired Member_passset member_passset;
	
	@RequestMapping(value = "/FindPassword.member")
	public ModelAndView passset(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		boolean result = member_passset.Update_pass(request);
		
		if(result) 
			mav.setViewName("/member/login");
		
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
	
	//회원정보 업데이트-정보 확인하기
	@Autowired Member_getInfo member_getInfo;
	
	@RequestMapping("/memberInfo_view.member")
	public ModelAndView memberInfoView(HttpSession session){
		ModelAndView mav = new ModelAndView();	
  
  		MemberBean member = null;
		String loginId = (String)session.getAttribute("loginId");
				
		if(loginId == null) {
			mav.setViewName("/member/login");
		}else {
			member = member_getInfo.getUpdate_getInfo(loginId);
			mav.addObject("member", member);
			mav.setViewName("/member/update");
		}
		return mav;
	}
	
	
	//회원정보 업데이트-수정내용 반영하기
	@RequestMapping(value = "/Member_update.member")
	public ModelAndView memberUpdate() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/update");
		return mav;
	}
		
	@Autowired Member_update member_update;
	
	@RequestMapping(value = "/update_process.member", method = RequestMethod.POST)
	public ModelAndView MemberUpdate(HttpServletRequest request, HttpSession session ) throws Exception {
		MemberBean member = new MemberBean();
		String user_id = (String) session.getAttribute("loginId");
		
		String uploadPath = request.getRealPath("sboardupload");		
		int size = 10 * 1024 * 1024; // 10MB까지 업로드 가능

		MultipartRequest multi=null;
		multi = new MultipartRequest(
				request, 
				uploadPath,
				size, 
				"utf-8", 
				new DefaultFileRenamePolicy());		
		
		member.setUser_id(user_id);
		member.setPassword(multi.getParameter("password"));
		member.setName(multi.getParameter("name"));
		member.setEmail(multi.getParameter("email"));
		member.setPhone(multi.getParameter("phone"));
		member.setAge(Integer.parseInt(multi.getParameter("age")));
		member.setImage(multi.getFilesystemName((String) multi.getFileNames().nextElement()));	
		
		ModelAndView mav = new ModelAndView();
		boolean result = member_update.updateMember(member);
		
		if (result) {
			mav.setViewName("redirect:memberInfo_view.member");
		} else {
			mav.addObject("result", result);
			mav.setViewName("/member/update");
		}
		return mav;
	}
	
	/*@RequestMapping(value = "/update_process.member", method = RequestMethod.POST)
	public ModelAndView mem_update(MultipartHttpServletRequest request, HttpSession session) { 
		ModelAndView mav = new ModelAndView();
		MemberBean member = (MemberBean)session.getAttribute("member");
		
		System.out.println("어디에있니");
		
		if(member == null) {
			mav.setViewName("/member/login");
		}else{
			if(member_update.updateMember(request)){
				session.invalidate();
				mav.setViewName("redirect:login.box");
			}else{
				mav.addObject("result", false);
				mav.setViewName("/member/update");
			}
		}
		return mav;
	}파일업로드 방식이라고 하네요*/

	//회원탈퇴화면가기
	@RequestMapping("/Member_drop.member")
	public ModelAndView dropView(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if(session.getAttribute("loginId") == null) {
			mav.setViewName("/member/login");
		} else {
			mav.setViewName("/member/member_drop");
		}
		return mav;
	}
	
	@Autowired Member_drop member_drop;
	
	@RequestMapping("/Drop_process.member")
	public ModelAndView dropMember(MemberBean member, HttpSession session, ServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		 System.out.println("어디에 있니2222");	
		 
		if(session.getAttribute("loginId") == null) {
			mav.setViewName("/member/login");
		} else {
			MemberBean user = (MemberBean)session.getAttribute("users");
			
				System.out.println("user = "+ user);	
				
			boolean result = member_drop.memberDown(user);
			
				System.out.println("user = "+ user);	
			
			if(result){
				session.invalidate();
				mav.setViewName("redirect:main.box");
			}else {
				mav.addObject("result", result);
				mav.setViewName("/member/member_drop");
			}
		}
		return mav;
	}
	
}
