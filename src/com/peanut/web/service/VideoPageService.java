package com.peanut.web.service;

import com.peanut.common.http.ServerResponse;
import com.peanut.entity.pojo.VideoPage;

import java.util.List;

/**
 * description: .
 *
 * @author JAVASM
 * @date 2019-04-22
 * @see com.peanut.web.service
 * @since 1.0
 */
public interface VideoPageService {
  ServerResponse<List<VideoPage>> videoPage(Long fid);
}
