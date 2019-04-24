package com.peanut.entity.pojo;

import java.math.BigDecimal;

/**
 * description: 小说章节信息实体类.
 *
 * @author Doc10th
 * @date 2019-04-23
 * @see com.peanut.entity.pojo
 * @since 1.0
 */
public class NovelChapter {

  /**
   * 章节ID
   */
  private Integer chapterId;

  /**
   * 章节名称
   */
  private String chapterName;

  /**
   * 小说ID
   */
  private Integer novelId;

  /**
   * 章节价格（￥）
   */
  private BigDecimal price;

  /**
   * 章节序号，即第几章
   */
  private Integer sortId;

  /**
   * 是否需要VIP
   */
  private Integer isVip;

  /**
   * 章节正文
   */
  private String text;

  public Integer getChapterId() {
    return chapterId;
  }

  public void setChapterId(Integer chapterId) {
    this.chapterId = chapterId;
  }

  public String getChapterName() {
    return chapterName;
  }

  public void setChapterName(String chapterName) {
    this.chapterName = chapterName;
  }

  public Integer getNovelId() {
    return novelId;
  }

  public void setNovelId(Integer novelId) {
    this.novelId = novelId;
  }

  public BigDecimal getPrice() {
    return price;
  }

  public void setPrice(BigDecimal price) {
    this.price = price;
  }

  public Integer getSortId() {
    return sortId;
  }

  public void setSortId(Integer sortId) {
    this.sortId = sortId;
  }

  public Integer getIsVip() {
    return isVip;
  }

  public void setIsVip(Integer isVip) {
    this.isVip = isVip;
  }

  public String getText() {
    return text;
  }

  public void setText(String text) {
    this.text = text;
  }

}
