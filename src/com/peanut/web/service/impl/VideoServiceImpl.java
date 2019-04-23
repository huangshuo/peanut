package com.peanut.web.service.impl;

import com.peanut.common.http.ServerResponse;
import com.peanut.dao.BaseDao;
import com.peanut.dao.VideoDetailDao;
import com.peanut.dao.VideoEpisodeDetailDao;
import com.peanut.dao.VideoPageDao;
import com.peanut.dao.impl.*;
import com.peanut.entity.pojo.video.*;
import com.peanut.web.service.VideoService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * description:视频Service实现类 .
 *
 * @author zhaomaomao
 * @date 2019-04-22
 * @see com.peanut.web.service.impl
 * @since 1.0
 */
public class VideoServiceImpl implements VideoService {

  @Override
  public ServerResponse<List<VideoFirstList>> videoFirstList() {
    BaseDao bd=new VideoFirstListDaoImpl();
    List<VideoFirstList> list=bd.selectListByTemplate(new VideoFirstList());
    ServerResponse<List<VideoFirstList>> serverResponse=ServerResponse.successWithData(list);
    return serverResponse;
  }

  @Override
  public ServerResponse<List<VideoSecondList>> videoSecondList(Long fid) {
    BaseDao bd=new VideoSecondListDaoImpl();
    VideoSecondList videoSecondList=new VideoSecondList();
    videoSecondList.setFid(fid);
    List<VideoSecondList> list =bd.selectListByTemplate(videoSecondList);
    ServerResponse<List<VideoSecondList>> serverResponse=ServerResponse.successWithData(list);
    return serverResponse;
  }

  @Override
  public ServerResponse<Map<String,Object>> videoPage(Long fid, int page) {
    BaseDao bd=new VideoPageDaoImpl();
    VideoPage videoPage=new VideoPage();
    videoPage.setFid(fid);
    Map<String,Object> map = new HashMap<>();
    map.put("nextPageStatus",true);
    map.put("list",bd.pageQueryByTemplate(page,2,videoPage));
    ServerResponse<Map<String,Object>> serverResponse=ServerResponse.successWithData(map);
    return serverResponse;
  }

  @Override
  public ServerResponse<VideoDetail> videoDetail(String vid) {
    VideoDetailDao videoDetailDao=new VideoDetailDaoImpl();
    VideoDetail videoDetail=new VideoDetail();
    videoDetail.setVid(vid);
    videoDetail=videoDetailDao.selectOneByTemplate(videoDetail);
    ServerResponse<VideoDetail> serverResponse=ServerResponse.successWithData(videoDetail);
    return serverResponse;
  }

  @Override
  public ServerResponse<Map<String,Object>> videoEpisodeDetail(String vid) {

    Map<String,Object> map=new HashMap<>();
    //视频基础信息
    VideoDetail videoDetail= videoDetail(vid).getData();
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
