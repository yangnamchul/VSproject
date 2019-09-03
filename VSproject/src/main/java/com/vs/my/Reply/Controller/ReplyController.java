package com.vs.my.Reply.Controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vs.my.Reply.DAOVO.ReplyVO;
import com.vs.my.Reply.Service.ReplyService;
import com.vs.my.User.DAOVO.UserVO;


@Controller
public class ReplyController {
	@Autowired
	private ReplyService rs;
	

	
	//////////////////////////// 댓글 관련 ////////////////////////////////"
	
	@RequestMapping(value="Reply.do", method=RequestMethod.GET) //ajax 댓글
	@ResponseBody
	public List<ReplyVO> Reply( HttpServletRequest req, ReplyVO rv, HttpSession hs) {
	
	
		int b_seq=Integer.parseInt(req.getParameter("b_seq"));  //b_seq		
		
		UserVO uv= (UserVO) hs.getAttribute("uv");              //u_id
		String u_id=uv.getU_id(); 
		
		rv.setB_seq(b_seq);
		rv.setU_id(u_id);
		
System.out.println("replycontroller");
		System.out.println(b_seq);
		System.out.println(u_id);
		System.out.println(rv.getRe_content());
		
		rs.ReplyInsertData(rv);
	/*	private int b_seq;
		private String u_id;
		private String re_content;
		private Date re_date;
		private int re_parent;
		private int re_boolean;*/
		
		
	
		List<ReplyVO> replylist=rs.ReplyInsertData(rv);
		

		
		return replylist;

	}
}
