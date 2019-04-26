package com.peanut.web.service;

import com.peanut.common.http.ServerResponse;
import com.peanut.entity.pojo.BackendNovelTypeSecondary;

/**
 * description: 后台novel 二级分类service接口类 .
 *
 * @author Doc10th
 * @date 2019-04-26
 * @see com.peanut.web.service
 * @since 1.0
 */
public interface BackendNovelTypeSecondaryService {
	ServerResponse<BackendNovelTypeSecondary> selectSecondaryTypeById(Long key);
}
