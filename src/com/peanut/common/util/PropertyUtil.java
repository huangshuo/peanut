package com.peanut.common.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

/**
 * description: properties加载工具类.
 *
 * @author huangs
 * @date 2019-04-20
 * @see com.peanut.common.util
 * @since 1.0
 */
public final class PropertyUtil {

  public static final String PROPERTIES_PATH = "/config/project.properties";
  public static final String JDBC_URL = "jdbc.url";
  public static final String JDBC_USERNAME = "jdbc.username";
  public static final String JDBC_PASSWORD = "jdbc.password";
  public static final String JDBC_DRIVER = "jdbc.driver";
  public static final String MD5_SALT = "md5.salt";

  private PropertyUtil() {}

  private static Map<String, String> propertyMap = new HashMap<>();

  static {
    Properties properties = new Properties();
    try (InputStream inputStream = PropertyUtil.class.getResourceAsStream(PROPERTIES_PATH)) {
      properties.load(inputStream);
    } catch (IOException e) {
      e.printStackTrace();
    }
    for (String key : properties.stringPropertyNames()) {
      propertyMap.put(key, properties.getProperty(key));
    }
  }

  public static String getProperty(String property) {
    return propertyMap.get(property);
  }
}
