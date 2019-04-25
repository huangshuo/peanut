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
   *
   * @param pageNum  页码
   * @param pageSize 分页大小
   * @param typeId   游戏类型id
   * @param platform 游戏平台id
   * @return serverResponse
   */
  ServerResponse<PageInfo<Game>> pageQueryByTypeIdPlatform(int pageNum, int pageSize, int typeId, int platform);

  /**
   * 根据游戏id查询游戏详情信息
   *
   * @param gameId 游戏id
   * @return serverResponse
   */
  ServerResponse<Game> getGameInfoByGameId(long gameId);

  /**
   * 添加游戏
   * @param game 游戏信息对象
   * @return serverResponse
   */
  ServerResponse addGame(Game game);

  /**
   * 根据游戏名删除游戏
   * @param name 游戏名
   * @return serverResponse
   */
  ServerResponse deleteGameByGameName(String name);

  /**
   * 修改游戏信息
   * @param game 修改后的游戏信息
   * @return serverResponse
   */
  ServerResponse modifyGame(Game game);

  /**
   * 分页查询所有游戏
   * @param pageNum 页码
   * @param pageSize 分页大小
   * @return serverResponse
   */
  ServerResponse<PageInfo<Game>> pageQueryAll(int pageNum, int pageSize);
}
