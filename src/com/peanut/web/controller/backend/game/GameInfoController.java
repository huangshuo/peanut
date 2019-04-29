package com.peanut.web.controller.backend.game;

import com.peanut.common.http.ServletUrl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * description: 后台获取游戏信息.
 *
 * @author huangs
 * @date 2019-04-27
 * @see com.peanut.web.controller.backend.game
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Backend.GAME_INFO)
public class GameInfoController extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    com.peanut.web.controller.portal.game.GameInfoController.getGameInfoByGameId(req, resp, true);
  }
}
