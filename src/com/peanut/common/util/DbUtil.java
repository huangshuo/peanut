package com.peanut.common.util;

import com.alibaba.druid.pool.DruidDataSource;

import java.sql.*;

/**
 * description: 数据库工具类.
 *
 * @author huangs
 * @date 2019-04-20
 * @see com.peanut.common.util
 * @since 1.0
 */
public final class DbUtil {

  private DbUtil() {
  }

  private static final ThreadLocal<Connection> LOCAL_CONNECTION = new ThreadLocal<>();

  /**
   * 获取数据库连接
   *
   * @return 连接对象connection
   */
  public static Connection getConnection() {
    Connection connection = LOCAL_CONNECTION.get();
    if (connection == null) {
      DruidDataSource dataSource = new DruidDataSource();
      dataSource.setUrl(PropertyUtil.getProperty(PropertyUtil.JDBC_URL));
      dataSource.setUsername(PropertyUtil.getProperty(PropertyUtil.JDBC_USERNAME));
      dataSource.setPassword(PropertyUtil.getProperty(PropertyUtil.JDBC_PASSWORD));
      dataSource.setDriverClassName(PropertyUtil.getProperty(PropertyUtil.JDBC_DRIVER));
      try {
        connection = dataSource.getConnection();
        LOCAL_CONNECTION.set(connection);
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
    return connection;
  }

  /**
   * 释放数据库连接
   */
  public static void closeConnection() {
    Connection connection = LOCAL_CONNECTION.get();
    if (connection != null) {
      try {
        connection.close();
        LOCAL_CONNECTION.remove();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  }

  /**
   * 开始事务
   */
  public static void startTransaction() {
    Connection connection = LOCAL_CONNECTION.get();
    if (connection == null) {
      connection = getConnection();
      LOCAL_CONNECTION.set(connection);
    }
    try {
      connection.setAutoCommit(false);
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }

  /**
   * 提交事务
   *
   * @return 事务是否成功提交
   */
  public static boolean commit() {
    Connection connection = LOCAL_CONNECTION.get();
    if (connection != null) {
      try {
        connection.commit();
        return true;
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
    return false;
  }

  /**
   * 设置savepoint
   *
   * @return savepoint对象
   */
  public static Savepoint getSavepoint() {
    Connection connection = LOCAL_CONNECTION.get();
    Savepoint savepoint = null;
    if (connection != null) {
      try {
        savepoint = connection.setSavepoint();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
    return savepoint;
  }

  /**
   * 事务回滚
   *
   * @param savepoint savepoint
   */
  public static void rollback(Savepoint... savepoint) {
    Connection connection = LOCAL_CONNECTION.get();
    if (connection != null) {
      try {
        if (savepoint != null && savepoint[0] != null) {
          connection.rollback(savepoint[0]);
        } else {
          connection.rollback();
        }
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  }

}
