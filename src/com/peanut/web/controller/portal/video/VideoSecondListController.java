package com.peanut.web.controller.portal.video;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServletUrl;
import com.peanut.web.service.impl.VideoServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * description:视频二级菜单响应 .
 *
 * @author zhaomaomao
 * @date 2019-04-22
 * @see com.peanut.web.controller
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Portal.VIDEO_SECOND_LIST)
public class VideoSecondListController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    long fid = Long.parseLong(req.getParameter("fid"));
    ServerResponse serverResponse = new VideoServiceImpl().videoSecondList(fid);
    PrintWriter pw = resp.getWriter();
    pw.print(JSON.toJSONString(serverResponse));
    pw.flush();
    pw.close();
  }
}
