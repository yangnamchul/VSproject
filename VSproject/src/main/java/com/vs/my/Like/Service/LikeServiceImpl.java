package com.vs.my.Like.Service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.my.Like.DAOVO.LikeDAO;
import com.vs.my.Like.DAOVO.LikeVO;

@Service
public class LikeServiceImpl implements LikeService{
	
	@Autowired
	private LikeDAO ldao;

	@Override
	public void FirstLike(LikeVO lv) {
		// TODO Auto-generated method stub
		ldao.FirstLike(lv);
	}

	@Override
	public LikeVO LikeConfirm(LikeVO lv) {
		// TODO Auto-generated method stub
		return ldao.LikeConfirm(lv);
	}

	@Override
	public LikeVO LikeConfirm2(LikeVO lv) {
		// TODO Auto-generated method stub
		return ldao.LikeConfirm2(lv);
	}

	@Override
	public int LikeCnt(LikeVO lv) {
		// TODO Auto-generated method stub
		return ldao.LikeCnt(lv);
	}

	@Override
	public int UnLikeCnt(LikeVO lv) {
		// TODO Auto-generated method stub
		return ldao.UnLikeCnt(lv);
	}

	
}
