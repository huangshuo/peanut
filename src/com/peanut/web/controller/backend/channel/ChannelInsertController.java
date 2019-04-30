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
import java.sql.Timestamp;
import java.util.Date;

/**
 * description: .
 *
 * @author JAVASM
 * @date 2019-04-26
 * @see com.peanut.web.controller.backend.channel
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Backend.CHANNEL_INSERT)
public class ChannelInsertController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    BackendChannelManage backendChannelManage=new BackendChannelManage();
    backendChannelManage.setFirstClass(req.getParameter("first_class"));
    backendChannelManage.setSecondClass(req.getParameter("second_class"));
    backendChannelManage.setChannelNum(req.getParameter("channel_num"));
    backendChannelManage.setChannelDownloadLink(req.getParameter("channel_download_link"));
    backendChannelManage.setProductName(req.getParameter("product_name"));
    backendChannelManage.setShowName(req.getParameter("show_name"));
    backendChannelManage.setCreateDate(new Timestamp(new Date().getTime()));
    BaseDao<BackendChannelManage> baseDao=new BaseDaoImpl<>(BackendChannelManage.class);
    baseDao.insert(backendChannelManage);
  }
}
