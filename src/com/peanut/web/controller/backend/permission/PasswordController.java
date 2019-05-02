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
 * description: 修改密码.
 *
 * @author huangs
 * @date 2019-05-02
 * @see com.peanut.web.controller.backend.permission
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Backend.PASSWORD)
public class PasswordController extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    String originPassword = req.getParameter("originPassword");
    String newPassword = req.getParameter("newPassword");
    long uid = Long.parseLong(req.getParameter("uid"));
    ServerResponse serverResponse = new PermissionServiceImpl().changePassword(uid, originPassword, newPassword);
    PrintWriter printWriter = resp.getWriter();
    printWriter.println(JSON.toJSONString(serverResponse));
    printWriter.flush();
    printWriter.close();
  }
}
