package com.vs.my.VSS.Controller;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
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
	public ModelAndView makeVSSpage(VSSVO vssvo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("makeVSS");
		
		
		return mv;
	}
	
	@RequestMapping(value = "makeVSS.do", method = RequestMethod.POST) //부스러기 만들기
	@ResponseBody
	public int makeVSS(VSSVO vssvo) {
		
		try {
			vss.makeVSS(vssvo);
		} catch(Exception e) {
			return 0;
		}
		return 1;
	}
	
	@RequestMapping(value = "getAllVSS.do", method = RequestMethod.GET) //부스러기 만들기
	@ResponseBody
	public JSONArray getAllVSS() {
		JSONObject json = new JSONObject() ;
		JSONObject json2 = new JSONObject() ;
		List<VSSVO> vsslist = vss.getAllVSS();
		
		JSONArray jsonarr = new JSONArray();
		
		for (int i = 0; i < vsslist.size(); i++) {
			json.put(vsslist.get(i).getVSS_name(), vsslist.get(i).getVSS_seq());
			json2.put(vsslist.get(i).getVSS_name(),vsslist.get(i).getVSS_content());
		}
		System.out.println(json);
		System.out.println(json2);
		//json.put("vsslist", vsslist);
		jsonarr.add(json);
		jsonarr.add(json2);
		
		System.out.println(jsonarr);
		//json.put("vsslist", jsonarr);
		
		return jsonarr;
	}
}
