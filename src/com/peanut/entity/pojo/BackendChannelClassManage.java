package com.peanut.entity.pojo;

import java.sql.Timestamp;

/**
 * description: .
 *
 * @author JAVASM
 * @date 2019-04-30
 * @see com.peanut.entity.pojo
 * @since 1.0
 */
public class BackendChannelClassManage {
  private Long id;
  private String className;
  private Integer labelOrder;
  private String fname;
  private Timestamp createDate;

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getClassName() {
    return className;
  }

  public void setClassName(String className) {
    this.className = className;
  }

  public Integer getLabelOrder() {
    return labelOrder;
  }

  public void setLabelOrder(Integer labelOrder) {
    this.labelOrder = labelOrder;
  }

  public String getFname() {
    return fname;
  }

  public void setFname(String fname) {
    this.fname = fname;
  }

  public Timestamp getCreateDate() {
    return createDate;
  }

  public void setCreateDate(Timestamp createDate) {
    this.createDate = createDate;
  }
}
