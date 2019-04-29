package com.peanut.web.controller.backend.channel;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServletUrl;
import com.peanut.entity.pojo.BackendChannelManage;
import com.peanut.entity.vo.PageInfo;
import com.peanut.web.service.impl.ChannelServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * description: .
 *
 * @author JAVASM
 * @date 2019-04-26
 * @see com.peanut.web.controller.backend.channel
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Portal.CHANNEL_MANAGE)
public class channelManageController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    int page=Integer.parseInt(req.getParameter("page"));
    int pageSize=Integer.parseInt(req.getParameter("pageSize"));
    ServerResponse<PageInfo<BackendChannelManage>> serverResponse=new ChannelServiceImpl().channelManage(page,pageSize);
    PrintWriter pw=resp.getWriter();
    pw.write(JSON.toJSONString(serverResponse));
    pw.flush();
    pw.close();
  }
}
