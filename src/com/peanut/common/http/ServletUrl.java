package com.peanut.common.http;

/**
 * description: ServletUrl配置类.
 *
 * @author huangs
 * @date 2019-04-25
 * @see com.peanut.common.http
 * @since 1.0
 */
public final class ServletUrl {

  /**
   * description: 后台ServletUrl.
   */
  public interface Backend {

    String LOGIN = "/backend/login";
    String LOGOUT = "/backend/logout";
    String USER_LIST = "/backend/user/list";
    String ADD_USER = "/backend/user/add";
    String DELETE_USER = "/backend/user/delete";
    String MODIFY_USER = "/backend/user/modify";
    String ADD_GAME = "/backend/game/add";
    String DELETE_GAME = "/backend/game/delete";
    String MODIFY_GAME = "/backend/game/modify";
    String GAME_LIST = "/backend/game/list";
    String GAME_INFO = "/backend/game/info";
    String USER_INFO = "/backend/user/info";
    String USER_PERMISSION = "/backend/user/permission";
    String USER_MENU_LIST = "/backend/user/menu/list";
    String UPDATE_NOVEL = "/backend/novel/update";
    String SELECT_NOVEL = "/backend/novel/select";
    String SELECT_NOVEL_TYPE = "/backend/novel/select/type";
    String SELECT_NOVEL_TYPE_ALL = "/backend/novel/select/type/all";
    String CHANNEL_CLASS_MANAGE = "/backend/channel/class/manage";
    String CHANNEL_INSERT = "/channel/insert";
    String MENU_MANAGE = "/menu/manage";
    String MENU_UPDATE = "/menu/update";
    String MENU_INSERT = "/menu/insert";
    String MENU_DELETE = "/menu/delete";
    String CHANNEL_MANAGE = "/channel/manage";
    String CHANNEL_DELETE = "/channel/delete";
    String USER_SESSION = "/backend/user/session";
    String PASSWORD = "/backend/password";
    String UPLOAD = "/backend/upload";
  }

  /**
   * description: 前端ServletUrl.
   *
   */
  public interface Portal {

    String GAME_INFO = "/game/info";
    String GAME_LIST = "/game/list";
    String CHAPTER_CONTEXT = "/novel/chapter/context";
    String NOVEL_DETAIL = "/novel/detail";
    String NOVEL_LIST_BY_NOVEL_ID = "/novel/list/novel_id";
    String NOVEL_LIST_SAME_TYPE = "/novel/list/same_type";
    String NOVEL_LIST_BY_TYPE_ID = "/novel/list/type_id";
    String FEEDBACK = "/user/feedback";
    String LOGIN = "/user/login";
    String MODIFY_USER_INFO = "/user/info/modify";
    String SERVER_TIME = "/server_time";
    String USER_INFO = "/user/info";
    String VIDEO_DETAIL = "/video/detail";
    String VIDEO_EPISODE_DETAIL = "/video/episode/detail";
    String VIDEO_PAGE = "/video/page";
    String VIDEO_FIRST_LIST = "/video/list/first";
    String VIDEO_SECOND_LIST = "/video/list/second";

  }
}