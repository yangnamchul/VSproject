package com.vs.my.Board.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.vs.my.User.DAOVO.UserDAO;

@Controller
public class BoardController {
	UserDAO ud = new UserDAO();
////////////////////////////게시판 관련 /////////////////////////////////
	
@RequestMapping(value="/Board.do", method=RequestMethod.GET) //게시판
public ModelAndView Board(HttpServletRequest req) {
ModelAndView mv = new ModelAndView();
mv.setViewName("Board");


return mv;
}

@RequestMapping(value="/Category.do",method=RequestMethod.GET) // 카테고리
public ModelAndView Category(HttpServletRequest req) {
ModelAndView mv = new ModelAndView();
mv.setViewName("Category");

return mv;
}


@RequestMapping(value="/OneView.do", method=RequestMethod.GET) //글 하나 보기
public ModelAndView OneView(HttpServletRequest req) {
ModelAndView mv = new ModelAndView();
mv.setViewName("OneView");

return mv;
}

@RequestMapping(value="/WritePost.do", method=RequestMethod.POST) //글 작성 화면
public ModelAndView WritePost(HttpServletRequest req) {
ModelAndView mv = new ModelAndView();
mv.setViewName("WritePost");

return mv;
}

@RequestMapping(value="/EditPost.do", method=RequestMethod.POST) //글 수정 화면
public ModelAndView EditPost(HttpServletRequest req) {
ModelAndView mv = new ModelAndView();
mv.setViewName("EditPost");

return mv;
}

@RequestMapping(value="/Search.do", method=RequestMethod.POST) //검색 결과
public ModelAndView Search(HttpServletRequest req) {
ModelAndView mv = new ModelAndView();
mv.setViewName("Search");

return mv;
}

///////////////////////////////////////////////////////////////////////
@ResponseBody
@RequestMapping("/ajax")
public String join() {
	return "안녕하세요 AJAX";
}

}
