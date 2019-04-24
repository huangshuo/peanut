package com.peanut.common.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * description: MD5加密工具类.
 *
 * @author huangs
 * @date 2019-04-21
 * @see com.peanut.common.util
 * @since 1.0
 */
public final class Md5Util {

  private Md5Util() {
  }

  /**
   * 获取加密后的密码
   *
   * @param originPassword 原始密码
   * @return String
   */
  public static String encrypt(String originPassword) {
    // MD5加盐加密
    return md5Encrypt(md5Encrypt(originPassword) + PropertyUtil.getProperty(PropertyUtil.MD5_SALT));
  }

  /**
   * 校验密码是否正确
   *
   * @param originPassword    原始密码
   * @param encryptedPassword 加密后的密码
   * @return boolean
   */
  public static boolean verify(String originPassword, String encryptedPassword) {
    return encrypt(originPassword).equalsIgnoreCase(encryptedPassword);
  }

  private static String md5Encrypt(String originString) {
    String encryptedString = "";
    try {
      MessageDigest messageDigest = MessageDigest.getInstance("MD5");
      messageDigest.update(originString.getBytes());
      byte[] by = messageDigest.digest();
      BigInteger big = new BigInteger(1, by);
      encryptedString = big.toString(16);
    } catch (NoSuchAlgorithmException e) {
      System.err.println(e.getMessage());
    }
    return encryptedString.toUpperCase();
  }
}
