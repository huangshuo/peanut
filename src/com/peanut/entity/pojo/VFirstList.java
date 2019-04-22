package com.peanut.entity.pojo;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;

/**
 * description:视频一级目录 .
 *
 * @author JAVASM
 * @date 2019-04-22
 * @see com.peanut.entity.pojo
 * @since 1.0
 */
public class VFirstList implements Serializable {

  @JSONField(serialize = false)
  private Long id;
  private String icon;
  private String name;
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

  public VFirstList(String icon, String name, Long cid) {
    this.icon = icon;
    this.name = name;
    this.cid = cid;
  }

  public VFirstList() {
  }
}
