package com.peanut.web.service;

import com.peanut.common.http.ServerResponse;
import com.peanut.entity.pojo.BackendNovel;
import com.peanut.entity.vo.PageInfo;

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

	/**
	 * 通过小说信息模板查询小说基本信息
	 * @param pageNum 当前页数
	 * @param pageSize 行数
	 * @param bean 小说信息模板
	 * @return serverResponse
	 */
	ServerResponse<PageInfo<BackendNovel>> selectNovelInfoByTemplate(int pageNum, int pageSize,BackendNovel bean);

}