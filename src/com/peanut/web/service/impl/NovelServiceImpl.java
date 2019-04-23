package com.peanut.web.service.impl;

import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServerStatusCodeEnum;
import com.peanut.dao.NovelChapterDao;
import com.peanut.dao.NovelDao;
import com.peanut.dao.impl.NovelChapterDaoImpl;
import com.peanut.dao.impl.NovelDaoImpl;
import com.peanut.entity.vo.PageInfo;
import com.peanut.entity.pojo.novel.Novel;
import com.peanut.entity.pojo.novel.NovelChapter;
import com.peanut.web.service.NovelService;

import java.util.List;

/**
 * description: 小说service接口实现类.
 *
 * @author Doc10th
 * @date 2019-04-23
 * @see com.peanut.web.service.impl
 * @since 1.0
 */
public class NovelServiceImpl implements NovelService {

	private static NovelDao novelDao = new NovelDaoImpl();
	private static NovelChapterDao novelChapterDao = new NovelChapterDaoImpl();

	/**
	 * 根据属性获取小说列表
	 * @param novelTypeId 小说类型ID
	 * @param start 分页参数开始位置
	 * @param rows 分页参数行数
	 * @return serverResponse
	 */
	@Override
	public ServerResponse<PageInfo<Novel>> pagingQueryByTypeId(int novelTypeId, int start, int rows) {
		Novel bean = new Novel();
		bean.setTypeId(novelTypeId);
		PageInfo<Novel> pageInfo = novelDao.pageQueryByTemplate(start, rows, bean);
		if(!pageInfo.getPageData().isEmpty()){
			return ServerResponse.successWithData(pageInfo);
		}
		return ServerResponse.failWithMsg(ServerStatusCodeEnum.NOT_FOUND.getCode(),"无此类型小说");
	}

	/**
	 * 根据novelId 查询小说信息，返回小说相关详情
	 * @param novelId 小说ID
	 * @return serverResponse
	 */
	@Override
	public ServerResponse<Novel> novelDetail(int novelId) {

		Novel bean = novelDao.selectOneByPrimaryKey(novelId);
		if(bean.getNovelId() == null){
			return ServerResponse.failWithMsg(ServerStatusCodeEnum.NOT_FOUND.getCode(), ServerStatusCodeEnum.NOT_FOUND.getMsg());
		}
		return ServerResponse.successWithData(bean);
	}

	/**
	 * 根据novelId 查询小说信息，根据start 和rows 分页参数进行分页，返回章节列表
	 * @param novelId 小说ID
	 * @param start 分页参数开始位置
	 * @param rows 分页参数行数
	 * @return serverResponse
	 */
	@Override
	public ServerResponse<PageInfo<Novel>> pagingQueryByNovelId(int novelId, int start, int rows) {

		Novel bean = new Novel();
		bean.setNovelId(novelId);
		PageInfo<Novel> pageInfo = novelDao.pageQueryByTemplate(start, rows, bean);
		if(pageInfo.getPageData().isEmpty()){
			return ServerResponse.successWithData(pageInfo);
		}
		return ServerResponse.failWithMsg(ServerStatusCodeEnum.NOT_FOUND.getCode(), ServerStatusCodeEnum.NOT_FOUND.getMsg());
	}

	/**
	 * 根据novelId 和sortId 来查询章节内容
	 * @param userId 用户ID
	 * @param novelId 小说ID
	 * @param sortId 章节排号
	 * @param isVip 是否收费：1收费 0免费
	 * @return serverResponse
	 */
	@Override
	public ServerResponse<NovelChapter> getChapterContext(int userId, int novelId, int sortId, int isVip) {

		NovelChapter chapterBean = new NovelChapter();
		chapterBean.setNovelId(novelId);
		chapterBean.setSortId(sortId);
		chapterBean = novelChapterDao.selectOneByTemplate(chapterBean);
		if(chapterBean.getChapterId() == null){
			return ServerResponse.failWithMsg(ServerStatusCodeEnum.NOT_FOUND.getCode(), ServerStatusCodeEnum.NOT_FOUND.getMsg());
		}
		return ServerResponse.successWithData(chapterBean);
	}

	/**
	 * 根据novelID 查询小说类型，分页查询同类型小说并返回
	 * @param novelId 小说ID
	 * @param start 分页参数开始位置
	 * @param rows 分页参数行数
	 * @return serverResponse
	 */
	@Override
	public ServerResponse<PageInfo<Novel>>pagingQueryByNovelIdSameType(int novelId, int start, int rows) {

		Novel bean = novelDao.selectOneByPrimaryKey(novelId);
		if(bean.getNovelId() == null){
			return ServerResponse.failWithMsg(ServerStatusCodeEnum.NOT_FOUND.getCode(), ServerStatusCodeEnum.NOT_FOUND.getMsg());
		}
		PageInfo<Novel> pageInfo = novelDao.pageQueryByTemplate(start, rows, bean);

		return ServerResponse.successWithData(pageInfo);
	}
}
