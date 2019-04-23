package com.peanut.entity.pojo.video;

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
  @JSONField(serialize = false)
  private Long id;
  private String imgA;
  private String imgB;
  private Integer isclose;
  private String title;
  private Integer attr;
  private Integer epcnt;
  private String vid;
  private Integer eptotal;
  private String  imgC;
  private String imgD;
  private Long cid;

  private Long fid;
  //分页属性



//  private PageInfo pageInfo;

//  public PageInfo getPageInfo() {
//    return pageInfo;
//  }
//
//  public void setPageInfo(PageInfo pageInfo) {
//    this.pageInfo = pageInfo;
//  }


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
