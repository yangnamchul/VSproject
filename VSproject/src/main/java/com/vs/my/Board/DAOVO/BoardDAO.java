package com.vs.my.Board.DAOVO;

import java.util.List;



public interface BoardDAO {


	public List<BoardVO> BoardAllData(int page);
	public List<BoardVO> BoardAllData();
	public void BoardInsertData(BoardVO vo);
	
	public BoardVO BoardOneView(BoardVO vo);
	
	public int BoardListCount();
}
