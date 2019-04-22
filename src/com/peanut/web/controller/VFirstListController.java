package com.peanut.web.controller;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServerResponse;

import com.peanut.web.service.impl.VFirstListServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * description: .
 *
 * @author JAVASM
 * @date 2019-04-22
 * @see com.peanut.web.controller
 * @since 1.0
 */
@WebServlet(name = "vFirstList", urlPatterns = "/video/v_first_list")
public class VFirstListController extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    doPost(req, resp);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    ServerResponse serverResponse=new VFirstListServiceImpl().vfirstlist();
    PrintWriter pw=resp.getWriter();
    pw.write(JSON.toJSONString(serverResponse));
    System.out.println(123);
    System.out.println(JSON.toJSONString(serverResponse));
    pw.flush();
    pw.close();
  }

}
