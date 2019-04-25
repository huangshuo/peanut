package com.peanut.web.controller.backend.permission;

import com.alibaba.fastjson.JSON;
import com.peanut.common.Constant;
import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServletUrl;
import com.peanut.common.util.Md5Util;
import com.peanut.entity.pojo.BackendUser;
import com.peanut.web.service.impl.PermissionServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * description: 添加帐号.
 *
 * @author huangs
 * @date 2019-04-25
 * @see com.peanut.web.controller.backend.permission
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Backend.ADD_USER)
public class AddUserController extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    BackendUser backendUser = getBackUserFromParameter(req);
    BackendUser backendUserForParentId = (BackendUser) req.getSession().getAttribute(Constant.SESSION_USER_KEY);
    backendUser.setParentUid(backendUserForParentId.getUid());
    ServerResponse serverResponse = new PermissionServiceImpl().addUser(backendUser);
    PrintWriter printWriter = resp.getWriter();
    printWriter.println(JSON.toJSONString(serverResponse));
    printWriter.flush();
    printWriter.close();
  }

  static BackendUser getBackUserFromParameter(HttpServletRequest req) {
    BackendUser backendUser = new BackendUser();
    backendUser.setUsername(req.getParameter("username"));
    backendUser.setPassword(Md5Util.encrypt(req.getParameter("password")));
    backendUser.setRole(Integer.parseInt(req.getParameter("role")));
    backendUser.setStatus(Integer.parseInt(req.getParameter("status")));
    backendUser.setRemark(req.getParameter("remark"));
    backendUser.setPermission(req.getParameter("permission"));
    return backendUser;
  }
}
