package com.vs.my.Board.DAOVO;

import java.util.List;



public interface BoardDAO {


	public List<BoardVO> BoardAllData();
	
	public void BoardInsertData(BoardVO vo);
	
	public BoardVO Content(BoardVO vo);
}
