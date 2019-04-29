package com.peanut.web.service.impl;

import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServerStatusCodeEnum;
import com.peanut.dao.BaseDao;
import com.peanut.dao.impl.BaseDaoImpl;
import com.peanut.entity.pojo.BackendNovelTypeSecondary;
import com.peanut.web.service.BackendNovelTypeSecondaryService;

import java.util.List;

/**
 * description: 后台novel 二级分类service接口实现类.
 *
 * @author Doc10th
 * @date 2019-04-26
 * @see com.peanut.web.service.impl
 * @since 1.0
 */
public class BackendNovelTypeSecondaryServiceImpl implements BackendNovelTypeSecondaryService {
	private static BaseDao<BackendNovelTypeSecondary> dao = new BaseDaoImpl<>(BackendNovelTypeSecondary.class);

	/**
	 * 通过二级目录ID查找二级目录
	 * @param key 二级目录ID
	 * @return serverResponse
	 */
	@Override
	public ServerResponse<BackendNovelTypeSecondary> selectSecondaryTypeById(Long key) {
		BackendNovelTypeSecondary bean = dao.selectOneByPrimaryKey(key);
		return bean.getTypeId() == null ? ServerResponse.failWithMsg(404, ServerStatusCodeEnum.NOT_FOUND.getMsg()): ServerResponse.successWithData(bean);
	}

	/**
	 * 通过一级目录ID查找二级目录
	 * @param key 一级目录ID
	 * @return serverResponse
	 */
	@Override
	public ServerResponse<List<BackendNovelTypeSecondary>> selectSecondaryTypeByFatherId(Long key) {
		BackendNovelTypeSecondary bean = new BackendNovelTypeSecondary();
		bean.setFatherTypeId(key);
		List<BackendNovelTypeSecondary> resultList = dao.selectListByTemplate(bean);
		return resultList.isEmpty() ? ServerResponse.failWithMsg(404, ServerStatusCodeEnum.NOT_FOUND.getMsg()): ServerResponse.successWithData(resultList);
	}
}
