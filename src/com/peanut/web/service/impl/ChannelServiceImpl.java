package com.peanut.web.service.impl;

import com.peanut.common.http.ServerResponse;
import com.peanut.dao.BaseDao;
import com.peanut.dao.impl.BaseDaoImpl;
import com.peanut.entity.pojo.BackendChannelClassManage;
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
  private BaseDao<BackendChannelManage> baseDao1;
  private PageInfo<BackendChannelManage> pageInfo1;
  private BaseDao<BackendChannelClassManage> baseDao2;
  private PageInfo<BackendChannelClassManage> pageInfo2;
  @Override
  public ServerResponse<PageInfo<BackendChannelManage>> channelManage(int page,int pageSize) {
    baseDao1=new BaseDaoImpl<>(BackendChannelManage.class);
    pageInfo1=baseDao1.pageQueryByTemplate(page,pageSize,null);
    return ServerResponse.successWithData(pageInfo1);
  }

  @Override
  public ServerResponse<PageInfo<BackendChannelManage>> channelManage(int page, int pageSize, BackendChannelManage backendChannelManage) {
    baseDao1=new BaseDaoImpl<>(BackendChannelManage.class);
    pageInfo1=baseDao1.pageQueryByTemplate(page,pageSize,backendChannelManage);
    return ServerResponse.successWithData(pageInfo1);
  }

  @Override
  public ServerResponse<PageInfo<BackendChannelClassManage>> channelClassManage(int page, int pageSize) {
    baseDao2=new BaseDaoImpl<>(BackendChannelClassManage.class);
    pageInfo2=baseDao2.pageQueryByTemplate(page,pageSize,null);
    return ServerResponse.successWithData(pageInfo2);
  }

  @Override
  public ServerResponse deleteChannelClass(int id) {
    baseDao2 =new BaseDaoImpl<>(BackendChannelClassManage.class);
    baseDao2.deleteByPrimaryKey(id);
    return ServerResponse.successWithMsg("Ok");
  }

  @Override
  public ServerResponse insertChannelClass(BackendChannelClassManage backendChannelClassManage) {
    baseDao2 =new BaseDaoImpl<>(BackendChannelClassManage.class);
    baseDao2.insert(backendChannelClassManage);
    return ServerResponse.successWithMsg("Ok");
  }
}
