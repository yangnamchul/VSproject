package com.vs.my.Reply.Service;

import java.util.List;

import com.vs.my.Reply.DAOVO.ReplyVO;

public interface ReplyService {

	
	public List<ReplyVO> ReplyAllData(int b_seq);
	public List<ReplyVO>  ReplyInsertData(ReplyVO rv);
}
