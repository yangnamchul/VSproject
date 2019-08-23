package com.vs.my.Board.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.vs.my.Board.DAOVO.BoardVO;
@Service
public interface BoardService {

	
public List<BoardVO> BoardAllData();
	
	public void BoardInsertData(BoardVO vo);
}
