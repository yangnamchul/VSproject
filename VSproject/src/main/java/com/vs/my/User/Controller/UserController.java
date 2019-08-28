package com.vs.my.User.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vs.my.User.DAOVO.UserVO;
import com.vs.my.User.Service.UserService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UserController {
	
	@Autowired

	UserService us;
	HttpSession hs;
	
	@RequestMapping(value = "/", method = RequestMethod.GET) //메인페이지
	public ModelAndView Main(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Main");
		
		return mv;
	}
	
	@RequestMapping(value = "/Main", method = RequestMethod.GET) //메인페이지
	public ModelAndView Main1(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Main");
		
		return mv;
	}
	
	///////////////////////////// 회원 관련 ///////////////////////////////////
	
	@RequestMapping(value="SignUp.do", method=RequestMethod.GET) //회원가입
	public ModelAndView SignUp(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("SignUp");
		
		return mv;
	}
	
	@RequestMapping(value="Terms.do", method=RequestMethod.GET) //약관 동의
	public ModelAndView Terms(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Terms");
		
		return mv;
	}
	
	@RequestMapping(value="Login.do", method=RequestMethod.GET) //로그인
	public ModelAndView Login(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Login");
		
		return mv;
	}
	
	@RequestMapping(value="LoginAction.do", method=RequestMethod.POST) //로그인
	@ResponseBody
	public int LoginAction(HttpServletRequest req , UserVO uv, HttpSession hs) {
		int data = 0;
		
		data = us.LoginAction(uv, hs);
		
		return data;
	}
	
	@RequestMapping(value="LogOut.do", method=RequestMethod.GET) //로그아웃
	public ModelAndView Logout(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Main");
		
		HttpSession hs = request.getSession();

		hs.invalidate();
		
		return mv;
		
	}
	
	@RequestMapping(value="FindID.do", method=RequestMethod.POST) //아이디 찾기
	public ModelAndView FindID(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("FindID");
		
		return mv;
	}
	
	@RequestMapping(value="FindPW.do", method=RequestMethod.POST) //비밀번호 찾기
	public ModelAndView FindPW(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("FindPW");
		
		return mv;
	}
	
	@RequestMapping(value="MyPage.do", method=RequestMethod.GET) //마이페이지
	public ModelAndView MyPage(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("MyPage");
		
		return mv;
	}
	
	@RequestMapping(value="UserAllData.do", method=RequestMethod.GET) //유저정보 전부보기
	public ModelAndView UserAllData(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("UserAllData");
		
		List<UserVO> userlist = us.UserAllData();
		
		mv.addObject("userlist", userlist);
		
		return mv;
	}
	
	@RequestMapping(value="UserInsertData.do", method=RequestMethod.GET) //유저정보 입력하기
	public ModelAndView UserInsertData(UserVO vo,HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("UserAllData");

		us.UserInsertData(vo);
		
		List<UserVO> userlist = us.UserAllData();
		
		mv.addObject("userlist", userlist);
		
		return mv;
	}

}
