package com.peanut.web.service.impl;

import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServerStatusCodeEnum;
import com.peanut.common.util.Md5Util;
import com.peanut.common.util.UidUtil;
import com.peanut.dao.BaseDao;
import com.peanut.dao.impl.BaseDaoImpl;
import com.peanut.entity.pojo.BackendUser;
import com.peanut.entity.vo.PageInfo;
import com.peanut.web.service.PermissionService;

import java.sql.Timestamp;

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
  public ServerResponse<BackendUser> login(String username, String password) {
    BackendUser backendUserTemplate = new BackendUser();
    backendUserTemplate.setUsername(username);
    BackendUser backendUser = backendUserDao.selectOneByTemplate(backendUserTemplate);
    // 用户不存在或密码错误
    if (backendUser.getUid() == null || !Md5Util.verify(password, backendUser.getPassword())) {
      return ServerResponse.failWithMsg(ServerStatusCodeEnum.AUTHENTICATION_FAILED.getCode(), "用户名或密码错误");
    }
    // 用户状态为不可用
    if (backendUser.getStatus() == 2) {
      return ServerResponse.failWithMsg(ServerStatusCodeEnum.AUTHENTICATION_FAILED.getCode(), "账户不可用");
    }
    // 最后登录时间
    backendUser.setLastLoginTime(new Timestamp(System.currentTimeMillis()));
    return ServerResponse.successWithData(backendUser);
  }

  /**
   * 获取所有用户列表(分页)
   *
   * @param pageNum  页码
   * @param pageSize 分页大小
   * @return serverResponse
   */
  @Override
  public ServerResponse<PageInfo<BackendUser>> pageQueryAll(int pageNum, int pageSize) {
    PageInfo<BackendUser> pageInfo = backendUserDao.pageQueryByTemplate(pageNum, pageSize, null);
    return ServerResponse.successWithData(pageInfo);
  }

  /**
   * 添加账户
   *
   * @param backendUser 账户信息对象
   * @return serverResponse
   */
  @Override
  public ServerResponse addUser(BackendUser backendUser) {
    // 用户名是否已存在
    BackendUser backendUserForUsername = new BackendUser();
    backendUserForUsername.setUsername(backendUser.getUsername());
    if (backendUserDao.selectOneByTemplate(backendUserForUsername).getUid() != null) {
      return ServerResponse.failWithMsg(ServerStatusCodeEnum.DUPLICATE_KEY.getCode(), "用户名已存在");
    }
    // 创建时间
    backendUser.setCreateTime(new Timestamp(System.currentTimeMillis()));
    backendUser.setUid(UidUtil.getUid());
    boolean succeed = backendUserDao.insert(backendUser);
    if (succeed) {
      return ServerResponse.success();
    }
    return ServerResponse.failWithMsg(ServerStatusCodeEnum.FAIL.getCode(), ServerStatusCodeEnum.FAIL.getMsg());
  }

  /**
   * 修改账户信息
   *
   * @param backendUser 修改后的账户信息对象
   * @return serverResponse
   */
  @Override
  public ServerResponse modifyUser(BackendUser backendUser) {
    // 用户名是否已存在
    BackendUser backendUserForUsername = new BackendUser();
    backendUserForUsername.setUsername(backendUser.getUsername());
    if (backendUserDao.selectOneByTemplate(backendUserForUsername).getUid() != null) {
      return ServerResponse.failWithMsg(ServerStatusCodeEnum.DUPLICATE_KEY.getCode(), "用户名已存在");
    }
    // 更新时间
    backendUser.setUpdateTime(new Timestamp(System.currentTimeMillis()));
    boolean succeed = backendUserDao.updateByTemplate(backendUser);
    if (succeed) {
      return ServerResponse.success();
    }
    return ServerResponse.failWithMsg(ServerStatusCodeEnum.FAIL.getCode(), ServerStatusCodeEnum.FAIL.getMsg());
  }

  /**
   * 根据用户名删除用户信息
   *
   * @param username 用户名
   * @return serverResponse
   */
  @Override
  public ServerResponse deleteUserByUsername(String username) {
    BackendUser backendUserForUid = new BackendUser();
    backendUserForUid.setUsername(username);
    backendUserForUid = backendUserDao.selectOneByTemplate(backendUserForUid);
    if (backendUserForUid.getUid() == null || !backendUserDao.deleteByPrimaryKey(backendUserForUid.getUid())) {
      return ServerResponse.failWithMsg(ServerStatusCodeEnum.FAIL.getCode(), ServerStatusCodeEnum.FAIL.getMsg());
    }
    return ServerResponse.success();
  }
}
