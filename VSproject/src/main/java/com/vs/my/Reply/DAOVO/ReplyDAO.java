package com.vs.my.Reply.DAOVO;

import java.util.List;

public interface ReplyDAO {

	public List<ReplyVO> ReplyAllData(int b_seq);
	
	public int ReplyInsertData(ReplyVO rv);
	
	public ReplyVO ReplyOneData(int re_seq);
	
}

