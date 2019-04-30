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
 * @date 2019-04-28
 * @see com.peanut.web.controller.backend.menu
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Backend.MENU_INSERT)
public class MenuInsertController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String menuName=req.getParameter("menuName");
    String fid=req.getParameter("fid");
    String isShow=req.getParameter("isShow");
    String icon=req.getParameter("icon");
    MenuManage menuManage=new MenuManage();
    menuManage.setMname(menuName);
    menuManage.setFid(Integer.parseInt(fid));
    menuManage.setIsShow(Integer.parseInt(isShow));
    menuManage.setIcon(icon);
    new BaseDaoImpl<>(MenuManage.class).insert(menuManage);
  }
}
