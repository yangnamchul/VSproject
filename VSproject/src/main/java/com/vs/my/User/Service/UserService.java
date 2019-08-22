package com.vs.my.User.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.vs.my.User.DAOVO.UserVO;
@Service
public interface UserService {

	public List<UserVO> UserAllData();
	public void UserInsertData(UserVO vo);
	public int Loginaction(UserVO uv);
}
