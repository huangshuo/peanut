package com.peanut.entity.pojo;

import java.io.Serializable;
import java.sql.Timestamp;

/**
 * description: 游戏实体类.
 *
 * @author huangs
 * @date 2019-04-23
 * @see com.peanut.entity.pojo
 * @since 1.0
 */
public class Game implements Serializable {

  /**
   * 游戏id.
   */
  private Long gameId;
  /**
   * 游戏名称.
   */
  private String name;
  /**
   * 游戏标题.
   */
  private String title;
  /**
   * 推荐类型(1.普通 2.最新 3.精选)
   */
  private Integer recommendType;
  /**
   * 游戏分类id.
   */
  private Integer gameTypeId;
  /**
   * 游戏下载数量.
   */
  private Integer downloadCount;
  /**
   * 游戏大小(MB).
   */
  private Float gameSize;
  /**
   * 游戏图标url.
   */
  private String gameIcon;
  /**
   * 游戏详情图片url(用;拼接)
   */
  private String gamePictures;
  /**
   * 安卓版下载地址.
   */
  private String androidUrl;
  /**
   * ios版下载地址.
   */
  private String iosUrl;
  /**
   * 游戏平台类型(1.ios 2.android 3.所有)
   */
  private Integer platform;
  /**
   * 游戏状态(1.启用 2.下线)
   */
  private Integer gameStatus;
  /**
   * 游戏描述.
   */
  private String description;
  /**
   * 创建时间.
   */
  private Timestamp createTime;
  /**
   * 更新时间.
   */
  private Timestamp updateTime;

  public Long getGameId() {
    return gameId;
  }

  public void setGameId(Long gameId) {
    this.gameId = gameId;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public Integer getRecommendType() {
    return recommendType;
  }

  public void setRecommendType(Integer recommendType) {
    this.recommendType = recommendType;
  }

  public Integer getGameTypeId() {
    return gameTypeId;
  }

  public void setGameTypeId(Integer gameTypeId) {
    this.gameTypeId = gameTypeId;
  }

  public Integer getDownloadCount() {
    return downloadCount;
  }

  public void setDownloadCount(Integer downloadCount) {
    this.downloadCount = downloadCount;
  }

  public Float getGameSize() {
    return gameSize;
  }

  public void setGameSize(Float gameSize) {
    this.gameSize = gameSize;
  }

  public String getGameIcon() {
    return gameIcon;
  }

  public void setGameIcon(String gameIcon) {
    this.gameIcon = gameIcon;
  }

  public String getGamePictures() {
    return gamePictures;
  }

  public void setGamePictures(String gamePictures) {
    this.gamePictures = gamePictures;
  }

  public String getAndroidUrl() {
    return androidUrl;
  }

  public void setAndroidUrl(String androidUrl) {
    this.androidUrl = androidUrl;
  }

  public String getIosUrl() {
    return iosUrl;
  }

  public void setIosUrl(String iosUrl) {
    this.iosUrl = iosUrl;
  }

  public Integer getPlatform() {
    return platform;
  }

  public void setPlatform(Integer platform) {
    this.platform = platform;
  }

  public Integer getGameStatus() {
    return gameStatus;
  }

  public void setGameStatus(Integer gameStatus) {
    this.gameStatus = gameStatus;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public Timestamp getCreateTime() {
    return createTime;
  }

  public void setCreateTime(Timestamp createTime) {
    this.createTime = createTime;
  }

  public Timestamp getUpdateTime() {
    return updateTime;
  }

  public void setUpdateTime(Timestamp updateTime) {
    this.updateTime = updateTime;
  }
}
