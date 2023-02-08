package com.topia.phj.vo;

import java.sql.Date;

import org.apache.commons.lang.builder.ToStringBuilder;

public class commentVo {

	private int commentIdx;
	private int commentVideoIdx;
	private String commentContents;
	private String commentRegId;
	private String commentRegIp;
	private String commentUptIp;
	private Date commentRegdate;
	private Date commentUptDate;
	private Date commentWrtdate;
	private int commentLevel;
	private int commentRefIdx;
	
	
	
	public int getCommentIdx() {
		return commentIdx;
	}



	public void setCommentIdx(int commentIdx) {
		this.commentIdx = commentIdx;
	}



	public int getCommentVideoIdx() {
		return commentVideoIdx;
	}



	public void setCommentVideoIdx(int commentVideoIdx) {
		this.commentVideoIdx = commentVideoIdx;
	}



	public String getCommentContents() {
		return commentContents;
	}



	public void setCommentContents(String commentContents) {
		this.commentContents = commentContents;
	}



	public String getCommentRegId() {
		return commentRegId;
	}



	public void setCommentRegId(String commentRegId) {
		this.commentRegId = commentRegId;
	}



	public String getCommentRegIp() {
		return commentRegIp;
	}



	public void setCommentRegIp(String commentRegIp) {
		this.commentRegIp = commentRegIp;
	}



	public String getCommentUptIp() {
		return commentUptIp;
	}



	public void setCommentUptIp(String commentUptIp) {
		this.commentUptIp = commentUptIp;
	}



	public Date getCommentRegdate() {
		return commentRegdate;
	}



	public void setCommentRegdate(Date commentRegdate) {
		this.commentRegdate = commentRegdate;
	}



	public Date getCommentUptDate() {
		return commentUptDate;
	}



	public void setCommentUptDate(Date commentUptDate) {
		this.commentUptDate = commentUptDate;
	}



	public Date getCommentWrtdate() {
		return commentWrtdate;
	}



	public void setCommentWrtdate(Date commentWrtdate) {
		this.commentWrtdate = commentWrtdate;
	}



	public int getCommentLevel() {
		return commentLevel;
	}



	public void setCommentLevel(int commentLevel) {
		this.commentLevel = commentLevel;
	}



	public int getCommentRefIdx() {
		return commentRefIdx;
	}



	public void setCommentRefIdx(int commentRefIdx) {
		this.commentRefIdx = commentRefIdx;
	}



	@Override
	 public String toString() {
		   return ToStringBuilder.reflectionToString(this);
	}
}
