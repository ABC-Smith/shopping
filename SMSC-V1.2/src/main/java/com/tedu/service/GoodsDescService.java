package com.tedu.service;

import com.tedu.entity.Goods;

/**
 * 商品详情service
 * @author tedu
 *
 */
public interface GoodsDescService {
	/**
	 * 根据id获取商品信息
	 * @param gid 商品id
	 * @return 返回goods实体对象
	 */
	Goods getGoodsDescById(Integer gid);
}
