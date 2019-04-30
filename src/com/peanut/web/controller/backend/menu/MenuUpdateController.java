package com.peanut.web.controller.backend.menu;

import com.peanut.common.http.ServletUrl;
import com.peanut.dao.impl.BaseDaoImpl;
import com.peanut.entity.pojo.MenuManage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * description: .
 *
 * @author JAVASM
 * @date 2019-04-25
 * @see com.peanut.web.controller.backend.menu
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Backend.MENU_UPDATE)
public class MenuUpdateController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    MenuManage menuManage=new MenuManage();
    menuManage.setId(Long.parseLong(req.getParameter("id")));
    menuManage.setMname(req.getParameter("menuName"));
    menuManage.setFid(Integer.parseInt(req.getParameter("fid")));
    menuManage.setIsShow(Integer.parseInt(req.getParameter("isShow")));
    menuManage.setIcon(req.getParameter("icon"));
    new BaseDaoImpl<>(MenuManage.class).updateByTemplate(menuManage);
  }
}
