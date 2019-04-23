package com.peanut.web.controller.user;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServerResponse;
import com.peanut.entity.pojo.UserFeedback;
import com.peanut.web.service.impl.UserServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * description: 用户意见反馈.
 *
 * @author huangs
 * @date 2019-04-22
 * @see com.peanut.web.controller.user
 * @since 1.0
 */
@WebServlet(name = "feedback", urlPatterns = "/user/feedback")
public class FeedbackController extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    UserFeedback userFeedback = new UserFeedback();
    userFeedback.setUid(Long.parseLong(req.getParameter("uid")));
    userFeedback.setTroubleList(req.getParameter("troubleList"));
    userFeedback.setSuggestion(req.getParameter("suggestion"));
    userFeedback.setContact(req.getParameter("contact"));
    userFeedback.setPlatform(Integer.parseInt(req.getParameter("platform")));
    PrintWriter printWriter = resp.getWriter();
    ServerResponse serverResponse = new UserServiceImpl().addUserFeedBack(userFeedback);
    printWriter.println(JSON.toJSONString(serverResponse));
    printWriter.flush();
    printWriter.close();
  }
}
