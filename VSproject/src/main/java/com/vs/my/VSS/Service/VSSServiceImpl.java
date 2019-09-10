package com.vs.my.VSS.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.my.VSS.DAOVO.VSSDAO;
import com.vs.my.VSS.DAOVO.VSSVO;

@Service
public class VSSServiceImpl implements VSSService{
	
	@Autowired
	private VSSDAO vssdao;
	
	@Override
	public int makeVSS(VSSVO vssvo) {
		// TODO Auto-generated method stub
		return vssdao.makeVSS(vssvo);
	}

	@Override
	public List<VSSVO> getAllVSS() {
		// TODO Auto-generated method stub
		return vssdao.getAllVSS();
	}

	@Override
	public VSSVO getOneVSS(int vss_seq) {
		// TODO Auto-generated method stub
		return vssdao.getOneVSS(vss_seq);
	}

	@Override
	public int maxVSS() {
		// TODO Auto-generated method stub
		return vssdao.maxVSS();
	}

	@Override
	public List<VSSVO> newVSS() {
		// TODO Auto-generated method stub
		return vssdao.newVSS();
	}
	
}
