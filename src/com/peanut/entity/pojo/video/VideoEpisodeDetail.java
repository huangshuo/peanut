package com.peanut.entity.pojo.video;

import com.alibaba.fastjson.annotation.JSONField;

/**
 * description:视频单集信息 .
 *
 * @author zhaomaomao
 * @date 2019-04-22
 * @see com.peanut.entity.pojo
 * @since 1.0
 */
public class VideoEpisodeDetail {
  @JSONField(serialize = false)
  private Long id;
  private String vid;
  private Integer  num;
  private String fdncode;

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getVid() {
    return vid;
  }

  public void setVid(String vid) {
    this.vid = vid;
  }

  public Integer getNum() {
    return num;
  }

  public void setNum(Integer num) {
    this.num = num;
  }

  public String getFdncode() {
    return fdncode;
  }

  public void setFdncode(String fdncode) {
    this.fdncode = fdncode;
  }
}
