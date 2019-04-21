package com.peanut.web.service.impl;

import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServerStatusCodeEnum;
import com.peanut.common.util.Md5Util;
import com.peanut.dao.UserDao;
import com.peanut.dao.impl.UserDaoImpl;
import com.peanut.entity.pojo.User;
import com.peanut.web.service.UserService;

/**
 * description: 用户Service接口实现类.
 *
 * @author huangs
 * @date 2019-04-21
 * @see com.peanut.web.service.impl
 * @since 1.0
 */
public class UserServiceImpl implements UserService {

  private static UserDao userDao = new UserDaoImpl();

  /**
   * 密码登录
   *
   * @param username 用户名
   * @param password 密码
   * @return serverResponse
   */
  @Override
  public ServerResponse<User> login(String username, String password) {
    User userTemplate = new User();
    userTemplate.setUsername(username);
    User user = userDao.selectOneByTemplate(userTemplate);
    if (user == null) {
      return ServerResponse.failWithMsg(ServerStatusCodeEnum.NOT_FOUND.getCode(), "用户不存在");
    }
    if (!Md5Util.verify(password, user.getPassword())) {
      return ServerResponse.failWithMsg(ServerStatusCodeEnum.AUTHENTICATION_FAILED.getCode(), "用户名或密码错误");
    }
    return ServerResponse.successWithData(user);
  }
}
