package com.peanut.web.service.impl;

import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServerStatusCodeEnum;
import com.peanut.dao.BaseDao;
import com.peanut.dao.impl.BaseDaoImpl;
import com.peanut.entity.pojo.BackendNovel;
import com.peanut.web.service.BackendNovelService;

/**
 * description: 后台Novel Service接口类的实现类.
 *
 * @author Doc10th
 * @date 2019-04-26
 * @see com.peanut.web.service.impl
 * @since 1.0
 */
public class BackendNovelServiceImpl implements BackendNovelService {

	/**
	 * 类型变量值为BackendNovel 的工具类
	 */
	private static BaseDao<BackendNovel> dao = new BaseDaoImpl<>(BackendNovel.class);

	/**
	 * 更新小说基本信息
	 * @param bean 待更新入数据库的数据
	 * @return serverResponse
	 */
	@Override
	public ServerResponse<BackendNovel> updateNovelInfoByTemplate(BackendNovel bean) {
		return dao.updateByTemplate(bean)? ServerResponse.success():ServerResponse.failWithMsg(404,"更新失败");
	}

	/**
	 * 通过小说ID查询小说基本信息
	 * @param key 小说ID
	 * @return serverResponse
	 */
	@Override
	public ServerResponse<BackendNovel> selectNovelInfoById(Long key) {
		BackendNovel bean = dao.selectOneByPrimaryKey(key);
		return bean.getNovelId() == null ? ServerResponse.failWithMsg(404, ServerStatusCodeEnum.NOT_FOUND.getMsg()): ServerResponse.successWithData(bean);
	}
}
