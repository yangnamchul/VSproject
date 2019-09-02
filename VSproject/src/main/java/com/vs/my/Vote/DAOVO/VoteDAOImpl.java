package com.vs.my.Vote.DAOVO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VoteDAOImpl implements VoteDAO{
	private static final String namespace="mapper.vote-mapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	
}
