package com.topia.phj.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletWebRequest;

import com.topia.phj.dao.MemberDao;
import com.topia.phj.utill.GetIp;
import com.topia.phj.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {
	
	
	@Autowired
	private MemberDao mdo;

	@Override
	public MemberVo loginChk(HashMap<String, Object> reqMap) {
		System.out.println("***************login check serviceImpl****************");
		return mdo.loginChk(reqMap);
	}

	@Override
	public int loginDplChk(String memberId) {
		System.out.println("***************loginDpl check serviceImpl****************");
		int result = mdo.loginDplChk(memberId);
		return result;
		
	}

	@Override
	public int registerMember(MemberVo member) {
		System.out.println("***************회원가입 serviceImpl****************");
		int cnt = mdo.registerMember(member);
		return  cnt;
	}

	@Override
	public List<MemberVo> memberList(HashMap<String, Object> reqmap) {
		System.out.println("***************회원목록 serviceImpl****************");
		return mdo.memberList(reqmap);
	}

	@Override
	public int memberListCount(HashMap<String, Object> reqMap) {
		System.out.println("***************회원목록 총 회원수 serviceImpl****************");
		int cnt = mdo.memberListCount(reqMap);
		return cnt;
	}

	@Override
	public int updateMember(MemberVo member) {
		System.out.println("***************회원수정 serviceImpl****************");
		int idx = mdo.updateMember(member);
		System.out.println("memberIdx = " + member);
		return idx;
	}

	@Override
	public MemberVo memberDetail(int memberidx) {
		System.out.println("***************회원상세보기 serviceImpl****************");	
		return mdo.memberDetail(memberidx);
	}

	@Override
	public int deleteMember(int idx) {
		System.out.println("***************회원삭제하기 serviceImpl****************");
		int cnt = mdo.deleteMember(idx);
		return cnt;
	}

	@Override
	public int delteChkMember(HashMap<String, Object> reqMap) {
		System.out.println("***************회원선택삭제하기 serviceImpl****************");	
		int cnt = mdo.deleteChkMember(reqMap);
		return cnt;
	}
	
	
	

}
