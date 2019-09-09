package com.vs.my.Reply.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.my.Reply.DAOVO.ReplyDAO;
import com.vs.my.Reply.DAOVO.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{
    
	@Autowired
	private ReplyDAO rdao;
	@Override
	public List<ReplyVO> ReplyAllData(int b_seq) {
		// TODO Auto-generated method stub
		return rdao.ReplyAllData(b_seq);
	}
	@Override
	public int ReplyInsertData(ReplyVO rv) {
		// TODO Auto-generated method stub
		
		System.out.println("replyService -insert");
		System.out.println(rv.getB_seq());
		System.out.println(rv.getU_id());
		System.out.println(rv.getRe_content());
		
		
		int re_seq=rdao.ReplyInsertData(rv);
		
	    
		
		/*int b_seq2=rv.getB_seq();
		
		rdao.ReplyAllData(b_seq2);
		*/
		return re_seq;
				
			
	}
	@Override
	public ReplyVO ReplyOneData(int re_seq) {
		// TODO Auto-generated method stub
		
		System.out.println("replyService -onedata");
		System.out.println(re_seq);
		return rdao.ReplyOneData(re_seq);
	}
	@Override
	public List<ReplyVO> UserReply(String u_id) {
		// TODO Auto-generated method stub
		return rdao.UserReply(u_id);
	}
	@Override
	public int ReplyCnt(int b_seq) {
		// TODO Auto-generated method stub
		return rdao.ReplyCnt(b_seq);
	}
	


}
