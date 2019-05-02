package com.peanut.common.util;

/**
 * description: 文件工具类.
 *
 * @author huangs
 * @date 2019-04-18
 * @see com.peanut.common.util
 * @since 1.0
 */
public final class FileUtil {

  private FileUtil() {}

  /**
   * 拼接文件名
   * @param fileName 原始文件名
   * @return 拼接后的文件名
   */
  public static String spliceFileName(String fileName) {
    int dotIndex = fileName.lastIndexOf(".");
    String prefix = fileName.substring(0, dotIndex);
    String suffix = fileName.substring(dotIndex);
    return prefix + "_" + System.currentTimeMillis() + suffix;
  }
}
