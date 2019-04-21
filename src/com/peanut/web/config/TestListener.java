package com.peanut.web.config;

import com.peanut.common.util.DbUtil;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.sql.Connection;

/**
 * description: 测试.
 *
 * @author huangs
 * @date 2019-04-21
 * @see com.peanut.web.config
 * @since 1.0
 */
public class TestListener implements ServletContextListener {
  @Override
  public void contextInitialized(ServletContextEvent servletContextEvent) {
    Connection connection = DbUtil.getConnection();
  }

  @Override
  public void contextDestroyed(ServletContextEvent servletContextEvent) {

  }
}
