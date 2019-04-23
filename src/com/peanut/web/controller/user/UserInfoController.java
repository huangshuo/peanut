package com.peanut.web.controller.user;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServerResponse;
import com.peanut.web.service.impl.UserServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * description: 获取个人信息.
 *
 * @author huangs
 * @date 2019-04-22
 * @see com.peanut.web.controller
 * @since 1.0
 */
@WebServlet(name = "userInfo", urlPatterns = "/user/info")
public class UserInfoController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    PrintWriter printWriter = resp.getWriter();
    long uid = Long.parseLong(req.getParameter("uid"));
    ServerResponse serverResponse = new UserServiceImpl().getUserInfo(uid);
    printWriter.println(JSON.toJSONString(serverResponse));
    printWriter.flush();
    printWriter.close();
  }
}
