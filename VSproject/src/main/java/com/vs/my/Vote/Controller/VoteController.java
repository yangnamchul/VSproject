package com.vs.my.Vote.Controller;


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
	
	@RequestMapping(value="Vote.do", method=RequestMethod.POST)
	@ResponseBody
	public int Vote(@RequestParam String button_id,@RequestParam int b_seq, HttpSession hs) {
		
		try {
		UserVO uv = (UserVO) hs.getAttribute("uv");
		
		String u_id = uv.getU_id();
		int v_like = 1;
		
		VoteVO vv = new VoteVO();
		
		if (button_id.equals("vsLeft")) {
			v_like = 1;
			
		} else {
			v_like = 2;
		}
		
		vv.setV_like(v_like);
		vv.setU_id(u_id);
		vv.setB_seq(b_seq);
		
		vs.Vote(vv);
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
		return 1;

	}
}
