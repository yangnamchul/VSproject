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

import oracle.net.aso.r;


@Controller
public class ReplyController {
	@Autowired
	private ReplyService rs;
	

	
	//////////////////////////// 댓글 관련 ////////////////////////////////"
	
	@RequestMapping(value="Reply.do", method=RequestMethod.GET) //ajax 댓글
	@ResponseBody
	public ReplyVO Reply( HttpServletRequest req, ReplyVO rv, HttpSession hs) {
	
	
		int b_seq=Integer.parseInt(req.getParameter("b_seq"));  //b_seq		
		
		UserVO uv= (UserVO) hs.getAttribute("uv");              //u_id
		String u_id=uv.getU_id(); 
		
		rv.setB_seq(b_seq);
		rv.setU_id(u_id);
		
        System.out.println("replycontroller");
		System.out.println("b_seq"+ b_seq);
		System.out.println("u_id"+ u_id);
		System.out.println(rv.getRe_content());
		
		int re_seq2=rs.ReplyInsertData(rv);  //먼져 u_id, b_seq 보내서 insert실행

		 System.out.println("replycontroller-insert후");
		System.out.println(re_seq2);
		
		ReplyVO rv2=rs.ReplyOneData(re_seq2);
		/*List<ReplyVO> replylist=rs.ReplyAllData(b_seq)*/;
		/*ReplyVO rv2=rs.ReplyInsertData(rv);*/

		
		return rv2;

	}
	
	@RequestMapping(value="Reply1.do", method=RequestMethod.GET) //ajax 댓글더보기
	@ResponseBody
	public List<ReplyVO> Reply1( HttpServletRequest req, ReplyVO rv, HttpSession hs) {
	
	
		int b_seq=Integer.parseInt(req.getParameter("b_seq"));  //b_seq		
		
        System.out.println("replycontroller1");

		List<ReplyVO> replylist=rs.ReplyAllData(b_seq);


		
		return replylist;
	}
	
	@RequestMapping(value="delReply.do", method=RequestMethod.POST) //ajax 댓글 삭제
	@ResponseBody
	public int delReply(HttpServletRequest request, HttpSession hs) {
		
		try {
			UserVO uv = (UserVO) hs.getAttribute("uv");
			String u_id = uv.getU_id();
			
			int re_seq = Integer.parseInt(request.getParameter("re_seq"));
			
			ReplyVO rv = rs.ReplyOneData(re_seq);
			
			if (rv.getU_id().equals(u_id)) {
				rs.delReply(re_seq);
				return 2;
			} else {
				return 0;
			}
		} catch(Exception e) {
			return 1;
		}
	
		
	}
}
