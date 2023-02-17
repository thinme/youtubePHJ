package com.topia.phj.service;

import java.util.HashMap;
import java.util.List;

import com.topia.phj.vo.VideoVo;

public interface VideoService {
	
	public List<VideoVo> videoList(HashMap<String, Object> reqMap);
	
	public int videoListCnt();
	
	public int registerVideo(VideoVo video);
	
	public void videoViewCnt(int videoIdx);
	
	public VideoVo videoDetail(int videoIdx);
}
