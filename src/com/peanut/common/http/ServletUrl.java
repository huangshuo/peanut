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
    String MENU_MANAGE = "/menu/manage";
  }
}
