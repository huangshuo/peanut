package com.peanut.web.controller.portal.menu;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServletUrl;
import com.peanut.web.service.impl.MenuServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * description: .
 *
 * @author JAVASM
 * @date 2019-04-25
 * @see com.peanut.web.controller.portal.menu
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Portal.MENU_MANAGE)
public class MenuManageController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    int page = Integer.parseInt(req.getParameter("page"));
    PrintWriter pw=resp.getWriter();
    ServerResponse serverResponse=new MenuServiceImpl().menuList(page);
    pw.print(JSON.toJSONString(serverResponse));
    pw.flush();
    pw.close();
  }
}
