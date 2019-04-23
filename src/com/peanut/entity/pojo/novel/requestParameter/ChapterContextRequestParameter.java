package com.peanut.entity.pojo.novel.requestParameter;

/**
 * description: 章节内容参数实体类.
 *
 * @author Doc10th
 * @date 2019-04-23
 * @see com.peanut.entity.pojo.novel
 * @since 1.0
 */
public class ChapterContextRequestParameter {

	/**
	 * 用户ID
	 */
	private Integer userId;

	/**
	 * 小说ID
	 */
	private Integer novelId;

	/**
	 * 章节排号
	 */
	private Integer sortId;

	/**
	 * user 是否为VIP
	 */
	private Integer isVip;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getNovelId() {
		return novelId;
	}

	public void setNovelId(Integer novelId) {
		this.novelId = novelId;
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
}
