package com.peanut.web.controller.backend.channel;

import com.peanut.common.http.ServletUrl;
import com.peanut.dao.BaseDao;
import com.peanut.dao.impl.BaseDaoImpl;
import com.peanut.entity.pojo.BackendChannelManage;

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
 * @date 2019-04-26
 * @see com.peanut.web.controller.backend.channel
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Backend.CHANNEL_DELETE)
public class ChannelDeleteController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    BaseDao<BackendChannelManage> baseDao=new BaseDaoImpl<>(BackendChannelManage.class);
    BackendChannelManage backendChannelManage=new BackendChannelManage();
    backendChannelManage.setId(Long.parseLong(req.getParameter("id")));
    backendChannelManage=baseDao.selectOneByTemplate(backendChannelManage);
    baseDao.deleteByPrimaryKey(backendChannelManage.getId());
    
  }
}
