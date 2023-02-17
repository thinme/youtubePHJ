package com.topia.phj.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.topia.phj.vo.MemberVo;

@Repository
public class MemberDao {
	
	@Autowired
	SqlSessionTemplate tpl;
	
	public MemberVo loginChk (HashMap<String, Object> reqMap) {
		System.out.println("***************login check dao****************");
		return tpl.selectOne("memberDao.loginChk", reqMap);
	}
	
	public int loginDplChk (String memberId) {
		System.out.println("***************loginDpl check dao****************");
		int cnt = tpl.selectOne("memberDao.loginDplChk", memberId);
		return cnt;
	}
	
	public int registerMember(MemberVo member) {
		System.out.println("***************회원가입 dao****************");
		int cnt = tpl.delete("memberDao.registerMember", member);
		return cnt;
	}
	
	public List<MemberVo> memberList(HashMap<String, Object> reqmap) {
		System.out.println("***************회원목록 dao****************");
		return tpl.selectList("memberDao.memberList", reqmap);
	}
	
	public int memberListCount(HashMap<String, Object> reqMap) {
		System.out.println("***************회원목록 총 인원 dao****************");
		int totalCnt = tpl.selectOne("memberDao.memberListCount", reqMap);
		return totalCnt;
	}
	
	public MemberVo memberDetail(int memberidx) {
		System.out.println("***************회원 상세보기 dao****************");
		
		return tpl.selectOne("memberDao.memberDetail", memberidx);
	}
	
	public int updateMember (MemberVo member) {
		System.out.println("***************회원 수정하기 dao****************");
		int idx = tpl.update("memberDao.updateMember", member);
		return idx;
	}
	
	public int deleteMember (int idx) {
		System.out.println("***************회원 삭제하기 dao****************");
		int cnt= tpl.delete("memberDao.deleteMember", idx);
		return cnt;
	}
	
	public int deleteChkMember(HashMap<String, Object> reqMap) {
		System.out.println("***************회원 선택 삭제하기 dao****************");
		int cnt = tpl.delete("memberDao.deleteChkMember", reqMap);
		return cnt;
	}
	
	
}
