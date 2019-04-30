package com.peanut.web.service.impl;

import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServerStatusCodeEnum;
import com.peanut.dao.BaseDao;
import com.peanut.dao.impl.BaseDaoImpl;
import com.peanut.entity.pojo.BackendNovel;
import com.peanut.entity.pojo.BackendNovelTypePrimary;
import com.peanut.entity.pojo.BackendNovelTypeSecondary;
import com.peanut.entity.vo.PageInfo;
import com.peanut.web.service.BackendNovelService;

import java.util.List;

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
	private static BaseDao<BackendNovel> novelDao = new BaseDaoImpl<>(BackendNovel.class);

	/**
	 * 更新小说基本信息
	 * @param bean 待更新入数据库的数据
	 * @return serverResponse
	 */
	@Override
	public ServerResponse<BackendNovel> updateNovelInfoByTemplate(BackendNovel bean) {
		return novelDao.updateByTemplate(bean)? ServerResponse.success():ServerResponse.failWithMsg(404,"更新失败");
	}

	/**
	 * 通过小说ID查询小说基本信息
	 * @param key 小说ID
	 * @return serverResponse
	 */
	@Override
	public ServerResponse<BackendNovel> selectNovelInfoById(Long key) {
		BackendNovel bean = novelDao.selectOneByPrimaryKey(key);
		return bean.getNovelId() == null ? ServerResponse.failWithMsg(404, ServerStatusCodeEnum.NOT_FOUND.getMsg()): ServerResponse.successWithData(bean);
	}

	/**
	 * 通过小说信息模板查询小说基本信息
	 *  @param bean 小说信息模板
	 * 	 * @return serverResponse
	 */
	@Override
	public ServerResponse<PageInfo<BackendNovel>> selectNovelInfoByTemplate(int pageNum, int pageSize, BackendNovel bean) {
		PageInfo<BackendNovel> pageInfo = novelDao.pageQueryByTemplate(pageNum, pageSize, bean, "novel_name");
		return pageInfo.getTotalPage() == 0 ? ServerResponse.failWithMsg(ServerStatusCodeEnum.NOT_FOUND.getCode(), ServerStatusCodeEnum.NOT_FOUND.getMsg()) :
				ServerResponse.successWithData(pageInfo);
	}

	private static BaseDao<BackendNovelTypeSecondary> typeSonDao = new BaseDaoImpl<>(BackendNovelTypeSecondary.class);

	/**
	 * 通过二级目录ID查找二级目录
	 * @param key 二级目录ID
	 * @return serverResponse
	 */
	@Override
	public ServerResponse<BackendNovelTypeSecondary> selectSecondaryTypeById(Long key) {
		BackendNovelTypeSecondary bean = typeSonDao.selectOneByPrimaryKey(key);
		return bean.getTypeId() == null ? ServerResponse.failWithMsg(404, ServerStatusCodeEnum.NOT_FOUND.getMsg()): ServerResponse.successWithData(bean);
	}

	/**
	 * 通过一级目录ID查找二级目录
	 * @param key 一级目录ID
	 * @return serverResponse
	 */
	@Override
	public ServerResponse<List<BackendNovelTypeSecondary>> selectSecondaryTypeByFatherId(Long key) {
		BackendNovelTypeSecondary bean = new BackendNovelTypeSecondary();
		bean.setFatherTypeId(key);
		List<BackendNovelTypeSecondary> resultList = typeSonDao.selectListByTemplate(bean);
		return resultList.isEmpty() ? ServerResponse.failWithMsg(404, ServerStatusCodeEnum.NOT_FOUND.getMsg()): ServerResponse.successWithData(resultList);
	}

	private static BaseDao<BackendNovelTypePrimary> typeDao = new BaseDaoImpl<>(BackendNovelTypePrimary.class);
	/**
	 * 通过一级分类ID 来查找一级分类信息
	 * @param key 一级分类ID
	 * @return serverResponse
	 */
	@Override
	public ServerResponse<BackendNovelTypePrimary> selectPrimaryTypeById(Long key) {
		BackendNovelTypePrimary bean = typeDao.selectOneByPrimaryKey(key);
		return bean.getTypeId() == null ? ServerResponse.failWithMsg(404, ServerStatusCodeEnum.NOT_FOUND.getMsg()): ServerResponse.successWithData(bean);
	}
	/**
	 * 通过二级分类ID 来查找一级分类信息
	 * @param key 二级分类ID
	 * @return serverResponse
	 */
	@Override
	public ServerResponse<BackendNovelTypePrimary> selectPrimaryTypeBySonTypeId(Long key) {
		BackendNovelTypeSecondary sonBean = typeSonDao.selectOneByPrimaryKey(key);
		BackendNovelTypePrimary bean = typeDao.selectOneByPrimaryKey(sonBean.getFatherTypeId());
		return bean.getTypeId() == null ? ServerResponse.failWithMsg(404, ServerStatusCodeEnum.NOT_FOUND.getMsg()): ServerResponse.successWithData(bean);
	}

	@Override
	public ServerResponse<List<BackendNovelTypePrimary>> selectAllPrimaryType() {
		List<BackendNovelTypePrimary> resultList = typeDao.selectListByTemplate(new BackendNovelTypePrimary());
		return resultList.isEmpty() ? ServerResponse.failWithMsg(404, ServerStatusCodeEnum.NOT_FOUND.getMsg()) : ServerResponse.successWithData(resultList);
	}

}
