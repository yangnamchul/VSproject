package com.vs.my.Vote.DAOVO;

import java.util.List;

public interface VoteDAO {
	
	public List<VoteVO> allVote(VoteVO vv);
	public void FirstVote(VoteVO vv);
}
