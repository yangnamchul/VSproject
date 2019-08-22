package com.vs.my.User.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.my.User.DAOVO.UserDAO;
import com.vs.my.User.DAOVO.UserVO;
@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO dao;
	

	@Override
	public List<UserVO> UserAllData() {
		// TODO Auto-generated method stub
		return dao.UserAllData();
	}
	
	@Override
	public void UserInsertData(UserVO vo) {
		// TODO Auto-generated method stub
		dao.UserInsertData(vo);
	}
	@Override
	public int LoginAction(UserVO uv) {
	System.out.println(uv.getU_id() + "service");
	
	try {
		dao.LoginAction(uv);
		return 1;
	} catch (Exception e) {
		e.printStackTrace();
		return 0;
	}
	
	}

}
