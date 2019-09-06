package com.vs.my.Tag.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.vs.my.Tag.DAOVO.TagVO;

@Service
public interface TagService {
	
	public void makeTag(TagVO tv);
	public List<TagVO> getVSSBoard(TagVO tv);
}
