package com.peanut.dao.impl;

import com.peanut.common.util.DbUtil;
import com.peanut.dao.BaseDao;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.ParameterizedType;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * description: BaseDao接口实现类.
 *
 * @author huangs
 * @date 2019-04-21
 * @see com.peanut.dao.impl
 * @since 1.0
 */
public class BaseDaoImpl<T> implements BaseDao<T> {

  /**
   * 实体类Class对象
   */
  private Class<?> entityClass;
  /**
   * 实体类的Field集合
   */
  private Field[] entityFields;

  public BaseDaoImpl() {
    ParameterizedType parameterizedType = (ParameterizedType) this.getClass().getGenericSuperclass();
    entityClass = (Class<?>) parameterizedType.getActualTypeArguments()[0];
    entityFields = entityClass.getDeclaredFields();
  }

  /**
   * 新增entity对象
   *
   * @param entity 新增entity对象
   * @return entity
   */
  @Override
  public boolean insert(T entity) {
    StringBuilder sqlBuilder = new StringBuilder();
    sqlBuilder.append("INSERT INTO tb_").append(entityClass.getSimpleName());
    sqlBuilder.append(getFieldSql(entity))
        .append(" VALUES").append(getValueSql(entity));
    return executeSql(sqlBuilder);
  }

  /**
   * 根据主键删除
   *
   * @param primaryKey 主键
   * @return 删除是否成功
   */
  @Override
  public boolean deleteByPrimaryKey(Long primaryKey) {
    StringBuilder sqlBuilder = new StringBuilder();
    sqlBuilder.append("DELETE FROM tb_").append(entityClass.getSimpleName())
        .append(" WHERE ")
        .append(entityFields[0].getName()).append(" = ").append(primaryKey);
    return executeSql(sqlBuilder);
  }

  /**
   * 根据模板更新
   *
   * @param entityTemplate 更新模板
   * @return 更新是否成功
   */
  @Override
  public boolean updateByTemplate(T entityTemplate) {
    StringBuilder sqlBuilder = new StringBuilder();
    sqlBuilder.append("UPDATE tb_").append(entityClass.getSimpleName())
        .append(" SET ");
    // 不更新主键(主键默认为第一个字段)
    for (int i = 1; i < entityFields.length; i++) {
      Field field = entityFields[i];
      Object fieldValue = getFieldValue(entityTemplate, field);
      if (fieldValue != null) {
        sqlBuilder.append(field.getName()).append(" = ");
        if (String.class.equals(field.getType()) || Date.class.equals(field.getType()) || Timestamp.class.equals(field.getType())) {
          sqlBuilder.append("'").append(fieldValue).append("'");
        } else {
          sqlBuilder.append(fieldValue);
        }
        sqlBuilder.append(",");
      }
    }
    // 去掉最后一个,
    sqlBuilder.deleteCharAt(sqlBuilder.lastIndexOf(","));
    sqlBuilder.append(" WHERE ")
        .append(entityFields[0].getName()).append(" = ").append(getFieldValue(entityTemplate, entityFields[0]));
    return executeSql(sqlBuilder);
  }

  /**
   * 根据主键查找
   *
   * @param primaryKey 主键
   * @return entity
   */
  @Override
  public T selectOneByPrimaryKey(Long primaryKey) {
    StringBuilder sqlBuilder = new StringBuilder();
    sqlBuilder.append("SELECT * FROM tb_").append(entityClass.getSimpleName())
        .append(" WHERE ")
        .append(entityFields[0].getName()).append(" = ").append(primaryKey);
    ResultSet resultSet;
    T resultEntity = null;
    Connection connection = DbUtil.getConnection();
    try (PreparedStatement preparedStatement = connection.prepareStatement(sqlBuilder.toString())) {
      resultEntity = (T) entityClass.newInstance();
      resultSet = preparedStatement.executeQuery();
      while (resultSet.next()) {
        // 遍历实体对象的字段
        for (Field field : entityFields) {
          PropertyDescriptor propertyDescriptor = new PropertyDescriptor(field.getName(), entityClass);
          // 获取resultSet中指定字段的值
          Object fieldValue = resultSet.getObject(field.getName());
          // 通过set方法设置该字段的值
          propertyDescriptor.getWriteMethod().invoke(resultEntity, fieldValue);
        }
      }
    } catch (SQLException | IllegalAccessException | InstantiationException | IntrospectionException | InvocationTargetException e) {
      e.printStackTrace();
    } finally {
      DbUtil.closeConnection();
    }
    return resultEntity;
  }

