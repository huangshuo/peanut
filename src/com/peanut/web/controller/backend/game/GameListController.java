package com.peanut.web.controller.backend.game;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServletUrl;
import com.peanut.web.service.impl.GameServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * description: 游戏列表分页查询.
 *
 * @author huangs
 * @date 2019-04-25
 * @see com.peanut.web.controller.backend.game
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Backend.GAME_LIST)
public class GameListController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    int pageNum = Integer.parseInt(req.getParameter("pageNum"));
    int pageSize = Integer.parseInt(req.getParameter("pageSize"));
    String gameName = req.getParameter("gameName");
    int gameType = req.getParameter("gameType") == null ? 0 : Integer.parseInt(req.getParameter("gameType"));
    int recommendType = req.getParameter("recommendType") == null ? 0 : Integer.parseInt(req.getParameter("recommendType"));
    int platform = req.getParameter("platform") == null ? 0 : Integer.parseInt(req.getParameter("platform"));
    ServerResponse serverResponse = new GameServiceImpl().pageQueryGame(pageNum, pageSize, gameName, gameType, recommendType, platform);
    PrintWriter printWriter = resp.getWriter();
    printWriter.println(JSON.toJSONString(serverResponse));
    printWriter.flush();
    printWriter.close();
  }
}
