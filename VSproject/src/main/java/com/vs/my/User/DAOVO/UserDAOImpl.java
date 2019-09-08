package com.vs.my.User.DAOVO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO{
	private static final String namespace="mapper.user-mapper";
	
	@Autowired  //DI로 객체를 주입하여 ~~~ 생각나야함~
	private SqlSession sqlSession;

	@Override
	public List<UserVO> UserAllData() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".UserAllData");
	}
	
	@Override
	public void UserInsertData(UserVO uv) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+".UserInsertData",uv);
	}
	
	@Override
	public UserVO LoginAction(UserVO uv) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".LoginAction", uv);
	}

	@Override
	public UserVO FindID(UserVO uv) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".FindID",uv);
	}

	@Override
	public UserVO FindPW(UserVO uv) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".FindPW",uv);
	}

	@Override
	public void ChangePW(UserVO uv) {
		// TODO Auto-generated method stub
		sqlSession.selectOne(namespace+".ChangePW",uv);
	}
	
	@Override
	public void ChangeNick(UserVO uv) {
		// TODO Auto-generated method stub
		sqlSession.selectOne(namespace+".ChangeNick",uv);
	}

	@Override
	public UserVO MyPage(UserVO uv) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".MyPage",uv);
	}

	@Override
	public UserVO idCheck(UserVO uv) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".idCheck",uv);
	}

	@Override
	public UserVO nickCheck(UserVO uv) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".nickCheck",uv);
	}
	
	

}
