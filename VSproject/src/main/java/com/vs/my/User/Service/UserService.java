package com.vs.my.User.Service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;

import com.vs.my.User.DAOVO.UserVO;
@Service
public interface UserService {

	public List<UserVO> UserAllData();
/*	public UserVO UserOneData(UserVO vo);*/
	public void UserInsertData(UserVO vo);
	public int LoginAction(UserVO uv, HttpSession hs);
	public UserVO FindID(UserVO uv);
	public int FindPW(UserVO uv, HttpSession hs);
	public int ChangePW(UserVO uv,HttpSession hs);
}
