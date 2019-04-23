package com.peanut.entity.pojo.novel;

/**
 * description: 小说分类信息.
 *
 * @author Doc10th
 * @date 2019-04-23
 * @see com.peanut.entity.pojo
 * @since 1.0
 */
public class NovelType {

	/**
	 * 分类ID
	 */
	private Long typeId;

	/**
	 * 分类名称
	 */
	private String typeName;

	/**
	 * 分类描述
	 */
	private String typeDescription;

	/**
	 * 此分类小说数
	 */
	private Long novelCount;

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

	public String getTypeDescription() {
		return typeDescription;
	}

	public void setTypeDescription(String typeDescription) {
		this.typeDescription = typeDescription;
	}

	public Long getNovelCount() {
		return novelCount;
	}

	public void setNovelCount(Long novelCount) {
		this.novelCount = novelCount;
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
		return "NovelType{" +
				"typeId=" + typeId +
				", typeName='" + typeName + '\'' +
				", typeDescription='" + typeDescription + '\'' +
				", novelCount=" + novelCount +
				'}';
	}
}
