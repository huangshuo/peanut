package com.peanut.entity.pojo.novel;

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
	private Long chapterId;

	/**
	 * 章节名称
	 */
 	private String chapterName;

	/**
	 * 小说ID
	 */
	private Long novelId;

	/**
	 * 章节价格（￥）
	 */
	private BigDecimal price = BigDecimal.ZERO;

	/**
	 * 章节序号，即第几章
	 */
	private Integer sortId;

	/**
	 * 是否需要VIP
	 */
	private Integer isVip;

	public Long getChapterId() {
		return chapterId;
	}

	public void setChapterId(Long chapterId) {
		this.chapterId = chapterId;
	}

	public String getChapterName() {
		return chapterName;
	}

	public void setChapterName(String chapterName) {
		this.chapterName = chapterName;
	}

	public Long getNovelId() {
		return novelId;
	}

	public void setNovelId(Long novelId) {
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

	public Integer getVip() {
		return isVip;
	}

	public void setVip(Integer vip) {
		isVip = vip;
	}

	/**
	 * Returns a string representation of the object. In general, the
	 * {@code toString} method returns a string that
	 * "textually represents" this object. The result should
	 * be a concise but informative representation that is easy for a
	 * person to read.
	 * It is recommended that all subclasses override this method.
	 * <p>
	 * The {@code toString} method for class {@code Object}
	 * returns a string consisting of the name of the class of which the
	 * object is an instance, the at-sign character `{@code @}', and
	 * the unsigned hexadecimal representation of the hash code of the
	 * object. In other words, this method returns a string equal to the
	 * value of:
	 * <blockquote>
	 * <pre>
	 * getClass().getName() + '@' + Integer.toHexString(hashCode())
	 * </pre></blockquote>
	 *
	 * @return a string representation of the object.
	 */
	@Override
	public String toString() {
		return "NovelChapter{" +
				"chapterId=" + chapterId +
				", chapterName='" + chapterName + '\'' +
				", novelId=" + novelId +
				", price=" + price +
				", sortId=" + sortId +
				", isVip=" + isVip +
				'}';
	}

}
