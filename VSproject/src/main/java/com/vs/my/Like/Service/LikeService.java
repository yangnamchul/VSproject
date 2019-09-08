package com.vs.my.Like.Service;

import java.util.List;

import com.vs.my.Like.DAOVO.LikeVO;

public interface LikeService {
	public void FirstLike(LikeVO lv);
	public LikeVO LikeConfirm(LikeVO lv);
	public LikeVO LikeConfirm2(LikeVO lv);
	public int LikeCnt(LikeVO lv);
	public int UnLikeCnt(LikeVO lv);
}
