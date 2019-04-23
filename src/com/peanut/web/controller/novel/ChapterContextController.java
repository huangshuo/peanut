package com.peanut.web.controller.novel;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServerResponse;
import com.peanut.entity.pojo.novel.requestParameter.ChapterContextRequestParameter;
import com.peanut.web.service.impl.NovelServiceImpl;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * description: 根据novelId 和sortId 来查询章节内容.
 *
 * @author Doc10th
 * @date 2019-04-23
 * @see com.peanut.web.controller.novel
 * @since 1.0
 */

@WebServlet(name = "context", urlPatterns = "/novel/chapter/context")
public class ChapterContextController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		ChapterContextRequestParameter ccrp = new ChapterContextRequestParameter();

		ccrp.setUserId(Integer.parseInt(req.getParameter("userId")));
		ccrp.setIsVip(Integer.parseInt(req.getParameter("isVip")));
		ccrp.setNovelId(Integer.parseInt(req.getParameter("novelId")));
		ccrp.setSortId(Integer.parseInt(req.getParameter("sortId")));

		ServerResponse serverResponse =  new NovelServiceImpl().getChapterContext(ccrp.getUserId(), ccrp.getNovelId(), ccrp.getSortId(), ccrp.getIsVip());
		String json = JSON.toJSONString(serverResponse);
		PrintWriter printWriter = resp.getWriter();
		printWriter.println(json);
		printWriter.close();
	}
}
