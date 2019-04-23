package com.peanut.web.service;

import com.peanut.common.http.ServerResponse;
import com.peanut.entity.pojo.Game;
import com.peanut.entity.vo.PageInfo;

/**
 * description: 游戏Service接口.
 *
 * @author huangs
 * @date 2019-04-23
 * @see com.peanut.web.service
 * @since 1.0
 */
public interface GameService {

  /**
   * 根据游戏类型id和平台id分页查询游戏
   * @param pageNum 页码
   * @param pageSize 分页大小
   * @param typeId 游戏类型id
   * @param platform 游戏平台id
   * @return serverResponse
   */
  ServerResponse<PageInfo<Game>> pageQueryByTypeIdPlatform(int pageNum, int pageSize, int typeId, int platform);

  /**
   * 根据游戏id查询游戏详情信息
   * @param gameId 游戏id
   * @return serverResponse
   */
  ServerResponse<Game> getGameInfoByGameId(long gameId);
}
