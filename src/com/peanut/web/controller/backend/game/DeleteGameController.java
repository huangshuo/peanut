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
 * description: 删除游戏.
 *
 * @author huangs
 * @date 2019-04-25
 * @see com.peanut.web.controller.backend.game
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Backend.DELETE_GAME)
public class DeleteGameController extends HttpServlet {

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    String name = req.getParameter("name");
    ServerResponse serverResponse = new GameServiceImpl().deleteGameByGameName(name);
    PrintWriter printWriter = resp.getWriter();
    printWriter.println(JSON.toJSONString(serverResponse));
    printWriter.flush();
    printWriter.close();
  }
}
