package com.peanut.web.service;

import com.peanut.common.http.ServerResponse;
import com.peanut.entity.pojo.novel.Novel;
import com.peanut.entity.pojo.novel.NovelChapter;
import com.peanut.entity.vo.PageInfo;

/**
 * description: 小说Service接口类.
 *
 * @author Doc10th
 * @date 2019-04-23
 * @see com.peanut.web.service.impl
 * @since 1.0
 */
public interface NovelService {

	/**
	 * 根据类型获取小说列表
	 * @param novelTypeId 小说类型ID
	 * @param start 分页参数开始位置
	 * @param rows 分页参数行数
	 * @return serverResponse
	 */
	ServerResponse<PageInfo<Novel>> pagingQueryByTypeId(int novelTypeId, int start, int rows);

	/**
	 * 根据novelId 查询小说信息，返回小说相关详情
	 * @param novelId 小说ID
	 * @return serverResponse
	 */
	ServerResponse<Novel> novelDetail(int novelId);

	/**
	 * 根据novelId 查询小说信息，根据start 和rows 分页参数进行分页，返回章节列表
	 * @param novelId 小说ID
	 * @param start 分页参数开始位置
	 * @param rows 分页参数行数
	 * @return serverResponse
	 */
	ServerResponse<PageInfo<Novel>> pagingQueryByNovelId(int novelId, int start, int rows);

	/**
	 * 根据novelId 和chapterId 来查询章节内容
	 * @param userId 用户ID
	 * @param novelId 小说ID
	 * @param sortId 章节排号
	 * @param isVip 是否收费：1收费 0免费
	 * @return serverResponse
	 */
	ServerResponse<NovelChapter> getChapterContext(int userId, int novelId, int sortId, int isVip);

	/**
	 * 根据novelID 查询小说类型，分页查询同类型小说并返回
	 * @param novelId 小说ID
	 * @param start 分页参数开始位置
	 * @param rows 分页参数行数
	 * @return serverResponse
	 */
	ServerResponse<PageInfo<Novel>>pagingQueryByNovelIdSameType(int novelId, int start, int rows);

}
