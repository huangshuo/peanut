package com.peanut.common;

/**
 * description: 常量类.
 *
 * @author huangs
 * @date 2019-04-24
 * @see com.peanut.common
 * @since 1.0
 */
public class Constant {
  /**
   * session中user对象的key
   */
  public static final String SESSION_USER_KEY = "session_user_key";
  /**
   * 默认时间序列化格式
   */
  public static final String DEFAULT_DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
  /**
   * 默认日期序列化格式
   */
  public static final String DEFAULT_DATE_FORMAT = "yyyy-MM-dd";
  /**
   * 字数统计汉字匹配模式
   */
  public static final String WORD_COUNT_PATTERN_CHINESE_CHARACTER = "([\u4e00-\u9fa5])";
  /**
   * 字数统计结果的key
   */
  public static final String WORD_COUNT_MAP_CHARACTER_KEY = "word_count_character_key";

}
