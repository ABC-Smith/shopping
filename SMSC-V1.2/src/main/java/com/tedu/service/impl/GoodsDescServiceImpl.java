package com.tedu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tedu.common.exception.ServiceException;
import com.tedu.dao.GoodsDao;
import com.tedu.entity.Goods;
import com.tedu.service.GoodsDescService;

@Service
public class GoodsDescServiceImpl implements GoodsDescService {
	@Autowired
	GoodsDao goodsDao;
	
	@Override
	public Goods getGoodsDescById(Integer gid) {
		//判断参数合法性
		if(gid==null||gid<1)
			throw new IllegalArgumentException("无效的商品id");
		//获取商品信息
		Goods entity = goodsDao.selectByPrimaryKey(gid);
		if(entity==null)
			throw new ServiceException("商品可能已经不存在了");
		
		return entity;
	}

}
