package com.peanut.web.controller.novel;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServerResponse;
import com.peanut.web.service.impl.NovelServiceImpl;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * description: 根据novelId 查询小说信息，返回小说相关详情.
 *
 * @author Doc10th
 * @date 2019-04-23
 * @see com.peanut.web.controller.novel
 * @since 1.0
 */

@WebServlet(name = "novelDetail", urlPatterns = "/novel/detail")
public class NovelDetailController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		int novelId = Integer.parseInt(req.getParameter("novelId"));
		ServerResponse serverResponse = new NovelServiceImpl().novelDetail(novelId);
		String json = JSON.toJSONString(serverResponse);
		PrintWriter printWriter = resp.getWriter();
		printWriter.println(json);
		printWriter.close();
	}
}
