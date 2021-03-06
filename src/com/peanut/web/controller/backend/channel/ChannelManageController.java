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
@WebServlet(urlPatterns = ServletUrl.Backend.CHANNEL_MANAGE)
public class ChannelManageController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    int page=Integer.parseInt(req.getParameter("page"));
    int pageSize=Integer.parseInt(req.getParameter("pageSize"));
    String firstClass=req.getParameter("firstClass");
    String secondClass=req.getParameter("secondClass");
    String searchContent=req.getParameter("searchContent");
    String action=req.getParameter("action");
    PrintWriter pw=resp.getWriter();
    BackendChannelManage backendChannelManage=new BackendChannelManage();
    ServerResponse<PageInfo<BackendChannelManage>> serverResponse=null;
    if ("init".equals(action)) {
      serverResponse = new ChannelServiceImpl().channelManage(page, pageSize);
      pw.write(JSON.toJSONString(serverResponse));
    }else if("selectOne".equals(action)){
      if(firstClass==null||"".equals(firstClass)){
        serverResponse = new ChannelServiceImpl().channelManage(page, pageSize,null);
        pw.write(JSON.toJSONString(serverResponse));
      }else {
        backendChannelManage.setFirstClass(firstClass);
        serverResponse = new ChannelServiceImpl().channelManage(page, pageSize,backendChannelManage);
        pw.write(JSON.toJSONString(serverResponse));
      }
    }else if("selectTwo".equals(action)){
      backendChannelManage.setFirstClass(firstClass);
      if(secondClass==null||"".equals(secondClass)){
        serverResponse = new ChannelServiceImpl().channelManage(page, pageSize,backendChannelManage);
        pw.write(JSON.toJSONString(serverResponse));
      }else {
        backendChannelManage.setSecondClass(secondClass);
        serverResponse = new ChannelServiceImpl().channelManage(page, pageSize,backendChannelManage);
        pw.write(JSON.toJSONString(serverResponse));
      }
    }else if("search".equals(action)){
      backendChannelManage.setChannelNum(searchContent);
      serverResponse = new ChannelServiceImpl().channelManage(page, pageSize,backendChannelManage);
      pw.write(JSON.toJSONString(serverResponse));
    }
    pw.flush();
    pw.close();
  }
}
