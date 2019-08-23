package com.vs.my.User.Service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.my.User.DAOVO.UserDAO;
import com.vs.my.User.DAOVO.UserVO;
@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO dao;
	HttpSession se;

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
	public int LoginAction(UserVO uv, HttpSession hs) {
		UserVO uv2 = dao.LoginAction(uv);
		int date=0;
	if(uv2 !=null) {
		hs.setAttribute("u_id", uv2.getU_id());
		date=1;
		System.out.println("로그인 성공");
		return date;
	}
	else {
		return date;
		}
	}
	

/*	@Override
	public UserVO UserOneData(UserVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
*/
}
