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
	private Long userId;

	/**
	 * 小说ID
	 */
	private Long novelId;

	/**
	 * 章节排号
	 */
	private Integer sortId;

	/**
	 * user 是否为VIP
	 */
	private Integer isVip;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getNovelId() {
		return novelId;
	}

	public void setNovelId(Long novelId) {
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
