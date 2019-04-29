package com.peanut.web.controller.backend.novel;

import com.alibaba.fastjson.JSON;
import com.peanut.common.http.ServletUrl;
import com.peanut.entity.pojo.BackendNovelTypePrimary;
import com.peanut.entity.pojo.BackendNovelTypeSecondary;
import com.peanut.web.service.BackedNovelTypePrimaryService;
import com.peanut.web.service.BackendNovelTypeSecondaryService;
import com.peanut.web.service.impl.BackedNovelTypePrimaryServiceImpl;
import com.peanut.web.service.impl.BackendNovelTypeSecondaryServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * description: 返回所有小说类型.
 *
 * @author Doc10th
 * @date 2019-04-28
 * @see com.peanut.web.controller.backend.novel
 * @since 1.0
 */
@WebServlet(urlPatterns = ServletUrl.Backend.SELECT_NOVEL_TYPE_ALL)
public class InitializesTypeList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Map<String, List<BackendNovelTypeSecondary>> resultMap = new HashMap<>(10);
		BackedNovelTypePrimaryService primaryService = new BackedNovelTypePrimaryServiceImpl();
		BackendNovelTypeSecondaryService secondaryService = new BackendNovelTypeSecondaryServiceImpl();

		List<BackendNovelTypePrimary> primaryList = primaryService.selectAllPrimaryType().getData();
		for (BackendNovelTypePrimary primary:primaryList){
			resultMap.put(primary.getTypeName() + "ID:" + primary.getTypeId(), secondaryService.selectSecondaryTypeByFatherId(primary.getTypeId()).getData());
		}
		PrintWriter writer = resp.getWriter();
		System.out.println(JSON.toJSONString(resultMap));
		writer.print(JSON.toJSONString(resultMap));
		writer.close();
	}
}
