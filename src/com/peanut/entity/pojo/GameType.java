package com.peanut.entity.pojo;

import java.io.Serializable;

/**
 * description: 游戏类型实体类.
 *
 * @author huangs
 * @date 2019-04-23
 * @see com.peanut.entity.pojo
 * @since 1.0
 */
public class GameType implements Serializable {

  /**
   * 类型id.
   */
  private Integer id;
  /**
   * 类型名称.
   */
  private String typeName;

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public String getTypeName() {
    return typeName;
  }

  public void setTypeName(String typeName) {
    this.typeName = typeName;
  }
}
