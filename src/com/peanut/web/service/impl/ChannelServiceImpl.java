package com.peanut.web.service.impl;

import com.peanut.common.http.ServerResponse;
import com.peanut.dao.BaseDao;
import com.peanut.dao.impl.BaseDaoImpl;
import com.peanut.entity.pojo.BackendChannelManage;
import com.peanut.entity.vo.PageInfo;
import com.peanut.web.service.ChannelService;

/**
 * description: .
 *
 * @author JAVASM
 * @date 2019-04-26
 * @see com.peanut.web.service.impl
 * @since 1.0
 */
public class ChannelServiceImpl implements ChannelService {

  @Override
  public ServerResponse<PageInfo<BackendChannelManage>> channelManage(int page,int pageSize) {
    BaseDao<BackendChannelManage> baseDao=new BaseDaoImpl<>(BackendChannelManage.class);
    PageInfo<BackendChannelManage> pageInfo=baseDao.pageQueryByTemplate(page,pageSize,null);
    return ServerResponse.successWithData(pageInfo);
  }
}
