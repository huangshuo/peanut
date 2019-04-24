package com.peanut.entity.pojo.novel;

import com.alibaba.fastjson.annotation.JSONField;

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
	@JSONField(format = "yyyy-MM-dd")
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
		return "Novel{" +
				"novelId=" + novelId +
				", novelName='" + novelName + '\'' +
				", description='" + description + '\'' +
				", coverUrl='" + coverUrl + '\'' +
				", authorName='" + authorName + '\'' +
				", lastUpdatedChapterId='" + lastUpdatedChapterId + '\'' +
				", updateDate=" + updateDate +
				", readCount=" + readCount +
				", wordCount=" + wordCount +
				'}';
	}
}
