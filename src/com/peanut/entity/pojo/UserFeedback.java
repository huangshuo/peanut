package com.peanut.entity.pojo;

/**
 * description: 用户反馈信息实体类.
 *
 * @author huangs
 * @date 2019-04-22
 * @see com.peanut.entity.pojo
 * @since 1.0
 */
public class UserFeedback {

  /**
   * 反馈id.
   */
  private Integer id;
  /**
   * 用户id.
   */
  private Long uid;
  /**
   * 问题列表(,连接问题id)
   */
  private String troubleList;
  /**
   * 用户建议
   */
  private String suggestion;
  /**
   * 用户联系方式
   */
  private String contact;
  /**
   * 用户平台(1.IOS 2.Android)
   */
  private Integer platform;

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public Long getUid() {
    return uid;
  }

  public void setUid(Long uid) {
    this.uid = uid;
  }

  public String getTroubleList() {
    return troubleList;
  }

  public void setTroubleList(String troubleList) {
    this.troubleList = troubleList;
  }

  public String getSuggestion() {
    return suggestion;
  }

  public void setSuggestion(String suggestion) {
    this.suggestion = suggestion;
  }

  public String getContact() {
    return contact;
  }

  public void setContact(String contact) {
    this.contact = contact;
  }

  public Integer getPlatform() {
    return platform;
  }

  public void setPlatform(Integer platform) {
    this.platform = platform;
  }
}
