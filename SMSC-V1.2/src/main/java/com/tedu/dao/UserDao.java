package com.tedu.dao;

import java.util.List;
import java.util.Map;

import com.tedu.entity.User;

public interface UserDao {
    int deleteByPrimaryKey(Integer uid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer uid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
}