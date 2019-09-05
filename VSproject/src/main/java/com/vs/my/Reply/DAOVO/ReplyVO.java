package com.vs.my.Reply.DAOVO;

import java.util.Date;

public class ReplyVO {

/*	Re_seq number NOT NULL,
	B_seq number NOT NULL,
	U_id varchar2(4000) NOT NULL UNIQUE,
	Re_content varchar2(4000) NOT NULL,
	Re_date date NOT NULL,
	Re_parent number,
	Re_boolean number,
	PRIMARY KEY (Re_seq)*/
	
	private int re_seq;
	private int b_seq;
	private String u_id;
	private String re_content;
	private Date re_date;
	private int re_parent;
	private int re_boolean;
	
	
	public int getRe_seq() {
		return re_seq;
	}
	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
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
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public Date getRe_date() {
		return re_date;
	}
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}
	public int getRe_parent() {
		return re_parent;
	}
	public void setRe_parent(int re_parent) {
		this.re_parent = re_parent;
	}
	public int getRe_boolean() {
		return re_boolean;
	}
	public void setRe_boolean(int re_boolean) {
		this.re_boolean = re_boolean;
	}
	
	
}
