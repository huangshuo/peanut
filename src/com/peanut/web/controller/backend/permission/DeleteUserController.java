package com.peanut.web.controller.backend.permission;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServletUrl;
import com.peanut.web.service.impl.PermissionServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * description: 删除帐号.
 *
 * @author huangs
 * @date 2019-04-25
 * @see com.peanut.web.controller.backend.permission
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Backend.DELETE_USER)
public class DeleteUserController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    String username = req.getParameter("username");
    ServerResponse serverResponse = new PermissionServiceImpl().deleteUserByUsername(username);
    PrintWriter printWriter = resp.getWriter();
    printWriter.println(JSON.toJSONString(serverResponse));
    printWriter.flush();
    printWriter.close();
  }

  @Override
  protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    super.service(req, resp);
  }
}
