package com.peanut.web.controller.portal.game;

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
 * description: 查询游戏详情.
 *
 * @author huangs
 * @date 2019-04-23
 * @see com.peanut.web.controller.portal.game
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Portal.GAME_INFO)
public class GameInfoController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    getGameInfoByGameId(req, resp, false);
  }

  public static void getGameInfoByGameId(HttpServletRequest req, HttpServletResponse resp, boolean b) throws IOException {
    long gameId = Long.parseLong(req.getParameter("gameId"));
    PrintWriter printWriter = resp.getWriter();
    ServerResponse serverResponse = new GameServiceImpl().getGameInfoByGameId(gameId, b);
    printWriter.println(JSON.toJSONString(serverResponse));
    printWriter.flush();
    printWriter.close();
  }
}
