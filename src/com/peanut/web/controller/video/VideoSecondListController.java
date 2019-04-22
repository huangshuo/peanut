package com.peanut.web.controller.video;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServerResponse;
import com.peanut.web.service.impl.VideoSecondListServiceImpl;

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
 * @see com.peanut.web.controller
 * @since 1.0
 */
@WebServlet(name = "videoSecondList", urlPatterns = "/video/secondList")
public class VideoSecondListController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    doPost(req, resp);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    long cid=Long.parseLong(req.getParameter("cid"));
    ServerResponse serverResponse=new VideoSecondListServiceImpl().videoSecondList(cid);
    PrintWriter pw=resp.getWriter();
    pw.write(JSON.toJSONString(serverResponse));
    pw.flush();
    pw.close();
  }
}
