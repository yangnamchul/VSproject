package com.vs.my.Reply.DAOVO;

import java.util.List;

public interface ReplyDAO {

	public List<ReplyVO> ReplyAllData(int b_seq);
	
	public void ReplyInsertData(ReplyVO rv);
	
	
}

