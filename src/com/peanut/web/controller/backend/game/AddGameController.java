package com.peanut.web.controller.backend.game;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServletUrl;
import com.peanut.entity.pojo.Game;
import com.peanut.web.service.impl.GameServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * description: 添加游戏.
 *
 * @author huangs
 * @date 2019-04-25
 * @see com.peanut.web.controller.backend.game
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Backend.ADD_GAME)
public class AddGameController extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    Game game = getGameFromParameter(req);

    ServerResponse serverResponse = new GameServiceImpl().addGame(game);
    PrintWriter printWriter = resp.getWriter();
    printWriter.println(JSON.toJSONString(serverResponse));
    printWriter.flush();
    printWriter.close();
  }

  static Game getGameFromParameter(HttpServletRequest req) {
    Game game = new Game();

    game.setName(req.getParameter("gameName"));
    game.setTitle(req.getParameter("gameTitle"));
    game.setGameStatus(Integer.parseInt(req.getParameter("gameStatus")));
    game.setGameSize(Float.parseFloat(req.getParameter("gameSize")));
    game.setGameIcon(req.getParameter("gameIcon"));
    game.setGamePictures(req.getParameter("gamePictures"));
    game.setIosUrl(req.getParameter("iosUrl"));
    game.setAndroidUrl(req.getParameter("androidUrl"));
    game.setRecommendType(Integer.parseInt(req.getParameter("recommendType")));
    game.setGameTypeId(Integer.parseInt(req.getParameter("gameType")));
    game.setPlatform(Integer.parseInt(req.getParameter("platform")));
    game.setDescription(req.getParameter("description"));
    return game;
  }
}
