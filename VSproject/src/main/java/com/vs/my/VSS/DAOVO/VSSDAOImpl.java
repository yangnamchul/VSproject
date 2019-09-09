package com.vs.my.VSS.DAOVO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VSSDAOImpl implements VSSDAO {
	
	private static final String namespace="mapper.VSS-mapper";
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int makeVSS(VSSVO vssvo) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".makeVSS",vssvo);
	}

	@Override
	public List<VSSVO> getAllVSS() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".getAllVSS");
	}

	@Override
	public VSSVO getOneVSS(int vss_seq) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getOneVSS",vss_seq);
	}

	@Override
	public int maxVSS() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".maxVSS");
	}

	@Override
	public List<VSSVO> newVSS() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".newVSS");
	}

}
