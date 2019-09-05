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
import com.vs.my.Reply.DAOVO.ReplyVO;
import com.vs.my.Reply.Service.ReplyService;
import com.vs.my.User.DAOVO.UserVO;
import com.vs.my.User.Service.UserService;
import com.vs.my.VSS.DAOVO.VSSVO;
import com.vs.my.VSS.Service.VSSService;
import com.vs.my.Vote.DAOVO.VoteVO;
import com.vs.my.Vote.Service.VoteService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService bs;
	@Autowired
	UserService us;
	@Autowired
	VoteService vs;
	@Autowired
	ReplyService rs;
	@Autowired
	VSSService vss;
	
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
		
//		content 내용 가져오기
		bv.setB_seq(b_seq);
		BoardVO bv2 = bs.Content(bv);
		
		
//		u_id 값 가져오기
		UserVO uv = new UserVO(); 
		uv.setU_id(bv2.getU_id());
		UserVO uv2 = us.MyPage(uv);
		String u_id = uv2.getU_id();
		
		
//		투표값 가져오기
		int data = 0;
		VoteVO vv = new VoteVO();
		vv.setB_seq(b_seq);
		List<VoteVO> lv = vs.allVote(vv);
		int vcount = lv.size();
		if (vcount < 1) { //vs게시물아님
			data = 0;
		} else { //vs게시물
			data = 1;
			mv.addObject("totalVote",vcount-1);
			int LeftCnt = vs.LeftCnt(vv);
			mv.addObject("LeftCnt", LeftCnt);
			int RightCnt = vs.RightCnt(vv);
			mv.addObject("RightCnt", RightCnt);
		}
		
//		댓글
		List<ReplyVO> replylist=rs.ReplyAllData(b_seq);
		
		
		mv.addObject("ReplyList",replylist);
		mv.addObject("data", data);
		mv.addObject("vo",bv2);
		mv.addObject("u_id", u_id);
		
		return mv;
	}
	
	@RequestMapping(value="BoardWriteData.do", method=RequestMethod.POST) //글 작성 화면
	public ModelAndView BoardWriteData(BoardVO bv, HttpServletRequest req, HttpSession se){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WritePost");
//		아이디 가져오기
        UserVO uv= (UserVO) se.getAttribute("uv");
        String st = uv.getU_id();
		bv.setU_id(st);
		
//		부스러기 전부 가져오기
		List<VSSVO> vsslist = vss.getAllVSS();
		mv.addObject("vsslist", vsslist);
		mv.addObject("vssCnt", vsslist.size());
		
		return mv;
	}
	@RequestMapping(value="BoardInsertData.do", method=RequestMethod.POST) //글 작성 후 등록(Insert)
	public ModelAndView BoardInsertData(BoardVO bv, HttpServletRequest request, HttpSession se) throws UnsupportedEncodingException {
		ModelAndView mv = new ModelAndView();
		
		UserVO uv= (UserVO) se.getAttribute("uv");
        String st = uv.getU_id();
		int vss_seq=0;
		bv.setU_id(st);
		bv.setVss_seq(vss_seq);
		String[] vsCheck = request.getParameterValues("vsCheck");
		String vsleft = request.getParameter("vsleft");
		String vsright = request.getParameter("vsright");
		
		
		
		
		if (vsCheck != null) {
			bv.setB_left(vsleft);
			bv.setB_right(vsright);
			bs.BoardInsertData(bv);
			
			
			VoteVO vv = new VoteVO();
			vv.setU_id(st);
			vs.FirstVote(vv);
		} else {
			vsleft = null;
			vsright = null;
			bv.setB_left(vsleft);
			bv.setB_right(vsright);
			bs.BoardInsertData(bv);
		}
		
		
		
		mv.setViewName("Main");
		
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
	
	@RequestMapping(value="VSSBoard.do", method=RequestMethod.GET) //검색 결과
	public ModelAndView VSSBoard(@RequestParam int VSS_seq) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("VSSBoard");
		
		List<BoardVO> bvlist = bs.VSSBoard(VSS_seq);
		
		mv.addObject("bvlist", bvlist);
		
		return mv;
	}
	
}
