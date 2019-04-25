package com.peanut.web.service.impl;

import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServerStatusCodeEnum;
import com.peanut.common.util.Md5Util;
import com.peanut.dao.BaseDao;
import com.peanut.dao.impl.BaseDaoImpl;
import com.peanut.entity.pojo.BackendUser;
import com.peanut.web.service.PermissionService;

/**
 * description: 后台权限管理Service接口实现类.
 *
 * @author huangs
 * @date 2019-04-25
 * @see com.peanut.web.service.impl
 * @since 1.0
 */
public class PermissionServiceImpl implements PermissionService {

  private static BaseDao<BackendUser> backendUserDao = new BaseDaoImpl<>(BackendUser.class);

  /**
   * 登录
   *
   * @param username 用户名
   * @param password 密码
   * @return serverResponse
   */
  @Override
  public ServerResponse login(String username, String password) {
    BackendUser backendUserTemplate = new BackendUser();
    backendUserTemplate.setUsername(username);
    BackendUser backendUser = backendUserDao.selectOneByTemplate(backendUserTemplate);
    // 用户不存在或密码错误
    if (backendUser.getUid() == null || !backendUser.getPassword().equalsIgnoreCase(Md5Util.encrypt(password))) {
      return ServerResponse.failWithMsg(ServerStatusCodeEnum.AUTHENTICATION_FAILED.getCode(), "用户名或密码错误");
    }
    // 用户状态为不可用
    if (backendUser.getStatus() == 2) {
      return ServerResponse.failWithMsg(ServerStatusCodeEnum.AUTHENTICATION_FAILED.getCode(), "账户不可用");
    }
    return ServerResponse.successWithData(backendUser);
  }
}
