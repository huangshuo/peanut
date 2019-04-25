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
 * description: 用户列表分页查询.
 *
 * @author huangs
 * @date 2019-04-25
 * @see com.peanut.web.controller.backend.permission
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Backend.USER_LIST)
public class UserListController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    int pageNum = Integer.parseInt(req.getParameter("pageNum"));
    int pageSize = Integer.parseInt(req.getParameter("pageSize"));

    ServerResponse serverResponse = new PermissionServiceImpl().pageQueryAll(pageNum, pageSize);
    PrintWriter printWriter = resp.getWriter();
    printWriter.println(JSON.toJSONString(serverResponse));
    printWriter.flush();
    printWriter.close();
  }
}
