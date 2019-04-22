package com.peanut.web.service.impl;

import com.peanut.common.http.ServerResponse;
import com.peanut.dao.BaseDao;
import com.peanut.dao.impl.VFirstListDaoImpl;
import com.peanut.entity.pojo.VFirstList;
import com.peanut.web.service.VFirstListService;

import java.util.List;

/**
 * description: .
 *
 * @author JAVASM
 * @date 2019-04-22
 * @see com.peanut.web.service.impl
 * @since 1.0
 */
public class VFirstListServiceImpl implements VFirstListService {

  @Override
  public ServerResponse vfirstlist() {
    BaseDao bd=new VFirstListDaoImpl();
    List<VFirstList> list=bd.selectAll();
    ServerResponse<List<VFirstList>> serverResponse=ServerResponse.successWithData(list);
    return serverResponse;
  }
}
