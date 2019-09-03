package com.vs.my.Reply.DAOVO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
private static final String namespace="mapper.reply-mapper";
	
	@Autowired  //DI로 객체를 주입하여 ~~~ 생각나야함~
	private SqlSession sqlSession;
	@Override
	public List<ReplyVO> ReplyAllData(int b_seq) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".ReplyAllData",b_seq);
	}
	
	@Override
	public void ReplyInsertData(ReplyVO rv) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".ReplyInsertData", rv);
	}

	


}
