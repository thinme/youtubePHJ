package com.topia.phj;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.topia.phj.service.VideoServiceImpl;
import com.topia.phj.utill.GetIp;
import com.topia.phj.vo.VideoVo;

@Controller
public class VideoControllerServe {
	
	@Autowired
	VideoServiceImpl vsi;
	
	@ResponseBody
	@RequestMapping(value ="/registerVideo")
	public HashMap<String, Object> registerVideo(HttpServletRequest request, VideoVo video, Model model){
		GetIp ipUtill = new GetIp();
		String ip = ipUtill.getMemberIp(request);
		video.setVideoRegIp(ip);
		
		String videoId = video.getVideoIdentifiedId();
		int idx = videoId.lastIndexOf("/");
		String resultId = videoId.substring(idx+1, videoId.length());
		video.setVideoIdentifiedId(resultId);
		
		int rtnCnt = vsi.registerVideo(video);
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		resMap.put("resulCnt", rtnCnt);
		
		return resMap;
	}
}
