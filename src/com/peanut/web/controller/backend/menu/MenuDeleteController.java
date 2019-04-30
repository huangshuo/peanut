package com.peanut.web.controller.backend.menu;

import com.peanut.common.http.ServletUrl;
import com.peanut.dao.BaseDao;
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
@WebServlet(urlPatterns = ServletUrl.Backend.MENU_DELETE)
public class MenuDeleteController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    BaseDao<MenuManage> baseDao=new BaseDaoImpl<>(MenuManage.class);
    baseDao.deleteByPrimaryKey(Long.parseLong(req.getParameter("id")));
  }
}
