package com.vs.my.VSS.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vs.my.VSS.DAOVO.VSSVO;
import com.vs.my.VSS.Service.VSSService;

@Controller
public class VSSController {
	
	@Autowired
	VSSService vss;
	
	@RequestMapping(value = "makeVSS.do", method = RequestMethod.GET) //부스러기 만들기 페이지로
	public ModelAndView makeVSSpage(HttpServletRequest req, VSSVO vssvo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("makeVSS");
		
		
		return mv;
	}
	
	@RequestMapping(value = "makeVSS.do", method = RequestMethod.POST) //부스러기 만들기
	@ResponseBody
	public int makeVSS(HttpServletRequest req, VSSVO vssvo) {
		
		try {
			vss.makeVSS(vssvo);
		} catch(Exception e) {
			return 0;
		}
		return 1;
	}
}
