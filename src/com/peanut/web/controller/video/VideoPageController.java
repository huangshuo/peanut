package com.peanut.web.controller.video;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServerResponse;
import com.peanut.web.service.impl.VideoServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * description:视频分页响应 .
 *
 * @author zhaomaomao
 * @date 2019-04-22
 * @see com.peanut.web.controller.video
 * @since 1.0
 */
@WebServlet(name = "videoPage", urlPatterns = "/video/Page")
public class VideoPageController extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    long fid = Long.parseLong(req.getParameter("fid"));
    int page = Integer.parseInt(req.getParameter("page"));
    ServerResponse serverResponse = new VideoServiceImpl().videoPage(fid, page);
    PrintWriter pw = resp.getWriter();
    pw.print(JSON.toJSONString(serverResponse));
    pw.flush();
    pw.close();
  }
}
