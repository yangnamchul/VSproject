package com.vs.my.Board.DAOVO;

import java.util.List;



public interface BoardDAO {


	public List<BoardVO> BoardAllData(int page);
	
	public void BoardInsertData(BoardVO vo);
	
	public BoardVO Content(BoardVO vo);
	
	public int BoardListCount();
	
	public List<BoardVO> UserBoard(String u_id);
	
	public List<BoardVO> VSSBoard(int vss_seq); 
	
	public void BoardCnt(int b_seq);
	
	public void delCon(int b_seq);
}
