package com.topia.phj;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.topia.phj.service.VideoServiceImpl;
import com.topia.phj.vo.CommentVo;
import com.topia.phj.vo.Criteria;
import com.topia.phj.vo.Paging;
import com.topia.phj.vo.VideoVo;

@Controller
public class VideoController {
	
	@Autowired
	VideoServiceImpl vsi;
	
	//동영상 목록
	@ResponseBody
	@RequestMapping(value="/videoList")
	public Map<String, Object> videoList(HttpServletRequest request, Criteria criteria){
		
		//파람설정
		HashMap<String, Object> reqMap = new HashMap<String, Object>();
		
		//리턴맵설정
		Map<String, Object> resMap = new HashMap<String, Object>();
		
		//검색관련값 받기
		String searchCondition = request.getParameter("searchCondition");
		String videoSearchWord = request.getParameter("videoSearchWord");
		
		//페이지당 갯 변경시 세팅
		criteria.setPerPageNum(8);
		
		reqMap.put("searchCondition", searchCondition);
		reqMap.put("videosearchWord", videoSearchWord);
		reqMap.put("criteria", criteria);
		List<VideoVo> list = vsi.videoList(reqMap);
		int videoListCnt = vsi.videoListCnt();
		
		for(int i=0; i<list.size(); i++) {
			list.get(i).setVideoRegdate_change(list.get(i).getVideoRegdate());
		}
		
		Paging paging = new Paging();
		paging.setCriteria(criteria);
		paging.setTotalCount(videoListCnt);
		
		resMap.put("list", list);
		resMap.put("paging", paging);
		
		return resMap;
	}
	
	//동영상 목록 자세히보기
	@ResponseBody
	@RequestMapping(value = "/videoListDetail")
	public Map<String, Object> videoListDetail(HttpServletRequest request, Criteria criteria){
		
		//파람설정
		HashMap<String, Object> reqMap = new HashMap<String, Object>();
		//리턴맵설정
		Map<String, Object> resMap = new HashMap<String, Object>();
		//검색관련 값받기
		String searchCondition = request.getParameter("searchCondition");
		String videoSearchWord = request.getParameter("videoSearchWord");
		
		reqMap.put("searchCondition", searchCondition);
		reqMap.put("videoSearchWord", videoSearchWord);
		reqMap.put("criteria", criteria);
		
		List<VideoVo> list = vsi.videoList(reqMap);
		int videoListCnt = vsi.videoListCnt();
		
		for (int i = 0; i<list.size(); i++) {
			list.get(i).setVideoRegdate_change(list.get(i).getVideoRegdate());
		}
		
		Paging paging = new Paging();
		paging.setCriteria(criteria);
		paging.setTotalCount(videoListCnt);
		
		resMap.put("list", list);
		resMap.put("paging", paging);
		
		return resMap;
	}
	
	//동영상 상세 보기
	@RequestMapping(value = "/videoDetail")
	public String videoDetail(@RequestParam("videoIdx") int videoIdx, Criteria criteria, Model model) {
		HashMap<String, Object> reqMap = new HashMap<String, Object>();
		List<VideoVo> videoList = vsi.videoList(reqMap);
		reqMap.put("criteria", criteria);
		
		for (int i = 0; i<videoList.size(); i++) {
			videoList.get(i).setVideoRegdate_change(videoList.get(i).getVideoRegdate());
		}
		
		vsi.videoViewCnt(videoIdx);
		model.addAttribute("videoDetail",vsi.videoDetail(videoIdx));
		model.addAttribute("videoList", vsi.videoList(reqMap));
		/* model.addAttribute("cmtCnt", videoList) */
		
		/*
		 * List<CommentVo> commentList = vsi.commentList(videoIdx); 
		 * int commentListCnt = vsi.commentListCnt(videoIdx);
		 * 
		 * for(int i=0; i<commentList.size(); i++) {
		 * commentList.get(i).getCommentRegdate_change(commentList.get(i). getCommentRegdate()); 
		 * }
		 */
		
		Paging paging = new Paging();
		paging.setCriteria(criteria);
		/* paging.setTotalCount(commentListCnt); */
		
		return "/video/videoDetail";
	}
	
	//유튜브등록화면이동
	@RequestMapping(value="/registerVideoForm")
	public String registerVideoForm() {
		return "/video/registerVideo";
	}
	
	
}
