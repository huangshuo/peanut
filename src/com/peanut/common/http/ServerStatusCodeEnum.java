package com.peanut.common.http;

/**
 * description: 服务器响应状态枚举类.
 *
 * @author huangs
 * @date 2019-04-21
 * @see com.peanut.common.http
 * @since 1.0
 */
public enum ServerStatusCodeEnum {
  // 成功
  SUCCESS(200, "操作成功");

  private int code;
  private String msg;

  ServerStatusCodeEnum(int code, String msg) {
    this.code = code;
    this.msg = msg;
  }

  public int getCode() {
    return code;
  }

  public String getMsg() {
    return msg;
  }
}