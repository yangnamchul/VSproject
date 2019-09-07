package com.vs.my.User.DAOVO;

import java.util.List;

public interface UserDAO {
	/*private static SqlSessionFactory sqlSessionFactory1;
	static {
		String myxml = "mybatis-config.xml";
		InputStream istream = null;
		try {
			istream = Resources.getResourceAsStream(myxml);
		} catch(IOException e) {
			e.printStackTrace();
		}
		sqlSessionFactory1 = new SqlSessionFactoryBuilder().build(istream);
	}
	
	public List<UserVO> UserAllData() {
		return sqlSessionFactory1.openSession().selectList("UserAllData");
	}*/
	public List<UserVO> UserAllData();
	
	public void UserInsertData(UserVO uv);
	
	public UserVO LoginAction(UserVO uv);
	
	public UserVO FindID(UserVO uv);
	
	public UserVO FindPW(UserVO uv);
	
	public void ChangePW(UserVO uv);
	
	public UserVO MyPage(UserVO uv);
	
	public UserVO idCheck(UserVO uv);
	
	public UserVO nickCheck(UserVO uv);
	
}
