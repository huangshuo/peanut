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
 * description: 修改游戏信息.
 *
 * @author huangs
 * @date 2019-04-25
 * @see com.peanut.web.controller.backend.game
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Backend.MODIFY_GAME)
public class ModifyGameController extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    Game game = AddGameController.getGameFromParameter(req);

    ServerResponse serverResponse = new GameServiceImpl().modifyGame(game);
    PrintWriter printWriter = resp.getWriter();
    printWriter.println(JSON.toJSONString(serverResponse));
    printWriter.flush();
    printWriter.close();
  }
}
