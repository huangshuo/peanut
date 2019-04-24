package com.peanut.web.controller.novel;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServerResponse;
import com.peanut.entity.vo.PageInfo;
import com.peanut.web.service.impl.NovelServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * description: 根据novelID 查询小说类型，分页查询同类型小说并返回.
 *
 * @author Doc10th
 * @date 2019-04-23
 * @see com.peanut.web.controller.novel
 * @since 1.0
 */

@WebServlet(name = "sameType", urlPatterns = "/novel/sameType")
public class pagingQueryByNovelIdSameTypeController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		int novelId = Integer.parseInt(req.getParameter("novelId"));
		int start = Integer.parseInt(req.getParameter("start"));
		int row = Integer.parseInt(req.getParameter("row"));
		ServerResponse serverResponse = new NovelServiceImpl().pagingQueryByNovelIdSameType(novelId, start, row);
		PrintWriter printWriter = resp.getWriter();
		printWriter.println(JSON.toJSONString(serverResponse));
		printWriter.close();
	}
}
