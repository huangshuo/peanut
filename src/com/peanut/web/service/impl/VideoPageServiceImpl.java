package com.peanut.web.service.impl;

import com.peanut.common.http.ServerResponse;
import com.peanut.dao.BaseDao;
import com.peanut.dao.impl.VideoPageDaoImpl;
import com.peanut.entity.pojo.VideoPage;
import com.peanut.web.service.VideoPageService;

import java.util.List;

/**
 * description: .
 *
 * @author JAVASM
 * @date 2019-04-22
 * @see com.peanut.web.service.impl
 * @since 1.0
 */
public class VideoPageServiceImpl implements VideoPageService {

  @Override
  public ServerResponse<List<VideoPage>> videoPage(Long fid) {
    BaseDao bd=new VideoPageDaoImpl();
    VideoPage videoPage=new VideoPage();
    videoPage.setFid(fid);
    List<VideoPage> list=bd.selectListByTemplate(videoPage);
    ServerResponse<List<VideoPage>> serverResponse=ServerResponse.successWithData(list);
    return serverResponse;
  }
}
