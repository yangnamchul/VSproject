package com.vs.my.Like.Controller;

import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vs.my.Like.DAOVO.LikeVO;
import com.vs.my.Like.Service.LikeService;
import com.vs.my.User.DAOVO.UserVO;

@Controller
public class LikeController {
	
	@Autowired
	LikeService ls;
	
	private final static Logger logger = Logger.getGlobal();
	
	@RequestMapping(value = "Like.do", method = RequestMethod.POST) 
	@ResponseBody
	public int makeVSSpage(@RequestParam String button_id,@RequestParam int b_seq, HttpSession hs, HttpServletRequest request) {
		
		UserVO uv = new UserVO();
		LikeVO lv = new LikeVO();
		int l_like = 1;
		
		if (button_id.equals("btn_like")) {
			l_like = 1;
		} else {
			l_like = 2;
		}
		
		lv.setL_like(l_like);
		lv.setB_seq(b_seq);
		
		try {
			uv = (UserVO) hs.getAttribute("uv");
			lv.setU_id(uv.getU_id());
			
			if (ls.LikeConfirm(lv) == null) {
				ls.FirstLike(lv);
				return 2;
			} else {
				return 1;
			}
		} catch (Exception e) {
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
	        
	        lv.setL_ip(ip);
	        
	        
	        
	        if(ls.LikeConfirm2(lv) == null) {
	        	ls.FirstLike(lv);
	        	return 2;
	        } else {
	        	return 1;
	        }
		}
		
	}
	
}
