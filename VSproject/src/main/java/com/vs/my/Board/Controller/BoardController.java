package com.vs.my.Board.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.vs.my.Board.DAOVO.BoardVO;
import com.vs.my.Board.Service.BoardService;
import com.vs.my.User.DAOVO.UserVO;

@Controller
public class BoardController {
	
	@Autowired
	BoardService bs;
	
	//////////////////////////// 게시판 관련 ////////////////////////////////"
	
	@RequestMapping(value="Board.do", method=RequestMethod.GET) //게시판
	public ModelAndView Board(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Board");
		
		List<BoardVO> boardlist = bs.BoardAllData();
		
		mv.addObject("boardlist", boardlist);
		
		return mv;
		
		
	}
	
	@RequestMapping(value="Category.do",method=RequestMethod.GET) // 카테고리
	public ModelAndView Category(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Category");
		
		return mv;
	}
	
	
	@RequestMapping(value="OneView.do", method=RequestMethod.GET) //글 하나 보기
	public ModelAndView OneView(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("OneView");
		
		return mv;
	}
	
	@RequestMapping(value="BoardWriteData.do", method=RequestMethod.POST) //글 작성 화면
	public ModelAndView BoardWriteData(BoardVO vo, HttpServletRequest req, HttpSession se) {
		ModelAndView mv = new ModelAndView();
		
		
        String st= (String) se.getAttribute("u_id");
		vo.setU_id(st);
		System.out.println(st+"==> user_seq1");
		mv.setViewName("WritePost");
		return mv;
	}
	@RequestMapping(value="BoardInsertData.do", method=RequestMethod.POST) //글 작성 후 등록(Insert)
	public ModelAndView BoardInsertData(BoardVO vo, HttpServletRequest req, HttpSession se) {
		ModelAndView mv = new ModelAndView();
		
		String st= (String) se.getAttribute("u_id");
		int c_seq=1;
		vo.setU_id(st);
		vo.setC_seq(c_seq);
		System.out.println(st+"==> user_seq2");
		
		bs.BoardInsertData(vo);
		
		mv.setViewName("Board");
		return mv;
	}
	
	@RequestMapping(value="EditPost.do", method=RequestMethod.POST) //글 수정 화면
	public ModelAndView EditPost(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("EditPost");
		
		return mv;
	}
	
	@RequestMapping(value="Search.do", method=RequestMethod.POST) //검색 결과
	public ModelAndView Search(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Search");
		
		return mv;
	}
	
}
