package com.peanut.dao.impl;

import com.peanut.common.util.DbUtil;
import com.peanut.common.util.StringUtil;
import com.peanut.dao.BaseDao;
import com.peanut.entity.vo.PageInfo;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.ParameterizedType;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * description: BaseDao接口实现类.
 *
 * @author huangs
 * @date 2019-04-21
 * @see com.peanut.dao.impl
 * @since 1.0
 */
@SuppressWarnings("unchecked")
public class BaseDaoImpl<T> implements BaseDao<T> {

  /**
   * 实体类Class对象
   */
  private Class<?> entityClass;
  /**
   * 实体类的Field集合
   */
  private Field[] entityFields;

  BaseDaoImpl() {
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
    sqlBuilder.append("INSERT INTO ").append(getTableName());
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
  public boolean deleteByPrimaryKey(Object primaryKey) {
    StringBuilder sqlBuilder = new StringBuilder();
    sqlBuilder.append("DELETE FROM ").append(getTableName())
        .append(" WHERE ")
        .append(entityFields[0].getName()).append(" = ");
    if (String.class.equals(entityFields[0].getType())) {
      sqlBuilder.append("'").append(primaryKey).append("'");
    } else {
      sqlBuilder.append(primaryKey);
    }
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
    sqlBuilder.append("UPDATE ").append(getTableName())
        .append(" SET ");
    // 不更新主键(主键默认为第一个字段)
    for (int i = 1; i < entityFields.length; i++) {
      Field field = entityFields[i];
      Object fieldValue = getFieldValue(entityTemplate, field);
      if (fieldValue != null) {
        sqlBuilder.append(getNameValueSql(field, fieldValue, false));
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
  public T selectOneByPrimaryKey(Object primaryKey) {
    T entityTemplate = null;
    try {
      entityTemplate = (T) entityClass.newInstance();
      PropertyDescriptor propertyDescriptor = new PropertyDescriptor(entityFields[0].getName(), entityClass);
      propertyDescriptor.getWriteMethod().invoke(entityTemplate, primaryKey);
    } catch (InstantiationException | IllegalAccessException | IntrospectionException | InvocationTargetException e) {
      e.printStackTrace();
    }
    return selectOneByTemplate(entityTemplate);
  }

  /**
   * 根据模板查找
   *
   * @param entityTemplate 查找模板
   * @return entity
   */
  @Override
  public T selectOneByTemplate(T entityTemplate) {
    StringBuilder sqlBuilder = new StringBuilder();
    sqlBuilder.append("SELECT * FROM ").append(getTableName())
        .append(" WHERE 1 = 1 ");
    // 获取非空字段
    try {
      for (Field field :entityFields) {
        PropertyDescriptor propertyDescriptor = new PropertyDescriptor(field.getName(), entityClass);
        Object fieldValue = propertyDescriptor.getReadMethod().invoke(entityTemplate);
        if (fieldValue != null) {
          sqlBuilder.append("AND ").append(getNameValueSql(field, fieldValue, false));
        }
      }
    } catch (IntrospectionException | IllegalAccessException | InvocationTargetException e) {
      e.printStackTrace();
    }
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
          Object fieldValue = resultSet.getObject(getColumnName(field));
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
   * 根据模板查找List
   *
   * @param entityTemplate   查找模板(传入null时表示查找所有)
   * @param fuzzyQueryFields 要开始模糊查询的字段名(可变参数列表)
   * @return List<entity>
   */
  @Override
  public List<T> selectListByTemplate(T entityTemplate, String... fuzzyQueryFields) {
    return executeSqlForList(getSqlForSelectListByTemplate(entityTemplate, fuzzyQueryFields));
  }

  /**
   * 根据模版分页查询
   *
   * @param pageNum          页码
   * @param pageSize         分页大小
   * @param entityTemplate   查询模板(传入null时表示查询所有)
   * @param fuzzyQueryFields 模糊查询的字段
   * @return pageInfo<entity>
   */
  @Override
  public PageInfo<T> pageQueryByTemplate(int pageNum, int pageSize, T entityTemplate, String... fuzzyQueryFields) {
    StringBuilder sqlBuilder = getSqlForSelectListByTemplate(entityTemplate, fuzzyQueryFields);
    // 获取总行数
    int totalRow = executeSqlForList(sqlBuilder).size();
    // 总页数
    int totalPage = totalRow % pageSize == 0 ? totalRow /pageSize : totalRow / pageSize + 1;
    boolean isFirstPage = pageNum == 1;
    boolean isLastPage = pageNum == totalPage;
    pageNum = pageNum > 0 ? pageNum : 1;
    // 拼接分页参数
    sqlBuilder.append(" LIMIT ").append((pageNum - 1) * pageSize)
        .append(" , ").append(pageSize);
    List<T> resultList = executeSqlForList(sqlBuilder);
    return new PageInfo.Builder<T>(pageNum, pageSize)
        .pageData(resultList)
        .totalRow(totalRow)
        .totalPage(totalPage)
        .isFirstPage(isFirstPage)
        .isLastPage(isLastPage)
        .build();
  }

  /**
   * 拼接根据模版查询list的sql语句
   * @param entityTemplate 查询模板
   * @param fuzzyQueryFields 开启模糊查询的字段
   * @return StringBuilder
   */
  private StringBuilder getSqlForSelectListByTemplate(T entityTemplate, String... fuzzyQueryFields) {
    StringBuilder sqlBuilder = new StringBuilder();
    sqlBuilder.append("SELECT * FROM ").append(getTableName())
        .append(" WHERE 1 = 1 ");
    if (entityTemplate == null) {
      return sqlBuilder;
    }
    try {
      for (Field field :entityFields) {
        PropertyDescriptor propertyDescriptor = new PropertyDescriptor(field.getName(), entityClass);
        Object fieldValue = propertyDescriptor.getReadMethod().invoke(entityTemplate);
        if (fieldValue != null) {
          sqlBuilder.append(" AND ");
          // 模糊查询参数中包含此字段
          if (fuzzyQueryFields != null && Arrays.asList(fuzzyQueryFields).contains(getColumnName(field))) {
            sqlBuilder.append(getNameValueSql(field, fieldValue, true));
          } else {
            sqlBuilder.append(getNameValueSql(field, fieldValue, false));
          }
        }
      }
    } catch (IntrospectionException | IllegalAccessException | InvocationTargetException e) {
      e.printStackTrace();
    }
    return sqlBuilder;
  }

  /**
   * 执行返回操作成功与否的增加/修改/删除语句
   * @param sqlBuilder sql语句
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

  /**
   * 执行返回List的查询语句
   * @param sqlBuilder sql语句
   * @return List<T>
   */
  private List<T> executeSqlForList(StringBuilder sqlBuilder) {
    List<T> resultList = new ArrayList<>();
    Connection connection = DbUtil.getConnection();
    ResultSet resultSet;
    try (PreparedStatement preparedStatement = connection.prepareStatement(sqlBuilder.toString())) {
      resultSet = preparedStatement.executeQuery();
      while (resultSet.next()) {
        T resultEntity = (T) entityClass.newInstance();
        // 遍历实体对象的字段
        for (Field field : entityFields) {
          PropertyDescriptor propertyDescriptor = new PropertyDescriptor(field.getName(), entityClass);
          // 获取resultSet中指定字段的值
          Object fieldValue = resultSet.getObject(getColumnName(field));
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
   * 拼接sql语句的字段sql
   * @param entity entity对象
   * @return String
   */
  private String getFieldSql(T entity) {
    StringBuilder stringBuilder = new StringBuilder("(");
    for (Field field : entityFields) {
      if (getFieldValue(entity, field) != null) {
        // 拼接不为空的字段名
        stringBuilder.append(getColumnName(field)).append(",");
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
   * 拼接字段名 = 字段值/字段名 like 字段值
   * @param field 字段对象
   * @param fieldValue 字段值
   * @param fuzzy 是否开始模糊查询
   * @return String
   */
  private String getNameValueSql(Field field, Object fieldValue, boolean fuzzy) {
    StringBuilder stringBuilder = new StringBuilder();
    stringBuilder.append(getColumnName(field));
    if (fuzzy) {
      stringBuilder.append(" like ");
    } else {
      stringBuilder.append(" = ");
    }
    if (fuzzy) {
      stringBuilder.append("'").append("%").append(fieldValue).append("%").append("'");
    } else {
      if (String.class.equals(field.getType()) || Date.class.equals(field.getType()) || Timestamp.class.equals(field.getType())) {
        stringBuilder.append("'").append(fieldValue).append("'");
      } else {
        stringBuilder.append(fieldValue);
      }
    }
    return stringBuilder.toString();
  }

  /**
   * 获取实体类对应的数据库表名(tb_开头, 驼峰式转换为下划线)
   * @return String
   */
  private String getTableName() {
    return "tb" + StringUtil.convertCamelCaseToSnakeCase(entityClass.getSimpleName());
  }

  /**
   * 获取字段的数据库列名
   * @param field 字段对象
   * @return String
   */
  private String getColumnName(Field field) {
    return StringUtil.convertCamelCaseToSnakeCase(field.getName());
  }

}
