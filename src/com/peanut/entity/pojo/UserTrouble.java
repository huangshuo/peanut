package com.peanut.entity.pojo;

/**
 * description: 反馈问题实体类.
 *
 * @author huangs
 * @date 2019-04-22
 * @see com.peanut.entity.pojo
 * @since 1.0
 */
public class UserTrouble {

  /**
   * 问题id.
   */
  private Integer id;
  /**
   * 问题描述.
   */
  private String desc;

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getDesc() {
    return desc;
  }

  public void setDesc(String desc) {
    this.desc = desc;
  }
}
