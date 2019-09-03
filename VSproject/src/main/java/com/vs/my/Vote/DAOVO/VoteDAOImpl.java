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
	
	
}
