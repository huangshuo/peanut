package com.peanut.web.controller;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServerResponse;
import com.peanut.entity.pojo.User;
import com.peanut.web.service.impl.UserServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

/**
 * description: 修改用户个人信息.
 *
 * @author huangs
 * @date 2019-04-22
 * @see com.peanut.web.controller
 * @since 1.0
 */
@WebServlet(name = "modifyUserInfo", urlPatterns = "/user/modify")
public class ModifyUserInfoController extends HttpServlet {

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    User user = new User();
    user.setUid(Long.parseLong(req.getParameter("uid")));
    user.setUsername(req.getParameter("username"));
    user.setHeadPic(req.getParameter("headpic"));
    user.setHeadPicThumb(req.getParameter("headpicthumb"));
    user.setDes(req.getParameter("des"));
    user.setSex(Integer.parseInt(req.getParameter("sex")));
    user.setBirthday(Date.valueOf(req.getParameter("birthday")));
    user.setAvatarColor(req.getParameter("avatarcolor"));
    user.setPhone(req.getParameter("phone"));
    user.setGrade(Integer.parseInt(req.getParameter("grade")));
    ServerResponse serverResponse = new UserServiceImpl().modifyUserInfo(user);
    PrintWriter printWriter = resp.getWriter();
    printWriter.println(JSON.toJSONString(serverResponse));
    printWriter.flush();
    printWriter.close();
  }
}
