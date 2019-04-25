package com.peanut.web.service;

import com.peanut.common.http.ServerResponse;
import com.peanut.entity.pojo.MenuManage;
import com.peanut.entity.vo.PageInfo;

import java.util.List;

/**
 * description: .
 *
 * @author JAVASM
 * @date 2019-04-25
 * @see com.peanut.web.service
 * @since 1.0
 */
public interface MenuService {
  ServerResponse<PageInfo<MenuManage>> menuList(int page);

}
