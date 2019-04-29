package com.peanut.web.controller.backend.novel;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServerResponse;
import com.peanut.entity.pojo.BackendNovel;
import com.peanut.web.service.BackendNovelService;
import com.peanut.web.service.impl.BackendNovelServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

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
		Long novelId = Long.parseLong(req.getParameter("novelId"));
		Integer novelStatus = Integer.parseInt(req.getParameter("novelStatus"));
		String authorName = req.getParameter("authorName");
		System.out.println(req.getParameter("novelTypeIdSecondary"));
		Long novelTypeIdSecondary = Long.parseLong(req.getParameter("novelTypeIdSecondary"));

		BackendNovel novelBean = new BackendNovel();
		novelBean.setAuthorName(authorName);
		novelBean.setNovelId(novelId);
		novelBean.setNovelName(novelName);
		novelBean.setSecondaryTypeId(novelTypeIdSecondary);
		novelBean.setNovelStatus(novelStatus);
		BackendNovelService service = new BackendNovelServiceImpl();

		ServerResponse<BackendNovel> response = service.updateNovelInfoByTemplate(novelBean);
		PrintWriter printWriter = resp.getWriter();
		printWriter.print(JSON.toJSONString(response));
		System.out.println(JSON.toJSONString(response));
		printWriter.close();
	}
}
