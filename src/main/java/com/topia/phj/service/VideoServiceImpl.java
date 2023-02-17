package com.topia.phj.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.topia.phj.dao.VideoDao;
import com.topia.phj.vo.VideoVo;

@Service
public class VideoServiceImpl implements VideoService {
	
	@Autowired
	private VideoDao vdo;

	@Override
	public List<VideoVo> videoList(HashMap<String, Object> reqMap) {
		System.out.println("**********videoServImpl.videoList********");
		return vdo.videoList(reqMap);
	}

	@Override
	public int videoListCnt() {
		System.out.println("**********videoServImpl.videoListCnt********");
		return vdo.videoListCnt();
	}

	@Override
	public int registerVideo(VideoVo video) {
		System.out.println("**********videoServImpl.registerVideo********");
		int cnt = vdo.registerVideo(video);
		return cnt;
	}

	@Override
	public void videoViewCnt(int videoIdx) {
		System.out.println("**********videoServImpl.videoViewCnt********");
		vdo.videoViewCnt(videoIdx);
	}

	@Override
	public VideoVo videoDetail(int videoIdx) {
		System.out.println("**********videoServImpl.videoDetail********");
		return vdo.videoDetail(videoIdx);
	}

}
