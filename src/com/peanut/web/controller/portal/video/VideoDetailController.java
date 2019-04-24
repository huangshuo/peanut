package com.peanut.web.controller.portal.video;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServletUrl;
import com.peanut.entity.pojo.VideoDetail;
import com.peanut.web.service.impl.VideoServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * description:视频详情响应 .
 *
 * @author zhaomaomao
 * @date 2019-04-22
 * @see com.peanut.web.controller
 * @since 1.0
 */
@WebServlet(name = "videoDetail", urlPatterns = ServletUrl.VIDEO_DETAIL)
public class VideoDetailController extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    String vid = req.getParameter("vid");
    ServerResponse<VideoDetail> serverResponse = new VideoServiceImpl().videoDetail(vid);
    PrintWriter printWriter = resp.getWriter();
    printWriter.println(JSON.toJSONString(serverResponse));
    printWriter.flush();
    printWriter.close();
  }
}
