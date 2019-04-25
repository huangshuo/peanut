package com.peanut.entity.pojo;

import com.alibaba.fastjson.annotation.JSONField;
import com.peanut.common.Constant;

import java.sql.Date;

/**
 * description: 小说信息实体类.
 *
 * @author Doc10th
 * @date 2019-04-23
 * @see com.peanut.entity.pojo
 * @since 1.0
 */
public class Novel {

  /**
   * 小说ID
   */
  private Integer novelId;

  /**
   * 小说名称
   */
  private String novelName;

  /**
   * 小说类型ID
   */
  private Integer typeId;

  /**
   * 小说简介
   */
  private String description;

  /**
   * 小说封面URL
   */
  private String coverUrl;

  /**
   * 作者名
   */
  private String authorName;

  /**
   * 最新章节 格式："第三千二百章 这个斗帝不太萌"
   */
  private Integer lastUpdatedChapterId;

  /**
   * 最后更新日期
   */
  @JSONField(format = Constant.DEFAULT_DATE_FORMAT)
  private Date updateDate;

  /**
   * 读者统计
   */
  private Integer readCount;

  /**
   * 字数统计
   */
  private Integer wordCount;

  public Integer getNovelId() {
    return novelId;
  }

  public void setNovelId(Integer novelId) {
    this.novelId = novelId;
  }

  public String getNovelName() {
    return novelName;
  }

  public void setNovelName(String novelName) {
    this.novelName = novelName;
  }

  public Integer getTypeId() {
    return typeId;
  }

  public void setTypeId(Integer typeId) {
    this.typeId = typeId;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getCoverUrl() {
    return coverUrl;
  }

  public void setCoverUrl(String coverUrl) {
    this.coverUrl = coverUrl;
  }

  public String getAuthorName() {
    return authorName;
  }

  public void setAuthorName(String authorName) {
    this.authorName = authorName;
  }

  public Integer getLastUpdatedChapterId() {
    return lastUpdatedChapterId;
  }

  public void setLastUpdatedChapterId(Integer lastUpdatedChapterId) {
    this.lastUpdatedChapterId = lastUpdatedChapterId;
  }

  public Date getUpdateDate() {
    return updateDate;
  }

  public void setUpdateDate(Date updateDate) {
    this.updateDate = updateDate;
  }

  public Integer getReadCount() {
    return readCount;
  }

  public void setReadCount(Integer readCount) {
    this.readCount = readCount;
  }

  public Integer getWordCount() {
    return wordCount;
  }

  public void setWordCount(Integer wordCount) {
    this.wordCount = wordCount;
  }

}
