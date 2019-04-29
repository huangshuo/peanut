package com.peanut.web.service;

import com.peanut.common.http.ServerResponse;
import com.peanut.entity.pojo.BackendChannelManage;
import com.peanut.entity.vo.PageInfo;


/**
 * description: .
 *
 * @author JAVASM
 * @date 2019-04-26
 * @see com.peanut.web.service
 * @since 1.0
 */
public interface ChannelService {
  ServerResponse<PageInfo<BackendChannelManage>> channelManage(int page, int pageSize);
  ServerResponse<PageInfo<BackendChannelManage>> channelManage(int page, int pageSize,BackendChannelManage backendChannelManage);
}
