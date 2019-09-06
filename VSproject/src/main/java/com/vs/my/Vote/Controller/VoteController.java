package com.vs.my.Vote.Controller;


import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vs.my.User.DAOVO.UserVO;
import com.vs.my.Vote.DAOVO.VoteVO;
import com.vs.my.Vote.Service.VoteService;

@Controller
public class VoteController {
	@Autowired
	VoteService vs;
	
	private final static Logger logger = Logger.getGlobal();
	
	@RequestMapping(value="Vote.do", method=RequestMethod.POST)
	@ResponseBody
	public String Vote(@RequestParam String button_id,@RequestParam int b_seq, HttpSession hs ,HttpServletRequest request) {
		
		UserVO uv=new UserVO();
		VoteVO vv = new VoteVO();
        int v_like = 1;
		
		if (button_id.equals("vsLeft")) {
			v_like = 1;
			
		} else {
			v_like = 2;   //vsRight
		}
		
		if( hs.getAttribute("uv")==null){  //비회원인지 검사(세션에 저장된 UserVO값이 없다면 비회원)			
			System.out.println("UserVO null검사");
		}else {
		   uv= (UserVO) hs.getAttribute("uv"); //세션에 저자된 UserVO값이 있다면 회원
		}
		try {

		if(uv.getU_id()==null) {
			
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
		     
		    	vv.setV_like(v_like);
				vv.setB_seq(b_seq);
				vv.setV_ip(ip);
				System.out.println("b_seq="+b_seq);
				System.out.println("v_like="+v_like);
		        if(vs.VoteConfirm2(vv)==null) {   //투표 유효성 검사(비회원)
					vs.Vote(vv);//투표 인설트

				}else{
					return "c";   //투표가 이미 되어 있는경우.
				}

			
		}
		else {
	    String u_id = uv.getU_id();
	    vv.setU_id(u_id);
		vv.setV_like(v_like);
		vv.setB_seq(b_seq);
		System.out.println(  "dsd"+ b_seq);
		
		if(vs.VoteConfirm(vv)==null) {         //투표 유효성 검사(회원)
			vs.Vote(vv);//투표 인설트
			  
		}else {
			return "c";   //투표가 이미 되어 있는경우.
		}
		
		}
		
		} catch(Exception e) {
			e.printStackTrace();
			return "a";
		}
		System.out.println("비회원투표~~~");
		return "b";      //정상적으로 투표가 되었을경우.

	}
		
}
