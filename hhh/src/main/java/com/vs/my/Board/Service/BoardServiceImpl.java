package com.vs.my.Board.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.my.Board.DAOVO.BoardDAO;
import com.vs.my.Board.DAOVO.BoardVO;
import com.vs.my.User.DAOVO.UserDAO;
@Service
public class BoardServiceImpl implements BoardService
{
    @Autowired
	BoardDAO bdao;
    
    @Autowired
   	UserDAO udao;
	
	@Override
	public List<BoardVO> BoardAllData() {
		// TODO Auto-generated method stub
		return bdao.BoardAllData();
	}

	@Override
	public void BoardInsertData(BoardVO vo) {

		bdao.BoardInsertData(vo);		

	}

}
