package com.peanut.web.service.impl;

import com.peanut.common.http.ServerResponse;
import com.peanut.dao.BaseDao;
import com.peanut.dao.impl.VideoSecondListDaoImpl;
import com.peanut.entity.pojo.VideoSecondList;
import com.peanut.web.service.VideoSecondListService;

import javax.servlet.http.HttpServletRequest;
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
public class VideoSecondListServiceImpl implements VideoSecondListService {


  @Override
  public ServerResponse<List<VideoSecondList>> videoSecondList(Long fid) {
    BaseDao bd=new VideoSecondListDaoImpl();
    VideoSecondList videoSecondList=new VideoSecondList();
    videoSecondList.setFid(fid);
    List<VideoSecondList> list =bd.selectListByTemplate(videoSecondList);
    ServerResponse<List<VideoSecondList>> serverResponse=ServerResponse.successWithData(list);
    return serverResponse;
  }
}
