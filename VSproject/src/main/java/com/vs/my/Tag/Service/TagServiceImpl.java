package com.vs.my.Tag.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vs.my.Tag.DAOVO.TagDAO;
import com.vs.my.Tag.DAOVO.TagVO;

@Service
public class TagServiceImpl implements TagService{
	@Autowired
	private TagDAO tdao;

	@Override
	public void makeTag(TagVO tv) {
		// TODO Auto-generated method stub
		tdao.makeTag(tv);
	}

	@Override
	public List<TagVO> getVSSBoard(TagVO tv) {
		// TODO Auto-generated method stub
		return tdao.getVSSBoard(tv);
	}
	
	
}
