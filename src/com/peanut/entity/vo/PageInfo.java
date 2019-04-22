package com.peanut.entity.vo;

import java.util.List;

/**
 * description: 分页信息类.
 *
 * @author huangs
 * @date 2019-04-22
 * @see com.peanut.entity.vo
 * @since 1.0
 */
public class PageInfo<T> {
  /**
   * 页码.
   */
  private int pageNum;
  /**
   * 分页大小.
   */
  private int pageSize;
  /**
   * 总页数.
   */
  private int totalPage;
  /**
   * 数据总行数.
   */
  private int totalRow;
  /**
   * 数据list.
   */
  private List<T> pageData;

  private PageInfo(Builder<T> pageInfoBuilder) {
    this.pageNum = pageInfoBuilder.pageNum;
    this.pageSize = pageInfoBuilder.pageSize;
    this.totalPage = pageInfoBuilder.totalPage;
    this.totalRow = pageInfoBuilder.totalRow;
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
    private List<T> pageData;

    public Builder(List<T> pageData) {
      this.pageData = pageData;
    }

    public Builder pageNum(int pageNum) {
      this.pageNum = pageNum;
      return this;
    }

    public Builder pageSize(int pageSize) {
      this.pageSize = pageSize;
      return this;
    }

    public Builder totalPage(int totalPage) {
      this.totalPage = totalPage;
      return this;
    }

    public Builder totalRow(int totalRow) {
      this.totalRow = totalRow;
      return this;
    }

    public PageInfo build() {
      return new PageInfo<>(this);
    }
  }

  @Override
  public String toString() {
    return "PageInfo{" +
        "pageNum=" + pageNum +
        ", pageSize=" + pageSize +
        ", totalPage=" + totalPage +
        ", totalRow=" + totalRow +
        ", pageData=" + pageData +
        '}';
  }
}
