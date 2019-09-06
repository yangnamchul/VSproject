package com.vs.my.Tag.DAOVO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TagDAOImpl implements TagDAO{
	private static final String namespace="mapper.Tag-mapper";
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void makeTag(TagVO tv) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".makeTag",tv);
	}

	@Override
	public List<TagVO> getVSSBoard(TagVO tv) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".getVSSBoard",tv);
	}

}
