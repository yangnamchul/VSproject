package com.vs.my.Vote.DAOVO;

import java.util.List;

public interface VoteDAO {
	
	public List<VoteVO> allVote(VoteVO vv);
	public void FirstVote(VoteVO vv);
	public void Vote(VoteVO vv);
	public int LeftCnt(VoteVO vv);
	public int RightCnt(VoteVO vv);
	public List<VoteVO> UserVote(String u_id);
	public VoteVO VoteConfirm(VoteVO vv);  //회원
	public VoteVO VoteConfirm2(VoteVO vv);  //비회원
}
