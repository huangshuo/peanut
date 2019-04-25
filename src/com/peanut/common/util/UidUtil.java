package com.peanut.common.util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;
import java.util.Random;

/**
 * description: uid工具类.
 *
 * @author huangs
 * @date 2019-04-25
 * @see com.peanut.common.util
 * @since 1.0
 */
public final class UidUtil {

  private UidUtil() {
  }

  public static long getUid() {
    DateTimeFormatter dateTimeFormatter = new DateTimeFormatterBuilder()
        .appendValue(ChronoField.YEAR_OF_ERA)
        .appendValue(ChronoField.SECOND_OF_DAY, 5)
        .toFormatter();
    String prefix = LocalDateTime.now().format(dateTimeFormatter).substring(2);
    int suffix = new Random().nextInt(899) + 100;
    return Long.parseLong(prefix + suffix);
  }
}
