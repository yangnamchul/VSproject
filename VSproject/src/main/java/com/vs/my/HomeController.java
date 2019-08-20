package com.vs.my;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vs.my.UserDAOVO.UserDAO;
import com.vs.my.UserDAOVO.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	UserDAO ud = new UserDAO();
	
	@RequestMapping(value = "/", method = RequestMethod.GET) //멸���������
	public ModelAndView Main(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Main");
		
		return mv;
	}
	
	///////////////////////////// ȸ�� ���� ///////////////////////////////////
	
	@RequestMapping(value="/SignUp", method=RequestMethod.GET) //ȸ������
	public ModelAndView SignUp(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("SingUp");
		
		return mv;
	}
	
	@RequestMapping(value="/Terms", method=RequestMethod.GET) //��� ����
	public ModelAndView Terms(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Terms");
		
		return mv;
	}
	
	@RequestMapping(value="/Login", method=RequestMethod.POST) //�α���
	public ModelAndView Login(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Login");
		
		return mv;
	}
	
	@RequestMapping(value="/FindID", method=RequestMethod.POST) //���̵�ã��
	public ModelAndView FindID(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("FindID");
		
		return mv;
	}
	
	@RequestMapping(value="/FindPW", method=RequestMethod.POST) //���ã��
	public ModelAndView FindPW(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("FindPW");
		
		return mv;
	}
	
	@RequestMapping(value="/MyPage", method=RequestMethod.GET) //����������
	public ModelAndView MyPage(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("MyPage");
		
		return mv;
	}
	
	@RequestMapping(value="/UserAllData", method=RequestMethod.GET) //���� ���� ����
	public ModelAndView UserAllData(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("UserAllData");
		
		List<UserVO> userlist = ud.UserAllData();
		
		mv.addObject("userlist", userlist);
		
		return mv;
	}
	//////////////////////////// 결Խ��� ����  /////////////////////////////////
	
	@RequestMapping(value="/Board", method=RequestMethod.GET) //�Խ��Ǻ���
	public ModelAndView Board(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Board");
		
		
		return mv;
	}
	
	@RequestMapping(value="/Category",method=RequestMethod.GET) //ī�װ� ����
	public ModelAndView Category(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Category");
		
		return mv;
	}
	
	
	@RequestMapping(value="/OneView", method=RequestMethod.GET) //�Խñ� ����
	public ModelAndView OneView(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("OneView");
		
		return mv;
	}
	
	@RequestMapping(value="/WritePost", method=RequestMethod.POST) //�Խñ� ����
	public ModelAndView WritePost(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WritePost");
		
		return mv;
	}
	
	@RequestMapping(value="/EditPost", method=RequestMethod.POST) //�Խñ� ����
	public ModelAndView EditPost(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("EditPost");
		
		return mv;
	}
	
	@RequestMapping(value="/Search", method=RequestMethod.POST) //�˻�
	public ModelAndView Search(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Search");
		
		return mv;
	}
	
}
