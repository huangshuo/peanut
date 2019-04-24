package com.peanut.entity.pojo;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;

/**
 * description:根据二级目录分页显示 .
 *
 * @author zhaomaomao
 * @date 2019-04-22
 * @see com.peanut.entity.pojo
 * @since 1.0
 */
public class VideoPage implements Serializable {

  /**
   * 主键id.
   */
  @JSONField(serialize = false)
  private Long id;
  /**
   * 视频图片地址.
   */
  private String imgA;
  /**
   * 视频图片地址.
   */
  private String imgB;
  /**
   * 视频图片地址.
   */
  private String imgC;
  /**
   * 视频图片地址.
   */
  private String imgD;
  /**
   * 是否完结(1.完结 2.未完结)
   */
  private Integer isclose;
  /**
   * 视频标题.
   */
  private String title;
  /**
   * 视频类型(1.单片 2.剧集)
   */
  private Integer attr;
  /**
   * 当前播放的集数.
   */
  private Integer epcnt;
  /**
   * 视频编号.
   */
  private String vid;
  /**
   * 总集数.
   */
  private Integer eptotal;
  /**
   * 对应二级目录编号.
   */
  private Long fid;

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getImgA() {
    return imgA;
  }

  public void setImgA(String imgA) {
    this.imgA = imgA;
  }

  public String getImgB() {
    return imgB;
  }

  public void setImgB(String imgB) {
    this.imgB = imgB;
  }

  public Integer getIsclose() {
    return isclose;
  }

  public void setIsclose(Integer isclose) {
    this.isclose = isclose;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public Integer getAttr() {
    return attr;
  }

  public void setAttr(Integer attr) {
    this.attr = attr;
  }

  public Integer getEpcnt() {
    return epcnt;
  }

  public void setEpcnt(Integer epcnt) {
    this.epcnt = epcnt;
  }

  public String getVid() {
    return vid;
  }

  public void setVid(String vid) {
    this.vid = vid;
  }

  public Integer getEptotal() {
    return eptotal;
  }

  public void setEptotal(Integer eptotal) {
    this.eptotal = eptotal;
  }

  public String getImgC() {
    return imgC;
  }

  public void setImgC(String imgC) {
    this.imgC = imgC;
  }

  public String getImgD() {
    return imgD;
  }

  public void setImgD(String imgD) {
    this.imgD = imgD;
  }

  public Long getFid() {
    return fid;
  }

  public void setFid(Long fid) {
    this.fid = fid;
  }
}
