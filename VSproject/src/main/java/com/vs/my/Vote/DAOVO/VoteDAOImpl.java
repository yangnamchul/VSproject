package com.vs.my.Vote.DAOVO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class VoteDAOImpl implements VoteDAO{
	private static final String namespace="mapper.vote-mapper";
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<VoteVO> allVote(VoteVO vv) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".allVote", vv);
	}

	@Override
	public void FirstVote(VoteVO vv) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".FirstVote", vv);
	}

	@Override
	public void Vote(VoteVO vv) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".Vote", vv);
	}

	@Override
	public int LeftCnt(VoteVO vv) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".LeftCnt",vv);
	}

	@Override
	public int RightCnt(VoteVO vv) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".RightCnt",vv);
	}

	@Override
	public List<VoteVO> UserVote(String u_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".UserVote", u_id);
	}
	
	
}
