package com.hjt.pojo;

import java.io.Serializable;
import java.util.Date;

public class Floor implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer fid;
	private Integer aid;
	private Integer cid;
	private Integer uid;
	private String content;
	private Date date;
	private User floorReplyer;
	
	public Floor() {
		// TODO Auto-generated constructor stub
	}
	
	public Floor(Integer aid, Integer cid, Integer uid, String content, Date date, User floorReplyer) {
		super();
		this.aid = aid;
		this.cid = cid;
		this.uid = uid;
		this.content = content;
		this.date = date;
		this.floorReplyer = floorReplyer;
	}
	public Integer getFid() {
		return fid;
	}
	public void setFid(Integer fid) {
		this.fid = fid;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public User getFloorReplyer() {
		return floorReplyer;
	}
	public void setFloorReplyer(User floorReplyer) {
		this.floorReplyer = floorReplyer;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}
}
