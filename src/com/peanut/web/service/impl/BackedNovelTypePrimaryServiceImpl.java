package com.peanut.web.service.impl;

import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServerStatusCodeEnum;
import com.peanut.dao.BaseDao;
import com.peanut.dao.impl.BaseDaoImpl;
import com.peanut.entity.pojo.BackendNovel;
import com.peanut.entity.pojo.BackendNovelTypePrimary;
import com.peanut.entity.pojo.BackendNovelTypeSecondary;
import com.peanut.web.service.BackedNovelTypePrimaryService;

import java.util.List;

/**
 * description: 后台novel 二级分类service接口实现类.
 *
 * @author Doc10th
 * @date 2019-04-26
 * @see com.peanut.web.service.impl
 * @since 1.0
 */
public class BackedNovelTypePrimaryServiceImpl implements BackedNovelTypePrimaryService {
	private static BaseDao<BackendNovelTypePrimary> dao = new BaseDaoImpl<>(BackendNovelTypePrimary.class);
	private static BaseDao<BackendNovelTypeSecondary> sonDao = new BaseDaoImpl<>(BackendNovelTypeSecondary.class);
	/**
	 * 通过一级分类ID 来查找一级分类信息
	 * @param key 一级分类ID
	 * @return serverResponse
	 */
	@Override
	public ServerResponse<BackendNovelTypePrimary> selectPrimaryTypeById(Long key) {
		BackendNovelTypePrimary bean = dao.selectOneByPrimaryKey(key);
		return bean.getTypeId() == null ? ServerResponse.failWithMsg(404, ServerStatusCodeEnum.NOT_FOUND.getMsg()): ServerResponse.successWithData(bean);
	}
	/**
	 * 通过二级分类ID 来查找一级分类信息
	 * @param key 二级分类ID
	 * @return serverResponse
	 */
	@Override
	public ServerResponse<BackendNovelTypePrimary> selectPrimaryTypeBySonTypeId(Long key) {
		BackendNovelTypeSecondary sonBean = sonDao.selectOneByPrimaryKey(key);
		BackendNovelTypePrimary bean = dao.selectOneByPrimaryKey(sonBean.getFatherTypeId());
		return bean.getTypeId() == null ? ServerResponse.failWithMsg(404, ServerStatusCodeEnum.NOT_FOUND.getMsg()): ServerResponse.successWithData(bean);
	}

	@Override
	public ServerResponse<List<BackendNovelTypePrimary>> selectAllPrimaryType() {
		List<BackendNovelTypePrimary> resultList = dao.selectListByTemplate(new BackendNovelTypePrimary());
		return resultList.isEmpty() ? ServerResponse.failWithMsg(404, ServerStatusCodeEnum.NOT_FOUND.getMsg()) : ServerResponse.successWithData(resultList);
	}

}
