package com.peanut.entity.pojo;

import com.alibaba.fastjson.annotation.JSONField;
import com.peanut.common.Constant;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * description: 后台用户实体类.
 *
 * @author huangs
 * @date 2019-04-25
 * @see com.peanut.entity.pojo
 * @since 1.0
 */
public class BackendUser implements Serializable {

  /**
   * 用户id.
   */
  private Long uid;
  /**
   * 用户名.
   */
  private String username;
  /**
   * 密码.
   */
  @JSONField(serialize = false)
  private String password;
  /**
   * 帐号状态(1.可用 2.不可用).
   */
  private Integer status;
  /**
   * 角色类型(1.普通用户 2.合作公司 3.管理员)
   */
  private Integer role;
  /**
   * 创建此账号的uid.
   */
  private Long parentUid;
  /**
   * 菜单权限(用,连接菜单id).
   */
  private String permission;
  /**
   * 备注.
   */
  private String remark;
  /**
   * 帐号创建时间.
   */
  @JSONField(format = Constant.DEFAULT_DATE_TIME_FORMAT)
  private Timestamp createTime;
  /**
   * 帐号最后更新时间.
   */
  @JSONField(format = Constant.DEFAULT_DATE_TIME_FORMAT)
  private Timestamp updateTime;
  /**
   * 帐号最后登录时间.
   */
  @JSONField(format = Constant.DEFAULT_DATE_TIME_FORMAT)
  private Timestamp lastLoginTime;

  public Long getUid() {
    return uid;
  }

  public void setUid(Long uid) {
    this.uid = uid;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public Integer getStatus() {
    return status;
  }

  public void setStatus(Integer status) {
    this.status = status;
  }

  public Integer getRole() {
    return role;
  }

  public void setRole(Integer role) {
    this.role = role;
  }

  public Long getParentUid() {
    return parentUid;
  }

  public void setParentUid(Long parentUid) {
    this.parentUid = parentUid;
  }

  public String getPermission() {
    return permission;
  }

  public void setPermission(String permission) {
    this.permission = permission;
  }

  public String getRemark() {
    return remark;
  }

  public void setRemark(String remark) {
    this.remark = remark;
  }

  public Timestamp getCreateTime() {
    return createTime;
  }

  public void setCreateTime(Timestamp createTime) {
    this.createTime = createTime;
  }

  public Timestamp getUpdateTime() {
    return updateTime;
  }

  public void setUpdateTime(Timestamp updateTime) {
    this.updateTime = updateTime;
  }

  public Timestamp getLastLoginTime() {
    return lastLoginTime;
  }

  public void setLastLoginTime(Timestamp lastLoginTime) {
    this.lastLoginTime = lastLoginTime;
  }
}
