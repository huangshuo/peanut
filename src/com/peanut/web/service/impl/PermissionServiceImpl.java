package com.peanut.web.service.impl;

import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServerStatusCodeEnum;
import com.peanut.common.util.Md5Util;
import com.peanut.common.util.UidUtil;
import com.peanut.dao.BaseDao;
import com.peanut.dao.impl.BaseDaoImpl;
import com.peanut.entity.pojo.BackendUser;
import com.peanut.entity.pojo.MenuManage;
import com.peanut.entity.vo.PageInfo;
import com.peanut.web.service.PermissionService;

import java.sql.Timestamp;
import java.util.List;

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
  private static BaseDao<MenuManage> menuManageDao = new BaseDaoImpl<>(MenuManage.class);

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
    if (!backendUserDao.updateByTemplate(backendUser)) {
      return ServerResponse.failWithMsg(ServerStatusCodeEnum.FAIL.getCode(), ServerStatusCodeEnum.FAIL.getMsg());
    }
    return ServerResponse.successWithData(backendUser);
  }

  /**
   * 获取所有用户列表(分页)
   *
   * @param pageNum  页码
   * @param pageSize 分页大小
   * @param username 用户名
   * @param role 用户角色(1普通用户 2合作公司 3管理员)
   * @param status 账户状态(1可用 2不可用)
   * @return serverResponse
   */
  @Override
  public ServerResponse<PageInfo<BackendUser>> pageQueryUser(int pageNum, int pageSize, String username, int role, int status) {
    BackendUser userTemplate = new BackendUser();
    if (username != null && !username.equals("")) {
      userTemplate.setUsername(username);
    }
    if (role != 0) {
      userTemplate.setRole(role);
    }
    if (status != 0) {
      userTemplate.setStatus(status);
    }
    PageInfo<BackendUser> pageInfo = backendUserDao.pageQueryByTemplate(pageNum, pageSize, userTemplate, "username");
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
    backendUserForUsername = backendUserDao.selectOneByTemplate(backendUserForUsername);
    if (backendUserForUsername.getUid() != null && !backendUserForUsername.getUid().equals(backendUser.getUid())) {
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

  /**
   * 根据用户uid获取用户信息
   *
   * @param uid 用户id
   * @return serverResponse
   */
  @Override
  public ServerResponse<BackendUser> getUserInfoByUid(long uid) {
    BackendUser backendUser = backendUserDao.selectOneByPrimaryKey(uid);
    return ServerResponse.successWithData(backendUser);
  }

  /**
   * 根据菜单id获取菜单信息
   *
   * @param id 菜单id
   * @return serverResponse
   */
  @Override
  public ServerResponse<MenuManage> getMenuByMenuId(long id) {
    MenuManage menuManage = menuManageDao.selectOneByPrimaryKey(id);
    return ServerResponse.successWithData(menuManage);
  }

  /**
   * 获取所有菜单信息
   *
   * @return serverResponse
   */
  @Override
  public ServerResponse<List<MenuManage>> getMenuList() {
    List<MenuManage> menuManageList = menuManageDao.selectListByTemplate(null);
    return ServerResponse.successWithData(menuManageList);
  }

  /**
   * 修改密码
   *
   * @param uid            用户id
   * @param originPassword 原密码
   * @param newPassword    新密码
   * @return serverResponse
   */
  @Override
  public ServerResponse changePassword(long uid, String originPassword, String newPassword) {
    BackendUser backendUser = backendUserDao.selectOneByPrimaryKey(uid);
    if (!Md5Util.verify(originPassword, backendUser.getPassword())) {
      return ServerResponse.failWithMsg(ServerStatusCodeEnum.AUTHENTICATION_FAILED.getCode(), "密码错误");
    }
    backendUser.setPassword(Md5Util.encrypt(newPassword));
    if (backendUserDao.updateByTemplate(backendUser)) {
      return ServerResponse.success();
    }
    return ServerResponse.failWithMsg(ServerStatusCodeEnum.FAIL.getCode(), ServerStatusCodeEnum.FAIL.getMsg());
  }
}
