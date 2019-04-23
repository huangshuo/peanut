package com.peanut.web.service;


import com.peanut.common.http.ServerResponse;
import com.peanut.entity.pojo.video.VideoDetail;
import com.peanut.entity.pojo.video.VideoFirstList;
import com.peanut.entity.pojo.video.VideoSecondList;

import java.util.List;
import java.util.Map;


/**
 * description:视频Service相关接口 .
 *
 * @author zhaomaomao
 * @date 2019-04-22
 * @see com.peanut.web.service
 * @since 1.0
 */
public interface VideoService {
  /**
   * 获得视频一级菜单
   * @return  serverResponse
   */
  ServerResponse<List<VideoFirstList>> videoFirstList();
  /**
   * 获得视频二级菜单
   * @param fid 关联一级菜单fid
   * @return serverResponse
   */
  ServerResponse<List<VideoSecondList>> videoSecondList(Long fid);
  /**
   * 根据二级菜单获得分页信息
   * @param fid 关联二级菜单fid
   * @param page 第几页
   * @return serverResponse
   */
  ServerResponse<Map<String,Object>> videoPage(Long fid,int page);
  /**
   *  获得视频详情信息
   * @param vid 视频编号
   * @return serverResponse
   */
  ServerResponse<VideoDetail> videoDetail(String vid);
  /**
   * 获得视频单集详情信息
   * @param vid 视频编号
   * @return serverResponse
   */
  ServerResponse<Map<String,Object>> videoEpisodeDetail(String vid);

}
