package com.vs.my.Like.DAOVO;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class LikeDAOImpl implements LikeDAO {
	
	private static final String namespace="mapper.like-mapper";
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void FirstLike(LikeVO lv) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".FirstLike",lv);
	}

	@Override
	public LikeVO LikeConfirm(LikeVO lv) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".LikeConfirm",lv);
	}

	@Override
	public LikeVO LikeConfirm2(LikeVO lv) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".LikeConfirm2",lv);
	}

	@Override
	public int LikeCnt(LikeVO lv) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".LikeCnt",lv);
	}

	@Override
	public int UnLikeCnt(LikeVO lv) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".UnlikeCnt",lv);
	}

	


}
