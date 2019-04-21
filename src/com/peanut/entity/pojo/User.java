package com.peanut.entity.pojo;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;
import java.sql.Date;

/**
 * description: 用户信息实体类.
 *
 * @author huangs
 * @date 2019-04-21
 * @see com.peanut.entity.pojo
 * @since 1.0
 */
public class User implements Serializable {

  /**
   * 用户id.
   */
  private Long uid;
  /**
   * 用户名.
   */
  private String username;
  /**
   * 用户密码(不序列化此字段).
   */
  @JSONField(serialize = false)
  private String password;
  /**
   * 用户头像大图url.
   */
  private String headPic;
  /**
   * 用户头像缩略图url.
   */
  private String headPicThumb;
  /**
   * 用户个性签名.
   */
  private String des;
  /**
   * 用户性别.
   */
  private Integer sex;
  /**
   * 用户生日.
   */
  private Date birthday;
  /**
   * 用户爱好.
   */
  private String avatarColor;
  /**
   * 用户手机号.
   */
  private String phone;
  /**
   * 用户等级.
   */
  private Integer grade;

  public Long getUid() {
    return uid;
  }

  public void setUid(Long uid) {
    this.uid = uid;
  }

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getHeadPic() {
    return headPic;
  }

  public void setHeadPic(String headPic) {
    this.headPic = headPic;
  }

  public String getHeadPicThumb() {
    return headPicThumb;
  }

  public void setHeadPicThumb(String headPicThumb) {
    this.headPicThumb = headPicThumb;
  }

  public String getDes() {
    return des;
  }

  public void setDes(String des) {
    this.des = des;
  }

  public Integer getSex() {
    return sex;
  }

  public void setSex(Integer sex) {
    this.sex = sex;
  }

  public Date getBirthday() {
    return birthday;
  }

  public void setBirthday(Date birthday) {
    this.birthday = birthday;
  }

  public String getAvatarColor() {
    return avatarColor;
  }

  public void setAvatarColor(String avatarColor) {
    this.avatarColor = avatarColor;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public Integer getGrade() {
    return grade;
  }

  public void setGrade(Integer grade) {
    this.grade = grade;
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
    return "User{" +
        "uid=" + uid +
        ", username='" + username + '\'' +
        ", headPic='" + headPic + '\'' +
        ", headPicThumb='" + headPicThumb + '\'' +
        ", des='" + des + '\'' +
        ", sex=" + sex +
        ", birthday=" + birthday +
        ", avatarColor='" + avatarColor + '\'' +
        ", phone='" + phone + '\'' +
        ", grade=" + grade +
        '}';
  }
}
