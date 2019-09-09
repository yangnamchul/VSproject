package com.vs.my.VSS.DAOVO;

import java.util.List;

public interface VSSDAO {
	public int makeVSS(VSSVO vssvo);
	public List<VSSVO> getAllVSS();
	public VSSVO getOneVSS(int vss_seq);
	public int maxVSS();
}
