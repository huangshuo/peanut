package com.peanut.entity.pojo;

/**
 * description: 后台小说信息实体类.
 *
 * @author Doc10th
 * @date 2019-04-26
 * @see com.peanut.entity.pojo
 * @since 1.0
 */
public class BackendNovel {
	private Long novelId;
	private String novelName;
	private String authorName;
	private Long secondaryTypeId;
	private Integer novelStatus;

	public Integer getNovelStatus() {
		return novelStatus;
	}

	public void setNovelStatus(Integer novelStatus) {
		this.novelStatus = novelStatus;
	}

	public Long getNovelId() {
		return novelId;
	}

	public void setNovelId(Long novelId) {
		this.novelId = novelId;
	}

	public String getNovelName() {
		return novelName;
	}

	public void setNovelName(String novelName) {
		this.novelName = novelName;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public Long getSecondaryTypeId() {
		return secondaryTypeId;
	}

	public void setSecondaryTypeId(Long secondaryTypeId) {
		this.secondaryTypeId = secondaryTypeId;
	}

	@Override
	public String toString() {
		return "BackendNovel{" +
				"novelId=" + novelId +
				", novelName='" + novelName + '\'' +
				", authorName='" + authorName + '\'' +
				", secondaryTypeId=" + secondaryTypeId +
				", novelStatus=" + novelStatus +
				'}';
	}
}
