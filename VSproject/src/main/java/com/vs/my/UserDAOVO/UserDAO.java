package com.vs.my.UserDAOVO;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class UserDAO {
	private static SqlSessionFactory sqlSessionFactory1;
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
	}
}
