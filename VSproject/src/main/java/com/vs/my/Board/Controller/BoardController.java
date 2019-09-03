package com.vs.my.Board.Controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.vs.my.Board.DAOVO.BoardVO;
import com.vs.my.Board.Service.BoardService;
import com.vs.my.User.DAOVO.UserVO;
import com.vs.my.User.Service.UserService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService bs;
	@Autowired
	UserService us;
	
	//////////////////////////// 게시판 관련 ////////////////////////////////"
	
	@RequestMapping(value="Board.do", method=RequestMethod.GET) //게시판
	public ModelAndView Board2(@RequestParam int page, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();	
		mv.setViewName("Board");

		int paging=0;
		if(page>1) {
			paging=page;
		}
		else {
			paging=1;
		}
		List<BoardVO> boardlist = bs.BoardAllData(paging);
		int listcount=bs.BoardListCount();
		
		mv.addObject("ListCount", listcount);
		mv.addObject("boardlist", boardlist);
		
		
		return mv;

	}


		@RequestMapping(value="Board1.do", method=RequestMethod.GET) //ajax 미니게시판
		@ResponseBody
		public List<BoardVO> Board1(HttpServletRequest req) {
			
			int page=1;
			List<BoardVO> boardlist = bs.BoardAllData(page);

			System.out.println(boardlist);

		
			System.out.println( boardlist.get(0).getC_seq());
			return boardlist;
			
			
		}
	
	@RequestMapping(value="Category.do",method=RequestMethod.GET) // 카테고리
	public ModelAndView Category(HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Category");
		
		return mv;
	}
	
	
	@RequestMapping(value="Content.do", method=RequestMethod.GET) //글 하나 보기
	public ModelAndView Content(HttpServletRequest request, BoardVO bv) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Content");
		
		int b_seq = Integer.parseInt(request.getParameter("b_seq"));
		
		bv.setB_seq(b_seq);
		
		BoardVO bv2 = bs.Content(bv);
		
		UserVO uv = new UserVO(); 
				
		uv.setU_id(bv2.getU_id());
		
		UserVO uv2 = us.MyPage(uv);
		
		String u_id = uv2.getU_id();
		
		
		mv.addObject("vo",bv2);
		mv.addObject("u_id", u_id);
		
		return mv;
	}
	
	@RequestMapping(value="BoardWriteData.do", method=RequestMethod.POST) //글 작성 화면
	public ModelAndView BoardWriteData(BoardVO bv, HttpServletRequest req, HttpSession se){
		ModelAndView mv = new ModelAndView();
		
		
        UserVO uv= (UserVO) se.getAttribute("uv");
        String st = uv.getU_id();
		bv.setU_id(st);
		System.out.println(st+"==> user_seq1");
		mv.setViewName("WritePost");
		return mv;
	}
	@RequestMapping(value="BoardInsertData.do", method=RequestMethod.POST) //글 작성 후 등록(Insert)
	public ModelAndView BoardInsertData(BoardVO bv, HttpServletRequest req, HttpSession se) throws UnsupportedEncodingException {
		ModelAndView mv = new ModelAndView();
		
		UserVO uv= (UserVO) se.getAttribute("uv");
        String st = uv.getU_id();
		int c_seq=1;
		bv.setU_id(st);
		bv.setC_seq(c_seq);
		String aa = "aaa";
		System.out.println(st+"==> user_seq2");
		
		bs.BoardInsertData(bv);
		
		mv.setViewName("Board");
		return mv;
	}
	
	@RequestMapping(value="BoardInsertFile.do", method=RequestMethod.POST) //이미지 저장 메소드
	@ResponseBody
	public void BoardInsertFile(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {

		bs.BoardFileSave(file, request, response);
		
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
