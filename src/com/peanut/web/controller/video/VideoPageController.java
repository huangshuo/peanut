package com.peanut.web.controller.video;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServerResponse;
import com.peanut.web.service.impl.VideoPageServiceImpl;

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
 * @date 2019-04-22
 * @see com.peanut.web.controller.video
 * @since 1.0
 */
@WebServlet(name = "videoPage",urlPatterns = "/video/Page")
public class VideoPageController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    doPost(req, resp);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    long fid=Long.parseLong(req.getParameter("fid"));
    ServerResponse serverResponse=new VideoPageServiceImpl().videoPage(fid);
    PrintWriter pw=resp.getWriter();
    pw.print(JSON.toJSONString(serverResponse));
    pw.flush();
    pw.close();
  }
}