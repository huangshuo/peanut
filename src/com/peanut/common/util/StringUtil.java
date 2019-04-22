package com.peanut.common.util;

/**
 * description: 字符串工具类.
 *
 * @author huangs
 * @date 2019-04-22
 * @see com.peanut.common.util
 * @since 1.0
 */
public final class StringUtil {

  private StringUtil() {}

  /**
   * 驼峰式转换为下划线
   * @param camelCaseString 驼峰式字符串
   * @return String
   */
  public static String convertCamelCaseToSnakeCase(String camelCaseString) {
    StringBuilder stringBuilder = new StringBuilder(camelCaseString);
    for (int i = 0; i < stringBuilder.length(); i++) {
      // 大写字母前插入下划线
      String character = String.valueOf(stringBuilder.charAt(i));
      if (character.equals(character.toUpperCase())) {
        stringBuilder.replace(i, i + 1, character.toLowerCase());
        stringBuilder.insert(i, "_");
      }
    }
    return stringBuilder.toString();
  }
}
