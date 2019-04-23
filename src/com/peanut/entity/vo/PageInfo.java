package com.peanut.entity.vo;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;
import java.util.List;

/**
 * description: 分页信息类.
 *
 * @author huangs
 * @date 2019-04-22
 * @see com.peanut.entity.vo
 * @since 1.0
 */
public class PageInfo<T> implements Serializable {
  /**
   * 页码.
   */
  @JSONField(ordinal = 1)
  private int pageNum;
  /**
   * 分页大小.
   */
  @JSONField(ordinal = 2)
  private int pageSize;
  /**
   * 总页数.
   */
  @JSONField(ordinal = 3)
  private int totalPage;
  /**
   * 数据总行数.
   */
  @JSONField(ordinal = 4)
  private int totalRow;
  /**
   * 是否是第一页
   */
  @JSONField(ordinal = 5)
  private boolean isFirstPage;
  /**
   * 是否是最后一页
   */
  @JSONField(ordinal = 6)
  private boolean isLastPage;
  /**
   * 数据list.
   */
  @JSONField(ordinal = 7)
  private List<T> pageData;

  private PageInfo(Builder<T> pageInfoBuilder) {
    this.pageNum = pageInfoBuilder.pageNum;
    this.pageSize = pageInfoBuilder.pageSize;
    this.totalPage = pageInfoBuilder.totalPage;
    this.totalRow = pageInfoBuilder.totalRow;
    this.isFirstPage = pageInfoBuilder.isFirstPage;
    this.isLastPage = pageInfoBuilder.isLastPage;
    this.pageData = pageInfoBuilder.pageData;
  }

  /**
   * Builder模式
   * @param <T>
   */
  public static class Builder<T> {
    private int pageNum;
    private int pageSize;
    private int totalPage;
    private int totalRow;
    private boolean isFirstPage;
    private boolean isLastPage;
    private List<T> pageData;

    public Builder(int pageNum, int pageSize) {
      this.pageNum = pageNum;
      this.pageSize = pageSize;
    }

    public Builder<T> totalPage(int totalPage) {
      this.totalPage = totalPage;
      return this;
    }

    public Builder<T> totalRow(int totalRow) {
      this.totalRow = totalRow;
      return this;
    }

    public Builder<T> isFirstPage(boolean isFirstPage) {
      this.isFirstPage = isFirstPage;
      return this;
    }

    public Builder<T> isLastPage(boolean isLastPage) {
      this.isLastPage = isLastPage;
      return this;
    }

    public Builder<T> pageData(List<T> pageData) {
      this.pageData = pageData;
      return this;
    }

    public PageInfo<T> build() {
      return new PageInfo<>(this);
    }
  }

  public int getPageNum() {
    return pageNum;
  }

  public int getPageSize() {
    return pageSize;
  }

  public int getTotalPage() {
    return totalPage;
  }

  public int getTotalRow() {
    return totalRow;
  }

  public List<T> getPageData() {
    return pageData;
  }

  public boolean isFirstPage() {
    return isFirstPage;
  }

  public boolean isLastPage() {
    return isLastPage;
  }
}
