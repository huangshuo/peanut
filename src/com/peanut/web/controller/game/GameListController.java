package com.peanut.web.controller.game;

import com.peanut.web.service.impl.GameServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * description: 按类型分页查询游戏.
 *
 * @author huangs
 * @date 2019-04-23
 * @see com.peanut.web.controller.game
 * @since 1.0
 */
@WebServlet(name = "gameList", urlPatterns = "/game/list")
public class GameListController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    PrintWriter printWriter = resp.getWriter();
    int pageNum = Integer.parseInt(req.getParameter("pageNum"));
    int pageSize = Integer.parseInt(req.getParameter("pageSize"));
    int typeId = Integer.parseInt(req.getParameter("typeId"));
    int platform = Integer.parseInt(req.getParameter("platform"));
    printWriter.println(new GameServiceImpl().pageQueryByTypeIdPlatform(pageNum, pageSize, typeId, platform));
    printWriter.flush();
    printWriter.close();
  }
}
