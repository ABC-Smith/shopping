package com.tedu.dao;

import java.util.List;
import java.util.Map;

import com.tedu.entity.Goods;

public interface GoodsDao {
    int deleteByPrimaryKey(Integer gid);

    int insert(Goods record);

    int insertSelective(Goods record);

    Goods selectByPrimaryKey(Integer gid);

    int updateByPrimaryKeySelective(Goods record);

    int updateByPrimaryKey(Goods record);
    
    List<Map<String, Object>> selectAllGoods();
}