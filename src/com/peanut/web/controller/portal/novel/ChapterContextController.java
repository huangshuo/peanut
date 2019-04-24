package com.peanut.web.controller.portal.novel;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServletUrl;
import com.peanut.web.service.impl.NovelServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * description: 根据novelId 和sortId 来查询章节内容.
 *
 * @author Doc10th
 * @date 2019-04-23
 * @see com.peanut.web.controller.portal.novel
 * @since 1.0
 */

@WebServlet(name = "context", urlPatterns = ServletUrl.CHAPTER_CONTEXT)
public class ChapterContextController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

    int userId = Integer.parseInt(req.getParameter("userId"));
    int isVip = Integer.parseInt(req.getParameter("isVip"));
    int novelId = Integer.parseInt(req.getParameter("novelId"));
    int sortId = Integer.parseInt(req.getParameter("sortId"));

    ServerResponse serverResponse = new NovelServiceImpl().getChapterContext(userId, novelId, sortId, isVip);
    PrintWriter printWriter = resp.getWriter();
    printWriter.println(JSON.toJSONString(serverResponse));
    printWriter.close();
  }
}
