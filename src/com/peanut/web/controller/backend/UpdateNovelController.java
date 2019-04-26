package com.peanut.web.controller.backend;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.peanut.common.http.ServletUrl.Backend.UPDATE_NOVEL;

/**
 * description: 修改小说数据.
 *
 * @author Doc10th
 * @date 2019-04-25
 * @see com.peanut.web.controller.backend
 * @since 1.0
 */
@WebServlet(urlPatterns = UPDATE_NOVEL)
public class UpdateNovelController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		String novelName = req.getParameter("novelName");
		String novelId = req.getParameter("novelId");

		resp.sendRedirect("/peanut/static/novelUpdate.jsp?novelId=" + novelId + "novelName=" + novelName);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
	}
}
