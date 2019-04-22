package com.peanut.dao;

import java.util.List;

/**
 * description: Dao接口父类.
 *
 * @author huangs
 * @date 2019-04-21
 * @see com.peanut.dao
 * @since 1.0
 */
public interface BaseDao<T> {

  /**
   * 新增entity对象
   * @param entity 新增entity对象
   * @return 新增是否成功
   */
  boolean insert(T entity);

  /**
   * 根据主键删除
   * @param primaryKey 主键
   * @return 删除是否成功
   */
  boolean deleteByPrimaryKey(Object primaryKey);

  /**
   * 根据模板更新
   * @param entityTemplate 更新模板
   * @return 更新是否成功
   */
  boolean updateByTemplate(T entityTemplate);

  /**
   * 根据主键查找
   * @param primaryKey 主键
   * @return entity
   */
  T selectOneByPrimaryKey(Object primaryKey);

  /**
   * 根据模板查找
   * @param entityTemplate 查找模板
   * @return entity
   */
  T selectOneByTemplate(T entityTemplate);

  /**
   * 根据模板查找List
   * @param entityTemplate 查找模板
   * @param fuzzyQueryFields 要开始模糊查询的字段名(可变参数列表)
   * @return List<entity>
   */
  List<T> selectListByTemplate(T entityTemplate, String...fuzzyQueryFields);

  /**
   * 查找所有
   * @return List<entity>
   */
  List<T> selectAll();

}
