package com.tedu.dao;

import com.tedu.entity.History;

public interface HistoryDao {
    int deleteByPrimaryKey(Integer aid);

    int insert(History record);

    int insertSelective(History record);

    History selectByPrimaryKey(Integer aid);

    int updateByPrimaryKeySelective(History record);

    int updateByPrimaryKey(History record);
}