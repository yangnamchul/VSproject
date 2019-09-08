package com.vs.my.Like.DAOVO;

import java.util.List;

public interface LikeDAO {
	public void FirstLike(LikeVO lv);
	public LikeVO LikeConfirm(LikeVO lv);
	public LikeVO LikeConfirm2(LikeVO lv);
	public int LikeCnt(LikeVO lv);
	public int UnLikeCnt(LikeVO lv);
}
