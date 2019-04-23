package com.peanut.entity.pojo.video;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * description: 视频详情信息.
 *
 * @author zhaomaomao
 * @date 2019-04-22
 * @see com.peanut.entity.pojo
 * @since 1.0
 */
public class VideoDetail {
  @JSONField(serialize = false)
  private Long id;
  private String fdncode;
  private String descinfo;
  private String title;
  private Integer length;
  private String vid;
  private Long fid;

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getFdncode() {
    return fdncode;
  }

  public void setFdncode(String fdncode) {
    this.fdncode = fdncode;
  }

  public String getDescinfo() {
    return descinfo;
  }

  public void setDescinfo(String descinfo) {
    this.descinfo = descinfo;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public Integer getLength() {
    return length;
  }

  public void setLength(Integer length) {
    this.length = length;
  }

  public String getVid() {
    return vid;
  }

  public void setVid(String vid) {
    this.vid = vid;
  }

  public Long getFid() {
    return fid;
  }

  public void setFid(Long fid) {
    this.fid = fid;
  }
}
