package com.peanut.web.controller.portal.menu;

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
 * @see com.peanut.web.controller.portal.menu
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Portal.MENU_UPDATE)
public class MenuUpdateController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String id= req.getParameter("id");
    String menuName=req.getParameter("menuName");
    String fid=req.getParameter("fid");
    String isShow=req.getParameter("isShow");
    String icon=req.getParameter("icon");
    System.out.println("abc"+menuName);
    MenuManage menuManage=new MenuManage();
    menuManage.setId(Long.parseLong(id));
    menuManage.setMname(menuName);
    menuManage.setFid(Integer.parseInt(fid));
    menuManage.setIsShow(Integer.parseInt(isShow));
    menuManage.setIcon(icon);
    new BaseDaoImpl<>(MenuManage.class).updateByTemplate(menuManage);
  }
}
