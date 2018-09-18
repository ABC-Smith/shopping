package com.tedu.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.springframework.stereotype.Service;

import com.tedu.dao.GoodsDao;
import com.tedu.dao.UserDao;
import com.tedu.entity.Goods;
import com.tedu.service.GoodsService;

@Service("userService")
public class GoodsServiceImpl implements GoodsService {
	@Resource
	private GoodsDao goodsDao;
	@Override
	public List<Map<String, Object>> getAllGoods() {
		return goodsDao.selectAllGoods();
	}
}
