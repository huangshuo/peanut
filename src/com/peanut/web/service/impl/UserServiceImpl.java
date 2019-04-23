package com.peanut.web.service.impl;

import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServerStatusCodeEnum;
import com.peanut.common.util.Md5Util;
import com.peanut.dao.UserDao;
import com.peanut.dao.UserFeedbackDao;
import com.peanut.dao.impl.UserDaoImpl;
import com.peanut.dao.impl.UserFeedbackDaoImpl;
import com.peanut.entity.pojo.User;
import com.peanut.entity.pojo.UserFeedback;
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
  private static UserFeedbackDao userFeedbackDao = new UserFeedbackDaoImpl();

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
    if (user.getUid() == null) {
      return ServerResponse.failWithMsg(ServerStatusCodeEnum.NOT_FOUND.getCode(), "用户不存在");
    }
    if (!Md5Util.verify(password, user.getPassword())) {
      return ServerResponse.failWithMsg(ServerStatusCodeEnum.AUTHENTICATION_FAILED.getCode(), "用户名或密码错误");
    }
    return ServerResponse.successWithData(user);
  }

  /**
   * 获取用户个人信息
   *
   * @param uid 用户id
   * @return serverResponse
   */
  @Override
  public ServerResponse<User> getUserInfo(long uid) {
    User user = userDao.selectOneByPrimaryKey(uid);
    if (user.getUid() == null) {
      return ServerResponse.failWithMsg(ServerStatusCodeEnum.NOT_FOUND.getCode(), "用户不存在");
    }
    return ServerResponse.successWithData(user);
  }

  /**
   * 修改用户个人信息
   *
   * @param user 修改后的用户信息对象
   * @return serverResponse
   */
  @Override
  public ServerResponse modifyUserInfo(User user) {
    if (userDao.selectOneByPrimaryKey(user.getUid()).getUid() == null) {
      return ServerResponse.failWithMsg(ServerStatusCodeEnum.NOT_FOUND.getCode(), "用户不存在");
    }
    // 检测用户名
    User userForUsername = new User();
    userForUsername.setUsername(user.getUsername());
    if (userDao.selectOneByTemplate(userForUsername).getUid() != null) {
      return ServerResponse.failWithMsg(ServerStatusCodeEnum.DUPLICATE_KEY.getCode(), "用户名已被占用");
    }
    // 检测手机号
    User userForPhone = new User();
    userForPhone.setPhone(user.getPhone());
    if (userDao.selectOneByTemplate(userForPhone).getUid() != null) {
      return ServerResponse.failWithMsg(ServerStatusCodeEnum.DUPLICATE_KEY.getCode(), "手机号已被占用");
    }
    boolean succeed = userDao.updateByTemplate(user);
    if (succeed) {
      return ServerResponse.success();
    }
    return ServerResponse.failWithMsg(ServerStatusCodeEnum.FAIL.getCode(), ServerStatusCodeEnum.FAIL.getMsg());
  }

  /**
   * 用户反馈
   *
   * @param userFeedback 反馈信息对象
   * @return serverResponse
   */
  @Override
  public ServerResponse addUserFeedBack(UserFeedback userFeedback) {
    if (userDao.selectOneByPrimaryKey(userFeedback.getUid()).getUid() == null) {
      return ServerResponse.failWithMsg(ServerStatusCodeEnum.NOT_FOUND.getCode(), "用户不存在");
    }
    boolean succeed = userFeedbackDao.insert(userFeedback);
    if (succeed) {
      return ServerResponse.success();
    }
    return ServerResponse.failWithMsg(ServerStatusCodeEnum.FAIL.getCode(), ServerStatusCodeEnum.FAIL.getMsg());
  }
}
