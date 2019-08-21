package com.vs.my.User.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vs.my.User.DAOVO.UserDAO;
import com.vs.my.User.DAOVO.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UserController {
	
	UserDAO ud = new UserDAO();
	
	@RequestMapping(value = "/", method = RequestMethod.GET) //메인페이지
	public ModelAndView Main(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Main");
		
		return mv;
	}
	
	///////////////////////////// 회원 관련 ///////////////////////////////////
	
	@RequestMapping(value="/SignUp", method=RequestMethod.GET) //회원가입
	public ModelAndView SignUp(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("SingUp");
		
		return mv;
	}
	
	@RequestMapping(value="/Terms", method=RequestMethod.GET) //약관 동의
	public ModelAndView Terms(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Terms");
		
		return mv;
	}
	
	@RequestMapping(value="/Login", method=RequestMethod.POST) //로그인
	public ModelAndView Login(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Login");
		
		return mv;
	}
	
	@RequestMapping(value="/FindID", method=RequestMethod.POST) //아이디 찾기
	public ModelAndView FindID(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("FindID");
		
		return mv;
	}
	
	@RequestMapping(value="/FindPW", method=RequestMethod.POST) //비밀번호 찾기
	public ModelAndView FindPW(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("FindPW");
		
		return mv;
	}
	
	@RequestMapping(value="/MyPage", method=RequestMethod.GET) //마이페이지
	public ModelAndView MyPage(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("MyPage");
		
		return mv;
	}
	
	@RequestMapping(value="/UserAllData", method=RequestMethod.GET) //유저정보 전부보기
	public ModelAndView UserAllData(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("UserAllData");
		
		List<UserVO> userlist = ud.UserAllData();
		
		mv.addObject("userlist", userlist);
		
		return mv;
	}
	//////////////////////////// 게시판 관련 /////////////////////////////////
	
	@RequestMapping(value="/Board", method=RequestMethod.GET) //게시판
	public ModelAndView Board(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Board");
		
		
		return mv;
	}
	
	@RequestMapping(value="/Category",method=RequestMethod.GET) // 카테고리
	public ModelAndView Category(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Category");
		
		return mv;
	}
	
	
	@RequestMapping(value="/OneView", method=RequestMethod.GET) //글 하나 보기
	public ModelAndView OneView(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("OneView");
		
		return mv;
	}
	
	@RequestMapping(value="/WritePost", method=RequestMethod.POST) //글 작성 화면
	public ModelAndView WritePost(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WritePost");
		
		return mv;
	}
	
	@RequestMapping(value="/EditPost", method=RequestMethod.POST) //글 수정 화면
	public ModelAndView EditPost(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("EditPost");
		
		return mv;
	}
	
	@RequestMapping(value="/Search", method=RequestMethod.POST) //검색 결과
	public ModelAndView Search(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Search");
		
		return mv;
	}
	
}
