package com.vs.my.Board.DAOVO;

import java.util.Date;

import com.vs.my.Like.DAOVO.LikeVO;

public class BoardVO {
	
	private int b_seq;
	private String u_id;
	private int vss_seq;
	private String b_title;
	private String b_content;
	private int b_cnt;
	private Date b_date;
	private int b_boolean;
	private int b_parent;
	private String b_left;
	private String b_right;
	private LikeVO lv;
	private int replyCnt;
	private String vssName;
	
	public String getVssName() {
		return vssName;
	}

	public void setVssName(String vssName) {
		this.vssName = vssName;
	}

	public int getReplyCnt() {
		return replyCnt;
	}

	public void setReplyCnt(int replycnt) {
		replyCnt = replycnt;
	}

	public LikeVO getLv() {
		return lv;
	}

	public void setLv(LikeVO lv) {
		this.lv = lv;
	}

	public String getB_left() {
		return b_left;
	}

	public void setB_left(String b_left) {
		this.b_left = b_left;
	}

	public String getB_right() {
		return b_right;
	}

	public void setB_right(String b_right) {
		this.b_right = b_right;
	}

	public int getB_seq() {
		return b_seq;
	}

	public void setB_seq(int b_seq) {
		this.b_seq = b_seq;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}


	public int getVss_seq() {
		return vss_seq;
	}

	public void setVss_seq(int vss_seq) {
		this.vss_seq = vss_seq;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public int getB_cnt() {
		return b_cnt;
	}

	public void setB_cnt(int b_cnt) {
		this.b_cnt = b_cnt;
	}

	public Date getB_date() {
		return b_date;
	}

	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}

	public int getB_boolean() {
		return b_boolean;
	}

	public void setB_boolean(int b_boolean) {
		this.b_boolean = b_boolean;
	}

	public int getB_parent() {
		return b_parent;
	}

	public void setB_parent(int b_parent) {
		this.b_parent = b_parent;
	}

}
