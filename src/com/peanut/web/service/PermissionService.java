package com.peanut.web.service;

import com.peanut.common.http.ServerResponse;

/**
 * description: 后台权限管理Service接口.
 *
 * @author huangs
 * @date 2019-04-25
 * @see com.peanut.web.service
 * @since 1.0
 */
public interface PermissionService {

  /**
   * 登录
   * @param username 用户名
   * @param password 密码
   * @return serverResponse
   */
  ServerResponse login(String username, String password);
}
