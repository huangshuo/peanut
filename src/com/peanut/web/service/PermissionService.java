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
   * @return serverResponse
   */
  ServerResponse<PageInfo<BackendUser>> pageQueryAll(int pageNum, int pageSize);

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
}
