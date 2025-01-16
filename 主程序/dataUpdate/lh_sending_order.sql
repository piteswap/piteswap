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

 Date: 18/02/2022 23:31:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for lh_sending_order
-- ----------------------------
DROP TABLE IF EXISTS `lh_sending_order`;
CREATE TABLE `lh_sending_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `day` int(11) NOT NULL COMMENT '锁仓时间',
  `amount` decimal(20,4) NOT NULL COMMENT '购买币数量',
  `change_rate` decimal(20,4) NOT NULL COMMENT '兑换率',
  `new_currency_num` decimal(20,4) NOT NULL COMMENT '新币数量',
  `interest` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '收益',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:进行中 2：已结束',
  `config_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

SET FOREIGN_KEY_CHECKS = 1;
