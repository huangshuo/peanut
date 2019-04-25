package com.peanut.entity.pojo;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * description:菜单管理 .
 *
 * @author JAVASM
 * @date 2019-04-25
 * @see com.peanut.entity.pojo
 * @since 1.0
 */
public class MenuManage {
  /*
  * 菜单管理主键id
  * */
  private Long id;
  /*
  * 菜单名
  * */
  private String mname;
  /*
  * 菜单父id
  * */
  private Integer fid;
  /*
   *菜单是否显示
   * */
  private Integer isShow;
  /*
   *菜单图标
   * */
  private String icon;

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getMname() {
    return mname;
  }

  public void setMname(String mname) {
    this.mname = mname;
  }

  public Integer getFid() {
    return fid;
  }

  public void setFid(Integer fid) {
    this.fid = fid;
  }

  public Integer getIsShow() {
    return isShow;
  }

  public void setIsShow(Integer isShow) {
    this.isShow = isShow;
  }

  public String getIcon() {
    return icon;
  }

  public void setIcon(String icon) {
    this.icon = icon;
  }
}
