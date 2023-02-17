package com.topia.phj.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.topia.phj.vo.Criteria;
import com.topia.phj.vo.MemberVo;

public interface MemberService {
	
	public MemberVo loginChk (HashMap<String, Object> reqMap);
	
	public int loginDplChk (String memberId);
	
	public int registerMember(MemberVo member);
	
	public List<MemberVo> memberList(HashMap<String, Object> reqmap);
	
	public int memberListCount(HashMap<String, Object> reqMap);
	
	public MemberVo memberDetail(int memberidx);
	
	public int updateMember (MemberVo member);
	
	public int deleteMember (int idx);
	
	public int delteChkMember(HashMap<String, Object> reqMap);

}
