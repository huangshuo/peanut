package com.peanut.entity.pojo;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;

/**
 * description:视频一级目录 .
 *
 * @author zhaomaomao
 * @date 2019-04-22
 * @see com.peanut.entity.pojo
 * @since 1.0
 */
public class VideoFirstList implements Serializable {

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
   * 一级目录名.
   */
  private String name;
  /**
   * 一级目录编号.
   */
  private Long cid;

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

}
