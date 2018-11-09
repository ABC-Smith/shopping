/*
MySQL Data Transfer
Source Host: localhost
Source Database: mysmsc
Target Host: localhost
Target Database: mysmsc
Date: 2018/9/17 19:44:36
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for smsc_addr
-- ----------------------------
CREATE TABLE `smsc_addr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `prov` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `addr` varchar(200) DEFAULT NULL,
  `zip` varchar(20) DEFAULT NULL COMMENT '邮编',
  `email` varchar(200) DEFAULT NULL,
  `tel` varchar(30) DEFAULT NULL,
  `mobile` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `smsc_addr_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `smsc_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for smsc_brand
-- ----------------------------
CREATE TABLE `smsc_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '品牌id',
  `cate_id` int(11) DEFAULT NULL COMMENT '商品分类id',
  `name` varchar(100) DEFAULT NULL COMMENT '品牌名称',
  `desc` varchar(255) DEFAULT NULL COMMENT '描述',
  `logo` varchar(255) DEFAULT NULL COMMENT 'logo',
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`),
  CONSTRAINT `smsc_brand_ibfk_1` FOREIGN KEY (`cate_id`) REFERENCES `smsc_cate` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for smsc_cart
-- ----------------------------
CREATE TABLE `smsc_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `goods_id` (`goods_id`),
  CONSTRAINT `smsc_cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `smsc_user` (`id`) ON DELETE SET NULL,
  CONSTRAINT `smsc_cart_ibfk_2` FOREIGN KEY (`goods_id`) REFERENCES `smsc_goods` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for smsc_cate
-- ----------------------------
CREATE TABLE `smsc_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '商品类型名',
  `parent_id` int(11) DEFAULT NULL COMMENT '父id',
  `sort` int(11) DEFAULT NULL COMMENT '分类顺序',
  `isDele` tinyint(4) DEFAULT NULL COMMENT '是否删除',
  `createdTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifiedTime` datetime DEFAULT NULL COMMENT '修改时间',
  `createdUser` varchar(50) DEFAULT NULL COMMENT '创建用户',
  `modifiedUser` varchar(50) DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for smsc_goods
-- ----------------------------
CREATE TABLE `smsc_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brand_id` int(11) DEFAULT NULL COMMENT '品牌id',
  `cate_id` int(11) DEFAULT NULL COMMENT '分类id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `desc` text COMMENT '简介',
  `memo` text COMMENT '详细描述',
  `storage` int(11) DEFAULT NULL COMMENT '库存',
  `unit` varchar(50) DEFAULT NULL COMMENT '单位',
  `price` decimal(12,2) DEFAULT NULL COMMENT '价格',
  `costprice` decimal(12,2) DEFAULT NULL COMMENT '成本',
  `discount` double unsigned DEFAULT '1' COMMENT '折扣',
  `bigImg` varchar(200) DEFAULT NULL COMMENT '大图片',
  `smallImg` varchar(200) DEFAULT NULL COMMENT '小图片',
  `search_num` int(11) DEFAULT NULL COMMENT '搜索热度',
  `sold_num` int(10) unsigned DEFAULT NULL COMMENT '商品销量',
  `sort` int(11) DEFAULT NULL COMMENT '显示顺序',
  `isDele` tinyint(3) DEFAULT NULL COMMENT '是否删除',
  `isSpecial` tinyint(4) DEFAULT NULL COMMENT '是否特价',
  `isNew` tinyint(4) DEFAULT NULL COMMENT '是否最新',
  `isRecommend` tinyint(4) DEFAULT NULL COMMENT '是否推荐',
  `createdTime` datetime DEFAULT NULL COMMENT '创建时间',
  `modifiedTime` datetime DEFAULT NULL COMMENT '修改时间',
  `createdUser` varchar(50) DEFAULT NULL COMMENT '创建用户',
  `modifiedUser` varchar(50) DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`id`),
  KEY `brand_id` (`brand_id`),
  KEY `cate_id` (`cate_id`),
  CONSTRAINT `smsc_goods_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `smsc_brand` (`id`) ON DELETE SET NULL,
  CONSTRAINT `smsc_goods_ibfk_2` FOREIGN KEY (`cate_id`) REFERENCES `smsc_cate` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for smsc_manager
-- ----------------------------
CREATE TABLE `smsc_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `last_log` datetime DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for smsc_order
-- ----------------------------
CREATE TABLE `smsc_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `addr_id` int(11) DEFAULT NULL COMMENT '地址id',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态',
  `createTime` datetime DEFAULT NULL COMMENT '生成时间',
  `dealTime` datetime DEFAULT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for smsc_orderitem
-- ----------------------------
CREATE TABLE `smsc_orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `amount` int(11) DEFAULT NULL COMMENT '数量',
  `price` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for smsc_user
-- ----------------------------
CREATE TABLE `smsc_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL COMMENT '等级',
  `username` varchar(50) DEFAULT NULL COMMENT '账号',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `gender` varchar(20) DEFAULT NULL COMMENT '性别',
  `birth` date DEFAULT NULL COMMENT '生日',
  `email` varchar(200) DEFAULT NULL COMMENT '电子邮件',
  `tel` varchar(30) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(30) DEFAULT NULL COMMENT '手机',
  `qq` varchar(18) DEFAULT NULL COMMENT 'QQ',
  `reg_time` datetime DEFAULT NULL COMMENT '注册时间',
  `ip` varchar(16) DEFAULT NULL COMMENT 'IP',
  `point` int(11) DEFAULT NULL COMMENT '积分点数',
  `state` tinyint(4) DEFAULT NULL COMMENT '状态',
  `pwQuestion` varchar(250) DEFAULT NULL COMMENT '密码问题',
  `pwAnswer` varchar(250) DEFAULT NULL COMMENT '密码答案',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
