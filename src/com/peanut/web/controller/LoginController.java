package com.peanut.web.controller;

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
 * description: 密码登录.
 *
 * @author huangs
 * @date 2019-04-21
 * @see com.peanut.web.controller
 * @since 1.0
 */
@WebServlet(name = "login", urlPatterns = "/login/normal")
public class LoginController extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    String username = req.getParameter("username");
    String password = req.getParameter("password");
    ServerResponse serverResponse = new UserServiceImpl().login(username, password);
    PrintWriter printWriter = resp.getWriter();
    printWriter.println(JSON.toJSONString(serverResponse));
    printWriter.flush();
    printWriter.close();
  }}
