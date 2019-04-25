package com.peanut.web.controller.backend.permission;

import com.peanut.common.Constant;
import com.peanut.common.http.ServletUrl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * description: 后台登出.
 *
 * @author huangs
 * @date 2019-04-25
 * @see com.peanut.web.controller.backend.permission
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Backend.LOGOUT)
public class LogoutController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    // 移除session中的信息
    req.getSession().removeAttribute(Constant.SESSION_USER_KEY);
    // 跳转至登录界面
    resp.sendRedirect(req.getContextPath());
  }
}
