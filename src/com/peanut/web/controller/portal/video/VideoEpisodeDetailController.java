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
 * description:视频分集响应 .
 *
 * @author zhaomaomao
 * @date 2019-04-22
 * @see com.peanut.web.controller.portal.video
 * @since 1.0
 */
@WebServlet(name = "videoEpisodeDetail", urlPatterns = ServletUrl.VIDEO_EPISODE_DETAIL)
public class VideoEpisodeDetailController extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    String vid = req.getParameter("vid");
    ServerResponse serverResponse = new VideoServiceImpl().videoEpisodeDetail(vid);
    PrintWriter pw = resp.getWriter();
    pw.write(JSON.toJSONString(serverResponse));
    pw.flush();
    pw.close();
  }
}
