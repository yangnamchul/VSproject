package com.vs.my.User.Controller;

import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vs.my.Board.Service.BoardService;
import com.vs.my.Reply.Service.ReplyService;
import com.vs.my.User.DAOVO.UserVO;
import com.vs.my.User.Service.UserService;
import com.vs.my.Vote.Service.VoteService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UserController {
	
	private final static Logger logger = Logger.getGlobal();
	
	@Autowired
	UserService us;
	
	@Autowired
	BoardService bs;
	
	@Autowired
	VoteService vs;
	
	@Autowired
	ReplyService rs;
	
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
	
	@RequestMapping(value="ip.do", method=RequestMethod.GET) //ip
	private String getIp(HttpServletRequest request) {
		 
        String ip = request.getHeader("X-Forwarded-For");
 
        logger.info(">>>> X-FORWARDED-FOR : " + ip);
 
        if (ip == null) {
            ip = request.getHeader("Proxy-Client-IP");
            logger.info(">>>> Proxy-Client-IP : " + ip);
        }
        if (ip == null) {
            ip = request.getHeader("WL-Proxy-Client-IP"); // 웹로직
            logger.info(">>>> WL-Proxy-Client-IP : " + ip);
        }
        if (ip == null) {
            ip = request.getHeader("HTTP_CLIENT_IP");
            logger.info(">>>> HTTP_CLIENT_IP : " + ip);
        }
        if (ip == null) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
            logger.info(">>>> HTTP_X_FORWARDED_FOR : " + ip);
        }
        if (ip == null) {
            ip = request.getRemoteAddr();
        }
        
        logger.info(">>>> Result : IP Address : "+ip);
        
        System.out.println(ip);
 
        return ip;
 
    }

	
	
	@RequestMapping(value="SignUp.do", method=RequestMethod.GET) //회원가입
	public ModelAndView SignUp(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("SignUp");
		
		return mv;
	}
	
	@RequestMapping(value="idCheck.do", method=RequestMethod.POST) //회원가입
	@ResponseBody
	public int idCheck(HttpServletRequest request, UserVO uv) {
		
		String u_id = request.getParameter("u_id");
		uv.setU_id(u_id);
		
		UserVO uv2 = us.idCheck(uv);
		
		try {
			uv2.getU_id();
		} catch (Exception e) {
			return 1;
		}
		return 0;
	}
	
	@RequestMapping(value="nickCheck.do", method=RequestMethod.POST) //회원가입 별명
	@ResponseBody
	public int nickCheck(HttpServletRequest request, UserVO uv) {
		
		String u_name = request.getParameter("u_name");
		uv.setU_name(u_name);
		
		UserVO uv2 = us.nickCheck(uv);
		
		try {
			uv2.getU_name();			
		} catch (Exception e) {
			return 1;
		}
		return 0;
	}
	
	@RequestMapping(value="Login.do", method=RequestMethod.GET) //로그인 페이지 이동
	public ModelAndView Login(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Login");
		
		return mv;
	}
	
	@RequestMapping(value="LoginAction.do", method=RequestMethod.POST) //로그인
	@ResponseBody
	public int LoginAction(HttpServletRequest request, UserVO uv, HttpSession hs) {
		int data = 0;
		
		data = us.LoginAction(uv, hs);
		
		return data;
	}
	
	@RequestMapping(value="LogOut.do", method=RequestMethod.POST) //로그아웃
	@ResponseBody
	public int LogOut(HttpServletRequest request, UserVO uv, HttpSession hs) {
		
		try {
		hs.removeAttribute("uv");
		} catch(Exception e) {
			return 0;
		}
		return 1;
	}
	
	@RequestMapping(value="FindID.do", method=RequestMethod.GET) //아이디, 비번 찾기 페이지 이동
	public ModelAndView FindID() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("FindID");
		
		return mv;
	}
	
	@RequestMapping(value="FindID.do", method=RequestMethod.POST)// 아이디 찾기
	@ResponseBody
	public String FindIDAction(UserVO uv) {
		UserVO vo = us.FindID(uv);
		try {
			vo.getU_id();
		} catch (Exception e) {
			return "no-data";
		}
		return vo.getU_id();
	}
	@RequestMapping(value="FindPW.do", method=RequestMethod.GET) //비밀번호 재설정페이지로 이동
	public ModelAndView FindPW(HttpSession hs) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("FindPW");
		
		return mv;
	}
	
	@RequestMapping(value="FindPW.do", method=RequestMethod.POST) //비밀번호 찾기
	@ResponseBody
	public int FindPWAction(HttpSession hs, UserVO uv) {
		
		return us.FindPW(uv,hs);
	}
	
	@RequestMapping(value="ChangePW.do", method=RequestMethod.POST) //비밀번호 변경
	@ResponseBody
	public int ChangePWAction(HttpSession hs, UserVO uv) {
		
		uv.setU_id((String)hs.getAttribute("changPW"));
		
		return us.ChangePW(uv,hs);
	}
	
	@RequestMapping(value="ChangeNick.do", method=RequestMethod.POST) //닉네임 변경
	@ResponseBody
	public int ChangeNickAction(HttpSession hs, UserVO uv) {
		
		uv.setU_name((String)hs.getAttribute("changNick"));
		
		return us.ChangeNick(uv,hs);
	}
	
	@RequestMapping(value="MyPage.do", method=RequestMethod.GET) //마이페이지 내정보
	public ModelAndView MyPage(HttpSession hs, UserVO uv) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("MyPage");
		
		mv.addObject("uv",us.MyPage(uv));
		return mv;
	}
	
	@RequestMapping(value="History.do", method=RequestMethod.GET) //히스토리
	public ModelAndView History(HttpSession hs, UserVO uv) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("History");
		
		UserVO uv2 = (UserVO) hs.getAttribute("uv");
		String u_id = uv2.getU_id();
		
		uv.setU_id(u_id);
		
		mv.addObject("rvlist", rs.UserReply(u_id));
		mv.addObject("vvlist", vs.UserVote(u_id));		
		mv.addObject("bvlist", bs.UserBoard(u_id));
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
	
	@RequestMapping(value="UserInsertData.do", method=RequestMethod.POST) //유저정보 입력하기
	@ResponseBody
	public int UserInsertData(UserVO vo) {
		try {
			vo.getU_id();
			us.UserInsertData(vo);
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

}
