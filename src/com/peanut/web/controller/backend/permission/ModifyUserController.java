package com.peanut.web.controller.backend.permission;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServletUrl;
import com.peanut.entity.pojo.BackendUser;
import com.peanut.web.service.impl.PermissionServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * description: 修改帐号信息.
 *
 * @author huangs
 * @date 2019-04-25
 * @see com.peanut.web.controller.backend.permission
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Backend.MODIFY_USER)
public class ModifyUserController extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    BackendUser backendUser = AddUserController.getBackUserFromParameter(req);

    ServerResponse serverResponse = new PermissionServiceImpl().modifyUser(backendUser);
    PrintWriter printWriter = resp.getWriter();
    printWriter.println(JSON.toJSONString(serverResponse));
    printWriter.flush();
    printWriter.close();
  }
}
