package com.peanut.entity.pojo;

/**
 * description: 后台小说一级分类实体类.
 *
 * @author Doc10th
 * @date 2019-04-26
 * @see com.peanut.entity.pojo
 * @since 1.0
 */
public class BackendNovelTypePrimary {

	private Long typeId;
	private String typeName;

	public Long getTypeId() {
		return typeId;
	}

	public void setTypeId(Long typeId) {
		this.typeId = typeId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	@Override
	public String toString() {
		return "BackendNovelTypePrimary{" +
				"typeId=" + typeId +
				", typeName='" + typeName + '\'' +
				'}';
	}
}
