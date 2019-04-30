package com.peanut.web.service;

import com.peanut.common.http.ServerResponse;
import com.peanut.entity.pojo.BackendNovel;
import com.peanut.entity.pojo.BackendNovelTypePrimary;
import com.peanut.entity.pojo.BackendNovelTypeSecondary;
import com.peanut.entity.vo.PageInfo;

import java.util.List;

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
	 * 通过小说信息模板查询小说基本信息
	 * @param pageNum 当前页数
	 * @param pageSize 行数
	 * @param bean 小说信息模板
	 * @return serverResponse
	 */
	ServerResponse<PageInfo<BackendNovel>> selectNovelInfoByTemplate(int pageNum, int pageSize,BackendNovel bean);

	/**
	 * 通过一级分类ID 来查找一级分类信息
	 * @param key 一级分类ID
	 * @return serverResponse
	 */
	ServerResponse<BackendNovelTypePrimary> selectPrimaryTypeById(Long key);
	
	/**
	 * 查找所有一级分类信息
	 * @return serverResponse
	 */
	ServerResponse<List<BackendNovelTypePrimary>> selectAllPrimaryType();

	/**
	 * 通过二级目录ID查找二级目录
	 * @param key 二级目录ID
	 * @return serverResponse
	 */
	ServerResponse<BackendNovelTypeSecondary> selectSecondaryTypeById(Long key);

	/**
	 * 通过一级目录ID查找二级目录
	 * @param key 一级目录ID
	 * @return serverResponse
	 */
	ServerResponse<List<BackendNovelTypeSecondary>> selectSecondaryTypeByFatherId(Long key);
}
