package com.peanut.entity.pojo;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * description:视频二级目录 .
 *
 * @author zhaomaomao
 * @date 2019-04-22
 * @see com.peanut.entity.pojo
 * @since 1.0
 */
public class VideoSecondList {

  /**
   * 主键id.
   */
  @JSONField(serialize = false)
  private Long id;
  /**
   * 图片地址.
   */
  private String icon;
  /**
   * 二级目录名称.
   */
  private String name;
  /**
   * 二级目录编号.
   */
  private Long cid;
  /**
   * 对应的一级目录的编号.
   */
  private Long fid;

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getIcon() {
    return icon;
  }

  public void setIcon(String icon) {
    this.icon = icon;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Long getCid() {
    return cid;
  }

  public void setCid(Long cid) {
    this.cid = cid;
  }

  public Long getFid() {
    return fid;
  }

  public void setFid(Long fid) {
    this.fid = fid;
  }
}
