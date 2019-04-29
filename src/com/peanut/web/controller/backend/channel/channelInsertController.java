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
@WebServlet(urlPatterns = ServletUrl.Portal.CHANNEL_INSERT)
public class channelInsertController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    BackendChannelManage backendChannelManage=new BackendChannelManage();
    String first_class=req.getParameter("first_class");
    String second_class=req.getParameter("second_class");
    String channel_num=req.getParameter("channel_num");
    String channel_download_link=req.getParameter("channel_download_link");
    String product_name=req.getParameter("product_name");
    String show_name=req.getParameter("show_name");
    Timestamp createDate =new Timestamp(new Date().getTime());

    backendChannelManage.setFirstClass(first_class);
    backendChannelManage.setSecondClass(second_class);
    backendChannelManage.setChannelNum(channel_num);
    backendChannelManage.setChannelDownloadLink(channel_download_link);
    backendChannelManage.setProductName(product_name);
    backendChannelManage.setShowName(show_name);
    backendChannelManage.setCreateDate(createDate);
    BaseDao<BackendChannelManage> baseDao=new BaseDaoImpl<>(BackendChannelManage.class);
    baseDao.insert(backendChannelManage);
  }
}
