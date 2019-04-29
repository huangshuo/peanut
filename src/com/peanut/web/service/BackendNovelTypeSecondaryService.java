package com.peanut.web.service;

import com.peanut.common.http.ServerResponse;
import com.peanut.entity.pojo.BackendNovelTypeSecondary;

import java.util.List;

/**
 * description: 后台novel 二级分类service接口类 .
 *
 * @author Doc10th
 * @date 2019-04-26
 * @see com.peanut.web.service
 * @since 1.0
 */
public interface BackendNovelTypeSecondaryService {

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
