package com.vs.my.Vote.DAOVO;

import java.util.Date;

public class VoteVO {
	private int v_seq;
	private int b_seq;
	private String u_id;
	private int v_like;
	private Date v_date;
	private String v_ip;
	private String b_title;
	
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public int getV_seq() {
		return v_seq;
	}
	public Date getV_date() {
		return v_date;
	}
	public void setV_date(Date v_date) {
		this.v_date = v_date;
	}
	public void setV_seq(int v_seq) {
		this.v_seq = v_seq;
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
	public int getV_like() {
		return v_like;
	}
	public void setV_like(int v_like) {
		this.v_like = v_like;
	}
	public String getV_ip() {
		return v_ip;
	}
	public void setV_ip(String v_ip) {
		this.v_ip = v_ip;
	}
	
}
