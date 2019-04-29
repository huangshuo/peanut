package com.peanut.web.controller.backend.novel;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServletUrl;
import com.peanut.entity.pojo.BackendNovel;
import com.peanut.entity.vo.PageInfo;
import com.peanut.web.service.BackendNovelService;
import com.peanut.web.service.impl.BackendNovelServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * description: 查找小说并返回.
 *
 * @author Doc10th
 * @date 2019-04-28
 * @see com.peanut.web.controller.backend.novel
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Backend.SELECT_NOVEL)
public class SelectNovelController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		BackendNovel bean = new BackendNovel();
		bean.setSecondaryTypeId(Long.parseLong(req.getParameter("novelTypeIdSecondary")));
		bean.setNovelName(req.getParameter("novelName"));
		bean.setAuthorName(req.getParameter("authorName"));
		bean.setNovelId(Long.parseLong(req.getParameter("novelId")));

		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		int pageSize = Integer.parseInt(req.getParameter("pageSize"));

		BackendNovelService service = new BackendNovelServiceImpl();
		ServerResponse<PageInfo<BackendNovel>> serverResponse = service.selectNovelInfoByTemplate(pageNum, pageSize, bean);
		PrintWriter writer = resp.getWriter();
		writer.print(JSON.toJSONString(serverResponse));
		writer.close();
	}
}
