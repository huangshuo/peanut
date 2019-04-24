package com.peanut.web.controller.novel;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServerResponse;
import com.peanut.web.service.impl.NovelServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * description: 根据novelType 查询相应分类的小说，根据start 和rows 进行分页.
 *
 * @author Doc10th
 * @date 2019-04-23
 * @see com.peanut.web.controller.novel
 * @since 1.0
 */

@WebServlet(name = "byType", urlPatterns = "/novel/byType")
public class PagingQueryByTypeIdController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

    int typeId = Integer.parseInt(req.getParameter("typeId"));
    int start = Integer.parseInt(req.getParameter("start"));
    int row = Integer.parseInt(req.getParameter("row"));
    ServerResponse serverResponse = new NovelServiceImpl().pagingQueryByTypeId(typeId, start, row);
    PrintWriter printWriter = resp.getWriter();
    printWriter.println(JSON.toJSONString(serverResponse));
    printWriter.close();
  }

}
