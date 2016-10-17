package com.naver.springbox.controller;


import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.naver.springbox.dto.FaqBean;
import com.naver.springbox.dto.FormBoardDto;
import com.naver.springbox.dto.MemberBean;
import com.naver.springbox.dto.SboardDto;
import com.naver.springbox.service.FaqDetailAction;
import com.naver.springbox.service.FaqListAction;
import com.naver.springbox.service.FaqWriteAction;
import com.naver.springbox.service.ReplyInsertAction;
import com.naver.springbox.service.ReplyListAction;
import com.naver.springbox.service.SboardDeleteAction;
import com.naver.springbox.service.SboardDetailAction;
import com.naver.springbox.service.SboardInsertAction;
import com.naver.springbox.service.SboardListAction;
import com.naver.springbox.service.SboardModifyView;
import com.naver.springbox.service.SboardUpdateAction;


@Controller
public class GogaekController {
	
	
	
	
	@RequestMapping("/Gogaekmain.box")
	public ModelAndView gogaekmainView() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/gogaek/gogaekmain");
		return mav;
	}
	
	
	//도움말  리스트 
	@Autowired
	private FaqListAction faqListAction;
	
	@RequestMapping("/FaqList.box")
	public ModelAndView faqList() {
		ModelAndView mav = new ModelAndView();
		
		List<FaqBean> list = faqListAction.execute();
		mav.addObject("result", list);
		mav.setViewName("/gogaek/faqList");

		return mav;
	}
	
	
	//도움말 상세
	
	@Autowired
	private FaqDetailAction faqDetailAction;

	@RequestMapping("/FaqDetail.box")
	public ModelAndView faqDetail(String num) {
		ModelAndView mav = new ModelAndView();
		FaqBean dto = faqDetailAction.execute(num);
		mav.addObject("result", dto); // dto
		mav.setViewName("/gogaek/faqDetail");
		return mav;
	}
	// 10/10 4:03
	
	// 도움말 작성 페이지로 가기
	@RequestMapping("/FaqWrite.box")
	public ModelAndView faqWriteView() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/gogaek/faqWrite");
		return mav;
	}
	
	// 도움말 작성 등록 유무에 따른 List or 작성 페이지
	@Autowired
	private FaqWriteAction faqWriteAction;

	@RequestMapping("/FaqAddAction.box")
	public ModelAndView faqWriteAction(FaqBean dto) {
		ModelAndView mav = new ModelAndView();
		boolean r = faqWriteAction.execute(dto);
		if (r) {
			// 목록보기로 redirect
			mav.setViewName("redirect:FaqList.box");

		} else {
			// 공지사항 쓰기로 redirect
			mav.setViewName("redirect:FaqWrite.box");
		}
		return mav;
	}
	
	
	@Autowired
	private SboardListAction sboardListAction;

	@RequestMapping("/SboardList.box")
	public ModelAndView getSboardList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();		
			// 서비스게시물 목록 가져오기
			Map<String, Object> map = sboardListAction.execute(request);
			// 여러 개의 데이터를 묶어서 저장할 때는
			// addObject를 사용하지 않고 Map을 저장할 수
			// 있습니다.
			mav.addAllObjects(map); //
			// 공지사항을 다음페이지에 전달하기 위해서
			// 저장하기
			mav.setViewName("/gogaek/sboardList");
	
		return mav;
	}

	
	@Autowired
	private SboardDetailAction sboardDetailAction;
	@Autowired
	private ReplyListAction replyListAction;

	@RequestMapping("/SboardDetail.box")
	public ModelAndView getSboardDetail(int num, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		// 로그인 정보를 확인해서 로그인 안되어
		// 있으면 로그인 페이지로 이동
		
			SboardDto dto = sboardDetailAction.execute(num);
			List<Map<String, Object>> list = replyListAction.getReplyList(num);
			// 데이터를 저장
			mav.addObject("sboarddata", dto);			
			mav.addObject("replydata", list);
			// 출력할 뷰 파일 설정
			mav.setViewName("/gogaek/sboardDetail");
	
		return mav;
	}
	

	@Autowired
	private ReplyInsertAction replyInsertAction;

	@RequestMapping("/ReplyAdd.box")
	public ModelAndView insertReply(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		// 로그인 되어 있지 않으면 로그인 페이지로 이동
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			mav.setViewName("/member/login");
		} else {
			// 데이터 삽입
			boolean r = replyInsertAction.execute(request);
			// 삽입에 실패했을 때 목록보기로 이동
			if (!r) {
			
				Map<String, Object> map = sboardListAction.execute(request);
				
				mav.addAllObjects(map);
				mav.setViewName("/gogaek/sboardList");
			} else {
				// 상세보기 수행
				// 글번호가져오기
				int num = Integer.parseInt(request.getParameter("num"));
				// redirect 할 때는 출력할 파일이름을
				// 직접 사용하지 않고 요청 주소를 이용합니다.
				mav.setViewName("redirect:SboardDetail.box?num=" + num);

			}
		}
		return mav;
	}

	
	// BoardWrite.board 요청이 오면
	// board/boardwrite.jsp로 이동하도록
	// 요청을 처리하는 메소드
	// session에 로그인 정보가 없으면
	// member/login.jsp로 이동
	@RequestMapping("/SboardWrite.box")
	public ModelAndView writeView(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if (session.getAttribute("user") == null) {			            
	        	mav.setViewName("/member/login");
		} else {
			mav.setViewName("/gogaek/sboardwrite");
		}
		return mav;
	}

	
	@Autowired
	private SboardInsertAction sboardInsertAction;

	@RequestMapping("SboardAddAction.box")
	public ModelAndView writeBoard(FormBoardDto dto, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		boolean r = sboardInsertAction.execute(dto, request);
		if (r) {
			// 목록보기로 리다이렉트
			mav.setViewName("redirect:SboardList.box");
		} else {
			// 글쓰기 페이지로 포워딩
			mav.setViewName("gogaek/sboardWrite");
		}
		return mav;
		
	}
	

	@Autowired
	private SboardModifyView sboardModifyView;

	@RequestMapping("/SboardModify.box")
	public ModelAndView modifyView(@RequestParam("num") int num, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		// 로그인 되어 있지 않으면 로그인페이지로
		// 이동하도록 설정
		if (session.getAttribute("user") == null) {
			mav.setViewName("/member/login");
		}
		// 로그인 되어 있으면 서비스를 수행
		else {
			SboardDto dto = sboardModifyView.execute(num);
			mav.addObject("sboarddata", dto);
			mav.setViewName("/gogaek/sboardModify");
		}
		return mav;
	}

	
	@Autowired
	private SboardUpdateAction sboardUpdateAction;

	@RequestMapping("/SboardModifyAction.box")
	public ModelAndView updateBoard(FormBoardDto formBoardDto, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		// 로그인 한 상태가 아니면 로그인 페이지로 이동
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			mav.setViewName("/member/login");
		} else {
			boolean r = sboardUpdateAction.execute(formBoardDto, request);
			if (r) {
				// 목록보기로 리다이렉트
				mav.setViewName("redirect:SboardList.box");
			} else {
				// index.jsp로 포워딩
				mav.setViewName("gogaekmain");
			}
		}

		return mav;
	}

	
	@Autowired
	private SboardDeleteAction sboardDeleteAction;

	@RequestMapping("/SboardDelete.box")
	public ModelAndView deleteSboard(@RequestParam("num") int num, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		// 로그인 되어 있지 않으면 로그인 페이지로 이동
		if (session.getAttribute("user") == null) {
			mav.setViewName("/member/login");
		} else {
			boolean r = sboardDeleteAction.execute(num);
			if (r) {
				mav.setViewName("redirect:SboardList.box");
			} else {
				mav.setViewName("gogaekmain");
			}
		}
		return mav;
	}

	
	@RequestMapping("/download.box")
	public ModelAndView download(String filename, HttpServletRequest request) {
		String realPath = request.getSession().getServletContext().getRealPath("sboardupload");
		File downloadFile = new File(realPath + "\\" + filename);
		// download 라는 View에 출력하고
		// downloadFile 이라는 이름으로
		// downloadFile 이라는 데이터를 전송
		return new ModelAndView("download", "downloadFile", downloadFile);
		// ?
	}
}


	
	
	

