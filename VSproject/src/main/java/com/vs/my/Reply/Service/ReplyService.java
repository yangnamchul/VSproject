package com.vs.my.Reply.Service;

import java.util.List;

import com.vs.my.Reply.DAOVO.ReplyVO;

public interface ReplyService {

	
	public List<ReplyVO> ReplyAllData(int b_seq);
	public int ReplyInsertData(ReplyVO rv);
	public ReplyVO ReplyOneData(int re_seq);
	public List<ReplyVO> UserReply(String u_id);
	public int ReplyCnt(int b_seq);
	public void delReply(int re_seq);
}
