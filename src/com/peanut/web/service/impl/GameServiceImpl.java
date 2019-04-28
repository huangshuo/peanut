package com.peanut.web.service.impl;

import com.peanut.common.http.ServerResponse;
import com.peanut.common.http.ServerStatusCodeEnum;
import com.peanut.common.util.UidUtil;
import com.peanut.dao.BaseDao;
import com.peanut.dao.impl.BaseDaoImpl;
import com.peanut.entity.pojo.Game;
import com.peanut.entity.vo.PageInfo;
import com.peanut.web.service.GameService;

import java.sql.Timestamp;

/**
 * description: 游戏Service接口实现类.
 *
 * @author huangs
 * @date 2019-04-23
 * @see com.peanut.web.service.impl
 * @since 1.0
 */
public class GameServiceImpl implements GameService {

  private static BaseDao<Game> gameDao = new BaseDaoImpl<>(Game.class);

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
    // 查询状态为"启用"的游戏
    gameTemplate.setGameStatus(1);
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
   * @param backend 是否显示下线游戏
   * @return serverResponse
   */
  @Override
  public ServerResponse<Game> getGameInfoByGameId(long gameId, boolean backend) {
    Game game = gameDao.selectOneByPrimaryKey(gameId);
    if (!backend) {
      if (game.getGameId() == null || game.getGameStatus() != 1) {
        return ServerResponse.failWithMsg(ServerStatusCodeEnum.NOT_FOUND.getCode(), "游戏不存在");
      }
    }
    return ServerResponse.successWithData(game);
  }

  /**
   * 添加游戏
   *
   * @param game 游戏信息对象
   * @return serverResponse
   */
  @Override
  public ServerResponse addGame(Game game) {
    Game gameForName = new Game();
    gameForName.setName(game.getName());
    if (gameDao.selectOneByTemplate(gameForName).getGameId() != null) {
      return ServerResponse.failWithMsg(ServerStatusCodeEnum.DUPLICATE_KEY.getCode(), "游戏名已存在");
    }
    game.setGameId(UidUtil.getUid());
    game.setCreateTime(new Timestamp(System.currentTimeMillis()));
    // 初始下载量为0
    game.setDownloadCount(0);
    boolean succeed = gameDao.insert(game);
    if (succeed) {
      return ServerResponse.success();
    }
    return ServerResponse.failWithMsg(ServerStatusCodeEnum.FAIL.getCode(), ServerStatusCodeEnum.FAIL.getMsg());
  }

  /**
   * 根据游戏名删除游戏
   *
   * @param name 游戏名
   * @return serverResponse
   */
  @Override
  public ServerResponse deleteGameByGameName(String name) {
    Game gameForGameId = new Game();
    gameForGameId.setName(name);
    gameForGameId = gameDao.selectOneByTemplate(gameForGameId);
    if (gameForGameId.getGameId() == null || !gameDao.deleteByPrimaryKey(gameForGameId.getGameId())) {
      return ServerResponse.failWithMsg(ServerStatusCodeEnum.FAIL.getCode(), ServerStatusCodeEnum.FAIL.getMsg());
    }
    return ServerResponse.success();
  }

  /**
   * 修改游戏信息
   *
   * @param game 修改后的游戏信息
   * @return serverResponse
   */
  @Override
  public ServerResponse modifyGame(Game game) {
    Game gameForName = new Game();
    gameForName.setName(game.getName());
    gameForName = gameDao.selectOneByTemplate(gameForName);
    if (gameForName.getGameId() != null && !gameForName.getGameId().equals(game.getGameId())) {
      return ServerResponse.failWithMsg(ServerStatusCodeEnum.DUPLICATE_KEY.getCode(), "游戏名已存在");
    }
    game.setUpdateTime(new Timestamp(System.currentTimeMillis()));
    boolean succeed = gameDao.updateByTemplate(game);
    if (succeed) {
      return ServerResponse.success();
    }
    return ServerResponse.failWithMsg(ServerStatusCodeEnum.FAIL.getCode(), ServerStatusCodeEnum.FAIL.getMsg());
  }

  /**
   * 分页查询游戏
   *
   * @param pageNum  页码
   * @param pageSize 分页大小
   * @param gameName 游戏名称
   * @param gameType 游戏分类
   * @param recommendType 推荐类型
   * @param platform 游戏平台
   * @return serverResponse
   */
  @Override
  public ServerResponse<PageInfo<Game>> pageQueryGame(int pageNum, int pageSize, String gameName, int gameType, int recommendType, int platform) {
    Game gameTemplate = new Game();
    if (gameName != null && !gameName.equals("")) {
      gameTemplate.setName(gameName);
    }
    if (gameType != 0) {
      gameTemplate.setGameTypeId(gameType);
    }
    if (recommendType != 0) {
      gameTemplate.setRecommendType(recommendType);
    }
    if (platform != 0) {
      gameTemplate.setPlatform(platform);
    }
    PageInfo<Game> pageInfo = gameDao.pageQueryByTemplate(pageNum, pageSize, gameTemplate, "name");
    return ServerResponse.successWithData(pageInfo);
  }
}
