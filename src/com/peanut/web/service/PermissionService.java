package com.peanut.web.service;

import com.peanut.common.http.ServerResponse;
import com.peanut.entity.pojo.BackendUser;
import com.peanut.entity.vo.PageInfo;

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
   *
   * @param username 用户名
   * @param password 密码
   * @return serverResponse
   */
  ServerResponse<BackendUser> login(String username, String password);

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
  ServerResponse<PageInfo<BackendUser>> pageQueryUser(int pageNum, int pageSize, String username, int role, int status);

  /**
   * 添加用户
   *
   * @param backendUser 用户信息对象
   * @return serverResponse
   */
  ServerResponse addUser(BackendUser backendUser);

  /**
   * 修改用户信息
   *
   * @param backendUser 修改后的用户信息对象
   * @return serverResponse
   */
  ServerResponse modifyUser(BackendUser backendUser);

  /**
   * 根据用户名删除用户信息
   *
   * @param username 用户名
   * @return serverResponse
   */
  ServerResponse deleteUserByUsername(String username);

  /**
   * 根据用户uid获取用户信息
   * @param uid 用户id
   * @return serverResponse
   */
  ServerResponse<BackendUser> getUserInfoByUid(long uid);
}
