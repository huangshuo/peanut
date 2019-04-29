package com.peanut.web.controller.backend.permission;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServletUrl;
import com.peanut.web.service.impl.PermissionServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * description: 获取所有的菜单.
 *
 * @author huangs
 * @date 2019-04-29
 * @see com.peanut.web.controller.backend.permission
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Backend.USER_MENU_LIST)
public class MenuListController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    ServerResponse serverResponse = new PermissionServiceImpl().getMenuList();
    PrintWriter printWriter = resp.getWriter();
    printWriter.println(JSON.toJSONString(serverResponse));
    printWriter.flush();
    printWriter.close();
  }
}
