package com.topia.phj.vo;

import java.sql.Date;

import org.apache.commons.lang.builder.ToStringBuilder;

import com.topia.phj.utill.YouTubeUtil;

public class VideoVo {
	private int rowNum;
	private int videoIdx;
	private String videoTitle;
	private String videoContents;
	private String videoIdentifiedId;
	private String videoRegdate_change;
	private Date videoWrtdate;
	private Date videoRegdate;
	private Date videoUptdate;
	private String videoRegId;
	private String videoRegIp;
	private String videoUptIp;
	private int videoViewCnt;
	
	public String getVideoRegdate_change() {
		return videoRegdate_change;
	}
	
	
	public void setVideoRegdate_change(Date videoRegdate_change) {
		this.videoRegdate_change = YouTubeUtil.calculateTime(videoRegdate);
	}
	
	public int getRowNum() {
		return rowNum;
	}


	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}


	public int getVideoIdx() {
		return videoIdx;
	}


	public void setVideoIdx(int videoIdx) {
		this.videoIdx = videoIdx;
	}


	public String getVideoTitle() {
		return videoTitle;
	}


	public void setVideoTitle(String videoTitle) {
		this.videoTitle = videoTitle;
	}


	public String getVideoContents() {
		return videoContents;
	}


	public void setVideoContents(String videoContents) {
		this.videoContents = videoContents;
	}


	public String getVideoIdentifiedId() {
		return videoIdentifiedId;
	}


	public void setVideoIdentifiedId(String videoIdentifiedId) {
		this.videoIdentifiedId = videoIdentifiedId;
	}


	public Date getVideoWrtdate() {
		return videoWrtdate;
	}


	public void setVideoWrtdate(Date videoWrtdate) {
		this.videoWrtdate = videoWrtdate;
	}


	public Date getVideoRegdate() {
		return videoRegdate;
	}


	public void setVideoRegdate(Date videoRegdate) {
		this.videoRegdate = videoRegdate;
	}


	public Date getVideoUptdate() {
		return videoUptdate;
	}


	public void setVideoUptdate(Date videoUptdate) {
		this.videoUptdate = videoUptdate;
	}


	public String getVideoRegId() {
		return videoRegId;
	}


	public void setVideoRegId(String videoRegId) {
		this.videoRegId = videoRegId;
	}


	public String getVideoRegIp() {
		return videoRegIp;
	}


	public void setVideoRegIp(String videoRegIp) {
		this.videoRegIp = videoRegIp;
	}


	public String getVideoUptIp() {
		return videoUptIp;
	}


	public void setVideoUptIp(String videoUptIp) {
		this.videoUptIp = videoUptIp;
	}


	public int getVideoViewCnt() {
		return videoViewCnt;
	}


	public void setVideoViewCnt(int videoViewCnt) {
		this.videoViewCnt = videoViewCnt;
	}


	@Override
	 public String toString() {
		   return ToStringBuilder.reflectionToString(this);
	}

}
