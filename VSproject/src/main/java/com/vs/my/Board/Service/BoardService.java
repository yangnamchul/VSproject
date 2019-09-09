package com.vs.my.Board.Service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.vs.my.Board.DAOVO.BoardVO;
@Service
public interface BoardService {
	
	public List<BoardVO> BoardAllData(int page);

	public void BoardInsertData(BoardVO vo);
	
	public void BoardFileSave(MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public BoardVO Content(BoardVO vo);
	
	public int BoardListCount();
	
	public List<BoardVO> UserBoard(String u_id);
	
	public List<BoardVO> VSSBoard(int VSS_seq);
	
	public void BoardCnt(int b_seq);
	
	public void delCon(int b_seq);
	
	public int maxBoard();
	public List<BoardVO> VSSBoardAllData(BoardVO bv);
	public int VSSBoardListCount(BoardVO bv);
}
