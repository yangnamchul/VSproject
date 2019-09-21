package com.vs.my.User.Controller;

import java.util.List;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vs.my.Board.DAOVO.BoardVO;
import com.vs.my.Board.Service.BoardService;
import com.vs.my.Like.DAOVO.LikeVO;
import com.vs.my.Like.Service.LikeService;
import com.vs.my.Reply.DAOVO.ReplyVO;
import com.vs.my.Reply.Service.ReplyService;
import com.vs.my.User.DAOVO.UserVO;
import com.vs.my.User.Service.UserService;
import com.vs.my.VSS.DAOVO.VSSVO;
import com.vs.my.VSS.Service.VSSService;
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
	LikeService ls;
	
	@Autowired
	ReplyService rs;
	
	@Autowired
	VSSService vss;
	
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
	
	@RequestMapping(value="nickCheck.do", method=RequestMethod.POST) //회원가입 별
	@ResponseBody
	public int nickCheck(HttpServletRequest request, UserVO uv) {
		
		String u_name = request.getParameter("u_name");
		uv.setU_name(u_name);
		
		UserVO uv2 = us.nickCheck(uv);
		
		try {
			uv2.getU_name();
			System.out.println(uv2.getU_name());
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
	
	@RequestMapping(value="ChangeNick.do", method=RequestMethod.POST)// 아이디 찾기
	@ResponseBody
	public int ChangeNick(HttpServletRequest request, HttpSession hs) {
		
		
		UserVO uv = (UserVO) hs.getAttribute("uv");
		String u_id = uv.getU_id();
		String u_name = request.getParameter("u_name");
		
		UserVO uv1 = new UserVO();
		uv1.setU_id(u_id);
		uv1.setU_name(u_name);
		
		try {
			us.ChangeNick(uv1);
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}
	@RequestMapping(value="FindPW.do", method=RequestMethod.GET) //비밀번호 재설정페이지로 이동
	public ModelAndView FindPW(HttpSession hs) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("FindPW");
		
		return mv;
	}
	
	@RequestMapping(value="FindPW.do", method=RequestMethod.POST) //비밀번호 찾기
	@ResponseBody
	public String FindPWAction(HttpSession hs, UserVO uv) {
		String u_pw = null;
		String password = "";
		
		try {
			u_pw = us.FindPW(uv,hs).getU_pw();
			int len = u_pw.length();
			String[] arr = u_pw.split("");
			for (int i = 0; i < arr.length; i++) {
				if (i%2 == 0) {
					arr[i] = "*";
				}
				password += arr[i];
			}
		} catch(Exception e) {
			return "no";
		}
		
		return password;
	}
	
	@RequestMapping(value="ChangePW.do", method=RequestMethod.POST) //비밀번호 찾기
	@ResponseBody
	public int ChangePWAction(HttpServletRequest request,HttpSession hs) {
		
		UserVO uv = (UserVO) hs.getAttribute("uv");
		String u_id = uv.getU_id();
		String u_pw = request.getParameter("u_pw");
		
		UserVO uv1 = new UserVO();
		uv1.setU_id(u_id);
		uv1.setU_pw(u_pw);
		try {
			us.ChangePW(uv1);
			return 1;
		} catch(Exception e) {
			return 0;
		}
	}
	
	@RequestMapping(value="MyPage.do", method=RequestMethod.GET) //마이페이지
	public ModelAndView MyPage(HttpSession hs, UserVO uv) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("MyPage");
		String u_id = null;
		try {
			UserVO uv2 = (UserVO) hs.getAttribute("uv");
			u_id = uv2.getU_id();
		} catch (Exception e) {
			mv.setViewName("Main");
			return mv;
		}
		uv.setU_id(u_id);
		
		BoardVO bv = new BoardVO();
		bv.setU_id(u_id);
		
		mv.addObject("rvlist", rs.UserReply(u_id));
		mv.addObject("vvlist", vs.UserVote(u_id));
		mv.addObject("bvlist", bs.UserBoard(bv));
		mv.addObject("uv",us.MyPage(uv));
		return mv;
	}
	
	@RequestMapping(value="History.do", method=RequestMethod.GET) //히스토리
	public ModelAndView History(HttpSession hs, UserVO uv, HttpServletRequest request, @RequestParam int pg) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("History");
		String u_id = null;
		
		int page=0;
		if(pg>1) {
			page=pg;
		}
		else {
			page=1;
		}	
		System.out.println(page + "        page");
		
		u_id = request.getParameter("u_id");
		BoardVO bv = new BoardVO();
		bv.setU_id(u_id);
		bv.setPage(page);
		List<BoardVO> boardlist=bs.UserBoard(bv);
		
		for(int i=0; i<boardlist.size(); i++){
//			추천 수
			LikeVO lv = new LikeVO();
			LikeVO lv1 = new LikeVO();
			lv.setB_seq(boardlist.get(i).getB_seq());
			int like_cnt = 0;
			like_cnt = ls.LikeCnt(lv);
			lv1.setL_like(like_cnt);
			boardlist.get(i).setLv(lv1);
//			댓글 수
			ReplyVO rv = new ReplyVO();
			rv.setB_seq(boardlist.get(i).getB_seq());
			int reply_cnt = 0;
			reply_cnt = rs.ReplyCnt(rv.getB_seq());
			boardlist.get(i).setReplyCnt(reply_cnt);
			
			String vssName = null;
			VSSVO vssvo = new VSSVO();
			vssvo = vss.getOneVSS(boardlist.get(i).getVss_seq());
			vssName = vssvo.getVSS_name();
			boardlist.get(i).setVssName(vssName);
			
//			유저 이름
			UserVO uv1 = new UserVO();
			UserVO uv2 = new UserVO();
			uv2.setU_id(boardlist.get(i).getU_id());
			uv1 = us.MyPage(uv2);
			boardlist.get(i).setU_name(uv1.getU_name());
		}
			
		int listcount=bs.UserBoardList(u_id);
		
		mv.addObject("u_id1",u_id);
		mv.addObject("bvlist", boardlist);
		mv.addObject("BoardListCount", listcount);  //게시물수
		mv.addObject("rvlist", rs.UserReply(u_id));
		mv.addObject("vvlist", vs.UserVote(u_id));
		
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
