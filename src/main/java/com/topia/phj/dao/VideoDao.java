package com.topia.phj.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.topia.phj.vo.VideoVo;

@Repository
public class VideoDao {
	
	@Autowired
	SqlSessionTemplate tpl;
	
	public List<VideoVo> videoList(HashMap<String, Object> reqMap) {
		System.out.println("************videoListDao**************");
		return tpl.selectList("videoDao.videoList", reqMap);
	}
	
	public int videoListCnt() {
		int cnt = tpl.selectOne("videoDao.videoListCnt");
		return cnt;
	}
	
	public int registerVideo(VideoVo video) {
		int cnt = tpl.insert("videoDao.registerVideo", video);
		return cnt;
	}
	
	public void videoViewCnt(int videoIdx) {
		tpl.update("videoDao.videoViewCnt",videoIdx);
	}
	
	public VideoVo videoDetail(int videoIdx) {
		return tpl.selectOne("videoDao.videoDetail", videoIdx);
	}
}
