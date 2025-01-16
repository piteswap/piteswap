/*
 Navicat MySQL Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : 127.0.0.1:3306
 Source Schema         : 51ex_io

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 18/02/2022 23:30:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for lh_sending_config
-- ----------------------------
DROP TABLE IF EXISTS `lh_sending_config`;
CREATE TABLE `lh_sending_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `new_currency_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '新币名称',
  `currency_id` int(11) NOT NULL COMMENT '申购兑换币',
  `change_rate` decimal(10,4) NOT NULL COMMENT '兑换率',
  `interest_rate` decimal(10,4) NOT NULL COMMENT '收益率',
  `predict_rate` varchar(20) NOT NULL COMMENT '预计收益率',
  `num` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '申购总数量',
  `buy_num` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '最小购买数量',
  `day` int(11) DEFAULT '0' COMMENT '锁仓时间',
  `send_start` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申购开始时间',
  `online_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '预计上线时间',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '编辑时间',
  `introduction` varchar(255) NOT NULL COMMENT '介绍',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
