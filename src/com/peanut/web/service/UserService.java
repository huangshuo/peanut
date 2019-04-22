package com.peanut.web.service;

import com.peanut.common.http.ServerResponse;
import com.peanut.entity.pojo.User;
import com.peanut.entity.pojo.UserFeedback;

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

  /**
   * 获取用户个人信息
   * @param uid 用户id
   * @return serverResponse
   */
  ServerResponse<User> getUserInfo(long uid);

  /**
   * 修改用户个人信息
   * @param user 修改后的用户信息对象
   * @return serverResponse
   */
  ServerResponse modifyUserInfo(User user);

  /**
   * 用户反馈
   * @param userFeedback 反馈信息对象
   * @return serverResponse
   */
  ServerResponse addUserFeedBack(UserFeedback userFeedback);
}
