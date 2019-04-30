package com.peanut.web.controller.backend.novel;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServletUrl;
import com.peanut.entity.pojo.BackendNovelTypePrimary;
import com.peanut.entity.pojo.BackendNovelTypeSecondary;
import com.peanut.web.service.BackendNovelService;
import com.peanut.web.service.impl.BackendNovelServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * description: 查找小说的一级和二级分类.
 *
 * @author Doc10th
 * @date 2019-04-28
 * @see com.peanut.web.controller.backend.novel
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Backend.SELECT_NOVEL_TYPE)
public class SelectNovelTypeController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Map<String, String> resultMap = new HashMap<>(4);
		String temp = req.getParameter("novelTypeIdSecondary");
		Long novelTypeIdSecondary = Long.parseLong(req.getParameter("novelTypeIdSecondary"));
		resultMap.put("novelTypeIdSecondary", novelTypeIdSecondary.toString());
		BackendNovelService service = new BackendNovelServiceImpl();
		BackendNovelTypeSecondary backendNovelTypeSecondary = service.selectSecondaryTypeById(novelTypeIdSecondary).getData();
		resultMap.put("novelTypeNameSecondary", backendNovelTypeSecondary.getTypeName());

		Long novelTypeIdPrimary = backendNovelTypeSecondary.getFatherTypeId();
		BackendNovelTypePrimary backendNovelTypePrimary = service.selectPrimaryTypeById(novelTypeIdPrimary).getData();
		resultMap.put("novelTypeIdPrimary", novelTypeIdPrimary.toString());
		resultMap.put("novelTypeNamePrimary", backendNovelTypePrimary.getTypeName());
		PrintWriter writer = resp.getWriter();
		writer.print(JSON.toJSONString(resultMap));
		writer.close();
	}
}
