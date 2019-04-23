package com.peanut.web.service.impl;

import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServerStatusCodeEnum;
import com.peanut.dao.GameDao;
import com.peanut.dao.impl.GameDaoImpl;
import com.peanut.entity.pojo.Game;
import com.peanut.entity.vo.PageInfo;
import com.peanut.web.service.GameService;

/**
 * description: 游戏Service接口实现类.
 *
 * @author huangs
 * @date 2019-04-23
 * @see com.peanut.web.service.impl
 * @since 1.0
 */
public class GameServiceImpl implements GameService {

  private static GameDao gameDao = new GameDaoImpl();
  /**
   * 根据游戏类型id和平台id分页查询游戏
   *
   * @param pageNum  页码
   * @param pageSize 分页大小
   * @param typeId   游戏类型id
   * @param platform 游戏平台id
   * @return serverResponse
   */
  @Override
  public ServerResponse<PageInfo<Game>> pageQueryByTypeIdPlatform(int pageNum, int pageSize, int typeId, int platform) {
    Game gameTemplate = new Game();
    gameTemplate.setGameTypeId(typeId);
    gameTemplate.setPlatform(platform);
    PageInfo<Game> pageInfo = gameDao.pageQueryByTemplate(pageNum, pageSize, gameTemplate);
    if (pageInfo != null) {
      return ServerResponse.successWithData(pageInfo);
    }
    return ServerResponse.failWithMsg(ServerStatusCodeEnum.NOT_FOUND.getCode(), ServerStatusCodeEnum.NOT_FOUND.getMsg());
  }

  /**
   * 根据游戏id查询游戏详情信息
   *
   * @param gameId 游戏id
   * @return serverResponse
   */
  @Override
  public ServerResponse<Game> getGameInfoByGameId(long gameId) {
    Game game = gameDao.selectOneByPrimaryKey(gameId);
    if (game.getGameId() == null) {
      return ServerResponse.failWithMsg(ServerStatusCodeEnum.NOT_FOUND.getCode(), "游戏不存在");
    }
    return ServerResponse.successWithData(game);
  }
}
