package com.vs.my.User.Service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
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
		hs.setAttribute("uv", uv2);
		date=1;
		return date;
	}
	else {
		return date;
		}
	}

	@Override
	public UserVO FindID(UserVO uv) {
		// TODO Auto-generated method stub
		return dao.FindID(uv);
	}

	@Override
	public UserVO FindPW(UserVO uv, HttpSession hs) {
		// TODO Auto-generated method stub
		UserVO vo =dao.FindPW(uv);
		return vo;
	}

	@Override
	public void ChangePW(UserVO uv) {
		// TODO Auto-generated method stub
		
		dao.ChangePW(uv);
		
	}

	@Override
	public UserVO MyPage(UserVO uv) {
		// TODO Auto-generated method stub
		
		return dao.MyPage(uv);
	}

	@Override
	public UserVO idCheck(UserVO uv) {
		// TODO Auto-generated method stub
		return dao.idCheck(uv);
	}

	@Override
	public UserVO nickCheck(UserVO uv) {
		// TODO Auto-generated method stub
		return dao.nickCheck(uv) ;
	}

	@Override
	public void ChangeNick(UserVO uv) {
		// TODO Auto-generated method stub
		dao.ChangeNick(uv);
	}
	

/*	@Override
	public UserVO UserOneData(UserVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
*/
}
