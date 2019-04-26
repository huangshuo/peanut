package com.peanut.web.service.impl;

import com.peanut.common.http.ServerResponse;
import com.peanut.dao.BaseDao;
import com.peanut.dao.impl.BaseDaoImpl;
import com.peanut.entity.pojo.MenuManage;
import com.peanut.entity.vo.PageInfo;
import com.peanut.web.service.MenuService;

import java.util.List;

/**
 * description: .
 *
 * @author JAVASM
 * @date 2019-04-25
 * @see com.peanut.web.service.impl
 * @since 1.0
 */
public class MenuServiceImpl implements MenuService {
  @Override
  public ServerResponse<PageInfo<MenuManage>> menuList(int page) {
    BaseDao<MenuManage> bd=new BaseDaoImpl<>(MenuManage.class);
    PageInfo<MenuManage>  pageInfo=bd.pageQueryByTemplate(page,10,null);
    return ServerResponse.successWithData(pageInfo);
  }
}
