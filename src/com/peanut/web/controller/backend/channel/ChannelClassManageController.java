package com.peanut.web.controller.backend.channel;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServletUrl;
import com.peanut.entity.pojo.BackendChannelClassManage;
import com.peanut.web.service.impl.ChannelServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;

/**
 * description: .
 *
 * @author JAVASM
 * @date 2019-04-30
 * @see com.peanut.web.controller.backend.channel
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Backend.CHANNEL_CLASS_MANAGE)
public class ChannelClassManageController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    String action=req.getParameter("action");
    PrintWriter pw=resp.getWriter();
    ServerResponse serverResponse=null;
    if("select".equals(action)){
      serverResponse=new ChannelServiceImpl().channelClassManage(Integer.parseInt(req.getParameter("page")),Integer.parseInt(req.getParameter("pageSize")));
    }else if("delete".equals(action)){
      serverResponse=new ChannelServiceImpl().deleteChannelClass(Integer.parseInt(req.getParameter("id")));
    }else if("insert".equals(action)){
      BackendChannelClassManage backendChannelClassManage=new BackendChannelClassManage();
      backendChannelClassManage.setClassName(req.getParameter("className"));
      backendChannelClassManage.setFname(req.getParameter("fname"));
      backendChannelClassManage.setLabelOrder(Integer.parseInt(req.getParameter("labelOrder")));
      backendChannelClassManage.setCreateDate(new Timestamp(new Date().getTime()));
      serverResponse=new ChannelServiceImpl().insertChannelClass(backendChannelClassManage);
    }
    pw.write(JSON.toJSONString(serverResponse));
    pw.flush();
    pw.close();
  }
}
