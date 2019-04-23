package com.peanut.web.service.impl;

import com.peanut.common.http.ServerResponse;
import com.peanut.dao.VideoDetailDao;
import com.peanut.dao.impl.VideoDetailDaoImpl;
import com.peanut.entity.pojo.VideoDetail;
import com.peanut.web.service.VideoDetailService;


/**
 * description: .
 *
 * @author JAVASM
 * @date 2019-04-22
 * @see com.peanut.web.service.impl
 * @since 1.0
 */
public class VideoDetailServiceImpl implements VideoDetailService {
  @Override
  public ServerResponse<VideoDetail> videoDetail(String vid) {
    VideoDetailDao videoDetailDao=new VideoDetailDaoImpl();
    VideoDetail videoDetail=new VideoDetail();
    videoDetail.setVid(vid);
    videoDetail=videoDetailDao.selectOneByTemplate(videoDetail);
    ServerResponse<VideoDetail> serverResponse=ServerResponse.successWithData(videoDetail);
    return serverResponse;
  }
}
