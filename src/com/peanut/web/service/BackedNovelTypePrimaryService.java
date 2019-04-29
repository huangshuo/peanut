package com.peanut.web.service;

import com.peanut.common.http.ServerResponse;
import com.peanut.entity.pojo.BackendNovelTypePrimary;

import java.util.List;

/**
 * description: 后台novel 二级分类service接口类.
 *
 * @author Doc10th
 * @date 2019-04-26
 * @see com.peanut.web.service
 * @since 1.0
 */
public interface BackedNovelTypePrimaryService {

	/**
	 * 通过一级分类ID 来查找一级分类信息
	 * @param key 一级分类ID
	 * @return serverResponse
	 */
	ServerResponse<BackendNovelTypePrimary> selectPrimaryTypeById(Long key);
	/**
	 * 通过二级分类ID 来查找一级分类信息
	 * @param key 二级分类ID
	 * @return serverResponse
	 */
	ServerResponse<BackendNovelTypePrimary> selectPrimaryTypeBySonTypeId(Long key);
	/**
	 * 查找所有一级分类信息
	 * @return serverResponse
	 */
	ServerResponse<List<BackendNovelTypePrimary>> selectAllPrimaryType();
}
