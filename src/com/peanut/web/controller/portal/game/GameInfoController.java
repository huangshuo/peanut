package com.peanut.web.controller.portal.game;

import com.peanut.common.http.ServletUrl;
import com.peanut.web.service.impl.GameServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * description: 查询游戏详情.
 *
 * @author huangs
 * @date 2019-04-23
 * @see com.peanut.web.controller.portal.game
 * @since 1.0
 */
@WebServlet(name = "gameInfo", urlPatterns = ServletUrl.GAME_INFO)
public class GameInfoController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    long gameId = Long.parseLong(req.getParameter("gameId"));
    PrintWriter printWriter = resp.getWriter();
    printWriter.println(new GameServiceImpl().getGameInfoByGameId(gameId));
    printWriter.flush();
    printWriter.close();
  }
}
