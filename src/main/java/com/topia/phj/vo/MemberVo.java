package com.topia.phj.vo;

import java.sql.Date;

import org.apache.commons.lang.builder.ToStringBuilder;

public class MemberVo {

	private int rowNum;
	private int memberIdx;
	private String memberId;
	private String memberPswd;
	private String memberName;
	private String memberAuth;
	private String memberChannelName;
	private Date memberRegdate;
	private Date memberUptdate;
	private String memberRegIp;
	private String memberUptIp;
	private Date memberWrtDate;
	private String memberImg;
	private String memberGender;
	private String memberDelYn;
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public int getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPswd() {
		return memberPswd;
	}
	public void setMemberPswd(String memberPswd) {
		this.memberPswd = memberPswd;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberAuth() {
		return memberAuth;
	}
	public void setMemberAuth(String memberAuth) {
		this.memberAuth = memberAuth;
	}
	public String getMemberChannelName() {
		return memberChannelName;
	}
	public void setMemberChannelName(String memberChannelName) {
		this.memberChannelName = memberChannelName;
	}
	public Date getMemberRegdate() {
		return memberRegdate;
	}
	public void setMemberRegdate(Date memberRegdate) {
		this.memberRegdate = memberRegdate;
	}
	public Date getMemberUptdate() {
		return memberUptdate;
	}
	public void setMemberUptdate(Date memberUptdate) {
		this.memberUptdate = memberUptdate;
	}
	public String getMemberRegIp() {
		return memberRegIp;
	}
	public void setMemberRegIp(String memberRegIp) {
		this.memberRegIp = memberRegIp;
	}
	public String getMemberUptIp() {
		return memberUptIp;
	}
	public void setMemberUptIp(String memberUptIp) {
		this.memberUptIp = memberUptIp;
	}
	public Date getMemberWrtDate() {
		return memberWrtDate;
	}
	public void setMemberWrtDate(Date memberWrtDate) {
		this.memberWrtDate = memberWrtDate;
	}
	public String getMemberImg() {
		return memberImg;
	}
	public void setMemberImg(String memberImg) {
		this.memberImg = memberImg;
	}
	public String getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}
	public String getMemberDelYn() {
		return memberDelYn;
	}
	public void setMemberDelYn(String memberDelYn) {
		this.memberDelYn = memberDelYn;
	}
	
	@Override
	 public String toString() {
		   return ToStringBuilder.reflectionToString(this);
	}
}
