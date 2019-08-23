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
		UserVO uv2;
		int date=0;
	if(dao.LoginAction(uv)!=null) {
		uv2=dao.LoginAction(uv);  //u_seq가져오기 : BoardTable 에 넣기위해서 가져옴 
		System.out.println(uv2.getU_seq());
		hs.setAttribute("u_seq", uv2.getU_seq());
		date=1;
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
