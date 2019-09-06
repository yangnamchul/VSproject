package com.vs.my.Vote.Service;

import java.util.List;

import com.vs.my.Vote.DAOVO.VoteVO;

public interface VoteService {
	public List<VoteVO> allVote(VoteVO vv);
	public void FirstVote(VoteVO vv);
	public void Vote(VoteVO vv);
	public int LeftCnt(VoteVO vv);
	public int RightCnt(VoteVO vv);
	public VoteVO VoteConfirm(VoteVO vv);  //회원
	public VoteVO VoteConfirm2(VoteVO vv);  //비회원
}
