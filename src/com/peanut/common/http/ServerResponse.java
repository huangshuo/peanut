package com.peanut.common.http;

import com.alibaba.fastjson.annotation.JSONField;

import java.io.Serializable;

/**
 * description: 服务器公共响应类.
 *
 * @author huangs
 * @date 2019-04-21
 * @see com.peanut.common.http
 * @since 1.0
 */
public class ServerResponse<T> implements Serializable {
  /**
   * 响应状态码
   */
  @JSONField(ordinal = 1)
  private int code;
  /**
   * 响应信息
   */
  @JSONField(ordinal = 2)
  private String msg;
  /**
   * 响应数据
   */
  @JSONField(ordinal = 3)
  private T data;

  private ServerResponse(int code, String msg) {
    this.code = code;
    this.msg = msg;
  }

  private ServerResponse(int code, String msg, T data) {
    this.code = code;
    this.msg = msg;
    this.data = data;
  }

  public static <T> ServerResponse<T> success() {
    return new ServerResponse<>(ServerStatusCodeEnum.SUCCESS.getCode(), ServerStatusCodeEnum.SUCCESS.getMsg());
  }

  public static <T> ServerResponse<T> successWithMsg(String msg) {
    return new ServerResponse<>(ServerStatusCodeEnum.SUCCESS.getCode(), msg);
  }

  public static <T> ServerResponse<T> successWithData(T data) {
    return new ServerResponse<>(ServerStatusCodeEnum.SUCCESS.getCode(), ServerStatusCodeEnum.SUCCESS.getMsg(), data);
  }

  public static <T> ServerResponse<T> successWithMsgData(String msg, T data) {
    return new ServerResponse<>(ServerStatusCodeEnum.SUCCESS.getCode(), msg, data);
  }

  public static <T> ServerResponse<T> failWithMsg(int code, String msg) {
    return new ServerResponse<>(code, msg);
  }

  public static <T> ServerResponse<T> failWithMsgData(int code, String msg, T data) {
    return new ServerResponse<>(code, msg, data);
  }

  /**
   * 响应是否成功
   *
   * @return boolean
   */
  @JSONField(serialize = false)
  public boolean isSuccess() {
    return code == ServerStatusCodeEnum.SUCCESS.getCode();
  }

  public int getCode() {
    return code;
  }

  public String getMsg() {
    return msg;
  }

  public T getData() {
    return data;
  }
}
