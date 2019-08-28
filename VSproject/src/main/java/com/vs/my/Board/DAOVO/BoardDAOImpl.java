package com.vs.my.Board.DAOVO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class BoardDAOImpl implements BoardDAO {
	private static final String namespace="mapper.board-mapper";
	
	@Autowired  //DI로 객체를 주입하여 ~~~ 생각나야함~
	private SqlSession sqlSession;

	@Override
	public List<BoardVO> BoardAllData() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".BoardAllData");
	}

	@Override
	public void BoardInsertData(BoardVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".BoardInsertData",vo);
	}

	@Override
	public BoardVO BoardOneView(BoardVO vo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".BoardOneView",vo);
	}

}
