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

}
