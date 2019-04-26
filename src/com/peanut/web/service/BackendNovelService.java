package com.peanut.web.service;

import com.peanut.common.http.ServerResponse;
import com.peanut.entity.pojo.BackendNovel;

/**
 * description: 后台Novel Service接口类.
 *
 * @author Doc10th
 * @date 2019-04-26
 * @see com.peanut.web.service
 * @since 1.0
 */
public interface BackendNovelService {

	/**
	 * 通过小说类模板更新小说基本信息
	 * @param bean 待更新入数据库的数据
	 * @return serverResponse
	 */
	ServerResponse<BackendNovel> updateNovelInfoByTemplate(BackendNovel bean);
	/**
	 * 通过小说ID查询小说基本信息
	 * @param key 小说ID
	 * @return serverResponse
	 */
	ServerResponse<BackendNovel> selectNovelInfoById(Long key);
}
