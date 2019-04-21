package com.peanut.web.service;

import com.peanut.common.http.ServerResponse;
import com.peanut.entity.pojo.User;

/**
 * description: 用户相关Service接口.
 *
 * @author huangs
 * @date 2019-04-21
 * @see com.peanut.web.service
 * @since 1.0
 */
public interface UserService {

  /**
   * 密码登录
   * @param username 用户名
   * @param password 密码
   * @return serverResponse
   */
  ServerResponse<User> login(String username, String password);
}