  /**
   * 查找所有
   *
   * @return List<entity>
   */
  @Override
  public List<T> selectAll() {
    StringBuilder sqlBuilder = new StringBuilder();
    sqlBuilder.append("SELECT * FROM tb_").append(entityClass.getSimpleName());
    ResultSet resultSet;
    List<T> resultList = new ArrayList<>();
    Connection connection = DbUtil.getConnection();
    try (PreparedStatement preparedStatement = connection.prepareStatement(sqlBuilder.toString())) {
      resultSet = preparedStatement.executeQuery();
      while (resultSet.next()) {
        T resultEntity = (T) entityClass.newInstance();
        // 遍历实体对象的字段
        for (Field field : entityFields) {
          PropertyDescriptor propertyDescriptor = new PropertyDescriptor(field.getName(), entityClass);
          // 获取resultSet中指定字段的值
          Object fieldValue = resultSet.getObject(field.getName());
          // 通过set方法设置该字段的值
          propertyDescriptor.getWriteMethod().invoke(resultEntity, fieldValue);
        }
        resultList.add(resultEntity);
      }
    } catch (SQLException | IllegalAccessException | InstantiationException | IntrospectionException | InvocationTargetException e) {
      e.printStackTrace();
    } finally {
      DbUtil.closeConnection();
    }
    return resultList;
  }

  /**
   * 拼接sql语句的字段sql
   * @param entity entity对象
   * @return String
   */
  private String getFieldSql(T entity) {
    StringBuilder stringBuilder = new StringBuilder("(");
    for (Field field : entityFields) {
      if (getFieldValue(entity, field) != null) {
        // 拼接不为空的字段名
        stringBuilder.append(field.getName()).append(",");
      }
    }
    // 将最后一个,替换为)
    stringBuilder.setCharAt(stringBuilder.lastIndexOf(","), ')');
    return stringBuilder.toString();
  }

  /**
   * 拼接sql语句VALUES的sql
   * @param entity entity对象
   * @return String
   */
  private String getValueSql(T entity) {
    StringBuilder stringBuilder = new StringBuilder("(");
    for (Field field : entityFields) {
      Object fieldValue = getFieldValue(entity, field);
      if (fieldValue != null) {
        // String/LocalDate/LocalDateTime类型的值加上单引号
        if (String.class.equals(field.getType()) || Date.class.equals(field.getType()) || Timestamp.class.equals(field.getType())) {
          stringBuilder.append("'").append(fieldValue).append("'");
        } else {
          stringBuilder.append(fieldValue);
        }
        stringBuilder.append(",");
      }
    }
    stringBuilder.setCharAt(stringBuilder.lastIndexOf(","), ')');
    return stringBuilder.toString();
  }

  /**
   * 获取字段值
   * @param field 字段
   * @param entity entity对象
   * @return Object
   */
  private Object getFieldValue(T entity, Field field) {
    Object fieldValue = null;
    try {
      PropertyDescriptor propertyDescriptor = new PropertyDescriptor(field.getName(), entityClass);
      // 通过get方法获取指定字段的值
      fieldValue = propertyDescriptor.getReadMethod().invoke(entity);
    } catch (IntrospectionException | IllegalAccessException | InvocationTargetException e) {
      e.printStackTrace();
    }
    return fieldValue;
  }

  /**
   * 执行指定的sql语句
   * @param sqlBuilder sqlBuilder
   * @return boolean
   */
  private boolean executeSql(StringBuilder sqlBuilder) {
    boolean succeed = false;
    Connection connection = DbUtil.getConnection();
    try (PreparedStatement preparedStatement = connection.prepareStatement(sqlBuilder.toString())) {
      DbUtil.startTransaction();
      int rowAffected = preparedStatement.executeUpdate();
      succeed = rowAffected > 0 && DbUtil.commit();
    } catch (SQLException e) {
      e.printStackTrace();
      DbUtil.rollback();
    } finally {
      DbUtil.closeConnection();
    }
    return succeed;
  }
}
