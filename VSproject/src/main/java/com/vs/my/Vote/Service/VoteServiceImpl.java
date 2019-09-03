package com.vs.my.Vote.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.my.Vote.DAOVO.VoteDAO;
import com.vs.my.Vote.DAOVO.VoteVO;

@Service
public class VoteServiceImpl implements VoteService {
	
	@Autowired
	VoteDAO vdao;

	@Override
	public List<VoteVO> allVote(VoteVO vv) {
		// TODO Auto-generated method stub
		return vdao.allVote(vv);
	}
	
	
	
}
