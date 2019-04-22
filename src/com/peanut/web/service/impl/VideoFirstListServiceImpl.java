package com.peanut.web.service.impl;

import com.peanut.common.http.ServerResponse;
import com.peanut.dao.BaseDao;
import com.peanut.dao.impl.VideoFirstListDaoImpl;
import com.peanut.entity.pojo.VideoFirstList;
import com.peanut.web.service.VideoFirstListService;

import java.util.List;


/**
 * description: .
 *
 * @author JAVASM
 * @date 2019-04-22
 * @see com.peanut.web.service.impl
 * @since 1.0
 */
public class VideoFirstListServiceImpl implements VideoFirstListService {

  @Override
  public ServerResponse<List<VideoFirstList>> videoFirstList() {
    BaseDao bd=new VideoFirstListDaoImpl();
    List<VideoFirstList> list=bd.selectAll();
    ServerResponse<List<VideoFirstList>> serverResponse=ServerResponse.successWithData(list);
    return serverResponse;
  }
}
