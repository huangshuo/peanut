package com.peanut.entity.pojo;

/**
 * description: 小说分类信息.
 *
 * @author Doc10th
 * @date 2019-04-23
 * @see com.peanut.entity.pojo
 * @since 1.0
 */
public class NovelType {

  /**
   * 分类ID
   */
  private Integer typeId;

  /**
   * 分类名称
   */
  private String typeName;

  /**
   * 分类描述
   */
  private String typeDescription;

  /**
   * 此分类小说数
   */
  private Integer novelCount;

  public Integer getTypeId() {
    return typeId;
  }

  public void setTypeId(Integer typeId) {
    this.typeId = typeId;
  }

  public String getTypeName() {
    return typeName;
  }

  public void setTypeName(String typeName) {
    this.typeName = typeName;
  }

  public String getTypeDescription() {
    return typeDescription;
  }

  public void setTypeDescription(String typeDescription) {
    this.typeDescription = typeDescription;
  }

  public Integer getNovelCount() {
    return novelCount;
  }

  public void setNovelCount(Integer novelCount) {
    this.novelCount = novelCount;
  }

}
