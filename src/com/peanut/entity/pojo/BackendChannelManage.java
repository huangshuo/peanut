package com.peanut.entity.pojo;

import com.alibaba.fastjson.annotation.JSONField;

import java.sql.Timestamp;


/**
 * description: .
 *
 * @author JAVASM
 * @date 2019-04-26
 * @see com.peanut.entity.pojo
 * @since 1.0
 */
public class BackendChannelManage {

  private Long id;
  private String firstClass;
  private String secondClass;
  private String channelNum;
  private String channelDownloadLink;
  private String productName;
  private String showName;
  private Timestamp createDate;

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getFirstClass() {
    return firstClass;
  }

  public void setFirstClass(String firstClass) {
    this.firstClass = firstClass;
  }

  public String getSecondClass() {
    return secondClass;
  }

  public void setSecondClass(String secondClass) {
    this.secondClass = secondClass;
  }

  public String getChannelNum() {
    return channelNum;
  }

  public void setChannelNum(String channelNum) {
    this.channelNum = channelNum;
  }

  public String getChannelDownloadLink() {
    return channelDownloadLink;
  }

  public void setChannelDownloadLink(String channelDownloadLink) {
    this.channelDownloadLink = channelDownloadLink;
  }

  public String getProductName() {
    return productName;
  }

  public void setProductName(String productName) {
    this.productName = productName;
  }

  public String getShowName() {
    return showName;
  }

  public void setShowName(String showName) {
    this.showName = showName;
  }

  public Timestamp getCreateDate() {
    return createDate;
  }

  public void setCreateDate(Timestamp createDate) {
    this.createDate = createDate;
  }
}
