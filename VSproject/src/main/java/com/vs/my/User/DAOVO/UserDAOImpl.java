package com.vs.my.User.DAOVO;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public UserVO MyPage(UserVO uv) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".MyPage",uv);
	}

	@Override
	public UserVO idCheck(UserVO uv) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".idCheck",uv);
	}
	
	 public void keepLogin(String uid, String sessionId, Date next){
		   
	        Map<String, Object> map = new HashMap<String,Object>();
	        map.put("userId", uid);
	        map.put("sessionId", sessionId);
	        map.put("next", next);
		        sqlSession.update(namespace+".keepLogin",map);
			}
			public UserVO checkUserWithSessionKey(String sessionId) {
				return sqlSession.selectOne(namespace+".checkUserWithSessonKey",sessionId);
			}
	

}
