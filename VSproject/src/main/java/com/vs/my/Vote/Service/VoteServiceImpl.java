package com.vs.my.Vote.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.my.Vote.DAOVO.VoteDAO;

@Service
public class VoteServiceImpl implements VoteService {
	
	@Autowired
	VoteDAO vdao;
	
	
	
}
