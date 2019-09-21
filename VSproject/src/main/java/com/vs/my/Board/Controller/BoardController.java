package com.vs.my.Board.Controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
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
import com.vs.my.Like.DAOVO.LikeVO;
import com.vs.my.Like.Service.LikeService;
import com.vs.my.Reply.DAOVO.ReplyVO;
import com.vs.my.Reply.Service.ReplyService;
import com.vs.my.Tag.DAOVO.TagVO;
import com.vs.my.Tag.Service.TagService;
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
	@Autowired
	TagService ts;
	@Autowired
	LikeService ls;
	
	//////////////////////////// 게시판 관련 ////////////////////////////////"
	
	@RequestMapping(value="Board.do", method=RequestMethod.GET) //게시판
	public ModelAndView Board2(@RequestParam int pg, HttpServletRequest req) {
		ModelAndView mv = new ModelAndView();	
		mv.setViewName("Board");
		
		
		int page=0;
		if(pg>1) {
			page=pg;
		}
		else {
			page=1;
		}
		List<BoardVO> boardlist = bs.BoardAllData(page);
		int listcount=bs.BoardListCount();
		
		for (int i = 0; i < boardlist.size(); i++) {
//			추천 수
			LikeVO lv = new LikeVO();
			LikeVO lv1 = new LikeVO();
			lv.setB_seq(boardlist.get(i).getB_seq());
			int like_cnt = 0;
			like_cnt = ls.LikeCnt(lv);
			lv1.setL_like(like_cnt);
			boardlist.get(i).setLv(lv1);
//			댓글 수
			ReplyVO rv = new ReplyVO();
			rv.setB_seq(boardlist.get(i).getB_seq());
			int reply_cnt = 0;
			reply_cnt = rs.ReplyCnt(rv.getB_seq());
			boardlist.get(i).setReplyCnt(reply_cnt);
			
//			부스러기 보이기
			String vssName = null;
			VSSVO vssvo = new VSSVO();
			vssvo = vss.getOneVSS(boardlist.get(i).getVss_seq());
			vssName = vssvo.getVSS_name();
			boardlist.get(i).setVssName(vssName);
			
//			유저 이름
			UserVO uv = new UserVO();
			UserVO uv1 = new UserVO();
			uv1.setU_id(boardlist.get(i).getU_id());
			uv = us.MyPage(uv1);
			boardlist.get(i).setU_name(uv.getU_name());
		}
		
		mv.addObject("ListCount", listcount);
		mv.addObject("boardlist", boardlist);
		
		
		return mv;

	}


		@RequestMapping(value="Board1.do", method=RequestMethod.GET) //ajax 미니게시판
		@ResponseBody
		public List<BoardVO> Board1(HttpServletRequest req) {
			
			int page=1;
			List<BoardVO> boardlist = bs.BoardAllData(page);
			
			for (int i = 0; i < boardlist.size(); i++) {
				int vss_seq = boardlist.get(i).getVss_seq();
				String vss_name = vss.getOneVSS(vss_seq).getVSS_name();
				boardlist.get(i).setVssName(vss_name);
			}
		
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
		
//		조회수
		bs.BoardCnt(b_seq);
		
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
		List<VoteVO> vl = vs.allVote(vv);
		int vcount = vl.size();
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
		
//		추천
		LikeVO lv = new LikeVO();
		lv.setB_seq(b_seq);
		
		int LikeCnt = ls.LikeCnt(lv);
		mv.addObject("LikeCnt",LikeCnt);
		int UnlikeCnt = ls.UnLikeCnt(lv);
		mv.addObject("UnlikeCnt",UnlikeCnt);
		
//		부스러기 이름
		String vssName = null;
		VSSVO vssvo = new VSSVO();
		vssvo = vss.getOneVSS(bv2.getVss_seq());
		vssName = vssvo.getVSS_name();
		bv2.setVssName(vssName);
		
		
		mv.addObject("ReplyCnt",replylist.size()) ;	
		mv.addObject("ReplyList",replylist);
		mv.addObject("data", data);
		mv.addObject("vo",bv2);
		mv.addObject("u_id", u_id);
		
		return mv;
	}
	
	@RequestMapping(value="BoardWriteData.do", method=RequestMethod.POST) //글 작성 화면
	public ModelAndView BoardWriteData(BoardVO bv, HttpServletRequest request, HttpSession se){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WritePost");
//		아이디 가져오기
        UserVO uv= (UserVO) se.getAttribute("uv");
        String st = uv.getU_id();
		bv.setU_id(st);
		
//		부스러기 가져오기
		int vss_seq = Integer.parseInt(request.getParameter("vss_seq"));
		VSSVO vssvo = vss.getOneVSS(vss_seq);
		mv.addObject("vss_seq", vssvo.getVSS_seq());
		mv.addObject("vssName", vssvo.getVSS_name());
		return mv;
	}
	@RequestMapping(value="BoardInsertData.do", method=RequestMethod.POST) //글 작성 후 등록(Insert)
	@ResponseBody
	public int BoardInsertData(BoardVO bv, HttpServletRequest request, HttpSession se) throws UnsupportedEncodingException {
		
		try {
		UserVO uv= (UserVO) se.getAttribute("uv");
        String st = uv.getU_id();
        TagVO tv = new TagVO();
        
		int vss_seq=Integer.parseInt(request.getParameter("vss_seq"));
		bv.setU_id(st);
		bv.setVss_seq(vss_seq);
		String[] vsCheck = request.getParameterValues("vsCheck");
		String vsleft = request.getParameter("vsleft");
		String vsright = request.getParameter("vsright");
		
		List<VSSVO> vsslist = vss.getAllVSS();
		
//		vs게시물 체크
		if (vsCheck != null) {
			bv.setB_left(vsleft);
			bv.setB_right(vsright);
//			게시물 생성
			bs.BoardInsertData(bv);
			
//			게시물에 포함된 부스러기 찾고 tag 생성
			for (int i = 0; i < 4000; i++) {
				
				try {
					int vss_seq1 = Integer.parseInt(request.getParameter("vss_seq_"+i));
					tv.setVss_seq(vss_seq1);
					ts.makeTag(tv);
				} catch(Exception e) {
					
				}
			}
//			투표 생성
			VoteVO vv = new VoteVO();
			vv.setU_id(st);
			vs.FirstVote(vv);
			
		} else {
			vsleft = null;
			vsright = null;
			bv.setB_left(vsleft);
			bv.setB_right(vsright);
			bs.BoardInsertData(bv);
			
			for (int i = 0; i < 4000; i++) {
				try {
					int vss_seq1 = Integer.parseInt(request.getParameter("vss_seq_"+i));
					System.out.println(vss_seq1 + "asdfasdf");
					tv.setVss_seq(vss_seq1);
					ts.makeTag(tv);
				} catch(Exception e) {
					
				}
			}
			tv.setVss_seq(vss_seq);
			ts.makeTag(tv);
		}
		} catch(Exception e) {
			
			return 0;
		}
		
		
		
		return bs.maxBoard();
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
	
//	@RequestMapping(value="Search.do", method=RequestMethod.POST) //검색 결과
//	public ModelAndView Search(HttpServletRequest req) {
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("Search");
//		
//		return mv;
//	}
	
	@RequestMapping(value="VSSBoard.do", method=RequestMethod.GET) //검색 결과
	public ModelAndView VSSBoard(HttpServletRequest request ,@RequestParam int pg) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("VSSBoard");
		
		String vss_seq1 = request.getParameter("vss_seq");
		int vss_seq = Integer.parseInt(vss_seq1);
		System.out.println(vss_seq + "vss_seq");
//		List<BoardVO> bvlist = new ArrayList<BoardVO>();
		String vssOne = vss.getOneVSS(vss_seq).getVSS_name();
		String vssContent = vss.getOneVSS(vss_seq).getVSS_content();
		int page=0;
		if(pg>1) {
			page=pg;
		}
		else {
			page=1;
		}
		
		BoardVO bv3 = new BoardVO();
		
		bv3.setPage(page);
		
		bv3.setVss_seq(vss_seq);
		
		List<BoardVO> boardlist = bs.VSSBoardAllData(bv3);
		int listcount=bs.VSSBoardListCount(bv3);		
		
		TagVO tv = new TagVO();
		tv.setVss_seq(vss_seq);
		tv.setPage(page);		
		List<TagVO> tvlist = ts.getVSSBoard(tv);
		
		for (int i = 0; i < 4000 ; i++) {
			try {
			int b_seq = tvlist.get(i).getB_seq();
			System.out.println(b_seq + "해당 vss b_seq찍어보기");
			BoardVO bv = new BoardVO();
			bv.setB_seq(b_seq);
			
			
//			BoardVO bv1 = bs.Content(bv);			
//			boardlist.set(i, bv1);			
			
//			추천 수
			LikeVO lv = new LikeVO();
			LikeVO lv1 = new LikeVO();
			lv.setB_seq(b_seq);
			int like_cnt = 0;
			like_cnt = ls.LikeCnt(lv);
			lv1.setL_like(like_cnt);
			boardlist.get(i).setLv(lv1);
//			댓글 수
			boardlist.get(i).setReplyCnt(rs.ReplyCnt(b_seq));
			
//			부스러기 보이기
			String vssName = null;
			VSSVO vssvo = new VSSVO();
			vssvo = vss.getOneVSS(boardlist.get(i).getVss_seq());
			vssName = vssvo.getVSS_name();
			boardlist.get(i).setVssName(vssName);
			
//			유저 이름
			UserVO uv = new UserVO();
			UserVO uv1 = new UserVO();
			uv1.setU_id(boardlist.get(i).getU_id());
			uv = us.MyPage(uv1);
			boardlist.get(i).setU_name(uv.getU_name());
			
//			boardlist.add(e)
			
			} catch(Exception e) {
				
			}
		}
		
		mv.addObject("vssContent", vssContent);
		mv.addObject("ListCount", listcount); //vss 개수
		mv.addObject("bvlist", boardlist);
		mv.addObject("vssOne",vssOne);
		mv.addObject("vss_seq",vss_seq);
		return mv;
	}
	
	@RequestMapping(value="delCon.do", method=RequestMethod.POST) //글 삭제
	@ResponseBody
	public int delCon(HttpServletRequest request) {
		
		int b_seq = Integer.parseInt(request.getParameter("b_seq"));
		
		try {
			bs.delCon(b_seq);
			return 1;
		} catch(Exception e) {
			return 0;
		}
	}
	
}
