package com.topia.phj;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletWebRequest;

import com.topia.phj.service.MemberService;
import com.topia.phj.utill.GetIp;
import com.topia.phj.vo.Criteria;
import com.topia.phj.vo.MemberVo;
import com.topia.phj.vo.Paging;


@Controller
public class MemberController {

	// DI(의존성주입)
	@Autowired
	private MemberService msi;

	// 로그인화면 들어가기
	@RequestMapping(value = "/login")
	public String login() {
		System.out.println("***********login 화면 불러오기 (cont)************");
		return "login";
	}

	// 로그인id/pw확인하기
	@ResponseBody
	@RequestMapping(value = "loginChk")
	public String logninChk(HttpServletRequest requst, HttpSession session, MemberVo member) {
		System.out.println("***********loginChk 화면 불러오기 (cont)************");
		HashMap<String, Object> reqMap = new HashMap<String, Object>();
		reqMap.put("memberId", member.getMemberId());
		reqMap.put("memberPswd", member.getMemberPswd());
		
		MemberVo memLogin = msi.loginChk(reqMap);
		String result = "";
		
		if (memLogin == null) {
			result = "N";
		}else {
			session.setAttribute("sesMemberId", member.getMemberId());
			session.setAttribute("sesMemberIdx", memLogin.getMemberIdx());
			session.setAttribute("sesMemberName", memLogin.getMemberName());
			session.setAttribute("sesMemberAuth", memLogin.getMemberAuth());
			result = "Y";
		}
		return result;

	}

	// 로그아웃
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
	//회원등록시 id실시간 체크하기
	 @ResponseBody
	 @RequestMapping(value="/loginDplChk") 
	 public int  loginDplChk(HttpServletRequest request) { 
		 String memberIdChck = request.getParameter("memberId");
		 int idChck = msi.loginDplChk(memberIdChck);
		
		 return idChck; 
		 }
	
	//회원등록화면가기
	@RequestMapping(value = "/registerMemberForm")
	public String registerMemberForm() {
		return "member/registerMember";
	}
	//회원등록시 호출
	@ResponseBody
	@RequestMapping(value = "/registerMember")
	public HashMap<String, Object> registerMember(MemberVo member, HttpServletRequest request) {
		GetIp iputill = new GetIp();
		String ip = iputill.getMemberIp(request);
		member.setMemberRegIp(ip);
		
		int registerCnt = msi.registerMember(member);
		HashMap<String, Object> reqMap = new HashMap<String, Object>();
		reqMap.put("registerCnt", registerCnt);
		return reqMap;
	}
	//회원목록
	@RequestMapping(value = "/memberList")
	public String memeberList(HttpServletRequest request, Criteria criteria, Model model) {

		HashMap<String, Object> reqMap = new HashMap<String, Object>();
		String memberSearchWord = request.getParameter("memberSearchWord");
		reqMap.put("memberSearchWord", memberSearchWord);

		int memberListCnt = msi.memberListCount(reqMap);

		Paging paging = new Paging();
		paging.setCriteria(criteria);
		paging.setTotalCount(memberListCnt);

		reqMap.put("criteria", criteria);

		model.addAttribute("memberList", msi.memberList(reqMap));
		model.addAttribute("memberSearchWord", memberSearchWord);
		model.addAttribute("paging", paging);
		model.addAttribute("criteria", criteria);

		return "member/memberList";
	}
	
	@RequestMapping(value = "/memberDetail")
	public String memberDetail(@RequestParam ("memberIdx")int memberidx, Model model) {
		model.addAttribute("memDetail", msi.memberDetail(memberidx));
		return "member/memberDetail";
	}
	
	@RequestMapping(value = "/updateMemberForm")
	public String updateMemberForm(@RequestParam ("memberIdx")int memberidx, Model model) {
		model.addAttribute("memDetail", msi.memberDetail(memberidx));
		return "member/updateMember";
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateMember")
	public String updateMember(@RequestParam("memberIdx") int param ,HttpServletRequest request, MemberVo member, Model model){
		
		System.out.println("*******************updateMember******************" + param);
		GetIp iputill = new GetIp();
		String ip = iputill.getMemberIp(request);
		member.setMemberUptIp(ip);
		member.setMemberIdx(param);
		
		msi.updateMember(member);
		return "redirect:./memberList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteMember")
	public  HashMap<String, Object> deleteMember(@RequestParam("memberIdx") int memberIdx, HttpServletRequest request){
		System.out.println("*******************deleteMember******************");
		int cnt = msi.deleteMember(memberIdx);
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("cnt", cnt);
		HttpSession session = request.getSession();
		String auth = (String) session.getAttribute("sesMemberAuth");
		
		if (!auth.equals("master")) {
			session.invalidate();
		}
		return resMap;
	}
	
	@RequestMapping(value = "/deleteChkMember")
	public String deleteChkMember(HttpServletRequest request) {
		System.out.println("*******************deleteChkMember******************");
		String[] checkedArr = request.getParameterValues("checkedArr");
		int size = checkedArr.length;
		
		for(int i=0; i<size; i++) {
			HashMap<String,Object> reqMap = new HashMap<String,Object>();
			reqMap.put("memberIdx", checkedArr[i]);
			msi.delteChkMember(reqMap);
		}
		return "redirect:./memberList";
	}
}
