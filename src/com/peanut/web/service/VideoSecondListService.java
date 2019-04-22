package com.peanut.web.service;

import com.peanut.common.http.ServerResponse;
import com.peanut.entity.pojo.VideoSecondList;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * description: .
 *
 * @author JAVASM
 * @date 2019-04-22
 * @see com.peanut.web.service
 * @since 1.0
 */
public interface VideoSecondListService {
    ServerResponse<List<VideoSecondList>> videoSecondList(Long cid);
}
