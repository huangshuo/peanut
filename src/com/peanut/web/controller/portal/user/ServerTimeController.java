package com.peanut.web.controller.portal.user;

import com.alibaba.fastjson.JSON;
import com.peanut.common.Constant;
import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServletUrl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * description: 获取服务器时间.
 *
 * @author huangs
 * @date 2019-04-22
 * @see com.peanut.web.controller
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Portal.SERVER_TIME)
public class ServerTimeController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    PrintWriter printWriter = resp.getWriter();
    Map<String, String> now = new HashMap<>(16);
    now.put("time", JSON.toJSONStringWithDateFormat(new Date(new java.util.Date().getTime()), Constant.DEFAULT_DATE_TIME_FORMAT));
    ServerResponse serverResponse = ServerResponse.successWithData(now);
    printWriter.println(JSON.toJSONString(serverResponse));
    printWriter.flush();
    printWriter.close();
  }
}
