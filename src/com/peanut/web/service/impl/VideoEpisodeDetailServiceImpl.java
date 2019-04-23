package com.peanut.web.service.impl;

import com.peanut.common.http.ServerResponse;
import com.peanut.dao.VideoEpisodeDetailDao;
import com.peanut.dao.VideoPageDao;
import com.peanut.dao.impl.VideoEpisodeDetailDaoImpl;
import com.peanut.dao.impl.VideoPageDaoImpl;
import com.peanut.entity.pojo.VideoDetail;
import com.peanut.entity.pojo.VideoEpisodeDetail;
import com.peanut.entity.pojo.VideoPage;
import com.peanut.web.service.VideoEpisodeDetailService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * description: .
 *
 * @author JAVASM
 * @date 2019-04-22
 * @see com.peanut.web.service.impl
 * @since 1.0
 */
public class VideoEpisodeDetailServiceImpl implements VideoEpisodeDetailService {
  @Override
  public ServerResponse<Map<String,Object>> videoEpisodeDetail(String vid) {

    Map<String,Object> map=new HashMap<>();
    //视频基础信息
    VideoDetail videoDetail=new VideoDetailServiceImpl().videoDetail(vid).getData();
    map.put("descinfo",videoDetail.getDescinfo());
    map.put("title",videoDetail.getTitle());
    //视频总集数
    VideoPageDao videoPageDao=new VideoPageDaoImpl();
    VideoPage videoPage=new VideoPage();
    videoPage.setVid(vid);
    map.put("epCnt",videoPageDao.selectOneByTemplate(videoPage).getEpcnt());
    //视频单集信息
    VideoEpisodeDetailDao videoEpisodeDetailDao=new VideoEpisodeDetailDaoImpl();
    VideoEpisodeDetail videoEpisodeDetail=new VideoEpisodeDetail();
    videoEpisodeDetail.setVid(vid);
    List<VideoEpisodeDetail> list=videoEpisodeDetailDao.selectListByTemplate(videoEpisodeDetail);
    map.put("list",list);
    ServerResponse<Map<String,Object>> serverResponse=ServerResponse.successWithData(map);
    return serverResponse;
  }
}
