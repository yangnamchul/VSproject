package com.vs.my.VSS.Service;

import java.util.List;

import com.vs.my.VSS.DAOVO.VSSVO;

public interface VSSService {
	public int makeVSS(VSSVO vssvo);
	public List<VSSVO> getAllVSS();
	public VSSVO getOneVSS(int vss_seq);
	public int maxVSS();
	public List<VSSVO> newVSS();
}
