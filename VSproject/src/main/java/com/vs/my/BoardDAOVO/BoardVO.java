package com.vs.my.BoardDAOVO;

import java.util.Date;

public class BoardVO {
	private int b_seq;
	private int u_seq;
	private int c_seq;
	private int re_seq;
	private String b_title;
	private String b_content;
	private int b_cnt;
	private Date b_date;
	private String b_tag;
	
	public int getB_seq() {
		return b_seq;
	}
	public void setB_seq(int b_seq) {
		this.b_seq = b_seq;
	}
	public int getU_seq() {
		return u_seq;
	}
	public void setU_seq(int u_seq) {
		this.u_seq = u_seq;
	}
	public int getC_seq() {
		return c_seq;
	}
	public void setC_seq(int c_seq) {
		this.c_seq = c_seq;
	}
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
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
	public String getB_tag() {
		return b_tag;
	}
	public void setB_tag(String b_tag) {
		this.b_tag = b_tag;
	}
	
	
}
