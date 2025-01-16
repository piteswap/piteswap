-- MySQL dump 10.13  Distrib 5.7.40, for Linux (x86_64)
--
-- Host: localhost    Database: timibbs_emejys
-- ------------------------------------------------------
-- Server version	5.7.40-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_log`
--

DROP TABLE IF EXISTS `account_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `value` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `created_time` int(10) unsigned NOT NULL DEFAULT '0',
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `currency` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `account_log_user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_log`
--

LOCK TABLES `account_log` WRITE;
/*!40000 ALTER TABLE `account_log` DISABLE KEYS */;
INSERT INTO `account_log` VALUES (1,3,-1000.00000000,1685362962,'币币划转合约',12,3),(2,3,1000.00000000,1685362962,'币币划转合约',15,3),(3,3,-1000.00000000,1685363476,'币币划转合约',12,3),(4,3,1000.00000000,1685363476,'币币划转合约',15,3),(5,3,-2000.00000000,1685363513,'合约划转期权',1001,3),(6,3,2000.00000000,1685363513,'合约划转期权',1002,3),(7,3,-100.00000000,1685363522,'秒合约下单扣除本金',1003,3),(8,3,-100.00000000,1685363615,'秒合约下单扣除本金',1003,3),(9,3,-300.00000000,1685418116,'秒合约下单扣除本金',1003,3),(10,3,-1000.00000000,1685418474,'币币划转合约',12,3),(11,3,1000.00000000,1685418474,'币币划转合约',15,3),(12,4,1000.00000000,1685430472,'后台调节期权账户余额:充值',7,3),(13,3,9.99800000,1685466876,'币币交易成功',51,1),(14,3,-27731.34000000,1685469273,'币币交易下单，资金冻结',50,3),(15,3,27731.34000000,1685469273,'币币交易下单，冻结资金增加',50,3),(16,3,-27731.34000000,1685517433,'币币交易成功，冻结资金减少',50,3),(17,3,0.99980000,1685517433,'币币交易成功',51,1),(18,3,-100.00000000,1685675762,'秒合约下单扣除本金',1003,3),(19,5,100000.00000000,1690227078,'链上充币',200,3),(20,5,-100000.00000000,1690227552,'币币划转合约',12,3),(21,5,100000.00000000,1690227552,'币币划转合约',15,3),(22,5,-100000.00000000,1690227915,'合约划转期权',1001,3),(23,5,100000.00000000,1690227915,'合约划转期权',1002,3),(24,5,-100000.00000000,1690228199,'期权划转币币',16,3),(25,5,100000.00000000,1690228199,'期权划转币币',11,3),(26,5,-29119.26000000,1690228227,'币币交易下单，资金冻结',50,3),(27,5,29119.26000000,1690228227,'币币交易下单，冻结资金增加',50,3),(28,5,-29119.26000000,1690228375,'币币交易成功，冻结资金减少',50,3),(29,5,0.99980000,1690228375,'币币交易成功',51,1),(30,5,-0.99980000,1690228417,'币币交易下单，资金冻结',50,1),(31,5,0.99980000,1690228417,'币币交易下单，冻结资金增加',50,1),(32,6,100000.00000000,1690230737,'链上充币',200,3),(33,6,-100000.00000000,1690230771,'币币划转合约',12,3),(34,6,100000.00000000,1690230771,'币币划转合约',15,3),(35,6,-100000.00000000,1690230822,'合约划转币币',16,3),(36,6,100000.00000000,1690230822,'合约划转币币',11,3),(37,6,-100000.00000000,1690230839,'币币划转期权',12,3),(38,6,100000.00000000,1690230839,'币币划转期权',15,3),(39,6,-5000.00000000,1690231190,'秒合约下单扣除本金',1003,3),(40,5,-0.99980000,1690258579,'币币交易冻结减少',50,1),(41,5,29102.05568454,1690258579,'币币交易成功',51,3),(42,3,-1000.00000000,1690819697,'秒合约下单扣除本金',1003,3),(43,3,-400.00000000,1690819949,'秒合约下单扣除本金',1003,3),(44,3,-148.57920000,1690820145,'提交ETH/USDT槓桿交易,價格1857.24000000扣除保證金',30,3),(45,3,148.37920000,1690820181,'平倉資金處理',31,3),(46,3,-292.30000000,1690820956,'提交BTC/USDT杠杆交易,价格29230.00000000,扣除保证金',30,3),(47,3,-2598.73000000,1690821213,'币币交易下单，资金冻结',50,3),(48,3,2598.73000000,1690821213,'币币交易下单，冻结资金增加',50,3),(49,3,292.30000000,1690821329,'平仓资金处理',31,3),(50,3,-10000.00000000,1690823064,'币币划转期权',12,3),(51,3,10000.00000000,1690823064,'币币划转期权',15,3),(52,3,-500.00000000,1690823080,'秒合约下单扣除本金',1003,3),(53,3,-2598.73000000,1691287188,'币币交易成功，冻结资金减少',50,3),(54,3,1009.79800000,1691287189,'币币交易成功',51,14),(55,3,-100.00000000,1691287404,'秒合约下单扣除本金',1003,3),(56,3,-56669.93000000,1691290880,'币币划转期权',12,3),(57,3,56669.93000000,1691290880,'币币划转期权',15,3),(58,3,-66069.93000000,1691291916,'期权划转币币',16,3),(59,3,66069.93000000,1691291916,'期权划转币币',11,3),(60,3,-66069.93000000,1691298191,'币币划转期权',12,3),(61,3,66069.93000000,1691298191,'币币划转期权',15,3),(62,10,50000.00000000,1691475468,'链上充币',200,3),(63,9,100000.00000000,1691475531,'链上充币',200,3),(64,9,-100000.00000000,1691475762,'币币划转期权',12,3),(65,9,100000.00000000,1691475762,'币币划转期权',15,3),(66,10,-50000.00000000,1691475840,'币币划转期权',12,3),(67,10,50000.00000000,1691475840,'币币划转期权',15,3),(68,9,-5000.00000000,1691475967,'秒合约下单扣除本金',1003,3),(69,10,-50000.00000000,1691476198,'期权划转币币',16,3),(70,10,50000.00000000,1691476198,'期权划转币币',11,3),(71,10,-50000.00000000,1691476386,'币币划转期权',12,3),(72,10,50000.00000000,1691476386,'币币划转期权',15,3),(73,10,-5000.00000000,1691476410,'秒合约下单扣除本金',1003,3),(74,9,-5000.00000000,1691477504,'期权划转币币',16,3),(75,9,5000.00000000,1691477504,'期权划转币币',11,3),(76,10,-45000.00000000,1691478088,'期权划转币币',16,3),(77,10,45000.00000000,1691478088,'期权划转币币',11,3),(78,8,10000.00000000,1691478538,'后台调节期权账户余额:1',7,3);
/*!40000 ALTER TABLE `account_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `currency` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `nettype` varchar(20) DEFAULT NULL COMMENT '帐号所在网络类型',
  `notes` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT 'haha123' COMMENT '提币地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户钱包地址表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (2,2,2,NULL,'ETH','0xb823851a0e2a522af19ef65dad7f42a18b54f56b'),(8,3,1,'TRC20','USDT','TRGYyuYpb8zs6F9D1THUQcrn4dzD2QZvRx'),(9,2,1,'ERC20','ETH','0xb823851a0e2a522af19ef65dad7f42a18b54f56b'),(11,3,2,'TRC20','USDT','111'),(14,1,2,'OMNI','BTC','111111111'),(15,3,2,'TRC20','USDT','1111111111111'),(16,3,9,'TRC20','USDT','sxdfdjhfgjdxfdf5d4f5dfdfd'),(18,3,8,'TRC20','USDT','TYCYKmJoCSH1LzQPLrA6PJpVK5jTMy4xCJ'),(19,3,10,'TRC20','USDT','TCmkYDcRwUFngzmmYZncypaaEA1uS9bfEW'),(20,3,3,'TRC20','USDT','TYCYKmJoCSH1LzQPLrA6PJpVK5jTMy4xCJ');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `role_id` tinyint(4) NOT NULL DEFAULT '0',
  `google` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '谷歌验证码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='后台管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'admin','6e20b1394f05e1f9188ffff90147b4eb',1,NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_module`
--

DROP TABLE IF EXISTS `admin_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_module` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='后台模块表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_module`
--

LOCK TABLES `admin_module` WRITE;
/*!40000 ALTER TABLE `admin_module` DISABLE KEYS */;
INSERT INTO `admin_module` VALUES (1,'基础','base'),(2,'设置','setting'),(3,'用户','user'),(4,'钱包','wallet'),(5,'管理员','manager'),(6,'新闻','news'),(7,'投拆建议','feedback'),(8,'币种管理','currency'),(9,'法币交易','legal'),(10,'C2C交易','c2c'),(11,'杠杆交易','lever'),(12,'记录查看','record');
/*!40000 ALTER TABLE `admin_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_module_action`
--

DROP TABLE IF EXISTS `admin_module_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_module_action` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_module_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `action` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `level` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='后台功能模块路由表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_module_action`
--

LOCK TABLES `admin_module_action` WRITE;
/*!40000 ALTER TABLE `admin_module_action` DISABLE KEYS */;
INSERT INTO `admin_module_action` VALUES (1,1,'后台首页','winadmin/index',0),(2,2,'基础设置','admin/setting/index',0),(3,2,'保存设置','admin/setting/postadd',0),(4,3,'用户查看','admin/user/user_index',0),(5,3,'用户列表','admin/user/list',0),(6,3,'用户导出','admin/user/csv',0),(7,3,'用户删除','admin/user/del',0),(8,3,'用户锁定','admin/user/lock',0),(9,3,'糖果调整','admin/user/candy_conf/{id}',0),(10,3,'提币地址','admin/user/address',0),(11,3,'修改提币地址','admin/user/address_edit',0),(12,3,'编辑用户','admin/user/edit',0),(13,3,'实名管理','admin/user/real_index',0),(14,3,'实名列表','admin/user/real_list',0),(15,3,'实名信息','admin/user/real_info',0),(16,3,'删除实名','admin/user/real_del',0),(17,3,'实名认证','admin/user/real_auth',0),(18,4,'提币查看','admin/cashb',0),(19,4,'提币列表','admin/cashb_list',0),(20,4,'提币详情','admin/cashb_show',0),(21,4,'提币通过','admin/cashb_done',0),(22,4,'提币驳回','admin/cashb_back',0),(23,4,'提币导出','admin/cashb/csv',0),(24,4,'用户钱包查看','admin/user/users_wallet',0),(25,4,'钱包列表','admin/user/walletList',0),(26,4,'钱包锁定','admin/user/wallet_lock',0),(27,4,'删除钱包','admin/user/delw',0),(28,4,'钱包调整','admin/user/conf',0),(29,5,'后台用户查看','admin/manager/manager_index',0),(30,5,'后台用户列表','admin/manager/users',0),(31,5,'添加用户','admin/manager/add',0),(32,5,'删除用户','admin/manager/delete',0),(33,5,'角色管理','admin/manager/manager_roles',0),(34,5,'角色列表','admin/manager/manager_roles_api',0),(35,5,'添加角色','admin/manager/role_add',0),(36,5,'删除角色','admin/manager/role_delete',0),(37,5,'角色权限管理','admin/manager/role_permission',0),(38,6,'新闻查看','admin/news_index',0),(39,6,'新闻添加','admin/news_add',0),(40,6,'编辑新闻','admin/news_edit/{id}',0),(41,6,'删除新闻','admin/news_del/{id}/{togetherDel?}',0),(42,6,'分类管理','admin/news_cate_index',0),(43,6,'添加分类','admin/news_cate_add',0),(44,6,'分类列表','admin/news_cate_list',0),(45,6,'编辑分类','admin/news_cate_edit/{id}',0),(46,6,'删除分类','admin/news_cate_del/{id}',0),(47,7,'详情','admin/feedback/detail',0),(48,7,'删除','admin/feedback/del',0),(49,7,'回复','admin/feedback/reply',0),(50,7,'查看','admin/feedback/index',0),(51,7,'列表','admin/feedback/list',0),(52,7,'导出','admin/feedback/csv',0),(53,8,'币种查看','admin/currency',0),(54,8,'添加币种','admin/currency_add',0),(55,8,'币种列表','admin/currency_list',0),(56,8,'删除币种','admin/currency_del',0),(57,8,'币种显示','admin/currency_display',0),(58,8,'上币','admin/currency_execute',0),(59,8,'交易对查看','admin/currency/match/{legal_id}',0),(60,8,'交易对列表','admin/currency/match_list/{legal_id}',0),(61,8,'交易对添加','admin/currency/match_add/{legal_id}',0),(62,8,'编辑交易对','admin/currency/match_edit/{id}',0),(63,8,'删除交易对','admin/currency/match_del/{id}',0),(64,9,'取消用户交易','admin/admin_legal_pay_cancel',0),(65,9,'确认商家收款 ','admin/legal_deal_admin_sure',0),(66,9,'确认用户收款','admin/legal_deal_admin_user_sure',0),(67,9,'法币交易需求查看','admin/legal',0),(68,9,'法币交易需求列表','admin/legal/list',0),(69,9,'法币交易信息查看','admin/legal_deal',0),(70,9,'法币交易信息查看','admin/legal_deal/list',0),(71,9,'商家管理','admin/seller',0),(72,9,'商家列表','admin/seller_list',0),(73,9,'添加商家','admin/seller_add',0),(74,9,'删除商家','admin/seller_del',0),(75,9,'撤回发布','admin/send/back',0),(76,9,'删除发布','admin/send/del',0),(77,9,'下架','admin/send/is_shelves',0),(78,10,'交易需求查看','admin/c2c',0),(79,10,'交易需求列表','admin/c2c/list',0),(80,10,'撤回发布','admin/c2c/send/back',0),(81,10,'交易信息查看','admin/c2c_deal',0),(82,10,'交易信息列表','admin/c2c_deal/list',0),(83,11,'用户交易查看','admin/hazard/index',0),(84,11,'用户交易列表','admin/hazard/lists',0),(85,11,'风险率查看','admin/hazard/total',0),(86,11,'风险率列表','admin/hazard/total_lists',0),(87,11,'交易价格处理','admin/hazard/handle',0),(88,11,'杠杆查看','admin/lever/index',0),(89,11,'杠杆列表','admin/lever/lists',0),(90,11,'代理商管理','admin/agent',0),(91,11,'倍数手数查看','admin/levermultiple/index',0),(92,11,'倍数手数列表','admin/levermultiple/list',0),(93,11,'倍数手数删除','admin/levermultiple/del',0),(94,11,'倍数手数编辑','admin/levermultiple/edit',0),(95,11,'倍数手数添加','admin/levermultiple/add',0),(96,11,'杠杆币划转法币查看','admin/levertolegal/index',0),(97,11,'杠杆币划转法币列表','admin/levertolegal/list',0),(98,11,'杠杆币划转法币审核','admin/levertolegal/addshow',0),(99,11,'杠杆币划转法币审核通过','admin/levertolegal/postAddyes',0),(100,11,'杠杆币划转法币审核失败','admin/levertolegal/postAddno',0),(101,11,'杠杆交易管理','admin/Leverdeals/Leverdeals_show',0),(102,11,'杠杆交易列表','admin/Leverdeals/list',0),(103,11,'杠杆交易导出','admin/Leverdeals/csv',0),(104,12,'日志查看','admin/account/account_index',0),(105,12,'日志列表','admin/account/list',0),(106,12,'奖励查看','admin/prizepool/index',0),(107,12,'奖励列表','admin/prizepool/lists',0),(108,12,'奖励统计','admin/prizepool/count',0),(109,0,'机器人','/admin/robot/list',0),(110,0,'币币列表','admin/coin_trade/index',0);
/*!40000 ALTER TABLE `admin_module_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role`
--

DROP TABLE IF EXISTS `admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_super` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='管理员角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role`
--

LOCK TABLES `admin_role` WRITE;
/*!40000 ALTER TABLE `admin_role` DISABLE KEYS */;
INSERT INTO `admin_role` VALUES (1,'超级管理员',1),(10,'代理',0);
/*!40000 ALTER TABLE `admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_role_permission`
--

DROP TABLE IF EXISTS `admin_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_role_permission` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `action` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4569 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='管理员角色权限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_role_permission`
--

LOCK TABLES `admin_role_permission` WRITE;
/*!40000 ALTER TABLE `admin_role_permission` DISABLE KEYS */;
INSERT INTO `admin_role_permission` VALUES (1,0,'user','admin/user/user_index'),(718,2,'base','winadmin/index'),(719,2,'user','admin/user/user_index'),(720,2,'user','admin/user/list'),(721,2,'user','admin/user/csv'),(722,2,'user','admin/user/del'),(723,2,'user','admin/user/lock'),(724,2,'user','admin/user/candy_conf/{id}'),(725,2,'user','admin/user/address'),(726,2,'user','admin/user/address_edit'),(727,2,'user','admin/user/edit'),(728,2,'user','admin/user/real_index'),(729,2,'user','admin/user/real_list'),(730,2,'user','admin/user/real_info'),(731,2,'user','admin/user/real_del'),(732,2,'user','admin/user/real_auth'),(733,2,'wallet','admin/cashb'),(734,2,'wallet','admin/cashb_list'),(735,2,'wallet','admin/cashb_show'),(736,2,'wallet','admin/cashb_done'),(737,2,'wallet','admin/cashb_back'),(738,2,'wallet','admin/cashb/csv'),(739,2,'wallet','admin/user/users_wallet'),(740,2,'wallet','admin/user/walletList'),(741,2,'wallet','admin/user/wallet_lock'),(742,2,'wallet','admin/user/delw'),(743,2,'wallet','admin/user/conf'),(744,2,'manager','admin/manager/manager_index'),(745,2,'manager','admin/manager/manager_roles'),(746,2,'news','admin/news_index'),(747,2,'news','admin/news_add'),(748,2,'news','admin/news_edit/{id}'),(749,2,'news','admin/news_del/{id}/{togetherDel?}'),(750,2,'news','admin/news_cate_index'),(751,2,'news','admin/news_cate_add'),(752,2,'news','admin/news_cate_list'),(753,2,'news','admin/news_cate_edit/{id}'),(754,2,'news','admin/news_cate_del/{id}'),(755,2,'feedback','admin/feedback/detail'),(756,2,'feedback','admin/feedback/del'),(757,2,'feedback','admin/feedback/reply'),(758,2,'feedback','admin/feedback/index'),(759,2,'feedback','admin/feedback/list'),(760,2,'feedback','admin/feedback/csv'),(761,2,'currency','admin/currency'),(762,2,'currency','admin/currency_add'),(763,2,'currency','admin/currency_list'),(764,2,'currency','admin/currency_del'),(765,2,'currency','admin/currency_display'),(766,2,'currency','admin/currency_execute'),(767,2,'currency','admin/currency/match/{legal_id}'),(768,2,'currency','admin/currency/match_list/{legal_id}'),(769,2,'currency','admin/currency/match_add/{legal_id}'),(770,2,'currency','admin/currency/match_edit/{id}'),(771,2,'currency','admin/currency/match_del/{id}'),(772,2,'legal','admin/admin_legal_pay_cancel'),(773,2,'legal','admin/legal_deal_admin_sure'),(774,2,'legal','admin/legal_deal_admin_user_sure'),(775,2,'legal','admin/legal'),(776,2,'legal','admin/legal/list'),(777,2,'legal','admin/legal_deal'),(778,2,'legal','admin/legal_deal/list'),(779,2,'legal','admin/seller'),(780,2,'legal','admin/seller_list'),(781,2,'legal','admin/seller_add'),(782,2,'legal','admin/seller_del'),(783,2,'legal','admin/send/back'),(784,2,'legal','admin/send/del'),(785,2,'legal','admin/send/is_shelves'),(786,2,'c2c','admin/c2c'),(787,2,'c2c','admin/c2c/list'),(788,2,'c2c','admin/c2c/send/back'),(789,2,'c2c','admin/c2c_deal'),(790,2,'c2c','admin/c2c_deal/list'),(791,2,'lever','admin/hazard/index'),(792,2,'lever','admin/hazard/lists'),(793,2,'lever','admin/hazard/total'),(794,2,'lever','admin/hazard/total_lists'),(795,2,'lever','admin/hazard/handle'),(796,2,'lever','admin/lever/index'),(797,2,'lever','admin/lever/lists'),(798,2,'lever','admin/agent'),(799,2,'lever','admin/levermultiple/index'),(800,2,'lever','admin/levermultiple/list'),(801,2,'lever','admin/levermultiple/del'),(802,2,'lever','admin/levermultiple/edit'),(803,2,'lever','admin/levermultiple/add'),(804,2,'lever','admin/levertolegal/index'),(805,2,'lever','admin/levertolegal/list'),(806,2,'lever','admin/levertolegal/addshow'),(807,2,'lever','admin/levertolegal/postAddyes'),(808,2,'lever','admin/levertolegal/postAddno'),(809,2,'lever','admin/Leverdeals/Leverdeals_show'),(810,2,'lever','admin/Leverdeals/list'),(811,2,'lever','admin/Leverdeals/csv'),(812,2,'record','admin/account/account_index'),(813,2,'record','admin/account/list'),(814,2,'record','admin/prizepool/index'),(815,2,'record','admin/prizepool/lists'),(816,2,'record','admin/prizepool/count'),(1726,5,'base','winadmin/index'),(1727,5,'user','admin/user/user_index'),(1728,5,'user','admin/user/list'),(1729,5,'user','admin/user/lock'),(1730,5,'user','admin/user/address'),(1731,5,'user','admin/user/real_index'),(1732,5,'user','admin/user/real_list'),(1733,5,'user','admin/user/real_info'),(1734,5,'user','admin/user/real_auth'),(1735,5,'wallet','admin/cashb'),(1736,5,'wallet','admin/cashb_list'),(1737,5,'wallet','admin/cashb_show'),(1738,5,'wallet','admin/user/users_wallet'),(1739,5,'wallet','admin/user/walletList'),(1740,5,'wallet','admin/user/wallet_lock'),(1741,5,'wallet','admin/user/conf'),(1742,5,'manager','admin/manager/role_permission'),(1743,5,'feedback','admin/feedback/detail'),(1744,5,'feedback','admin/feedback/del'),(1745,5,'feedback','admin/feedback/reply'),(1746,5,'feedback','admin/feedback/index'),(1747,5,'feedback','admin/feedback/list'),(1748,5,'feedback','admin/feedback/csv'),(1749,5,'legal','admin/admin_legal_pay_cancel'),(1750,5,'legal','admin/legal_deal_admin_sure'),(1751,5,'legal','admin/legal_deal_admin_user_sure'),(1752,5,'legal','admin/legal'),(1753,5,'legal','admin/legal/list'),(1754,5,'legal','admin/legal_deal'),(1755,5,'legal','admin/legal_deal/list'),(1756,5,'legal','admin/seller'),(1757,5,'legal','admin/seller_list'),(1758,5,'legal','admin/seller_add'),(1759,5,'legal','admin/seller_del'),(1760,5,'legal','admin/send/back'),(1761,5,'legal','admin/send/del'),(1762,5,'legal','admin/send/is_shelves'),(1763,5,'lever','admin/hazard/index'),(1764,5,'lever','admin/hazard/lists'),(1765,5,'record','admin/account/account_index'),(1766,5,'record','admin/account/list'),(1767,5,'record','admin/prizepool/index'),(1768,5,'record','admin/prizepool/lists'),(1769,5,'record','admin/prizepool/count'),(2356,6,'base','winadmin/index'),(2357,6,'setting','admin/setting/index'),(2358,6,'record','admin/account/account_index'),(2359,6,'record','admin/account/list'),(2360,6,'record','admin/prizepool/index'),(2361,6,'record','admin/prizepool/lists'),(2362,6,'record','admin/prizepool/count'),(2430,1,'base','winadmin/index'),(2431,1,'setting','admin/setting/index'),(2432,1,'setting','admin/setting/postadd'),(2433,1,'user','admin/user/user_index'),(2434,1,'user','admin/user/list'),(2435,1,'user','admin/user/csv'),(2436,1,'user','admin/user/del'),(2437,1,'user','admin/user/lock'),(2438,1,'user','admin/user/candy_conf/{id}'),(2439,1,'user','admin/user/address'),(2440,1,'user','admin/user/address_edit'),(2441,1,'user','admin/user/edit'),(2442,1,'user','admin/user/real_index'),(2443,1,'user','admin/user/real_list'),(2444,1,'user','admin/user/real_info'),(2445,1,'user','admin/user/real_del'),(2446,1,'user','admin/user/real_auth'),(2447,1,'wallet','admin/cashb'),(2448,1,'wallet','admin/cashb_list'),(2449,1,'wallet','admin/cashb_show'),(2450,1,'wallet','admin/cashb_done'),(2451,1,'wallet','admin/cashb_back'),(2452,1,'wallet','admin/cashb/csv'),(2453,1,'wallet','admin/user/users_wallet'),(2454,1,'wallet','admin/user/walletList'),(2455,1,'wallet','admin/user/wallet_lock'),(2456,1,'wallet','admin/user/delw'),(2457,1,'wallet','admin/user/conf'),(2458,1,'manager','admin/manager/manager_index'),(2459,1,'manager','admin/manager/users'),(2460,1,'manager','admin/manager/add'),(2461,1,'manager','admin/manager/delete'),(2462,1,'manager','admin/manager/manager_roles'),(2463,1,'manager','admin/manager/manager_roles_api'),(2464,1,'manager','admin/manager/role_add'),(2465,1,'manager','admin/manager/role_delete'),(2466,1,'manager','admin/manager/role_permission'),(2467,1,'news','admin/news_index'),(2468,1,'news','admin/news_add'),(2469,1,'news','admin/news_edit/{id}'),(2470,1,'news','admin/news_del/{id}/{togetherDel?}'),(2471,1,'news','admin/news_cate_index'),(2472,1,'news','admin/news_cate_add'),(2473,1,'news','admin/news_cate_list'),(2474,1,'news','admin/news_cate_edit/{id}'),(2475,1,'news','admin/news_cate_del/{id}'),(2476,1,'feedback','admin/feedback/detail'),(2477,1,'feedback','admin/feedback/del'),(2478,1,'feedback','admin/feedback/reply'),(2479,1,'feedback','admin/feedback/index'),(2480,1,'feedback','admin/feedback/list'),(2481,1,'feedback','admin/feedback/csv'),(2482,1,'currency','admin/currency'),(2483,1,'currency','admin/currency_add'),(2484,1,'currency','admin/currency_list'),(2485,1,'currency','admin/currency_del'),(2486,1,'currency','admin/currency_display'),(2487,1,'currency','admin/currency_execute'),(2488,1,'currency','admin/currency/match/{legal_id}'),(2489,1,'currency','admin/currency/match_list/{legal_id}'),(2490,1,'currency','admin/currency/match_add/{legal_id}'),(2491,1,'currency','admin/currency/match_edit/{id}'),(2492,1,'currency','admin/currency/match_del/{id}'),(2493,1,'legal','admin/admin_legal_pay_cancel'),(2494,1,'legal','admin/legal_deal_admin_sure'),(2495,1,'legal','admin/legal_deal_admin_user_sure'),(2496,1,'legal','admin/legal'),(2497,1,'legal','admin/legal/list'),(2498,1,'legal','admin/legal_deal'),(2499,1,'legal','admin/legal_deal/list'),(2500,1,'legal','admin/seller'),(2501,1,'legal','admin/seller_list'),(2502,1,'legal','admin/seller_add'),(2503,1,'legal','admin/seller_del'),(2504,1,'legal','admin/send/back'),(2505,1,'legal','admin/send/del'),(2506,1,'legal','admin/send/is_shelves'),(2507,1,'c2c','admin/c2c'),(2508,1,'c2c','admin/c2c/list'),(2509,1,'c2c','admin/c2c/send/back'),(2510,1,'c2c','admin/c2c_deal'),(2511,1,'c2c','admin/c2c_deal/list'),(2512,1,'lever','admin/hazard/index'),(2513,1,'lever','admin/hazard/lists'),(2514,1,'lever','admin/hazard/total'),(2515,1,'lever','admin/hazard/total_lists'),(2516,1,'lever','admin/hazard/handle'),(2517,1,'lever','admin/lever/index'),(2518,1,'lever','admin/lever/lists'),(2519,1,'lever','admin/agent'),(2520,1,'lever','admin/levermultiple/index'),(2521,1,'lever','admin/levermultiple/list'),(2522,1,'lever','admin/levermultiple/del'),(2523,1,'lever','admin/levermultiple/edit'),(2524,1,'lever','admin/levermultiple/add'),(2525,1,'lever','admin/levertolegal/index'),(2526,1,'lever','admin/levertolegal/list'),(2527,1,'lever','admin/levertolegal/addshow'),(2528,1,'lever','admin/levertolegal/postAddyes'),(2529,1,'lever','admin/levertolegal/postAddno'),(2530,1,'lever','admin/Leverdeals/Leverdeals_show'),(2531,1,'lever','admin/Leverdeals/list'),(2532,1,'lever','admin/Leverdeals/csv'),(2533,1,'record','admin/account/account_index'),(2534,1,'record','admin/account/list'),(2535,1,'record','admin/prizepool/index'),(2536,1,'record','admin/prizepool/lists'),(2537,1,'record','admin/prizepool/count'),(2833,4,'base','winadmin/index'),(2834,4,'setting','admin/setting/index'),(2835,4,'setting','admin/setting/postadd'),(2836,4,'user','admin/user/user_index'),(2837,4,'user','admin/user/list'),(2838,4,'user','admin/user/csv'),(2839,4,'user','admin/user/del'),(2840,4,'user','admin/user/lock'),(2841,4,'user','admin/user/candy_conf/{id}'),(2842,4,'user','admin/user/address'),(2843,4,'user','admin/user/address_edit'),(2844,4,'user','admin/user/edit'),(2845,4,'user','admin/user/real_index'),(2846,4,'user','admin/user/real_list'),(2847,4,'user','admin/user/real_info'),(2848,4,'user','admin/user/real_del'),(2849,4,'user','admin/user/real_auth'),(2850,4,'wallet','admin/cashb'),(2851,4,'wallet','admin/cashb_list'),(2852,4,'wallet','admin/cashb_show'),(2853,4,'wallet','admin/cashb_done'),(2854,4,'wallet','admin/cashb_back'),(2855,4,'wallet','admin/cashb/csv'),(2856,4,'wallet','admin/user/users_wallet'),(2857,4,'wallet','admin/user/walletList'),(2858,4,'wallet','admin/user/wallet_lock'),(2859,4,'wallet','admin/user/delw'),(2860,4,'wallet','admin/user/conf'),(2861,4,'manager','admin/manager/manager_index'),(2862,4,'manager','admin/manager/users'),(2863,4,'manager','admin/manager/add'),(2864,4,'manager','admin/manager/delete'),(2865,4,'manager','admin/manager/manager_roles'),(2866,4,'manager','admin/manager/manager_roles_api'),(2867,4,'manager','admin/manager/role_add'),(2868,4,'manager','admin/manager/role_delete'),(2869,4,'manager','admin/manager/role_permission'),(2870,4,'news','admin/news_index'),(2871,4,'news','admin/news_add'),(2872,4,'news','admin/news_edit/{id}'),(2873,4,'news','admin/news_del/{id}/{togetherDel?}'),(2874,4,'news','admin/news_cate_index'),(2875,4,'news','admin/news_cate_add'),(2876,4,'news','admin/news_cate_list'),(2877,4,'news','admin/news_cate_edit/{id}'),(2878,4,'news','admin/news_cate_del/{id}'),(2879,4,'feedback','admin/feedback/detail'),(2880,4,'feedback','admin/feedback/del'),(2881,4,'feedback','admin/feedback/reply'),(2882,4,'feedback','admin/feedback/index'),(2883,4,'feedback','admin/feedback/list'),(2884,4,'feedback','admin/feedback/csv'),(2885,4,'currency','admin/currency'),(2886,4,'currency','admin/currency_add'),(2887,4,'currency','admin/currency_list'),(2888,4,'currency','admin/currency_del'),(2889,4,'currency','admin/currency_display'),(2890,4,'currency','admin/currency_execute'),(2891,4,'currency','admin/currency/match/{legal_id}'),(2892,4,'currency','admin/currency/match_list/{legal_id}'),(2893,4,'currency','admin/currency/match_add/{legal_id}'),(2894,4,'currency','admin/currency/match_edit/{id}'),(2895,4,'currency','admin/currency/match_del/{id}'),(2896,4,'legal','admin/admin_legal_pay_cancel'),(2897,4,'legal','admin/legal_deal_admin_sure'),(2898,4,'legal','admin/legal_deal_admin_user_sure'),(2899,4,'legal','admin/legal'),(2900,4,'legal','admin/legal/list'),(2901,4,'legal','admin/legal_deal'),(2902,4,'legal','admin/legal_deal/list'),(2903,4,'legal','admin/seller'),(2904,4,'legal','admin/seller_list'),(2905,4,'legal','admin/seller_add'),(2906,4,'legal','admin/seller_del'),(2907,4,'legal','admin/send/back'),(2908,4,'legal','admin/send/del'),(2909,4,'legal','admin/send/is_shelves'),(2910,4,'c2c','admin/c2c'),(2911,4,'c2c','admin/c2c/list'),(2912,4,'c2c','admin/c2c/send/back'),(2913,4,'c2c','admin/c2c_deal'),(2914,4,'c2c','admin/c2c_deal/list'),(2915,4,'lever','admin/hazard/index'),(2916,4,'lever','admin/hazard/lists'),(2917,4,'lever','admin/hazard/total'),(2918,4,'lever','admin/hazard/total_lists'),(2919,4,'lever','admin/hazard/handle'),(2920,4,'lever','admin/lever/index'),(2921,4,'lever','admin/lever/lists'),(2922,4,'lever','admin/agent'),(2923,4,'lever','admin/levermultiple/index'),(2924,4,'lever','admin/levermultiple/list'),(2925,4,'lever','admin/levermultiple/del'),(2926,4,'lever','admin/levermultiple/edit'),(2927,4,'lever','admin/levermultiple/add'),(2928,4,'lever','admin/levertolegal/index'),(2929,4,'lever','admin/levertolegal/list'),(2930,4,'lever','admin/levertolegal/addshow'),(2931,4,'lever','admin/levertolegal/postAddyes'),(2932,4,'lever','admin/levertolegal/postAddno'),(2933,4,'lever','admin/Leverdeals/Leverdeals_show'),(2934,4,'lever','admin/Leverdeals/list'),(2935,4,'lever','admin/Leverdeals/csv'),(2936,4,'record','admin/account/account_index'),(2937,4,'record','admin/account/list'),(2938,4,'record','admin/prizepool/index'),(2939,4,'record','admin/prizepool/lists'),(2940,4,'record','admin/prizepool/count'),(4163,8,'base','winadmin/index'),(4164,8,'setting','admin/setting/index'),(4165,8,'setting','admin/setting/postadd'),(4166,8,'user','admin/user/user_index'),(4167,8,'user','admin/user/list'),(4168,8,'user','admin/user/csv'),(4169,8,'user','admin/user/del'),(4170,8,'user','admin/user/lock'),(4171,8,'user','admin/user/candy_conf/{id}'),(4172,8,'user','admin/user/address'),(4173,8,'user','admin/user/address_edit'),(4174,8,'user','admin/user/edit'),(4175,8,'user','admin/user/real_index'),(4176,8,'user','admin/user/real_list'),(4177,8,'user','admin/user/real_info'),(4178,8,'user','admin/user/real_del'),(4179,8,'user','admin/user/real_auth'),(4180,8,'wallet','admin/cashb'),(4181,8,'wallet','admin/cashb_list'),(4182,8,'wallet','admin/cashb_show'),(4183,8,'wallet','admin/cashb_done'),(4184,8,'wallet','admin/cashb_back'),(4185,8,'wallet','admin/cashb/csv'),(4186,8,'wallet','admin/user/users_wallet'),(4187,8,'wallet','admin/user/walletList'),(4188,8,'wallet','admin/user/wallet_lock'),(4189,8,'wallet','admin/user/delw'),(4190,8,'wallet','admin/user/conf'),(4191,8,'manager','admin/manager/manager_index'),(4192,8,'manager','admin/manager/users'),(4193,8,'manager','admin/manager/add'),(4194,8,'manager','admin/manager/delete'),(4195,8,'manager','admin/manager/manager_roles'),(4196,8,'manager','admin/manager/manager_roles_api'),(4197,8,'manager','admin/manager/role_add'),(4198,8,'manager','admin/manager/role_delete'),(4199,8,'manager','admin/manager/role_permission'),(4200,8,'news','admin/news_index'),(4201,8,'news','admin/news_add'),(4202,8,'news','admin/news_edit/{id}'),(4203,8,'news','admin/news_del/{id}/{togetherDel?}'),(4204,8,'news','admin/news_cate_index'),(4205,8,'news','admin/news_cate_add'),(4206,8,'news','admin/news_cate_list'),(4207,8,'news','admin/news_cate_edit/{id}'),(4208,8,'news','admin/news_cate_del/{id}'),(4209,8,'feedback','admin/feedback/detail'),(4210,8,'feedback','admin/feedback/del'),(4211,8,'feedback','admin/feedback/reply'),(4212,8,'feedback','admin/feedback/index'),(4213,8,'feedback','admin/feedback/list'),(4214,8,'feedback','admin/feedback/csv'),(4215,8,'currency','admin/currency'),(4216,8,'currency','admin/currency_add'),(4217,8,'currency','admin/currency_list'),(4218,8,'currency','admin/currency_del'),(4219,8,'currency','admin/currency_display'),(4220,8,'currency','admin/currency_execute'),(4221,8,'currency','admin/currency/match/{legal_id}'),(4222,8,'currency','admin/currency/match_list/{legal_id}'),(4223,8,'currency','admin/currency/match_add/{legal_id}'),(4224,8,'currency','admin/currency/match_edit/{id}'),(4225,8,'currency','admin/currency/match_del/{id}'),(4226,8,'legal','admin/admin_legal_pay_cancel'),(4227,8,'legal','admin/legal_deal_admin_sure'),(4228,8,'legal','admin/legal_deal_admin_user_sure'),(4229,8,'legal','admin/legal'),(4230,8,'legal','admin/legal/list'),(4231,8,'legal','admin/legal_deal'),(4232,8,'legal','admin/legal_deal/list'),(4233,8,'legal','admin/seller'),(4234,8,'legal','admin/seller_list'),(4235,8,'legal','admin/seller_add'),(4236,8,'legal','admin/seller_del'),(4237,8,'legal','admin/send/back'),(4238,8,'legal','admin/send/del'),(4239,8,'legal','admin/send/is_shelves'),(4240,8,'c2c','admin/c2c'),(4241,8,'c2c','admin/c2c/list'),(4242,8,'c2c','admin/c2c/send/back'),(4243,8,'c2c','admin/c2c_deal'),(4244,8,'c2c','admin/c2c_deal/list'),(4245,8,'lever','admin/hazard/index'),(4246,8,'lever','admin/hazard/lists'),(4247,8,'lever','admin/hazard/total'),(4248,8,'lever','admin/hazard/total_lists'),(4249,8,'lever','admin/hazard/handle'),(4250,8,'lever','admin/lever/index'),(4251,8,'lever','admin/lever/lists'),(4252,8,'lever','admin/agent'),(4253,8,'lever','admin/levermultiple/index'),(4254,8,'lever','admin/levermultiple/list'),(4255,8,'lever','admin/levermultiple/del'),(4256,8,'lever','admin/levermultiple/edit'),(4257,8,'lever','admin/levermultiple/add'),(4258,8,'lever','admin/levertolegal/index'),(4259,8,'lever','admin/levertolegal/list'),(4260,8,'lever','admin/levertolegal/addshow'),(4261,8,'lever','admin/levertolegal/postAddyes'),(4262,8,'lever','admin/levertolegal/postAddno'),(4263,8,'lever','admin/Leverdeals/Leverdeals_show'),(4264,8,'lever','admin/Leverdeals/list'),(4265,8,'lever','admin/Leverdeals/csv'),(4266,8,'record','admin/account/account_index'),(4267,8,'record','admin/account/list'),(4268,8,'record','admin/prizepool/index'),(4269,8,'record','admin/prizepool/lists'),(4270,8,'record','admin/prizepool/count'),(4567,9,'base','winadmin/index'),(4568,9,'user','admin/user/user_index');
/*!40000 ALTER TABLE `admin_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent`
--

DROP TABLE IF EXISTS `agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL COMMENT '用户id',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '登录代理商后台的帐号',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '登录代理商后台的密码',
  `parent_agent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级代理商ID，0表示该用户是一级代理商',
  `level` tinyint(5) unsigned NOT NULL DEFAULT '0' COMMENT '代理商等级,0:超级管理员； 1：一级代理商；2:二级代理商；3:三级代理商；4:四级代理商',
  `agent_path` varchar(255) NOT NULL DEFAULT '0' COMMENT '代理商关系，用,拼接成字符串',
  `is_admin` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否为超级管理员',
  `is_lock` tinyint(3) NOT NULL DEFAULT '0' COMMENT '该代理商是否锁定',
  `is_addson` tinyint(3) NOT NULL DEFAULT '1' COMMENT '是否拥有开设下级代理商的权限',
  `pro_loss` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '头寸比例',
  `pro_ser` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '手续费比例',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1正常用户',
  `reg_time` int(11) NOT NULL DEFAULT '0' COMMENT '代理商注册时间',
  `lock_time` int(11) NOT NULL DEFAULT '0' COMMENT '代理商锁定时间',
  `money` decimal(20,8) DEFAULT '0.00000000' COMMENT '代理商帐户',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代理用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent`
--

LOCK TABLES `agent` WRITE;
/*!40000 ALTER TABLE `agent` DISABLE KEYS */;
INSERT INTO `agent` VALUES (1,1,'admin','0fa9b2cdfc8fc29224dd491c57b3b3fd',0,0,'1',1,0,1,100.00,100.00,1,0,0,0.00000000);
/*!40000 ALTER TABLE `agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_admin`
--

DROP TABLE IF EXISTS `agent_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `role_id` tinyint(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代理商后台管理员';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_admin`
--

LOCK TABLES `agent_admin` WRITE;
/*!40000 ALTER TABLE `agent_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_log`
--

DROP TABLE IF EXISTS `agent_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) unsigned DEFAULT '0' COMMENT '代理商ID',
  `type` tinyint(3) unsigned DEFAULT '0' COMMENT '类型',
  `value` decimal(15,2) DEFAULT '0.00' COMMENT '操作值',
  `info` varchar(255) DEFAULT '' COMMENT '操作详情',
  `relate_id` int(11) unsigned DEFAULT '0' COMMENT '关联id',
  `add_time` int(11) unsigned DEFAULT '0' COMMENT '日志添加时间',
  `status` tinyint(3) unsigned DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `agent_id` (`agent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_log`
--

LOCK TABLES `agent_log` WRITE;
/*!40000 ALTER TABLE `agent_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_money_log`
--

DROP TABLE IF EXISTS `agent_money_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_money_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属代理商',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型。1.代理商头寸，2代理商手续费',
  `relate_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '关联id。比如订单id等',
  `before` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '原余额',
  `change` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '本次变动',
  `after` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '现余额',
  `memo` varchar(100) NOT NULL DEFAULT '' COMMENT '备注',
  `created_time` int(11) NOT NULL COMMENT '变动时间',
  `son_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '贡献收益的用户id',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否体现',
  `legal_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '法币id',
  `updated_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '提现到账时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_money_log`
--

LOCK TABLES `agent_money_log` WRITE;
/*!40000 ALTER TABLE `agent_money_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent_money_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_role`
--

DROP TABLE IF EXISTS `agent_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_super` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代理商角色';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_role`
--

LOCK TABLES `agent_role` WRITE;
/*!40000 ALTER TABLE `agent_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agent_role_permission`
--

DROP TABLE IF EXISTS `agent_role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agent_role_permission` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `agent_id` int(10) NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `module` varchar(50) NOT NULL DEFAULT '',
  `action` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agent_role_permission`
--

LOCK TABLES `agent_role_permission` WRITE;
/*!40000 ALTER TABLE `agent_role_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `agent_role_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `algebra`
--

DROP TABLE IF EXISTS `algebra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `algebra` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `algebra` int(25) NOT NULL DEFAULT '0' COMMENT '代数',
  `rate` decimal(25,4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员代理层级表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `algebra`
--

LOCK TABLES `algebra` WRITE;
/*!40000 ALTER TABLE `algebra` DISABLE KEYS */;
INSERT INTO `algebra` VALUES (2,'一代',1,0.0000),(3,'二代',2,0.0000),(4,'三代',3,0.0000),(5,'四代',4,0.0000),(6,'五代',5,0.0000),(7,'六代',6,0.0000),(8,'七代',7,0.0000),(9,'八代',8,0.0000),(10,'九代',9,0.0000),(11,'十代',10,0.0000);
/*!40000 ALTER TABLE `algebra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area_code`
--

DROP TABLE IF EXISTS `area_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `lang` varchar(10) DEFAULT NULL,
  `area_code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1854 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='国家区号';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area_code`
--

LOCK TABLES `area_code` WRITE;
/*!40000 ALTER TABLE `area_code` DISABLE KEYS */;
INSERT INTO `area_code` VALUES (1,'阿富汗','cht','93'),(2,'阿尔巴尼亚','cht','355'),(3,'阿尔及利亚','cht','213'),(4,'美属萨摩亚','cht','1684'),(5,'安道尔共和国','cht','376'),(6,'安哥拉','cht','244'),(7,'安圭拉岛','cht','1264'),(8,'安提瓜和巴布达	','cht','1268'),(9,'阿根廷','cht','54'),(10,'亚美尼亚','cht','374'),(11,'阿鲁巴','cht','297'),(12,'澳大利亚','cht','61'),(13,'奥地利','cht','43'),(14,'阿塞拜疆共和国','cht','994'),(15,'巴哈马','cht','1242'),(16,'巴林','cht','973'),(17,'孟加拉共和国','cht','880'),(18,'巴巴多斯','cht','1246'),(19,'白俄罗斯','cht','375'),(20,'比利时','cht','32'),(21,'伯利兹','cht','501'),(22,'贝宁共和国','cht','229'),(23,'百慕大群岛','cht','1441'),(24,'不丹','cht','975'),(25,'玻利维亚','cht','591'),(26,'博内尔岛、圣尤斯特歇斯岛和萨巴岛','cht','599'),(27,'波斯尼亚和黑塞哥维那','cht','387'),(28,'博茨瓦纳','cht','267'),(29,'巴西','cht','55'),(30,'文莱','cht','673'),(31,'保加利亚','cht','359'),(32,'布基纳法索','cht','226'),(33,'布隆迪','cht','257'),(34,'柬埔寨','cht','855'),(35,'喀麦隆','cht','237'),(36,'加拿大','cht','1'),(37,'佛得角','cht','238'),(38,'开曼群岛','cht','1345'),(39,'中非共和国	','cht','236'),(40,'乍得','cht','235'),(41,'智利','cht','56'),(42,'中国','cht','86'),(43,'哥伦比亚','cht','57'),(44,'科摩罗','cht','269'),(45,'库克群岛','cht','682'),(46,'哥斯达黎加','cht','506'),(47,'克罗地亚','cht','385'),(48,'古巴','cht','53'),(49,'库拉索','cht','599'),(50,'塞浦路斯','cht','357'),(51,'捷克共和国','cht','420'),(52,'刚果民主共和国','cht','243'),(53,'丹麦','cht','45'),(54,'迪戈加西亚岛','cht','246'),(55,'吉布提','cht','253'),(56,'多米尼克','cht','1767'),(57,'多米尼加','cht','1809'),(60,'东帝汶','cht','670'),(61,'厄瓜多尔','cht','593'),(62,'埃及','cht','20'),(63,'萨尔瓦多','cht','503'),(64,'赤道几内亚','cht','240'),(65,'厄立特里亚','cht','291'),(66,'爱沙尼亚','cht','372'),(67,'埃塞俄比亚','cht','251'),(68,'福克兰群岛','cht','500'),(69,'法罗群岛','cht','298'),(70,'斐济','cht','679'),(71,'芬兰','cht','358'),(72,'法国','cht','33'),(73,'法属圭亚那','cht','594'),(74,'法属波利尼西亚','cht','689'),(75,'加蓬','cht','241'),(76,'冈比亚','cht','220'),(77,'格鲁吉亚','cht','995'),(78,'德国','cht','49'),(79,'加纳','cht','233'),(80,'直布罗陀','cht','350'),(81,'希腊','cht','30'),(82,'格陵兰岛','cht','299'),(83,'格林纳达','cht','1473'),(84,'瓜德罗普岛','cht','590'),(85,'关岛','cht','1671'),(86,'危地马拉','cht','502'),(87,'巴布亚新几内亚','cht','224'),(88,'几内亚比绍共和国','cht','245'),(89,'圭亚那','cht','592'),(90,'海地','cht','509'),(91,'洪都拉斯','cht','504'),(92,'中国香港','cht','852'),(93,'匈牙利','cht','36'),(94,'冰岛','cht','354'),(95,'印度','cht','91'),(96,'印度尼西亚','cht','62'),(97,'伊朗','cht','98'),(98,'伊拉克','cht','964'),(99,'爱尔兰','cht','353'),(100,'以色列','cht','972'),(101,'意大利','cht','39'),(102,'科特迪瓦','cht','225'),(104,'牙买加','cht','1876'),(105,'日本','cht','81'),(106,'约旦','cht','962'),(107,'哈萨克斯坦','cht','7'),(108,'肯尼亚','cht','254'),(109,'基里巴斯','cht','686'),(110,'朝鲜(民主人民共和国)','cht','850'),(111,'科索沃','cht','383'),(112,'科威特','cht','965'),(113,'吉尔吉斯','cht','996'),(114,'老挝','cht','856'),(115,'拉脱维亚','cht','371'),(116,'黎巴嫩','cht','961'),(117,'莱索托','cht','266'),(118,'利比里亚','cht','231'),(119,'利比亚','cht','218'),(120,'列支敦士登','cht','423'),(121,'立陶宛','cht','370'),(122,'卢森堡','cht','352'),(123,'中国澳门','cht','853'),(124,'马其顿共和国','cht','389'),(125,'马达加斯加','cht','261'),(126,'马拉维','cht','265'),(127,'马来西亚','cht','60'),(128,'马尔代夫','cht','960'),(129,'马里','cht','223'),(130,'马耳他','cht','356'),(131,'马绍尔群岛(共和国)','cht','692'),(132,'马提尼克岛','cht','596'),(133,'毛里塔尼亚','cht','222'),(134,'毛里求斯','cht','230'),(135,'马约特','cht','262'),(136,'墨西哥','cht','52'),(137,'密克罗尼西亚','cht','691'),(138,'摩尔多瓦','cht','373'),(139,'摩纳哥','cht','377'),(140,'蒙古','cht','976'),(141,'黑山共和国','cht','382'),(142,'蒙特塞拉特岛','cht','1664'),(143,'摩洛哥','cht','212'),(144,'莫桑比克','cht','258'),(145,'缅甸','cht','95'),(146,'纳米比亚','cht','264'),(147,'瑙鲁','cht','674'),(148,'尼泊尔','cht','977'),(149,'荷兰','cht','31'),(150,'新喀里多尼亚','cht','687'),(151,'新西兰','cht','64'),(152,'尼加拉瓜','cht','505'),(153,'尼日尔','cht','227'),(154,'尼日利亚','cht','234'),(155,'纽埃','cht','683'),(156,'北马里亚纳群岛(联邦)','cht','1670'),(157,'挪威','cht','47'),(158,'阿曼','cht','968'),(159,'巴基斯坦','cht','92'),(160,'帕劳','cht','680'),(161,'巴勒斯坦','cht','970'),(162,'巴拿马','cht','507'),(163,'巴布亚新几内亚','cht','675'),(164,'巴拉圭','cht','595'),(165,'秘鲁','cht','51'),(166,'菲律宾','cht','63'),(167,'波兰','cht','48'),(168,'葡萄牙','cht','351'),(169,'波多黎各','cht','1787'),(171,'卡塔尔','cht','974'),(172,'刚果','cht','242'),(173,'留尼旺岛','cht','262'),(174,'罗马尼亚','cht','40'),(175,'俄罗斯','cht','7'),(176,'卢旺达','cht','250'),(179,'圣基茨和尼维斯','cht','1869'),(180,'圣卢西亚','cht','1758'),(181,'圣皮埃尔和密克隆','cht','508'),(182,'圣文森特和格林纳丁斯','cht','1784'),(183,'萨摩亚群岛','cht','685'),(184,'圣马力诺共和国','cht','378'),(185,'圣多美和普林西比','cht','239'),(186,'沙特阿拉伯','cht','966'),(187,'塞内加尔','cht','221'),(188,'塞尔维亚','cht','381'),(189,'塞舌尔','cht','248'),(190,'塞拉利昂','cht','232'),(191,'新加坡','cht','65'),(192,'圣马丁(荷兰）','cht','1721'),(193,'斯洛伐克','cht','421'),(194,'斯洛文尼亚','cht','386'),(195,'所罗门群岛','cht','677'),(196,'索马里','cht','252'),(197,'南非','cht','27'),(198,'韩国','cht','82'),(199,'南苏丹','cht','211'),(200,'西班牙','cht','34'),(201,'斯里兰卡','cht','94'),(202,'苏丹','cht','249'),(203,'苏里南','cht','597'),(204,'斯威士兰','cht','268'),(205,'瑞典','cht','46'),(206,'瑞士','cht','41'),(207,'叙利亚','cht','963'),(208,'中国台湾','cht','886'),(209,'塔吉克斯坦','cht','992'),(210,'坦桑尼亚','cht','255'),(211,'泰国','cht','66'),(212,'多哥','cht','228'),(213,'托克劳群岛','cht','690'),(214,'汤加','cht','676'),(215,'特立尼达和多巴哥','cht','1868'),(216,'突尼斯','cht','216'),(217,'土耳其','cht','90'),(218,'土库曼斯坦','cht','993'),(219,'特克斯和凯科斯群岛','cht','1649'),(220,'图瓦卢','cht','688'),(221,'乌干达','cht','256'),(222,'乌克兰','cht','380'),(223,'阿拉伯联合酋长国','cht','971'),(224,'英国','cht','44'),(225,'美国','cht','1'),(226,'美国维尔京群岛','cht','1340'),(227,'乌拉圭','cht','598'),(228,'乌兹别克斯坦','cht','998'),(229,'瓦努阿图','cht','678'),(230,'梵蒂冈城国','cht','379'),(231,'委内瑞拉','cht','58'),(232,'越南','cht','84'),(233,'维尔京群岛 英国','cht','1284'),(234,'瓦利斯和富图纳群岛','cht','681'),(235,'也门','cht','967'),(236,'赞比亚','cht','260'),(237,'津巴布韦','cht','263'),(238,'Afghanistan','en','93'),(239,'Albania','en','355'),(240,'Algeria','en','213'),(241,'American Samoa','en','1684'),(242,'Republic of Andorra','en','376'),(243,'Angola','en','244'),(244,'Anguilla','en','1264'),(245,'Antigua and Barbuda','en','1268'),(246,'Argentina','en','54'),(247,'Armenia','en','374'),(248,'Aruba','en','297'),(249,'Australia','en','61'),(250,'Austria','en','43'),(251,'Republic of Azerbaijan','en','994'),(252,'Bahamas','en','1242'),(253,'Bahrain','en','973'),(254,'Bangladesh','en','880'),(255,'Barbados','en','1246'),(256,'Belarus','en','375'),(257,'Belgium','en','32'),(258,'Belize','en','501'),(259,'Republic of Benin','en','229'),(260,'Bermuda Islands','en','1441'),(261,'Bhutan','en','975'),(262,'Bolivia','en','591'),(263,'Bonaire, Sint Eustatius and Saba','en','599'),(264,'Bosnia and Herzegovina','en','387'),(265,'Botswana','en','267'),(266,'Brazil','en','55'),(267,'Brunei','en','673'),(268,'Bulgaria','en','359'),(269,'Burkina Faso','en','226'),(270,'Burundi','en','257'),(271,'Cambodia','en','855'),(272,'Cameroon','en','237'),(273,'Canada','en','1'),(274,'Cape Verde','en','238'),(275,'Cayman Islands','en','1345'),(276,'Central African Republic','en','236'),(277,'Chad','en','235'),(278,'Chile','en','56'),(279,'China','en','86'),(280,'Colombia','en','57'),(281,'Comoros','en','269'),(282,'Cook Islands','en','682'),(283,'Costa Rica','en','506'),(284,'Croatia','en','385'),(285,'Cuba','en','53'),(286,'Curaçao','en','599'),(287,'Cyprus','en','357'),(288,'Czech Republic','en','420'),(289,'Democratic Republic of the Congo','en','243'),(290,'Denmark','en','45'),(291,'Digo Garcia Island','en','246'),(292,'Djibouti','en','253'),(293,'Dominic','en','1767'),(294,'Dominica','en','1809'),(295,'East Timor','en','670'),(296,'Ecuador','en','593'),(297,'Egypt','en','20'),(298,'El Salvador','en','503'),(299,'Equatorial Guinea','en','240'),(300,'Eritrea','en','291'),(301,'Estonia','en','372'),(302,'Ethiopia','en','251'),(303,'Falkland Islands','en','500'),(304,'Faroe Islands','en','298'),(305,'Fiji','en','679'),(306,'Finland','en','358'),(307,'France','en','33'),(308,'French Guiana','en','594'),(309,'French Polynesia','en','689'),(310,'Gabon','en','241'),(311,'Gambia','en','220'),(312,'Georgia','en','995'),(313,'Germany','en','49'),(314,'Ghana','en','233'),(315,'Gibraltar','en','350'),(316,'Greece','en','30'),(317,'Greenland','en','299'),(318,'Grenada','en','1473'),(319,'Guadeloupe','en','590'),(320,'Guam','en','1671'),(321,'Guatemala','en','502'),(322,'Papua New Guinea','en','224'),(323,'Guinea-Bissau','en','245'),(324,'Guyana','en','592'),(325,'Haiti','en','509'),(326,'Honduras','en','504'),(327,'Hong Kong, China','en','852'),(328,'Hungary','en','36'),(329,'Iceland','en','354'),(330,'India','en','91'),(331,'Indonesia','en','62'),(332,'Iran','en','98'),(333,'Iraq','en','964'),(334,'Ireland','en','353'),(335,'Israel','en','972'),(336,'Italy','en','39'),(337,'Cote d\'Ivoire','en','225'),(338,'Jamaica','en','1876'),(339,'Japan','en','81'),(340,'Jordan','en','962'),(341,'Kazakhstan','en','7'),(342,'Kenya','en','254'),(343,'Kiribati','en','686'),(344,'North Korea','en','850'),(345,'Kosovo','en','383'),(346,'Kuwait','en','965'),(347,'Kyrgyz','en','996'),(348,'Laos','en','856'),(349,'Latvia','en','371'),(350,'Lebanon','en','961'),(351,'Lesotho','en','266'),(352,'Liberia','en','231'),(353,'Libya','en','218'),(354,'Liechtenstein','en','423'),(355,'Lithuania','en','370'),(356,'Luxembourg','en','352'),(357,'Macao China','en','853'),(358,'Republic of Macedonia','en','389'),(359,'Madagascar','en','261'),(360,'Malawi','en','265'),(361,'Malaysia','en','60'),(362,'Maldives','en','960'),(363,'Mali','en','223'),(364,'Malta','en','356'),(365,'Marshall Islands (Republic)','en','692'),(366,'Martinique','en','596'),(367,'Mauritania','en','222'),(368,'Mauritius','en','230'),(369,'Mayotte','en','262'),(370,'Mexico','en','52'),(371,'Micronesia','en','691'),(372,'Moldova','en','373'),(373,'Monaco','en','377'),(374,'Mongolia','en','976'),(375,'Montenegro','en','382'),(376,'Montserrat','en','1664'),(377,'Morocco','en','212'),(378,'Mozambique','en','258'),(379,'Myanmar','en','95'),(380,'Namibia','en','264'),(381,'Nauru','en','674'),(382,'Nepal','en','977'),(383,'Netherlands','en','31'),(384,'New Caledonia','en','687'),(385,'New Zealand','en','64'),(386,'Nicaragua','en','505'),(387,'Niger','en','227'),(388,'Nigeria','en','234'),(389,'Niue','en','683'),(390,'Northern Mariana Islands (Federal)','en','1670'),(391,'Norway','en','47'),(392,'Aman','en','968'),(393,'Pakistan','en','92'),(394,'Palau','en','680'),(395,'Palestine','en','970'),(396,'Panama','en','507'),(397,'Papua New Guinea','en','675'),(398,'Paraguay','en','595'),(399,'Peru','en','51'),(400,'Philippines','en','63'),(401,'Poland','en','48'),(402,'Portugal','en','351'),(403,'Puerto Rico','en','1787'),(404,'Qatar','en','974'),(405,'Congo','en','242'),(406,'Reunion Island','en','262'),(407,'Romania','en','40'),(408,'Russia','en','7'),(409,'Rwanda','en','250'),(410,'Saint Kitts and Nevis','en','1869'),(411,'Saint Lucia','en','1758'),(412,'Saint Pierre and Miquelon','en','508'),(413,'Saint Vincent and the Grenadines','en','1784'),(414,'Samoa Islands','en','685'),(415,'Republic of San Marino','en','378'),(416,'Sao Tome and Principe','en','239'),(417,'Saudi Arabia','en','966'),(418,'Senegal','en','221'),(419,'Serbia','en','381'),(420,'Seychelles','en','248'),(421,'Sierra Leone','en','232'),(422,'Singapore','en','65'),(423,'Saint Martin (Netherlands)','en','1721'),(424,'Slovakia','en','421'),(425,'Slovenia','en','386'),(426,'Solomon Islands','en','677'),(427,'Somali','en','252'),(428,'South Africa','en','27'),(429,'Korea','en','82'),(430,'South Sudan','en','211'),(431,'Spain','en','34'),(432,'Sri Lanka','en','94'),(433,'Sudan','en','249'),(434,'Suriname','en','597'),(435,'Swaziland','en','268'),(436,'Sweden','en','46'),(437,'Switzerland','en','41'),(438,'Syria','en','963'),(439,'China Taiwan','en','886'),(440,'Tajikistan','en','992'),(441,'Tanzania','en','255'),(442,'Thailand','en','66'),(443,'Togo','en','228'),(444,'Tokelau Islands','en','690'),(445,'Tonga','en','676'),(446,'Trinidad and Tobago','en','1868'),(447,'Tunisia','en','216'),(448,'Turkey','en','90'),(449,'Turkmenistan','en','993'),(450,'Turks and Caicos Islands','en','1649'),(451,'Tuvalu','en','688'),(452,'Uganda','en','256'),(453,'Ukraine','en','380'),(454,'United Arab Emirates','en','971'),(455,'United Kingdom','en','44'),(456,'United States','en','1'),(457,'U.S. Virgin Islands','en','1340'),(458,'Uruguay','en','598'),(459,'Uzbekistan','en','998'),(460,'Vanuatu','en','678'),(461,'Vatican City State','en','379'),(462,'Venezuela','en','58'),(463,'Vietnam','en','84'),(464,'Virgin Islands United Kingdom','en','1284'),(465,'Wallis and Futuna Islands','en','681'),(466,'Yemen','en','967'),(467,'Zambia','en','260'),(468,'Zimbabwe','en','263'),(469,'阿富汗','zh','93'),(470,'阿尔巴尼亚','zh','355'),(471,'阿尔及利亚','zh','213'),(472,'美属萨摩亚','zh','1684'),(473,'安道尔共和国','zh','376'),(474,'安哥拉','zh','244'),(475,'安圭拉岛','zh','1264'),(476,'安提瓜和巴布达	','zh','1268'),(477,'阿根廷','zh','54'),(478,'亚美尼亚','zh','374'),(479,'阿鲁巴','zh','297'),(480,'澳大利亚','zh','61'),(481,'奥地利','zh','43'),(482,'阿塞拜疆共和国','zh','994'),(483,'巴哈马','zh','1242'),(484,'巴林','zh','973'),(485,'孟加拉共和国','zh','880'),(486,'巴巴多斯','zh','1246'),(487,'白俄罗斯','zh','375'),(488,'比利时','zh','32'),(489,'伯利兹','zh','501'),(490,'贝宁共和国','zh','229'),(491,'百慕大群岛','zh','1441'),(492,'不丹','zh','975'),(493,'玻利维亚','zh','591'),(494,'博内尔岛、圣尤斯特歇斯岛和萨巴岛','zh','599'),(495,'波斯尼亚和黑塞哥维那','zh','387'),(496,'博茨瓦纳','zh','267'),(497,'巴西','zh','55'),(498,'文莱','zh','673'),(499,'保加利亚','zh','359'),(500,'布基纳法索','zh','226'),(501,'布隆迪','zh','257'),(502,'柬埔寨','zh','855'),(503,'喀麦隆','zh','237'),(504,'加拿大','zh','1'),(505,'佛得角','zh','238'),(506,'开曼群岛','zh','1345'),(507,'中非共和国	','zh','236'),(508,'乍得','zh','235'),(509,'智利','zh','56'),(510,'中国','zh','86'),(511,'哥伦比亚','zh','57'),(512,'科摩罗','zh','269'),(513,'库克群岛','zh','682'),(514,'哥斯达黎加','zh','506'),(515,'克罗地亚','zh','385'),(516,'古巴','zh','53'),(517,'库拉索','zh','599'),(518,'塞浦路斯','zh','357'),(519,'捷克共和国','zh','420'),(520,'刚果民主共和国','zh','243'),(521,'丹麦','zh','45'),(522,'迪戈加西亚岛','zh','246'),(523,'吉布提','zh','253'),(524,'多米尼克','zh','1767'),(525,'多米尼加','zh','1809'),(526,'东帝汶','zh','670'),(527,'厄瓜多尔','zh','593'),(528,'埃及','zh','20'),(529,'萨尔瓦多','zh','503'),(530,'赤道几内亚','zh','240'),(531,'厄立特里亚','zh','291'),(532,'爱沙尼亚','zh','372'),(533,'埃塞俄比亚','zh','251'),(534,'福克兰群岛','zh','500'),(535,'法罗群岛','zh','298'),(536,'斐济','zh','679'),(537,'芬兰','zh','358'),(538,'法国','zh','33'),(539,'法属圭亚那','zh','594'),(540,'法属波利尼西亚','zh','689'),(541,'加蓬','zh','241'),(542,'冈比亚','zh','220'),(543,'格鲁吉亚','zh','995'),(544,'德国','zh','49'),(545,'加纳','zh','233'),(546,'直布罗陀','zh','350'),(547,'希腊','zh','30'),(548,'格陵兰岛','zh','299'),(549,'格林纳达','zh','1473'),(550,'瓜德罗普岛','zh','590'),(551,'关岛','zh','1671'),(552,'危地马拉','zh','502'),(553,'巴布亚新几内亚','zh','224'),(554,'几内亚比绍共和国','zh','245'),(555,'圭亚那','zh','592'),(556,'海地','zh','509'),(557,'洪都拉斯','zh','504'),(558,'中国香港','zh','852'),(559,'匈牙利','zh','36'),(560,'冰岛','zh','354'),(561,'印度','zh','91'),(562,'印度尼西亚','zh','62'),(563,'伊朗','zh','98'),(564,'伊拉克','zh','964'),(565,'爱尔兰','zh','353'),(566,'以色列','zh','972'),(567,'意大利','zh','39'),(568,'科特迪瓦','zh','225'),(569,'牙买加','zh','1876'),(570,'日本','zh','81'),(571,'约旦','zh','962'),(572,'哈萨克斯坦','zh','7'),(573,'肯尼亚','zh','254'),(574,'基里巴斯','zh','686'),(575,'朝鲜(民主人民共和国)','zh','850'),(576,'科索沃','zh','383'),(577,'科威特','zh','965'),(578,'吉尔吉斯','zh','996'),(579,'老挝','zh','856'),(580,'拉脱维亚','zh','371'),(581,'黎巴嫩','zh','961'),(582,'莱索托','zh','266'),(583,'利比里亚','zh','231'),(584,'利比亚','zh','218'),(585,'列支敦士登','zh','423'),(586,'立陶宛','zh','370'),(587,'卢森堡','zh','352'),(588,'中国澳门','zh','853'),(589,'马其顿共和国','zh','389'),(590,'马达加斯加','zh','261'),(591,'马拉维','zh','265'),(592,'马来西亚','zh','60'),(593,'马尔代夫','zh','960'),(594,'马里','zh','223'),(595,'马耳他','zh','356'),(596,'马绍尔群岛(共和国)','zh','692'),(597,'马提尼克岛','zh','596'),(598,'毛里塔尼亚','zh','222'),(599,'毛里求斯','zh','230'),(600,'马约特','zh','262'),(601,'墨西哥','zh','52'),(602,'密克罗尼西亚','zh','691'),(603,'摩尔多瓦','zh','373'),(604,'摩纳哥','zh','377'),(605,'蒙古','zh','976'),(606,'黑山共和国','zh','382'),(607,'蒙特塞拉特岛','zh','1664'),(608,'摩洛哥','zh','212'),(609,'莫桑比克','zh','258'),(610,'缅甸','zh','95'),(611,'纳米比亚','zh','264'),(612,'瑙鲁','zh','674'),(613,'尼泊尔','zh','977'),(614,'荷兰','zh','31'),(615,'新喀里多尼亚','zh','687'),(616,'新西兰','zh','64'),(617,'尼加拉瓜','zh','505'),(618,'尼日尔','zh','227'),(619,'尼日利亚','zh','234'),(620,'纽埃','zh','683'),(621,'北马里亚纳群岛(联邦)','zh','1670'),(622,'挪威','zh','47'),(623,'阿曼','zh','968'),(624,'巴基斯坦','zh','92'),(625,'帕劳','zh','680'),(626,'巴勒斯坦','zh','970'),(627,'巴拿马','zh','507'),(628,'巴布亚新几内亚','zh','675'),(629,'巴拉圭','zh','595'),(630,'秘鲁','zh','51'),(631,'菲律宾','zh','63'),(632,'波兰','zh','48'),(633,'葡萄牙','zh','351'),(634,'波多黎各','zh','1787'),(635,'卡塔尔','zh','974'),(636,'刚果','zh','242'),(637,'留尼旺岛','zh','262'),(638,'罗马尼亚','zh','40'),(639,'俄罗斯','zh','7'),(640,'卢旺达','zh','250'),(641,'圣基茨和尼维斯','zh','1869'),(642,'圣卢西亚','zh','1758'),(643,'圣皮埃尔和密克隆','zh','508'),(644,'圣文森特和格林纳丁斯','zh','1784'),(645,'萨摩亚群岛','zh','685'),(646,'圣马力诺共和国','zh','378'),(647,'圣多美和普林西比','zh','239'),(648,'沙特阿拉伯','zh','966'),(649,'塞内加尔','zh','221'),(650,'塞尔维亚','zh','381'),(651,'塞舌尔','zh','248'),(652,'塞拉利昂','zh','232'),(653,'新加坡','zh','65'),(654,'圣马丁(荷兰）','zh','1721'),(655,'斯洛伐克','zh','421'),(656,'斯洛文尼亚','zh','386'),(657,'所罗门群岛','zh','677'),(658,'索马里','zh','252'),(659,'南非','zh','27'),(660,'韩国','zh','82'),(661,'南苏丹','zh','211'),(662,'西班牙','zh','34'),(663,'斯里兰卡','zh','94'),(664,'苏丹','zh','249'),(665,'苏里南','zh','597'),(666,'斯威士兰','zh','268'),(667,'瑞典','zh','46'),(668,'瑞士','zh','41'),(669,'叙利亚','zh','963'),(670,'中国台湾','zh','886'),(671,'塔吉克斯坦','zh','992'),(672,'坦桑尼亚','zh','255'),(673,'泰国','zh','66'),(674,'多哥','zh','228'),(675,'托克劳群岛','zh','690'),(676,'汤加','zh','676'),(677,'特立尼达和多巴哥','zh','1868'),(678,'突尼斯','zh','216'),(679,'土耳其','zh','90'),(680,'土库曼斯坦','zh','993'),(681,'特克斯和凯科斯群岛','zh','1649'),(682,'图瓦卢','zh','688'),(683,'乌干达','zh','256'),(684,'乌克兰','zh','380'),(685,'阿拉伯联合酋长国','zh','971'),(686,'英国','zh','44'),(687,'美国','zh','1'),(688,'美国维尔京群岛','zh','1340'),(689,'乌拉圭','zh','598'),(690,'乌兹别克斯坦','zh','998'),(691,'瓦努阿图','zh','678'),(692,'梵蒂冈城国','zh','379'),(693,'委内瑞拉','zh','58'),(694,'越南','zh','84'),(695,'维尔京群岛 英国','zh','1284'),(696,'瓦利斯和富图纳群岛','zh','681'),(697,'也门','zh','967'),(698,'赞比亚','zh','260'),(699,'津巴布韦','zh','263'),(700,'Afghanistan','vnm','93'),(701,'Albania','vnm','355'),(702,'Algeria','vnm','213'),(703,'American Samoa','vnm','1684'),(704,'Cộng hòa Andorra','vnm','376'),(705,'Angola','vnm','244'),(706,'Anguilla','vnm','1264'),(707,'Antigua và Barbuda','vnm','1268'),(708,'Argentina','vnm','54'),(709,'Armenia','vnm','374'),(710,'Aruba','vnm','297'),(711,'Úc','vnm','61'),(712,'Áo','vnm','43'),(713,'Cộng hòa Azerbaijan','vnm','994'),(714,'Bahamas','vnm','1242'),(715,'Bahrain','vnm','973'),(716,'Bangladesh','vnm','880'),(717,'Barbados','vnm','1246'),(718,'Belarus','vnm','375'),(719,'Bỉ','vnm','32'),(720,'Belize','vnm','501'),(721,'Cộng hòa Benin','vnm','229'),(722,'Quần đảo Bermuda','vnm','1441'),(723,'Bhutan','vnm','975'),(724,'Bolivia','vnm','591'),(725,'Bonaire, Sint Eustatius và Saba','vnm','599'),(726,'Bosnia và Herzegovina','vnm','387'),(727,'Botswana','vnm','267'),(728,'Brazil','vnm','55'),(729,'Brunei','vnm','673'),(730,'Bungari','vnm','359'),(731,'Burkina Faso','vnm','226'),(732,'Burundi','vnm','257'),(733,'Campuchia','vnm','855'),(734,'Cameroon','vnm','237'),(735,'Canada','vnm','1'),(736,'Cape Verde','vnm','238'),(737,'Quần đảo Cayman','vnm','1345'),(738,'Cộng hòa Trung Phi','vnm','236'),(739,'Chad','vnm','235'),(740,'Chile','vnm','56'),(741,'Trung Quốc','vnm','86'),(742,'Colombia','vnm','57'),(743,'Comoros','vnm','269'),(744,'Quần đảo Cook','vnm','682'),(745,'Costa Rica','vnm','506'),(746,'Croatia','vnm','385'),(747,'Cuba','vnm','53'),(748,'Curaçao','vnm','599'),(749,'Síp','vnm','357'),(750,'Cộng hòa Séc','vnm','420'),(751,'Cộng hòa Dân chủ Congo','vnm','243'),(752,'Đan Mạch','vnm','45'),(753,'Đảo Digo Garcia','vnm','246'),(754,'Djibouti','vnm','253'),(755,'Dominic','vnm','1767'),(756,'Dominica','vnm','1809'),(757,'Đông Timor','vnm','670'),(758,'Ecuador','vnm','593'),(759,'Ai Cập','vnm','20'),(760,'El Salvador','vnm','503'),(761,'Guinea Xích đạo','vnm','240'),(762,'Eritrea','vnm','291'),(763,'Estonia','vnm','372'),(764,'Ethiopia','vnm','251'),(765,'Quần đảo Falkland','vnm','500'),(766,'Quần đảo Faroe','vnm','298'),(767,'Fiji','vnm','679'),(768,'Phần Lan','vnm','358'),(769,'Pháp','vnm','33'),(770,'Guiana thuộc Pháp','vnm','594'),(771,'Polynesia thuộc Pháp','vnm','689'),(772,'Gabon','vnm','241'),(773,'Gambia','vnm','220'),(774,'Georgia','vnm','995'),(775,'Đức','vnm','49'),(776,'Ghana','vnm','233'),(777,'Gibraltar','vnm','350'),(778,'Hy Lạp','vnm','30'),(779,'Greenland','vnm','299'),(780,'Grenada','vnm','1473'),(781,'Guadeloupe','vnm','590'),(782,'Guam','vnm','1671'),(783,'Guatemala','vnm','502'),(784,'Papua New Guinea','vnm','224'),(785,'Cộng hòa Guinea-Bissau','vnm','245'),(786,'Guyana','vnm','592'),(787,'Haiti','vnm','509'),(788,'Honduras','vnm','504'),(789,'Hồng Kông, Trung Quốc','vnm','852'),(790,'Hungary','vnm','36'),(791,'Iceland','vnm','354'),(792,'Ấn Độ','vnm','91'),(793,'Indonesia','vnm','62'),(794,'Iran','vnm','98'),(795,'Iraq','vnm','964'),(796,'Ireland','vnm','353'),(797,'Israel','vnm','972'),(798,'Ý','vnm','39'),(799,'Côte d\'Ivoire','vnm','225'),(800,'Jamaica','vnm','1876'),(801,'Nhật Bản','vnm','81'),(802,'Jordan','vnm','962'),(803,'Kazakhstan','vnm','7'),(804,'Kenya','vnm','254'),(805,'Kiribati','vnm','686'),(806,'Bắc Triều Tiên (Cộng hòa Dân chủ Nhân dân)','vnm','850'),(807,'Kosovo','vnm','383'),(808,'Kuwait','vnm','965'),(809,'Kyrgyzstan','vnm','996'),(810,'Lào','vnm','856'),(811,'Latvia','vnm','371'),(812,'Lebanon','vnm','961'),(813,'Lesotho','vnm','266'),(814,'Liberia','vnm','231'),(815,'Libya','vnm','218'),(816,'Liechtenstein','vnm','423'),(817,'Lithuania','vnm','370'),(818,'Luxembourg','vnm','352'),(819,'Macao Trung Quốc','vnm','853'),(820,'Cộng hòa Macedonia','vnm','389'),(821,'Madagascar','vnm','261'),(822,'Malawi','vnm','265'),(823,'Malaysia','vnm','60'),(824,'Maldives','vnm','960'),(825,'Mali','vnm','223'),(826,'Malta','vnm','356'),(827,'Quần đảo Marshall (Cộng hòa)','vnm','692'),(828,'Martinique','vnm','596'),(829,'Mauritania','vnm','222'),(830,'Mauritius','vnm','230'),(831,'Mayotte','vnm','262'),(832,'Mexico','vnm','52'),(833,'Micronesia','vnm','691'),(834,'Moldova','vnm','373'),(835,'Monaco','vnm','377'),(836,'Mông Cổ','vnm','976'),(837,'Montenegro','vnm','382'),(838,'Montserrat','vnm','1664'),(839,'Maroc','vnm','212'),(840,'Mozambique','vnm','258'),(841,'Myanmar','vnm','95'),(842,'Namibia','vnm','264'),(843,'Nauru','vnm','674'),(844,'Nepal','vnm','977'),(845,'Hà Lan','vnm','31'),(846,'New Caledonia','vnm','687'),(847,'New Zealand','vnm','64'),(848,'Nicaragua','vnm','505'),(849,'Niger','vnm','227'),(850,'Nigeria','vnm','234'),(851,'Niue','vnm','683'),(852,'Quần đảo Bắc Mariana (Liên bang)','vnm','1670'),(853,'Na Uy','vnm','47'),(854,'Aman','vnm','968'),(855,'Pakistan','vnm','92'),(856,'Palau','vnm','680'),(857,'Palestine','vnm','970'),(858,'Panama','vnm','507'),(859,'Papua New Guinea','vnm','675'),(860,'Paraguay','vnm','595'),(861,'Peru','vnm','51'),(862,'Philippines','vnm','63'),(863,'Ba Lan','vnm','48'),(864,'Bồ Đào Nha','vnm','351'),(865,'Puerto Rico','vnm','1787'),(866,'Qatar','vnm','974'),(867,'Congo','vnm','242'),(868,'Đảo Reunion','vnm','262'),(869,'Romania','vnm','40'),(870,'Nga','vnm','7'),(871,'Rwanda','vnm','250'),(872,'Saint Kitts và Nevis','vnm','1869'),(873,'Saint Lucia','vnm','1758'),(874,'Saint Pierre và Miquelon','vnm','508'),(875,'Saint Vincent and the Grenadines','vnm','1784'),(876,'Quần đảo Samoa','vnm','685'),(877,'Cộng hòa San Marino','vnm','378'),(878,'Sao Tome và Principe','vnm','239'),(879,'Ả Rập Xê Út','vnm','966'),(880,'Senegal','vnm','221'),(881,'Serbia','vnm','381'),(882,'Seychelles','vnm','248'),(883,'Sierra Leone','vnm','232'),(884,'Singapore','vnm','65'),(885,'Saint Martin (Hà Lan)','vnm','1721'),(886,'Slovakia','vnm','421'),(887,'Slovenia','vnm','386'),(888,'Quần đảo Solomon','vnm','677'),(889,'Tiếng Somali','vnm','252'),(890,'Nam Phi','vnm','27'),(891,'Hàn Quốc','vnm','82'),(892,'Nam Sudan','vnm','211'),(893,'Tây Ban Nha','vnm','34'),(894,'Sri Lanka','vnm','94'),(895,'Sudan','vnm','249'),(896,'Suriname','vnm','597'),(897,'Swaziland','vnm','268'),(898,'Thụy Điển','vnm','46'),(899,'Thụy Sĩ','vnm','41'),(900,'Syria','vnm','963'),(901,'Đài Loan Trung Quốc','vnm','886'),(902,'Tajikistan','vnm','992'),(903,'Tanzania','vnm','255'),(904,'Thái Lan','vnm','66'),(905,'Togo','vnm','228'),(906,'Quần đảo Tokelau','vnm','690'),(907,'Tonga','vnm','676'),(908,'Trinidad và Tobago','vnm','1868'),(909,'Tunisia','vnm','216'),(910,'Thổ Nhĩ Kỳ','vnm','90'),(911,'Turkmenistan','vnm','993'),(912,'Quần đảo Turks và Caicos','vnm','1649'),(913,'Tuvalu','vnm','688'),(914,'Uganda','vnm','256'),(915,'Ukraina','vnm','380'),(916,'Các Tiểu vương quốc Ả Rập Thống nhất','vnm','971'),(917,'Vương quốc Anh','vnm','44'),(918,'Hoa Kỳ','vnm','1'),(919,'Quần đảo Virgin thuộc Hoa Kỳ','vnm','1340'),(920,'Uruguay','vnm','598'),(921,'Uzbekistan','vnm','998'),(922,'Vanuatu','vnm','678'),(923,'Nhà nước Thành phố Vatican','vnm','379'),(924,'Venezuela','vnm','58'),(925,'Việt Nam','vnm','84'),(926,'Quần đảo Virgin thuộc Vương quốc Anh','vnm','1284'),(927,'Quần đảo Wallis và Futuna','vnm','681'),(928,'Yemen','vnm','967'),(929,'Zambia','vnm','260'),(930,'Zimbabwe','vnm','263'),(931,'231','th','11'),(932,'阿富汗','hk','93'),(933,'阿爾巴尼亞','hk','355'),(934,'阿爾及利亞','hk','213'),(935,'美屬薩摩亞','hk','1684'),(936,'安道爾共和國','hk','376'),(937,'安哥拉','hk','244'),(938,'安圭拉島','hk','1264'),(939,'安堤瓜及巴爾布達	','hk','1268'),(940,'阿根廷','hk','54'),(941,'亞美尼亞','hk','374'),(942,'阿魯巴','hk','297'),(943,'澳大利亞','hk','61'),(944,'奧地利','hk','43'),(945,'阿塞拜疆共和國','hk','994'),(946,'巴哈馬','hk','1242'),(947,'巴林','hk','973'),(948,'孟加拉共和國','hk','880'),(949,'巴巴多斯','hk','1246'),(950,'白俄羅斯','hk','375'),(951,'比利時','hk','32'),(952,'貝裡斯','hk','501'),(953,'貝南共和國','hk','229'),(954,'百慕大群島','hk','1441'),(955,'不丹','hk','975'),(956,'玻利維亞','hk','591'),(957,'博內爾島、聖尤斯特歇斯島和薩巴島','hk','599'),(958,'波士尼亞和黑塞哥維那','hk','387'),(959,'波劄那','hk','267'),(960,'巴西','hk','55'),(961,'汶萊','hk','673'),(962,'保加利亞','hk','359'),(963,'伯基納法索','hk','226'),(964,'布隆迪','hk','257'),(965,'高棉','hk','855'),(966,'喀麥隆','hk','237'),(967,'加拿大','hk','1'),(968,'佛得角','hk','238'),(969,'開曼群島','hk','1345'),(970,'中非共和國	','hk','236'),(971,'查德','hk','235'),(972,'智利','hk','56'),(973,'中國','hk','86'),(974,'哥倫比亞','hk','57'),(975,'科摩羅','hk','269'),(976,'科克群島','hk','682'),(977,'哥斯大黎加','hk','506'),(978,'克羅地亞','hk','385'),(979,'古巴','hk','53'),(980,'庫拉索','hk','599'),(981,'賽普勒斯','hk','357'),(982,'捷克共和國','hk','420'),(983,'剛果民主共和國','hk','243'),(984,'丹麥','hk','45'),(985,'迪戈加西亞島','hk','246'),(986,'吉布提','hk','253'),(987,'多明尼克','hk','1767'),(988,'多明尼加','hk','1809'),(989,'東帝汶','hk','670'),(990,'厄瓜多','hk','593'),(991,'埃及','hk','20'),(992,'薩爾瓦多','hk','503'),(993,'赤道幾內亞','hk','240'),(994,'厄利垂亞','hk','291'),(995,'愛沙尼亞','hk','372'),(996,'衣索比亞','hk','251'),(997,'福克蘭群島','hk','500'),(998,'法羅群島','hk','298'),(999,'斐濟','hk','679'),(1000,'芬蘭','hk','358'),(1001,'法國','hk','33'),(1002,'法屬圭亞那','hk','594'),(1003,'法屬波利尼西亞','hk','689'),(1004,'加蓬','hk','241'),(1005,'岡比亞','hk','220'),(1006,'格魯吉亞','hk','995'),(1007,'德國','hk','49'),(1008,'加納','hk','233'),(1009,'直布羅陀','hk','350'),(1010,'希臘','hk','30'),(1011,'格陵蘭島','hk','299'),(1012,'格林伍德','hk','1473'),(1013,'瓜德羅普島','hk','590'),(1014,'關島','hk','1671'),(1015,'瓜地馬拉','hk','502'),(1016,'巴布亞新磯內亞','hk','224'),(1017,'幾內亞比索共和國','hk','245'),(1018,'蓋亞那','hk','592'),(1019,'海地','hk','509'),(1020,'洪都拉斯','hk','504'),(1021,'中國香港','hk','852'),(1022,'匈牙利','hk','36'),(1023,'冰島','hk','354'),(1024,'印度','hk','91'),(1025,'印尼','hk','62'),(1026,'伊朗','hk','98'),(1027,'伊拉克','hk','964'),(1028,'愛爾蘭','hk','353'),(1029,'以色列','hk','972'),(1030,'義大利','hk','39'),(1031,'象牙海岸','hk','225'),(1032,'牙買加','hk','1876'),(1033,'日本','hk','81'),(1034,'約旦','hk','962'),(1035,'哈薩克共和國','hk','7'),(1036,'肯雅','hk','254'),(1037,'吉裡巴斯','hk','686'),(1038,'朝鮮（民主人民共和國)','hk','850'),(1039,'科索沃','hk','383'),(1040,'科威特','hk','965'),(1041,'吉爾吉斯','hk','996'),(1042,'老撾','hk','856'),(1043,'拉脫維亞','hk','371'),(1044,'黎巴嫩','hk','961'),(1045,'萊索托','hk','266'),(1046,'賴比瑞亞','hk','231'),(1047,'利比亞','hk','218'),(1048,'列支敦士登','hk','423'),(1049,'立陶宛','hk','370'),(1050,'盧森堡','hk','352'),(1051,'中國澳門','hk','853'),(1052,'馬其頓共和國','hk','389'),(1053,'馬拉加西','hk','261'),(1054,'馬拉威','hk','265'),(1055,'馬來西亞','hk','60'),(1056,'瑪律地夫','hk','960'),(1057,'馬利','hk','223'),(1058,'馬爾他','hk','356'),(1059,'馬紹爾群島(共和國)','hk','692'),(1060,'馬提尼克島','hk','596'),(1061,'茅利塔尼亞','hk','222'),(1062,'模裡西斯','hk','230'),(1063,'馬約特','hk','262'),(1064,'墨西哥','hk','52'),(1065,'密克羅尼西亞','hk','691'),(1066,'莫爾達瓦','hk','373'),(1067,'摩納哥','hk','377'),(1068,'蒙古','hk','976'),(1069,'黑山共和國','hk','382'),(1070,'蒙特塞拉特島','hk','1664'),(1071,'摩洛哥','hk','212'),(1072,'莫三比克','hk','258'),(1073,'緬甸','hk','95'),(1074,'納米比亞','hk','264'),(1075,'瑙魯','hk','674'),(1076,'尼泊爾','hk','977'),(1077,'荷蘭','hk','31'),(1078,'新赫里多尼亞','hk','687'),(1079,'紐西蘭','hk','64'),(1080,'尼加拉瓜','hk','505'),(1081,'尼日','hk','227'),(1082,'奈及利亞','hk','234'),(1083,'紐埃','hk','683'),(1084,'北馬利安納群島（聯邦)','hk','1670'),(1085,'挪威','hk','47'),(1086,'阿曼','hk','968'),(1087,'巴基斯坦','hk','92'),(1088,'帕勞','hk','680'),(1089,'巴勒斯坦','hk','970'),(1090,'巴拿馬','hk','507'),(1091,'巴布亞新磯內亞','hk','675'),(1092,'巴拉圭','hk','595'),(1093,'秘魯','hk','51'),(1094,'菲律賓','hk','63'),(1095,'波蘭','hk','48'),(1096,'葡萄牙','hk','351'),(1097,'波多黎各','hk','1787'),(1098,'卡塔爾','hk','974'),(1099,'剛果','hk','242'),(1100,'留尼旺島','hk','262'),(1101,'羅馬尼亞','hk','40'),(1102,'俄羅斯','hk','7'),(1103,'盧安達','hk','250'),(1104,'聖基茨和尼維斯','hk','1869'),(1105,'聖盧西亞','hk','1758'),(1106,'聖皮爾和密克隆','hk','508'),(1107,'聖文森特和格林納丁斯群島','hk','1784'),(1108,'薩摩亞群島','hk','685'),(1109,'聖馬利諾共和國','hk','378'),(1110,'聖多美及普林西比島','hk','239'),(1111,'沙烏地阿拉伯','hk','966'),(1112,'塞內加爾','hk','221'),(1113,'塞爾維亞','hk','381'),(1114,'塞舌耳','hk','248'),(1115,'塞拉里昂','hk','232'),(1116,'新加坡','hk','65'),(1117,'聖馬丁(荷蘭)','hk','1721'),(1118,'斯洛伐克','hk','421'),(1119,'斯洛文尼亞','hk','386'),(1120,'所羅門群島','hk','677'),(1121,'索馬利亞','hk','252'),(1122,'南非','hk','27'),(1123,'韓國','hk','82'),(1124,'南蘇丹','hk','211'),(1125,'西班牙','hk','34'),(1126,'斯里蘭卡','hk','94'),(1127,'蘇丹','hk','249'),(1128,'蘇利南','hk','597'),(1129,'史瓦濟蘭','hk','268'),(1130,'瑞典','hk','46'),(1131,'瑞士','hk','41'),(1132,'敘利亞','hk','963'),(1133,'中國臺灣','hk','886'),(1134,'塔吉克共和國','hk','992'),(1135,'坦尚尼亞','hk','255'),(1136,'泰國','hk','66'),(1137,'多哥','hk','228'),(1138,'托克勞群島','hk','690'),(1139,'東加','hk','676'),(1140,'千裡達托貝哥','hk','1868'),(1141,'突尼斯','hk','216'),(1142,'土耳其','hk','90'),(1143,'土庫曼共和國','hk','993'),(1144,'特克斯和凱科斯群島','hk','1649'),(1145,'吐瓦魯','hk','688'),(1146,'烏干達','hk','256'),(1147,'烏克蘭','hk','380'),(1148,'阿拉伯聯合大公國','hk','971'),(1149,'英國','hk','44'),(1150,'美國','hk','1'),(1151,'美國維京群島','hk','1340'),(1152,'烏拉圭','hk','598'),(1153,'烏茲別克','hk','998'),(1154,'瓦努阿圖','hk','678'),(1155,'梵蒂岡城國','hk','379'),(1156,'委內瑞拉','hk','58'),(1157,'越南','hk','84'),(1158,'維京群島英國','hk','1284'),(1159,'瓦利斯和富圖納群島','hk','681'),(1160,'葉門','hk','967'),(1161,'尚比亞','hk','260'),(1162,'辛巴威','hk','263'),(1269,'朝鮮(民主人民共和國)','hk','850'),(1315,'北馬利安納群島(聯邦)','hk','1670'),(1348,'聖馬丁（荷蘭)','hk','1721'),(1394,'Afganistán','esp','93'),(1395,'Albania','esp','355'),(1396,'Argelia','esp','213'),(1397,'Samoa Americana','esp','1684'),(1398,'República de Andorra','esp','376'),(1399,'Angola','esp','244'),(1400,'Anguila','esp','1264'),(1401,'Antigua y Barbuda	','esp','1268'),(1402,'Argentina','esp','54'),(1403,'Armenia','esp','374'),(1404,'Aruba','esp','297'),(1405,'Australia','esp','61'),(1406,'Austria','esp','43'),(1407,'República de Azerbaiyán','esp','994'),(1408,'Bahamas','esp','1242'),(1409,'Bahréin','esp','973'),(1410,'Bangladesh','esp','880'),(1411,'Barbados','esp','1246'),(1412,'Bielorrusia','esp','375'),(1413,'Bélgica','esp','32'),(1414,'Belice','esp','501'),(1415,'República de Benin','esp','229'),(1416,'islas Bermudas','esp','1441'),(1417,'Bután','esp','975'),(1418,'Bolivia','esp','591'),(1419,'Bonaire, Sint Eustatius y Saba','esp','599'),(1420,'Bosnia y Herzegovina','esp','387'),(1421,'Botswana','esp','267'),(1422,'Brasil','esp','55'),(1423,'Brunei','esp','673'),(1424,'Bulgaria','esp','359'),(1425,'Burkina Faso','esp','226'),(1426,'Burundi','esp','257'),(1427,'Camboya','esp','855'),(1428,'Camerún','esp','237'),(1429,'Canadá','esp','1'),(1430,'Cabo Verde','esp','238'),(1431,'Islas Caimán','esp','1345'),(1432,'República Centroafricana','esp','236'),(1433,'Chad','esp','235'),(1434,'Chile','esp','56'),(1435,'porcelana','esp','86'),(1436,'Colombia','esp','57'),(1437,'Comoras','esp','269'),(1438,'Islas Cook','esp','682'),(1439,'Costa Rica','esp','506'),(1440,'Croacia','esp','385'),(1441,'Cuba','esp','53'),(1442,'Curazao','esp','599'),(1443,'Chipre','esp','357'),(1444,'República Checa','esp','420'),(1445,'República Democrática del Congo','esp','243'),(1446,'Dinamarca','esp','45'),(1447,'Diego García','esp','246'),(1448,'Djibouti','esp','253'),(1449,'Timor Oriental','esp','670'),(1450,'Ecuador','esp','593'),(1451,'Egipto','esp','20'),(1452,'el Salvador','esp','503'),(1453,'Guinea Ecuatorial','esp','240'),(1454,'Eritrea','esp','291'),(1455,'Estonia','esp','372'),(1456,'Etiopía','esp','251'),(1457,'Islas Malvinas','esp','500'),(1458,'Islas Faroe','esp','298'),(1459,'Fiyi','esp','679'),(1460,'Finlandia','esp','358'),(1461,'Francia','esp','33'),(1462,'Guayana Francesa','esp','594'),(1463,'Polinesia francés','esp','689'),(1464,'Gabón','esp','241'),(1465,'Gambia','esp','220'),(1466,'Georgia','esp','995'),(1467,'Alemania','esp','49'),(1468,'Ghana','esp','233'),(1469,'Gibraltar','esp','350'),(1470,'Grecia','esp','30'),(1471,'Groenlandia','esp','299'),(1472,'Granada','esp','1473'),(1473,'Guadalupe','esp','590'),(1474,'Guam','esp','1671'),(1475,'Guatemala','esp','502'),(1476,'Papúa Nueva Guinea','esp','224'),(1477,'Guinea-Bissau','esp','245'),(1478,'Guayana','esp','592'),(1479,'Haití','esp','509'),(1480,'Honduras','esp','504'),(1481,'Hong Kong, China','esp','852'),(1482,'Hungría','esp','36'),(1483,'Islandia','esp','354'),(1484,'India','esp','91'),(1485,'Indonesia','esp','62'),(1486,'Iran','esp','98'),(1487,'Irak','esp','964'),(1488,'Irlanda','esp','353'),(1489,'Israel','esp','972'),(1490,'Italia','esp','39'),(1491,'Costa de Marfil','esp','225'),(1492,'Jamaica','esp','1876'),(1493,'Japón','esp','81'),(1494,'Jordán','esp','962'),(1495,'Kazajstán','esp','7'),(1496,'Kenia','esp','254'),(1497,'Kiribati','esp','686'),(1498,'Corea del Norte(República Popular Democrática)','esp','850'),(1499,'Kosovo','esp','383'),(1500,'Kuwait','esp','965'),(1501,'Kirguís','esp','996'),(1502,'Laos','esp','856'),(1503,'Letonia','esp','371'),(1504,'Líbano','esp','961'),(1505,'Lesoto','esp','266'),(1506,'Liberia','esp','231'),(1507,'Libia','esp','218'),(1508,'Liechtenstein','esp','423'),(1509,'Lituania','esp','370'),(1510,'Luxemburgo','esp','352'),(1511,'Macao,China','esp','853'),(1512,'República de Macedonia','esp','389'),(1513,'Madagascar','esp','261'),(1514,'Malawi','esp','265'),(1515,'Malasia','esp','60'),(1516,'Maldivas','esp','960'),(1517,'Mali','esp','223'),(1518,'Malta','esp','356'),(1519,'Islas Marshall (República)','esp','692'),(1520,'Martinica','esp','596'),(1521,'Mauritania','esp','222'),(1522,'Mauricio','esp','230'),(1523,'Mayotte','esp','262'),(1524,'México','esp','52'),(1525,'Micronesia','esp','691'),(1526,'Moldavia','esp','373'),(1527,'Mónaco','esp','377'),(1528,'Mongolia','esp','976'),(1529,'Montenegro','esp','382'),(1530,'Montserrat','esp','1664'),(1531,'Marruecos','esp','212'),(1532,'Mozambique','esp','258'),(1533,'Myanmar','esp','95'),(1534,'Namibia','esp','264'),(1535,'Nauru','esp','674'),(1536,'Nepal','esp','977'),(1537,'Países Bajos','esp','31'),(1538,'Nueva Caledonia','esp','687'),(1539,'Nueva Zelanda','esp','64'),(1540,'Nicaragua','esp','505'),(1541,'Níger','esp','227'),(1542,'Nigeria','esp','234'),(1543,'Niue','esp','683'),(1544,'Islas Marianas del Norte (Federación)','esp','1670'),(1545,'Noruega','esp','47'),(1546,'Omán','esp','968'),(1547,'Pakistán','esp','92'),(1548,'Palau','esp','680'),(1549,'Palestina','esp','970'),(1550,'Panamá','esp','507'),(1551,'Papúa Nueva Guinea','esp','675'),(1552,'Paraguay','esp','595'),(1553,'Perú','esp','51'),(1554,'filipino','esp','63'),(1555,'Polonia','esp','48'),(1556,'Portugal','esp','351'),(1557,'Puerto Rico','esp','1787'),(1558,'Katar','esp','974'),(1559,'Congo','esp','242'),(1560,'Reunión','esp','262'),(1561,'Rumania','esp','40'),(1562,'Rusia','esp','7'),(1563,'Ruanda','esp','250'),(1564,'Saint Kitts y Nevis','esp','1869'),(1565,'Santa Lucía','esp','1758'),(1566,'San Pedro y Miquelón','esp','508'),(1567,'San Vicente y las Granadinas','esp','1784'),(1568,'Samoa','esp','685'),(1569,'República de San Marino','esp','378'),(1570,'Santo Tomé y Príncipe','esp','239'),(1571,'Arabia Saudita','esp','966'),(1572,'Senegal','esp','221'),(1573,'Serbia','esp','381'),(1574,'Seychelles','esp','248'),(1575,'Sierra Leona','esp','232'),(1576,'Singapur','esp','65'),(1577,'San Martín(Holanda)','esp','1721'),(1578,'Eslovaquia','esp','421'),(1579,'Eslovenia','esp','386'),(1580,'Islas Salomón','esp','677'),(1581,'Somalia','esp','252'),(1582,'Sudáfrica','esp','27'),(1583,'Corea del Sur','esp','82'),(1584,'Sudán del Sur','esp','211'),(1585,'España','esp','34'),(1586,'Sri Lanka','esp','94'),(1587,'Sudán','esp','249'),(1588,'Surinam','esp','597'),(1589,'Swazilandia','esp','268'),(1590,'Suecia','esp','46'),(1591,'Suiza','esp','41'),(1592,'Siria','esp','963'),(1593,'Taiwán, China','esp','886'),(1594,'Tayikistán','esp','992'),(1595,'Tanzania','esp','255'),(1596,'Tailandia','esp','66'),(1597,'Ir','esp','228'),(1598,'Tokelau','esp','690'),(1599,'Tonga','esp','676'),(1600,'Trinidad y Tobago','esp','1868'),(1601,'Túnez','esp','216'),(1602,'pavo','esp','90'),(1603,'Turkmenistán','esp','993'),(1604,'Islas Turcas y Caicos','esp','1649'),(1605,'Tuvalu','esp','688'),(1606,'Uganda','esp','256'),(1607,'Ucrania','esp','380'),(1608,'Emiratos Árabes Unidos','esp','971'),(1609,'Reino Unido','esp','44'),(1610,'NOSOTROS','esp','1'),(1611,'Islas Vírgenes de EE.UU','esp','1340'),(1612,'Uruguay','esp','598'),(1613,'Uzbekistan','esp','998'),(1614,'Vanuatu','esp','678'),(1615,'Estado de la Ciudad del Vaticano','esp','379'),(1616,'Venezuela','esp','58'),(1617,'Vietnam','esp','84'),(1618,'Islas Vírgenes Reino Unido','esp','1284'),(1619,'Islas Wallis y Futuna','esp','681'),(1620,'Yemen','esp','967'),(1621,'Zambia','esp','260'),(1622,'Zimbabue','esp','263'),(1623,'アフガニスタン','jp','93'),(1624,'アルバニア','jp','355'),(1625,'アルジェリア','jp','213'),(1626,'アメリカ領サモア','jp','1684'),(1627,'アンドラ共和国','jp','376'),(1628,'アンゴラ','jp','244'),(1629,'アンギラ','jp','1264'),(1630,'アンティグアバーブーダ	','jp','1268'),(1631,'アルゼンチン','jp','54'),(1632,'アルメニア','jp','374'),(1633,'アルバ','jp','297'),(1634,'オーストラリア','jp','61'),(1635,'オーストリア','jp','43'),(1636,'アゼルバイジャン共和国','jp','994'),(1637,'バハマ','jp','1242'),(1638,'バーレーン','jp','973'),(1639,'バングラデシュ','jp','880'),(1640,'バルバドス','jp','1246'),(1641,'ベラルーシ','jp','375'),(1642,'ベルギー','jp','32'),(1643,'ベリーズ','jp','501'),(1644,'ベナン共和国','jp','229'),(1645,'バミューダ','jp','1441'),(1646,'ブータン','jp','975'),(1647,'ボリビア','jp','591'),(1648,'ボネール、シントユースタティウス、サバ','jp','599'),(1649,'ボスニア・ヘルツェゴビナ','jp','387'),(1650,'ボツワナ','jp','267'),(1651,'ブラジル','jp','55'),(1652,'ブルネイ','jp','673'),(1653,'ブルガリア','jp','359'),(1654,'ブルキナファソ','jp','226'),(1655,'ブルンジ','jp','257'),(1656,'カンボジア','jp','855'),(1657,'カメルーン','jp','237'),(1658,'カナダ','jp','1'),(1659,'カーボベルデ','jp','238'),(1660,'ケイマン諸島','jp','1345'),(1661,'中央アフリカ共和国	','jp','236'),(1662,'チャド','jp','235'),(1663,'チリ','jp','56'),(1664,'中国','jp','86'),(1665,'コロンビア','jp','57'),(1666,'コモロ','jp','269'),(1667,'小島','jp','682'),(1668,'コスタリカ','jp','506'),(1669,'クロアチア','jp','385'),(1670,'古巴','jp','53'),(1671,'キュラソー','jp','599'),(1672,'キプロス','jp','357'),(1673,'チェコ共和国','jp','420'),(1674,'コンゴ民主共和国','jp','243'),(1675,'デンマーク','jp','45'),(1676,'ディエゴガルシア','jp','246'),(1677,'ジブチ','jp','253'),(1678,'ドミニカ','jp','1767'),(1679,'ドミニカ','jp','1809'),(1680,'東ティモール','jp','670'),(1681,'エクアドル','jp','593'),(1682,'エジプト','jp','20'),(1683,'サルバドール','jp','503'),(1684,'赤道ギニア','jp','240'),(1685,'エリトリア','jp','291'),(1686,'エストニア','jp','372'),(1687,'エチオピア','jp','251'),(1688,'フォークランド諸島','jp','500'),(1689,'フェロー諸島','jp','298'),(1690,'フィジー','jp','679'),(1691,'フィンランド','jp','358'),(1692,'フランス','jp','33'),(1693,'フランス領ギアナ','jp','594'),(1694,'フランス領ポリネシア','jp','689'),(1695,'ガボン','jp','241'),(1696,'ガンビア','jp','220'),(1697,'ジョージア','jp','995'),(1698,'ドイツ','jp','49'),(1699,'ガーナ','jp','233'),(1700,'ジブラルタル','jp','350'),(1701,'ギリシャ','jp','30'),(1702,'グリーンランド','jp','299'),(1703,'グレナダ','jp','1473'),(1704,'グアドループ','jp','590'),(1705,'グアム','jp','1671'),(1706,'グアテマラ','jp','502'),(1707,'パプアニューギニア','jp','224'),(1708,'ギニアビサウ','jp','245'),(1709,'ガイアナ','jp','592'),(1710,'ハイチ','jp','509'),(1711,'ホンジュラス','jp','504'),(1712,'中国香港','jp','852'),(1713,'ハンガリー','jp','36'),(1714,'アイスランド','jp','354'),(1715,'インド','jp','91'),(1716,'インドネシア','jp','62'),(1717,'イラン','jp','98'),(1718,'イラク','jp','964'),(1719,'アイルランド','jp','353'),(1720,'イスラエル','jp','972'),(1721,'イタリア','jp','39'),(1722,'コートジボワール','jp','225'),(1723,'ジャマイカ','jp','1876'),(1724,'日本','jp','81'),(1725,'ヨルダン','jp','962'),(1726,'カザフスタン','jp','7'),(1727,'ケニア','jp','254'),(1728,'キリバス','jp','686'),(1729,'北朝鮮（民主人民共和国）','jp','850'),(1730,'コソボ','jp','383'),(1731,'クウェート','jp','965'),(1732,'キルギス','jp','996'),(1733,'ラオス','jp','856'),(1734,'ラトビア','jp','371'),(1735,'レバノン','jp','961'),(1736,'レソト','jp','266'),(1737,'リベリア','jp','231'),(1738,'リビア','jp','218'),(1739,'リヒテンシュタイン','jp','423'),(1740,'リトアニア','jp','370'),(1741,'ルクセンブルク','jp','352'),(1742,'中国、マカオ','jp','853'),(1743,'マケドニア共和国','jp','389'),(1744,'マダガスカル','jp','261'),(1745,'マラウイ','jp','265'),(1746,'マレーシア','jp','60'),(1747,'モルディブ','jp','960'),(1748,'マリ','jp','223'),(1749,'マルタ','jp','356'),(1750,'マーシャル諸島（共和国）','jp','692'),(1751,'マルティニーク','jp','596'),(1752,'モーリタニア','jp','222'),(1753,'モーリシャス','jp','230'),(1754,'マヨット','jp','262'),(1755,'メキシコ','jp','52'),(1756,'ミクロネシア','jp','691'),(1757,'モルドバ','jp','373'),(1758,'モナコ','jp','377'),(1759,'モンゴル','jp','976'),(1760,'モンテネグロ','jp','382'),(1761,'モントセラト','jp','1664'),(1762,'モロッコ','jp','212'),(1763,'モザンビーク','jp','258'),(1764,'ミャンマー','jp','95'),(1765,'ナミビア','jp','264'),(1766,'ナウル','jp','674'),(1767,'ネパール','jp','977'),(1768,'オランダ','jp','31'),(1769,'ニューカレドニア','jp','687'),(1770,'ニュージーランド','jp','64'),(1771,'ニカラグア','jp','505'),(1772,'ニジェール','jp','227'),(1773,'ナイジェリア','jp','234'),(1774,'ニウエ','jp','683'),(1775,'北マリアナ諸島（連邦）','jp','1670'),(1776,'ノルウェー','jp','47'),(1777,'オマーン','jp','968'),(1778,'パキスタン','jp','92'),(1779,'パラオ','jp','680'),(1780,'パレスチナ','jp','970'),(1781,'パナマ','jp','507'),(1782,'パプアニューギニア','jp','675'),(1783,'パラグアイ','jp','595'),(1784,'ペルー','jp','51'),(1785,'フィリピン','jp','63'),(1786,'ポーランド','jp','48'),(1787,'ポルトガル','jp','351'),(1788,'プエルトリコ','jp','1787'),(1789,'カタール','jp','974'),(1790,'コンゴ','jp','242'),(1791,'再会','jp','262'),(1792,'ルーマニア','jp','40'),(1793,'ロシア','jp','7'),(1794,'ルワンダ','jp','250'),(1795,'セントクリストファーネイビス','jp','1869'),(1796,'セントルシア','jp','1758'),(1797,'サンピエール島とミクロン島','jp','508'),(1798,'セントビンセントおよびグレナディーン諸島','jp','1784'),(1799,'サモア','jp','685'),(1800,'サンマリノ共和国','jp','378'),(1801,'サントメ・プリンシペ','jp','239'),(1802,'サウジアラビア','jp','966'),(1803,'セネガル','jp','221'),(1804,'セルビア','jp','381'),(1805,'セイシェル','jp','248'),(1806,'シエラレオネ','jp','232'),(1807,'シンガポール','jp','65'),(1808,'セントマーチン（オランダ）','jp','1721'),(1809,'スロバキア','jp','421'),(1810,'スロベニア','jp','386'),(1811,'ソロモン諸島','jp','677'),(1812,'ソマリア','jp','252'),(1813,'南アフリカ','jp','27'),(1814,'韓国','jp','82'),(1815,'南スーダン','jp','211'),(1816,'スペイン','jp','34'),(1817,'スリランカ','jp','94'),(1818,'スーダン','jp','249'),(1819,'スリナム','jp','597'),(1820,'スワジランド','jp','268'),(1821,'スウェーデン','jp','46'),(1822,'スイス','jp','41'),(1823,'シリア','jp','963'),(1824,'台湾、中国','jp','886'),(1825,'タジキスタン','jp','992'),(1826,'タンザニア','jp','255'),(1827,'タイ','jp','66'),(1828,'トーゴ','jp','228'),(1829,'トケラウ','jp','690'),(1830,'トンガ','jp','676'),(1831,'トリニダード・トバゴ','jp','1868'),(1832,'チュニジア','jp','216'),(1833,'七面鳥','jp','90'),(1834,'トルクメニスタン','jp','993'),(1835,'タークス・カイコス諸島','jp','1649'),(1836,'ツバル','jp','688'),(1837,'ウガンダ','jp','256'),(1838,'ウクライナ','jp','380'),(1839,'アラブ首長国連邦','jp','971'),(1840,'イギリス','jp','44'),(1841,'アメリカ','jp','1'),(1842,'アメリカ領バージン諸島','jp','1340'),(1843,'ウルグアイ','jp','598'),(1844,'ウズベキスタン','jp','998'),(1845,'バヌアツ','jp','678'),(1846,'バチカン市国','jp','379'),(1847,'ベネズエラ','jp','58'),(1848,'ベトナム','jp','84'),(1849,'バージン諸島イギリス','jp','1284'),(1850,'ウォリス・フツナ諸島','jp','681'),(1851,'イエメン','jp','967'),(1852,'ザンビア','jp','260'),(1853,'ジンバブエ','jp','263');
/*!40000 ALTER TABLE `area_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto_list`
--

DROP TABLE IF EXISTS `auto_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auto_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `buy_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '买方user_id',
  `sell_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '卖方user_id',
  `currency_id` int(11) NOT NULL DEFAULT '0' COMMENT '币种id',
  `legal_id` int(11) NOT NULL DEFAULT '0' COMMENT '法币id',
  `min_price` decimal(20,5) NOT NULL DEFAULT '0.00000' COMMENT '最低',
  `max_price` decimal(20,5) NOT NULL DEFAULT '0.00000' COMMENT '最高',
  `min_number` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `max_number` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `need_second` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `is_start` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto_list`
--

LOCK TABLES `auto_list` WRITE;
/*!40000 ALTER TABLE `auto_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `auto_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank`
--

DROP TABLE IF EXISTS `bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bank` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lang` varchar(10) COLLATE utf8_unicode_ci NOT NULL COMMENT '语言',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='银行列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
INSERT INTO `bank` VALUES (1,'中国工商银行','zh'),(2,'中国建设银行','zh'),(3,'交通银行','zh'),(4,'农村商业银行','zh'),(5,'中国银行','zh'),(6,'招商银行','zh'),(7,'中国农业银行','zh'),(8,'民生银行','zh'),(9,'中国邮政储蓄银行','zh'),(10,'华夏银行','zh'),(11,'广发银行','zh');
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boss_account`
--

DROP TABLE IF EXISTS `boss_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boss_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `p_uid` int(11) DEFAULT NULL COMMENT '父亲id',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1已申请 2:已激活',
  `invite_code` varchar(30) DEFAULT NULL COMMENT '邀请码',
  `total_invited` mediumint(9) DEFAULT '0' COMMENT '邀请成为boss用户数',
  `total_active` mediumint(9) DEFAULT '0' COMMENT '下线激活总人数',
  `total_profit` decimal(25,8) DEFAULT '0.00000000' COMMENT '总收益',
  `balance` decimal(25,8) DEFAULT '0.00000000' COMMENT '账户余额',
  `parent_id_array` varchar(255) DEFAULT NULL COMMENT 'json 祖宗uid数组 从父亲开始',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boss_account`
--

LOCK TABLES `boss_account` WRITE;
/*!40000 ALTER TABLE `boss_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `boss_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boss_account_log`
--

DROP TABLE IF EXISTS `boss_account_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boss_account_log` (
  `id` int(11) unsigned NOT NULL,
  `boss_account_id` int(11) DEFAULT NULL,
  `key` varchar(100) DEFAULT NULL,
  `amount` decimal(25,8) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boss_account_log`
--

LOCK TABLES `boss_account_log` WRITE;
/*!40000 ALTER TABLE `boss_account_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `boss_account_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boss_account_relation`
--

DROP TABLE IF EXISTS `boss_account_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boss_account_relation` (
  `id` int(11) unsigned NOT NULL,
  `uid` int(11) unsigned DEFAULT NULL,
  `relatived_uid` int(11) unsigned DEFAULT NULL,
  `type` tinyint(1) unsigned DEFAULT NULL COMMENT '1:parent 2:child',
  `generation` tinyint(2) unsigned DEFAULT NULL COMMENT '第几代关系，父子为第一代',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boss_account_relation`
--

LOCK TABLES `boss_account_relation` WRITE;
/*!40000 ALTER TABLE `boss_account_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `boss_account_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boss_account_return_fail`
--

DROP TABLE IF EXISTS `boss_account_return_fail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `boss_account_return_fail` (
  `id` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `fail_type` tinyint(1) DEFAULT NULL COMMENT '1:未激活，2:拉不够人',
  `relative_account_id` int(11) DEFAULT NULL,
  `generation` tinyint(4) DEFAULT NULL COMMENT '冗余字段，方便处理',
  `amount` decimal(25,8) DEFAULT NULL COMMENT '反佣数',
  `status` tinyint(1) DEFAULT '1' COMMENT '1:未处理，2:已处理',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boss_account_return_fail`
--

LOCK TABLES `boss_account_return_fail` WRITE;
/*!40000 ALTER TABLE `boss_account_return_fail` DISABLE KEYS */;
/*!40000 ALTER TABLE `boss_account_return_fail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c2c_deal`
--

DROP TABLE IF EXISTS `c2c_deal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c2c_deal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `legal_deal_send_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `seller_id` int(11) NOT NULL DEFAULT '0' COMMENT '发布方用户id',
  `number` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `is_sure` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 未完成 1 已完成  2取消  3已付款',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c2c_deal`
--

LOCK TABLES `c2c_deal` WRITE;
/*!40000 ALTER TABLE `c2c_deal` DISABLE KEYS */;
/*!40000 ALTER TABLE `c2c_deal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c2c_deal_send`
--

DROP TABLE IF EXISTS `c2c_deal_send`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c2c_deal_send` (
  `id` int(10) unsigned NOT NULL,
  `seller_id` int(11) NOT NULL DEFAULT '0' COMMENT '发布方用户id',
  `currency_id` int(11) NOT NULL DEFAULT '0',
  `type` enum('buy','sell') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'sell',
  `way` enum('bank','we_chat','ali_pay') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'bank',
  `price` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `total_number` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `surplus_number` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `min_number` decimal(20,5) NOT NULL DEFAULT '0.00000' COMMENT '最小购买量',
  `is_done` tinyint(4) NOT NULL DEFAULT '0' COMMENT ' 0 未完成  1完成    2 24小时未交易取消',
  `create_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c2c_deal_send`
--

LOCK TABLES `c2c_deal_send` WRITE;
/*!40000 ALTER TABLE `c2c_deal_send` DISABLE KEYS */;
/*!40000 ALTER TABLE `c2c_deal_send` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candy_transfer`
--

DROP TABLE IF EXISTS `candy_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `candy_transfer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` int(10) unsigned NOT NULL COMMENT '转出用户id',
  `to_user_id` int(10) unsigned NOT NULL COMMENT '转入用户id',
  `transfer_qty` decimal(20,6) unsigned NOT NULL COMMENT '转账数量',
  `transfer_rate` decimal(20,2) unsigned NOT NULL COMMENT '手续费率(百分比)',
  `transfer_fee` decimal(20,6) unsigned NOT NULL COMMENT '手续费',
  `create_time` int(10) unsigned NOT NULL COMMENT '转账时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='糖果转账';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candy_transfer`
--

LOCK TABLES `candy_transfer` WRITE;
/*!40000 ALTER TABLE `candy_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `candy_transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chain_hashes`
--

DROP TABLE IF EXISTS `chain_hashes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chain_hashes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL COMMENT '币种代码',
  `txid` varchar(1024) NOT NULL COMMENT '链上交易hash',
  `amount` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '转账金额',
  `sender` varchar(1024) NOT NULL COMMENT '转出地址',
  `recipient` varchar(1024) NOT NULL COMMENT '转入地址',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='钱包链哈希表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chain_hashes`
--

LOCK TABLES `chain_hashes` WRITE;
/*!40000 ALTER TABLE `chain_hashes` DISABLE KEYS */;
/*!40000 ALTER TABLE `chain_hashes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `charge_req`
--

DROP TABLE IF EXISTS `charge_req`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `charge_req` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `amount` decimal(15,8) NOT NULL COMMENT '金额数量',
  `user_account` varchar(500) NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '状态：1未审核 2已完成加钱 3已拒绝 4完成不加钱',
  `currency_id` int(11) NOT NULL COMMENT '币ID',
  `remark` varchar(200) NOT NULL COMMENT '备注',
  `created_at` datetime NOT NULL COMMENT '提交时间',
  `updated_at` datetime NOT NULL COMMENT '审核时间',
  `is_bank` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1银行卡充值  0币充值',
  `daozhang_num` decimal(20,8) NOT NULL COMMENT '到账金额',
  `img` varchar(255) DEFAULT NULL COMMENT '图片',
  `warn` int(11) NOT NULL DEFAULT '0' COMMENT '充值提醒',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='充值记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge_req`
--

LOCK TABLES `charge_req` WRITE;
/*!40000 ALTER TABLE `charge_req` DISABLE KEYS */;
INSERT INTO `charge_req` VALUES (1,5,100000.00000000,'',2,3,'','2023-07-25 03:30:43','2023-07-25 03:31:18',0,100000.00000000,'https://eme.plus/upload/1690227010969030.jpg',1),(2,6,100000.00000000,'',2,3,'','2023-07-25 04:32:03','2023-07-25 04:32:17',0,100000.00000000,'https://eme.plus/upload/169023071899304.png',1),(3,10,50000.00000000,'',2,3,'','2023-08-08 14:17:15','2023-08-08 14:17:48',0,50000.00000000,'https://capitalone1.vip/upload/1691475434624584.png',1),(4,9,100000.00000000,'',2,3,'','2023-08-08 14:18:35','2023-08-08 14:18:51',0,100000.00000000,'https://capitalone1.vip/upload/1691475499674939.jpg',1);
/*!40000 ALTER TABLE `charge_req` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_log`
--

DROP TABLE IF EXISTS `chat_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chat_log` (
  `id` int(10) unsigned NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1,文字 2,图片 3,视频,4,日期',
  `content` varchar(1024) NOT NULL,
  `from_user` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发送人',
  `to_user` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '接收人',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '发送时间',
  `updated_at` timestamp NULL DEFAULT NULL,
  `trade_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '交易类型0.c2c',
  `trade_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '交易的id',
  `readed` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否已读0,未读。1，已读'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='im聊天记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_log`
--

LOCK TABLES `chat_log` WRITE;
/*!40000 ALTER TABLE `chat_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `chat_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coin_trade`
--

DROP TABLE IF EXISTS `coin_trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coin_trade` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `u_id` int(11) unsigned DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `legal_id` int(11) DEFAULT NULL,
  `type` tinyint(4) unsigned DEFAULT NULL COMMENT '1:buy 2:sell',
  `target_price` decimal(20,8) DEFAULT NULL COMMENT '目标价格',
  `trade_price` decimal(20,8) DEFAULT NULL COMMENT '交易当前价格',
  `trade_amount` decimal(20,8) DEFAULT NULL COMMENT '币数量',
  `charge_fee` decimal(10,6) DEFAULT NULL COMMENT '手续费',
  `status` tinyint(4) unsigned DEFAULT '1' COMMENT '状态 1 交易中 2 已完成',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='钱包兑换表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coin_trade`
--

LOCK TABLES `coin_trade` WRITE;
/*!40000 ALTER TABLE `coin_trade` DISABLE KEYS */;
INSERT INTO `coin_trade` VALUES (1,2,1,3,1,19332.78000000,19332.10000000,129.31404580,0.000200,2,'2022-10-25 21:06:11','2022-10-25 21:06:12'),(2,2,1,3,2,19332.78000000,19330.47000000,32.32204570,0.000200,2,'2022-10-25 21:06:22','2022-10-25 21:06:34'),(3,3,1,3,1,NULL,28011.79000000,10.00000000,0.000200,2,'2023-05-30 23:52:19','2023-05-31 01:14:36'),(4,3,1,3,1,27731.34000000,28011.79000000,1.00000000,0.000200,2,'2023-05-31 01:54:33','2023-05-31 15:17:13'),(5,5,1,3,1,29119.26000000,28011.79000000,1.00000000,0.000200,2,'2023-07-25 03:50:27','2023-07-25 03:52:55'),(6,5,1,3,2,29113.70000000,28011.79000000,0.99980000,0.000200,2,'2023-07-25 03:53:37','2023-07-25 12:16:19'),(7,3,14,3,1,2.57300000,2.56600000,1010.00000000,0.000200,2,'2023-08-01 00:33:33','2023-08-06 09:59:49');
/*!40000 ALTER TABLE `coin_trade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversion`
--

DROP TABLE IF EXISTS `conversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversion` (
  `id` int(11) unsigned NOT NULL,
  `form_currency_id` int(11) NOT NULL,
  `to_currency_id` int(11) NOT NULL,
  `num` decimal(20,4) NOT NULL,
  `fee` decimal(20,4) NOT NULL,
  `sj_num` decimal(20,4) NOT NULL,
  `create_time` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversion`
--

LOCK TABLES `conversion` WRITE;
/*!40000 ALTER TABLE `conversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '币ID，9999为银行卡',
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `get_address` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sort` int(11) NOT NULL DEFAULT '0',
  `logo` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `is_display` tinyint(4) NOT NULL DEFAULT '0',
  `min_number` decimal(23,8) NOT NULL DEFAULT '0.00000000' COMMENT '最小提币数量',
  `max_number` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '最大提币数量',
  `rate` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '费率',
  `is_lever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否杠杆币 0否 1是',
  `is_legal` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否法币 0否 1是',
  `is_match` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否撮合交易 0否 1是',
  `is_micro` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否微交易 0.否1是',
  `insurancable` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否可买保险',
  `show_legal` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否显示法币商家 0否 1是',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '基于哪个区块链',
  `black_limt` int(11) NOT NULL DEFAULT '0' COMMENT '币种黑名单限制数量',
  `key` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contract_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `total_account` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `collect_account` varchar(300) COLLATE utf8_unicode_ci DEFAULT '0' COMMENT '归拢地址',
  `currency_decimals` int(11) DEFAULT NULL,
  `rmb_relation` decimal(23,2) NOT NULL DEFAULT '0.00' COMMENT '折合人民币比例',
  `decimal_scale` int(11) NOT NULL DEFAULT '18' COMMENT '发布小数点',
  `chain_fee` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `price` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '价值(美元)',
  `micro_trade_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '微交易手续费%',
  `micro_min` decimal(20,0) DEFAULT '0' COMMENT '最小下单数量',
  `micro_max` decimal(20,0) DEFAULT '0' COMMENT '最大下单数量',
  `micro_holdtrade_max` int(11) NOT NULL DEFAULT '0' COMMENT '最大持仓笔数',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `name_2` (`name`,`is_display`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='币种表 ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES (1,'BTC','',12,'/xm/1613786496962262.png',1,0.00001000,10.00000000,0.0100,1,1,1,0,1,1,'btc',0,'0','{\"BTC\":\"3J714Z3h9PBDBDzPjBN5fkNn7xKxrubNr3\",\"ERC20\":\"testaaaaaaaaaaaa\",\"HEC0\":\"testnnnnnnnnnnnnnnn\"}','0','0',8,6.49,8,0.00005000,29194.00000000,1.00,100,1000,10,0),(2,'ETH','',3,'/xm/1613786513998262.png',1,0.01000000,100000.00000000,1.0000,1,1,1,0,1,1,'eth',0,'0','{\"ETH\":\"0x1A151eb8981dBe90f154Ee0128653501c747024A\",\"HEC0\":null}','0','0',18,6.49,18,0.00100000,1856.91000000,0.00,0,0,10,0),(3,'USDT','',0,'/xm/1633932293311453.png',1,100.00000000,1000000.00000000,1.0000,1,1,1,1,1,1,'usdt',0,'0','{\"ERC20\":\"0x1A151eb8981dBe90f154Ee0128653501c747024A\",\"OMNI\":\"3J714Z3h9PBDBDzPjBN5fkNn7xKxrubNr3\",\"TRC20\":\"TVjBae3qQD4q2yTeWvZ49EUBC2NWRsQHtq\"}','0','0',8,6.49,8,0.00005000,1.00000000,0.00,10,10000000,10,0),(5,'XRP','',0,'/xm/5f87391dce40926.png',1,0.00000000,0.00000000,0.0000,0,0,0,0,0,0,'xrp',0,'1','0','1','0',6,7.09,6,0.00000000,0.69552000,0.00,0,0,0,1543390528),(6,'LTC','',0,'/xm/5f87397132a8b02.png',1,1.00000000,100000.00000000,0.0100,0,0,1,0,0,0,'erc20',0,'0','0','1','0',18,7.09,18,0.00100000,92.14000000,0.00,0,0,10,1543390777),(8,'EOS','',0,'/xm/5f8738fd439bc57.png',1,0.00000001,0.00000000,1.0000,1,0,1,1,0,0,'erc20',0,'1','{\"EOS\":\"a65a5v1a655v6a6a65a5665\"}','1','0',18,6.37,18,0.00000000,0.74650000,0.00,0,0,0,1543390917),(10,'BCH','',0,'/xm/5fc.png',1,50.00000000,100.00000000,1.0000,0,0,1,0,0,0,'erc20',0,'0','0','1','0',18,7.09,18,0.00100000,248.54000000,1.00,0,0,0,1558431228),(11,'ETC','',0,'/xm/5f87382.png',1,0.00000000,0.00000000,0.0500,0,0,1,0,0,0,'erc20',0,'0','1CNYJKynh2VztXMEiaU88Wv58RuJw7Hhkn','1','0',18,7.09,18,0.00100000,18.60280000,0.00,1000,50000,1000,1558489545),(12,'DF','',0,'/xm/1587541168534941.png',1,0.00000000,0.00000000,0.0500,0,0,1,0,0,0,'btc',0,'0','0','1','0',18,7.09,18,0.00100000,0.20280000,0.00,1,50000,1000,1558489545),(14,'QTUM','',0,'/xm/1613786371999791.png',1,0.01000000,10.00000000,0.0005,0,0,1,0,0,0,'erc20',0,'0','','0','0',8,7.09,8,0.00005000,2.57190000,1.00,1,500000,500000,0),(15,'IOTA','',0,'/xm/1594057379245582.png',1,0.01000000,10.00000000,0.0005,0,0,1,0,0,0,'erc20',0,'0','','0','0',8,7.09,8,0.00005000,0.17310000,1.00,1,500000,500000,0),(16,'NEO','',0,'/xm/1613790589852490.png',1,50.00000000,100.00000000,1.0000,0,0,1,0,0,0,'erc20',0,'0','0','1','0',18,7.09,18,0.00100000,8.68000000,1.00,1,0,0,1558431228),(19,'NAS','',0,'/xm/1613791148984962.png',1,50.00000000,100.00000000,1.0000,0,0,0,0,0,0,'erc20',0,'0','0','1','0',18,7.09,18,0.00100000,0.18630000,1.00,1,0,0,1558431228),(21,'ELA','',0,'/xm/1613791952263794.png',1,50.00000000,100.00000000,1.0000,0,0,0,0,0,0,'erc20',0,'0','0','1','0',18,7.09,18,0.00100000,1.19410000,1.00,1,0,0,1558431228),(23,'SNT','',0,'/xm/1613791517116091.png',1,50.00000000,100.00000000,1.0000,1,1,1,1,0,0,'erc20',0,'0','0','1','0',18,6.37,18,0.00100000,0.02522200,1.00,10,10000,0,1558431228),(27,'WICC','',9,'/xm/1613789996866324.png',1,50.00000000,100.00000000,1.0000,0,0,0,0,0,0,'erc20',0,'0','0','1','0',18,6.59,18,0.00100000,0.00490000,1.00,1,0,0,1558431228),(29,'LINK','',10,'/xm/1594057337689924.png',1,10.00000000,100.00000000,0.0000,0,0,0,0,0,0,'btc',0,'','','','0',NULL,7.09,18,0.00000000,33.94260000,0.00,0,0,10,0),(30,'CBK','',1,'/xm/1597666452893325.png',1,20.00000000,100.00000000,1.0000,1,0,1,0,0,0,'erc20',0,'','','','0',NULL,7.09,18,0.00000000,0.50000000,0.00,10,100,0,0),(33,'kkt','',1,'',1,10.00000000,10000.00000000,2.0000,1,0,1,1,0,0,'erc20',0,'','','','0',NULL,6.37,18,0.00000000,5.00000000,0.00,1,100,1000,0),(34,'ACT','',0,'',1,0.00000000,0.00000000,0.0500,0,0,1,0,0,0,'erc20',0,'','0','','0',NULL,6.37,18,0.00100000,0.00633800,0.00,1000,50000,1000,0);
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_deposit`
--

DROP TABLE IF EXISTS `currency_deposit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_deposit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_id` int(11) NOT NULL,
  `day` smallint(6) DEFAULT NULL,
  `save_min` decimal(20,8) DEFAULT '0.00000000',
  `total_interest_rate` tinyint(4) DEFAULT NULL COMMENT '百分比',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='usdt理财表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_deposit`
--

LOCK TABLES `currency_deposit` WRITE;
/*!40000 ALTER TABLE `currency_deposit` DISABLE KEYS */;
INSERT INTO `currency_deposit` VALUES (11,3,90,100000.00000000,12,'2021-03-11 23:01:25'),(12,3,60,50000.00000000,9,'2021-03-11 23:01:44'),(13,3,30,30000.00000000,7,'2021-03-11 23:02:12'),(14,3,15,20000.00000000,5,'2021-03-11 23:02:38'),(15,3,7,5000.00000000,4,'2021-03-11 23:03:12');
/*!40000 ALTER TABLE `currency_deposit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_deposit_order`
--

DROP TABLE IF EXISTS `currency_deposit_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_deposit_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `amount` decimal(20,8) NOT NULL COMMENT '存款数量',
  `day_rate` decimal(10,4) NOT NULL COMMENT '日利率',
  `total_rate` decimal(10,4) DEFAULT NULL,
  `total_interest` decimal(20,8) DEFAULT '0.00000000' COMMENT '总利息',
  `last_settle_time` date DEFAULT NULL COMMENT '上次结息时间',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `end_at` date DEFAULT NULL COMMENT '结束日期',
  `start_at` date DEFAULT NULL COMMENT '开始时间',
  `status` tinyint(4) DEFAULT '1' COMMENT '1:进行中 2：已结束',
  `is_cancel` tinyint(1) DEFAULT NULL COMMENT '是否毁约',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_deposit_order`
--

LOCK TABLES `currency_deposit_order` WRITE;
/*!40000 ALTER TABLE `currency_deposit_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `currency_deposit_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_matches`
--

DROP TABLE IF EXISTS `currency_matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_matches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `legal_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '法币id',
  `currency_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '币种id',
  `is_display` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `market_from` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0.无,1.交易所,2.火币接口',
  `open_transaction` tinyint(4) NOT NULL DEFAULT '0' COMMENT '开启撮合交易',
  `open_lever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '开启杠杆交易',
  `open_microtrade` tinyint(4) NOT NULL DEFAULT '0' COMMENT '开启微交易',
  `open_coin_trade` tinyint(4) NOT NULL COMMENT '开启币币交易',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `micro_trade_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '微交易手续费(百分比)',
  `lever_share_num` decimal(20,8) NOT NULL DEFAULT '1.00000000' COMMENT '每手折合数量',
  `spread` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '点差',
  `overnight` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '隔夜费',
  `lever_trade_fee` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT '交易手续费(百分比)',
  `lever_min_share` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '杠杆交易最低手数',
  `lever_max_share` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '杠杆交易最高手数',
  `fluctuate_min` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '行情波动最小值',
  `fluctuate_max` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '行情波动最大值',
  `risk_group_result` tinyint(4) NOT NULL DEFAULT '0' COMMENT '群控结果',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT=' 币种关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_matches`
--

LOCK TABLES `currency_matches` WRITE;
/*!40000 ALTER TABLE `currency_matches` DISABLE KEYS */;
INSERT INTO `currency_matches` VALUES (2,3,1,1,2,1,1,1,1,0,0.00,1.00000000,0.0000,0.0000,0.0000,1,100000,0.01000000,0.09000000,0,1621870968),(3,3,2,1,2,1,1,1,1,0,0.00,0.20000000,0.5000,0.0000,0.0000,1,2500,15.00100000,45.00900000,0,1621870983),(5,3,5,1,2,1,1,1,0,0,0.00,100.00000000,0.1000,0.0000,0.0000,1,5000,0.03000000,0.09600000,0,1621870992),(6,3,6,1,2,1,1,1,1,0,0.00,2.00000000,0.3000,0.0000,0.0000,1,1000,0.00100000,0.00900000,0,1621871001),(8,3,8,1,2,1,1,1,0,0,0.00,10.00000000,0.1000,0.0000,0.0000,1,3000,0.61000000,0.99000000,0,1621871012),(9,3,9,0,0,0,0,0,0,0,0.00,1.00000000,0.0000,0.0000,0.0000,1,0,0.00000000,0.00000000,0,1555681832),(10,3,10,1,2,0,1,1,0,0,0.00,0.50000000,0.5000,0.0000,0.0000,1,1000,10.00100000,35.00900000,0,1621871030),(11,3,11,1,2,0,1,1,1,0,0.00,10.00000000,0.1000,0.0000,0.0000,1,1500,0.00100000,0.00900000,0,1621871049),(14,3,14,1,2,1,1,0,1,0,0.00,50.00000000,0.8300,0.0010,0.0960,1,1000000,0.07800000,0.09000000,0,1621513793),(16,3,15,1,2,0,1,0,1,0,0.00,1.00000000,0.2300,0.0010,0.0800,1,100,1.00000000,0.00000000,0,1594056372),(17,3,16,1,2,1,1,1,1,0,0.00,1.00000000,0.2300,0.0000,0.0000,1,100,1.00000000,0.00000000,0,1621513835),(19,3,19,1,2,1,1,1,1,0,0.00,1.00000000,0.0000,0.0000,0.0000,1,0,1.00000000,0.00000000,1,1621513847),(21,3,21,1,2,1,1,0,1,0,0.00,1.00000000,0.0000,0.0000,0.0000,1,0,1.00000000,0.00000000,0,1621513858),(23,3,23,1,2,1,1,0,1,0,0.00,1.00000000,0.0000,0.0000,0.0000,1,10,1.00000000,0.00000000,0,1621513873),(24,3,27,1,2,1,1,1,1,0,0.00,1.00000000,0.0000,0.0000,0.0000,1,0,1.00000000,0.00000000,0,1621513885),(25,23,3,1,2,1,1,1,0,0,0.00,1.00000000,0.0000,0.0000,0.0000,1,50,0.00100000,0.00500000,0,1654158070),(27,1,4,0,3,1,1,1,0,0,0.00,1.00000000,0.0000,0.0000,0.0000,1,0,1.00000000,1000.00000000,0,1685463685);
/*!40000 ALTER TABLE `currency_matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_quotation`
--

DROP TABLE IF EXISTS `currency_quotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_quotation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `match_id` int(11) NOT NULL DEFAULT '0' COMMENT '交易对id',
  `legal_id` int(11) NOT NULL DEFAULT '0',
  `currency_id` int(11) NOT NULL DEFAULT '0',
  `change` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '涨跌幅 带+ - 号',
  `volume` decimal(20,5) NOT NULL DEFAULT '0.00000' COMMENT '成交量',
  `now_price` decimal(20,5) NOT NULL DEFAULT '0.00000' COMMENT '当前价位',
  `add_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT COMMENT='币种价格表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_quotation`
--

LOCK TABLES `currency_quotation` WRITE;
/*!40000 ALTER TABLE `currency_quotation` DISABLE KEYS */;
INSERT INTO `currency_quotation` VALUES (1,2,3,1,'+0.000',1.97067,29216.51000,1690823100),(2,3,3,2,'+0.000',0.30540,1859.68000,1690823101),(3,5,3,5,'-0.05',558069.17310,0.69613,1690820281),(4,6,3,6,'+0.000',7.01570,92.02000,1690823100),(5,8,3,8,'+0.000',61.70000,0.74780,1690823100),(6,9,3,9,'+1.28',312020.86152,54.46170,1636649752),(7,10,3,10,'+0.000',2.90770,248.37000,1690823101),(8,11,3,11,'-0.09',2885.14150,18.57530,1690820281),(9,12,3,12,'+2.12',2291397.09044,1.27390,1636649752),(10,13,3,13,'+7.80',123934.19019,48.91000,1636383401),(11,14,3,14,'+0.08',4290.77570,2.56600,1690821213),(12,15,1,2,'+0.15',7410.62940,0.02569,1594056590),(13,16,3,15,'0.00',0.00000,0.17280,1690820282),(14,17,3,16,'0.00',4847.36360,8.67000,1690820282),(15,18,3,17,'-0.59',158481.37356,0.16830,1636383405),(16,19,3,19,'-0.30',38655.77120,0.03290,1666717220),(17,20,3,20,'0.00',81265.50399,0.05230,1594058397),(18,21,3,21,'-0.02',816.89000,1.19400,1690820282),(19,22,3,22,'+0.22',61323.08943,25.31610,1636649752),(20,23,3,23,'-0.02',48077.00380,0.02523,1690820282),(21,24,3,27,'0.00',0.00000,0.00490,1690820282),(22,25,3,28,'+0.30',106810969.46131,0.10462,1636649752),(23,0,3,4,'+0.000',7.46365,1859.89000,1685551800),(24,0,3,18,'+5.72',1201104.59274,33.99190,1636383335),(25,0,3,24,'-1.09',106011.49199,52.39180,1636649752),(26,0,3,25,'+0.55',158049.48475,12.02810,1636649752),(27,0,3,26,'+0.46',38447394048656.74000,0.00000,1636649752),(28,0,3,29,'-0.34',105433.21318,17.18560,1636649752),(29,25,23,3,'',0.00000,0.00000,1654156879),(30,26,1,3,'',0.00000,0.00000,1685338935),(31,27,1,4,'',0.00000,0.00000,1685463601);
/*!40000 ALTER TABLE `currency_quotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ems`
--

DROP TABLE IF EXISTS `ems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '事件',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'IP',
  `createtime` bigint(16) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='邮箱验证码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ems`
--

LOCK TABLES `ems` WRITE;
/*!40000 ALTER TABLE `ems` DISABLE KEYS */;
INSERT INTO `ems` VALUES (1,'register','lixiaobai8899@gmail.com','',0,'103.144.8.91',NULL),(2,'register','timibbs.net@gmail.com','',0,'182.246.82.80',NULL),(3,'register','timibbs.net@gmail.com','195630',0,'163.53.18.24',NULL),(4,'register','timibbs.net@gmail.com','879602',0,'163.53.18.24',NULL),(5,'register','lixiaobai8899@gmail.com','509863',0,'103.144.8.91',NULL),(6,'register','annalie195@gmail.com','759162',0,'167.179.57.124',NULL),(7,'register','chenlingling19950518@gmail.com','351894',0,'167.179.57.124',NULL),(8,'register','xiaofei2001225@gmail.com','204638',0,'167.179.57.124',NULL);
/*!40000 ALTER TABLE `ems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exception_log`
--

DROP TABLE IF EXISTS `exception_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exception_log` (
  `id` int(11) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `message` longtext,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exception_log`
--

LOCK TABLES `exception_log` WRITE;
/*!40000 ALTER TABLE `exception_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `exception_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL,
  `connection` text COLLATE utf8_unicode_ci NOT NULL,
  `queue` text COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `false_data`
--

DROP TABLE IF EXISTS `false_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `false_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `price` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'log',
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `false_data`
--

LOCK TABLES `false_data` WRITE;
/*!40000 ALTER TABLE `false_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `false_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `reply_time` int(11) NOT NULL DEFAULT '0',
  `reply_content` text COLLATE utf8_unicode_ci NOT NULL,
  `is_reply` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flash_against`
--

DROP TABLE IF EXISTS `flash_against`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flash_against` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `left_currency_id` int(11) NOT NULL,
  `right_currency_id` int(11) NOT NULL,
  `num` decimal(25,8) NOT NULL,
  `fee` decimal(25,8) DEFAULT NULL,
  `absolute_quantity` decimal(25,8) NOT NULL,
  `market_price` decimal(25,8) NOT NULL DEFAULT '0.00000000' COMMENT '当时的行情价格',
  `price` decimal(25,8) NOT NULL DEFAULT '0.00000000' COMMENT '用户输入的兑换价格价格',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态 0 审核中 ：1成功 ：2 失败',
  `review_time` int(11) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flash_against`
--

LOCK TABLES `flash_against` WRITE;
/*!40000 ALTER TABLE `flash_against` DISABLE KEYS */;
/*!40000 ALTER TABLE `flash_against` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gd_order`
--

DROP TABLE IF EXISTS `gd_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gd_order` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `gd_user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `value` int(11) NOT NULL,
  `day_max_value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gd_order`
--

LOCK TABLES `gd_order` WRITE;
/*!40000 ALTER TABLE `gd_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `gd_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gd_user`
--

DROP TABLE IF EXISTS `gd_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gd_user` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `total_profit_rate` decimal(10,2) NOT NULL,
  `three_week_profit` decimal(10,2) NOT NULL,
  `total_day` mediumint(9) NOT NULL,
  `trade_count` mediumint(9) NOT NULL,
  `total_follower` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gd_user`
--

LOCK TABLES `gd_user` WRITE;
/*!40000 ALTER TABLE `gd_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `gd_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historical_data`
--

DROP TABLE IF EXISTS `historical_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `historical_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `data` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historical_data`
--

LOCK TABLES `historical_data` WRITE;
/*!40000 ALTER TABLE `historical_data` DISABLE KEYS */;
INSERT INTO `historical_data` VALUES (1,'day',1585324800,1585411200,'{\"timestamp\":1585324800,\"open\":0,\"hight\":0,\"low\":0,\"close\":0,\"volume\":0}'),(2,'day',1585411200,1585497600,'{\"timestamp\":1585411200,\"open\":0,\"hight\":0,\"low\":0,\"close\":0,\"volume\":0}'),(3,'week',1584892800,1585555506,'{\"timestamp\":1584892800,\"open\":0,\"hight\":0,\"low\":0,\"close\":0,\"volume\":0}'),(4,'day',1585411200,1585497600,'{\"timestamp\":1585411200,\"open\":0,\"hight\":0,\"low\":0,\"close\":0,\"volume\":0}'),(5,'week',1584892800,1585563708,'{\"timestamp\":1584892800,\"open\":0,\"hight\":0,\"low\":0,\"close\":0,\"volume\":0}'),(6,'day',1620597600,1620684000,'{\"timestamp\":1620597600,\"open\":0,\"hight\":0,\"low\":0,\"close\":0,\"volume\":0}'),(7,'day',1620597600,1620684000,'{\"timestamp\":1620597600,\"open\":0,\"hight\":0,\"low\":0,\"close\":0,\"volume\":0}'),(8,'day',1620597600,1620684000,'{\"timestamp\":1620597600,\"open\":0,\"hight\":0,\"low\":0,\"close\":0,\"volume\":0}'),(9,'day',1620597600,1620684000,'{\"timestamp\":1620597600,\"open\":0,\"hight\":0,\"low\":0,\"close\":0,\"volume\":0}'),(10,'day',1620684000,1620770400,'{\"timestamp\":1620684000,\"open\":0,\"hight\":0,\"low\":0,\"close\":0,\"volume\":0}');
/*!40000 ALTER TABLE `historical_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huobi_symbols`
--

DROP TABLE IF EXISTS `huobi_symbols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `huobi_symbols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `base-currency` varchar(50) NOT NULL DEFAULT '',
  `quote-currency` varchar(50) NOT NULL DEFAULT '',
  `price-precision` int(11) NOT NULL DEFAULT '0',
  `amount-precision` int(11) NOT NULL DEFAULT '0',
  `symbol-partition` varchar(50) NOT NULL DEFAULT '',
  `symbol` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=411 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='火币币代码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huobi_symbols`
--

LOCK TABLES `huobi_symbols` WRITE;
/*!40000 ALTER TABLE `huobi_symbols` DISABLE KEYS */;
INSERT INTO `huobi_symbols` VALUES (1,'btc','usdt',2,4,'main','btcusdt'),(2,'bch','usdt',2,4,'main','bchusdt'),(3,'eth','usdt',2,4,'main','ethusdt'),(4,'etc','usdt',4,4,'main','etcusdt'),(5,'SHH\r\n','usdt',2,4,'main','ltcusdt'),(6,'eos','usdt',4,4,'main','eosusdt'),(7,'xrp','usdt',4,2,'main','xrpusdt'),(8,'omg','usdt',4,4,'main','omgusdt'),(9,'dash','usdt',2,4,'main','dashusdt'),(10,'zec','usdt',2,4,'main','zecusdt'),(11,'ada','usdt',6,4,'main','adausdt'),(12,'steem','usdt',4,4,'innovation','steemusdt'),(13,'iota','usdt',4,4,'main','iotausdt'),(14,'ocn','usdt',8,4,'innovation','ocnusdt'),(15,'soc','usdt',4,2,'innovation','socusdt'),(16,'ctxc','usdt',4,4,'innovation','ctxcusdt'),(17,'act','usdt',4,2,'innovation','actusdt'),(18,'btm','usdt',4,2,'innovation','btmusdt'),(19,'bts','usdt',4,2,'innovation','btsusdt'),(20,'ont','usdt',4,4,'innovation','ontusdt'),(21,'iost','usdt',6,4,'innovation','iostusdt'),(22,'ht','usdt',4,2,'main','htusdt'),(23,'trx','usdt',6,2,'innovation','trxusdt'),(24,'dta','usdt',8,4,'innovation','dtausdt'),(25,'neo','usdt',2,4,'innovation','neousdt'),(26,'qtum','usdt',2,4,'innovation','qtumusdt'),(27,'smt','usdt',6,4,'innovation','smtusdt'),(28,'ela','usdt',4,2,'innovation','elausdt'),(29,'ven','usdt',4,4,'innovation','venusdt'),(30,'theta','usdt',4,4,'innovation','thetausdt'),(31,'snt','usdt',6,4,'innovation','sntusdt'),(32,'zil','usdt',6,4,'innovation','zilusdt'),(33,'xem','usdt',4,4,'innovation','xemusdt'),(34,'nas','usdt',4,4,'innovation','nasusdt'),(35,'ruff','usdt',6,4,'innovation','ruffusdt'),(36,'hc','usdt',4,4,'innovation','hcusdt'),(37,'let','usdt',6,4,'innovation','letusdt'),(38,'mds','usdt',6,2,'innovation','mdsusdt'),(39,'storj','usdt',4,4,'innovation','storjusdt'),(40,'elf','usdt',4,4,'innovation','elfusdt'),(41,'itc','usdt',4,4,'innovation','itcusdt'),(42,'cvc','usdt',4,2,'innovation','cvcusdt'),(43,'gnt','usdt',4,4,'innovation','gntusdt'),(44,'xmr','btc',6,4,'main','xmrbtc'),(45,'bch','btc',6,4,'main','bchbtc'),(46,'eth','btc',6,4,'main','ethbtc'),(47,'ltc','btc',6,4,'main','ltcbtc'),(48,'etc','btc',6,4,'main','etcbtc'),(49,'eos','btc',8,2,'main','eosbtc'),(50,'omg','btc',6,4,'main','omgbtc'),(51,'xrp','btc',8,0,'main','xrpbtc'),(52,'dash','btc',6,4,'main','dashbtc'),(53,'zec','btc',6,4,'main','zecbtc'),(54,'ada','btc',8,2,'main','adabtc'),(55,'steem','btc',8,2,'innovation','steembtc'),(56,'iota','btc',8,2,'main','iotabtc'),(57,'poly','btc',8,2,'innovation','polybtc'),(58,'kan','btc',10,2,'innovation','kanbtc'),(59,'lba','btc',8,2,'innovation','lbabtc'),(60,'wan','btc',8,2,'innovation','wanbtc'),(61,'bft','btc',8,2,'innovation','bftbtc'),(62,'btm','btc',8,2,'innovation','btmbtc'),(63,'ont','btc',8,4,'innovation','ontbtc'),(64,'iost','btc',10,2,'innovation','iostbtc'),(65,'ht','btc',8,2,'main','htbtc'),(66,'trx','btc',10,2,'innovation','trxbtc'),(67,'smt','btc',8,0,'innovation','smtbtc'),(68,'ela','btc',8,2,'innovation','elabtc'),(69,'wicc','btc',8,2,'innovation','wiccbtc'),(70,'ocn','btc',10,2,'innovation','ocnbtc'),(71,'zla','btc',8,2,'innovation','zlabtc'),(72,'abt','btc',8,2,'innovation','abtbtc'),(73,'mtx','btc',8,2,'innovation','mtxbtc'),(74,'nas','btc',8,4,'innovation','nasbtc'),(75,'ven','btc',8,2,'innovation','venbtc'),(76,'dta','btc',10,2,'innovation','dtabtc'),(77,'neo','btc',6,4,'innovation','neobtc'),(78,'wax','btc',8,4,'innovation','waxbtc'),(79,'bts','btc',8,2,'innovation','btsbtc'),(80,'zil','btc',10,2,'innovation','zilbtc'),(81,'theta','btc',8,2,'innovation','thetabtc'),(82,'ctxc','btc',8,2,'innovation','ctxcbtc'),(83,'srn','btc',8,2,'innovation','srnbtc'),(84,'xem','btc',8,2,'innovation','xembtc'),(85,'icx','btc',8,4,'innovation','icxbtc'),(86,'dgd','btc',6,4,'innovation','dgdbtc'),(87,'chat','btc',8,2,'innovation','chatbtc'),(88,'wpr','btc',8,2,'innovation','wprbtc'),(89,'lun','btc',6,4,'innovation','lunbtc'),(90,'swftc','btc',10,2,'innovation','swftcbtc'),(91,'snt','btc',8,0,'innovation','sntbtc'),(92,'meet','btc',10,2,'innovation','meetbtc'),(93,'yee','btc',10,2,'innovation','yeebtc'),(94,'elf','btc',8,0,'innovation','elfbtc'),(95,'let','btc',10,2,'innovation','letbtc'),(96,'qtum','btc',6,4,'innovation','qtumbtc'),(97,'lsk','btc',6,4,'innovation','lskbtc'),(98,'itc','btc',8,0,'innovation','itcbtc'),(99,'soc','btc',10,2,'innovation','socbtc'),(100,'qash','btc',8,4,'innovation','qashbtc'),(101,'mds','btc',8,0,'innovation','mdsbtc'),(102,'eko','btc',10,2,'innovation','ekobtc'),(103,'topc','btc',10,2,'innovation','topcbtc'),(104,'mtn','btc',8,2,'innovation','mtnbtc'),(105,'act','btc',8,2,'innovation','actbtc'),(106,'hc','btc',8,4,'innovation','hcbtc'),(107,'stk','btc',8,2,'innovation','stkbtc'),(108,'storj','btc',8,2,'innovation','storjbtc'),(109,'gnx','btc',8,0,'innovation','gnxbtc'),(110,'dbc','btc',10,2,'innovation','dbcbtc'),(111,'snc','btc',8,2,'innovation','sncbtc'),(112,'cmt','btc',8,2,'innovation','cmtbtc'),(113,'tnb','btc',10,0,'innovation','tnbbtc'),(114,'ruff','btc',10,2,'innovation','ruffbtc'),(115,'qun','btc',10,2,'innovation','qunbtc'),(116,'zrx','btc',8,2,'innovation','zrxbtc'),(117,'knc','btc',8,0,'innovation','kncbtc'),(118,'blz','btc',8,2,'innovation','blzbtc'),(119,'propy','btc',8,2,'innovation','propybtc'),(120,'phx','btc',8,2,'innovation','phxbtc'),(121,'appc','btc',8,2,'innovation','appcbtc'),(122,'aidoc','btc',10,2,'innovation','aidocbtc'),(123,'powr','btc',8,0,'innovation','powrbtc'),(124,'cvc','btc',8,0,'innovation','cvcbtc'),(125,'pay','btc',8,2,'innovation','paybtc'),(126,'qsp','btc',8,0,'innovation','qspbtc'),(127,'dat','btc',10,2,'innovation','datbtc'),(128,'rdn','btc',8,0,'innovation','rdnbtc'),(129,'mco','btc',6,4,'innovation','mcobtc'),(130,'rcn','btc',10,0,'innovation','rcnbtc'),(131,'mana','btc',8,0,'innovation','manabtc'),(132,'utk','btc',8,2,'innovation','utkbtc'),(133,'tnt','btc',10,0,'innovation','tntbtc'),(134,'gas','btc',6,4,'innovation','gasbtc'),(135,'bat','btc',8,0,'innovation','batbtc'),(136,'ost','btc',8,2,'innovation','ostbtc'),(137,'link','btc',8,4,'innovation','linkbtc'),(138,'gnt','btc',8,2,'innovation','gntbtc'),(139,'mtl','btc',8,4,'innovation','mtlbtc'),(140,'evx','btc',8,2,'innovation','evxbtc'),(141,'req','btc',8,1,'innovation','reqbtc'),(142,'adx','btc',8,2,'innovation','adxbtc'),(143,'ast','btc',8,0,'innovation','astbtc'),(144,'eng','btc',8,2,'innovation','engbtc'),(145,'salt','btc',8,4,'innovation','saltbtc'),(146,'edu','btc',10,2,'innovation','edubtc'),(147,'xvg','btc',10,2,'innovation','xvgbtc'),(148,'wtc','btc',8,2,'innovation','wtcbtc'),(149,'bifi','btc',8,4,'bifurcation','bifibtc'),(150,'bcx','btc',8,4,'bifurcation','bcxbtc'),(151,'bcd','btc',6,4,'bifurcation','bcdbtc'),(152,'sbtc','btc',6,4,'bifurcation','sbtcbtc'),(153,'btg','btc',6,4,'bifurcation','btgbtc'),(154,'xmr','eth',6,4,'main','xmreth'),(155,'eos','eth',8,2,'main','eoseth'),(156,'omg','eth',6,4,'main','omgeth'),(157,'iota','eth',6,4,'main','iotaeth'),(158,'ada','eth',6,4,'main','adaeth'),(159,'steem','eth',6,4,'innovation','steemeth'),(160,'poly','eth',6,4,'innovation','polyeth'),(161,'kan','eth',8,2,'innovation','kaneth'),(162,'lba','eth',6,4,'innovation','lbaeth'),(163,'wan','eth',6,4,'innovation','waneth'),(164,'bft','eth',8,4,'innovation','bfteth'),(165,'zrx','eth',8,2,'innovation','zrxeth'),(166,'ast','eth',8,2,'innovation','asteth'),(167,'knc','eth',8,2,'innovation','knceth'),(168,'ont','eth',8,4,'innovation','onteth'),(169,'ht','eth',8,2,'main','hteth'),(170,'btm','eth',8,2,'innovation','btmeth'),(171,'iost','eth',8,2,'innovation','iosteth'),(172,'smt','eth',8,0,'innovation','smteth'),(173,'ela','eth',8,2,'innovation','elaeth'),(174,'trx','eth',8,2,'innovation','trxeth'),(175,'abt','eth',8,2,'innovation','abteth'),(176,'nas','eth',6,4,'innovation','naseth'),(177,'ocn','eth',8,2,'innovation','ocneth'),(178,'wicc','eth',8,2,'innovation','wicceth'),(179,'zil','eth',8,2,'innovation','zileth'),(180,'ctxc','eth',8,2,'innovation','ctxceth'),(181,'zla','eth',8,2,'innovation','zlaeth'),(182,'wpr','eth',8,2,'innovation','wpreth'),(183,'dta','eth',8,2,'innovation','dtaeth'),(184,'mtx','eth',8,2,'innovation','mtxeth'),(185,'theta','eth',8,2,'innovation','thetaeth'),(186,'srn','eth',8,2,'innovation','srneth'),(187,'ven','eth',8,2,'innovation','veneth'),(188,'bts','eth',8,2,'innovation','btseth'),(189,'wax','eth',6,4,'innovation','waxeth'),(190,'hc','eth',6,4,'innovation','hceth'),(191,'icx','eth',6,4,'innovation','icxeth'),(192,'mtn','eth',8,2,'innovation','mtneth'),(193,'act','eth',8,2,'innovation','acteth'),(194,'blz','eth',8,2,'innovation','blzeth'),(195,'qash','eth',6,4,'innovation','qasheth'),(196,'ruff','eth',8,2,'innovation','ruffeth'),(197,'cmt','eth',8,2,'innovation','cmteth'),(198,'elf','eth',8,0,'innovation','elfeth'),(199,'meet','eth',8,2,'innovation','meeteth'),(200,'soc','eth',8,2,'innovation','soceth'),(201,'qtum','eth',6,4,'innovation','qtumeth'),(202,'itc','eth',8,0,'innovation','itceth'),(203,'swftc','eth',8,2,'innovation','swftceth'),(204,'yee','eth',8,2,'innovation','yeeeth'),(205,'lsk','eth',6,4,'innovation','lsketh'),(206,'lun','eth',6,4,'innovation','luneth'),(207,'let','eth',8,2,'innovation','leteth'),(208,'gnx','eth',8,0,'innovation','gnxeth'),(209,'chat','eth',8,2,'innovation','chateth'),(210,'eko','eth',8,2,'innovation','ekoeth'),(211,'topc','eth',8,2,'innovation','topceth'),(212,'dgd','eth',6,4,'innovation','dgdeth'),(213,'stk','eth',8,2,'innovation','stketh'),(214,'mds','eth',8,0,'innovation','mdseth'),(215,'dbc','eth',8,2,'innovation','dbceth'),(216,'snc','eth',8,2,'innovation','snceth'),(217,'pay','eth',8,2,'innovation','payeth'),(218,'qun','eth',8,2,'innovation','quneth'),(219,'aidoc','eth',8,2,'innovation','aidoceth'),(220,'tnb','eth',8,0,'innovation','tnbeth'),(221,'appc','eth',6,4,'innovation','appceth'),(222,'rdn','eth',8,0,'innovation','rdneth'),(223,'utk','eth',8,2,'innovation','utketh'),(224,'powr','eth',8,0,'innovation','powreth'),(225,'bat','eth',8,0,'innovation','bateth'),(226,'propy','eth',8,2,'innovation','propyeth'),(227,'mana','eth',8,0,'innovation','manaeth'),(228,'req','eth',8,1,'innovation','reqeth'),(229,'cvc','eth',8,0,'innovation','cvceth'),(230,'qsp','eth',8,0,'innovation','qspeth'),(231,'evx','eth',8,2,'innovation','evxeth'),(232,'dat','eth',8,2,'innovation','dateth'),(233,'mco','eth',6,4,'innovation','mcoeth'),(234,'gnt','eth',8,2,'innovation','gnteth'),(235,'gas','eth',6,4,'innovation','gaseth'),(236,'ost','eth',8,2,'innovation','osteth'),(237,'link','eth',8,2,'innovation','linketh'),(238,'rcn','eth',8,0,'innovation','rcneth'),(239,'tnt','eth',8,0,'innovation','tnteth'),(240,'eng','eth',6,4,'innovation','engeth'),(241,'salt','eth',6,4,'innovation','salteth'),(242,'adx','eth',8,2,'innovation','adxeth'),(243,'edu','eth',10,2,'innovation','edueth'),(244,'xvg','eth',8,2,'innovation','xvgeth'),(245,'wtc','eth',6,4,'innovation','wtceth'),(246,'xrp','ht',6,4,'main','xrpht'),(247,'iost','ht',8,4,'innovation','iostht'),(248,'dash','ht',6,4,'main','dashht'),(249,'wicc','usdt',4,4,'innovation','wiccusdt'),(250,'eos','ht',6,4,'main','eosht'),(251,'bch','ht',6,4,'main','bchht'),(252,'ltc','ht',6,4,'main','ltcht'),(253,'etc','ht',6,4,'main','etcht'),(254,'waves','btc',6,4,'innovation','wavesbtc'),(255,'waves','eth',6,4,'innovation','waveseth'),(256,'hb10','usdt',4,4,'main','hb10usdt'),(257,'cmt','usdt',4,4,'innovation','cmtusdt'),(258,'dcr','btc',6,4,'innovation','dcrbtc'),(259,'dcr','eth',6,4,'innovation','dcreth'),(260,'pai','btc',8,2,'innovation','paibtc'),(261,'pai','eth',6,4,'innovation','paieth'),(262,'box','btc',10,2,'innovation','boxbtc'),(263,'box','eth',8,2,'innovation','boxeth'),(264,'dgb','btc',10,2,'innovation','dgbbtc'),(265,'dgb','eth',8,2,'innovation','dgbeth'),(266,'gxc','btc',8,2,'innovation','gxsbtc'),(267,'gxc','eth',6,4,'innovation','gxseth'),(268,'xlm','btc',8,2,'innovation','xlmbtc'),(269,'xlm','eth',6,4,'innovation','xlmeth'),(270,'bix','btc',8,2,'innovation','bixbtc'),(271,'bix','eth',6,4,'innovation','bixeth'),(272,'bix','usdt',6,4,'innovation','bixusdt'),(273,'hit','btc',10,2,'innovation','hitbtc'),(274,'hit','eth',8,2,'innovation','hiteth'),(275,'pai','usdt',6,4,'innovation','paiusdt'),(276,'bt1','btc',6,4,'bifurcation','bt1btc'),(277,'bt2','btc',6,4,'bifurcation','bt2btc'),(278,'xzc','btc',6,4,'innovation','xzcbtc'),(279,'xzc','eth',6,4,'innovation','xzceth'),(280,'vet','usdt',6,4,'innovation','vetusdt'),(281,'vet','eth',8,2,'innovation','veteth'),(282,'vet','btc',10,2,'innovation','vetbtc'),(283,'ncash','eth',8,2,'innovation','ncasheth'),(284,'ncash','btc',10,2,'innovation','ncashbtc'),(285,'grs','btc',8,2,'innovation','grsbtc'),(286,'grs','eth',6,4,'innovation','grseth'),(287,'rccc','eth',6,4,'innovation','rccceth'),(288,'egcc','eth',10,2,'innovation','egcceth'),(289,'iic','eth',10,2,'innovation','iiceth'),(290,'she','eth',10,2,'innovation','sheeth'),(291,'rccc','btc',8,2,'innovation','rcccbtc'),(292,'mex','eth',10,2,'innovation','mexeth'),(293,'ekt','eth',6,4,'innovation','ekteth'),(294,'bkbt','eth',8,2,'innovation','bkbteth'),(295,'gtc','eth',8,2,'innovation','gtceth'),(296,'hot','eth',8,2,'innovation','hoteth'),(297,'fti','eth',8,2,'innovation','ftieth'),(298,'gsc','eth',8,2,'innovation','gsceth'),(299,'pc','eth',8,4,'innovation','pceth'),(300,'xmx','eth',8,2,'innovation','xmxeth'),(301,'lym','eth',8,2,'innovation','lymeth'),(302,'cnn','eth',10,2,'innovation','cnneth'),(303,'man','eth',6,4,'innovation','maneth'),(304,'uc','eth',10,2,'innovation','uceth'),(305,'aac','eth',8,2,'innovation','aaceth'),(306,'fair','eth',8,2,'innovation','faireth'),(307,'seele','eth',8,2,'innovation','seeleeth'),(308,'uip','eth',8,2,'innovation','uipeth'),(309,'lxt','eth',8,2,'innovation','lxteth'),(310,'datx','eth',8,2,'innovation','datxeth'),(311,'get','eth',8,2,'innovation','geteth'),(312,'ae','eth',6,4,'innovation','aeeth'),(313,'uuu','eth',10,2,'innovation','uuueth'),(314,'ycc','eth',8,2,'innovation','ycceth'),(315,'cdc','eth',8,2,'innovation','cdceth'),(316,'but','eth',8,2,'innovation','buteth'),(317,'portal','eth',8,2,'innovation','portaleth'),(318,'ssp','eth',8,2,'innovation','sspeth'),(319,'ren','eth',6,4,'innovation','reneth'),(320,'mt','eth',8,2,'innovation','mteth'),(321,'rte','btc',10,2,'innovation','rtebtc'),(322,'fti','btc',10,2,'innovation','ftibtc'),(323,'ekt','btc',8,2,'innovation','ektbtc'),(324,'ren','btc',8,2,'innovation','renbtc'),(325,'zjlt','eth',8,2,'innovation','zjlteth'),(326,'tos','btc',10,2,'innovation','tosbtc'),(327,'get','btc',10,2,'innovation','getbtc'),(328,'ssp','btc',10,2,'innovation','sspbtc'),(329,'musk','btc',10,2,'innovation','muskbtc'),(330,'cnn','btc',10,2,'innovation','cnnbtc'),(331,'tos','eth',8,2,'innovation','toseth'),(332,'gve','eth',8,2,'innovation','gveeth'),(333,'ae','btc',8,2,'innovation','aebtc'),(334,'ncc','btc',10,2,'innovation','nccbtc'),(335,'kcash','eth',8,2,'innovation','kcasheth'),(336,'ycc','btc',10,2,'innovation','yccbtc'),(337,'18c','eth',8,2,'innovation','18ceth'),(338,'pnt','eth',8,2,'innovation','pnteth'),(339,'cvcoin','eth',6,4,'innovation','cvcoineth'),(340,'ncc','eth',8,2,'innovation','ncceth'),(341,'bcv','btc',10,2,'innovation','bcvbtc'),(342,'uip','btc',10,2,'innovation','uipbtc'),(343,'pnt','btc',10,2,'innovation','pntbtc'),(344,'dac','eth',8,2,'innovation','daceth'),(345,'trio','eth',10,2,'innovation','trioeth'),(346,'seele','btc',10,2,'innovation','seelebtc'),(347,'hot','btc',10,2,'innovation','hotbtc'),(348,'bcv','eth',8,2,'innovation','bcveth'),(349,'musk','eth',8,2,'innovation','musketh'),(350,'gtc','btc',10,2,'innovation','gtcbtc'),(351,'bkbt','btc',10,2,'innovation','bkbtbtc'),(352,'man','btc',8,2,'innovation','manbtc'),(353,'aac','btc',8,2,'innovation','aacbtc'),(354,'uc','btc',10,2,'innovation','ucbtc'),(355,'she','btc',10,2,'innovation','shebtc'),(356,'but','btc',10,2,'innovation','butbtc'),(357,'idt','eth',8,2,'innovation','idteth'),(358,'mex','btc',10,2,'innovation','mexbtc'),(359,'idt','btc',10,2,'innovation','idtbtc'),(360,'datx','btc',10,2,'innovation','datxbtc'),(361,'zjlt','btc',10,2,'innovation','zjltbtc'),(362,'fair','btc',10,2,'innovation','fairbtc'),(363,'iic','btc',10,2,'innovation','iicbtc'),(364,'rte','eth',8,2,'innovation','rteeth'),(365,'cdc','btc',10,2,'innovation','cdcbtc'),(366,'pc','btc',10,2,'innovation','pcbtc'),(367,'dac','btc',10,2,'innovation','dacbtc'),(368,'egcc','btc',10,2,'innovation','egccbtc'),(369,'xmx','btc',10,2,'innovation','xmxbtc'),(370,'gsc','btc',10,2,'innovation','gscbtc'),(371,'lxt','btc',10,2,'innovation','lxtbtc'),(372,'portal','btc',10,2,'innovation','portalbtc'),(373,'lym','btc',10,2,'innovation','lymbtc'),(374,'uuu','btc',10,2,'innovation','uuubtc'),(375,'trio','btc',8,2,'innovation','triobtc'),(376,'kcash','btc',10,2,'innovation','kcashbtc'),(377,'mt','ht',6,4,'innovation','mtht'),(378,'mt','btc',10,2,'innovation','mtbtc'),(379,'kcash','ht',6,4,'innovation','kcashht'),(380,'18c','btc',10,2,'innovation','18cbtc'),(381,'gve','btc',10,2,'innovation','gvebtc'),(382,'cvcoin','btc',8,2,'innovation','cvcoinbtc'),(383,'ardr','btc',8,2,'innovation','ardrbtc'),(384,'ardr','eth',6,4,'innovation','ardreth'),(385,'hpt','usdt',6,4,'innovation','hptusdt'),(386,'hpt','btc',10,2,'innovation','hptbtc'),(387,'hpt','ht',6,4,'innovation','hptht'),(388,'xlm','usdt',6,4,'innovation','xlmusdt'),(389,'nano','eth',6,4,'innovation','nanoeth'),(390,'nano','btc',6,2,'innovation','nanobtc'),(391,'usdt','husd',6,4,'main','usdthusd'),(392,'btc','husd',2,4,'main','btchusd'),(393,'zen','eth',6,4,'innovation','zeneth'),(394,'zen','btc',8,2,'innovation','zenbtc'),(395,'eos','husd',4,4,'main','eoshusd'),(396,'eth','husd',2,4,'main','ethhusd'),(397,'xmr','usdt',2,4,'main','xmrusdt'),(398,'hit','usdt',2,4,'innovation','hitusdt'),(399,'link','usdt',2,4,'innovation','linkusdt'),(400,'shib','usdt',2,4,'main','shibusdt'),(401,'uni','usdt',2,4,'main','uniusdt'),(402,'nft','usdt',2,4,'main','nftusdt'),(403,'doge','usdt',2,4,'main','dogeusdt'),(404,'fil','usdt',2,4,'main','filusdt'),(405,'dot','usdt',2,4,'main','dotusdt'),(406,'sushi','usdt',2,4,'main','sushiusdt'),(407,'dydx','usdt',2,4,'main','dydxusdt'),(408,'cbk','usdt',2,4,'main','cbkusdt'),(409,'ydk','usdt',2,4,'main','ydkusdt'),(410,'df','usdt',2,4,'main','dfusdt');
/*!40000 ALTER TABLE `huobi_symbols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ieo_record`
--

DROP TABLE IF EXISTS `ieo_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ieo_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` int(10) unsigned NOT NULL,
  `updated_at` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(25,8) NOT NULL,
  `scount` decimal(25,8) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ieo_record`
--

LOCK TABLES `ieo_record` WRITE;
/*!40000 ALTER TABLE `ieo_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `ieo_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_claim_applies`
--

DROP TABLE IF EXISTS `insurance_claim_applies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance_claim_applies` (
  `id` int(11) NOT NULL,
  `user_id` int(10) unsigned NOT NULL COMMENT '用户id',
  `user_insurance_id` int(10) unsigned NOT NULL COMMENT '用户保险单',
  `insurance_type` tinyint(1) unsigned NOT NULL COMMENT '保险类型',
  `apply_status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '赔付状态。0，申请中，1，已赔付。2，已拒绝',
  `compensate` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '赔付金额',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人,auto,自动。',
  `refuse_reason` varchar(200) NOT NULL COMMENT '拒绝理由'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_claim_applies`
--

LOCK TABLES `insurance_claim_applies` WRITE;
/*!40000 ALTER TABLE `insurance_claim_applies` DISABLE KEYS */;
/*!40000 ALTER TABLE `insurance_claim_applies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_rules`
--

DROP TABLE IF EXISTS `insurance_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance_rules` (
  `id` int(11) NOT NULL,
  `insurance_type_id` smallint(5) unsigned NOT NULL COMMENT '险种id',
  `amount` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '金额',
  `place_an_order_max` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '下单最大金额限制',
  `existing_number` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '可同时存在最大订单数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='不同金额保险的不同规则。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_rules`
--

LOCK TABLES `insurance_rules` WRITE;
/*!40000 ALTER TABLE `insurance_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `insurance_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_types`
--

DROP TABLE IF EXISTS `insurance_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance_types` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `currency_id` smallint(5) unsigned NOT NULL COMMENT '币种',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '保险类型1，正向。2，反向。',
  `min_amount` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最低购买额',
  `max_amount` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '最大购买额',
  `insurance_assets` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '保险资产占比%',
  `profit_termination_condition` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '盈利比例解约条件%',
  `defective_claims_condition` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '亏损比例理赔条件%（正向）',
  `defective_claims_condition2` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '亏损理赔条件2(反向)',
  `claims_times_daily` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '每日赔付次数',
  `auto_claim` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '自动赔付0，否。1，是',
  `claim_rate` float(10,2) unsigned NOT NULL DEFAULT '100.00' COMMENT '赔付比例',
  `claim_direction` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '赔付去向。1，受保资产。2，可用资产。',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态1，开启.0，关闭',
  `is_t_add_1` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否T加1，1，是。0，不是。'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='险种的类型。';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_types`
--

LOCK TABLES `insurance_types` WRITE;
/*!40000 ALTER TABLE `insurance_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `insurance_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ip_whiltlist`
--

DROP TABLE IF EXISTS `ip_whiltlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_whiltlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ipadder` varchar(255) DEFAULT NULL COMMENT 'ip地址',
  `type` tinyint(255) DEFAULT NULL COMMENT '类型0=IP，1=代理',
  `status` tinyint(255) DEFAULT NULL COMMENT '状态0=可用，1=禁用',
  `ctime` datetime DEFAULT CURRENT_TIMESTAMP,
  `utime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='ip白名单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ip_whiltlist`
--

LOCK TABLES `ip_whiltlist` WRITE;
/*!40000 ALTER TABLE `ip_whiltlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_whiltlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `queue` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `js_news`
--

DROP TABLE IF EXISTS `js_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `js_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `summary` varchar(100) DEFAULT NULL,
  `content` longtext,
  `published_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `js_news`
--

LOCK TABLES `js_news` WRITE;
/*!40000 ALTER TABLE `js_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `js_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lbx_hashes`
--

DROP TABLE IF EXISTS `lbx_hashes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lbx_hashes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wallet_id` int(11) NOT NULL COMMENT '钱包id',
  `txid` varchar(1024) NOT NULL COMMENT '链上交易hash',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '业务类型:0.归拢,1.提币 2.打入手续费',
  `amount` decimal(20,8) NOT NULL COMMENT '数量',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 未处理  1处理成功   2处理失败',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lbx_hashes`
--

LOCK TABLES `lbx_hashes` WRITE;
/*!40000 ALTER TABLE `lbx_hashes` DISABLE KEYS */;
/*!40000 ALTER TABLE `lbx_hashes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legal_deal`
--

DROP TABLE IF EXISTS `legal_deal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `legal_deal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `legal_deal_send_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `seller_id` int(11) NOT NULL DEFAULT '0',
  `number` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `is_sure` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0未确认 1已确认 2已取消 3已付款',
  `pay_orders_img` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '付款凭证',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legal_deal`
--

LOCK TABLES `legal_deal` WRITE;
/*!40000 ALTER TABLE `legal_deal` DISABLE KEYS */;
/*!40000 ALTER TABLE `legal_deal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legal_deal_send`
--

DROP TABLE IF EXISTS `legal_deal_send`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `legal_deal_send` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL DEFAULT '0',
  `currency_id` int(11) NOT NULL DEFAULT '0',
  `type` enum('buy','sell') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'sell',
  `way` enum('bank','we_chat','ali_pay') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'bank',
  `price` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `total_number` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `surplus_number` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `min_number` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `max_number` decimal(20,5) DEFAULT '0.00000',
  `is_done` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0  1已完成  2撤回',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `is_shelves` int(4) DEFAULT '1' COMMENT '1:上架   2下架',
  `is_sendback` int(11) DEFAULT '1' COMMENT '1:未撤回  2：撤回',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legal_deal_send`
--

LOCK TABLES `legal_deal_send` WRITE;
/*!40000 ALTER TABLE `legal_deal_send` DISABLE KEYS */;
/*!40000 ALTER TABLE `legal_deal_send` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legal_order`
--

DROP TABLE IF EXISTS `legal_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `legal_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '买家ID',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '-1超时关闭 0等待付款 1已经付款 2订单完成',
  `created_at` int(10) unsigned DEFAULT NULL COMMENT '购买时间',
  `updated_at` datetime(6) DEFAULT NULL COMMENT '更新时间',
  `amount` decimal(10,2) DEFAULT NULL,
  `usdt_amount` decimal(10,6) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `pay_way` varchar(20) DEFAULT NULL COMMENT 'wechat alipay bank',
  `pay_account` varchar(255) DEFAULT NULL COMMENT '付款到账号',
  `pay_time` datetime(6) DEFAULT NULL COMMENT '付款时间',
  `url` varchar(255) DEFAULT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'buy' COMMENT '订单类型',
  `store_id` int(10) DEFAULT NULL COMMENT '店铺ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `storeid` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legal_order`
--

LOCK TABLES `legal_order` WRITE;
/*!40000 ALTER TABLE `legal_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `legal_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `legal_store`
--

DROP TABLE IF EXISTS `legal_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `legal_store` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT '商家名称',
  `bank_name` varchar(128) NOT NULL COMMENT '商家银行名',
  `bank_account` varchar(128) NOT NULL COMMENT '银行账号',
  `bank_user` varchar(128) NOT NULL COMMENT '开户人',
  `bank_subname` varchar(128) NOT NULL COMMENT '开户行',
  `alipay_account` varchar(128) NOT NULL COMMENT '支付宝账户',
  `alipay_qrcode` varchar(256) NOT NULL COMMENT '支付宝二维码',
  `wechat_account` varchar(256) NOT NULL COMMENT '微信账号',
  `wechat_qrcode` varchar(256) NOT NULL COMMENT '微信二维码',
  `min_num` decimal(10,2) NOT NULL COMMENT '最小充值数量',
  `max_num` decimal(10,2) NOT NULL COMMENT '最大充值数量',
  `min_num_wid` decimal(10,2) DEFAULT NULL COMMENT '最小提现数量',
  `max_num_wid` decimal(10,2) DEFAULT NULL COMMENT '最小提现数量',
  `rate` decimal(10,2) DEFAULT NULL COMMENT '充值手续费',
  `rate_sell` decimal(10,2) DEFAULT NULL COMMENT '提现手续费',
  `updated_at` int(10) unsigned DEFAULT NULL,
  `created_at` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `legal_store`
--

LOCK TABLES `legal_store` WRITE;
/*!40000 ALTER TABLE `legal_store` DISABLE KEYS */;
INSERT INTO `legal_store` VALUES (1,'诚信商家','工商银行','62210098909921322','李八月','西城支行','ss','d','d','d',100.00,10000.00,100.00,10000.00,6.58,6.56,2021,2021);
/*!40000 ALTER TABLE `legal_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL DEFAULT '',
  `fill_currency` decimal(25,4) NOT NULL DEFAULT '0.0000' COMMENT '充币数量',
  `direct_drive_count` int(11) NOT NULL DEFAULT '0' COMMENT '直推数量',
  `direct_drive_price` decimal(25,4) NOT NULL DEFAULT '0.0000' COMMENT '直推金额',
  `max_algebra` int(20) NOT NULL DEFAULT '0' COMMENT '最大代数',
  `level` int(25) NOT NULL DEFAULT '0' COMMENT '级别'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lever_multiple`
--

DROP TABLE IF EXISTS `lever_multiple`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lever_multiple` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT '1' COMMENT '1倍数  2手数',
  `value` varchar(255) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='币种合约杠杆数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lever_multiple`
--

LOCK TABLES `lever_multiple` WRITE;
/*!40000 ALTER TABLE `lever_multiple` DISABLE KEYS */;
INSERT INTO `lever_multiple` VALUES (192,1,'100',1),(194,1,'5',2),(195,1,'10',2),(196,1,'20',2),(197,1,'50',2),(198,1,'100',2),(199,1,'150',2),(200,1,'5',3),(201,1,'10',3),(202,1,'20',3),(203,1,'50',3),(204,1,'100',3),(205,1,'150',3),(206,1,'5',4),(207,1,'10',4),(208,1,'20',4),(209,1,'50',4),(210,1,'100',4),(211,1,'150',4),(212,1,'5',5),(213,1,'10',5),(214,1,'20',5),(215,1,'50',5),(216,1,'100',5),(217,1,'150',5),(218,1,'5',6),(219,1,'10',6),(220,1,'20',6),(221,1,'50',6),(222,1,'100',6),(223,1,'150',6),(224,1,'5',7),(225,1,'10',7),(226,1,'20',7),(227,1,'50',7),(228,1,'100',7),(229,1,'150',7),(230,1,'5',8),(231,1,'10',8),(232,1,'20',8),(233,1,'50',8),(234,1,'100',8),(235,1,'150',8),(236,1,'5',9),(237,1,'10',9),(238,1,'20',9),(239,1,'50',9),(240,1,'100',9),(241,1,'150',9),(242,1,'5',10),(243,1,'10',10),(244,1,'20',10),(245,1,'50',10),(246,1,'100',10),(247,1,'150',10),(248,1,'5',11),(249,1,'10',11),(250,1,'20',11),(251,1,'50',11),(252,1,'100',11),(253,1,'150',11),(254,1,'5',13),(255,1,'10',13),(256,1,'20',13),(257,1,'50',13),(258,1,'100',13),(259,1,'150',13),(260,1,'5',14),(261,1,'10',14),(262,1,'20',14),(263,1,'50',14),(264,1,'100',14),(265,1,'150',14),(269,1,'50',1),(270,1,'20',1),(271,1,'5',15),(272,1,'10',15),(273,1,'20',15),(274,1,'50',15),(275,1,'100',15),(276,1,'150',15),(277,1,'5',16),(278,1,'10',16),(279,1,'20',16),(280,1,'50',16),(281,1,'100',16),(282,1,'150',16),(283,1,'5',17),(284,1,'10',17),(285,1,'20',17),(286,1,'50',17),(287,1,'100',17),(288,1,'150',17),(289,1,'5',18),(290,1,'10',18),(291,1,'20',18),(292,1,'50',18),(293,1,'100',18),(294,1,'150',18),(295,1,'5',19),(296,1,'10',19),(297,1,'20',19),(298,1,'50',19),(299,1,'100',19),(300,1,'150',19),(301,1,'5',20),(302,1,'10',20),(303,1,'20',20),(304,1,'50',20),(305,1,'100',20),(306,1,'150',20),(307,1,'5',21),(308,1,'10',21),(309,1,'20',21),(310,1,'50',21),(311,1,'100',21),(312,1,'150',21),(313,1,'5',22),(314,1,'10',22),(315,1,'20',22),(316,1,'50',22),(317,1,'100',22),(318,1,'150',22),(319,1,'5',23),(320,1,'10',23),(321,1,'20',23),(322,1,'50',23),(323,1,'100',23),(324,1,'150',23),(325,1,'5',24),(326,1,'10',24),(327,1,'20',24),(328,1,'50',24),(329,1,'100',24),(330,1,'150',24),(331,1,'5',25),(332,1,'10',25),(333,1,'20',25),(334,1,'50',25),(335,1,'100',25),(336,1,'150',25),(337,1,'5',26),(338,1,'10',26),(339,1,'20',26),(340,1,'50',26),(341,1,'100',26),(342,1,'150',26),(343,1,'5',27),(344,1,'10',27),(345,1,'20',27),(346,1,'50',27),(347,1,'100',27),(348,1,'150',27),(349,1,'5',28),(350,1,'10',28),(351,1,'20',28),(352,1,'50',28),(353,1,'100',28),(354,1,'150',28),(355,1,'5',29),(356,1,'10',29),(357,1,'20',29),(358,1,'50',29),(359,1,'100',29),(360,1,'150',29);
/*!40000 ALTER TABLE `lever_multiple` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lever_tolegal`
--

DROP TABLE IF EXISTS `lever_tolegal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lever_tolegal` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `number` decimal(11,5) DEFAULT NULL COMMENT '杠杆转c2c数量',
  `add_time` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT '1' COMMENT '1:c2c转杠杆  2杠杆转c2c',
  `status` int(11) DEFAULT '1' COMMENT '1:未审核   2：审核通过 3:审核不通过'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='杠杆账户转c2c账户后台审核';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lever_tolegal`
--

LOCK TABLES `lever_tolegal` WRITE;
/*!40000 ALTER TABLE `lever_tolegal` DISABLE KEYS */;
/*!40000 ALTER TABLE `lever_tolegal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lever_transaction`
--

DROP TABLE IF EXISTS `lever_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lever_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '买卖类型:1.买入,2.卖出',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `currency` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '交易id',
  `legal` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '法币id',
  `origin_price` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '原始价格',
  `price` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '开仓价格(点差处理之后)',
  `update_price` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '当前价格',
  `target_profit_price` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '止盈价格',
  `stop_loss_price` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '止亏价格',
  `share` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '手数',
  `number` decimal(20,5) unsigned NOT NULL DEFAULT '0.00000' COMMENT '手数换算数量(非放大的)',
  `multiple` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '倍数',
  `origin_caution_money` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '初始保证金',
  `caution_money` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '当前可用保证金',
  `fact_profits` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '最终盈亏',
  `trade_fee` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '交易手续费',
  `overnight` decimal(20,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '隔夜费率,百分比',
  `overnight_money` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '隔夜费金额',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '交易状态:0.挂单中,1.交易中,2.平仓中,3.已平仓,4.已撤单',
  `settled` tinyint(4) NOT NULL DEFAULT '0' COMMENT '结算状态:0.未结算,1.已结算',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '下单时间',
  `transaction_time` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '交易时间',
  `update_time` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '价格刷新时间(毫秒级)',
  `handle_time` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '平仓时间',
  `complete_time` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '完成时间',
  `agent_path` varchar(2048) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '代理商关系',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='合约交易记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lever_transaction`
--

LOCK TABLES `lever_transaction` WRITE;
/*!40000 ALTER TABLE `lever_transaction` DISABLE KEYS */;
INSERT INTO `lever_transaction` VALUES (1,1,3,2,3,1856.74000000,1857.24000000,1856.74000000,0.00000000,0.00000000,2,0.40000,5,148.57920000,148.57920000,-0.20000000,0.00000000,0.0000,0.00000000,3,0,1690820145,1690820145.00000000,1690820180.98151600,1690820180.98153300,1690820181.02034600,'1'),(2,1,3,1,3,29230.00000000,29230.00000000,29230.00000000,0.00000000,0.00000000,1,1.00000,100,292.30000000,292.30000000,0.00000000,0.00000000,0.0000,0.00000000,3,0,1690820956,1690820956.00000000,1690821329.23846800,1690821329.23847700,1690821329.27577100,'1');
/*!40000 ALTER TABLE `lever_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_bank_account`
--

DROP TABLE IF EXISTS `lh_bank_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_bank_account` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `p_uid` int(11) DEFAULT NULL,
  `df_balance` decimal(25,8) DEFAULT '0.00000000',
  `usdt_balance` decimal(25,8) DEFAULT '0.00000000',
  `total_profit` decimal(25,8) DEFAULT '0.00000000',
  `total_deposit_amount` decimal(25,8) DEFAULT NULL,
  `team_deposit_amount` decimal(25,8) DEFAULT NULL COMMENT '团队存款总量',
  `m_level` tinyint(4) DEFAULT '0' COMMENT '直推级别',
  `vip_level` tinyint(4) DEFAULT '0' COMMENT '团队级别',
  `status` tinyint(1) DEFAULT '1' COMMENT '1:正常',
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `vip_log` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_bank_account`
--

LOCK TABLES `lh_bank_account` WRITE;
/*!40000 ALTER TABLE `lh_bank_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_bank_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_bank_account_log`
--

DROP TABLE IF EXISTS `lh_bank_account_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_bank_account_log` (
  `id` int(11) NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL COMMENT '1:usdt账户 2:df-one',
  `amount` decimal(25,8) DEFAULT NULL COMMENT '数量',
  `description` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_bank_account_log`
--

LOCK TABLES `lh_bank_account_log` WRITE;
/*!40000 ALTER TABLE `lh_bank_account_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_bank_account_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_bank_team_member`
--

DROP TABLE IF EXISTS `lh_bank_team_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_bank_team_member` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `leader_uid` int(11) DEFAULT NULL,
  `generation` int(11) DEFAULT NULL COMMENT '第几代团队',
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_bank_team_member`
--

LOCK TABLES `lh_bank_team_member` WRITE;
/*!40000 ALTER TABLE `lh_bank_team_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_bank_team_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_deposit_config`
--

DROP TABLE IF EXISTS `lh_deposit_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_deposit_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_id` int(11) NOT NULL,
  `interest_rate` decimal(10,4) NOT NULL,
  `save_min` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `day` int(10) NOT NULL,
  `created_at` datetime NOT NULL,
  `faxing` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否新币发行',
  `faxing_name` varchar(11) NOT NULL COMMENT '新币名称',
  `faxing_begin` varchar(11) NOT NULL COMMENT '开始日期',
  `faxing_end` varchar(11) NOT NULL COMMENT '结束日期',
  `faxing_num` int(11) NOT NULL COMMENT '发行数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='理财产品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_deposit_config`
--

LOCK TABLES `lh_deposit_config` WRITE;
/*!40000 ALTER TABLE `lh_deposit_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_deposit_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_deposit_order`
--

DROP TABLE IF EXISTS `lh_deposit_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_deposit_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `currency_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL COMMENT '解冻数量',
  `day_rate` decimal(10,5) NOT NULL COMMENT '日利率',
  `total_interest` decimal(20,8) DEFAULT '0.00000000' COMMENT '总利息',
  `last_settle_time` date DEFAULT NULL COMMENT '上次结息时间',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `end_at` date DEFAULT NULL COMMENT '结束日期',
  `start_at` date DEFAULT NULL COMMENT '开始时间',
  `status` tinyint(4) DEFAULT '1' COMMENT '1:进行中 2：已结束',
  `is_return_reward` tinyint(1) DEFAULT '0' COMMENT '是否执行反佣逻辑',
  `is_cancel` tinyint(1) DEFAULT '0' COMMENT '是否毁约',
  `config_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='理财订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_deposit_order`
--

LOCK TABLES `lh_deposit_order` WRITE;
/*!40000 ALTER TABLE `lh_deposit_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_deposit_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_deposit_order_log`
--

DROP TABLE IF EXISTS `lh_deposit_order_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_deposit_order_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interest_amount` decimal(25,8) DEFAULT NULL COMMENT '利息数',
  `lh_order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '什么时候结的',
  `interest_day` date DEFAULT NULL COMMENT '哪天的利息',
  `currency_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `orderIndex` (`lh_order_id`,`interest_day`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_deposit_order_log`
--

LOCK TABLES `lh_deposit_order_log` WRITE;
/*!40000 ALTER TABLE `lh_deposit_order_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_deposit_order_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_loan_order`
--

DROP TABLE IF EXISTS `lh_loan_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_loan_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_account_id` int(11) DEFAULT NULL,
  `amount` int(11) NOT NULL COMMENT '存款数量',
  `day_rate` decimal(10,5) NOT NULL COMMENT '日利率',
  `total_interest` decimal(20,8) DEFAULT '0.00000000' COMMENT '总利息',
  `total_return` decimal(20,8) DEFAULT NULL COMMENT '总还款数',
  `last_settle_time` date DEFAULT NULL COMMENT '上次结息时间',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `end_at` date DEFAULT NULL COMMENT '结束日期',
  `start_at` date DEFAULT NULL COMMENT '开始时间',
  `status` tinyint(4) DEFAULT '1' COMMENT '1:进行中 2：已还清',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_loan_order`
--

LOCK TABLES `lh_loan_order` WRITE;
/*!40000 ALTER TABLE `lh_loan_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_loan_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_sending_check`
--

DROP TABLE IF EXISTS `lh_sending_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_sending_check` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户邮箱',
  `config_id` int(11) DEFAULT NULL COMMENT '新币id',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '审核状态 1为未审核 2已审核',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='新币申购审核';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_sending_check`
--

LOCK TABLES `lh_sending_check` WRITE;
/*!40000 ALTER TABLE `lh_sending_check` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_sending_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_sending_config`
--

DROP TABLE IF EXISTS `lh_sending_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lh_sending_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `new_currency_name` varchar(20) NOT NULL DEFAULT '' COMMENT '新币名称',
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
  `last_num` decimal(20,4) DEFAULT NULL COMMENT '剩余库存',
  `is_recommend` tinyint(1) DEFAULT '2' COMMENT '是否推荐',
  `recommend_title` varchar(255) DEFAULT NULL COMMENT '推荐标题',
  `recommend_content` varchar(255) DEFAULT NULL COMMENT '推荐内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_sending_config`
--

LOCK TABLES `lh_sending_config` WRITE;
/*!40000 ALTER TABLE `lh_sending_config` DISABLE KEYS */;
INSERT INTO `lh_sending_config` VALUES (1,'EME',1,0.0200,500.0000,'500%',20000000.0000,20000.0000,20,'2023-05-30 14:35:02','2023-05-30 14:35:12','2022-04-03 23:59:47','2023-05-30 14:35:32','TMC is an erc-20 vault token that represents NFT assets within the NFTX vault. Vault tokens allow NFTX to be a platform to create a liquid market for illiquid NFTs.',1071111.1117,2,'New Coin TMC release announcement','Dear users, Hello! New Coin TMC was officially applied for through the exchange on April 4, 2022, New York time. The subscription period is: April 4, 2022 to April 26, 2022.');
/*!40000 ALTER TABLE `lh_sending_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lh_sending_order`
--

DROP TABLE IF EXISTS `lh_sending_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `status` tinyint(4) DEFAULT NULL COMMENT '1申购中 2赎回中 3已完成',
  `config_id` int(11) NOT NULL,
  `original_interest` decimal(20,4) DEFAULT NULL COMMENT '原币收益',
  `exam_status` tinyint(1) DEFAULT '3' COMMENT '1审核通过  2审核不通过 3待审核',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lh_sending_order`
--

LOCK TABLES `lh_sending_order` WRITE;
/*!40000 ALTER TABLE `lh_sending_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `lh_sending_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market`
--

DROP TABLE IF EXISTS `market`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `symbol` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `website_slug` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rank` int(11) NOT NULL DEFAULT '0',
  `circulating_supply` bigint(20) unsigned NOT NULL DEFAULT '0',
  `total_supply` bigint(20) unsigned NOT NULL DEFAULT '0',
  `max_supply` bigint(20) unsigned NOT NULL DEFAULT '0',
  `quotes` text COLLATE utf8_unicode_ci NOT NULL,
  `last_updated` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market`
--

LOCK TABLES `market` WRITE;
/*!40000 ALTER TABLE `market` DISABLE KEYS */;
INSERT INTO `market` VALUES (1,'Bitcoin','BTC','',1,18930300,18930300,21000000,'a:1:{s:3:\"USD\";a:13:{s:5:\"price\";d:43340.03857196392;s:10:\"volume_24h\";d:18448845037.03032;s:17:\"volume_change_24h\";d:-22.1692;s:17:\"percent_change_1h\";d:-0.52612362;s:18:\"percent_change_24h\";d:0.02055955;s:17:\"percent_change_7d\";d:3.6521687;s:18:\"percent_change_30d\";d:-9.98105749;s:18:\"percent_change_60d\";d:-28.39226632;s:18:\"percent_change_90d\";d:-28.41006992;s:10:\"market_cap\";d:820439932178.8486;s:20:\"market_cap_dominance\";d:39.5588;s:24:\"fully_diluted_market_cap\";d:910140810011.24;s:12:\"last_updated\";s:24:\"2022-01-15T21:59:00.000Z\";}}',2022),(2,'Litecoin','LTC','',22,69421157,84000000,84000000,'a:1:{s:3:\"USD\";a:13:{s:5:\"price\";d:147.9978753775052;s:10:\"volume_24h\";d:1005808622.3592908;s:17:\"volume_change_24h\";d:-17.0569;s:17:\"percent_change_1h\";d:-0.49548725;s:18:\"percent_change_24h\";d:1.83946483;s:17:\"percent_change_7d\";d:13.82970403;s:18:\"percent_change_30d\";d:-2.36676995;s:18:\"percent_change_60d\";d:-36.67178273;s:18:\"percent_change_90d\";d:-18.6176573;s:10:\"market_cap\";d:10274183741.48423;s:20:\"market_cap_dominance\";d:0.4952;s:24:\"fully_diluted_market_cap\";d:12431821531.71;s:12:\"last_updated\";s:24:\"2022-01-15T21:59:00.000Z\";}}',2022);
/*!40000 ALTER TABLE `market` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_day`
--

DROP TABLE IF EXISTS `market_day`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_day` (
  `id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL DEFAULT '0',
  `legal_id` int(11) NOT NULL DEFAULT '0',
  `start_price` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `end_price` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `highest` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `mminimum` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `number` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `times` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mar_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_day`
--

LOCK TABLES `market_day` WRITE;
/*!40000 ALTER TABLE `market_day` DISABLE KEYS */;
/*!40000 ALTER TABLE `market_day` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `market_hour`
--

DROP TABLE IF EXISTS `market_hour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `market_hour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_id` int(11) NOT NULL DEFAULT '0',
  `legal_id` int(11) NOT NULL DEFAULT '0',
  `start_price` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `end_price` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `highest` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `mminimum` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `day_time` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `number` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `mar_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `period` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sign` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `currency_id` (`currency_id`,`legal_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2263 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT COMMENT='小时市场行情';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `market_hour`
--

LOCK TABLES `market_hour` WRITE;
/*!40000 ALTER TABLE `market_hour` DISABLE KEYS */;
INSERT INTO `market_hour` VALUES (1,2,3,27684.01000,27684.31000,27689.99000,27684.01000,1685467440,5,0.87551,'1685467440','1min',2),(2,4,3,1900.75000,1900.84000,1900.98000,1900.75000,1685467440,5,0.15530,'1685467440','1min',2),(3,6,3,91.86000,91.86000,91.86000,91.86000,1685467440,5,1.12070,'1685467440','1min',2),(4,2,3,27684.00000,27684.00000,27684.00000,27684.00000,1685467500,5,0.00000,'1685467500','1min',2),(5,4,3,1900.84000,1900.84000,1900.84000,1900.84000,1685467500,5,0.00000,'1685467500','1min',2),(6,6,3,91.86000,91.86000,91.86000,91.86000,1685467500,5,0.00000,'1685467500','1min',2),(7,6,3,91.84000,91.84000,91.84000,91.84000,1685467560,5,0.00000,'1685467560','1min',2),(8,2,3,27682.00000,27682.00000,27682.00000,27682.00000,1685467560,5,0.00036,'1685467560','1min',2),(9,4,3,1900.60000,1900.60000,1900.60000,1900.60000,1685467560,5,0.00000,'1685467560','1min',2),(10,2,3,27650.00000,27650.00000,27650.00000,27650.00000,1685467620,5,0.45454,'1685467620','1min',2),(11,4,3,1899.11000,1899.11000,1899.11000,1899.11000,1685467620,5,0.00000,'1685467620','1min',2),(12,6,3,91.73000,91.73000,91.73000,91.73000,1685467620,5,0.00000,'1685467620','1min',2),(13,2,3,27658.35000,27658.35000,27658.35000,27658.35000,1685467680,5,0.00000,'1685467680','1min',2),(14,4,3,1899.87000,1899.87000,1899.87000,1899.87000,1685467680,5,0.00000,'1685467680','1min',2),(15,6,3,91.77000,91.77000,91.77000,91.77000,1685467680,5,0.00000,'1685467680','1min',2),(16,6,3,91.77000,91.77000,91.77000,91.77000,1685467740,5,0.00000,'1685467740','1min',2),(17,2,3,27641.94000,27641.94000,27641.94000,27641.94000,1685467740,5,0.00000,'1685467740','1min',2),(18,4,3,1899.19000,1899.19000,1899.19000,1899.19000,1685467740,5,0.00000,'1685467740','1min',2),(19,2,3,27657.77000,27657.77000,27657.77000,27657.77000,1685467800,5,0.00000,'1685467800','1min',2),(20,4,3,1899.77000,1899.77000,1899.77000,1899.77000,1685467800,5,0.00000,'1685467800','1min',2),(21,6,3,91.86000,91.86000,91.86000,91.86000,1685467800,5,0.00000,'1685467800','1min',2),(22,4,3,1898.87000,1898.87000,1898.87000,1898.87000,1685467860,5,0.00000,'1685467860','1min',2),(23,6,3,91.79000,91.79000,91.79000,91.79000,1685467860,5,0.00000,'1685467860','1min',2),(24,2,3,27645.00000,27644.57000,27645.00000,27644.57000,1685467860,5,0.29779,'1685467860','1min',2),(25,2,3,27632.98000,27639.02000,27639.02000,27632.98000,1685467920,5,0.22418,'1685467920','1min',2),(26,4,3,1897.97000,1897.97000,1897.97000,1897.97000,1685467920,5,6.32100,'1685467920','1min',2),(27,6,3,91.75000,91.75000,91.75000,91.75000,1685467920,5,1.52590,'1685467920','1min',2),(28,2,3,27649.99000,27649.99000,27649.99000,27649.99000,1685467980,5,0.00036,'1685467980','1min',2),(29,4,3,1898.99000,1898.99000,1898.99000,1898.99000,1685467980,5,0.00830,'1685467980','1min',2),(30,6,3,91.81000,91.81000,91.81000,91.81000,1685467980,5,0.45270,'1685467980','1min',2),(31,4,3,1899.29000,1899.29000,1899.29000,1899.29000,1685468040,5,0.00000,'1685468040','1min',2),(32,2,3,27651.90000,27651.90000,27651.90000,27651.90000,1685468040,5,0.00000,'1685468040','1min',2),(33,6,3,91.82000,91.82000,91.82000,91.82000,1685468040,5,0.00000,'1685468040','1min',2),(34,2,3,27674.00000,27675.00000,27675.00000,27674.00000,1685468100,5,0.08000,'1685468100','1min',2),(35,4,3,1901.30000,1901.30000,1901.30000,1901.30000,1685468100,5,0.00000,'1685468100','1min',2),(36,6,3,91.89000,91.89000,91.89000,91.89000,1685468100,5,0.00000,'1685468100','1min',2),(37,6,3,91.96000,91.96000,91.96000,91.96000,1685468160,5,0.00000,'1685468160','1min',2),(38,2,3,27677.70000,27677.67000,27677.70000,27677.67000,1685468160,5,0.03712,'1685468160','1min',2),(39,4,3,1901.76000,1901.76000,1901.76000,1901.76000,1685468160,5,0.00000,'1685468160','1min',2),(40,6,3,92.00000,92.00000,92.00000,92.00000,1685468220,5,0.00000,'1685468220','1min',2),(41,2,3,27689.26000,27689.26000,27689.26000,27689.26000,1685468220,5,0.00128,'1685468220','1min',2),(42,4,3,1902.80000,1902.80000,1902.80000,1902.80000,1685468220,5,0.00000,'1685468220','1min',2),(43,6,3,92.00000,92.00000,92.00000,92.00000,1685468280,5,0.00000,'1685468280','1min',2),(44,2,3,27687.72000,27687.72000,27687.72000,27687.72000,1685468280,5,0.00036,'1685468280','1min',2),(45,4,3,1902.90000,1902.90000,1902.90000,1902.90000,1685468280,5,0.00000,'1685468280','1min',2),(46,6,3,92.00000,92.00000,92.00000,92.00000,1685468340,5,0.00000,'1685468340','1min',2),(47,2,3,27698.00000,27707.99000,27708.00000,27698.00000,1685468340,5,0.98910,'1685468340','1min',2),(48,4,3,1903.52000,1903.89000,1903.89000,1903.52000,1685468340,5,0.49610,'1685468340','1min',2),(49,4,3,1903.78000,1903.78000,1903.78000,1903.78000,1685468400,5,0.00000,'1685468400','1min',2),(50,6,3,92.03000,92.03000,92.03000,92.03000,1685468400,5,0.00000,'1685468400','1min',2),(51,2,3,27706.31000,27706.31000,27706.31000,27706.31000,1685468400,5,0.00000,'1685468400','1min',2),(52,2,3,27706.00000,27706.00000,27706.00000,27706.00000,1685468460,5,0.00000,'1685468460','1min',2),(53,4,3,1904.20000,1904.20000,1904.20000,1904.20000,1685468460,5,0.00000,'1685468460','1min',2),(54,6,3,92.10000,92.10000,92.10000,92.10000,1685468460,5,0.00000,'1685468460','1min',2),(55,6,3,92.10000,92.10000,92.10000,92.10000,1685468520,5,0.00000,'1685468520','1min',2),(56,2,3,27705.42000,27705.42000,27705.42000,27705.42000,1685468520,5,0.00000,'1685468520','1min',2),(57,4,3,1904.40000,1904.40000,1904.40000,1904.40000,1685468520,5,0.00000,'1685468520','1min',2),(58,4,3,1904.90000,1904.90000,1904.90000,1904.90000,1685468580,5,0.00000,'1685468580','1min',2),(59,6,3,92.12000,92.12000,92.12000,92.12000,1685468580,5,0.00000,'1685468580','1min',2),(60,2,3,27711.58000,27711.58000,27711.58000,27711.58000,1685468580,5,0.00000,'1685468580','1min',2),(61,4,3,1904.07000,1904.07000,1904.07000,1904.07000,1685468640,5,0.00000,'1685468640','1min',2),(62,6,3,92.13000,92.13000,92.13000,92.13000,1685468640,5,0.00000,'1685468640','1min',2),(63,2,3,27710.56000,27710.56000,27710.56000,27710.56000,1685468640,5,0.00000,'1685468640','1min',2),(64,2,3,27716.66000,27716.66000,27716.66000,27716.66000,1685468700,5,0.00000,'1685468700','1min',2),(65,6,3,92.13000,92.13000,92.13000,92.13000,1685468700,5,0.00000,'1685468700','1min',2),(66,4,3,1904.84000,1904.84000,1904.84000,1904.84000,1685468700,5,0.00000,'1685468700','1min',2),(67,6,3,92.11000,92.11000,92.11000,92.11000,1685468760,5,0.00000,'1685468760','1min',2),(68,2,3,27712.08000,27712.08000,27712.08000,27712.08000,1685468760,5,0.00000,'1685468760','1min',2),(69,4,3,1904.88000,1904.88000,1904.88000,1904.88000,1685468760,5,0.00000,'1685468760','1min',2),(70,4,3,1904.61000,1904.61000,1904.61000,1904.61000,1685468820,5,0.00000,'1685468820','1min',2),(71,2,3,27713.85000,27713.85000,27713.85000,27713.85000,1685468820,5,0.00000,'1685468820','1min',2),(72,6,3,92.10000,92.10000,92.10000,92.10000,1685468820,5,0.00000,'1685468820','1min',2),(73,2,3,27700.32000,27700.32000,27700.32000,27700.32000,1685468880,5,0.01766,'1685468880','1min',2),(74,4,3,1904.43000,1904.65000,1904.65000,1904.43000,1685468880,5,0.78260,'1685468880','1min',2),(75,6,3,92.10000,92.10000,92.10000,92.10000,1685468880,5,0.43440,'1685468880','1min',2),(76,2,3,27726.00000,27726.00000,27726.00000,27726.00000,1685468940,5,0.19436,'1685468940','1min',2),(77,4,3,1907.19000,1907.19000,1907.19000,1907.19000,1685468940,5,1.02500,'1685468940','1min',2),(78,6,3,92.19000,92.19000,92.19000,92.19000,1685468940,5,1.26390,'1685468940','1min',2),(79,6,3,92.28000,92.28000,92.28000,92.28000,1685469000,5,0.00000,'1685469000','1min',2),(80,4,3,1910.66000,1910.67000,1910.67000,1910.66000,1685469000,5,0.80000,'1685469000','1min',2),(81,2,3,27762.12000,27762.12000,27762.12000,27762.12000,1685469000,5,0.01305,'1685469000','1min',2),(82,4,3,1908.97000,1908.97000,1908.97000,1908.97000,1685469060,5,0.00000,'1685469060','1min',2),(83,2,3,27746.04000,27746.04000,27746.04000,27746.04000,1685469060,5,0.00000,'1685469060','1min',2),(84,6,3,92.16000,92.16000,92.16000,92.16000,1685469060,5,0.00000,'1685469060','1min',2),(85,6,3,92.27000,92.27000,92.27000,92.27000,1685469120,5,0.00000,'1685469120','1min',2),(86,2,3,27758.31000,27758.31000,27758.31000,27758.31000,1685469120,5,0.00036,'1685469120','1min',2),(87,4,3,1910.28000,1910.28000,1910.28000,1910.28000,1685469120,5,0.00000,'1685469120','1min',2),(88,4,3,1910.18000,1910.18000,1910.18000,1910.18000,1685469180,5,0.00000,'1685469180','1min',2),(89,6,3,92.27000,92.27000,92.27000,92.27000,1685469180,5,0.00000,'1685469180','1min',2),(90,2,3,27766.84000,27766.84000,27766.84000,27766.84000,1685469180,5,0.00000,'1685469180','1min',2),(91,4,3,1906.64000,1906.64000,1906.64000,1906.64000,1685469240,5,0.01050,'1685469240','1min',2),(92,6,3,92.20000,92.20000,92.20000,92.20000,1685469240,5,0.14000,'1685469240','1min',2),(93,2,3,27740.01000,27740.01000,27740.01000,27740.01000,1685469240,5,0.00220,'1685469240','1min',2),(94,4,3,1905.05000,1905.05000,1905.05000,1905.05000,1685469300,5,0.15720,'1685469300','1min',2),(95,2,3,27720.89000,27720.89000,27720.89000,27720.89000,1685469300,5,0.00000,'1685469300','1min',2),(96,6,3,92.08000,92.08000,92.08000,92.08000,1685469300,5,0.00000,'1685469300','1min',2),(97,2,3,27726.91000,27726.91000,27726.91000,27726.91000,1685469360,5,0.00000,'1685469360','1min',2),(98,4,3,1905.79000,1905.79000,1905.79000,1905.79000,1685469360,5,0.00000,'1685469360','1min',2),(99,6,3,92.14000,92.14000,92.14000,92.14000,1685469360,5,0.00000,'1685469360','1min',2),(100,2,3,27726.92000,27726.92000,27726.92000,27726.92000,1685469420,5,0.00000,'1685469420','1min',2),(101,2,3,27678.05000,27685.00000,27685.00000,27678.05000,1685469720,5,0.78389,'1685469720','1min',2),(102,4,3,1902.38000,1902.52000,1902.52000,1902.38000,1685469720,5,1.44830,'1685469720','1min',2),(103,6,3,91.88000,91.89000,91.90000,91.88000,1685469720,5,12.89070,'1685469720','1min',2),(104,6,3,91.90000,91.90000,91.90000,91.90000,1685469780,5,1.00320,'1685469780','1min',2),(105,2,3,27687.99000,27687.99000,27687.99000,27687.99000,1685469780,5,0.00000,'1685469780','1min',2),(106,4,3,1902.86000,1902.86000,1902.86000,1902.86000,1685469780,5,0.00000,'1685469780','1min',2),(107,4,3,1902.76000,1902.76000,1902.76000,1902.76000,1685469840,5,0.00000,'1685469840','1min',2),(108,6,3,91.91000,91.91000,91.91000,91.91000,1685469840,5,0.61590,'1685469840','1min',2),(109,2,3,27687.99000,27687.99000,27687.99000,27687.99000,1685469840,5,0.00036,'1685469840','1min',2),(110,2,3,27672.00000,27670.00000,27672.00000,27670.00000,1685469900,5,0.26966,'1685469900','1min',2),(111,4,3,1901.08000,1901.27000,1901.27000,1901.08000,1685469900,5,1.18660,'1685469900','1min',2),(112,6,3,91.80000,91.80000,91.80000,91.80000,1685469900,5,0.72550,'1685469900','1min',2),(113,2,3,27678.00000,27678.00000,27678.00000,27678.00000,1685469960,5,0.00158,'1685469960','1min',2),(114,4,3,1902.56000,1902.56000,1902.56000,1902.56000,1685469960,5,0.00000,'1685469960','1min',2),(115,6,3,91.88000,91.88000,91.88000,91.88000,1685469960,5,0.70470,'1685469960','1min',2),(116,2,3,27672.54000,27672.54000,27672.54000,27672.54000,1685470020,5,0.00065,'1685470020','1min',2),(117,4,3,1902.15000,1902.15000,1902.15000,1902.15000,1685470020,5,0.00000,'1685470020','1min',2),(118,6,3,91.85000,91.85000,91.85000,91.85000,1685470020,5,0.74470,'1685470020','1min',2),(119,6,3,91.88000,91.88000,91.88000,91.88000,1685470080,5,0.00000,'1685470080','1min',2),(120,2,3,27677.87000,27677.87000,27677.87000,27677.87000,1685470080,5,0.00859,'1685470080','1min',2),(121,4,3,1901.93000,1901.93000,1901.93000,1901.93000,1685470080,5,0.00000,'1685470080','1min',2),(122,6,3,91.85000,91.85000,91.85000,91.85000,1685470140,5,0.00000,'1685470140','1min',2),(123,4,3,1901.96000,1901.96000,1901.96000,1901.96000,1685470140,5,0.00000,'1685470140','1min',2),(124,2,3,27676.89000,27676.89000,27676.89000,27676.89000,1685470140,5,0.15508,'1685470140','1min',2),(125,2,3,27683.99000,27683.99000,27683.99000,27683.99000,1685470200,5,0.00000,'1685470200','1min',2),(126,4,3,1903.00000,1903.00000,1903.00000,1903.00000,1685470200,5,0.00000,'1685470200','1min',2),(127,6,3,91.88000,91.88000,91.88000,91.88000,1685470200,5,0.53090,'1685470200','1min',2),(128,6,3,91.94000,91.94000,91.94000,91.94000,1685470260,5,0.00000,'1685470260','1min',2),(129,2,3,27689.38000,27689.38000,27689.38000,27689.38000,1685470260,5,0.00000,'1685470260','1min',2),(130,4,3,1904.03000,1904.03000,1904.03000,1904.03000,1685470260,5,0.00000,'1685470260','1min',2),(131,4,3,1904.99000,1904.99000,1904.99000,1904.99000,1685470320,5,0.00000,'1685470320','1min',2),(132,6,3,91.99000,91.99000,91.99000,91.99000,1685470320,5,0.00000,'1685470320','1min',2),(133,2,3,27701.99000,27701.99000,27701.99000,27701.99000,1685470320,5,0.00000,'1685470320','1min',2),(134,2,3,27712.00000,27712.00000,27712.00000,27712.00000,1685470380,5,0.00000,'1685470380','1min',2),(135,4,3,1905.11000,1905.11000,1905.11000,1905.11000,1685470380,5,0.00000,'1685470380','1min',2),(136,6,3,92.01000,92.01000,92.01000,92.01000,1685470380,5,0.00000,'1685470380','1min',2),(137,6,3,92.00000,92.00000,92.00000,92.00000,1685470440,5,0.00000,'1685470440','1min',2),(138,2,3,27697.68000,27697.68000,27697.68000,27697.68000,1685470440,5,0.00000,'1685470440','1min',2),(139,4,3,1904.41000,1904.41000,1904.41000,1904.41000,1685470440,5,0.00850,'1685470440','1min',2),(140,6,3,91.97000,91.97000,91.97000,91.97000,1685470500,5,0.00000,'1685470500','1min',2),(141,2,3,27700.00000,27700.00000,27700.00000,27700.00000,1685470500,5,0.00000,'1685470500','1min',2),(142,4,3,1904.59000,1904.59000,1904.59000,1904.59000,1685470500,5,0.00000,'1685470500','1min',2),(143,2,3,27703.18000,27703.18000,27703.18000,27703.18000,1685470560,5,0.00000,'1685470560','1min',2),(144,4,3,1904.65000,1904.65000,1904.65000,1904.65000,1685470560,5,0.00000,'1685470560','1min',2),(145,6,3,92.07000,92.07000,92.07000,92.07000,1685470560,5,0.13060,'1685470560','1min',2),(146,6,3,92.12000,92.12000,92.12000,92.12000,1685470620,5,0.00000,'1685470620','1min',2),(147,2,3,27704.00000,27704.00000,27704.00000,27704.00000,1685470620,5,0.00000,'1685470620','1min',2),(148,4,3,1904.96000,1904.96000,1904.96000,1904.96000,1685470620,5,0.00000,'1685470620','1min',2),(149,2,3,27705.00000,27705.00000,27705.00000,27705.00000,1685470680,5,0.45213,'1685470680','1min',2),(150,4,3,1905.05000,1905.05000,1905.05000,1905.05000,1685470680,5,0.00000,'1685470680','1min',2),(151,6,3,92.12000,92.12000,92.12000,92.12000,1685470680,5,0.00000,'1685470680','1min',2),(152,4,3,1904.85000,1904.85000,1904.85000,1904.85000,1685470740,5,0.00000,'1685470740','1min',2),(153,6,3,92.10000,92.10000,92.10000,92.10000,1685470740,5,0.00000,'1685470740','1min',2),(154,2,3,27705.01000,27705.01000,27705.01000,27705.01000,1685470740,5,0.00000,'1685470740','1min',2),(155,2,3,27707.37000,27707.37000,27707.37000,27707.37000,1685470800,5,0.00200,'1685470800','1min',2),(156,4,3,1905.13000,1905.13000,1905.13000,1905.13000,1685470800,5,0.00000,'1685470800','1min',2),(157,6,3,92.11000,92.11000,92.11000,92.11000,1685470800,5,0.00000,'1685470800','1min',2),(158,2,3,27700.00000,27700.00000,27700.00000,27700.00000,1685470860,5,0.00000,'1685470860','1min',2),(159,4,3,1904.69000,1904.69000,1904.69000,1904.69000,1685470860,5,0.00000,'1685470860','1min',2),(160,6,3,92.11000,92.12000,92.12000,92.11000,1685470860,5,1.25930,'1685470860','1min',2),(161,6,3,92.14000,92.14000,92.14000,92.14000,1685470920,5,0.00000,'1685470920','1min',2),(162,2,3,27705.20000,27705.20000,27705.20000,27705.20000,1685470920,5,0.02801,'1685470920','1min',2),(163,4,3,1905.08000,1905.08000,1905.08000,1905.08000,1685470920,5,0.00000,'1685470920','1min',2),(164,6,3,92.12000,92.12000,92.12000,92.12000,1685470980,5,0.00000,'1685470980','1min',2),(165,2,3,27714.18000,27720.95000,27720.95000,27714.18000,1685470980,5,0.41504,'1685470980','1min',2),(166,4,3,1905.42000,1906.12000,1906.75000,1905.42000,1685470980,5,17.42550,'1685470980','1min',2),(167,6,3,92.11000,92.11000,92.11000,92.11000,1685471100,5,0.00000,'1685471100','1min',2),(168,2,3,27721.57000,27721.58000,27721.58000,27721.57000,1685471100,5,0.40195,'1685471100','1min',2),(169,4,3,1905.78000,1905.78000,1905.78000,1905.78000,1685471100,5,0.00000,'1685471100','1min',2),(170,6,3,92.11000,92.11000,92.11000,92.11000,1685471160,5,0.00000,'1685471160','1min',2),(171,4,3,1905.20000,1904.90000,1905.20000,1904.90000,1685471160,5,0.80000,'1685471160','1min',2),(172,2,3,27721.43000,27711.19000,27721.43000,27708.73000,1685471160,5,2.36102,'1685471160','1min',2),(173,2,3,27707.65000,27700.02000,27707.65000,27700.02000,1685471220,5,4.51314,'1685471220','1min',2),(174,4,3,1904.02000,1904.02000,1904.02000,1904.02000,1685471280,5,0.00000,'1685471280','1min',2),(175,6,3,92.03000,92.03000,92.03000,92.03000,1685471280,5,0.00000,'1685471280','1min',2),(176,2,3,27700.01000,27700.01000,27700.01000,27700.01000,1685471280,5,0.00469,'1685471280','1min',2),(177,2,3,27700.02000,27700.02000,27700.02000,27700.02000,1685471340,5,0.00000,'1685471340','1min',2),(178,4,3,1904.07000,1904.07000,1904.07000,1904.07000,1685471340,5,0.00000,'1685471340','1min',2),(179,6,3,92.03000,92.03000,92.03000,92.03000,1685471340,5,2.37990,'1685471340','1min',2),(180,6,3,92.03000,92.03000,92.03000,92.03000,1685471400,5,0.21732,'1685471400','1min',2),(181,4,3,1903.45000,1903.83000,1903.83000,1903.45000,1685471400,5,3.14300,'1685471400','1min',2),(182,6,3,92.08000,92.08000,92.08000,92.08000,1685471460,5,0.00000,'1685471460','1min',2),(183,2,3,27709.05000,27709.05000,27709.05000,27709.05000,1685471460,5,0.00220,'1685471460','1min',2),(184,4,3,1904.24000,1904.24000,1904.24000,1904.24000,1685471460,5,0.00000,'1685471460','1min',2),(185,4,3,1904.50000,1904.67000,1904.67000,1904.50000,1685471520,5,1.02290,'1685471520','1min',2),(186,6,3,92.10000,92.10000,92.10000,92.10000,1685471520,5,0.00000,'1685471520','1min',2),(187,2,3,27710.00000,27717.99000,27718.00000,27710.00000,1685471520,5,1.40388,'1685471520','1min',2),(188,6,3,92.09000,92.09000,92.09000,92.09000,1685471580,5,0.00000,'1685471580','1min',2),(189,2,3,27723.52000,27723.52000,27723.52000,27723.52000,1685471580,5,0.01433,'1685471580','1min',2),(190,6,3,92.09000,92.11000,92.11000,92.07000,1685471640,5,29.35300,'1685471640','1min',2),(191,2,3,27717.53000,27717.54000,27717.54000,27717.53000,1685471700,5,0.08881,'1685471700','1min',2),(192,4,3,1904.85000,1904.85000,1904.85000,1904.85000,1685471700,5,0.00000,'1685471700','1min',2),(193,6,3,92.11000,92.11000,92.11000,92.11000,1685471700,5,0.00000,'1685471700','1min',2),(194,2,3,27731.49000,27731.49000,27731.49000,27731.49000,1685471760,5,0.00000,'1685471760','1min',2),(195,4,3,1906.00000,1906.00000,1906.00000,1906.00000,1685471760,5,0.06198,'1685471760','1min',2),(196,6,3,92.17000,92.17000,92.17000,92.17000,1685471760,5,0.00000,'1685471760','1min',2),(197,4,3,1906.00000,1906.32000,1906.32000,1906.00000,1685471880,5,2.88800,'1685471880','1min',2),(198,6,3,92.15000,92.12000,92.19000,92.12000,1685471880,5,12.32820,'1685471880','1min',2),(199,2,3,27730.00000,27751.99000,27751.99000,27730.00000,1685471880,5,2.38503,'1685471880','1min',2),(200,4,3,1906.50000,1906.50000,1906.50000,1906.50000,1685471940,5,0.00000,'1685471940','1min',2),(201,2,3,27751.99000,27751.99000,27751.99000,27751.99000,1685471940,5,0.00000,'1685471940','1min',2),(202,6,3,92.12000,92.12000,92.12000,92.12000,1685471940,5,0.00000,'1685471940','1min',2),(203,6,3,92.04000,92.04000,92.04000,92.04000,1685472000,5,0.00000,'1685472000','1min',2),(204,4,3,1906.53000,1906.53000,1906.53000,1906.53000,1685472000,5,0.00000,'1685472000','1min',2),(205,2,3,27754.89000,27754.89000,27754.89000,27754.89000,1685472000,5,0.00000,'1685472000','1min',2),(206,6,3,92.02000,92.02000,92.02000,92.02000,1685472060,5,0.00000,'1685472060','1min',2),(207,2,3,27752.45000,27760.00000,27760.00000,27752.45000,1685472060,5,0.94069,'1685472060','1min',2),(208,4,3,1906.47000,1906.80000,1906.80000,1906.47000,1685472060,5,1.05260,'1685472060','1min',2),(209,2,3,27764.87000,27764.87000,27764.87000,27764.87000,1685472120,5,0.00000,'1685472120','1min',2),(210,4,3,1907.75000,1907.75000,1907.75000,1907.75000,1685472120,5,0.00000,'1685472120','1min',2),(211,6,3,92.05000,92.05000,92.05000,92.05000,1685472120,5,0.00000,'1685472120','1min',2),(212,6,3,92.15000,92.15000,92.15000,92.15000,1685472180,5,0.00000,'1685472180','1min',2),(213,4,3,1909.57000,1909.57000,1909.57000,1909.57000,1685472180,5,0.02500,'1685472180','1min',2),(214,2,3,27786.00000,27786.48000,27786.49000,27786.00000,1685472180,5,0.09633,'1685472180','1min',2),(215,2,3,27138.00000,27130.00000,27141.99000,27129.98000,1685517060,5,0.86678,'1685517060','1min',2),(216,4,3,1866.94000,1866.58000,1867.06000,1866.58000,1685517060,5,7.90310,'1685517060','1min',2),(217,6,3,89.38000,89.38000,89.40000,89.36000,1685517060,5,5.00070,'1685517060','1min',2),(218,8,3,0.88500,0.88500,0.88530,0.88500,1685517060,5,613.68570,'1685517060','1min',2),(219,10,3,112.46000,112.46000,112.46000,112.46000,1685517060,5,0.14210,'1685517060','1min',2),(220,10,3,112.46000,112.46000,112.46000,112.46000,1685517120,5,0.00000,'1685517120','1min',2),(221,2,3,27130.01000,27130.01000,27130.01000,27130.01000,1685517120,5,0.02455,'1685517120','1min',2),(222,4,3,1866.58000,1866.58000,1866.58000,1866.58000,1685517120,5,0.00000,'1685517120','1min',2),(223,6,3,89.39000,89.39000,89.39000,89.39000,1685517120,5,0.00000,'1685517120','1min',2),(224,8,3,0.88500,0.88500,0.88500,0.88500,1685517120,5,0.00000,'1685517120','1min',2),(225,2,3,27126.00000,27127.99000,27127.99000,27126.00000,1685517180,5,0.05043,'1685517180','1min',2),(226,4,3,1866.57000,1866.57000,1866.57000,1866.57000,1685517180,5,0.00630,'1685517180','1min',2),(227,6,3,89.37000,89.37000,89.37000,89.37000,1685517180,5,0.00000,'1685517180','1min',2),(228,8,3,0.88510,0.88510,0.88510,0.88510,1685517180,5,0.00000,'1685517180','1min',2),(229,10,3,112.46000,112.46000,112.46000,112.46000,1685517180,5,0.00000,'1685517180','1min',2),(230,2,3,27126.67000,27126.67000,27126.67000,27126.67000,1685517240,5,0.00000,'1685517240','1min',2),(231,4,3,1866.58000,1866.58000,1866.58000,1866.58000,1685517240,5,0.00000,'1685517240','1min',2),(232,6,3,89.36000,89.36000,89.36000,89.36000,1685517240,5,0.00000,'1685517240','1min',2),(233,8,3,0.88510,0.88510,0.88510,0.88510,1685517240,5,0.00000,'1685517240','1min',2),(234,10,3,112.46000,112.46000,112.46000,112.46000,1685517240,5,0.00000,'1685517240','1min',2),(235,4,3,1866.52000,1866.52000,1866.52000,1866.52000,1685517300,5,0.00000,'1685517300','1min',2),(236,6,3,89.33000,89.33000,89.33000,89.33000,1685517300,5,0.00000,'1685517300','1min',2),(237,8,3,0.88510,0.88510,0.88510,0.88510,1685517300,5,0.00000,'1685517300','1min',2),(238,2,3,27121.16000,27121.16000,27121.16000,27121.16000,1685517300,5,0.00451,'1685517300','1min',2),(239,10,3,112.46000,112.46000,112.46000,112.46000,1685517300,5,0.00000,'1685517300','1min',2),(240,10,3,112.55000,112.55000,112.55000,112.55000,1685517360,5,0.00000,'1685517360','1min',2),(241,2,3,27137.98000,27137.98000,27137.98000,27137.98000,1685517360,5,0.00622,'1685517360','1min',2),(242,4,3,1867.13000,1867.13000,1867.13000,1867.13000,1685517360,5,0.00000,'1685517360','1min',2),(243,6,3,89.38000,89.38000,89.38000,89.38000,1685517360,5,0.44880,'1685517360','1min',2),(244,8,3,0.88670,0.88670,0.88670,0.88670,1685517360,5,0.00000,'1685517360','1min',2),(245,2,3,27142.00000,27142.00000,27142.00000,27142.00000,1685517420,5,0.00000,'1685517420','1min',2),(246,4,3,1867.84000,1867.84000,1867.84000,1867.84000,1685517420,5,0.00000,'1685517420','1min',2),(247,6,3,89.36000,89.36000,89.36000,89.36000,1685517420,5,0.52790,'1685517420','1min',2),(248,10,3,112.55000,112.55000,112.55000,112.55000,1685517420,5,0.00000,'1685517420','1min',2),(249,8,3,0.88650,0.88650,0.88650,0.88650,1685517420,5,0.00000,'1685517420','1min',2),(250,4,3,1868.20000,1868.20000,1868.20000,1868.20000,1685517480,5,0.00000,'1685517480','1min',2),(251,8,3,0.88750,0.88750,0.88750,0.88750,1685517480,5,0.00000,'1685517480','1min',2),(252,10,3,112.56000,112.56000,112.56000,112.56000,1685517480,5,0.00000,'1685517480','1min',2),(253,2,3,27149.99000,27146.36000,27149.99000,27146.36000,1685517480,5,0.42795,'1685517480','1min',2),(254,6,3,89.36000,89.36000,89.36000,89.36000,1685517480,5,0.45140,'1685517480','1min',2),(255,6,3,89.38000,89.38000,89.38000,89.38000,1685517540,5,0.00000,'1685517540','1min',2),(256,8,3,0.88750,0.88750,0.88750,0.88750,1685517540,5,0.00000,'1685517540','1min',2),(257,10,3,112.56000,112.56000,112.56000,112.56000,1685517540,5,0.00000,'1685517540','1min',2),(258,2,3,27151.22000,27151.22000,27151.22000,27151.22000,1685517540,5,0.00000,'1685517540','1min',2),(259,4,3,1868.72000,1868.72000,1868.72000,1868.72000,1685517540,5,0.00000,'1685517540','1min',2),(260,6,3,89.33000,89.33000,89.33000,89.33000,1685517600,5,0.00000,'1685517600','1min',2),(261,8,3,0.88750,0.88750,0.88750,0.88750,1685517600,5,0.00000,'1685517600','1min',2),(262,10,3,112.56000,112.56000,112.56000,112.56000,1685517600,5,0.00000,'1685517600','1min',2),(263,2,3,27151.01000,27151.01000,27151.01000,27151.01000,1685517600,5,0.00381,'1685517600','1min',2),(264,4,3,1868.90000,1868.91000,1868.91000,1868.90000,1685517600,5,0.03390,'1685517600','1min',2),(265,4,3,1868.53000,1868.53000,1868.53000,1868.53000,1685517660,5,0.00000,'1685517660','1min',2),(266,6,3,89.33000,89.33000,89.33000,89.33000,1685517660,5,0.00000,'1685517660','1min',2),(267,8,3,0.88750,0.88750,0.88750,0.88750,1685517660,5,0.00000,'1685517660','1min',2),(268,10,3,112.56000,112.56000,112.56000,112.56000,1685517660,5,0.00000,'1685517660','1min',2),(269,2,3,27140.00000,27140.00000,27140.00000,27140.00000,1685517660,5,0.03473,'1685517660','1min',2),(270,10,3,112.56000,112.56000,112.56000,112.56000,1685517720,5,0.00000,'1685517720','1min',2),(271,2,3,27140.01000,27147.99000,27147.99000,27140.01000,1685517720,5,1.27039,'1685517720','1min',2),(272,4,3,1868.93000,1869.73000,1869.92000,1868.93000,1685517720,5,21.65930,'1685517720','1min',2),(273,6,3,89.29000,89.36000,89.36000,89.29000,1685517720,5,18.91050,'1685517720','1min',2),(274,8,3,0.88780,0.88780,0.88780,0.88780,1685517720,5,459.64050,'1685517720','1min',2),(275,2,3,27148.00000,27148.00000,27148.00000,27148.00000,1685517780,5,0.00000,'1685517780','1min',2),(276,4,3,1870.12000,1870.12000,1870.12000,1870.12000,1685517780,5,0.00000,'1685517780','1min',2),(277,6,3,89.34000,89.34000,89.34000,89.34000,1685517780,5,0.00000,'1685517780','1min',2),(278,8,3,0.88840,0.88840,0.88840,0.88840,1685517780,5,0.00000,'1685517780','1min',2),(279,10,3,112.63000,112.63000,112.63000,112.63000,1685517780,5,0.00000,'1685517780','1min',2),(280,2,3,27150.99000,27150.99000,27150.99000,27150.99000,1685517840,5,0.00566,'1685517840','1min',2),(281,4,3,1870.19000,1870.19000,1870.19000,1870.19000,1685517840,5,0.00000,'1685517840','1min',2),(282,6,3,89.33000,89.33000,89.33000,89.33000,1685517840,5,48.82670,'1685517840','1min',2),(283,8,3,0.88840,0.88840,0.88840,0.88840,1685517840,5,0.00000,'1685517840','1min',2),(284,10,3,112.68000,112.68000,112.68000,112.68000,1685517840,5,0.00000,'1685517840','1min',2),(285,10,3,112.68000,112.68000,112.68000,112.68000,1685517900,5,0.00000,'1685517900','1min',2),(286,2,3,27151.50000,27151.50000,27151.50000,27151.50000,1685517900,5,0.00000,'1685517900','1min',2),(287,4,3,1870.56000,1870.56000,1870.56000,1870.56000,1685517900,5,0.00000,'1685517900','1min',2),(288,6,3,89.31000,89.31000,89.31000,89.31000,1685517900,5,96.00000,'1685517900','1min',2),(289,8,3,0.88840,0.88840,0.88840,0.88840,1685517900,5,0.00000,'1685517900','1min',2),(290,4,3,1870.57000,1870.57000,1870.57000,1870.57000,1685517960,5,0.01700,'1685517960','1min',2),(291,6,3,89.30000,89.30000,89.30000,89.30000,1685517960,5,0.00000,'1685517960','1min',2),(292,8,3,0.88880,0.88880,0.88880,0.88880,1685517960,5,0.00000,'1685517960','1min',2),(293,10,3,112.68000,112.68000,112.68000,112.68000,1685517960,5,0.00000,'1685517960','1min',2),(294,2,3,27150.67000,27150.67000,27150.67000,27150.66000,1685517960,5,0.04715,'1685517960','1min',2),(295,10,3,112.68000,112.68000,112.68000,112.68000,1685518020,5,0.00000,'1685518020','1min',2),(296,6,3,89.36000,89.36000,89.36000,89.36000,1685518020,5,0.00000,'1685518020','1min',2),(297,8,3,0.88880,0.88880,0.88880,0.88880,1685518020,5,0.00000,'1685518020','1min',2),(298,4,3,1872.46000,1872.46000,1872.46000,1872.46000,1685518020,5,0.00000,'1685518020','1min',2),(299,2,3,27160.50000,27165.00000,27165.00000,27160.50000,1685518020,5,2.19786,'1685518020','1min',2),(300,6,3,89.35000,89.35000,89.35000,89.35000,1685518080,5,0.00000,'1685518080','1min',2),(301,10,3,112.68000,112.68000,112.68000,112.68000,1685518080,5,0.00000,'1685518080','1min',2),(302,2,3,27169.50000,27169.50000,27169.50000,27169.50000,1685518080,5,0.00259,'1685518080','1min',2),(303,4,3,1871.42000,1871.42000,1871.42000,1871.42000,1685518080,5,0.00000,'1685518080','1min',2),(304,8,3,0.88880,0.88880,0.88880,0.88880,1685518080,5,0.00000,'1685518080','1min',2),(305,2,3,27184.68000,27184.68000,27184.68000,27184.68000,1685518140,5,0.00000,'1685518140','1min',2),(306,4,3,1872.71000,1872.71000,1872.71000,1872.71000,1685518140,5,0.00000,'1685518140','1min',2),(307,6,3,89.42000,89.42000,89.42000,89.42000,1685518140,5,0.00000,'1685518140','1min',2),(308,8,3,0.88850,0.88850,0.88850,0.88850,1685518140,5,0.00000,'1685518140','1min',2),(309,10,3,112.68000,112.68000,112.68000,112.68000,1685518140,5,0.00000,'1685518140','1min',2),(310,2,3,27178.92000,27178.92000,27178.92000,27178.92000,1685518200,5,0.00000,'1685518200','1min',2),(311,6,3,89.44000,89.44000,89.44000,89.44000,1685518200,5,0.00000,'1685518200','1min',2),(312,8,3,0.88850,0.88850,0.88850,0.88850,1685518200,5,0.00000,'1685518200','1min',2),(313,10,3,112.68000,112.68000,112.68000,112.68000,1685518200,5,0.00000,'1685518200','1min',2),(314,4,3,1872.80000,1872.80000,1872.80000,1872.80000,1685518200,5,0.00000,'1685518200','1min',2),(315,2,3,27178.71000,27178.71000,27178.71000,27178.71000,1685518260,5,0.00000,'1685518260','1min',2),(316,4,3,1871.82000,1871.82000,1871.82000,1871.82000,1685518260,5,0.45870,'1685518260','1min',2),(317,8,3,0.88880,0.88880,0.88880,0.88880,1685518260,5,0.00000,'1685518260','1min',2),(318,10,3,112.61000,112.61000,112.61000,112.61000,1685518260,5,0.00000,'1685518260','1min',2),(319,6,3,89.40000,89.40000,89.40000,89.40000,1685518260,5,0.00000,'1685518260','1min',2),(320,2,3,27195.00000,27195.00000,27195.00000,27195.00000,1685518320,5,0.00000,'1685518320','1min',2),(321,4,3,1872.46000,1872.46000,1872.46000,1872.46000,1685518320,5,0.00000,'1685518320','1min',2),(322,6,3,89.48000,89.48000,89.48000,89.48000,1685518320,5,0.00000,'1685518320','1min',2),(323,8,3,0.88890,0.88890,0.88890,0.88890,1685518320,5,0.00000,'1685518320','1min',2),(324,10,3,112.61000,112.61000,112.61000,112.61000,1685518320,5,0.00000,'1685518320','1min',2),(325,2,3,27188.03000,27188.03000,27188.03000,27188.03000,1685518380,5,0.00259,'1685518380','1min',2),(326,4,3,1872.32000,1873.05000,1873.05000,1872.32000,1685518380,5,5.06908,'1685518380','1min',2),(327,6,3,89.51000,89.51000,89.51000,89.51000,1685518380,5,0.00000,'1685518380','1min',2),(328,8,3,0.88890,0.88890,0.88890,0.88890,1685518380,5,0.00000,'1685518380','1min',2),(329,10,3,112.61000,112.61000,112.61000,112.61000,1685518380,5,0.00000,'1685518380','1min',2),(330,6,3,89.55000,89.55000,89.55000,89.55000,1685518440,5,0.00000,'1685518440','1min',2),(331,2,3,27202.50000,27202.50000,27202.50000,27202.50000,1685518440,5,0.00259,'1685518440','1min',2),(332,4,3,1873.05000,1873.05000,1873.05000,1873.05000,1685518440,5,0.00000,'1685518440','1min',2),(333,8,3,0.88890,0.88890,0.88890,0.88890,1685518440,5,0.00000,'1685518440','1min',2),(334,10,3,112.60000,112.60000,112.60000,112.60000,1685518440,5,0.00000,'1685518440','1min',2),(335,2,3,27200.49000,27200.49000,27200.49000,27200.49000,1685518500,5,0.07732,'1685518500','1min',2),(336,4,3,1873.09000,1873.08000,1873.09000,1873.08000,1685518500,5,0.20000,'1685518500','1min',2),(337,6,3,89.59000,89.59000,89.59000,89.59000,1685518500,5,0.00000,'1685518500','1min',2),(338,8,3,0.88890,0.88890,0.88890,0.88890,1685518500,5,0.00000,'1685518500','1min',2),(339,10,3,112.60000,112.60000,112.60000,112.60000,1685518500,5,0.00000,'1685518500','1min',2),(340,6,3,89.55000,89.55000,89.55000,89.55000,1685518560,5,0.31250,'1685518560','1min',2),(341,8,3,0.88800,0.88800,0.88800,0.88800,1685518560,5,0.00000,'1685518560','1min',2),(342,10,3,112.60000,112.60000,112.60000,112.60000,1685518560,5,0.00000,'1685518560','1min',2),(343,2,3,27197.17000,27191.47000,27197.17000,27191.46000,1685518560,5,0.81780,'1685518560','1min',2),(344,4,3,1872.97000,1872.97000,1872.97000,1872.97000,1685518560,5,0.00000,'1685518560','1min',2),(345,2,3,27191.57000,27191.57000,27191.57000,27191.57000,1685518620,5,0.00000,'1685518620','1min',2),(346,4,3,1872.34000,1872.34000,1872.34000,1872.34000,1685518620,5,0.00000,'1685518620','1min',2),(347,8,3,0.88850,0.88850,0.88850,0.88850,1685518620,5,0.00000,'1685518620','1min',2),(348,10,3,112.60000,112.60000,112.60000,112.60000,1685518620,5,0.00000,'1685518620','1min',2),(349,6,3,89.55000,89.55000,89.55000,89.55000,1685518620,5,0.00000,'1685518620','1min',2),(350,8,3,0.88850,0.88850,0.88850,0.88850,1685518680,5,0.00000,'1685518680','1min',2),(351,2,3,27187.10000,27187.10000,27187.10000,27187.10000,1685518680,5,0.00000,'1685518680','1min',2),(352,4,3,1871.42000,1871.42000,1871.42000,1871.42000,1685518680,5,1.33210,'1685518680','1min',2),(353,6,3,89.51000,89.51000,89.51000,89.51000,1685518680,5,0.00000,'1685518680','1min',2),(354,10,3,112.57000,112.57000,112.57000,112.57000,1685518680,5,0.00000,'1685518680','1min',2),(355,10,3,112.57000,112.57000,112.57000,112.57000,1685518740,5,0.00000,'1685518740','1min',2),(356,2,3,27188.45000,27188.45000,27188.45000,27188.45000,1685518740,5,0.00000,'1685518740','1min',2),(357,4,3,1871.23000,1871.23000,1871.23000,1871.23000,1685518740,5,0.00000,'1685518740','1min',2),(358,8,3,0.88760,0.88750,0.88800,0.88750,1685518740,5,424.42460,'1685518740','1min',2),(359,6,3,89.51000,89.51000,89.51000,89.51000,1685518740,5,0.00000,'1685518740','1min',2),(360,2,3,27181.04000,27181.04000,27181.04000,27181.04000,1685518800,5,0.00000,'1685518800','1min',2),(361,4,3,1870.25000,1870.31000,1870.31000,1870.25000,1685518800,5,0.47670,'1685518800','1min',2),(362,6,3,89.49000,89.49000,89.49000,89.49000,1685518800,5,0.00000,'1685518800','1min',2),(363,8,3,0.88800,0.88800,0.88800,0.88800,1685518800,5,0.00000,'1685518800','1min',2),(364,10,3,112.58000,112.58000,112.58000,112.58000,1685518800,5,0.00000,'1685518800','1min',2),(365,2,3,27180.02000,27180.02000,27180.02000,27180.02000,1685518860,5,0.00000,'1685518860','1min',2),(366,4,3,1870.76000,1870.76000,1870.76000,1870.76000,1685518860,5,0.00000,'1685518860','1min',2),(367,6,3,89.44000,89.44000,89.44000,89.44000,1685518860,5,0.00000,'1685518860','1min',2),(368,8,3,0.88800,0.88800,0.88800,0.88800,1685518860,5,0.00000,'1685518860','1min',2),(369,10,3,112.54000,112.54000,112.54000,112.54000,1685518860,5,0.28420,'1685518860','1min',2),(370,4,3,1870.18000,1870.18000,1870.18000,1870.18000,1685518920,5,0.00000,'1685518920','1min',2),(371,6,3,89.33000,89.33000,89.33000,89.33000,1685518920,5,0.13430,'1685518920','1min',2),(372,8,3,0.88800,0.88800,0.88800,0.88800,1685518920,5,585.53500,'1685518920','1min',2),(373,10,3,112.51000,112.51000,112.51000,112.51000,1685518920,5,0.33310,'1685518920','1min',2),(374,2,3,27180.00000,27180.00000,27180.00000,27180.00000,1685518920,5,0.00000,'1685518920','1min',2),(375,10,3,112.51000,112.51000,112.51000,112.51000,1685518980,5,0.00000,'1685518980','1min',2),(376,2,3,27172.56000,27172.56000,27172.56000,27172.56000,1685518980,5,0.00279,'1685518980','1min',2),(377,4,3,1869.93000,1869.93000,1869.93000,1869.93000,1685518980,5,1.00000,'1685518980','1min',2),(378,6,3,89.29000,89.29000,89.29000,89.29000,1685518980,5,0.00000,'1685518980','1min',2),(379,8,3,0.88700,0.88700,0.88700,0.88700,1685518980,5,0.00000,'1685518980','1min',2),(380,2,3,27171.07000,27171.07000,27171.07000,27171.07000,1685519040,5,0.00000,'1685519040','1min',2),(381,4,3,1870.07000,1870.07000,1870.07000,1870.07000,1685519040,5,0.00000,'1685519040','1min',2),(382,6,3,89.29000,89.29000,89.29000,89.29000,1685519040,5,0.00000,'1685519040','1min',2),(383,8,3,0.88770,0.88770,0.88770,0.88770,1685519040,5,0.00000,'1685519040','1min',2),(384,10,3,112.51000,112.51000,112.51000,112.51000,1685519040,5,0.00000,'1685519040','1min',2),(385,10,3,112.51000,112.51000,112.51000,112.51000,1685519100,5,0.00000,'1685519100','1min',2),(386,4,3,1870.08000,1870.08000,1870.08000,1870.08000,1685519100,5,0.00000,'1685519100','1min',2),(387,6,3,89.23000,89.23000,89.23000,89.23000,1685519100,5,0.00000,'1685519100','1min',2),(388,8,3,0.88770,0.88770,0.88770,0.88770,1685519100,5,0.00000,'1685519100','1min',2),(389,2,3,27176.00000,27176.00000,27176.00000,27176.00000,1685519100,5,0.05383,'1685519100','1min',2),(390,4,3,1869.79000,1869.79000,1869.79000,1869.79000,1685519160,5,0.00000,'1685519160','1min',2),(391,6,3,89.21000,89.21000,89.21000,89.21000,1685519160,5,0.00000,'1685519160','1min',2),(392,8,3,0.88770,0.88770,0.88770,0.88770,1685519160,5,0.00000,'1685519160','1min',2),(393,2,3,27163.28000,27163.98000,27163.98000,27163.28000,1685519160,5,0.11885,'1685519160','1min',2),(394,10,3,112.55000,112.55000,112.55000,112.55000,1685519160,5,0.00000,'1685519160','1min',2),(395,8,3,0.88810,0.88810,0.88810,0.88810,1685519220,5,0.00000,'1685519220','1min',2),(396,10,3,112.55000,112.55000,112.55000,112.55000,1685519220,5,0.00000,'1685519220','1min',2),(397,2,3,27170.00000,27170.00000,27170.00000,27170.00000,1685519220,5,0.00564,'1685519220','1min',2),(398,4,3,1869.61000,1869.61000,1869.61000,1869.61000,1685519220,5,0.09010,'1685519220','1min',2),(399,6,3,89.21000,89.21000,89.21000,89.21000,1685519220,5,0.00000,'1685519220','1min',2),(400,2,3,27170.01000,27170.01000,27170.01000,27170.01000,1685519280,5,0.00000,'1685519280','1min',2),(401,4,3,1869.47000,1869.47000,1869.47000,1869.47000,1685519280,5,0.00680,'1685519280','1min',2),(402,6,3,89.23000,89.23000,89.23000,89.23000,1685519280,5,1.26680,'1685519280','1min',2),(403,8,3,0.88810,0.88810,0.88810,0.88810,1685519280,5,0.00000,'1685519280','1min',2),(404,10,3,112.55000,112.55000,112.55000,112.55000,1685519280,5,0.00000,'1685519280','1min',2),(405,8,3,0.88810,0.88810,0.88810,0.88810,1685519340,5,0.00000,'1685519340','1min',2),(406,10,3,112.55000,112.55000,112.55000,112.55000,1685519340,5,0.00000,'1685519340','1min',2),(407,2,3,27171.00000,27171.00000,27171.00000,27171.00000,1685519340,5,0.00000,'1685519340','1min',2),(408,4,3,1870.01000,1870.04000,1870.04000,1870.01000,1685519340,5,1.87190,'1685519340','1min',2),(409,6,3,89.22000,89.22000,89.22000,89.22000,1685519340,5,0.00000,'1685519340','1min',2),(410,6,3,89.28000,89.28000,89.28000,89.28000,1685519400,5,0.00000,'1685519400','1min',2),(411,8,3,0.88770,0.88770,0.88770,0.88770,1685519400,5,0.00000,'1685519400','1min',2),(412,10,3,112.55000,112.55000,112.55000,112.55000,1685519400,5,0.00000,'1685519400','1min',2),(413,2,3,27168.87000,27168.87000,27168.87000,27168.87000,1685519400,5,0.00000,'1685519400','1min',2),(414,4,3,1869.59000,1869.59000,1869.59000,1869.59000,1685519400,5,0.00000,'1685519400','1min',2),(415,4,3,1869.67000,1869.67000,1869.67000,1869.67000,1685519460,5,0.00000,'1685519460','1min',2),(416,6,3,89.31000,89.31000,89.31000,89.31000,1685519460,5,0.13420,'1685519460','1min',2),(417,10,3,112.52000,112.52000,112.52000,112.52000,1685519460,5,0.00000,'1685519460','1min',2),(418,2,3,27168.89000,27168.89000,27168.89000,27168.89000,1685519460,5,0.00000,'1685519460','1min',2),(419,8,3,0.88760,0.88760,0.88760,0.88760,1685519460,5,0.00000,'1685519460','1min',2),(420,10,3,112.56000,112.56000,112.56000,112.56000,1685519520,5,0.00000,'1685519520','1min',2),(421,2,3,27171.00000,27171.00000,27171.00000,27171.00000,1685519520,5,0.00000,'1685519520','1min',2),(422,4,3,1869.85000,1869.85000,1869.85000,1869.85000,1685519520,5,0.00000,'1685519520','1min',2),(423,6,3,89.31000,89.31000,89.31000,89.31000,1685519520,5,0.00000,'1685519520','1min',2),(424,8,3,0.88670,0.88670,0.88670,0.88670,1685519520,5,102.41130,'1685519520','1min',2),(425,2,3,27174.49000,27174.49000,27174.49000,27174.49000,1685519580,5,0.00177,'1685519580','1min',2),(426,4,3,1870.07000,1870.07000,1870.07000,1870.07000,1685519580,5,0.00000,'1685519580','1min',2),(427,6,3,89.37000,89.37000,89.37000,89.37000,1685519580,5,0.00000,'1685519580','1min',2),(428,8,3,0.88710,0.88710,0.88710,0.88710,1685519580,5,0.00000,'1685519580','1min',2),(429,10,3,112.59000,112.59000,112.59000,112.59000,1685519580,5,0.00000,'1685519580','1min',2),(430,8,3,0.88750,0.88720,0.88750,0.88720,1685519640,5,22.53370,'1685519640','1min',2),(431,10,3,112.59000,112.59000,112.59000,112.59000,1685519640,5,0.00000,'1685519640','1min',2),(432,2,3,27171.91000,27171.00000,27171.91000,27171.00000,1685519640,5,0.07392,'1685519640','1min',2),(433,4,3,1870.01000,1869.93000,1870.01000,1869.93000,1685519640,5,0.61130,'1685519640','1min',2),(434,6,3,89.37000,89.36000,89.37000,89.36000,1685519640,5,4.51950,'1685519640','1min',2),(435,6,3,89.31000,89.31000,89.31000,89.31000,1685519700,5,0.00000,'1685519700','1min',2),(436,10,3,112.59000,112.59000,112.59000,112.59000,1685519700,5,0.00000,'1685519700','1min',2),(437,2,3,27170.02000,27170.02000,27170.02000,27170.02000,1685519700,5,0.00000,'1685519700','1min',2),(438,4,3,1869.98000,1869.98000,1869.98000,1869.98000,1685519700,5,0.00000,'1685519700','1min',2),(439,8,3,0.88690,0.88690,0.88690,0.88690,1685519700,5,0.00000,'1685519700','1min',2),(440,2,3,27170.01000,27170.01000,27170.01000,27170.01000,1685519760,5,0.00377,'1685519760','1min',2),(441,4,3,1869.43000,1869.43000,1869.43000,1869.43000,1685519760,5,0.00000,'1685519760','1min',2),(442,6,3,89.29000,89.29000,89.29000,89.29000,1685519760,5,0.00000,'1685519760','1min',2),(443,8,3,0.88690,0.88690,0.88690,0.88690,1685519760,5,0.00000,'1685519760','1min',2),(444,10,3,112.59000,112.59000,112.59000,112.59000,1685519760,5,0.00000,'1685519760','1min',2),(445,4,3,1869.77000,1869.77000,1869.77000,1869.77000,1685519820,5,0.00000,'1685519820','1min',2),(446,6,3,89.25000,89.25000,89.25000,89.25000,1685519820,5,0.00000,'1685519820','1min',2),(447,8,3,0.88690,0.88690,0.88690,0.88690,1685519820,5,0.00000,'1685519820','1min',2),(448,10,3,112.59000,112.59000,112.59000,112.59000,1685519820,5,0.00000,'1685519820','1min',2),(449,2,3,27178.00000,27177.99000,27178.00000,27177.99000,1685519820,5,0.00473,'1685519820','1min',2),(450,8,3,0.88570,0.88570,0.88570,0.88570,1685519880,5,0.00000,'1685519880','1min',2),(451,2,3,27176.99000,27176.99000,27176.99000,27176.99000,1685519880,5,0.00050,'1685519880','1min',2),(452,4,3,1869.68000,1869.68000,1869.68000,1869.68000,1685519880,5,0.00000,'1685519880','1min',2),(453,6,3,89.21000,89.21000,89.21000,89.21000,1685519880,5,0.45660,'1685519880','1min',2),(454,10,3,112.55000,112.55000,112.55000,112.55000,1685519880,5,0.00000,'1685519880','1min',2),(455,8,3,0.88570,0.88570,0.88570,0.88570,1685519940,5,0.00000,'1685519940','1min',2),(456,10,3,112.55000,112.55000,112.55000,112.55000,1685519940,5,0.00000,'1685519940','1min',2),(457,2,3,27170.01000,27170.01000,27170.01000,27170.01000,1685519940,5,0.00000,'1685519940','1min',2),(458,4,3,1869.42000,1869.42000,1869.42000,1869.42000,1685519940,5,0.00000,'1685519940','1min',2),(459,6,3,89.21000,89.18000,89.21000,89.18000,1685519940,5,1.00000,'1685519940','1min',2),(460,10,3,112.55000,112.55000,112.55000,112.55000,1685520000,5,0.00000,'1685520000','1min',2),(461,2,3,27168.89000,27168.89000,27168.89000,27168.89000,1685520000,5,0.00000,'1685520000','1min',2),(462,4,3,1869.56000,1869.56000,1869.56000,1869.56000,1685520000,5,0.00000,'1685520000','1min',2),(463,6,3,89.14000,89.14000,89.14000,89.14000,1685520000,5,0.00000,'1685520000','1min',2),(464,8,3,0.88590,0.88590,0.88590,0.88590,1685520000,5,0.00000,'1685520000','1min',2),(465,2,3,27156.00000,27156.00000,27156.01000,27156.00000,1685520060,5,0.75543,'1685520060','1min',2),(466,4,3,1868.44000,1868.44000,1868.44000,1868.44000,1685520060,5,0.05120,'1685520060','1min',2),(467,6,3,89.15000,89.15000,89.15000,89.15000,1685520060,5,0.14760,'1685520060','1min',2),(468,8,3,0.88510,0.88510,0.88510,0.88510,1685520060,5,0.00000,'1685520060','1min',2),(469,10,3,112.55000,112.55000,112.55000,112.55000,1685520060,5,0.00000,'1685520060','1min',2),(470,8,3,0.88530,0.88530,0.88530,0.88530,1685520120,5,0.00000,'1685520120','1min',2),(471,10,3,112.63000,112.63000,112.63000,112.63000,1685520120,5,0.00000,'1685520120','1min',2),(472,2,3,27145.40000,27145.40000,27145.40000,27145.40000,1685520120,5,0.00000,'1685520120','1min',2),(473,4,3,1869.29000,1869.29000,1869.29000,1869.29000,1685520120,5,0.00630,'1685520120','1min',2),(474,6,3,89.21000,89.21000,89.21000,89.21000,1685520120,5,0.00000,'1685520120','1min',2),(475,2,3,27130.21000,27131.66000,27131.67000,27130.21000,1685520180,5,0.07433,'1685520180','1min',2),(476,4,3,1868.54000,1868.54000,1868.54000,1868.54000,1685520180,5,0.00000,'1685520180','1min',2),(477,6,3,89.19000,89.19000,89.19000,89.19000,1685520180,5,0.00000,'1685520180','1min',2),(478,8,3,0.88520,0.88520,0.88520,0.88520,1685520180,5,318.59810,'1685520180','1min',2),(479,10,3,112.63000,112.63000,112.63000,112.63000,1685520180,5,0.00000,'1685520180','1min',2),(480,2,3,27130.04000,27130.04000,27130.04000,27130.04000,1685520240,5,0.00000,'1685520240','1min',2),(481,4,3,1868.46000,1868.46000,1868.46000,1868.46000,1685520240,5,0.00000,'1685520240','1min',2),(482,6,3,89.20000,89.20000,89.20000,89.20000,1685520240,5,0.00000,'1685520240','1min',2),(483,8,3,0.88520,0.88520,0.88520,0.88520,1685520240,5,0.00000,'1685520240','1min',2),(484,10,3,112.62000,112.62000,112.62000,112.62000,1685520240,5,0.00000,'1685520240','1min',2),(485,6,3,89.19000,89.19000,89.19000,89.19000,1685520300,5,0.00000,'1685520300','1min',2),(486,2,3,27130.01000,27130.01000,27130.01000,27130.01000,1685520300,5,0.00375,'1685520300','1min',2),(487,4,3,1868.38000,1868.38000,1868.38000,1868.38000,1685520300,5,0.00000,'1685520300','1min',2),(488,8,3,0.88520,0.88520,0.88520,0.88520,1685520300,5,0.00000,'1685520300','1min',2),(489,10,3,112.62000,112.62000,112.62000,112.62000,1685520300,5,0.00000,'1685520300','1min',2),(490,2,3,27136.50000,27136.50000,27136.50000,27136.50000,1685520360,5,0.00000,'1685520360','1min',2),(491,4,3,1868.48000,1868.48000,1868.48000,1868.48000,1685520360,5,0.00000,'1685520360','1min',2),(492,6,3,89.29000,89.29000,89.29000,89.29000,1685520360,5,0.00000,'1685520360','1min',2),(493,8,3,0.88520,0.88520,0.88520,0.88520,1685520360,5,0.00000,'1685520360','1min',2),(494,10,3,112.63000,112.63000,112.63000,112.63000,1685520360,5,0.00000,'1685520360','1min',2),(495,6,3,89.30000,89.30000,89.30000,89.30000,1685520420,5,0.00000,'1685520420','1min',2),(496,8,3,0.88520,0.88520,0.88520,0.88520,1685520420,5,0.00000,'1685520420','1min',2),(497,10,3,112.77000,112.77000,112.77000,112.77000,1685520420,5,0.00000,'1685520420','1min',2),(498,2,3,27141.99000,27141.99000,27141.99000,27141.99000,1685520420,5,0.00085,'1685520420','1min',2),(499,4,3,1869.18000,1869.18000,1869.18000,1869.18000,1685520420,5,0.00000,'1685520420','1min',2),(500,8,3,0.88520,0.88520,0.88520,0.88520,1685520480,5,0.00000,'1685520480','1min',2),(501,2,3,27143.50000,27144.49000,27144.50000,27143.50000,1685520480,5,0.27855,'1685520480','1min',2),(502,4,3,1869.28000,1869.28000,1869.28000,1869.28000,1685520480,5,0.32230,'1685520480','1min',2),(503,6,3,89.30000,89.30000,89.30000,89.30000,1685520480,5,0.00000,'1685520480','1min',2),(504,10,3,112.77000,112.77000,112.77000,112.77000,1685520480,5,0.00000,'1685520480','1min',2),(505,8,3,0.88560,0.88560,0.88560,0.88560,1685520540,5,0.00000,'1685520540','1min',2),(506,10,3,112.77000,112.77000,112.77000,112.77000,1685520540,5,0.00000,'1685520540','1min',2),(507,2,3,27164.00000,27167.49000,27167.50000,27164.00000,1685520540,5,0.78460,'1685520540','1min',2),(508,6,3,89.33000,89.33000,89.33000,89.33000,1685520540,5,0.00000,'1685520540','1min',2),(509,4,3,1869.93000,1869.93000,1869.93000,1869.93000,1685520540,5,0.00000,'1685520540','1min',2),(510,2,3,27183.00000,27183.00000,27183.00000,27183.00000,1685520600,5,0.00000,'1685520600','1min',2),(511,4,3,1871.38000,1871.38000,1871.38000,1871.38000,1685520600,5,0.00000,'1685520600','1min',2),(512,6,3,89.39000,89.39000,89.39000,89.39000,1685520600,5,0.00000,'1685520600','1min',2),(513,8,3,0.88620,0.88620,0.88620,0.88620,1685520600,5,0.00000,'1685520600','1min',2),(514,10,3,112.77000,112.77000,112.77000,112.77000,1685520600,5,0.00000,'1685520600','1min',2),(515,2,3,27191.50000,27193.99000,27194.00000,27191.50000,1685520660,5,1.57796,'1685520660','1min',2),(516,4,3,1872.18000,1872.18000,1872.18000,1872.18000,1685520660,5,0.91000,'1685520660','1min',2),(517,6,3,89.39000,89.39000,89.39000,89.39000,1685520660,5,0.00000,'1685520660','1min',2),(518,8,3,0.88620,0.88620,0.88620,0.88620,1685520660,5,0.00000,'1685520660','1min',2),(519,10,3,112.82000,112.82000,112.82000,112.82000,1685520660,5,0.00000,'1685520660','1min',2),(520,8,3,0.88730,0.88730,0.88730,0.88730,1685520720,5,0.00000,'1685520720','1min',2),(521,10,3,112.79000,112.79000,112.79000,112.79000,1685520720,5,0.00000,'1685520720','1min',2),(522,2,3,27205.50000,27205.50000,27205.50000,27205.50000,1685520720,5,0.00000,'1685520720','1min',2),(523,4,3,1872.92000,1872.92000,1872.92000,1872.92000,1685520720,5,0.02970,'1685520720','1min',2),(524,6,3,89.43000,89.43000,89.43000,89.43000,1685520720,5,0.31290,'1685520720','1min',2),(525,10,3,112.79000,112.79000,112.79000,112.79000,1685520780,5,0.00000,'1685520780','1min',2),(526,2,3,27188.61000,27188.61000,27188.61000,27188.61000,1685520780,5,0.00236,'1685520780','1min',2),(527,4,3,1871.71000,1871.71000,1871.71000,1871.71000,1685520780,5,0.01000,'1685520780','1min',2),(528,6,3,89.35000,89.35000,89.35000,89.35000,1685520780,5,0.69030,'1685520780','1min',2),(529,8,3,0.88620,0.88620,0.88620,0.88620,1685520780,5,0.00000,'1685520780','1min',2),(530,6,3,89.34000,89.34000,89.34000,89.34000,1685520840,5,0.54110,'1685520840','1min',2),(531,8,3,0.88620,0.88620,0.88620,0.88620,1685520840,5,0.00000,'1685520840','1min',2),(532,10,3,112.77000,112.77000,112.77000,112.77000,1685520840,5,0.00000,'1685520840','1min',2),(533,2,3,27182.16000,27182.16000,27182.16000,27182.16000,1685520840,5,0.11600,'1685520840','1min',2),(534,4,3,1871.70000,1871.90000,1871.91000,1871.70000,1685520840,5,0.95049,'1685520840','1min',2),(535,10,3,112.77000,112.77000,112.77000,112.77000,1685520900,5,0.00000,'1685520900','1min',2),(536,2,3,27186.37000,27186.37000,27186.37000,27186.37000,1685520900,5,0.04114,'1685520900','1min',2),(537,4,3,1872.37000,1872.48000,1872.48000,1872.37000,1685520900,5,0.40000,'1685520900','1min',2),(538,6,3,89.40000,89.40000,89.40000,89.40000,1685520900,5,0.00000,'1685520900','1min',2),(539,8,3,0.88620,0.88620,0.88620,0.88620,1685520900,5,0.00000,'1685520900','1min',2),(540,6,3,89.36000,89.36000,89.36000,89.36000,1685520960,5,0.00000,'1685520960','1min',2),(541,8,3,0.88620,0.88620,0.88620,0.88620,1685520960,5,0.00000,'1685520960','1min',2),(542,10,3,112.77000,112.77000,112.77000,112.77000,1685520960,5,0.00000,'1685520960','1min',2),(543,2,3,27194.49000,27194.49000,27194.49000,27194.49000,1685520960,5,0.04808,'1685520960','1min',2),(544,4,3,1872.63000,1872.63000,1872.63000,1872.63000,1685520960,5,0.63720,'1685520960','1min',2),(545,8,3,0.88670,0.88670,0.88670,0.88670,1685521020,5,0.00000,'1685521020','1min',2),(546,10,3,112.77000,112.77000,112.77000,112.77000,1685521020,5,0.00000,'1685521020','1min',2),(547,2,3,27193.53000,27193.53000,27193.53000,27193.53000,1685521020,5,0.00000,'1685521020','1min',2),(548,4,3,1872.63000,1872.63000,1872.63000,1872.63000,1685521020,5,0.00000,'1685521020','1min',2),(549,6,3,89.42000,89.42000,89.42000,89.42000,1685521020,5,0.00000,'1685521020','1min',2),(550,8,3,0.88640,0.88640,0.88640,0.88640,1685521080,5,0.00000,'1685521080','1min',2),(551,10,3,112.77000,112.77000,112.77000,112.77000,1685521080,5,0.00000,'1685521080','1min',2),(552,2,3,27192.99000,27192.99000,27192.99000,27192.99000,1685521080,5,0.00000,'1685521080','1min',2),(553,4,3,1872.48000,1872.48000,1872.48000,1872.48000,1685521080,5,0.00000,'1685521080','1min',2),(554,6,3,89.41000,89.41000,89.41000,89.41000,1685521080,5,0.00000,'1685521080','1min',2),(555,10,3,112.77000,112.77000,112.77000,112.77000,1685521140,5,0.00000,'1685521140','1min',2),(556,2,3,27192.66000,27192.66000,27192.66000,27192.66000,1685521140,5,0.00000,'1685521140','1min',2),(557,4,3,1872.64000,1872.64000,1872.64000,1872.64000,1685521140,5,0.00000,'1685521140','1min',2),(558,8,3,0.88640,0.88640,0.88640,0.88640,1685521140,5,0.00000,'1685521140','1min',2),(559,6,3,89.43000,89.43000,89.43000,89.43000,1685521140,5,0.00000,'1685521140','1min',2),(560,6,3,89.35000,89.28000,89.35000,89.28000,1685521200,5,3.90460,'1685521200','1min',2),(561,8,3,0.88550,0.88510,0.88550,0.88510,1685521200,5,469.55680,'1685521200','1min',2),(562,10,3,112.70000,112.70000,112.70000,112.70000,1685521200,5,0.00000,'1685521200','1min',2),(563,2,3,27185.00000,27175.00000,27185.01000,27175.00000,1685521200,5,4.78725,'1685521200','1min',2),(564,4,3,1870.87000,1870.15000,1870.87000,1870.02000,1685521200,5,10.25170,'1685521200','1min',2),(565,4,3,1869.71000,1869.71000,1869.71000,1869.71000,1685521260,5,0.00000,'1685521260','1min',2),(566,6,3,89.23000,89.23000,89.23000,89.23000,1685521260,5,0.00000,'1685521260','1min',2),(567,8,3,0.88540,0.88540,0.88540,0.88540,1685521260,5,0.00000,'1685521260','1min',2),(568,10,3,112.63000,112.63000,112.63000,112.63000,1685521260,5,0.00000,'1685521260','1min',2),(569,2,3,27168.83000,27168.83000,27168.83000,27168.83000,1685521260,5,0.00000,'1685521260','1min',2),(570,2,3,27168.00000,27168.50000,27168.50000,27168.00000,1685521320,5,0.06019,'1685521320','1min',2),(571,4,3,1870.00000,1870.00000,1870.00000,1870.00000,1685521320,5,0.01700,'1685521320','1min',2),(572,6,3,89.41000,89.41000,89.41000,89.41000,1685521320,5,1.25240,'1685521320','1min',2),(573,8,3,0.88620,0.88620,0.88620,0.88620,1685521320,5,0.00000,'1685521320','1min',2),(574,10,3,112.63000,112.63000,112.63000,112.63000,1685521320,5,0.00000,'1685521320','1min',2),(575,6,3,89.47000,89.47000,89.47000,89.47000,1685521380,5,0.00000,'1685521380','1min',2),(576,8,3,0.88670,0.88670,0.88670,0.88670,1685521380,5,0.00000,'1685521380','1min',2),(577,10,3,112.64000,112.64000,112.64000,112.64000,1685521380,5,0.00000,'1685521380','1min',2),(578,2,3,27179.11000,27179.11000,27179.11000,27179.11000,1685521380,5,0.01345,'1685521380','1min',2),(579,4,3,1870.63000,1870.63000,1870.63000,1870.63000,1685521380,5,0.00000,'1685521380','1min',2),(580,6,3,89.53000,89.53000,89.53000,89.53000,1685521440,5,0.00000,'1685521440','1min',2),(581,8,3,0.88670,0.88670,0.88670,0.88670,1685521440,5,0.00000,'1685521440','1min',2),(582,10,3,112.64000,112.64000,112.64000,112.64000,1685521440,5,0.00000,'1685521440','1min',2),(583,2,3,27165.95000,27165.95000,27165.95000,27165.95000,1685521440,5,0.00000,'1685521440','1min',2),(584,4,3,1869.72000,1869.72000,1869.72000,1869.72000,1685521440,5,0.00000,'1685521440','1min',2),(585,8,3,0.88670,0.88670,0.88670,0.88670,1685521500,5,0.00000,'1685521500','1min',2),(586,4,3,1870.22000,1870.22000,1870.22000,1870.22000,1685521500,5,0.00000,'1685521500','1min',2),(587,6,3,89.54000,89.54000,89.54000,89.54000,1685521500,5,1.06050,'1685521500','1min',2),(588,10,3,112.64000,112.64000,112.64000,112.64000,1685521500,5,0.00000,'1685521500','1min',2),(589,2,3,27163.35000,27163.35000,27163.35000,27163.35000,1685521500,5,0.02696,'1685521500','1min',2),(590,6,3,89.55000,89.55000,89.55000,89.55000,1685521560,5,0.00000,'1685521560','1min',2),(591,8,3,0.88670,0.88670,0.88670,0.88670,1685521560,5,0.00000,'1685521560','1min',2),(592,10,3,112.64000,112.64000,112.64000,112.64000,1685521560,5,0.00000,'1685521560','1min',2),(593,2,3,27165.50000,27165.50000,27165.50000,27165.50000,1685521560,5,0.00000,'1685521560','1min',2),(594,4,3,1870.54000,1870.54000,1870.54000,1870.54000,1685521560,5,0.00000,'1685521560','1min',2),(595,2,3,27165.50000,27165.50000,27165.50000,27165.50000,1685521620,5,0.00388,'1685521620','1min',2),(596,4,3,1870.36000,1870.36000,1870.36000,1870.36000,1685521620,5,0.85450,'1685521620','1min',2),(597,6,3,89.50000,89.50000,89.50000,89.50000,1685521620,5,0.83450,'1685521620','1min',2),(598,8,3,0.88640,0.88630,0.88640,0.88630,1685521620,5,790.79190,'1685521620','1min',2),(599,10,3,112.67000,112.67000,112.67000,112.67000,1685521620,5,0.00000,'1685521620','1min',2),(600,6,3,89.48000,89.48000,89.48000,89.48000,1685521680,5,0.00000,'1685521680','1min',2),(601,8,3,0.88590,0.88590,0.88590,0.88590,1685521680,5,0.00000,'1685521680','1min',2),(602,10,3,112.67000,112.67000,112.67000,112.67000,1685521680,5,0.00000,'1685521680','1min',2),(603,2,3,27155.53000,27155.53000,27155.53000,27155.53000,1685521680,5,0.00213,'1685521680','1min',2),(604,4,3,1870.14000,1870.14000,1870.14000,1870.14000,1685521680,5,0.00000,'1685521680','1min',2),(605,6,3,89.50000,89.50000,89.50000,89.50000,1685521740,5,0.00000,'1685521740','1min',2),(606,2,3,27157.29000,27157.29000,27157.29000,27157.29000,1685521740,5,0.00000,'1685521740','1min',2),(607,4,3,1870.19000,1870.19000,1870.19000,1870.19000,1685521740,5,0.00000,'1685521740','1min',2),(608,8,3,0.88590,0.88590,0.88590,0.88590,1685521740,5,0.00000,'1685521740','1min',2),(609,10,3,112.67000,112.67000,112.67000,112.67000,1685521740,5,0.00000,'1685521740','1min',2),(610,8,3,0.88590,0.88590,0.88590,0.88590,1685521800,5,0.00000,'1685521800','1min',2),(611,10,3,112.67000,112.67000,112.67000,112.67000,1685521800,5,0.00000,'1685521800','1min',2),(612,2,3,27156.10000,27156.10000,27156.10000,27156.10000,1685521800,5,0.24676,'1685521800','1min',2),(613,4,3,1870.49000,1870.51000,1870.79000,1870.49000,1685521800,5,62.49770,'1685521800','1min',2),(614,6,3,89.50000,89.50000,89.50000,89.50000,1685521800,5,0.74670,'1685521800','1min',2),(615,2,3,27153.97000,27153.97000,27153.97000,27153.97000,1685521860,5,0.00000,'1685521860','1min',2),(616,4,3,1870.44000,1870.44000,1870.44000,1870.44000,1685521860,5,0.00000,'1685521860','1min',2),(617,6,3,89.51000,89.51000,89.51000,89.51000,1685521860,5,0.00000,'1685521860','1min',2),(618,8,3,0.88650,0.88650,0.88650,0.88650,1685521860,5,0.00000,'1685521860','1min',2),(619,10,3,112.67000,112.67000,112.67000,112.67000,1685521860,5,0.00000,'1685521860','1min',2),(620,4,3,1870.51000,1870.51000,1870.51000,1870.51000,1685521920,5,0.00000,'1685521920','1min',2),(621,6,3,89.58000,89.58000,89.58000,89.58000,1685521920,5,0.00000,'1685521920','1min',2),(622,8,3,0.88730,0.88730,0.88730,0.88730,1685521920,5,0.00000,'1685521920','1min',2),(623,10,3,112.76000,112.76000,112.76000,112.76000,1685521920,5,0.00000,'1685521920','1min',2),(624,2,3,27163.49000,27163.50000,27163.50000,27163.49000,1685521920,5,0.10811,'1685521920','1min',2),(625,6,3,89.53000,89.53000,89.53000,89.53000,1685521980,5,0.00000,'1685521980','1min',2),(626,8,3,0.88730,0.88730,0.88730,0.88730,1685521980,5,0.00000,'1685521980','1min',2),(627,10,3,112.76000,112.76000,112.76000,112.76000,1685521980,5,0.00000,'1685521980','1min',2),(628,2,3,27168.00000,27168.49000,27168.50000,27167.99000,1685521980,5,0.73680,'1685521980','1min',2),(629,4,3,1870.51000,1870.51000,1870.51000,1870.51000,1685521980,5,0.00000,'1685521980','1min',2),(630,2,3,27172.86000,27172.86000,27172.86000,27172.86000,1685522040,5,0.00000,'1685522040','1min',2),(631,4,3,1870.73000,1870.73000,1870.73000,1870.73000,1685522040,5,0.00000,'1685522040','1min',2),(632,6,3,89.53000,89.53000,89.53000,89.53000,1685522040,5,0.00000,'1685522040','1min',2),(633,8,3,0.88730,0.88730,0.88730,0.88730,1685522040,5,0.00000,'1685522040','1min',2),(634,10,3,112.76000,112.76000,112.76000,112.76000,1685522040,5,0.00000,'1685522040','1min',2),(635,4,3,1870.74000,1870.74000,1870.74000,1870.74000,1685522100,5,0.00000,'1685522100','1min',2),(636,6,3,89.51000,89.51000,89.51000,89.51000,1685522100,5,0.00000,'1685522100','1min',2),(637,8,3,0.88730,0.88730,0.88730,0.88730,1685522100,5,0.00000,'1685522100','1min',2),(638,10,3,112.76000,112.76000,112.76000,112.76000,1685522100,5,0.00000,'1685522100','1min',2),(639,2,3,27171.50000,27171.50000,27171.50000,27171.50000,1685522100,5,0.00000,'1685522100','1min',2),(640,2,3,27173.50000,27173.50000,27173.50000,27173.50000,1685522160,5,0.11308,'1685522160','1min',2),(641,4,3,1870.63000,1870.63000,1870.63000,1870.63000,1685522160,5,0.00000,'1685522160','1min',2),(642,6,3,89.51000,89.51000,89.51000,89.51000,1685522160,5,0.00000,'1685522160','1min',2),(643,8,3,0.88730,0.88730,0.88730,0.88730,1685522160,5,0.00000,'1685522160','1min',2),(644,10,3,112.71000,112.71000,112.71000,112.71000,1685522160,5,0.00000,'1685522160','1min',2),(645,4,3,1871.17000,1871.17000,1871.17000,1871.17000,1685522220,5,0.00000,'1685522220','1min',2),(646,6,3,89.55000,89.55000,89.55000,89.55000,1685522220,5,0.00000,'1685522220','1min',2),(647,8,3,0.88770,0.88770,0.88770,0.88770,1685522220,5,0.00000,'1685522220','1min',2),(648,10,3,112.76000,112.76000,112.76000,112.76000,1685522220,5,0.00000,'1685522220','1min',2),(649,2,3,27180.99000,27180.99000,27180.99000,27180.99000,1685522220,5,0.02251,'1685522220','1min',2),(650,8,3,0.88770,0.88770,0.88770,0.88770,1685522280,5,0.00000,'1685522280','1min',2),(651,4,3,1871.18000,1871.18000,1871.18000,1871.18000,1685522280,5,0.00000,'1685522280','1min',2),(652,6,3,89.52000,89.52000,89.52000,89.52000,1685522280,5,0.00000,'1685522280','1min',2),(653,10,3,112.75000,112.75000,112.75000,112.75000,1685522280,5,0.00000,'1685522280','1min',2),(654,2,3,27175.01000,27175.01000,27175.01000,27175.01000,1685522280,5,0.01824,'1685522280','1min',2),(655,2,3,27175.50000,27175.50000,27175.50000,27175.50000,1685522340,5,0.00000,'1685522340','1min',2),(656,4,3,1871.06000,1871.06000,1871.06000,1871.06000,1685522340,5,0.00000,'1685522340','1min',2),(657,6,3,89.52000,89.52000,89.52000,89.52000,1685522340,5,0.00000,'1685522340','1min',2),(658,8,3,0.88670,0.88670,0.88670,0.88670,1685522340,5,0.00000,'1685522340','1min',2),(659,10,3,112.75000,112.75000,112.75000,112.75000,1685522340,5,0.00000,'1685522340','1min',2),(660,4,3,1869.20000,1869.20000,1869.20000,1869.20000,1685522400,5,0.00000,'1685522400','1min',2),(661,6,3,89.48000,89.48000,89.48000,89.48000,1685522400,5,0.98810,'1685522400','1min',2),(662,8,3,0.88570,0.88570,0.88570,0.88570,1685522400,5,0.00000,'1685522400','1min',2),(663,10,3,112.71000,112.71000,112.71000,112.71000,1685522400,5,0.00000,'1685522400','1min',2),(664,2,3,27150.01000,27150.01000,27150.01000,27150.01000,1685522400,5,0.00000,'1685522400','1min',2),(665,8,3,0.88500,0.88500,0.88500,0.88500,1685522460,5,0.00000,'1685522460','1min',2),(666,10,3,112.69000,112.69000,112.69000,112.69000,1685522460,5,0.00000,'1685522460','1min',2),(667,2,3,27140.77000,27141.49000,27141.68000,27140.77000,1685522460,5,0.99076,'1685522460','1min',2),(668,4,3,1868.54000,1868.54000,1868.54000,1868.54000,1685522460,5,0.05050,'1685522460','1min',2),(669,6,3,89.43000,89.43000,89.43000,89.43000,1685522460,5,0.66360,'1685522460','1min',2),(670,8,3,0.88500,0.88500,0.88500,0.88500,1685522520,5,0.00000,'1685522520','1min',2),(671,2,3,27135.01000,27135.01000,27135.01000,27135.01000,1685522520,5,0.00400,'1685522520','1min',2),(672,4,3,1868.54000,1868.54000,1868.54000,1868.54000,1685522520,5,0.00000,'1685522520','1min',2),(673,6,3,89.47000,89.47000,89.47000,89.47000,1685522520,5,0.88370,'1685522520','1min',2),(674,10,3,112.69000,112.69000,112.69000,112.69000,1685522520,5,0.00000,'1685522520','1min',2),(675,8,3,0.88480,0.88480,0.88480,0.88480,1685522580,5,0.00000,'1685522580','1min',2),(676,10,3,112.67000,112.67000,112.67000,112.67000,1685522580,5,0.00000,'1685522580','1min',2),(677,2,3,27129.16000,27129.16000,27129.16000,27129.16000,1685522580,5,0.00487,'1685522580','1min',2),(678,4,3,1868.05000,1868.05000,1868.05000,1868.05000,1685522580,5,0.00000,'1685522580','1min',2),(679,6,3,89.45000,89.45000,89.45000,89.45000,1685522580,5,0.80060,'1685522580','1min',2),(680,2,3,27125.30000,27125.30000,27125.30000,27125.30000,1685522640,5,0.00000,'1685522640','1min',2),(681,4,3,1867.86000,1867.86000,1867.86000,1867.86000,1685522640,5,0.12000,'1685522640','1min',2),(682,6,3,89.43000,89.43000,89.43000,89.43000,1685522640,5,0.65090,'1685522640','1min',2),(683,8,3,0.88480,0.88480,0.88480,0.88480,1685522640,5,0.00000,'1685522640','1min',2),(684,10,3,112.67000,112.67000,112.67000,112.67000,1685522640,5,0.00000,'1685522640','1min',2),(685,8,3,0.88390,0.88390,0.88390,0.88390,1685522700,5,0.00000,'1685522700','1min',2),(686,10,3,112.67000,112.67000,112.67000,112.67000,1685522700,5,0.00000,'1685522700','1min',2),(687,2,3,27120.00000,27120.00000,27120.00000,27120.00000,1685522700,5,0.00000,'1685522700','1min',2),(688,4,3,1867.86000,1867.86000,1867.86000,1867.86000,1685522700,5,0.00000,'1685522700','1min',2),(689,6,3,89.37000,89.37000,89.37000,89.37000,1685522700,5,0.00000,'1685522700','1min',2),(690,2,3,27123.50000,27123.50000,27123.50000,27123.50000,1685522760,5,0.00000,'1685522760','1min',2),(691,4,3,1868.83000,1868.83000,1868.83000,1868.83000,1685522760,5,0.07940,'1685522760','1min',2),(692,6,3,89.42000,89.42000,89.42000,89.42000,1685522760,5,0.00000,'1685522760','1min',2),(693,8,3,0.88480,0.88480,0.88480,0.88480,1685522760,5,0.00000,'1685522760','1min',2),(694,10,3,112.63000,112.63000,112.63000,112.63000,1685522760,5,0.00000,'1685522760','1min',2),(695,10,3,112.66000,112.66000,112.66000,112.66000,1685522820,5,0.00000,'1685522820','1min',2),(696,2,3,27129.47000,27129.47000,27129.47000,27129.47000,1685522820,5,0.00000,'1685522820','1min',2),(697,4,3,1869.33000,1869.33000,1869.33000,1869.33000,1685522820,5,0.00000,'1685522820','1min',2),(698,6,3,89.41000,89.41000,89.41000,89.41000,1685522820,5,0.00000,'1685522820','1min',2),(699,8,3,0.88480,0.88480,0.88480,0.88480,1685522820,5,0.00000,'1685522820','1min',2),(700,10,3,112.66000,112.66000,112.66000,112.66000,1685522880,5,0.00000,'1685522880','1min',2),(701,2,3,27129.49000,27129.49000,27129.49000,27129.49000,1685522880,5,0.00000,'1685522880','1min',2),(702,6,3,89.41000,89.41000,89.41000,89.41000,1685522880,5,0.00000,'1685522880','1min',2),(703,8,3,0.88510,0.88510,0.88510,0.88510,1685522880,5,0.00000,'1685522880','1min',2),(704,4,3,1869.85000,1869.85000,1869.85000,1869.85000,1685522880,5,0.00000,'1685522880','1min',2),(705,2,3,27131.00000,27133.00000,27134.04000,27131.00000,1685522940,5,0.78549,'1685522940','1min',2),(706,6,3,89.45000,89.46000,89.46000,89.45000,1685522940,5,3.35040,'1685522940','1min',2),(707,8,3,0.88590,0.88590,0.88590,0.88590,1685522940,5,0.00000,'1685522940','1min',2),(708,10,3,112.66000,112.66000,112.66000,112.66000,1685522940,5,0.00000,'1685522940','1min',2),(709,4,3,1869.86000,1869.86000,1869.86000,1869.86000,1685522940,5,0.00000,'1685522940','1min',2),(710,8,3,0.88570,0.88570,0.88570,0.88570,1685523000,5,0.00000,'1685523000','1min',2),(711,10,3,112.66000,112.66000,112.66000,112.66000,1685523000,5,0.00000,'1685523000','1min',2),(712,2,3,27133.39000,27133.39000,27133.39000,27133.39000,1685523000,5,0.00500,'1685523000','1min',2),(713,4,3,1869.31000,1869.31000,1869.31000,1869.31000,1685523000,5,0.00000,'1685523000','1min',2),(714,6,3,89.42000,89.42000,89.42000,89.42000,1685523000,5,0.57780,'1685523000','1min',2),(715,8,3,0.88530,0.88530,0.88530,0.88530,1685523060,5,0.00000,'1685523060','1min',2),(716,2,3,27125.01000,27125.01000,27125.01000,27125.01000,1685523060,5,0.00000,'1685523060','1min',2),(717,4,3,1869.13000,1869.13000,1869.13000,1869.13000,1685523060,5,0.00000,'1685523060','1min',2),(718,6,3,89.40000,89.40000,89.40000,89.40000,1685523060,5,0.00000,'1685523060','1min',2),(719,10,3,112.66000,112.66000,112.66000,112.66000,1685523060,5,0.00000,'1685523060','1min',2),(720,2,3,27124.35000,27124.35000,27124.35000,27124.35000,1685523120,5,0.00000,'1685523120','1min',2),(721,4,3,1868.94000,1868.94000,1868.94000,1868.94000,1685523120,5,0.00000,'1685523120','1min',2),(722,6,3,89.46000,89.46000,89.46000,89.46000,1685523120,5,0.00000,'1685523120','1min',2),(723,8,3,0.88540,0.88540,0.88540,0.88540,1685523120,5,0.00000,'1685523120','1min',2),(724,10,3,112.66000,112.66000,112.66000,112.66000,1685523120,5,0.00000,'1685523120','1min',2),(725,6,3,89.46000,89.46000,89.46000,89.46000,1685523180,5,0.00000,'1685523180','1min',2),(726,8,3,0.88540,0.88540,0.88540,0.88540,1685523180,5,0.00000,'1685523180','1min',2),(727,10,3,112.62000,112.62000,112.62000,112.62000,1685523180,5,0.00000,'1685523180','1min',2),(728,2,3,27131.00000,27132.00000,27132.00000,27131.00000,1685523180,5,0.22628,'1685523180','1min',2),(729,4,3,1869.90000,1869.90000,1869.90000,1869.90000,1685523180,5,0.44140,'1685523180','1min',2),(730,8,3,0.88540,0.88540,0.88540,0.88540,1685523240,5,0.00000,'1685523240','1min',2),(731,10,3,112.62000,112.62000,112.62000,112.62000,1685523240,5,0.00000,'1685523240','1min',2),(732,2,3,27130.26000,27130.26000,27130.26000,27130.26000,1685523240,5,0.00000,'1685523240','1min',2),(733,4,3,1869.35000,1869.35000,1869.35000,1869.35000,1685523240,5,0.00000,'1685523240','1min',2),(734,6,3,89.46000,89.46000,89.46000,89.46000,1685523240,5,0.00000,'1685523240','1min',2),(735,2,3,27115.71000,27115.71000,27115.71000,27115.71000,1685523300,5,0.00000,'1685523300','1min',2),(736,4,3,1867.35000,1867.35000,1867.35000,1867.35000,1685523300,5,0.04810,'1685523300','1min',2),(737,6,3,89.36000,89.36000,89.36000,89.36000,1685523300,5,0.00000,'1685523300','1min',2),(738,10,3,112.50000,112.50000,112.50000,112.50000,1685523300,5,0.00000,'1685523300','1min',2),(739,8,3,0.88390,0.88390,0.88390,0.88390,1685523300,5,0.00000,'1685523300','1min',2),(740,2,3,27120.50000,27120.50000,27120.50000,27120.50000,1685523360,5,0.01500,'1685523360','1min',2),(741,4,3,1867.93000,1867.93000,1867.93000,1867.93000,1685523360,5,0.00000,'1685523360','1min',2),(742,8,3,0.88350,0.88350,0.88350,0.88350,1685523360,5,0.00000,'1685523360','1min',2),(743,10,3,112.30000,112.30000,112.30000,112.30000,1685523360,5,0.00000,'1685523360','1min',2),(744,6,3,89.35000,89.35000,89.35000,89.35000,1685523360,5,0.00000,'1685523360','1min',2),(745,8,3,0.88350,0.88350,0.88350,0.88350,1685523420,5,0.00000,'1685523420','1min',2),(746,10,3,112.30000,112.30000,112.30000,112.30000,1685523420,5,0.00000,'1685523420','1min',2),(747,4,3,1868.66000,1868.66000,1868.66000,1868.66000,1685523420,5,0.00000,'1685523420','1min',2),(748,2,3,27131.99000,27131.99000,27131.99000,27131.99000,1685523420,5,0.00000,'1685523420','1min',2),(749,6,3,89.37000,89.37000,89.37000,89.37000,1685523420,5,0.00000,'1685523420','1min',2),(750,6,3,89.41000,89.41000,89.41000,89.41000,1685523480,5,0.00000,'1685523480','1min',2),(751,8,3,0.88380,0.88380,0.88380,0.88380,1685523480,5,0.00000,'1685523480','1min',2),(752,10,3,112.46000,112.46000,112.46000,112.46000,1685523480,5,0.78250,'1685523480','1min',2),(753,2,3,27143.00000,27144.00000,27144.00000,27143.00000,1685523480,5,0.22802,'1685523480','1min',2),(754,4,3,1868.85000,1868.85000,1868.85000,1868.85000,1685523480,5,0.00000,'1685523480','1min',2),(755,8,3,0.88360,0.88360,0.88360,0.88360,1685523540,5,0.00000,'1685523540','1min',2),(756,2,3,27132.06000,27132.05000,27132.06000,27132.05000,1685523540,5,0.02553,'1685523540','1min',2),(757,4,3,1868.42000,1868.42000,1868.42000,1868.42000,1685523540,5,0.00000,'1685523540','1min',2),(758,6,3,89.37000,89.35000,89.37000,89.35000,1685523540,5,1.69900,'1685523540','1min',2),(759,10,3,112.46000,112.46000,112.46000,112.46000,1685523540,5,0.00000,'1685523540','1min',2),(760,10,3,112.46000,112.46000,112.46000,112.46000,1685523600,5,0.00000,'1685523600','1min',2),(761,2,3,27137.83000,27136.94000,27137.83000,27136.94000,1685523600,5,0.01711,'1685523600','1min',2),(762,4,3,1868.27000,1868.27000,1868.27000,1868.27000,1685523600,5,0.00000,'1685523600','1min',2),(763,6,3,89.33000,89.33000,89.33000,89.33000,1685523600,5,0.00000,'1685523600','1min',2),(764,8,3,0.88360,0.88360,0.88360,0.88360,1685523600,5,0.00000,'1685523600','1min',2),(765,4,3,1868.01000,1868.01000,1868.01000,1868.01000,1685523660,5,0.00000,'1685523660','1min',2),(766,6,3,89.27000,89.27000,89.27000,89.27000,1685523660,5,0.00000,'1685523660','1min',2),(767,8,3,0.88300,0.88300,0.88300,0.88300,1685523660,5,0.00000,'1685523660','1min',2),(768,10,3,112.37000,112.37000,112.37000,112.37000,1685523660,5,0.00000,'1685523660','1min',2),(769,2,3,27130.31000,27130.31000,27130.31000,27130.31000,1685523660,5,0.00354,'1685523660','1min',2),(770,10,3,112.37000,112.37000,112.37000,112.37000,1685523720,5,0.00000,'1685523720','1min',2),(771,2,3,27130.00000,27130.00000,27130.00000,27130.00000,1685523720,5,0.00281,'1685523720','1min',2),(772,4,3,1867.72000,1867.72000,1867.72000,1867.72000,1685523720,5,0.05750,'1685523720','1min',2),(773,6,3,89.19000,89.21000,89.21000,89.19000,1685523720,5,0.75880,'1685523720','1min',2),(774,8,3,0.88320,0.88320,0.88320,0.88320,1685523720,5,0.00000,'1685523720','1min',2),(775,2,3,27125.01000,27125.01000,27125.01000,27125.01000,1685523780,5,0.00000,'1685523780','1min',2),(776,4,3,1866.70000,1866.70000,1866.70000,1866.70000,1685523780,5,0.00000,'1685523780','1min',2),(777,6,3,89.16000,89.16000,89.16000,89.16000,1685523780,5,0.88780,'1685523780','1min',2),(778,8,3,0.88300,0.88300,0.88300,0.88300,1685523780,5,135.93090,'1685523780','1min',2),(779,10,3,112.33000,112.33000,112.33000,112.33000,1685523780,5,0.00000,'1685523780','1min',2),(780,4,3,1867.12000,1867.12000,1867.12000,1867.12000,1685523840,5,0.00000,'1685523840','1min',2),(781,6,3,89.15000,89.15000,89.15000,89.15000,1685523840,5,0.00000,'1685523840','1min',2),(782,8,3,0.88300,0.88300,0.88300,0.88300,1685523840,5,0.00000,'1685523840','1min',2),(783,10,3,112.33000,112.33000,112.33000,112.33000,1685523840,5,0.00000,'1685523840','1min',2),(784,2,3,27125.01000,27125.00000,27125.01000,27125.00000,1685523840,5,0.26392,'1685523840','1min',2),(785,8,3,0.88310,0.88310,0.88310,0.88310,1685523900,5,0.00000,'1685523900','1min',2),(786,2,3,27123.98000,27123.98000,27123.98000,27123.98000,1685523900,5,0.01937,'1685523900','1min',2),(787,4,3,1867.31000,1867.31000,1867.31000,1867.31000,1685523900,5,0.00000,'1685523900','1min',2),(788,6,3,89.20000,89.20000,89.20000,89.20000,1685523900,5,0.00000,'1685523900','1min',2),(789,10,3,112.44000,112.44000,112.44000,112.44000,1685523900,5,0.00000,'1685523900','1min',2),(790,4,3,1867.87000,1867.87000,1867.87000,1867.87000,1685523960,5,0.00000,'1685523960','1min',2),(791,6,3,89.28000,89.28000,89.28000,89.28000,1685523960,5,0.53750,'1685523960','1min',2),(792,8,3,0.88310,0.88310,0.88310,0.88310,1685523960,5,0.00000,'1685523960','1min',2),(793,10,3,112.50000,112.50000,112.50000,112.50000,1685523960,5,0.49770,'1685523960','1min',2),(794,2,3,27124.50000,27124.50000,27124.50000,27124.49000,1685523960,5,0.05409,'1685523960','1min',2),(795,8,3,0.88310,0.88310,0.88310,0.88310,1685524020,5,0.00000,'1685524020','1min',2),(796,10,3,112.50000,112.50000,112.50000,112.50000,1685524020,5,0.00000,'1685524020','1min',2),(797,2,3,27124.00000,27124.00000,27124.00000,27124.00000,1685524020,5,0.00827,'1685524020','1min',2),(798,4,3,1869.33000,1869.33000,1869.33000,1869.33000,1685524020,5,0.01000,'1685524020','1min',2),(799,6,3,89.29000,89.29000,89.29000,89.29000,1685524020,5,0.00000,'1685524020','1min',2),(800,10,3,112.50000,112.50000,112.50000,112.50000,1685524080,5,0.00000,'1685524080','1min',2),(801,2,3,27138.32000,27138.32000,27138.32000,27138.32000,1685524080,5,0.12870,'1685524080','1min',2),(802,6,3,89.33000,89.33000,89.33000,89.33000,1685524080,5,0.00000,'1685524080','1min',2),(803,8,3,0.88440,0.88440,0.88440,0.88440,1685524080,5,0.00000,'1685524080','1min',2),(804,4,3,1869.75000,1869.75000,1869.75000,1869.75000,1685524080,5,0.00000,'1685524080','1min',2),(805,6,3,89.43000,89.43000,89.43000,89.43000,1685524140,5,0.00000,'1685524140','1min',2),(806,2,3,27150.00000,27150.00000,27150.00000,27150.00000,1685524140,5,0.03794,'1685524140','1min',2),(807,8,3,0.88470,0.88470,0.88470,0.88470,1685524140,5,0.00000,'1685524140','1min',2),(808,4,3,1870.78000,1870.78000,1870.78000,1870.78000,1685524140,5,0.11120,'1685524140','1min',2),(809,10,3,112.63000,112.63000,112.63000,112.63000,1685524140,5,0.00000,'1685524140','1min',2),(810,6,3,89.38000,89.36000,89.38000,89.36000,1685524200,5,1.14050,'1685524200','1min',2),(811,8,3,0.88440,0.88440,0.88440,0.88440,1685524200,5,0.00000,'1685524200','1min',2),(812,10,3,112.63000,112.63000,112.63000,112.63000,1685524200,5,0.00000,'1685524200','1min',2),(813,2,3,27145.39000,27145.39000,27145.39000,27145.39000,1685524200,5,0.00372,'1685524200','1min',2),(814,4,3,1869.82000,1869.82000,1869.82000,1869.82000,1685524200,5,0.00000,'1685524200','1min',2),(815,4,3,1870.40000,1870.40000,1870.40000,1870.40000,1685524260,5,0.00000,'1685524260','1min',2),(816,6,3,89.38000,89.38000,89.38000,89.38000,1685524260,5,0.00000,'1685524260','1min',2),(817,8,3,0.88440,0.88440,0.88440,0.88440,1685524260,5,0.00000,'1685524260','1min',2),(818,10,3,112.75000,112.75000,112.75000,112.75000,1685524260,5,0.00000,'1685524260','1min',2),(819,2,3,27142.99000,27142.99000,27142.99000,27142.99000,1685524260,5,0.03826,'1685524260','1min',2),(820,8,3,0.88440,0.88440,0.88440,0.88440,1685524320,5,0.00000,'1685524320','1min',2),(821,2,3,27140.01000,27140.01000,27140.01000,27140.01000,1685524320,5,0.00356,'1685524320','1min',2),(822,4,3,1869.82000,1869.82000,1869.82000,1869.82000,1685524320,5,0.00000,'1685524320','1min',2),(823,6,3,89.39000,89.39000,89.39000,89.39000,1685524320,5,0.00000,'1685524320','1min',2),(824,10,3,112.74000,112.74000,112.74000,112.74000,1685524320,5,0.00000,'1685524320','1min',2),(825,10,3,112.74000,112.74000,112.74000,112.74000,1685524380,5,0.00000,'1685524380','1min',2),(826,2,3,27137.53000,27137.53000,27137.53000,27137.53000,1685524380,5,0.00000,'1685524380','1min',2),(827,4,3,1869.68000,1869.68000,1869.68000,1869.68000,1685524380,5,0.00000,'1685524380','1min',2),(828,6,3,89.35000,89.35000,89.35000,89.35000,1685524380,5,0.00000,'1685524380','1min',2),(829,8,3,0.88350,0.88350,0.88350,0.88350,1685524380,5,88.00540,'1685524380','1min',2),(830,2,3,27135.00000,27135.00000,27135.00000,27135.00000,1685524440,5,0.00000,'1685524440','1min',2),(831,4,3,1869.33000,1869.33000,1869.33000,1869.33000,1685524440,5,0.00000,'1685524440','1min',2),(832,6,3,89.34000,89.34000,89.34000,89.34000,1685524440,5,0.00000,'1685524440','1min',2),(833,8,3,0.88470,0.88470,0.88470,0.88470,1685524440,5,0.00000,'1685524440','1min',2),(834,10,3,112.74000,112.74000,112.74000,112.74000,1685524440,5,0.00000,'1685524440','1min',2),(835,8,3,0.88490,0.88490,0.88490,0.88490,1685524500,5,0.00000,'1685524500','1min',2),(836,10,3,112.72000,112.72000,112.72000,112.72000,1685524500,5,0.00000,'1685524500','1min',2),(837,2,3,27132.00000,27132.00000,27132.00000,27132.00000,1685524500,5,0.00000,'1685524500','1min',2),(838,4,3,1869.54000,1869.54000,1869.54000,1869.54000,1685524500,5,0.00000,'1685524500','1min',2),(839,6,3,89.36000,89.36000,89.36000,89.36000,1685524500,5,0.00000,'1685524500','1min',2),(840,2,3,27126.01000,27126.01000,27126.01000,27126.01000,1685524560,5,0.00049,'1685524560','1min',2),(841,4,3,1868.55000,1868.55000,1868.55000,1868.55000,1685524560,5,0.00000,'1685524560','1min',2),(842,6,3,89.35000,89.35000,89.35000,89.35000,1685524560,5,0.00000,'1685524560','1min',2),(843,8,3,0.88490,0.88490,0.88490,0.88490,1685524560,5,0.00000,'1685524560','1min',2),(844,10,3,112.70000,112.70000,112.70000,112.70000,1685524560,5,0.31930,'1685524560','1min',2),(845,8,3,0.88590,0.88590,0.88590,0.88590,1685524620,5,0.00000,'1685524620','1min',2),(846,10,3,112.76000,112.76000,112.76000,112.76000,1685524620,5,0.00000,'1685524620','1min',2),(847,2,3,27135.00000,27135.00000,27135.00000,27135.00000,1685524620,5,0.00000,'1685524620','1min',2),(848,4,3,1869.78000,1869.78000,1869.78000,1869.78000,1685524620,5,0.00000,'1685524620','1min',2),(849,6,3,89.46000,89.46000,89.46000,89.46000,1685524620,5,1.47530,'1685524620','1min',2),(850,2,3,27139.98000,27139.98000,27139.98000,27139.98000,1685524680,5,0.00560,'1685524680','1min',2),(851,4,3,1870.51000,1870.51000,1870.51000,1870.51000,1685524680,5,0.00000,'1685524680','1min',2),(852,6,3,89.46000,89.46000,89.46000,89.46000,1685524680,5,0.00000,'1685524680','1min',2),(853,8,3,0.88630,0.88630,0.88630,0.88630,1685524680,5,0.00000,'1685524680','1min',2),(854,10,3,112.82000,112.82000,112.82000,112.82000,1685524680,5,0.00000,'1685524680','1min',2),(855,2,3,27132.78000,27132.78000,27132.78000,27132.78000,1685524740,5,0.00000,'1685524740','1min',2),(856,4,3,1870.25000,1870.25000,1870.25000,1870.25000,1685524740,5,0.00000,'1685524740','1min',2),(857,6,3,89.43000,89.43000,89.43000,89.43000,1685524740,5,0.00000,'1685524740','1min',2),(858,8,3,0.88780,0.88790,0.88790,0.88780,1685524740,5,39.35000,'1685524740','1min',2),(859,10,3,112.82000,112.82000,112.82000,112.82000,1685524740,5,0.00000,'1685524740','1min',2),(860,4,3,1870.08000,1870.08000,1870.08000,1870.08000,1685524800,5,0.00000,'1685524800','1min',2),(861,6,3,89.44000,89.44000,89.44000,89.44000,1685524800,5,0.00000,'1685524800','1min',2),(862,8,3,0.88750,0.88750,0.88750,0.88750,1685524800,5,0.00000,'1685524800','1min',2),(863,10,3,112.82000,112.82000,112.82000,112.82000,1685524800,5,0.00000,'1685524800','1min',2),(864,2,3,27129.42000,27129.42000,27129.42000,27129.42000,1685524800,5,0.01862,'1685524800','1min',2),(865,2,3,27115.90000,27115.90000,27115.90000,27115.90000,1685524860,5,0.00000,'1685524860','1min',2),(866,4,3,1869.88000,1869.88000,1869.88000,1869.88000,1685524860,5,0.44830,'1685524860','1min',2),(867,6,3,89.37000,89.37000,89.37000,89.37000,1685524860,5,0.00000,'1685524860','1min',2),(868,8,3,0.88720,0.88720,0.88720,0.88720,1685524860,5,0.00000,'1685524860','1min',2),(869,10,3,112.82000,112.82000,112.82000,112.82000,1685524860,5,0.00000,'1685524860','1min',2),(870,4,3,1868.70000,1868.70000,1868.70000,1868.70000,1685524920,5,0.00000,'1685524920','1min',2),(871,6,3,89.31000,89.31000,89.31000,89.31000,1685524920,5,0.00000,'1685524920','1min',2),(872,8,3,0.88720,0.88720,0.88720,0.88720,1685524920,5,0.00000,'1685524920','1min',2),(873,10,3,112.82000,112.82000,112.82000,112.82000,1685524920,5,0.00000,'1685524920','1min',2),(874,2,3,27104.81000,27105.00000,27105.00000,27104.81000,1685524920,5,0.04100,'1685524920','1min',2),(875,6,3,89.29000,89.29000,89.29000,89.29000,1685524980,5,0.65780,'1685524980','1min',2),(876,8,3,0.88720,0.88720,0.88720,0.88720,1685524980,5,0.00000,'1685524980','1min',2),(877,10,3,112.82000,112.82000,112.82000,112.82000,1685524980,5,0.00000,'1685524980','1min',2),(878,2,3,27103.97000,27103.97000,27103.97000,27103.97000,1685524980,5,0.00000,'1685524980','1min',2),(879,4,3,1868.57000,1868.57000,1868.57000,1868.57000,1685524980,5,0.00000,'1685524980','1min',2),(880,6,3,89.29000,89.29000,89.29000,89.29000,1685525040,5,0.50750,'1685525040','1min',2),(881,8,3,0.88720,0.88720,0.88720,0.88720,1685525040,5,0.00000,'1685525040','1min',2),(882,10,3,112.82000,112.82000,112.82000,112.82000,1685525040,5,0.00000,'1685525040','1min',2),(883,2,3,27101.47000,27101.47000,27101.47000,27101.47000,1685525040,5,0.00000,'1685525040','1min',2),(884,4,3,1868.49000,1868.49000,1868.49000,1868.49000,1685525040,5,0.00000,'1685525040','1min',2),(885,6,3,89.30000,89.30000,89.30000,89.30000,1685525100,5,0.00000,'1685525100','1min',2),(886,8,3,0.88740,0.88740,0.88740,0.88740,1685525100,5,0.00000,'1685525100','1min',2),(887,10,3,112.82000,112.82000,112.82000,112.82000,1685525100,5,0.00000,'1685525100','1min',2),(888,2,3,27106.49000,27106.49000,27106.49000,27106.49000,1685525100,5,0.00245,'1685525100','1min',2),(889,4,3,1868.50000,1868.50000,1868.50000,1868.50000,1685525100,5,0.00000,'1685525100','1min',2),(890,10,3,112.82000,112.82000,112.82000,112.82000,1685525160,5,0.00000,'1685525160','1min',2),(891,2,3,27110.00000,27110.00000,27110.00000,27110.00000,1685525160,5,0.00000,'1685525160','1min',2),(892,4,3,1869.50000,1869.50000,1869.50000,1869.50000,1685525160,5,0.00000,'1685525160','1min',2),(893,6,3,89.33000,89.33000,89.33000,89.33000,1685525160,5,1.33370,'1685525160','1min',2),(894,8,3,0.88800,0.88800,0.88800,0.88800,1685525160,5,0.00000,'1685525160','1min',2),(895,2,3,27100.00000,27100.00000,27100.00000,27100.00000,1685525220,5,0.00000,'1685525220','1min',2),(896,4,3,1868.31000,1868.31000,1868.31000,1868.31000,1685525220,5,0.00000,'1685525220','1min',2),(897,6,3,89.29000,89.29000,89.29000,89.29000,1685525220,5,0.00000,'1685525220','1min',2),(898,8,3,0.88800,0.88800,0.88800,0.88800,1685525220,5,0.00000,'1685525220','1min',2),(899,10,3,112.82000,112.82000,112.82000,112.82000,1685525220,5,0.00000,'1685525220','1min',2),(900,2,3,27096.68000,27092.96000,27096.68000,27092.96000,1685525280,5,0.48000,'1685525280','1min',2),(901,4,3,1867.99000,1867.99000,1867.99000,1867.99000,1685525280,5,0.00000,'1685525280','1min',2),(902,6,3,89.25000,89.25000,89.25000,89.25000,1685525280,5,0.00000,'1685525280','1min',2),(903,8,3,0.88800,0.88800,0.88800,0.88800,1685525280,5,0.00000,'1685525280','1min',2),(904,10,3,112.75000,112.75000,112.75000,112.75000,1685525280,5,0.00000,'1685525280','1min',2),(905,2,3,27087.49000,27087.48000,27087.49000,27087.48000,1685525340,5,0.07067,'1685525340','1min',2),(906,4,3,1868.11000,1868.11000,1868.11000,1868.11000,1685525340,5,0.00000,'1685525340','1min',2),(907,6,3,89.26000,89.26000,89.26000,89.26000,1685525340,5,0.52530,'1685525340','1min',2),(908,8,3,0.88750,0.88750,0.88750,0.88750,1685525340,5,0.00000,'1685525340','1min',2),(909,10,3,112.76000,112.76000,112.76000,112.76000,1685525340,5,0.00000,'1685525340','1min',2),(910,8,3,0.88800,0.88800,0.88800,0.88800,1685525400,5,0.00000,'1685525400','1min',2),(911,2,3,27101.49000,27101.49000,27101.49000,27101.49000,1685525400,5,0.00000,'1685525400','1min',2),(912,4,3,1868.99000,1868.99000,1868.99000,1868.99000,1685525400,5,0.00000,'1685525400','1min',2),(913,10,3,112.67000,112.67000,112.67000,112.67000,1685525400,5,0.00000,'1685525400','1min',2),(914,6,3,89.26000,89.26000,89.26000,89.26000,1685525400,5,0.95070,'1685525400','1min',2),(915,4,3,1867.83000,1867.83000,1867.83000,1867.83000,1685525460,5,0.00000,'1685525460','1min',2),(916,6,3,89.21000,89.21000,89.21000,89.21000,1685525460,5,0.00000,'1685525460','1min',2),(917,8,3,0.88750,0.88750,0.88750,0.88750,1685525460,5,13.51950,'1685525460','1min',2),(918,10,3,112.70000,112.70000,112.70000,112.70000,1685525460,5,0.00000,'1685525460','1min',2),(919,2,3,27091.09000,27091.09000,27091.09000,27091.09000,1685525460,5,0.17878,'1685525460','1min',2),(920,4,3,1868.25000,1868.25000,1868.25000,1868.25000,1685525520,5,0.00000,'1685525520','1min',2),(921,6,3,89.20000,89.20000,89.20000,89.20000,1685525520,5,0.33130,'1685525520','1min',2),(922,8,3,0.88750,0.88750,0.88750,0.88750,1685525520,5,0.00000,'1685525520','1min',2),(923,10,3,112.70000,112.70000,112.70000,112.70000,1685525520,5,0.00000,'1685525520','1min',2),(924,2,3,27093.07000,27093.07000,27093.07000,27093.07000,1685525520,5,0.05113,'1685525520','1min',2),(925,8,3,0.88750,0.88750,0.88750,0.88750,1685525580,5,0.00000,'1685525580','1min',2),(926,10,3,112.70000,112.70000,112.70000,112.70000,1685525580,5,0.00000,'1685525580','1min',2),(927,2,3,27090.01000,27090.01000,27090.01000,27090.01000,1685525580,5,0.00000,'1685525580','1min',2),(928,4,3,1868.25000,1868.25000,1868.25000,1868.25000,1685525580,5,0.00000,'1685525580','1min',2),(929,6,3,89.20000,89.20000,89.20000,89.20000,1685525580,5,0.00000,'1685525580','1min',2),(930,6,3,89.20000,89.20000,89.20000,89.20000,1685525640,5,0.00000,'1685525640','1min',2),(931,8,3,0.88750,0.88750,0.88750,0.88750,1685525640,5,0.00000,'1685525640','1min',2),(932,10,3,112.66000,112.66000,112.66000,112.66000,1685525640,5,0.00000,'1685525640','1min',2),(933,2,3,27088.50000,27088.50000,27088.50000,27088.50000,1685525640,5,0.00256,'1685525640','1min',2),(934,4,3,1868.18000,1868.18000,1868.18000,1868.18000,1685525640,5,0.52240,'1685525640','1min',2),(935,4,3,1868.20000,1868.20000,1868.20000,1868.20000,1685525700,5,0.00000,'1685525700','1min',2),(936,6,3,89.20000,89.20000,89.20000,89.20000,1685525700,5,0.00000,'1685525700','1min',2),(937,10,3,112.66000,112.66000,112.66000,112.66000,1685525700,5,0.00000,'1685525700','1min',2),(938,2,3,27082.33000,27082.30000,27082.33000,27082.30000,1685525700,5,0.00150,'1685525700','1min',2),(939,8,3,0.88750,0.88750,0.88750,0.88750,1685525700,5,0.00000,'1685525700','1min',2),(940,6,3,89.25000,89.25000,89.25000,89.25000,1685525760,5,0.00000,'1685525760','1min',2),(941,8,3,0.88820,0.88820,0.88820,0.88820,1685525760,5,0.00000,'1685525760','1min',2),(942,2,3,27080.05000,27080.05000,27080.05000,27080.05000,1685525760,5,0.00167,'1685525760','1min',2),(943,4,3,1868.52000,1868.52000,1868.52000,1868.52000,1685525760,5,0.04670,'1685525760','1min',2),(944,10,3,112.66000,112.66000,112.66000,112.66000,1685525760,5,0.00000,'1685525760','1min',2),(945,4,3,1868.05000,1868.05000,1868.05000,1868.05000,1685525820,5,0.00000,'1685525820','1min',2),(946,6,3,89.21000,89.21000,89.21000,89.21000,1685525820,5,0.00000,'1685525820','1min',2),(947,8,3,0.88820,0.88820,0.88820,0.88820,1685525820,5,0.00000,'1685525820','1min',2),(948,10,3,112.66000,112.66000,112.66000,112.66000,1685525820,5,0.00000,'1685525820','1min',2),(949,2,3,27075.00000,27075.00000,27075.00000,27075.00000,1685525820,5,0.00240,'1685525820','1min',2),(950,6,3,89.22000,89.22000,89.22000,89.22000,1685525880,5,0.00000,'1685525880','1min',2),(951,8,3,0.88820,0.88820,0.88820,0.88820,1685525880,5,0.00000,'1685525880','1min',2),(952,2,3,27075.01000,27075.01000,27075.01000,27075.01000,1685525880,5,0.00145,'1685525880','1min',2),(953,4,3,1868.05000,1868.05000,1868.05000,1868.05000,1685525880,5,0.00000,'1685525880','1min',2),(954,10,3,112.66000,112.66000,112.66000,112.66000,1685525880,5,0.00000,'1685525880','1min',2),(955,8,3,0.88820,0.88820,0.88820,0.88820,1685525940,5,0.00000,'1685525940','1min',2),(956,10,3,112.66000,112.66000,112.66000,112.66000,1685525940,5,0.00000,'1685525940','1min',2),(957,2,3,27070.00000,27070.00000,27070.00000,27070.00000,1685525940,5,0.00000,'1685525940','1min',2),(958,4,3,1868.05000,1868.05000,1868.05000,1868.05000,1685525940,5,0.00000,'1685525940','1min',2),(959,6,3,89.24000,89.24000,89.24000,89.24000,1685525940,5,0.00000,'1685525940','1min',2),(960,10,3,112.66000,112.66000,112.66000,112.66000,1685526000,5,0.00000,'1685526000','1min',2),(961,2,3,27081.50000,27082.00000,27082.00000,27081.50000,1685526000,5,0.01940,'1685526000','1min',2),(962,6,3,89.30000,89.30000,89.30000,89.30000,1685526000,5,0.00000,'1685526000','1min',2),(963,8,3,0.88820,0.88820,0.88820,0.88820,1685526000,5,0.00000,'1685526000','1min',2),(964,4,3,1868.92000,1868.92000,1868.92000,1868.92000,1685526000,5,0.02100,'1685526000','1min',2),(965,10,3,112.66000,112.66000,112.66000,112.66000,1685526060,5,0.00000,'1685526060','1min',2),(966,2,3,27075.00000,27075.00000,27075.00000,27075.00000,1685526060,5,0.00000,'1685526060','1min',2),(967,4,3,1869.09000,1869.09000,1869.09000,1869.09000,1685526060,5,0.00000,'1685526060','1min',2),(968,6,3,89.28000,89.28000,89.28000,89.28000,1685526060,5,0.00000,'1685526060','1min',2),(969,8,3,0.88820,0.88820,0.88820,0.88820,1685526060,5,0.00000,'1685526060','1min',2),(970,8,3,0.88820,0.88820,0.88820,0.88820,1685526120,5,0.00000,'1685526120','1min',2),(971,10,3,112.66000,112.66000,112.66000,112.66000,1685526120,5,0.00000,'1685526120','1min',2),(972,2,3,27065.05000,27069.58000,27069.58000,27065.05000,1685526120,5,0.00500,'1685526120','1min',2),(973,4,3,1867.54000,1867.54000,1867.54000,1867.54000,1685526120,5,0.00000,'1685526120','1min',2),(974,6,3,89.18000,89.18000,89.18000,89.18000,1685526120,5,0.00000,'1685526120','1min',2),(975,10,3,112.66000,112.66000,112.66000,112.66000,1685526180,5,0.00000,'1685526180','1min',2),(976,2,3,27081.00000,27081.00000,27081.00000,27081.00000,1685526180,5,0.00000,'1685526180','1min',2),(977,4,3,1868.35000,1868.35000,1868.35000,1868.35000,1685526180,5,0.00000,'1685526180','1min',2),(978,8,3,0.88850,0.88850,0.88850,0.88850,1685526180,5,0.00000,'1685526180','1min',2),(979,6,3,89.21000,89.21000,89.21000,89.21000,1685526180,5,0.00000,'1685526180','1min',2),(980,2,3,27092.50000,27092.50000,27092.50000,27092.50000,1685526240,5,0.00000,'1685526240','1min',2),(981,4,3,1868.55000,1868.55000,1868.55000,1868.55000,1685526240,5,0.00000,'1685526240','1min',2),(982,6,3,89.23000,89.23000,89.23000,89.23000,1685526240,5,0.00000,'1685526240','1min',2),(983,8,3,0.88860,0.88860,0.88860,0.88860,1685526240,5,0.00000,'1685526240','1min',2),(984,10,3,112.77000,112.77000,112.77000,112.77000,1685526240,5,0.00000,'1685526240','1min',2),(985,8,3,0.88960,0.88960,0.88960,0.88960,1685526300,5,0.00000,'1685526300','1min',2),(986,10,3,112.86000,112.86000,112.86000,112.86000,1685526300,5,0.00000,'1685526300','1min',2),(987,2,3,27115.79000,27115.79000,27115.79000,27115.79000,1685526300,5,0.00000,'1685526300','1min',2),(988,4,3,1869.34000,1869.34000,1869.34000,1869.34000,1685526300,5,0.00000,'1685526300','1min',2),(989,6,3,89.30000,89.30000,89.30000,89.30000,1685526300,5,0.00000,'1685526300','1min',2),(990,2,3,27105.86000,27105.86000,27105.86000,27105.86000,1685526360,5,0.00000,'1685526360','1min',2),(991,4,3,1868.74000,1868.74000,1868.74000,1868.74000,1685526360,5,0.00000,'1685526360','1min',2),(992,8,3,0.88840,0.88840,0.88840,0.88840,1685526360,5,0.00000,'1685526360','1min',2),(993,10,3,112.81000,112.81000,112.81000,112.81000,1685526360,5,0.00000,'1685526360','1min',2),(994,6,3,89.18000,89.18000,89.18000,89.18000,1685526360,5,1.12230,'1685526360','1min',2),(995,2,3,27109.50000,27109.50000,27109.50000,27109.50000,1685526420,5,0.00000,'1685526420','1min',2),(996,4,3,1868.87000,1868.87000,1868.87000,1868.87000,1685526420,5,0.00000,'1685526420','1min',2),(997,6,3,89.19000,89.19000,89.19000,89.19000,1685526420,5,0.00000,'1685526420','1min',2),(998,8,3,0.88840,0.88840,0.88840,0.88840,1685526420,5,0.00000,'1685526420','1min',2),(999,10,3,112.81000,112.81000,112.81000,112.81000,1685526420,5,0.00000,'1685526420','1min',2),(1000,4,3,1869.87000,1869.87000,1869.87000,1869.87000,1685526480,5,0.01000,'1685526480','1min',2),(1001,6,3,89.21000,89.21000,89.21000,89.21000,1685526480,5,0.00000,'1685526480','1min',2),(1002,8,3,0.88930,0.88930,0.88930,0.88930,1685526480,5,0.00000,'1685526480','1min',2),(1003,10,3,112.85000,112.85000,112.85000,112.85000,1685526480,5,0.00000,'1685526480','1min',2),(1004,2,3,27125.50000,27125.50000,27125.50000,27125.50000,1685526480,5,0.00000,'1685526480','1min',2),(1005,6,3,89.29000,89.29000,89.29000,89.29000,1685526540,5,0.00000,'1685526540','1min',2),(1006,8,3,0.88900,0.88900,0.88900,0.88900,1685526540,5,0.00000,'1685526540','1min',2),(1007,10,3,112.83000,112.83000,112.83000,112.83000,1685526540,5,0.00000,'1685526540','1min',2),(1008,2,3,27132.13000,27132.13000,27132.13000,27132.13000,1685526540,5,0.00050,'1685526540','1min',2),(1009,4,3,1869.89000,1869.89000,1869.89000,1869.89000,1685526540,5,0.00000,'1685526540','1min',2),(1010,6,3,89.41000,89.41000,89.41000,89.41000,1685526600,5,5.85930,'1685526600','1min',2),(1011,10,3,112.83000,112.83000,112.83000,112.83000,1685526600,5,0.00000,'1685526600','1min',2),(1012,2,3,27128.34000,27119.86000,27128.34000,27119.86000,1685526600,5,2.36076,'1685526600','1min',2),(1013,4,3,1869.62000,1869.62000,1869.62000,1869.62000,1685526600,5,0.00750,'1685526600','1min',2),(1014,8,3,0.88830,0.88830,0.88830,0.88830,1685526600,5,0.00000,'1685526600','1min',2),(1015,10,3,112.83000,112.83000,112.83000,112.83000,1685526660,5,0.00000,'1685526660','1min',2),(1016,2,3,27121.06000,27121.06000,27121.06000,27121.06000,1685526660,5,0.00000,'1685526660','1min',2),(1017,4,3,1869.71000,1869.71000,1869.71000,1869.71000,1685526660,5,0.00000,'1685526660','1min',2),(1018,6,3,89.50000,89.50000,89.50000,89.50000,1685526660,5,0.00000,'1685526660','1min',2),(1019,8,3,0.88840,0.88840,0.88840,0.88840,1685526660,5,0.00000,'1685526660','1min',2),(1020,10,3,112.83000,112.83000,112.83000,112.83000,1685526720,5,0.00000,'1685526720','1min',2),(1021,2,3,27129.99000,27129.99000,27129.99000,27129.99000,1685526720,5,0.00036,'1685526720','1min',2),(1022,4,3,1870.00000,1870.00000,1870.00000,1870.00000,1685526720,5,0.00000,'1685526720','1min',2),(1023,6,3,89.50000,89.50000,89.50000,89.50000,1685526720,5,0.00000,'1685526720','1min',2),(1024,8,3,0.88850,0.88850,0.88850,0.88850,1685526720,5,118.28310,'1685526720','1min',2),(1025,10,3,112.82000,112.82000,112.82000,112.82000,1685526780,5,0.00000,'1685526780','1min',2),(1026,6,3,89.50000,89.50000,89.50000,89.50000,1685526780,5,0.00000,'1685526780','1min',2),(1027,8,3,0.88870,0.88870,0.88870,0.88870,1685526780,5,0.00000,'1685526780','1min',2),(1028,2,3,27137.25000,27137.25000,27137.25000,27137.25000,1685526780,5,0.01500,'1685526780','1min',2),(1029,4,3,1870.52000,1870.52000,1870.52000,1870.52000,1685526780,5,0.00000,'1685526780','1min',2),(1030,6,3,89.46000,89.46000,89.46000,89.46000,1685526840,5,1.27210,'1685526840','1min',2),(1031,10,3,112.82000,112.82000,112.82000,112.82000,1685526840,5,0.00000,'1685526840','1min',2),(1032,2,3,27124.89000,27124.89000,27124.89000,27124.89000,1685526840,5,0.00000,'1685526840','1min',2),(1033,4,3,1869.70000,1869.70000,1869.70000,1869.70000,1685526840,5,0.00000,'1685526840','1min',2),(1034,8,3,0.88930,0.88930,0.88930,0.88930,1685526840,5,0.00000,'1685526840','1min',2),(1035,6,3,89.47000,89.47000,89.47000,89.47000,1685526900,5,1.01520,'1685526900','1min',2),(1036,8,3,0.88930,0.88930,0.88930,0.88930,1685526900,5,0.00000,'1685526900','1min',2),(1037,10,3,112.82000,112.82000,112.82000,112.82000,1685526900,5,0.00000,'1685526900','1min',2),(1038,2,3,27140.41000,27136.02000,27140.41000,27136.02000,1685526900,5,0.07301,'1685526900','1min',2),(1039,4,3,1870.32000,1870.31000,1870.32000,1870.31000,1685526900,5,0.05990,'1685526900','1min',2),(1040,2,3,27136.01000,27136.01000,27136.01000,27136.01000,1685526960,5,0.00000,'1685526960','1min',2),(1041,4,3,1870.06000,1870.06000,1870.06000,1870.06000,1685526960,5,0.00000,'1685526960','1min',2),(1042,6,3,89.46000,89.46000,89.46000,89.46000,1685526960,5,0.00000,'1685526960','1min',2),(1043,8,3,0.88930,0.88930,0.88930,0.88930,1685526960,5,0.00000,'1685526960','1min',2),(1044,10,3,112.82000,112.82000,112.82000,112.82000,1685526960,5,0.00000,'1685526960','1min',2),(1045,10,3,112.82000,112.82000,112.82000,112.82000,1685527020,5,0.00000,'1685527020','1min',2),(1046,2,3,27133.65000,27133.65000,27133.65000,27133.65000,1685527020,5,0.00000,'1685527020','1min',2),(1047,4,3,1869.99000,1869.99000,1869.99000,1869.99000,1685527020,5,0.00000,'1685527020','1min',2),(1048,6,3,89.44000,89.44000,89.44000,89.44000,1685527020,5,0.60260,'1685527020','1min',2),(1049,8,3,0.88960,0.88960,0.88960,0.88960,1685527020,5,0.00000,'1685527020','1min',2),(1050,10,3,112.82000,112.82000,112.82000,112.82000,1685527080,5,0.00000,'1685527080','1min',2),(1051,2,3,27133.65000,27133.65000,27133.65000,27133.65000,1685527080,5,0.00000,'1685527080','1min',2),(1052,4,3,1869.90000,1869.90000,1869.90000,1869.90000,1685527080,5,0.00000,'1685527080','1min',2),(1053,6,3,89.43000,89.43000,89.43000,89.43000,1685527080,5,0.58270,'1685527080','1min',2),(1054,8,3,0.88930,0.88930,0.88930,0.88930,1685527080,5,328.29260,'1685527080','1min',2),(1055,4,3,1869.90000,1869.90000,1869.90000,1869.90000,1685527140,5,0.00000,'1685527140','1min',2),(1056,8,3,0.88930,0.88930,0.88930,0.88930,1685527140,5,0.00000,'1685527140','1min',2),(1057,10,3,112.82000,112.82000,112.82000,112.82000,1685527140,5,0.00000,'1685527140','1min',2),(1058,2,3,27133.64000,27133.64000,27133.64000,27133.64000,1685527140,5,0.01289,'1685527140','1min',2),(1059,6,3,89.43000,89.43000,89.43000,89.43000,1685527140,5,0.00000,'1685527140','1min',2),(1060,10,3,112.82000,112.82000,112.82000,112.82000,1685527200,5,0.00000,'1685527200','1min',2),(1061,2,3,27133.63000,27130.00000,27133.63000,27130.00000,1685527200,5,0.36844,'1685527200','1min',2),(1062,4,3,1869.86000,1869.86000,1869.86000,1869.86000,1685527200,5,0.00748,'1685527200','1min',2),(1063,6,3,89.39000,89.39000,89.39000,89.39000,1685527200,5,0.00000,'1685527200','1min',2),(1064,8,3,0.88930,0.88930,0.88930,0.88930,1685527200,5,0.00000,'1685527200','1min',2),(1065,8,3,0.88930,0.88930,0.88930,0.88930,1685527260,5,0.00000,'1685527260','1min',2),(1066,10,3,112.79000,112.79000,112.79000,112.79000,1685527260,5,0.00000,'1685527260','1min',2),(1067,2,3,27134.50000,27134.50000,27134.50000,27134.50000,1685527260,5,0.00000,'1685527260','1min',2),(1068,6,3,89.39000,89.39000,89.39000,89.39000,1685527260,5,0.00000,'1685527260','1min',2),(1069,4,3,1870.30000,1870.30000,1870.30000,1870.30000,1685527260,5,0.00000,'1685527260','1min',2),(1070,2,3,27130.00000,27130.00000,27130.00000,27130.00000,1685527320,5,0.00000,'1685527320','1min',2),(1071,10,3,112.85000,112.85000,112.85000,112.85000,1685527320,5,0.00000,'1685527320','1min',2),(1072,4,3,1870.38000,1870.38000,1870.38000,1870.38000,1685527320,5,0.00000,'1685527320','1min',2),(1073,6,3,89.39000,89.39000,89.39000,89.39000,1685527320,5,0.00000,'1685527320','1min',2),(1074,8,3,0.88930,0.88930,0.88930,0.88930,1685527320,5,0.00000,'1685527320','1min',2),(1075,8,3,0.88930,0.88930,0.88930,0.88930,1685527380,5,0.00000,'1685527380','1min',2),(1076,10,3,112.85000,112.85000,112.85000,112.85000,1685527380,5,0.00000,'1685527380','1min',2),(1077,2,3,27135.64000,27135.64000,27135.64000,27135.64000,1685527380,5,0.00000,'1685527380','1min',2),(1078,4,3,1870.17000,1870.17000,1870.17000,1870.17000,1685527380,5,0.00000,'1685527380','1min',2),(1079,6,3,89.36000,89.36000,89.36000,89.36000,1685527380,5,0.00000,'1685527380','1min',2),(1080,2,3,27128.99000,27128.99000,27128.99000,27128.99000,1685527440,5,0.00000,'1685527440','1min',2),(1081,6,3,89.33000,89.33000,89.33000,89.33000,1685527440,5,0.13430,'1685527440','1min',2),(1082,8,3,0.88930,0.88930,0.88930,0.88930,1685527440,5,0.00000,'1685527440','1min',2),(1083,10,3,112.85000,112.85000,112.85000,112.85000,1685527440,5,0.00000,'1685527440','1min',2),(1084,4,3,1870.26000,1870.26000,1870.26000,1870.26000,1685527440,5,0.87880,'1685527440','1min',2),(1085,10,3,112.85000,112.85000,112.85000,112.85000,1685527500,5,0.00000,'1685527500','1min',2),(1086,2,3,27130.50000,27130.50000,27130.50000,27130.50000,1685527500,5,0.00000,'1685527500','1min',2),(1087,4,3,1870.28000,1870.28000,1870.28000,1870.28000,1685527500,5,0.00000,'1685527500','1min',2),(1088,6,3,89.34000,89.34000,89.34000,89.34000,1685527500,5,0.00000,'1685527500','1min',2),(1089,8,3,0.88930,0.88930,0.88930,0.88930,1685527500,5,0.00000,'1685527500','1min',2),(1090,6,3,89.33000,89.30000,89.33000,89.30000,1685527560,5,117.24680,'1685527560','1min',2),(1091,8,3,0.88930,0.88930,0.88930,0.88930,1685527560,5,0.00000,'1685527560','1min',2),(1092,10,3,112.85000,112.85000,112.85000,112.85000,1685527560,5,0.00000,'1685527560','1min',2),(1093,2,3,27129.49000,27129.49000,27129.49000,27129.49000,1685527560,5,0.00360,'1685527560','1min',2),(1094,4,3,1869.95000,1869.95000,1869.95000,1869.95000,1685527560,5,0.00000,'1685527560','1min',2),(1095,4,3,1870.84000,1870.84000,1870.84000,1870.84000,1685527620,5,0.00000,'1685527620','1min',2),(1096,6,3,89.35000,89.35000,89.35000,89.35000,1685527620,5,0.00000,'1685527620','1min',2),(1097,8,3,0.88930,0.88930,0.88930,0.88930,1685527620,5,0.00000,'1685527620','1min',2),(1098,10,3,112.85000,112.85000,112.85000,112.85000,1685527620,5,0.00000,'1685527620','1min',2),(1099,2,3,27135.00000,27135.00000,27135.00000,27135.00000,1685527620,5,0.00000,'1685527620','1min',2),(1100,10,3,112.85000,112.85000,112.85000,112.85000,1685527680,5,0.00000,'1685527680','1min',2),(1101,2,3,27138.00000,27138.00000,27138.00000,27138.00000,1685527680,5,2.35251,'1685527680','1min',2),(1102,4,3,1870.97000,1870.97000,1870.97000,1870.97000,1685527680,5,0.02120,'1685527680','1min',2),(1103,6,3,89.38000,89.38000,89.38000,89.38000,1685527680,5,0.00000,'1685527680','1min',2),(1104,8,3,0.88930,0.88930,0.88930,0.88930,1685527680,5,134.91470,'1685527680','1min',2),(1105,8,3,0.88930,0.88930,0.88930,0.88930,1685527740,5,0.00000,'1685527740','1min',2),(1106,10,3,112.85000,112.85000,112.85000,112.85000,1685527740,5,0.00000,'1685527740','1min',2),(1107,2,3,27127.45000,27127.45000,27127.45000,27127.45000,1685527740,5,0.01087,'1685527740','1min',2),(1108,4,3,1870.18000,1870.18000,1870.18000,1870.18000,1685527740,5,0.01580,'1685527740','1min',2),(1109,6,3,89.33000,89.33000,89.33000,89.33000,1685527740,5,0.00000,'1685527740','1min',2),(1110,2,3,27124.92000,27124.92000,27124.92000,27124.92000,1685527800,5,0.00363,'1685527800','1min',2),(1111,4,3,1870.50000,1870.50000,1870.50000,1870.50000,1685527800,5,0.00000,'1685527800','1min',2),(1112,6,3,89.33000,89.33000,89.33000,89.33000,1685527800,5,0.00000,'1685527800','1min',2),(1113,8,3,0.88930,0.88930,0.88930,0.88930,1685527800,5,0.00000,'1685527800','1min',2),(1114,10,3,112.85000,112.85000,112.85000,112.85000,1685527800,5,0.00000,'1685527800','1min',2),(1115,10,3,112.85000,112.85000,112.85000,112.85000,1685527860,5,0.00000,'1685527860','1min',2),(1116,2,3,27136.99000,27136.99000,27136.99000,27136.99000,1685527860,5,0.25526,'1685527860','1min',2),(1117,4,3,1870.91000,1870.91000,1870.91000,1870.91000,1685527860,5,0.00000,'1685527860','1min',2),(1118,6,3,89.33000,89.33000,89.33000,89.33000,1685527860,5,0.00000,'1685527860','1min',2),(1119,8,3,0.88930,0.88930,0.88930,0.88930,1685527860,5,0.00000,'1685527860','1min',2),(1120,4,3,1871.39000,1871.39000,1871.39000,1871.39000,1685527920,5,0.00000,'1685527920','1min',2),(1121,6,3,89.38000,89.38000,89.38000,89.38000,1685527920,5,0.44850,'1685527920','1min',2),(1122,8,3,0.88970,0.88970,0.88970,0.88970,1685527920,5,173.37000,'1685527920','1min',2),(1123,10,3,112.85000,112.85000,112.85000,112.85000,1685527920,5,0.00000,'1685527920','1min',2),(1124,2,3,27137.99000,27137.99000,27137.99000,27137.99000,1685527920,5,0.00000,'1685527920','1min',2),(1125,6,3,89.30000,89.30000,89.30000,89.30000,1685527980,5,0.54770,'1685527980','1min',2),(1126,8,3,0.88930,0.88930,0.88930,0.88930,1685527980,5,0.00000,'1685527980','1min',2),(1127,10,3,112.85000,112.85000,112.85000,112.85000,1685527980,5,0.00000,'1685527980','1min',2),(1128,2,3,27127.31000,27129.68000,27129.68000,27127.31000,1685527980,5,2.39297,'1685527980','1min',2),(1129,4,3,1870.43000,1870.43000,1870.43000,1870.43000,1685527980,5,0.00000,'1685527980','1min',2),(1130,8,3,0.88930,0.88930,0.88930,0.88930,1685528040,5,0.00000,'1685528040','1min',2),(1131,10,3,112.85000,112.85000,112.85000,112.85000,1685528040,5,0.00000,'1685528040','1min',2),(1132,2,3,27122.54000,27122.54000,27122.54000,27122.54000,1685528040,5,0.00384,'1685528040','1min',2),(1133,4,3,1870.01000,1870.01000,1870.01000,1870.01000,1685528040,5,0.00000,'1685528040','1min',2),(1134,6,3,89.28000,89.28000,89.28000,89.28000,1685528040,5,0.00000,'1685528040','1min',2),(1135,6,3,89.30000,89.30000,89.30000,89.30000,1685528100,5,0.00000,'1685528100','1min',2),(1136,8,3,0.88930,0.88930,0.88930,0.88930,1685528100,5,0.00000,'1685528100','1min',2),(1137,10,3,112.85000,112.85000,112.85000,112.85000,1685528100,5,0.00000,'1685528100','1min',2),(1138,2,3,27125.28000,27125.28000,27125.28000,27125.28000,1685528100,5,0.00000,'1685528100','1min',2),(1139,4,3,1870.01000,1870.01000,1870.01000,1870.01000,1685528100,5,0.00000,'1685528100','1min',2),(1140,2,3,27121.31000,27121.31000,27121.31000,27121.31000,1685528160,5,0.00340,'1685528160','1min',2),(1141,4,3,1870.00000,1870.00000,1870.00000,1870.00000,1685528160,5,0.00000,'1685528160','1min',2),(1142,6,3,89.30000,89.30000,89.30000,89.30000,1685528160,5,0.00000,'1685528160','1min',2),(1143,8,3,0.88930,0.88930,0.88930,0.88930,1685528160,5,0.00000,'1685528160','1min',2),(1144,10,3,112.85000,112.85000,112.85000,112.85000,1685528160,5,0.00000,'1685528160','1min',2),(1145,2,3,27115.00000,27115.00000,27115.00000,27115.00000,1685528220,5,0.25000,'1685528220','1min',2),(1146,6,3,89.30000,89.30000,89.30000,89.30000,1685528220,5,0.45310,'1685528220','1min',2),(1147,8,3,0.88930,0.88930,0.88930,0.88930,1685528220,5,0.00000,'1685528220','1min',2),(1148,10,3,112.75000,112.75000,112.75000,112.75000,1685528220,5,0.00000,'1685528220','1min',2),(1149,4,3,1869.59000,1869.59000,1869.59000,1869.59000,1685528220,5,0.00000,'1685528220','1min',2),(1150,6,3,89.28000,89.28000,89.28000,89.28000,1685528280,5,0.00000,'1685528280','1min',2),(1151,8,3,0.88930,0.88930,0.88930,0.88930,1685528280,5,0.00000,'1685528280','1min',2),(1152,10,3,112.75000,112.75000,112.75000,112.75000,1685528280,5,0.00000,'1685528280','1min',2),(1153,2,3,27110.00000,27110.00000,27110.00000,27110.00000,1685528280,5,0.00000,'1685528280','1min',2),(1154,4,3,1869.17000,1869.17000,1869.17000,1869.17000,1685528280,5,0.00000,'1685528280','1min',2),(1155,10,3,112.75000,112.75000,112.75000,112.75000,1685528340,5,0.00000,'1685528340','1min',2),(1156,2,3,27117.48000,27117.48000,27117.48000,27117.48000,1685528340,5,0.00000,'1685528340','1min',2),(1157,4,3,1869.35000,1869.35000,1869.35000,1869.35000,1685528340,5,0.00000,'1685528340','1min',2),(1158,6,3,89.31000,89.31000,89.31000,89.31000,1685528340,5,0.00000,'1685528340','1min',2),(1159,8,3,0.88940,0.88940,0.88940,0.88940,1685528340,5,109.26870,'1685528340','1min',2),(1160,8,3,0.88950,0.88950,0.88950,0.88950,1685528400,5,0.00000,'1685528400','1min',2),(1161,10,3,112.75000,112.75000,112.75000,112.75000,1685528400,5,0.00000,'1685528400','1min',2),(1162,2,3,27105.02000,27105.02000,27105.02000,27105.02000,1685528400,5,0.00000,'1685528400','1min',2),(1163,4,3,1868.96000,1868.96000,1868.96000,1868.96000,1685528400,5,0.01330,'1685528400','1min',2),(1164,6,3,89.31000,89.31000,89.31000,89.31000,1685528400,5,0.00000,'1685528400','1min',2),(1165,4,3,1868.86000,1868.86000,1868.86000,1868.86000,1685528460,5,0.01960,'1685528460','1min',2),(1166,6,3,89.32000,89.32000,89.32000,89.32000,1685528460,5,0.00000,'1685528460','1min',2),(1167,8,3,0.88950,0.88950,0.88950,0.88950,1685528460,5,0.00000,'1685528460','1min',2),(1168,10,3,112.75000,112.75000,112.75000,112.75000,1685528460,5,0.00000,'1685528460','1min',2),(1169,2,3,27103.06000,27103.06000,27103.06000,27103.06000,1685528460,5,0.00000,'1685528460','1min',2),(1170,8,3,0.88950,0.88950,0.88950,0.88950,1685528520,5,0.00000,'1685528520','1min',2),(1171,10,3,112.75000,112.75000,112.75000,112.75000,1685528520,5,0.00000,'1685528520','1min',2),(1172,2,3,27100.00000,27100.00000,27100.00000,27100.00000,1685528520,5,0.00084,'1685528520','1min',2),(1173,4,3,1868.69000,1868.69000,1868.69000,1868.69000,1685528520,5,0.05350,'1685528520','1min',2),(1174,6,3,89.29000,89.29000,89.29000,89.29000,1685528520,5,0.00000,'1685528520','1min',2),(1175,2,3,27100.01000,27100.01000,27100.01000,27100.01000,1685528580,5,0.00000,'1685528580','1min',2),(1176,4,3,1868.68000,1868.68000,1868.68000,1868.68000,1685528580,5,0.00000,'1685528580','1min',2),(1177,6,3,89.33000,89.33000,89.33000,89.33000,1685528580,5,0.00000,'1685528580','1min',2),(1178,8,3,0.88950,0.88950,0.88950,0.88950,1685528580,5,0.00000,'1685528580','1min',2),(1179,10,3,112.75000,112.75000,112.75000,112.75000,1685528580,5,0.00000,'1685528580','1min',2),(1180,10,3,112.75000,112.75000,112.75000,112.75000,1685528640,5,0.00000,'1685528640','1min',2),(1181,2,3,27100.00000,27100.00000,27100.00000,27100.00000,1685528640,5,0.00000,'1685528640','1min',2),(1182,6,3,89.27000,89.27000,89.27000,89.27000,1685528640,5,0.00000,'1685528640','1min',2),(1183,8,3,0.88940,0.88940,0.88940,0.88940,1685528640,5,0.00000,'1685528640','1min',2),(1184,4,3,1868.69000,1868.69000,1868.69000,1868.69000,1685528640,5,0.00000,'1685528640','1min',2),(1185,8,3,0.88950,0.88950,0.88950,0.88950,1685528700,5,0.00000,'1685528700','1min',2),(1186,10,3,112.75000,112.75000,112.75000,112.75000,1685528700,5,0.00000,'1685528700','1min',2),(1187,2,3,27099.63000,27099.63000,27099.63000,27099.63000,1685528700,5,0.00000,'1685528700','1min',2),(1188,6,3,89.30000,89.31000,89.31000,89.30000,1685528700,5,2.23730,'1685528700','1min',2),(1189,4,3,1868.49000,1868.49000,1868.49000,1868.49000,1685528700,5,0.00000,'1685528700','1min',2),(1190,2,3,27099.53000,27099.53000,27099.53000,27099.53000,1685528760,5,0.00000,'1685528760','1min',2),(1191,8,3,0.88950,0.88950,0.88950,0.88950,1685528760,5,0.00000,'1685528760','1min',2),(1192,10,3,112.75000,112.75000,112.75000,112.75000,1685528760,5,0.00000,'1685528760','1min',2),(1193,4,3,1868.71000,1868.71000,1868.71000,1868.71000,1685528760,5,0.00000,'1685528760','1min',2),(1194,6,3,89.30000,89.30000,89.30000,89.30000,1685528760,5,0.63680,'1685528760','1min',2),(1195,10,3,112.75000,112.75000,112.75000,112.75000,1685528820,5,0.00000,'1685528820','1min',2),(1196,2,3,27097.11000,27097.11000,27097.11000,27097.11000,1685528820,5,0.00500,'1685528820','1min',2),(1197,4,3,1868.70000,1868.70000,1868.70000,1868.70000,1685528820,5,0.00000,'1685528820','1min',2),(1198,6,3,89.29000,89.29000,89.29000,89.29000,1685528820,5,0.00000,'1685528820','1min',2),(1199,8,3,0.88950,0.88950,0.88950,0.88950,1685528820,5,0.00000,'1685528820','1min',2),(1200,10,3,112.73000,112.73000,112.73000,112.73000,1685528880,5,0.00000,'1685528880','1min',2),(1201,4,3,1867.75000,1867.75000,1867.75000,1867.75000,1685528880,5,0.00000,'1685528880','1min',2),(1202,6,3,89.24000,89.24000,89.24000,89.24000,1685528880,5,0.00000,'1685528880','1min',2),(1203,8,3,0.88850,0.88850,0.88850,0.88850,1685528880,5,0.00000,'1685528880','1min',2),(1204,2,3,27089.92000,27089.93000,27089.93000,27089.92000,1685528880,5,0.00872,'1685528880','1min',2),(1205,2,3,27075.00000,27075.00000,27075.00000,27075.00000,1685528940,5,0.00000,'1685528940','1min',2),(1206,4,3,1867.21000,1867.21000,1867.21000,1867.21000,1685528940,5,0.65620,'1685528940','1min',2),(1207,6,3,89.18000,89.18000,89.18000,89.18000,1685528940,5,0.00000,'1685528940','1min',2),(1208,8,3,0.88740,0.88740,0.88740,0.88740,1685528940,5,269.48400,'1685528940','1min',2),(1209,10,3,112.63000,112.63000,112.63000,112.63000,1685528940,5,0.00000,'1685528940','1min',2),(1210,10,3,112.63000,112.63000,112.63000,112.63000,1685529000,5,0.00000,'1685529000','1min',2),(1211,2,3,27076.23000,27076.23000,27076.23000,27076.23000,1685529000,5,0.00000,'1685529000','1min',2),(1212,4,3,1867.64000,1867.64000,1867.64000,1867.64000,1685529000,5,0.00000,'1685529000','1min',2),(1213,6,3,89.20000,89.20000,89.20000,89.20000,1685529000,5,0.00000,'1685529000','1min',2),(1214,8,3,0.88800,0.88800,0.88800,0.88800,1685529000,5,211.43810,'1685529000','1min',2),(1215,2,3,27071.11000,27071.11000,27071.11000,27071.11000,1685529060,5,0.00000,'1685529060','1min',2),(1216,4,3,1867.80000,1867.80000,1867.80000,1867.80000,1685529060,5,0.00000,'1685529060','1min',2),(1217,6,3,89.20000,89.20000,89.20000,89.20000,1685529060,5,0.00000,'1685529060','1min',2),(1218,8,3,0.88830,0.88830,0.88830,0.88830,1685529060,5,210.51780,'1685529060','1min',2),(1219,10,3,112.63000,112.63000,112.63000,112.63000,1685529060,5,0.00000,'1685529060','1min',2),(1220,6,3,89.19000,89.19000,89.19000,89.19000,1685529120,5,0.00000,'1685529120','1min',2),(1221,8,3,0.88870,0.88870,0.88870,0.88870,1685529120,5,0.00000,'1685529120','1min',2),(1222,10,3,112.63000,112.63000,112.63000,112.63000,1685529120,5,0.00000,'1685529120','1min',2),(1223,2,3,27078.83000,27078.83000,27078.83000,27078.83000,1685529120,5,0.00000,'1685529120','1min',2),(1224,4,3,1868.20000,1868.20000,1868.20000,1868.20000,1685529120,5,0.00000,'1685529120','1min',2),(1225,8,3,0.88930,0.88930,0.88930,0.88930,1685529180,5,0.00000,'1685529180','1min',2),(1226,2,3,27073.42000,27073.42000,27073.42000,27073.42000,1685529180,5,0.00073,'1685529180','1min',2),(1227,4,3,1868.34000,1868.34000,1868.34000,1868.34000,1685529180,5,0.00000,'1685529180','1min',2),(1228,6,3,89.20000,89.20000,89.20000,89.20000,1685529180,5,0.63490,'1685529180','1min',2),(1229,10,3,112.63000,112.63000,112.63000,112.63000,1685529180,5,0.00000,'1685529180','1min',2),(1230,4,3,1868.01000,1868.01000,1868.01000,1868.01000,1685529240,5,0.00000,'1685529240','1min',2),(1231,6,3,89.20000,89.20000,89.20000,89.20000,1685529240,5,0.00000,'1685529240','1min',2),(1232,8,3,0.88920,0.88920,0.88920,0.88920,1685529240,5,0.00000,'1685529240','1min',2),(1233,10,3,112.63000,112.63000,112.63000,112.63000,1685529240,5,0.00000,'1685529240','1min',2),(1234,2,3,27070.00000,27070.00000,27070.00000,27070.00000,1685529240,5,0.03746,'1685529240','1min',2),(1235,10,3,112.63000,112.63000,112.63000,112.63000,1685529300,5,0.00000,'1685529300','1min',2),(1236,2,3,27074.50000,27074.50000,27074.50000,27074.50000,1685529300,5,0.00000,'1685529300','1min',2),(1237,4,3,1867.86000,1867.86000,1867.86000,1867.86000,1685529300,5,0.00000,'1685529300','1min',2),(1238,6,3,89.19000,89.19000,89.19000,89.19000,1685529300,5,0.00000,'1685529300','1min',2),(1239,8,3,0.88910,0.88910,0.88910,0.88910,1685529300,5,213.58300,'1685529300','1min',2),(1240,2,3,27074.49000,27074.49000,27074.49000,27074.49000,1685529360,5,0.00000,'1685529360','1min',2),(1241,8,3,0.88930,0.88930,0.88930,0.88930,1685529360,5,0.00000,'1685529360','1min',2),(1242,10,3,112.63000,112.63000,112.63000,112.63000,1685529360,5,0.00000,'1685529360','1min',2),(1243,4,3,1868.28000,1868.28000,1868.28000,1868.28000,1685529360,5,0.00000,'1685529360','1min',2),(1244,6,3,89.17000,89.17000,89.17000,89.17000,1685529360,5,0.00000,'1685529360','1min',2),(1245,10,3,112.63000,112.63000,112.63000,112.63000,1685529420,5,0.00000,'1685529420','1min',2),(1246,2,3,27079.00000,27079.00000,27079.00000,27079.00000,1685529420,5,0.00000,'1685529420','1min',2),(1247,4,3,1868.37000,1868.37000,1868.37000,1868.37000,1685529420,5,0.00000,'1685529420','1min',2),(1248,6,3,89.18000,89.18000,89.18000,89.18000,1685529420,5,0.00000,'1685529420','1min',2),(1249,8,3,0.88930,0.88930,0.88930,0.88930,1685529420,5,0.00000,'1685529420','1min',2),(1250,8,3,0.88930,0.88930,0.88930,0.88930,1685529480,5,0.00000,'1685529480','1min',2),(1251,10,3,112.58000,112.58000,112.58000,112.58000,1685529480,5,0.00000,'1685529480','1min',2),(1252,4,3,1868.35000,1868.35000,1868.35000,1868.35000,1685529480,5,0.00000,'1685529480','1min',2),(1253,6,3,89.20000,89.20000,89.20000,89.20000,1685529480,5,0.00000,'1685529480','1min',2),(1254,2,3,27084.50000,27084.50000,27084.50000,27084.50000,1685529480,5,0.00000,'1685529480','1min',2),(1255,8,3,0.88950,0.88950,0.88950,0.88950,1685529540,5,0.00000,'1685529540','1min',2),(1256,10,3,112.58000,112.58000,112.58000,112.58000,1685529540,5,0.00000,'1685529540','1min',2),(1257,2,3,27090.50000,27090.50000,27090.50000,27090.50000,1685529540,5,0.02928,'1685529540','1min',2),(1258,4,3,1868.77000,1868.77000,1868.77000,1868.77000,1685529540,5,0.27190,'1685529540','1min',2),(1259,6,3,89.22000,89.22000,89.22000,89.22000,1685529540,5,0.00000,'1685529540','1min',2),(1260,2,3,27080.00000,27080.00000,27080.00000,27080.00000,1685529600,5,0.00000,'1685529600','1min',2),(1261,8,3,0.88900,0.88900,0.88900,0.88900,1685529600,5,0.00000,'1685529600','1min',2),(1262,10,3,112.58000,112.58000,112.58000,112.58000,1685529600,5,0.00000,'1685529600','1min',2),(1263,4,3,1867.00000,1867.00000,1867.00000,1867.00000,1685529600,5,0.00000,'1685529600','1min',2),(1264,6,3,89.18000,89.18000,89.18000,89.18000,1685529600,5,0.14430,'1685529600','1min',2),(1265,2,3,27084.74000,27084.74000,27084.74000,27084.74000,1685529660,5,0.00000,'1685529660','1min',2),(1266,4,3,1867.02000,1867.02000,1867.02000,1867.02000,1685529660,5,0.00000,'1685529660','1min',2),(1267,6,3,89.18000,89.18000,89.18000,89.18000,1685529660,5,0.00000,'1685529660','1min',2),(1268,10,3,112.58000,112.58000,112.58000,112.58000,1685529660,5,0.00000,'1685529660','1min',2),(1269,8,3,0.88840,0.88840,0.88840,0.88840,1685529660,5,0.00000,'1685529660','1min',2),(1270,8,3,0.88820,0.88820,0.88820,0.88820,1685529720,5,0.00000,'1685529720','1min',2),(1271,10,3,112.58000,112.58000,112.58000,112.58000,1685529720,5,0.00000,'1685529720','1min',2),(1272,2,3,27089.00000,27089.00000,27089.00000,27089.00000,1685529720,5,0.01097,'1685529720','1min',2),(1273,4,3,1867.49000,1867.49000,1867.49000,1867.49000,1685529720,5,0.00000,'1685529720','1min',2),(1274,6,3,89.18000,89.18000,89.18000,89.18000,1685529720,5,0.45850,'1685529720','1min',2),(1275,2,3,27089.92000,27089.92000,27089.92000,27089.92000,1685529780,5,0.00000,'1685529780','1min',2),(1276,4,3,1867.61000,1867.61000,1867.61000,1867.61000,1685529780,5,0.00000,'1685529780','1min',2),(1277,6,3,89.14000,89.14000,89.14000,89.14000,1685529780,5,0.00000,'1685529780','1min',2),(1278,8,3,0.88800,0.88800,0.88800,0.88800,1685529780,5,0.00000,'1685529780','1min',2),(1279,10,3,112.58000,112.58000,112.58000,112.58000,1685529780,5,0.00000,'1685529780','1min',2),(1280,2,3,27089.11000,27089.11000,27089.11000,27089.11000,1685529840,5,0.00000,'1685529840','1min',2),(1281,6,3,89.06000,89.06000,89.06000,89.06000,1685529840,5,0.00000,'1685529840','1min',2),(1282,8,3,0.88750,0.88750,0.88750,0.88750,1685529840,5,0.00000,'1685529840','1min',2),(1283,10,3,112.41000,112.41000,112.41000,112.41000,1685529840,5,0.00000,'1685529840','1min',2),(1284,4,3,1867.19000,1867.19000,1867.19000,1867.19000,1685529840,5,0.00000,'1685529840','1min',2),(1285,2,3,27084.55000,27084.55000,27084.55000,27084.55000,1685529900,5,0.00000,'1685529900','1min',2),(1286,4,3,1866.54000,1866.54000,1866.54000,1866.54000,1685529900,5,0.00000,'1685529900','1min',2),(1287,6,3,89.05000,89.05000,89.05000,89.05000,1685529900,5,0.00000,'1685529900','1min',2),(1288,8,3,0.88750,0.88750,0.88750,0.88750,1685529900,5,0.00000,'1685529900','1min',2),(1289,10,3,112.41000,112.41000,112.41000,112.41000,1685529900,5,0.00000,'1685529900','1min',2),(1290,10,3,112.39000,112.39000,112.39000,112.39000,1685529960,5,0.00000,'1685529960','1min',2),(1291,2,3,27084.88000,27084.88000,27084.88000,27084.88000,1685529960,5,0.00000,'1685529960','1min',2),(1292,4,3,1866.92000,1866.92000,1866.92000,1866.92000,1685529960,5,0.00000,'1685529960','1min',2),(1293,6,3,89.04000,89.04000,89.04000,89.04000,1685529960,5,0.65450,'1685529960','1min',2),(1294,8,3,0.88750,0.88750,0.88750,0.88750,1685529960,5,0.00000,'1685529960','1min',2),(1295,8,3,0.88720,0.88720,0.88720,0.88720,1685530020,5,0.00000,'1685530020','1min',2),(1296,10,3,112.39000,112.39000,112.39000,112.39000,1685530020,5,0.00000,'1685530020','1min',2),(1297,2,3,27086.48000,27086.48000,27086.48000,27086.48000,1685530020,5,0.00000,'1685530020','1min',2),(1298,4,3,1866.61000,1866.61000,1866.61000,1866.61000,1685530020,5,0.00000,'1685530020','1min',2),(1299,6,3,89.04000,89.04000,89.04000,89.04000,1685530020,5,0.00000,'1685530020','1min',2),(1300,4,3,1866.99000,1866.99000,1866.99000,1866.99000,1685530080,5,0.00000,'1685530080','1min',2),(1301,6,3,89.10000,89.10000,89.10000,89.10000,1685530080,5,0.00000,'1685530080','1min',2),(1302,8,3,0.88840,0.88840,0.88840,0.88840,1685530080,5,0.00000,'1685530080','1min',2),(1303,10,3,112.39000,112.39000,112.39000,112.39000,1685530080,5,0.00000,'1685530080','1min',2),(1304,2,3,27089.00000,27089.00000,27089.00000,27089.00000,1685530080,5,0.00000,'1685530080','1min',2),(1305,2,3,27086.27000,27086.27000,27086.27000,27086.27000,1685530140,5,0.01253,'1685530140','1min',2),(1306,4,3,1867.03000,1867.03000,1867.03000,1867.03000,1685530140,5,0.00000,'1685530140','1min',2),(1307,6,3,89.05000,89.05000,89.05000,89.05000,1685530140,5,0.00000,'1685530140','1min',2),(1308,8,3,0.88840,0.88840,0.88840,0.88840,1685530140,5,0.00000,'1685530140','1min',2),(1309,10,3,112.39000,112.39000,112.39000,112.39000,1685530140,5,0.00000,'1685530140','1min',2),(1310,8,3,0.88820,0.88820,0.88820,0.88820,1685530200,5,0.00000,'1685530200','1min',2),(1311,10,3,112.39000,112.39000,112.39000,112.39000,1685530200,5,0.00000,'1685530200','1min',2),(1312,2,3,27070.53000,27070.53000,27070.53000,27070.53000,1685530200,5,0.00564,'1685530200','1min',2),(1313,4,3,1865.47000,1865.47000,1865.47000,1865.47000,1685530200,5,0.20000,'1685530200','1min',2),(1314,6,3,89.01000,89.01000,89.01000,89.01000,1685530200,5,0.00000,'1685530200','1min',2),(1315,6,3,89.00000,89.00000,89.00000,89.00000,1685530260,5,0.00000,'1685530260','1min',2),(1316,8,3,0.88820,0.88820,0.88820,0.88820,1685530260,5,0.00000,'1685530260','1min',2),(1317,10,3,112.39000,112.39000,112.39000,112.39000,1685530260,5,0.00000,'1685530260','1min',2),(1318,2,3,27075.45000,27075.45000,27075.45000,27075.45000,1685530260,5,0.00000,'1685530260','1min',2),(1319,4,3,1866.10000,1866.10000,1866.10000,1866.10000,1685530260,5,2.85720,'1685530260','1min',2),(1320,10,3,112.39000,112.39000,112.39000,112.39000,1685530320,5,0.00000,'1685530320','1min',2),(1321,2,3,27072.00000,27072.00000,27072.00000,27072.00000,1685530320,5,0.00000,'1685530320','1min',2),(1322,4,3,1866.11000,1866.10000,1866.11000,1866.10000,1685530320,5,0.06200,'1685530320','1min',2),(1323,6,3,89.00000,89.00000,89.00000,89.00000,1685530320,5,0.00000,'1685530320','1min',2),(1324,8,3,0.88820,0.88820,0.88820,0.88820,1685530320,5,0.00000,'1685530320','1min',2),(1325,8,3,0.88820,0.88820,0.88820,0.88820,1685530380,5,0.00000,'1685530380','1min',2),(1326,10,3,112.39000,112.39000,112.39000,112.39000,1685530380,5,0.00000,'1685530380','1min',2),(1327,2,3,27071.49000,27071.49000,27071.49000,27071.49000,1685530380,5,0.00000,'1685530380','1min',2),(1328,4,3,1865.85000,1865.85000,1865.85000,1865.85000,1685530380,5,0.00000,'1685530380','1min',2),(1329,6,3,89.00000,89.00000,89.00000,89.00000,1685530380,5,0.00000,'1685530380','1min',2),(1330,10,3,112.40000,112.40000,112.40000,112.40000,1685530440,5,0.00000,'1685530440','1min',2),(1331,2,3,27071.98000,27071.98000,27071.98000,27071.98000,1685530440,5,0.00000,'1685530440','1min',2),(1332,4,3,1865.94000,1865.94000,1865.94000,1865.94000,1685530440,5,0.00000,'1685530440','1min',2),(1333,6,3,89.05000,89.05000,89.05000,89.05000,1685530440,5,0.45790,'1685530440','1min',2),(1334,8,3,0.88850,0.88850,0.88850,0.88850,1685530440,5,0.00000,'1685530440','1min',2),(1335,10,3,112.41000,112.41000,112.41000,112.41000,1685530500,5,0.00000,'1685530500','1min',2),(1336,2,3,27071.57000,27071.57000,27071.57000,27071.57000,1685530500,5,0.00000,'1685530500','1min',2),(1337,4,3,1865.85000,1865.85000,1865.85000,1865.85000,1685530500,5,0.00000,'1685530500','1min',2),(1338,6,3,89.04000,89.04000,89.04000,89.04000,1685530500,5,0.00000,'1685530500','1min',2),(1339,8,3,0.88850,0.88850,0.88850,0.88850,1685530500,5,0.00000,'1685530500','1min',2),(1340,10,3,112.41000,112.41000,112.41000,112.41000,1685530560,5,0.00000,'1685530560','1min',2),(1341,2,3,27069.83000,27069.83000,27069.83000,27069.83000,1685530560,5,0.00300,'1685530560','1min',2),(1342,4,3,1865.84000,1865.84000,1865.84000,1865.84000,1685530560,5,1.03430,'1685530560','1min',2),(1343,6,3,89.04000,89.04000,89.04000,89.04000,1685530560,5,0.00000,'1685530560','1min',2),(1344,8,3,0.88850,0.88850,0.88850,0.88850,1685530560,5,0.00000,'1685530560','1min',2),(1345,4,3,1865.01000,1865.01000,1865.01000,1865.01000,1685530620,5,0.00000,'1685530620','1min',2),(1346,6,3,89.03000,89.03000,89.03000,89.03000,1685530620,5,0.13460,'1685530620','1min',2),(1347,8,3,0.88820,0.88820,0.88820,0.88820,1685530620,5,0.00000,'1685530620','1min',2),(1348,10,3,112.41000,112.41000,112.41000,112.41000,1685530620,5,0.00000,'1685530620','1min',2),(1349,2,3,27060.27000,27060.27000,27060.27000,27060.27000,1685530620,5,0.09272,'1685530620','1min',2),(1350,8,3,0.88780,0.88780,0.88780,0.88780,1685530680,5,207.89230,'1685530680','1min',2),(1351,10,3,112.41000,112.41000,112.41000,112.41000,1685530680,5,0.00000,'1685530680','1min',2),(1352,2,3,27046.14000,27047.70000,27047.70000,27046.14000,1685530680,5,0.00382,'1685530680','1min',2),(1353,4,3,1864.44000,1865.39000,1865.39000,1864.44000,1685530680,5,2.74930,'1685530680','1min',2),(1354,6,3,89.08000,89.08000,89.08000,89.08000,1685530680,5,0.00000,'1685530680','1min',2),(1355,10,3,112.41000,112.41000,112.41000,112.41000,1685530740,5,0.00000,'1685530740','1min',2),(1356,2,3,27059.33000,27059.33000,27059.33000,27059.33000,1685530740,5,0.00000,'1685530740','1min',2),(1357,4,3,1865.76000,1865.76000,1865.76000,1865.76000,1685530740,5,0.00000,'1685530740','1min',2),(1358,6,3,89.09000,89.09000,89.09000,89.09000,1685530740,5,0.00000,'1685530740','1min',2),(1359,8,3,0.88820,0.88820,0.88820,0.88820,1685530740,5,0.00000,'1685530740','1min',2),(1360,6,3,89.09000,89.09000,89.09000,89.09000,1685530800,5,4.94280,'1685530800','1min',2),(1361,8,3,0.88820,0.88820,0.88820,0.88820,1685530800,5,0.00000,'1685530800','1min',2),(1362,10,3,112.41000,112.41000,112.41000,112.41000,1685530800,5,0.00000,'1685530800','1min',2),(1363,2,3,27054.58000,27054.58000,27054.58000,27054.58000,1685530800,5,0.00000,'1685530800','1min',2),(1364,4,3,1865.72000,1865.72000,1865.72000,1865.72000,1685530800,5,0.00000,'1685530800','1min',2),(1365,4,3,1865.22000,1865.22000,1865.22000,1865.22000,1685530860,5,0.00000,'1685530860','1min',2),(1366,6,3,89.10000,89.10000,89.10000,89.10000,1685530860,5,0.00000,'1685530860','1min',2),(1367,8,3,0.88800,0.88800,0.88800,0.88800,1685530860,5,0.00000,'1685530860','1min',2),(1368,10,3,112.38000,112.38000,112.38000,112.38000,1685530860,5,0.00000,'1685530860','1min',2),(1369,2,3,27050.01000,27050.01000,27050.01000,27050.01000,1685530860,5,0.00000,'1685530860','1min',2),(1370,10,3,112.38000,112.38000,112.38000,112.38000,1685530920,5,0.00000,'1685530920','1min',2),(1371,2,3,27060.50000,27060.50000,27060.50000,27060.50000,1685530920,5,0.00000,'1685530920','1min',2),(1372,4,3,1865.55000,1865.55000,1865.55000,1865.55000,1685530920,5,0.00000,'1685530920','1min',2),(1373,6,3,89.26000,89.24000,89.26000,89.24000,1685530920,5,7.34320,'1685530920','1min',2),(1374,8,3,0.88770,0.88770,0.88770,0.88770,1685530920,5,0.00000,'1685530920','1min',2),(1375,2,3,27067.99000,27067.99000,27067.99000,27067.99000,1685530980,5,0.00000,'1685530980','1min',2),(1376,4,3,1866.26000,1866.26000,1866.26000,1866.26000,1685530980,5,0.00000,'1685530980','1min',2),(1377,6,3,89.29000,89.29000,89.29000,89.29000,1685530980,5,9.47580,'1685530980','1min',2),(1378,8,3,0.88770,0.88780,0.88780,0.88770,1685530980,5,171.24820,'1685530980','1min',2),(1379,10,3,112.38000,112.38000,112.38000,112.38000,1685530980,5,0.00000,'1685530980','1min',2),(1380,6,3,89.32000,89.32000,89.32000,89.32000,1685531040,5,0.00000,'1685531040','1min',2),(1381,8,3,0.88760,0.88760,0.88760,0.88760,1685531040,5,0.00000,'1685531040','1min',2),(1382,10,3,112.38000,112.38000,112.38000,112.38000,1685531040,5,0.00000,'1685531040','1min',2),(1383,2,3,27068.00000,27067.99000,27068.00000,27067.99000,1685531040,5,0.00497,'1685531040','1min',2),(1384,4,3,1866.25000,1866.25000,1866.25000,1866.25000,1685531040,5,0.00000,'1685531040','1min',2),(1385,2,3,27072.48000,27072.48000,27072.48000,27072.48000,1685531100,5,0.00000,'1685531100','1min',2),(1386,4,3,1866.34000,1866.34000,1866.34000,1866.34000,1685531100,5,0.00000,'1685531100','1min',2),(1387,6,3,89.32000,89.32000,89.32000,89.32000,1685531100,5,0.00000,'1685531100','1min',2),(1388,8,3,0.88730,0.88730,0.88730,0.88730,1685531100,5,0.00000,'1685531100','1min',2),(1389,10,3,112.38000,112.38000,112.38000,112.38000,1685531100,5,0.00000,'1685531100','1min',2),(1390,6,3,89.31000,89.31000,89.31000,89.31000,1685531160,5,0.00000,'1685531160','1min',2),(1391,8,3,0.88730,0.88730,0.88730,0.88730,1685531160,5,0.00000,'1685531160','1min',2),(1392,10,3,112.38000,112.38000,112.38000,112.38000,1685531160,5,0.00000,'1685531160','1min',2),(1393,2,3,27063.07000,27063.06000,27063.07000,27063.06000,1685531160,5,0.04724,'1685531160','1min',2),(1394,4,3,1866.13000,1866.13000,1866.13000,1866.13000,1685531160,5,0.04600,'1685531160','1min',2),(1395,2,3,27037.50000,27037.50000,27037.50000,27037.50000,1685531220,5,0.00000,'1685531220','1min',2),(1396,4,3,1864.87000,1865.00000,1865.00000,1864.87000,1685531220,5,4.73373,'1685531220','1min',2),(1397,6,3,89.17000,89.17000,89.17000,89.17000,1685531220,5,0.00000,'1685531220','1min',2),(1398,8,3,0.88660,0.88660,0.88660,0.88660,1685531220,5,0.00000,'1685531220','1min',2),(1399,10,3,112.38000,112.38000,112.38000,112.38000,1685531220,5,0.00000,'1685531220','1min',2),(1400,10,3,112.38000,112.38000,112.38000,112.38000,1685531280,5,0.00000,'1685531280','1min',2),(1401,2,3,27016.22000,27016.22000,27016.22000,27016.22000,1685531280,5,0.00000,'1685531280','1min',2),(1402,4,3,1864.12000,1864.12000,1864.12000,1864.12000,1685531280,5,0.00000,'1685531280','1min',2),(1403,6,3,89.08000,89.08000,89.08000,89.08000,1685531280,5,0.00000,'1685531280','1min',2),(1404,8,3,0.88660,0.88660,0.88660,0.88660,1685531280,5,0.00000,'1685531280','1min',2),(1405,6,3,89.09000,89.09000,89.09000,89.09000,1685531340,5,0.00000,'1685531340','1min',2),(1406,8,3,0.88660,0.88660,0.88660,0.88660,1685531340,5,0.00000,'1685531340','1min',2),(1407,10,3,112.38000,112.38000,112.38000,112.38000,1685531340,5,0.00000,'1685531340','1min',2),(1408,2,3,27011.36000,27011.36000,27011.36000,27011.36000,1685531340,5,0.00182,'1685531340','1min',2),(1409,4,3,1863.38000,1863.38000,1863.38000,1863.38000,1685531340,5,0.03930,'1685531340','1min',2),(1410,6,3,89.04000,89.04000,89.04000,89.04000,1685531400,5,0.00000,'1685531400','1min',2),(1411,10,3,112.38000,112.38000,112.38000,112.38000,1685531400,5,0.00000,'1685531400','1min',2),(1412,2,3,27006.97000,27006.97000,27006.97000,27006.97000,1685531400,5,0.00000,'1685531400','1min',2),(1413,4,3,1863.12000,1863.12000,1863.12000,1863.12000,1685531400,5,0.00000,'1685531400','1min',2),(1414,8,3,0.88660,0.88660,0.88660,0.88660,1685531400,5,0.00000,'1685531400','1min',2),(1415,10,3,112.46000,112.46000,112.46000,112.46000,1685531460,5,0.00000,'1685531460','1min',2),(1416,2,3,27013.74000,27013.73000,27013.74000,27013.73000,1685531460,5,0.16345,'1685531460','1min',2),(1417,4,3,1863.30000,1863.30000,1863.30000,1863.30000,1685531460,5,0.00000,'1685531460','1min',2),(1418,6,3,89.04000,89.04000,89.04000,89.04000,1685531460,5,0.00000,'1685531460','1min',2),(1419,8,3,0.88620,0.88620,0.88620,0.88620,1685531460,5,0.00000,'1685531460','1min',2),(1420,2,3,27027.08000,27027.08000,27027.08000,27027.08000,1685531520,5,0.00000,'1685531520','1min',2),(1421,4,3,1864.28000,1864.28000,1864.28000,1864.28000,1685531520,5,0.00000,'1685531520','1min',2),(1422,6,3,89.09000,89.09000,89.09000,89.09000,1685531520,5,0.00000,'1685531520','1min',2),(1423,8,3,0.88660,0.88660,0.88660,0.88660,1685531520,5,0.00000,'1685531520','1min',2),(1424,10,3,112.46000,112.46000,112.46000,112.46000,1685531520,5,0.00000,'1685531520','1min',2),(1425,8,3,0.88650,0.88650,0.88650,0.88650,1685531580,5,0.00000,'1685531580','1min',2),(1426,10,3,112.46000,112.46000,112.46000,112.46000,1685531580,5,0.00000,'1685531580','1min',2),(1427,2,3,27044.44000,27044.44000,27044.44000,27044.44000,1685531580,5,0.00000,'1685531580','1min',2),(1428,6,3,89.19000,89.19000,89.19000,89.19000,1685531580,5,0.00000,'1685531580','1min',2),(1429,4,3,1865.65000,1865.65000,1865.65000,1865.65000,1685531580,5,0.00000,'1685531580','1min',2),(1430,8,3,0.88650,0.88650,0.88650,0.88650,1685531640,5,0.00000,'1685531640','1min',2),(1431,2,3,27059.00000,27059.99000,27060.00000,27059.00000,1685531640,5,0.36052,'1685531640','1min',2),(1432,4,3,1866.09000,1866.09000,1866.09000,1866.09000,1685531640,5,0.00000,'1685531640','1min',2),(1433,6,3,89.20000,89.20000,89.20000,89.20000,1685531640,5,0.00000,'1685531640','1min',2),(1434,10,3,112.46000,112.46000,112.46000,112.46000,1685531640,5,0.00000,'1685531640','1min',2),(1435,2,3,27076.50000,27078.00000,27078.00000,27076.50000,1685531700,5,0.29200,'1685531700','1min',2),(1436,4,3,1866.59000,1866.79000,1866.79000,1866.59000,1685531700,5,0.80000,'1685531700','1min',2),(1437,6,3,89.26000,89.26000,89.26000,89.26000,1685531700,5,0.26940,'1685531700','1min',2),(1438,8,3,0.88660,0.88660,0.88660,0.88660,1685531700,5,0.00000,'1685531700','1min',2),(1439,10,3,112.46000,112.46000,112.46000,112.46000,1685531700,5,0.00000,'1685531700','1min',2),(1440,6,3,89.24000,89.24000,89.24000,89.24000,1685531760,5,0.00000,'1685531760','1min',2),(1441,8,3,0.88590,0.88590,0.88590,0.88590,1685531760,5,0.00000,'1685531760','1min',2),(1442,10,3,112.46000,112.46000,112.46000,112.46000,1685531760,5,0.00000,'1685531760','1min',2),(1443,2,3,27075.47000,27075.46000,27075.47000,27075.46000,1685531760,5,0.00277,'1685531760','1min',2),(1444,4,3,1866.21000,1866.21000,1866.21000,1866.21000,1685531760,5,0.00000,'1685531760','1min',2),(1445,2,3,27076.50000,27076.50000,27076.50000,27076.50000,1685531820,5,0.00000,'1685531820','1min',2),(1446,4,3,1865.64000,1865.64000,1865.64000,1865.64000,1685531820,5,0.00000,'1685531820','1min',2),(1447,6,3,89.22000,89.22000,89.22000,89.22000,1685531820,5,0.00000,'1685531820','1min',2),(1448,8,3,0.88590,0.88590,0.88590,0.88590,1685531820,5,0.00000,'1685531820','1min',2),(1449,10,3,112.41000,112.41000,112.41000,112.41000,1685531820,5,0.00000,'1685531820','1min',2),(1450,2,3,27072.00000,27072.00000,27072.00000,27072.00000,1685531880,5,0.00000,'1685531880','1min',2),(1451,6,3,89.22000,89.22000,89.22000,89.22000,1685531880,5,0.00000,'1685531880','1min',2),(1452,8,3,0.88590,0.88590,0.88590,0.88590,1685531880,5,0.00000,'1685531880','1min',2),(1453,10,3,112.42000,112.42000,112.42000,112.42000,1685531880,5,0.00000,'1685531880','1min',2),(1454,4,3,1865.44000,1865.44000,1865.44000,1865.44000,1685531880,5,0.00000,'1685531880','1min',2),(1455,10,3,112.42000,112.42000,112.42000,112.42000,1685531940,5,0.00000,'1685531940','1min',2),(1456,2,3,27072.00000,27072.00000,27072.00000,27072.00000,1685531940,5,0.00000,'1685531940','1min',2),(1457,4,3,1865.56000,1865.56000,1865.56000,1865.56000,1685531940,5,0.00000,'1685531940','1min',2),(1458,8,3,0.88590,0.88590,0.88590,0.88590,1685531940,5,0.00000,'1685531940','1min',2),(1459,6,3,89.23000,89.23000,89.23000,89.23000,1685531940,5,0.75980,'1685531940','1min',2),(1460,4,3,1865.54000,1865.54000,1865.54000,1865.54000,1685532000,5,0.00000,'1685532000','1min',2),(1461,10,3,112.42000,112.42000,112.42000,112.42000,1685532000,5,0.00000,'1685532000','1min',2),(1462,2,3,27078.99000,27078.99000,27078.99000,27078.99000,1685532000,5,0.00000,'1685532000','1min',2),(1463,6,3,89.28000,89.28000,89.28000,89.28000,1685532000,5,0.00000,'1685532000','1min',2),(1464,8,3,0.88590,0.88590,0.88590,0.88590,1685532000,5,0.00000,'1685532000','1min',2),(1465,10,3,112.42000,112.42000,112.42000,112.42000,1685532060,5,0.00000,'1685532060','1min',2),(1466,2,3,27060.66000,27060.66000,27060.66000,27060.66000,1685532060,5,0.00000,'1685532060','1min',2),(1467,4,3,1864.27000,1864.27000,1864.27000,1864.27000,1685532060,5,0.00000,'1685532060','1min',2),(1468,6,3,89.12000,89.12000,89.12000,89.12000,1685532060,5,0.00000,'1685532060','1min',2),(1469,8,3,0.88500,0.88500,0.88500,0.88500,1685532060,5,0.00000,'1685532060','1min',2),(1470,10,3,112.42000,112.42000,112.42000,112.42000,1685532120,5,0.00000,'1685532120','1min',2),(1471,2,3,27068.00000,27068.00000,27068.00000,27068.00000,1685532120,5,0.00000,'1685532120','1min',2),(1472,4,3,1864.24000,1864.24000,1864.24000,1864.24000,1685532120,5,0.00000,'1685532120','1min',2),(1473,6,3,89.10000,89.10000,89.10000,89.10000,1685532120,5,0.00000,'1685532120','1min',2),(1474,8,3,0.88500,0.88500,0.88500,0.88500,1685532120,5,0.00000,'1685532120','1min',2),(1475,2,3,27092.50000,27093.00000,27093.00000,27092.50000,1685532180,5,0.04000,'1685532180','1min',2),(1476,4,3,1865.90000,1865.90000,1865.90000,1865.90000,1685532180,5,0.00000,'1685532180','1min',2),(1477,6,3,89.24000,89.24000,89.24000,89.24000,1685532180,5,0.00000,'1685532180','1min',2),(1478,8,3,0.88560,0.88560,0.88560,0.88560,1685532180,5,0.00000,'1685532180','1min',2),(1479,10,3,112.42000,112.42000,112.42000,112.42000,1685532180,5,0.00000,'1685532180','1min',2),(1480,2,3,27106.86000,27106.86000,27106.86000,27106.86000,1685532240,5,0.00000,'1685532240','1min',2),(1481,4,3,1866.86000,1866.86000,1866.86000,1866.86000,1685532240,5,0.00000,'1685532240','1min',2),(1482,6,3,89.28000,89.28000,89.28000,89.28000,1685532240,5,0.00000,'1685532240','1min',2),(1483,8,3,0.88560,0.88560,0.88560,0.88560,1685532240,5,0.00000,'1685532240','1min',2),(1484,10,3,112.42000,112.42000,112.42000,112.42000,1685532240,5,0.00000,'1685532240','1min',2),(1485,4,3,1866.93000,1866.93000,1866.93000,1866.93000,1685532300,5,0.00000,'1685532300','1min',2),(1486,6,3,89.29000,89.29000,89.29000,89.29000,1685532300,5,0.00000,'1685532300','1min',2),(1487,8,3,0.88560,0.88560,0.88560,0.88560,1685532300,5,0.00000,'1685532300','1min',2),(1488,10,3,112.42000,112.42000,112.42000,112.42000,1685532300,5,0.00000,'1685532300','1min',2),(1489,2,3,27106.33000,27106.33000,27106.33000,27106.33000,1685532300,5,0.00069,'1685532300','1min',2),(1490,10,3,112.42000,112.42000,112.42000,112.42000,1685532360,5,0.00000,'1685532360','1min',2),(1491,2,3,27114.00000,27114.00000,27114.00000,27114.00000,1685532360,5,0.00000,'1685532360','1min',2),(1492,4,3,1866.95000,1866.95000,1866.95000,1866.95000,1685532360,5,0.00000,'1685532360','1min',2),(1493,6,3,89.27000,89.27000,89.27000,89.27000,1685532360,5,0.00000,'1685532360','1min',2),(1494,8,3,0.88560,0.88560,0.88560,0.88560,1685532360,5,0.00000,'1685532360','1min',2),(1495,2,3,27117.49000,27117.49000,27117.49000,27117.49000,1685532420,5,0.00182,'1685532420','1min',2),(1496,4,3,1867.19000,1867.19000,1867.19000,1867.19000,1685532420,5,0.00000,'1685532420','1min',2),(1497,6,3,89.30000,89.30000,89.30000,89.30000,1685532420,5,0.00000,'1685532420','1min',2),(1498,8,3,0.88560,0.88560,0.88560,0.88560,1685532420,5,0.00000,'1685532420','1min',2),(1499,10,3,112.42000,112.42000,112.42000,112.42000,1685532420,5,0.00000,'1685532420','1min',2),(1500,8,3,0.88560,0.88560,0.88560,0.88560,1685532480,5,0.00000,'1685532480','1min',2),(1501,10,3,112.42000,112.42000,112.42000,112.42000,1685532480,5,0.00000,'1685532480','1min',2),(1502,2,3,27110.01000,27110.01000,27110.01000,27110.01000,1685532480,5,0.00368,'1685532480','1min',2),(1503,4,3,1867.18000,1867.18000,1867.18000,1867.18000,1685532480,5,0.00000,'1685532480','1min',2),(1504,6,3,89.27000,89.27000,89.27000,89.27000,1685532480,5,0.00000,'1685532480','1min',2),(1505,2,3,27114.00000,27114.00000,27114.00000,27114.00000,1685532540,5,0.05600,'1685532540','1min',2),(1506,4,3,1867.70000,1867.70000,1867.70000,1867.70000,1685532540,5,0.00000,'1685532540','1min',2),(1507,6,3,89.29000,89.29000,89.29000,89.29000,1685532540,5,0.00000,'1685532540','1min',2),(1508,8,3,0.88560,0.88560,0.88560,0.88560,1685532540,5,0.00000,'1685532540','1min',2),(1509,10,3,112.42000,112.42000,112.42000,112.42000,1685532540,5,0.00000,'1685532540','1min',2),(1510,8,3,0.88660,0.88660,0.88660,0.88660,1685532600,5,0.00000,'1685532600','1min',2),(1511,10,3,112.42000,112.42000,112.42000,112.42000,1685532600,5,0.00000,'1685532600','1min',2),(1512,2,3,27110.87000,27110.87000,27110.87000,27110.87000,1685532600,5,0.00000,'1685532600','1min',2),(1513,4,3,1868.11000,1868.11000,1868.11000,1868.11000,1685532600,5,0.93110,'1685532600','1min',2),(1514,6,3,89.28000,89.28000,89.28000,89.28000,1685532600,5,0.35830,'1685532600','1min',2),(1515,2,3,27114.22000,27114.22000,27114.22000,27114.22000,1685532660,5,0.00000,'1685532660','1min',2),(1516,8,3,0.88660,0.88660,0.88660,0.88660,1685532660,5,0.00000,'1685532660','1min',2),(1517,10,3,112.42000,112.42000,112.42000,112.42000,1685532660,5,0.00000,'1685532660','1min',2),(1518,4,3,1867.81000,1867.81000,1867.81000,1867.81000,1685532660,5,0.00000,'1685532660','1min',2),(1519,6,3,89.28000,89.28000,89.28000,89.28000,1685532660,5,0.00000,'1685532660','1min',2),(1520,4,3,1868.22000,1868.22000,1868.22000,1868.22000,1685532720,5,0.00000,'1685532720','1min',2),(1521,6,3,89.27000,89.27000,89.27000,89.27000,1685532720,5,0.00000,'1685532720','1min',2),(1522,8,3,0.88630,0.88630,0.88630,0.88630,1685532720,5,0.00000,'1685532720','1min',2),(1523,10,3,112.42000,112.42000,112.42000,112.42000,1685532720,5,0.00000,'1685532720','1min',2),(1524,2,3,27114.47000,27114.47000,27114.47000,27114.47000,1685532720,5,0.00000,'1685532720','1min',2),(1525,2,3,27114.50000,27114.50000,27114.50000,27114.50000,1685532780,5,0.00000,'1685532780','1min',2),(1526,4,3,1868.04000,1868.04000,1868.04000,1868.04000,1685532780,5,0.00000,'1685532780','1min',2),(1527,6,3,89.27000,89.27000,89.27000,89.27000,1685532780,5,0.00000,'1685532780','1min',2),(1528,8,3,0.88630,0.88630,0.88630,0.88630,1685532780,5,0.00000,'1685532780','1min',2),(1529,10,3,112.42000,112.42000,112.42000,112.42000,1685532780,5,0.00000,'1685532780','1min',2),(1530,2,3,27110.00000,27110.00000,27110.00000,27110.00000,1685532840,5,0.00000,'1685532840','1min',2),(1531,4,3,1867.81000,1867.81000,1867.81000,1867.81000,1685532840,5,0.00000,'1685532840','1min',2),(1532,6,3,89.25000,89.25000,89.25000,89.25000,1685532840,5,0.00000,'1685532840','1min',2),(1533,8,3,0.88630,0.88630,0.88630,0.88630,1685532840,5,0.00000,'1685532840','1min',2),(1534,10,3,112.42000,112.42000,112.42000,112.42000,1685532840,5,0.00000,'1685532840','1min',2),(1535,8,3,0.88630,0.88630,0.88630,0.88630,1685532900,5,0.00000,'1685532900','1min',2),(1536,4,3,1867.27000,1867.27000,1867.27000,1867.27000,1685532900,5,0.00000,'1685532900','1min',2),(1537,6,3,89.22000,89.22000,89.22000,89.22000,1685532900,5,1.25150,'1685532900','1min',2),(1538,10,3,112.42000,112.42000,112.42000,112.42000,1685532900,5,0.00000,'1685532900','1min',2),(1539,2,3,27110.00000,27109.06000,27110.00000,27109.05000,1685532900,5,0.19142,'1685532900','1min',2),(1540,8,3,0.88630,0.88630,0.88630,0.88630,1685532960,5,0.00000,'1685532960','1min',2),(1541,10,3,112.42000,112.42000,112.42000,112.42000,1685532960,5,0.00000,'1685532960','1min',2),(1542,6,3,89.22000,89.22000,89.22000,89.22000,1685532960,5,0.00000,'1685532960','1min',2),(1543,2,3,27109.05000,27108.55000,27109.05000,27108.54000,1685532960,5,0.06801,'1685532960','1min',2),(1544,4,3,1867.34000,1867.34000,1867.34000,1867.34000,1685532960,5,0.00000,'1685532960','1min',2),(1545,2,3,27105.02000,27105.02000,27105.02000,27105.02000,1685533020,5,0.00000,'1685533020','1min',2),(1546,6,3,89.22000,89.22000,89.22000,89.22000,1685533020,5,0.44840,'1685533020','1min',2),(1547,8,3,0.88650,0.88650,0.88650,0.88650,1685533020,5,0.00000,'1685533020','1min',2),(1548,10,3,112.42000,112.42000,112.42000,112.42000,1685533020,5,0.00000,'1685533020','1min',2),(1549,4,3,1867.26000,1867.26000,1867.26000,1867.26000,1685533020,5,0.00000,'1685533020','1min',2),(1550,10,3,112.42000,112.42000,112.42000,112.42000,1685533080,5,0.00000,'1685533080','1min',2),(1551,2,3,27100.00000,27095.54000,27100.00000,27092.65000,1685533080,5,3.00417,'1685533080','1min',2),(1552,4,3,1866.88000,1866.88000,1866.88000,1866.88000,1685533080,5,0.00000,'1685533080','1min',2),(1553,6,3,89.20000,89.20000,89.20000,89.20000,1685533080,5,0.34750,'1685533080','1min',2),(1554,8,3,0.88650,0.88650,0.88650,0.88650,1685533080,5,0.00000,'1685533080','1min',2),(1555,4,3,1866.89000,1866.89000,1866.89000,1866.89000,1685533140,5,0.00000,'1685533140','1min',2),(1556,6,3,89.23000,89.23000,89.23000,89.23000,1685533140,5,0.48520,'1685533140','1min',2),(1557,8,3,0.88650,0.88650,0.88650,0.88650,1685533140,5,0.00000,'1685533140','1min',2),(1558,10,3,112.63000,112.63000,112.63000,112.63000,1685533140,5,0.00000,'1685533140','1min',2),(1559,2,3,27109.05000,27109.05000,27109.05000,27109.05000,1685533140,5,0.14521,'1685533140','1min',2),(1560,10,3,112.63000,112.63000,112.63000,112.63000,1685533200,5,0.00000,'1685533200','1min',2),(1561,2,3,27113.00000,27113.00000,27113.00000,27113.00000,1685533200,5,0.00000,'1685533200','1min',2),(1562,4,3,1867.02000,1867.02000,1867.02000,1867.02000,1685533200,5,0.01910,'1685533200','1min',2),(1563,6,3,89.21000,89.21000,89.21000,89.20000,1685533200,5,0.92310,'1685533200','1min',2),(1564,8,3,0.88650,0.88650,0.88650,0.88650,1685533200,5,0.00000,'1685533200','1min',2),(1565,8,3,0.88650,0.88650,0.88650,0.88650,1685533260,5,0.00000,'1685533260','1min',2),(1566,10,3,112.59000,112.59000,112.59000,112.59000,1685533260,5,0.00000,'1685533260','1min',2),(1567,2,3,27113.99000,27113.99000,27113.99000,27113.99000,1685533260,5,0.00000,'1685533260','1min',2),(1568,4,3,1867.24000,1867.24000,1867.24000,1867.24000,1685533260,5,0.03980,'1685533260','1min',2),(1569,6,3,89.23000,89.25000,89.25000,89.23000,1685533260,5,0.50870,'1685533260','1min',2),(1570,8,3,0.88650,0.88650,0.88650,0.88650,1685533320,5,0.00000,'1685533320','1min',2),(1571,10,3,112.74000,112.74000,112.74000,112.74000,1685533320,5,0.00000,'1685533320','1min',2),(1572,2,3,27121.03000,27121.03000,27121.03000,27121.03000,1685533320,5,0.00507,'1685533320','1min',2),(1573,4,3,1867.85000,1867.85000,1867.85000,1867.85000,1685533320,5,0.00000,'1685533320','1min',2),(1574,6,3,89.25000,89.25000,89.25000,89.25000,1685533320,5,0.54250,'1685533320','1min',2),(1575,4,3,1867.54000,1867.54000,1867.54000,1867.54000,1685533380,5,0.00000,'1685533380','1min',2),(1576,6,3,89.22000,89.22000,89.22000,89.22000,1685533380,5,0.00000,'1685533380','1min',2),(1577,8,3,0.88650,0.88650,0.88650,0.88650,1685533380,5,0.00000,'1685533380','1min',2),(1578,10,3,112.74000,112.74000,112.74000,112.74000,1685533380,5,0.00000,'1685533380','1min',2),(1579,2,3,27114.65000,27114.65000,27114.65000,27114.65000,1685533380,5,0.15112,'1685533380','1min',2),(1580,8,3,0.88650,0.88650,0.88650,0.88650,1685533440,5,0.00000,'1685533440','1min',2),(1581,10,3,112.74000,112.74000,112.74000,112.74000,1685533440,5,0.00000,'1685533440','1min',2),(1582,2,3,27116.79000,27116.79000,27116.79000,27116.79000,1685533440,5,0.00184,'1685533440','1min',2),(1583,4,3,1867.56000,1867.56000,1867.56000,1867.56000,1685533440,5,0.00000,'1685533440','1min',2),(1584,6,3,89.22000,89.22000,89.22000,89.22000,1685533440,5,0.00000,'1685533440','1min',2),(1585,6,3,89.22000,89.22000,89.22000,89.22000,1685533500,5,0.00000,'1685533500','1min',2),(1586,8,3,0.88650,0.88650,0.88650,0.88650,1685533500,5,0.00000,'1685533500','1min',2),(1587,10,3,112.74000,112.74000,112.74000,112.74000,1685533500,5,0.00000,'1685533500','1min',2),(1588,2,3,27116.79000,27116.79000,27116.79000,27116.79000,1685533500,5,0.00183,'1685533500','1min',2),(1589,4,3,1867.46000,1867.46000,1867.46000,1867.46000,1685533500,5,0.00000,'1685533500','1min',2),(1590,10,3,112.74000,112.74000,112.74000,112.74000,1685533560,5,0.00000,'1685533560','1min',2),(1591,2,3,27110.01000,27110.01000,27110.01000,27110.01000,1685533560,5,0.00183,'1685533560','1min',2),(1592,4,3,1867.99000,1867.99000,1867.99000,1867.99000,1685533560,5,0.00000,'1685533560','1min',2),(1593,6,3,89.20000,89.20000,89.20000,89.20000,1685533560,5,0.45300,'1685533560','1min',2),(1594,8,3,0.88600,0.88600,0.88600,0.88600,1685533560,5,442.11220,'1685533560','1min',2),(1595,2,3,27100.00000,27100.00000,27100.00000,27100.00000,1685533620,5,0.00000,'1685533620','1min',2),(1596,4,3,1866.88000,1866.88000,1866.88000,1866.88000,1685533620,5,0.00000,'1685533620','1min',2),(1597,6,3,89.14000,89.14000,89.14000,89.14000,1685533620,5,0.00000,'1685533620','1min',2),(1598,8,3,0.88650,0.88650,0.88650,0.88650,1685533620,5,0.00000,'1685533620','1min',2),(1599,10,3,112.67000,112.67000,112.67000,112.67000,1685533620,5,0.00000,'1685533620','1min',2),(1600,10,3,112.67000,112.67000,112.67000,112.67000,1685533680,5,0.00000,'1685533680','1min',2),(1601,2,3,27106.50000,27107.00000,27107.00000,27106.50000,1685533680,5,0.11251,'1685533680','1min',2),(1602,4,3,1866.85000,1866.85000,1866.85000,1866.85000,1685533680,5,0.00000,'1685533680','1min',2),(1603,6,3,89.15000,89.15000,89.15000,89.15000,1685533680,5,0.00000,'1685533680','1min',2),(1604,8,3,0.88550,0.88550,0.88550,0.88550,1685533680,5,0.00000,'1685533680','1min',2),(1605,2,3,27109.19000,27109.19000,27109.19000,27109.19000,1685533740,5,0.02028,'1685533740','1min',2),(1606,6,3,89.14000,89.14000,89.14000,89.14000,1685533740,5,0.13460,'1685533740','1min',2),(1607,8,3,0.88550,0.88550,0.88550,0.88550,1685533740,5,0.00000,'1685533740','1min',2),(1608,10,3,112.67000,112.67000,112.67000,112.67000,1685533740,5,0.00000,'1685533740','1min',2),(1609,4,3,1866.90000,1866.90000,1866.90000,1866.90000,1685533740,5,0.00000,'1685533740','1min',2),(1610,6,3,89.12000,89.12000,89.12000,89.12000,1685533800,5,0.00000,'1685533800','1min',2),(1611,8,3,0.88550,0.88550,0.88550,0.88550,1685533800,5,0.00000,'1685533800','1min',2),(1612,10,3,112.67000,112.67000,112.67000,112.67000,1685533800,5,0.00000,'1685533800','1min',2),(1613,2,3,27113.50000,27112.99000,27113.50000,27112.99000,1685533800,5,0.34690,'1685533800','1min',2),(1614,4,3,1867.21000,1867.21000,1867.21000,1867.21000,1685533800,5,0.00000,'1685533800','1min',2),(1615,4,3,1867.19000,1867.19000,1867.19000,1867.19000,1685533860,5,0.00000,'1685533860','1min',2),(1616,6,3,89.12000,89.12000,89.12000,89.12000,1685533860,5,0.00000,'1685533860','1min',2),(1617,8,3,0.88510,0.88510,0.88510,0.88510,1685533860,5,0.00000,'1685533860','1min',2),(1618,10,3,112.67000,112.67000,112.67000,112.67000,1685533860,5,0.00000,'1685533860','1min',2),(1619,2,3,27114.49000,27114.49000,27114.49000,27114.49000,1685533860,5,0.00000,'1685533860','1min',2),(1620,8,3,0.88580,0.88580,0.88580,0.88580,1685533920,5,357.93590,'1685533920','1min',2),(1621,10,3,112.67000,112.67000,112.67000,112.67000,1685533920,5,0.00000,'1685533920','1min',2),(1622,2,3,27100.00000,27100.00000,27100.00000,27100.00000,1685533920,5,0.05687,'1685533920','1min',2),(1623,4,3,1866.65000,1866.65000,1866.65000,1866.65000,1685533920,5,0.00000,'1685533920','1min',2),(1624,6,3,89.12000,89.12000,89.12000,89.12000,1685533920,5,0.00000,'1685533920','1min',2),(1625,10,3,112.67000,112.67000,112.67000,112.67000,1685533980,5,0.00000,'1685533980','1min',2),(1626,2,3,27096.55000,27096.55000,27096.55000,27096.55000,1685533980,5,0.00000,'1685533980','1min',2),(1627,4,3,1866.11000,1866.11000,1866.11000,1866.11000,1685533980,5,0.00000,'1685533980','1min',2),(1628,6,3,89.08000,89.08000,89.08000,89.08000,1685533980,5,0.00000,'1685533980','1min',2),(1629,8,3,0.88550,0.88550,0.88550,0.88550,1685533980,5,0.00000,'1685533980','1min',2),(1630,6,3,89.08000,89.08000,89.08000,89.08000,1685534040,5,0.00000,'1685534040','1min',2),(1631,8,3,0.88590,0.88590,0.88590,0.88590,1685534040,5,0.00000,'1685534040','1min',2),(1632,10,3,112.67000,112.67000,112.67000,112.67000,1685534040,5,0.00000,'1685534040','1min',2),(1633,2,3,27090.00000,27090.00000,27090.00000,27090.00000,1685534040,5,0.03155,'1685534040','1min',2),(1634,4,3,1866.15000,1866.15000,1866.15000,1866.15000,1685534040,5,0.00000,'1685534040','1min',2),(1635,4,3,1865.60000,1865.60000,1865.60000,1865.60000,1685534100,5,0.00000,'1685534100','1min',2),(1636,6,3,89.11000,89.11000,89.11000,89.11000,1685534100,5,0.00000,'1685534100','1min',2),(1637,8,3,0.88590,0.88590,0.88590,0.88590,1685534100,5,0.00000,'1685534100','1min',2),(1638,10,3,112.67000,112.67000,112.67000,112.67000,1685534100,5,0.00000,'1685534100','1min',2),(1639,2,3,27094.49000,27094.50000,27094.50000,27094.49000,1685534100,5,0.08784,'1685534100','1min',2),(1640,4,3,1865.39000,1865.39000,1865.39000,1865.39000,1685534160,5,0.00000,'1685534160','1min',2),(1641,6,3,89.10000,89.10000,89.10000,89.10000,1685534160,5,0.00000,'1685534160','1min',2),(1642,8,3,0.88590,0.88590,0.88590,0.88590,1685534160,5,0.00000,'1685534160','1min',2),(1643,10,3,112.67000,112.67000,112.67000,112.67000,1685534160,5,0.00000,'1685534160','1min',2),(1644,2,3,27094.50000,27094.50000,27094.50000,27094.50000,1685534160,5,0.00000,'1685534160','1min',2),(1645,10,3,112.67000,112.67000,112.67000,112.67000,1685534220,5,0.00000,'1685534220','1min',2),(1646,2,3,27090.00000,27090.00000,27090.00000,27090.00000,1685534220,5,0.00000,'1685534220','1min',2),(1647,4,3,1865.21000,1865.21000,1865.21000,1865.21000,1685534220,5,0.00000,'1685534220','1min',2),(1648,6,3,89.09000,89.09000,89.09000,89.09000,1685534220,5,0.00000,'1685534220','1min',2),(1649,8,3,0.88560,0.88560,0.88560,0.88560,1685534220,5,0.00000,'1685534220','1min',2),(1650,2,3,27088.00000,27088.00000,27088.00000,27088.00000,1685534280,5,0.00135,'1685534280','1min',2),(1651,4,3,1865.02000,1865.02000,1865.02000,1865.02000,1685534280,5,0.00000,'1685534280','1min',2),(1652,6,3,89.09000,89.09000,89.09000,89.09000,1685534280,5,0.00000,'1685534280','1min',2),(1653,10,3,112.67000,112.67000,112.67000,112.67000,1685534280,5,0.00000,'1685534280','1min',2),(1654,8,3,0.88560,0.88560,0.88560,0.88560,1685534280,5,0.00000,'1685534280','1min',2),(1655,10,3,112.67000,112.67000,112.67000,112.67000,1685534340,5,0.00000,'1685534340','1min',2),(1656,2,3,27093.00000,27093.00000,27093.00000,27093.00000,1685534340,5,0.00000,'1685534340','1min',2),(1657,4,3,1865.02000,1865.02000,1865.02000,1865.02000,1685534340,5,0.00000,'1685534340','1min',2),(1658,6,3,89.09000,89.09000,89.09000,89.09000,1685534340,5,0.00000,'1685534340','1min',2),(1659,8,3,0.88530,0.88530,0.88530,0.88530,1685534340,5,0.00000,'1685534340','1min',2),(1660,2,3,27096.28000,27096.28000,27096.28000,27096.28000,1685534400,5,0.00000,'1685534400','1min',2),(1661,4,3,1865.13000,1865.13000,1865.13000,1865.13000,1685534400,5,0.00000,'1685534400','1min',2),(1662,6,3,89.09000,89.09000,89.09000,89.09000,1685534400,5,0.00000,'1685534400','1min',2),(1663,8,3,0.88530,0.88530,0.88530,0.88530,1685534400,5,167.13710,'1685534400','1min',2),(1664,10,3,112.67000,112.67000,112.67000,112.67000,1685534400,5,0.00000,'1685534400','1min',2),(1665,10,3,112.53000,112.53000,112.53000,112.53000,1685534460,5,0.00000,'1685534460','1min',2),(1666,2,3,27104.50000,27104.50000,27104.50000,27104.50000,1685534460,5,0.00000,'1685534460','1min',2),(1667,6,3,89.07000,89.07000,89.07000,89.07000,1685534460,5,0.00000,'1685534460','1min',2),(1668,8,3,0.88540,0.88540,0.88540,0.88540,1685534460,5,0.00000,'1685534460','1min',2),(1669,4,3,1865.49000,1865.49000,1865.49000,1865.49000,1685534460,5,0.00000,'1685534460','1min',2),(1670,2,3,27114.00000,27114.00000,27114.00000,27114.00000,1685534520,5,0.00000,'1685534520','1min',2),(1671,4,3,1866.52000,1866.52000,1866.52000,1866.52000,1685534520,5,0.00000,'1685534520','1min',2),(1672,6,3,89.13000,89.13000,89.13000,89.13000,1685534520,5,0.00000,'1685534520','1min',2),(1673,8,3,0.88540,0.88540,0.88540,0.88540,1685534520,5,0.00000,'1685534520','1min',2),(1674,10,3,112.58000,112.58000,112.58000,112.58000,1685534520,5,0.00000,'1685534520','1min',2),(1675,2,3,27116.00000,27116.00000,27116.00000,27116.00000,1685534580,5,0.08000,'1685534580','1min',2),(1676,4,3,1867.07000,1867.07000,1867.07000,1867.07000,1685534580,5,0.00000,'1685534580','1min',2),(1677,6,3,89.14000,89.14000,89.14000,89.14000,1685534580,5,0.00000,'1685534580','1min',2),(1678,8,3,0.88540,0.88540,0.88540,0.88540,1685534580,5,0.00000,'1685534580','1min',2),(1679,10,3,112.58000,112.58000,112.58000,112.58000,1685534580,5,0.00000,'1685534580','1min',2),(1680,8,3,0.88550,0.88550,0.88550,0.88550,1685534640,5,0.00000,'1685534640','1min',2),(1681,10,3,112.53000,112.53000,112.53000,112.53000,1685534640,5,0.00000,'1685534640','1min',2),(1682,2,3,27115.00000,27115.00000,27115.00000,27115.00000,1685534640,5,0.01300,'1685534640','1min',2),(1683,4,3,1867.29000,1867.29000,1867.29000,1867.29000,1685534640,5,0.00000,'1685534640','1min',2),(1684,6,3,89.10000,89.10000,89.10000,89.10000,1685534640,5,0.00000,'1685534640','1min',2),(1685,6,3,89.10000,89.10000,89.10000,89.10000,1685534700,5,0.00000,'1685534700','1min',2),(1686,8,3,0.88550,0.88550,0.88550,0.88550,1685534700,5,0.00000,'1685534700','1min',2),(1687,10,3,112.53000,112.53000,112.53000,112.53000,1685534700,5,0.00000,'1685534700','1min',2),(1688,2,3,27100.70000,27100.70000,27100.70000,27100.70000,1685534700,5,0.00000,'1685534700','1min',2),(1689,4,3,1866.62000,1866.62000,1866.62000,1866.62000,1685534700,5,0.00000,'1685534700','1min',2),(1690,6,3,89.05000,89.05000,89.05000,89.05000,1685534760,5,0.13460,'1685534760','1min',2),(1691,8,3,0.88480,0.88480,0.88480,0.88480,1685534760,5,0.00000,'1685534760','1min',2),(1692,10,3,112.45000,112.45000,112.45000,112.45000,1685534760,5,0.00000,'1685534760','1min',2),(1693,2,3,27095.00000,27095.00000,27095.00000,27095.00000,1685534760,5,0.90456,'1685534760','1min',2),(1694,4,3,1865.78000,1865.78000,1865.78000,1865.78000,1685534760,5,0.00000,'1685534760','1min',2),(1695,6,3,88.91000,88.91000,88.91000,88.91000,1685534820,5,0.00000,'1685534820','1min',2),(1696,2,3,27080.01000,27080.01000,27080.01000,27080.01000,1685534820,5,0.00000,'1685534820','1min',2),(1697,4,3,1864.30000,1864.30000,1864.30000,1864.30000,1685534820,5,0.21390,'1685534820','1min',2),(1698,8,3,0.88420,0.88420,0.88420,0.88420,1685534820,5,0.00000,'1685534820','1min',2),(1699,10,3,112.41000,112.41000,112.41000,112.41000,1685534820,5,0.00000,'1685534820','1min',2),(1700,4,3,1863.71000,1863.71000,1863.71000,1863.71000,1685534880,5,0.00000,'1685534880','1min',2),(1701,6,3,88.83000,88.83000,88.83000,88.83000,1685534880,5,0.28430,'1685534880','1min',2),(1702,8,3,0.88380,0.88380,0.88380,0.88380,1685534880,5,312.06670,'1685534880','1min',2),(1703,10,3,112.39000,112.39000,112.39000,112.39000,1685534880,5,0.21360,'1685534880','1min',2),(1704,2,3,27070.00000,27070.00000,27070.00000,27070.00000,1685534880,5,0.00000,'1685534880','1min',2),(1705,4,3,1863.75000,1863.75000,1863.75000,1863.75000,1685534940,5,0.00000,'1685534940','1min',2),(1706,8,3,0.88390,0.88390,0.88390,0.88390,1685534940,5,0.00000,'1685534940','1min',2),(1707,10,3,112.39000,112.39000,112.39000,112.39000,1685534940,5,0.00000,'1685534940','1min',2),(1708,2,3,27078.97000,27078.97000,27078.97000,27078.97000,1685534940,5,0.17519,'1685534940','1min',2),(1709,6,3,88.75000,88.75000,88.75000,88.75000,1685534940,5,2.06720,'1685534940','1min',2),(1710,2,3,27075.32000,27075.32000,27075.32000,27075.32000,1685535000,5,0.00000,'1685535000','1min',2),(1711,4,3,1863.08000,1863.08000,1863.08000,1863.08000,1685535000,5,0.00000,'1685535000','1min',2),(1712,6,3,88.73000,88.73000,88.73000,88.73000,1685535000,5,0.00000,'1685535000','1min',2),(1713,8,3,0.88380,0.88380,0.88380,0.88380,1685535000,5,269.74350,'1685535000','1min',2),(1714,10,3,112.39000,112.39000,112.39000,112.39000,1685535000,5,0.00000,'1685535000','1min',2),(1715,6,3,88.81000,88.81000,88.81000,88.81000,1685535060,5,0.00000,'1685535060','1min',2),(1716,8,3,0.88390,0.88390,0.88390,0.88390,1685535060,5,212.34910,'1685535060','1min',2),(1717,10,3,112.39000,112.39000,112.39000,112.39000,1685535060,5,0.00000,'1685535060','1min',2),(1718,2,3,27081.35000,27081.35000,27081.35000,27081.35000,1685535060,5,0.00340,'1685535060','1min',2),(1719,4,3,1863.52000,1863.52000,1863.52000,1863.52000,1685535060,5,0.00000,'1685535060','1min',2),(1720,6,3,88.84000,88.84000,88.84000,88.84000,1685535120,5,0.00000,'1685535120','1min',2),(1721,8,3,0.88390,0.88390,0.88390,0.88390,1685535120,5,182.32790,'1685535120','1min',2),(1722,10,3,112.39000,112.39000,112.39000,112.39000,1685535120,5,0.00000,'1685535120','1min',2),(1723,2,3,27080.00000,27080.00000,27080.00000,27080.00000,1685535120,5,0.00000,'1685535120','1min',2),(1724,4,3,1863.52000,1863.52000,1863.52000,1863.52000,1685535120,5,0.00000,'1685535120','1min',2),(1725,4,3,1864.62000,1864.62000,1864.62000,1864.62000,1685535180,5,0.00000,'1685535180','1min',2),(1726,8,3,0.88370,0.88370,0.88370,0.88370,1685535180,5,215.02370,'1685535180','1min',2),(1727,10,3,112.39000,112.39000,112.39000,112.39000,1685535180,5,0.00000,'1685535180','1min',2),(1728,2,3,27086.00000,27086.00000,27086.00000,27086.00000,1685535180,5,0.00000,'1685535180','1min',2),(1729,6,3,88.92000,88.93000,88.93000,88.92000,1685535180,5,2.18730,'1685535180','1min',2),(1730,6,3,88.89000,88.89000,88.89000,88.89000,1685535240,5,0.00000,'1685535240','1min',2),(1731,8,3,0.88460,0.88460,0.88460,0.88460,1685535240,5,0.00000,'1685535240','1min',2),(1732,10,3,112.52000,112.52000,112.52000,112.52000,1685535240,5,0.00000,'1685535240','1min',2),(1733,2,3,27094.00000,27093.99000,27094.00000,27093.99000,1685535240,5,0.00191,'1685535240','1min',2),(1734,4,3,1864.94000,1864.94000,1864.94000,1864.94000,1685535240,5,0.00000,'1685535240','1min',2),(1735,4,3,1864.88000,1864.88000,1864.88000,1864.88000,1685535300,5,0.00000,'1685535300','1min',2),(1736,6,3,88.91000,88.91000,88.91000,88.91000,1685535300,5,0.00000,'1685535300','1min',2),(1737,8,3,0.88430,0.88430,0.88430,0.88430,1685535300,5,0.00000,'1685535300','1min',2),(1738,10,3,112.52000,112.52000,112.52000,112.52000,1685535300,5,0.00000,'1685535300','1min',2),(1739,2,3,27094.49000,27094.49000,27094.49000,27094.49000,1685535300,5,0.00000,'1685535300','1min',2),(1740,2,3,27112.49000,27112.49000,27112.49000,27112.49000,1685535360,5,0.00000,'1685535360','1min',2),(1741,4,3,1866.28000,1866.28000,1866.28000,1866.28000,1685535360,5,0.00000,'1685535360','1min',2),(1742,6,3,89.13000,89.13000,89.13000,89.13000,1685535360,5,1.54410,'1685535360','1min',2),(1743,8,3,0.88450,0.88450,0.88450,0.88450,1685535360,5,0.00000,'1685535360','1min',2),(1744,10,3,112.52000,112.52000,112.52000,112.52000,1685535360,5,0.00000,'1685535360','1min',2),(1745,4,3,1866.89000,1866.89000,1866.89000,1866.89000,1685535420,5,0.00000,'1685535420','1min',2),(1746,6,3,89.10000,89.10000,89.10000,89.10000,1685535420,5,0.00000,'1685535420','1min',2),(1747,8,3,0.88480,0.88480,0.88480,0.88480,1685535420,5,0.00000,'1685535420','1min',2),(1748,2,3,27112.86000,27112.86000,27112.86000,27112.86000,1685535420,5,0.00730,'1685535420','1min',2),(1749,10,3,112.52000,112.52000,112.52000,112.52000,1685535420,5,0.00000,'1685535420','1min',2),(1750,4,3,1866.87000,1866.96000,1866.96000,1866.87000,1685535480,5,0.45310,'1685535480','1min',2),(1751,8,3,0.88480,0.88480,0.88480,0.88480,1685535480,5,0.00000,'1685535480','1min',2),(1752,2,3,27105.29000,27105.29000,27105.29000,27105.29000,1685535480,5,0.00000,'1685535480','1min',2),(1753,6,3,89.10000,89.10000,89.10000,89.10000,1685535480,5,1.36680,'1685535480','1min',2),(1754,10,3,112.52000,112.52000,112.52000,112.52000,1685535480,5,0.00000,'1685535480','1min',2),(1755,2,3,27090.00000,27090.00000,27090.00000,27090.00000,1685535540,5,0.00000,'1685535540','1min',2),(1756,4,3,1866.19000,1866.19000,1866.19000,1866.19000,1685535540,5,0.00000,'1685535540','1min',2),(1757,6,3,88.96000,88.94000,88.96000,88.94000,1685535540,5,1.93580,'1685535540','1min',2),(1758,8,3,0.88450,0.88450,0.88450,0.88450,1685535540,5,160.21500,'1685535540','1min',2),(1759,10,3,112.52000,112.52000,112.52000,112.52000,1685535540,5,0.00000,'1685535540','1min',2),(1760,10,3,112.54000,112.54000,112.54000,112.54000,1685535600,5,0.00000,'1685535600','1min',2),(1761,2,3,27083.47000,27083.47000,27083.47000,27083.47000,1685535600,5,0.00000,'1685535600','1min',2),(1762,4,3,1865.47000,1865.47000,1865.47000,1865.47000,1685535600,5,0.00000,'1685535600','1min',2),(1763,6,3,88.89000,88.89000,88.89000,88.89000,1685535600,5,0.00000,'1685535600','1min',2),(1764,8,3,0.88460,0.88460,0.88460,0.88460,1685535600,5,0.00000,'1685535600','1min',2),(1765,10,3,112.55000,112.55000,112.55000,112.55000,1685535660,5,0.00000,'1685535660','1min',2),(1766,2,3,27075.01000,27075.01000,27075.01000,27075.01000,1685535660,5,0.00000,'1685535660','1min',2),(1767,6,3,88.87000,88.87000,88.87000,88.87000,1685535660,5,0.00000,'1685535660','1min',2),(1768,8,3,0.88420,0.88420,0.88420,0.88420,1685535660,5,0.00000,'1685535660','1min',2),(1769,4,3,1865.07000,1865.07000,1865.07000,1865.07000,1685535660,5,0.00000,'1685535660','1min',2),(1770,6,3,88.88000,88.88000,88.88000,88.88000,1685535720,5,0.00000,'1685535720','1min',2),(1771,8,3,0.88420,0.88420,0.88420,0.88420,1685535720,5,0.00000,'1685535720','1min',2),(1772,2,3,27081.99000,27081.99000,27081.99000,27081.99000,1685535720,5,0.00000,'1685535720','1min',2),(1773,4,3,1865.16000,1865.16000,1865.16000,1865.16000,1685535720,5,0.00000,'1685535720','1min',2),(1774,10,3,112.52000,112.52000,112.52000,112.52000,1685535720,5,0.00000,'1685535720','1min',2),(1775,6,3,88.87000,88.87000,88.87000,88.87000,1685535780,5,0.00000,'1685535780','1min',2),(1776,8,3,0.88420,0.88420,0.88420,0.88420,1685535780,5,0.00000,'1685535780','1min',2),(1777,10,3,112.53000,112.53000,112.53000,112.53000,1685535780,5,0.00000,'1685535780','1min',2),(1778,2,3,27083.49000,27083.49000,27083.49000,27083.49000,1685535780,5,0.00000,'1685535780','1min',2),(1779,4,3,1865.21000,1865.21000,1865.21000,1865.21000,1685535780,5,0.00000,'1685535780','1min',2),(1780,2,3,27089.99000,27089.99000,27089.99000,27089.99000,1685535840,5,0.00000,'1685535840','1min',2),(1781,6,3,88.89000,88.89000,88.89000,88.89000,1685535840,5,0.00000,'1685535840','1min',2),(1782,8,3,0.88370,0.88370,0.88370,0.88370,1685535840,5,0.00000,'1685535840','1min',2),(1783,4,3,1865.17000,1865.17000,1865.17000,1865.17000,1685535840,5,0.00000,'1685535840','1min',2),(1784,10,3,112.53000,112.53000,112.53000,112.53000,1685535840,5,0.00000,'1685535840','1min',2),(1785,10,3,112.53000,112.53000,112.53000,112.53000,1685535900,5,0.00000,'1685535900','1min',2),(1786,6,3,88.94000,88.94000,88.94000,88.94000,1685535900,5,0.00000,'1685535900','1min',2),(1787,8,3,0.88370,0.88370,0.88370,0.88370,1685535900,5,0.00000,'1685535900','1min',2),(1788,2,3,27080.00000,27080.00000,27080.00000,27080.00000,1685535900,5,0.00000,'1685535900','1min',2),(1789,4,3,1865.22000,1865.22000,1865.22000,1865.22000,1685535900,5,0.00000,'1685535900','1min',2),(1790,8,3,0.88370,0.88370,0.88370,0.88370,1685535960,5,0.00000,'1685535960','1min',2),(1791,10,3,112.53000,112.53000,112.53000,112.53000,1685535960,5,0.00000,'1685535960','1min',2),(1792,2,3,27078.00000,27079.69000,27079.69000,27078.00000,1685535960,5,0.31746,'1685535960','1min',2),(1793,4,3,1864.66000,1864.66000,1864.66000,1864.66000,1685535960,5,0.00000,'1685535960','1min',2),(1794,6,3,88.87000,88.87000,88.87000,88.87000,1685535960,5,0.00000,'1685535960','1min',2),(1795,10,3,112.55000,112.55000,112.55000,112.55000,1685536020,5,0.00000,'1685536020','1min',2),(1796,2,3,27083.49000,27083.49000,27083.49000,27083.49000,1685536020,5,0.00083,'1685536020','1min',2),(1797,4,3,1865.17000,1865.17000,1865.17000,1865.17000,1685536020,5,0.00000,'1685536020','1min',2),(1798,6,3,88.94000,88.94000,88.94000,88.94000,1685536020,5,0.00000,'1685536020','1min',2),(1799,8,3,0.88370,0.88370,0.88370,0.88370,1685536020,5,0.00000,'1685536020','1min',2),(1800,2,3,27099.50000,27099.50000,27099.50000,27099.50000,1685536080,5,0.00000,'1685536080','1min',2),(1801,6,3,88.98000,88.98000,88.98000,88.98000,1685536080,5,0.00000,'1685536080','1min',2),(1802,8,3,0.88440,0.88440,0.88440,0.88440,1685536080,5,0.00000,'1685536080','1min',2),(1803,10,3,112.55000,112.55000,112.55000,112.55000,1685536080,5,0.00000,'1685536080','1min',2),(1804,4,3,1866.85000,1866.85000,1866.85000,1866.85000,1685536080,5,0.00000,'1685536080','1min',2),(1805,6,3,88.98000,88.98000,88.98000,88.98000,1685536140,5,0.00000,'1685536140','1min',2),(1806,10,3,112.55000,112.55000,112.55000,112.55000,1685536140,5,0.00000,'1685536140','1min',2),(1807,2,3,27091.89000,27091.89000,27091.89000,27091.89000,1685536140,5,0.00000,'1685536140','1min',2),(1808,4,3,1866.34000,1866.34000,1866.34000,1866.34000,1685536140,5,0.00000,'1685536140','1min',2),(1809,8,3,0.88440,0.88440,0.88440,0.88440,1685536140,5,0.00000,'1685536140','1min',2),(1810,10,3,112.55000,112.55000,112.55000,112.55000,1685536200,5,0.00000,'1685536200','1min',2),(1811,2,3,27086.62000,27094.90000,27094.90000,27086.62000,1685536200,5,1.11174,'1685536200','1min',2),(1812,4,3,1866.34000,1866.57000,1866.57000,1866.34000,1685536200,5,0.41580,'1685536200','1min',2),(1813,6,3,88.97000,88.97000,88.97000,88.97000,1685536200,5,1.24990,'1685536200','1min',2),(1814,8,3,0.88440,0.88440,0.88440,0.88440,1685536200,5,0.00000,'1685536200','1min',2),(1815,6,3,89.06000,89.06000,89.06000,89.06000,1685536260,5,0.00000,'1685536260','1min',2),(1816,8,3,0.88440,0.88440,0.88440,0.88440,1685536260,5,0.00000,'1685536260','1min',2),(1817,10,3,112.55000,112.55000,112.55000,112.55000,1685536260,5,0.00000,'1685536260','1min',2),(1818,2,3,27098.99000,27098.99000,27098.99000,27098.99000,1685536260,5,0.00000,'1685536260','1min',2),(1819,4,3,1866.68000,1866.68000,1866.68000,1866.68000,1685536260,5,0.00000,'1685536260','1min',2),(1820,8,3,0.88470,0.88470,0.88470,0.88470,1685536320,5,99.48550,'1685536320','1min',2),(1821,10,3,112.55000,112.55000,112.55000,112.55000,1685536320,5,0.00000,'1685536320','1min',2),(1822,2,3,27100.50000,27102.50000,27102.50000,27100.50000,1685536320,5,0.40594,'1685536320','1min',2),(1823,4,3,1867.11000,1867.11000,1867.11000,1867.11000,1685536320,5,0.04480,'1685536320','1min',2),(1824,6,3,89.08000,89.08000,89.08000,89.08000,1685536320,5,0.00000,'1685536320','1min',2),(1825,8,3,0.88480,0.88480,0.88480,0.88480,1685536380,5,0.00000,'1685536380','1min',2),(1826,2,3,27109.50000,27109.50000,27109.50000,27109.50000,1685536380,5,0.00000,'1685536380','1min',2),(1827,4,3,1867.68000,1867.68000,1867.68000,1867.68000,1685536380,5,0.00000,'1685536380','1min',2),(1828,6,3,89.10000,89.10000,89.10000,89.10000,1685536380,5,0.00000,'1685536380','1min',2),(1829,10,3,112.55000,112.55000,112.55000,112.55000,1685536380,5,0.00000,'1685536380','1min',2),(1830,10,3,112.55000,112.55000,112.55000,112.55000,1685536440,5,0.00000,'1685536440','1min',2),(1831,2,3,27100.00000,27100.00000,27100.00000,27100.00000,1685536440,5,0.00000,'1685536440','1min',2),(1832,4,3,1867.19000,1867.19000,1867.19000,1867.19000,1685536440,5,0.00000,'1685536440','1min',2),(1833,6,3,89.12000,89.12000,89.12000,89.12000,1685536440,5,0.00000,'1685536440','1min',2),(1834,8,3,0.88440,0.88440,0.88440,0.88440,1685536440,5,320.61370,'1685536440','1min',2),(1835,6,3,89.12000,89.12000,89.12000,89.12000,1685536500,5,0.00000,'1685536500','1min',2),(1836,8,3,0.88440,0.88440,0.88440,0.88440,1685536500,5,210.92120,'1685536500','1min',2),(1837,10,3,112.55000,112.55000,112.55000,112.55000,1685536500,5,0.00000,'1685536500','1min',2),(1838,2,3,27100.02000,27100.02000,27100.02000,27100.02000,1685536500,5,0.00000,'1685536500','1min',2),(1839,4,3,1867.32000,1867.32000,1867.32000,1867.32000,1685536500,5,0.00000,'1685536500','1min',2),(1840,2,3,27092.72000,27092.72000,27092.72000,27092.72000,1685536560,5,0.00000,'1685536560','1min',2),(1841,4,3,1867.32000,1867.32000,1867.32000,1867.32000,1685536560,5,0.00000,'1685536560','1min',2),(1842,6,3,89.13000,89.13000,89.13000,89.13000,1685536560,5,0.00000,'1685536560','1min',2),(1843,8,3,0.88430,0.88430,0.88430,0.88430,1685536560,5,0.00000,'1685536560','1min',2),(1844,10,3,112.55000,112.55000,112.55000,112.55000,1685536560,5,0.00000,'1685536560','1min',2),(1845,2,3,27090.08000,27090.08000,27090.08000,27090.08000,1685536620,5,0.00000,'1685536620','1min',2),(1846,4,3,1866.57000,1866.57000,1866.57000,1866.57000,1685536620,5,0.00000,'1685536620','1min',2),(1847,8,3,0.88430,0.88430,0.88430,0.88430,1685536620,5,0.00000,'1685536620','1min',2),(1848,10,3,112.55000,112.55000,112.55000,112.55000,1685536620,5,0.00000,'1685536620','1min',2),(1849,6,3,89.10000,89.10000,89.10000,89.10000,1685536620,5,0.00000,'1685536620','1min',2),(1850,10,3,112.55000,112.55000,112.55000,112.55000,1685536680,5,0.00000,'1685536680','1min',2),(1851,2,3,27076.00000,27076.00000,27076.00000,27076.00000,1685536680,5,0.00000,'1685536680','1min',2),(1852,6,3,89.07000,89.07000,89.07000,89.07000,1685536680,5,0.00000,'1685536680','1min',2),(1853,8,3,0.88430,0.88430,0.88430,0.88430,1685536680,5,0.00000,'1685536680','1min',2),(1854,4,3,1866.57000,1866.57000,1866.57000,1866.57000,1685536680,5,0.00000,'1685536680','1min',2),(1855,6,3,89.09000,89.09000,89.09000,89.09000,1685536740,5,0.00000,'1685536740','1min',2),(1856,8,3,0.88430,0.88430,0.88430,0.88430,1685536740,5,0.00000,'1685536740','1min',2),(1857,10,3,112.55000,112.55000,112.55000,112.55000,1685536740,5,0.00000,'1685536740','1min',2),(1858,2,3,27083.49000,27083.49000,27083.49000,27083.49000,1685536740,5,0.00000,'1685536740','1min',2),(1859,4,3,1867.06000,1867.06000,1867.06000,1867.06000,1685536740,5,0.00000,'1685536740','1min',2),(1860,2,3,27075.99000,27075.99000,27075.99000,27075.99000,1685536800,5,0.03713,'1685536800','1min',2),(1861,4,3,1866.60000,1866.60000,1866.60000,1866.60000,1685536800,5,0.02920,'1685536800','1min',2),(1862,6,3,89.06000,89.06000,89.06000,89.06000,1685536800,5,0.00000,'1685536800','1min',2),(1863,8,3,0.88430,0.88430,0.88430,0.88430,1685536800,5,0.00000,'1685536800','1min',2),(1864,10,3,112.55000,112.55000,112.55000,112.55000,1685536800,5,0.00000,'1685536800','1min',2),(1865,6,3,89.06000,89.06000,89.06000,89.06000,1685536860,5,0.00000,'1685536860','1min',2),(1866,8,3,0.88340,0.88340,0.88340,0.88340,1685536860,5,0.00000,'1685536860','1min',2),(1867,10,3,112.55000,112.55000,112.55000,112.55000,1685536860,5,0.00000,'1685536860','1min',2),(1868,2,3,27079.04000,27079.04000,27079.04000,27079.04000,1685536860,5,0.01109,'1685536860','1min',2),(1869,4,3,1867.11000,1867.11000,1867.11000,1867.11000,1685536860,5,0.00000,'1685536860','1min',2),(1870,8,3,0.88400,0.88400,0.88400,0.88400,1685536920,5,19.93000,'1685536920','1min',2),(1871,10,3,112.73000,112.73000,112.73000,112.73000,1685536920,5,0.00000,'1685536920','1min',2),(1872,2,3,27096.00000,27096.00000,27096.00000,27096.00000,1685536920,5,0.09200,'1685536920','1min',2),(1873,4,3,1868.04000,1868.04000,1868.04000,1868.04000,1685536920,5,0.00000,'1685536920','1min',2),(1874,6,3,89.08000,89.08000,89.08000,89.08000,1685536920,5,0.00000,'1685536920','1min',2),(1875,6,3,89.13000,89.13000,89.13000,89.13000,1685536980,5,0.00000,'1685536980','1min',2),(1876,8,3,0.88400,0.88400,0.88400,0.88400,1685536980,5,0.00000,'1685536980','1min',2),(1877,10,3,112.72000,112.72000,112.72000,112.72000,1685536980,5,0.00000,'1685536980','1min',2),(1878,2,3,27096.49000,27096.49000,27096.49000,27096.49000,1685536980,5,0.00200,'1685536980','1min',2),(1879,4,3,1868.12000,1868.12000,1868.12000,1868.12000,1685536980,5,0.00000,'1685536980','1min',2),(1880,4,3,1867.81000,1867.81000,1867.81000,1867.81000,1685537040,5,0.00000,'1685537040','1min',2),(1881,6,3,89.07000,89.07000,89.07000,89.07000,1685537040,5,0.00000,'1685537040','1min',2),(1882,8,3,0.88400,0.88400,0.88400,0.88400,1685537040,5,0.00000,'1685537040','1min',2),(1883,10,3,112.72000,112.72000,112.72000,112.72000,1685537040,5,0.00000,'1685537040','1min',2),(1884,2,3,27095.05000,27095.05000,27095.05000,27095.05000,1685537040,5,0.00000,'1685537040','1min',2),(1885,6,3,89.10000,89.10000,89.10000,89.10000,1685537100,5,0.00000,'1685537100','1min',2),(1886,8,3,0.88410,0.88410,0.88410,0.88410,1685537100,5,0.00000,'1685537100','1min',2),(1887,10,3,112.72000,112.72000,112.72000,112.72000,1685537100,5,0.00000,'1685537100','1min',2),(1888,2,3,27095.03000,27095.03000,27095.03000,27095.03000,1685537100,5,0.00276,'1685537100','1min',2),(1889,4,3,1867.82000,1867.82000,1867.82000,1867.82000,1685537100,5,0.00000,'1685537100','1min',2),(1890,10,3,112.72000,112.72000,112.72000,112.72000,1685537160,5,0.00000,'1685537160','1min',2),(1891,2,3,27095.01000,27099.50000,27099.50000,27093.86000,1685537280,5,1.28237,'1685537280','1min',2),(1892,4,3,1867.46000,1867.89000,1867.91000,1867.46000,1685537280,5,0.94270,'1685537280','1min',2),(1893,4,3,1868.04000,1868.04000,1868.04000,1868.04000,1685537580,5,0.00000,'1685537580','1min',2),(1894,6,3,89.04000,89.04000,89.04000,89.04000,1685537580,5,0.00000,'1685537580','1min',2),(1895,8,3,0.88340,0.88340,0.88340,0.88340,1685537580,5,0.00000,'1685537580','1min',2),(1896,10,3,112.65000,112.66000,112.66000,112.65000,1685537580,5,0.88740,'1685537580','1min',2),(1897,2,3,27095.00000,27095.00000,27095.01000,27095.00000,1685537580,5,0.01461,'1685537580','1min',2),(1898,4,3,1867.95000,1867.95000,1867.95000,1867.95000,1685537640,5,0.00000,'1685537640','1min',2),(1899,8,3,0.88330,0.88330,0.88330,0.88330,1685537640,5,0.00000,'1685537640','1min',2),(1900,10,3,112.66000,112.66000,112.66000,112.66000,1685537640,5,0.00000,'1685537640','1min',2),(1901,2,3,27094.01000,27094.01000,27094.01000,27094.01000,1685537640,5,0.00000,'1685537640','1min',2),(1902,6,3,89.03000,89.03000,89.03000,89.03000,1685537640,5,0.00000,'1685537640','1min',2),(1903,8,3,0.88330,0.88330,0.88330,0.88330,1685537700,5,0.00000,'1685537700','1min',2),(1904,10,3,112.66000,112.66000,112.66000,112.66000,1685537700,5,0.00000,'1685537700','1min',2),(1905,2,3,27075.95000,27075.95000,27075.95000,27075.95000,1685537700,5,0.00000,'1685537700','1min',2),(1906,4,3,1866.86000,1866.86000,1866.86000,1866.86000,1685537700,5,0.00000,'1685537700','1min',2),(1907,6,3,89.00000,89.00000,89.00000,89.00000,1685537700,5,0.00000,'1685537700','1min',2),(1908,10,3,112.41000,112.40000,112.41000,112.40000,1685547900,5,1.62470,'1685547900','1min',2),(1909,2,3,26937.20000,26942.49000,26942.50000,26929.27000,1685547900,5,2.39649,'1685547900','1min',2),(1910,4,3,1858.78000,1859.05000,1859.05000,1858.78000,1685547900,5,0.64040,'1685547900','1min',2),(1911,6,3,88.90000,88.92000,88.92000,88.90000,1685547900,5,5.39340,'1685547900','1min',2),(1912,8,3,0.87740,0.87740,0.87740,0.87740,1685547900,5,0.00000,'1685547900','1min',2),(1913,6,3,88.92000,88.92000,88.92000,88.92000,1685547960,5,0.00000,'1685547960','1min',2),(1914,8,3,0.87740,0.87740,0.87740,0.87740,1685547960,5,0.00000,'1685547960','1min',2),(1915,10,3,112.40000,112.40000,112.40000,112.40000,1685547960,5,0.00000,'1685547960','1min',2),(1916,2,3,26941.80000,26941.41000,26941.80000,26941.41000,1685547960,5,0.05952,'1685547960','1min',2),(1917,4,3,1859.05000,1859.05000,1859.05000,1859.05000,1685547960,5,0.00000,'1685547960','1min',2),(1918,2,3,26925.08000,26925.08000,26925.08000,26925.08000,1685548020,5,0.00000,'1685548020','1min',2),(1919,4,3,1858.12000,1858.07000,1858.12000,1858.07000,1685548020,5,2.69880,'1685548020','1min',2),(1920,8,3,0.87730,0.87730,0.87730,0.87730,1685548020,5,0.00000,'1685548020','1min',2),(1921,10,3,112.40000,112.40000,112.40000,112.40000,1685548020,5,0.00000,'1685548020','1min',2),(1922,6,3,88.88000,88.88000,88.88000,88.88000,1685548020,5,0.00000,'1685548020','1min',2),(1923,6,3,88.92000,88.92000,88.92000,88.92000,1685548080,5,0.00000,'1685548080','1min',2),(1924,8,3,0.87730,0.87730,0.87730,0.87730,1685548080,5,0.00000,'1685548080','1min',2),(1925,10,3,112.40000,112.40000,112.40000,112.40000,1685548080,5,0.00000,'1685548080','1min',2),(1926,2,3,26934.83000,26934.84000,26934.84000,26934.83000,1685548080,5,0.09226,'1685548080','1min',2),(1927,4,3,1858.80000,1858.80000,1858.80000,1858.80000,1685548080,5,0.00000,'1685548080','1min',2),(1928,6,3,88.87000,88.87000,88.87000,88.87000,1685548140,5,0.00000,'1685548140','1min',2),(1929,8,3,0.87740,0.87740,0.87740,0.87740,1685548140,5,0.00000,'1685548140','1min',2),(1930,10,3,112.38000,112.38000,112.38000,112.38000,1685548140,5,0.00000,'1685548140','1min',2),(1931,2,3,26920.00000,26920.00000,26920.00000,26920.00000,1685548140,5,0.07114,'1685548140','1min',2),(1932,4,3,1857.98000,1857.98000,1857.98000,1857.98000,1685548140,5,0.00000,'1685548140','1min',2),(1933,2,3,26906.73000,26906.73000,26906.73000,26906.73000,1685548200,5,0.00000,'1685548200','1min',2),(1934,4,3,1857.42000,1857.42000,1857.42000,1857.42000,1685548200,5,0.00000,'1685548200','1min',2),(1935,6,3,88.87000,88.87000,88.87000,88.87000,1685548200,5,0.00000,'1685548200','1min',2),(1936,8,3,0.87670,0.87670,0.87670,0.87670,1685548200,5,0.00000,'1685548200','1min',2),(1937,10,3,112.38000,112.38000,112.38000,112.38000,1685548200,5,0.00000,'1685548200','1min',2),(1938,2,3,26894.60000,26897.48000,26897.48000,26894.60000,1685548260,5,0.01000,'1685548260','1min',2),(1939,4,3,1857.48000,1857.48000,1857.48000,1857.48000,1685548260,5,0.04990,'1685548260','1min',2),(1940,6,3,88.83000,88.83000,88.83000,88.83000,1685548260,5,0.45040,'1685548260','1min',2),(1941,8,3,0.87760,0.87810,0.87810,0.87760,1685548260,5,1844.40640,'1685548260','1min',2),(1942,10,3,112.38000,112.38000,112.38000,112.38000,1685548260,5,0.32020,'1685548260','1min',2),(1943,2,3,26908.49000,26908.49000,26908.49000,26908.49000,1685548320,5,0.03716,'1685548320','1min',2),(1944,4,3,1858.64000,1858.64000,1858.64000,1858.64000,1685548320,5,0.05380,'1685548320','1min',2),(1945,6,3,88.83000,88.83000,88.83000,88.83000,1685548320,5,0.40600,'1685548320','1min',2),(1946,8,3,0.87820,0.87820,0.87820,0.87820,1685548320,5,0.00000,'1685548320','1min',2),(1947,10,3,112.38000,112.38000,112.38000,112.38000,1685548320,5,0.00000,'1685548320','1min',2),(1948,6,3,88.82000,88.82000,88.82000,88.82000,1685548380,5,0.00000,'1685548380','1min',2),(1949,8,3,0.87860,0.87860,0.87860,0.87860,1685548380,5,0.00000,'1685548380','1min',2),(1950,10,3,112.38000,112.38000,112.38000,112.38000,1685548380,5,0.00000,'1685548380','1min',2),(1951,2,3,26923.83000,26923.83000,26923.83000,26923.83000,1685548380,5,0.00560,'1685548380','1min',2),(1952,4,3,1859.39000,1859.39000,1859.39000,1859.39000,1685548380,5,0.00000,'1685548380','1min',2),(1953,8,3,0.87890,0.87890,0.87890,0.87890,1685548440,5,0.00000,'1685548440','1min',2),(1954,2,3,26925.83000,26925.83000,26925.83000,26925.83000,1685548440,5,0.00705,'1685548440','1min',2),(1955,6,3,88.81000,88.81000,88.81000,88.81000,1685548440,5,0.00000,'1685548440','1min',2),(1956,10,3,112.38000,112.38000,112.38000,112.38000,1685548440,5,0.00000,'1685548440','1min',2),(1957,4,3,1859.43000,1859.43000,1859.43000,1859.43000,1685548440,5,0.00000,'1685548440','1min',2),(1958,8,3,0.87930,0.87930,0.87930,0.87930,1685548500,5,236.53790,'1685548500','1min',2),(1959,10,3,112.38000,112.38000,112.38000,112.38000,1685548500,5,0.00000,'1685548500','1min',2),(1960,2,3,26930.99000,26930.99000,26930.99000,26930.99000,1685548500,5,0.00000,'1685548500','1min',2),(1961,4,3,1859.43000,1859.43000,1859.43000,1859.43000,1685548500,5,0.00000,'1685548500','1min',2),(1962,6,3,88.82000,88.82000,88.82000,88.82000,1685548500,5,0.36840,'1685548500','1min',2),(1963,2,3,26929.34000,26929.34000,26929.34000,26929.34000,1685548560,5,0.00000,'1685548560','1min',2),(1964,6,3,88.80000,88.80000,88.80000,88.80000,1685548560,5,0.00000,'1685548560','1min',2),(1965,8,3,0.87790,0.87790,0.87790,0.87790,1685548560,5,254.14690,'1685548560','1min',2),(1966,10,3,112.38000,112.38000,112.38000,112.38000,1685548560,5,0.00000,'1685548560','1min',2),(1967,4,3,1859.25000,1859.25000,1859.25000,1859.25000,1685548560,5,0.00000,'1685548560','1min',2),(1968,6,3,88.74000,88.74000,88.74000,88.74000,1685548620,5,0.00000,'1685548620','1min',2),(1969,8,3,0.87750,0.87750,0.87750,0.87750,1685548620,5,0.00000,'1685548620','1min',2),(1970,10,3,112.35000,112.35000,112.35000,112.35000,1685548620,5,0.00000,'1685548620','1min',2),(1971,2,3,26905.59000,26905.59000,26905.59000,26905.59000,1685548620,5,0.01158,'1685548620','1min',2),(1972,4,3,1858.39000,1858.39000,1858.39000,1858.39000,1685548620,5,0.00000,'1685548620','1min',2),(1973,6,3,88.77000,88.79000,88.79000,88.77000,1685548680,5,8.17742,'1685548680','1min',2),(1974,8,3,0.87750,0.87750,0.87750,0.87750,1685548680,5,0.00000,'1685548680','1min',2),(1975,10,3,112.35000,112.35000,112.35000,112.35000,1685548680,5,0.00000,'1685548680','1min',2),(1976,2,3,26902.63000,26902.60000,26902.63000,26902.59000,1685548680,5,0.77065,'1685548680','1min',2),(1977,4,3,1857.30000,1857.30000,1857.30000,1857.30000,1685548680,5,0.00630,'1685548680','1min',2),(1978,8,3,0.87840,0.87840,0.87840,0.87840,1685548740,5,0.00000,'1685548740','1min',2),(1979,10,3,112.36000,112.36000,112.36000,112.36000,1685548740,5,0.00000,'1685548740','1min',2),(1980,2,3,26931.99000,26931.99000,26931.99000,26931.99000,1685548740,5,0.05123,'1685548740','1min',2),(1981,4,3,1858.86000,1858.86000,1858.86000,1858.86000,1685548740,5,0.04500,'1685548740','1min',2),(1982,6,3,88.79000,88.78000,88.79000,88.78000,1685548740,5,2.48650,'1685548740','1min',2),(1983,10,3,112.36000,112.36000,112.36000,112.36000,1685548800,5,0.00000,'1685548800','1min',2),(1984,2,3,26910.01000,26910.00000,26910.01000,26910.00000,1685548800,5,0.00148,'1685548800','1min',2),(1985,4,3,1858.13000,1858.13000,1858.13000,1858.13000,1685548800,5,0.00000,'1685548800','1min',2),(1986,6,3,88.73000,88.73000,88.73000,88.73000,1685548800,5,0.37760,'1685548800','1min',2),(1987,8,3,0.87790,0.87790,0.87790,0.87790,1685548800,5,0.00000,'1685548800','1min',2),(1988,2,3,26919.29000,26919.29000,26919.29000,26919.29000,1685548860,5,0.00000,'1685548860','1min',2),(1989,6,3,88.84000,88.84000,88.84000,88.84000,1685548860,5,0.00000,'1685548860','1min',2),(1990,8,3,0.87760,0.87760,0.87760,0.87760,1685548860,5,0.00000,'1685548860','1min',2),(1991,10,3,112.31000,112.31000,112.31000,112.31000,1685548860,5,0.00000,'1685548860','1min',2),(1992,4,3,1858.46000,1858.46000,1858.46000,1858.46000,1685548860,5,0.00000,'1685548860','1min',2),(1993,4,3,1858.83000,1858.83000,1858.83000,1858.83000,1685548920,5,0.00860,'1685548920','1min',2),(1994,6,3,88.79000,88.79000,88.79000,88.79000,1685548920,5,0.00000,'1685548920','1min',2),(1995,8,3,0.87760,0.87760,0.87760,0.87760,1685548920,5,0.00000,'1685548920','1min',2),(1996,2,3,26919.01000,26919.01000,26919.01000,26919.01000,1685548920,5,0.00000,'1685548920','1min',2),(1997,10,3,112.29000,112.29000,112.29000,112.29000,1685548920,5,0.00000,'1685548920','1min',2),(1998,10,3,112.29000,112.29000,112.29000,112.29000,1685548980,5,0.00000,'1685548980','1min',2),(1999,2,3,26925.71000,26925.71000,26925.71000,26925.71000,1685548980,5,0.12501,'1685548980','1min',2),(2000,4,3,1859.28000,1859.28000,1859.28000,1859.28000,1685548980,5,0.00000,'1685548980','1min',2),(2001,6,3,88.81000,88.81000,88.81000,88.81000,1685548980,5,0.00000,'1685548980','1min',2),(2002,8,3,0.87760,0.87760,0.87760,0.87760,1685548980,5,0.00000,'1685548980','1min',2),(2003,6,3,88.80000,88.80000,88.80000,88.80000,1685549040,5,0.00000,'1685549040','1min',2),(2004,10,3,112.29000,112.29000,112.29000,112.29000,1685549040,5,0.00000,'1685549040','1min',2),(2005,2,3,26918.40000,26918.40000,26918.40000,26918.40000,1685549040,5,0.00040,'1685549040','1min',2),(2006,4,3,1858.89000,1858.89000,1858.89000,1858.89000,1685549040,5,0.00000,'1685549040','1min',2),(2007,8,3,0.87760,0.87760,0.87760,0.87760,1685549040,5,0.00000,'1685549040','1min',2),(2008,2,3,26906.43000,26906.43000,26906.43000,26906.43000,1685549100,5,0.00000,'1685549100','1min',2),(2009,4,3,1857.85000,1857.85000,1857.85000,1857.85000,1685549100,5,0.20200,'1685549100','1min',2),(2010,6,3,88.74000,88.74000,88.74000,88.74000,1685549100,5,0.47280,'1685549100','1min',2),(2011,8,3,0.87700,0.87700,0.87700,0.87700,1685549100,5,0.00000,'1685549100','1min',2),(2012,10,3,112.23000,112.23000,112.23000,112.23000,1685549100,5,0.00000,'1685549100','1min',2),(2013,4,3,1856.84000,1856.84000,1856.84000,1856.84000,1685549160,5,0.22740,'1685549160','1min',2),(2014,6,3,88.67000,88.67000,88.67000,88.67000,1685549160,5,0.00000,'1685549160','1min',2),(2015,8,3,0.87660,0.87660,0.87660,0.87660,1685549160,5,0.00000,'1685549160','1min',2),(2016,10,3,112.23000,112.23000,112.23000,112.23000,1685549160,5,0.00000,'1685549160','1min',2),(2017,2,3,26885.01000,26885.01000,26885.01000,26885.01000,1685549160,5,0.00380,'1685549160','1min',2),(2018,6,3,88.53000,88.53000,88.53000,88.53000,1685549220,5,0.00000,'1685549220','1min',2),(2019,8,3,0.87560,0.87560,0.87560,0.87560,1685549220,5,285.48190,'1685549220','1min',2),(2020,10,3,112.23000,112.23000,112.23000,112.23000,1685549220,5,0.00000,'1685549220','1min',2),(2021,2,3,26880.01000,26880.01000,26880.01000,26880.01000,1685549220,5,0.01000,'1685549220','1min',2),(2022,4,3,1855.78000,1855.78000,1855.78000,1855.78000,1685549220,5,0.00000,'1685549220','1min',2),(2023,6,3,88.46000,88.46000,88.46000,88.46000,1685549280,5,0.00000,'1685549280','1min',2),(2024,2,3,26865.01000,26865.01000,26865.01000,26865.01000,1685549280,5,0.03722,'1685549280','1min',2),(2025,4,3,1854.86000,1854.86000,1854.86000,1854.86000,1685549280,5,0.20000,'1685549280','1min',2),(2026,8,3,0.87640,0.87640,0.87640,0.87640,1685549280,5,0.00000,'1685549280','1min',2),(2027,10,3,112.23000,112.23000,112.23000,112.23000,1685549280,5,0.00000,'1685549280','1min',2),(2028,2,3,26874.64000,26874.64000,26874.64000,26874.64000,1685549340,5,0.10000,'1685549340','1min',2),(2029,6,3,88.45000,88.45000,88.45000,88.45000,1685549340,5,0.00000,'1685549340','1min',2),(2030,10,3,112.23000,112.23000,112.23000,112.23000,1685549340,5,0.00000,'1685549340','1min',2),(2031,4,3,1855.24000,1855.33000,1855.33000,1855.24000,1685549340,5,2.65250,'1685549340','1min',2),(2032,8,3,0.87630,0.87630,0.87630,0.87630,1685549340,5,0.00000,'1685549340','1min',2),(2033,8,3,0.87760,0.87760,0.87760,0.87760,1685549400,5,177.78780,'1685549400','1min',2),(2034,10,3,112.22000,112.22000,112.22000,112.22000,1685549400,5,0.00000,'1685549400','1min',2),(2035,2,3,26927.00000,26927.00000,26927.00000,26927.00000,1685549400,5,0.00000,'1685549400','1min',2),(2036,4,3,1857.96000,1857.96000,1857.96000,1857.96000,1685549400,5,0.00000,'1685549400','1min',2),(2037,6,3,88.59000,88.59000,88.59000,88.59000,1685549400,5,0.67400,'1685549400','1min',2),(2038,2,3,26928.50000,26928.50000,26928.50000,26928.50000,1685549460,5,0.00000,'1685549460','1min',2),(2039,4,3,1859.03000,1859.03000,1859.03000,1859.03000,1685549460,5,0.00000,'1685549460','1min',2),(2040,6,3,88.64000,88.64000,88.64000,88.64000,1685549460,5,0.00000,'1685549460','1min',2),(2041,8,3,0.87730,0.87730,0.87730,0.87730,1685549460,5,0.00000,'1685549460','1min',2),(2042,10,3,112.22000,112.22000,112.22000,112.22000,1685549460,5,0.00000,'1685549460','1min',2),(2043,4,3,1860.57000,1860.57000,1860.57000,1860.57000,1685549520,5,0.01000,'1685549520','1min',2),(2044,6,3,88.74000,88.74000,88.74000,88.74000,1685549520,5,0.39530,'1685549520','1min',2),(2045,8,3,0.87790,0.87790,0.87790,0.87790,1685549520,5,0.00000,'1685549520','1min',2),(2046,10,3,112.22000,112.22000,112.22000,112.22000,1685549520,5,0.00000,'1685549520','1min',2),(2047,2,3,26946.59000,26947.00000,26947.00000,26946.59000,1685549520,5,0.04000,'1685549520','1min',2),(2048,4,3,1859.97000,1859.97000,1859.97000,1859.97000,1685549580,5,0.00000,'1685549580','1min',2),(2049,6,3,88.69000,88.69000,88.69000,88.69000,1685549580,5,0.00000,'1685549580','1min',2),(2050,8,3,0.87790,0.87790,0.87790,0.87790,1685549580,5,0.00000,'1685549580','1min',2),(2051,10,3,112.22000,112.22000,112.22000,112.22000,1685549580,5,0.00000,'1685549580','1min',2),(2052,2,3,26948.99000,26948.99000,26948.99000,26948.99000,1685549580,5,0.00125,'1685549580','1min',2),(2053,10,3,112.22000,112.22000,112.22000,112.22000,1685549640,5,0.00000,'1685549640','1min',2),(2054,2,3,26946.39000,26946.39000,26946.39000,26946.39000,1685549640,5,0.08038,'1685549640','1min',2),(2055,4,3,1860.14000,1860.14000,1860.14000,1860.14000,1685549640,5,0.00000,'1685549640','1min',2),(2056,6,3,88.73000,88.73000,88.73000,88.73000,1685549640,5,0.00000,'1685549640','1min',2),(2057,8,3,0.87790,0.87790,0.87790,0.87790,1685549640,5,0.00000,'1685549640','1min',2),(2058,4,3,1860.54000,1860.54000,1860.54000,1860.54000,1685549700,5,1.13140,'1685549700','1min',2),(2059,6,3,88.80000,88.80000,88.80000,88.80000,1685549700,5,0.00000,'1685549700','1min',2),(2060,8,3,0.87790,0.87790,0.87790,0.87790,1685549700,5,0.00000,'1685549700','1min',2),(2061,10,3,112.48000,112.48000,112.48000,112.48000,1685549700,5,0.00000,'1685549700','1min',2),(2062,2,3,26959.50000,26963.00000,26963.00000,26959.50000,1685549700,5,0.74479,'1685549700','1min',2),(2063,2,3,26961.50000,26961.50000,26961.50000,26961.50000,1685549760,5,0.00000,'1685549760','1min',2),(2064,4,3,1860.03000,1860.03000,1860.03000,1860.03000,1685549760,5,0.00000,'1685549760','1min',2),(2065,8,3,0.87850,0.87850,0.87850,0.87850,1685549760,5,0.00000,'1685549760','1min',2),(2066,10,3,112.48000,112.48000,112.48000,112.48000,1685549760,5,0.00000,'1685549760','1min',2),(2067,6,3,88.80000,88.80000,88.80000,88.80000,1685549760,5,0.00000,'1685549760','1min',2),(2068,8,3,0.87880,0.87880,0.87880,0.87880,1685549820,5,0.00000,'1685549820','1min',2),(2069,10,3,112.48000,112.48000,112.48000,112.48000,1685549820,5,0.00000,'1685549820','1min',2),(2070,2,3,26957.57000,26957.57000,26957.57000,26957.57000,1685549820,5,0.00000,'1685549820','1min',2),(2071,4,3,1860.28000,1860.28000,1860.28000,1860.28000,1685549820,5,0.07525,'1685549820','1min',2),(2072,6,3,88.80000,88.80000,88.80000,88.80000,1685549820,5,0.00000,'1685549820','1min',2),(2073,8,3,0.87820,0.87820,0.87820,0.87820,1685549880,5,0.00000,'1685549880','1min',2),(2074,2,3,26961.99000,26961.99000,26961.99000,26961.99000,1685549880,5,0.00000,'1685549880','1min',2),(2075,6,3,88.84000,88.84000,88.84000,88.84000,1685549880,5,0.00000,'1685549880','1min',2),(2076,10,3,112.42000,112.42000,112.42000,112.42000,1685549880,5,0.00000,'1685549880','1min',2),(2077,4,3,1860.30000,1860.30000,1860.30000,1860.30000,1685549880,5,0.00000,'1685549880','1min',2),(2078,2,3,26951.01000,26951.01000,26951.01000,26951.01000,1685549940,5,0.00000,'1685549940','1min',2),(2079,4,3,1860.30000,1860.30000,1860.30000,1860.30000,1685549940,5,0.00000,'1685549940','1min',2),(2080,6,3,88.90000,88.90000,88.90000,88.90000,1685549940,5,0.00000,'1685549940','1min',2),(2081,8,3,0.87820,0.87820,0.87820,0.87820,1685549940,5,0.00000,'1685549940','1min',2),(2082,10,3,112.42000,112.42000,112.42000,112.42000,1685549940,5,0.00000,'1685549940','1min',2),(2083,2,3,26959.99000,26959.99000,26959.99000,26959.99000,1685550000,5,0.00141,'1685550000','1min',2),(2084,4,3,1860.69000,1860.69000,1860.69000,1860.69000,1685550000,5,0.00000,'1685550000','1min',2),(2085,6,3,89.01000,89.01000,89.01000,89.01000,1685550000,5,0.61730,'1685550000','1min',2),(2086,8,3,0.87820,0.87820,0.87820,0.87820,1685550000,5,0.00000,'1685550000','1min',2),(2087,10,3,112.42000,112.42000,112.42000,112.42000,1685550000,5,0.00000,'1685550000','1min',2),(2088,6,3,89.01000,89.01000,89.01000,89.01000,1685550060,5,0.00000,'1685550060','1min',2),(2089,8,3,0.87820,0.87820,0.87820,0.87820,1685550060,5,0.00000,'1685550060','1min',2),(2090,10,3,112.42000,112.42000,112.42000,112.42000,1685550060,5,0.00000,'1685550060','1min',2),(2091,2,3,26960.01000,26960.01000,26960.01000,26960.01000,1685550060,5,0.00000,'1685550060','1min',2),(2092,4,3,1860.65000,1860.65000,1860.65000,1860.65000,1685550060,5,0.00000,'1685550060','1min',2),(2093,8,3,0.87780,0.87780,0.87780,0.87780,1685550120,5,0.00000,'1685550120','1min',2),(2094,2,3,26950.00000,26950.00000,26950.00000,26950.00000,1685550120,5,0.16600,'1685550120','1min',2),(2095,4,3,1860.19000,1860.19000,1860.19000,1860.19000,1685550120,5,0.00000,'1685550120','1min',2),(2096,6,3,88.97000,88.97000,88.97000,88.97000,1685550120,5,0.00000,'1685550120','1min',2),(2097,10,3,112.42000,112.42000,112.42000,112.42000,1685550120,5,0.00000,'1685550120','1min',2),(2098,8,3,0.87800,0.87800,0.87800,0.87800,1685550180,5,0.00000,'1685550180','1min',2),(2099,4,3,1860.17000,1860.17000,1860.17000,1860.17000,1685550180,5,0.00000,'1685550180','1min',2),(2100,6,3,89.03000,89.03000,89.03000,89.03000,1685550180,5,0.00000,'1685550180','1min',2),(2101,2,3,26935.21000,26935.21000,26935.21000,26935.21000,1685550180,5,0.00000,'1685550180','1min',2),(2102,10,3,112.42000,112.42000,112.42000,112.42000,1685550180,5,0.00000,'1685550180','1min',2),(2103,2,3,26930.01000,26930.01000,26930.01000,26930.01000,1685550240,5,0.00000,'1685550240','1min',2),(2104,4,3,1859.73000,1859.73000,1859.73000,1859.73000,1685550240,5,0.00000,'1685550240','1min',2),(2105,6,3,89.03000,89.03000,89.03000,89.03000,1685550240,5,0.49400,'1685550240','1min',2),(2106,8,3,0.87820,0.87820,0.87820,0.87820,1685550240,5,0.00000,'1685550240','1min',2),(2107,10,3,112.42000,112.42000,112.42000,112.42000,1685550240,5,0.00000,'1685550240','1min',2),(2108,8,3,0.87930,0.87930,0.87930,0.87930,1685550300,5,0.00000,'1685550300','1min',2),(2109,2,3,26947.60000,26947.60000,26947.60000,26947.60000,1685550300,5,0.00250,'1685550300','1min',2),(2110,4,3,1860.85000,1860.85000,1860.85000,1860.85000,1685550300,5,1.18860,'1685550300','1min',2),(2111,6,3,89.05000,89.05000,89.05000,89.05000,1685550300,5,0.00000,'1685550300','1min',2),(2112,10,3,112.42000,112.42000,112.42000,112.42000,1685550300,5,0.00000,'1685550300','1min',2),(2113,8,3,0.87880,0.87880,0.87880,0.87880,1685550360,5,0.00000,'1685550360','1min',2),(2114,10,3,112.32000,112.33000,112.33000,112.32000,1685550360,5,0.24920,'1685550360','1min',2),(2115,2,3,26933.76000,26933.76000,26933.76000,26933.76000,1685550360,5,0.00000,'1685550360','1min',2),(2116,4,3,1860.35000,1860.35000,1860.35000,1860.35000,1685550360,5,0.00000,'1685550360','1min',2),(2117,6,3,89.03000,89.03000,89.03000,89.03000,1685550360,5,0.00000,'1685550360','1min',2),(2118,6,3,89.03000,89.03000,89.03000,89.03000,1685550420,5,0.00000,'1685550420','1min',2),(2119,10,3,112.33000,112.33000,112.33000,112.33000,1685550420,5,0.00000,'1685550420','1min',2),(2120,2,3,26937.26000,26937.26000,26937.26000,26937.26000,1685550420,5,0.00279,'1685550420','1min',2),(2121,4,3,1860.67000,1860.67000,1860.67000,1860.67000,1685550420,5,0.00000,'1685550420','1min',2),(2122,8,3,0.87920,0.87920,0.87920,0.87920,1685550420,5,0.00000,'1685550420','1min',2),(2123,6,3,89.05000,89.05000,89.05000,89.05000,1685550480,5,0.00000,'1685550480','1min',2),(2124,8,3,0.87900,0.87900,0.87900,0.87900,1685550480,5,0.00000,'1685550480','1min',2),(2125,10,3,112.39000,112.39000,112.39000,112.39000,1685550480,5,0.00000,'1685550480','1min',2),(2126,2,3,26946.50000,26946.50000,26946.50000,26946.50000,1685550480,5,0.03710,'1685550480','1min',2),(2127,4,3,1861.26000,1861.26000,1861.26000,1861.26000,1685550480,5,0.00630,'1685550480','1min',2),(2128,6,3,89.03000,89.03000,89.03000,89.03000,1685550540,5,0.00000,'1685550540','1min',2),(2129,8,3,0.87880,0.87880,0.87880,0.87880,1685550540,5,0.00000,'1685550540','1min',2),(2130,10,3,112.36000,112.36000,112.36000,112.36000,1685550540,5,0.00000,'1685550540','1min',2),(2131,2,3,26945.99000,26945.99000,26945.99000,26945.99000,1685550540,5,0.29108,'1685550540','1min',2),(2132,4,3,1861.46000,1861.46000,1861.46000,1861.46000,1685550540,5,0.00000,'1685550540','1min',2),(2133,2,3,26957.49000,26957.49000,26957.49000,26957.49000,1685550600,5,0.00000,'1685550600','1min',2),(2134,4,3,1862.00000,1862.00000,1862.00000,1862.00000,1685550600,5,0.00000,'1685550600','1min',2),(2135,6,3,89.05000,89.05000,89.05000,89.05000,1685550600,5,0.38360,'1685550600','1min',2),(2136,8,3,0.87910,0.87910,0.87910,0.87910,1685550600,5,0.00000,'1685550600','1min',2),(2137,10,3,112.36000,112.36000,112.36000,112.36000,1685550600,5,0.00000,'1685550600','1min',2),(2138,4,3,1860.35000,1860.35000,1860.35000,1860.35000,1685550660,5,0.00000,'1685550660','1min',2),(2139,8,3,0.87910,0.87910,0.87910,0.87910,1685550660,5,0.00000,'1685550660','1min',2),(2140,10,3,112.33000,112.33000,112.33000,112.33000,1685550660,5,0.00000,'1685550660','1min',2),(2141,2,3,26937.26000,26937.26000,26937.26000,26937.26000,1685550660,5,0.00811,'1685550660','1min',2),(2142,6,3,89.00000,89.00000,89.00000,89.00000,1685550660,5,0.00000,'1685550660','1min',2),(2143,2,3,26935.01000,26935.01000,26935.01000,26935.01000,1685550720,5,0.00000,'1685550720','1min',2),(2144,4,3,1860.34000,1860.34000,1860.34000,1860.34000,1685550720,5,0.00000,'1685550720','1min',2),(2145,6,3,88.97000,88.97000,88.97000,88.97000,1685550720,5,0.00000,'1685550720','1min',2),(2146,8,3,0.87910,0.87910,0.87910,0.87910,1685550720,5,0.00000,'1685550720','1min',2),(2147,10,3,112.30000,112.29000,112.30000,112.29000,1685550720,5,0.42730,'1685550720','1min',2),(2148,2,3,26935.01000,26935.01000,26935.01000,26935.01000,1685550780,5,0.00000,'1685550780','1min',2),(2149,4,3,1860.33000,1860.33000,1860.33000,1860.33000,1685550780,5,0.00000,'1685550780','1min',2),(2150,6,3,88.97000,88.97000,88.97000,88.97000,1685550780,5,0.00000,'1685550780','1min',2),(2151,8,3,0.87910,0.87910,0.87910,0.87910,1685550780,5,0.00000,'1685550780','1min',2),(2152,10,3,112.29000,112.29000,112.29000,112.29000,1685550780,5,0.00000,'1685550780','1min',2),(2153,8,3,0.87910,0.87910,0.87910,0.87910,1685550840,5,0.00000,'1685550840','1min',2),(2154,2,3,26944.62000,26944.62000,26944.62000,26944.62000,1685550840,5,0.00000,'1685550840','1min',2),(2155,4,3,1860.73000,1860.73000,1860.73000,1860.73000,1685550840,5,0.00730,'1685550840','1min',2),(2156,6,3,89.02000,89.03000,89.03000,89.02000,1685550840,5,1.12300,'1685550840','1min',2),(2157,10,3,112.28000,112.28000,112.28000,112.28000,1685550840,5,0.00000,'1685550840','1min',2),(2158,4,3,1861.14000,1861.14000,1861.14000,1861.14000,1685550900,5,0.00000,'1685550900','1min',2),(2159,6,3,89.04000,89.04000,89.04000,89.04000,1685550900,5,0.00000,'1685550900','1min',2),(2160,8,3,0.87900,0.87900,0.87900,0.87900,1685550900,5,0.00000,'1685550900','1min',2),(2161,10,3,112.28000,112.28000,112.28000,112.28000,1685550900,5,0.00000,'1685550900','1min',2),(2162,2,3,26954.35000,26954.35000,26954.35000,26954.35000,1685550900,5,0.00000,'1685550900','1min',2),(2163,4,3,1860.69000,1860.69000,1860.69000,1860.69000,1685550960,5,0.00000,'1685550960','1min',2),(2164,6,3,89.05000,89.05000,89.05000,89.05000,1685550960,5,0.00000,'1685550960','1min',2),(2165,8,3,0.87910,0.87910,0.87910,0.87910,1685550960,5,158.91850,'1685550960','1min',2),(2166,10,3,112.28000,112.28000,112.28000,112.28000,1685550960,5,0.00000,'1685550960','1min',2),(2167,2,3,26946.21000,26946.21000,26946.21000,26946.21000,1685550960,5,0.00000,'1685550960','1min',2),(2168,8,3,0.87910,0.87910,0.87910,0.87910,1685551020,5,0.00000,'1685551020','1min',2),(2169,10,3,112.28000,112.28000,112.28000,112.28000,1685551020,5,0.00000,'1685551020','1min',2),(2170,2,3,26949.50000,26949.50000,26949.50000,26949.50000,1685551020,5,0.01164,'1685551020','1min',2),(2171,4,3,1860.71000,1860.71000,1860.71000,1860.71000,1685551020,5,0.68150,'1685551020','1min',2),(2172,6,3,89.08000,89.08000,89.08000,89.08000,1685551020,5,0.00000,'1685551020','1min',2),(2173,2,3,26949.99000,26949.99000,26949.99000,26949.99000,1685551080,5,0.00000,'1685551080','1min',2),(2174,4,3,1860.67000,1860.67000,1860.67000,1860.67000,1685551080,5,0.00000,'1685551080','1min',2),(2175,6,3,89.04000,89.04000,89.04000,89.04000,1685551080,5,0.33810,'1685551080','1min',2),(2176,8,3,0.87910,0.87910,0.87910,0.87910,1685551080,5,105.81330,'1685551080','1min',2),(2177,10,3,112.28000,112.28000,112.28000,112.28000,1685551080,5,0.00000,'1685551080','1min',2),(2178,8,3,0.87900,0.87900,0.87900,0.87900,1685551140,5,0.00000,'1685551140','1min',2),(2179,10,3,112.36000,112.36000,112.36000,112.36000,1685551140,5,0.00000,'1685551140','1min',2),(2180,2,3,26966.38000,26966.38000,26966.38000,26966.38000,1685551140,5,0.02281,'1685551140','1min',2),(2181,4,3,1860.81000,1860.74000,1860.81000,1860.74000,1685551140,5,1.02240,'1685551140','1min',2),(2182,6,3,89.05000,89.04000,89.05000,89.04000,1685551140,5,0.58720,'1685551140','1min',2),(2183,8,3,0.87900,0.87900,0.87900,0.87900,1685551200,5,0.00000,'1685551200','1min',2),(2184,2,3,26952.13000,26952.13000,26952.13000,26952.13000,1685551200,5,0.00000,'1685551200','1min',2),(2185,4,3,1859.61000,1859.61000,1859.61000,1859.61000,1685551200,5,0.05040,'1685551200','1min',2),(2186,10,3,112.33000,112.33000,112.33000,112.33000,1685551200,5,0.00000,'1685551200','1min',2),(2187,6,3,89.00000,89.00000,89.00000,89.00000,1685551200,5,0.00000,'1685551200','1min',2),(2188,2,3,26948.68000,26948.68000,26948.68000,26948.68000,1685551260,5,0.00000,'1685551260','1min',2),(2189,4,3,1859.43000,1859.43000,1859.43000,1859.43000,1685551260,5,0.00000,'1685551260','1min',2),(2190,6,3,89.01000,89.01000,89.01000,89.01000,1685551260,5,0.00000,'1685551260','1min',2),(2191,8,3,0.87900,0.87900,0.87900,0.87900,1685551260,5,0.00000,'1685551260','1min',2),(2192,10,3,112.27000,112.27000,112.27000,112.27000,1685551260,5,0.00000,'1685551260','1min',2),(2193,4,3,1859.38000,1859.38000,1859.38000,1859.38000,1685551320,5,0.00000,'1685551320','1min',2),(2194,6,3,89.01000,89.01000,89.01000,89.01000,1685551320,5,0.00000,'1685551320','1min',2),(2195,8,3,0.87900,0.87900,0.87900,0.87900,1685551320,5,0.00000,'1685551320','1min',2),(2196,10,3,112.27000,112.27000,112.27000,112.27000,1685551320,5,0.00000,'1685551320','1min',2),(2197,2,3,26938.01000,26938.01000,26938.01000,26938.01000,1685551320,5,0.00000,'1685551320','1min',2),(2198,2,3,26956.00000,26956.00000,26956.00000,26956.00000,1685551380,5,0.00000,'1685551380','1min',2),(2199,6,3,89.08000,89.08000,89.08000,89.08000,1685551380,5,0.00000,'1685551380','1min',2),(2200,8,3,0.87950,0.87950,0.87950,0.87950,1685551380,5,0.00000,'1685551380','1min',2),(2201,10,3,112.27000,112.27000,112.27000,112.27000,1685551380,5,0.00000,'1685551380','1min',2),(2202,4,3,1860.62000,1860.62000,1860.62000,1860.62000,1685551380,5,0.00000,'1685551380','1min',2),(2203,8,3,0.87950,0.87950,0.87950,0.87950,1685551440,5,0.00000,'1685551440','1min',2),(2204,10,3,112.27000,112.27000,112.27000,112.27000,1685551440,5,0.00000,'1685551440','1min',2),(2205,2,3,26955.00000,26955.00000,26955.00000,26955.00000,1685551440,5,0.00000,'1685551440','1min',2),(2206,4,3,1860.48000,1860.48000,1860.48000,1860.48000,1685551440,5,0.00000,'1685551440','1min',2),(2207,6,3,89.06000,89.06000,89.06000,89.06000,1685551440,5,0.00000,'1685551440','1min',2),(2208,2,3,26950.00000,26950.00000,26950.00000,26950.00000,1685551500,5,0.00000,'1685551500','1min',2),(2209,4,3,1860.01000,1860.01000,1860.01000,1860.01000,1685551500,5,0.00000,'1685551500','1min',2),(2210,6,3,89.05000,89.05000,89.05000,89.05000,1685551500,5,0.00000,'1685551500','1min',2),(2211,8,3,0.87940,0.87940,0.87940,0.87940,1685551500,5,0.00000,'1685551500','1min',2),(2212,10,3,112.32000,112.32000,112.32000,112.32000,1685551500,5,0.00000,'1685551500','1min',2),(2213,10,3,112.33000,112.33000,112.33000,112.33000,1685551560,5,0.00000,'1685551560','1min',2),(2214,2,3,26946.24000,26946.24000,26946.24000,26946.24000,1685551560,5,0.00000,'1685551560','1min',2),(2215,4,3,1860.61000,1860.61000,1860.61000,1860.61000,1685551560,5,0.00000,'1685551560','1min',2),(2216,6,3,89.05000,89.05000,89.05000,89.05000,1685551560,5,0.00000,'1685551560','1min',2),(2217,8,3,0.87940,0.87940,0.87940,0.87940,1685551560,5,0.00000,'1685551560','1min',2),(2218,8,3,0.87940,0.87940,0.87940,0.87940,1685551620,5,0.00000,'1685551620','1min',2),(2219,10,3,112.33000,112.33000,112.33000,112.33000,1685551620,5,0.00000,'1685551620','1min',2),(2220,2,3,26950.50000,26950.50000,26950.50000,26950.50000,1685551620,5,0.07400,'1685551620','1min',2),(2221,4,3,1860.74000,1860.74000,1860.74000,1860.74000,1685551620,5,0.00000,'1685551620','1min',2),(2222,6,3,88.99000,88.99000,88.99000,88.99000,1685551620,5,0.76880,'1685551620','1min',2),(2223,4,3,1861.86000,1861.86000,1861.86000,1861.86000,1685551680,5,0.00000,'1685551680','1min',2),(2224,6,3,89.04000,89.04000,89.04000,89.04000,1685551680,5,0.00000,'1685551680','1min',2),(2225,8,3,0.88000,0.88000,0.88000,0.88000,1685551680,5,0.00000,'1685551680','1min',2),(2226,10,3,112.33000,112.33000,112.33000,112.33000,1685551680,5,0.00000,'1685551680','1min',2),(2227,2,3,26972.39000,26972.39000,26972.39000,26972.39000,1685551680,5,0.00000,'1685551680','1min',2),(2228,2,3,26950.00000,26950.00000,26950.00000,26950.00000,1685551740,5,0.00000,'1685551740','1min',2),(2229,6,3,89.00000,89.00000,89.00000,89.00000,1685551740,5,0.00000,'1685551740','1min',2),(2230,8,3,0.87940,0.87940,0.87940,0.87940,1685551740,5,0.00000,'1685551740','1min',2),(2231,10,3,112.33000,112.33000,112.33000,112.33000,1685551740,5,0.00000,'1685551740','1min',2),(2232,4,3,1859.87000,1859.87000,1859.87000,1859.87000,1685551740,5,0.00000,'1685551740','1min',2),(2233,10,3,112.33000,112.33000,112.33000,112.33000,1685551800,5,0.00000,'1685551800','1min',2),(2234,2,3,26950.35000,26950.35000,26950.35000,26950.35000,1685551800,5,0.00000,'1685551800','1min',2),(2235,4,3,1859.89000,1859.89000,1859.89000,1859.89000,1685551800,5,0.00000,'1685551800','1min',2),(2236,8,3,0.87940,0.87940,0.87940,0.87940,1685551800,5,0.00000,'1685551800','1min',2),(2237,6,3,88.98000,88.98000,88.98000,88.98000,1685551800,5,0.00000,'1685551800','1min',2),(2238,1,3,29228.26000,29224.10000,29228.26000,29220.00000,1690822860,5,1.88167,'1690822860','1min',2),(2239,2,3,1859.61000,1859.61000,1859.61000,1859.61000,1690822860,5,0.30540,'1690822860','1min',2),(2240,6,3,92.00000,91.97000,92.00000,91.97000,1690822860,5,7.01570,'1690822860','1min',2),(2241,8,3,0.74780,0.74780,0.74780,0.74780,1690822860,5,0.00000,'1690822860','1min',2),(2242,10,3,248.04000,248.25000,248.25000,248.04000,1690822860,5,2.90770,'1690822860','1min',2),(2243,8,3,0.74780,0.74780,0.74780,0.74780,1690822920,5,0.00000,'1690822920','1min',2),(2244,1,3,29222.49000,29222.49000,29222.49000,29222.49000,1690822920,5,0.08400,'1690822920','1min',2),(2245,2,3,1859.60000,1859.60000,1859.60000,1859.60000,1690822920,5,0.00000,'1690822920','1min',2),(2246,6,3,91.97000,91.97000,91.97000,91.97000,1690822920,5,0.00000,'1690822920','1min',2),(2247,10,3,248.25000,248.25000,248.25000,248.25000,1690822920,5,0.00000,'1690822920','1min',2),(2248,1,3,29220.01000,29220.01000,29220.01000,29220.01000,1690822980,5,0.00500,'1690822980','1min',2),(2249,2,3,1859.60000,1859.60000,1859.60000,1859.60000,1690822980,5,0.00000,'1690822980','1min',2),(2250,6,3,92.02000,92.02000,92.02000,92.02000,1690822980,5,0.00000,'1690822980','1min',2),(2251,8,3,0.74780,0.74780,0.74780,0.74780,1690822980,5,0.00000,'1690822980','1min',2),(2252,10,3,248.26000,248.26000,248.26000,248.26000,1690822980,5,0.00000,'1690822980','1min',2),(2253,1,3,29220.01000,29220.01000,29220.01000,29220.01000,1690823040,5,0.00000,'1690823040','1min',2),(2254,2,3,1859.61000,1859.61000,1859.61000,1859.61000,1690823040,5,0.00000,'1690823040','1min',2),(2255,6,3,92.05000,92.05000,92.05000,92.05000,1690823040,5,0.00000,'1690823040','1min',2),(2256,8,3,0.74780,0.74780,0.74780,0.74780,1690823040,5,61.70000,'1690823040','1min',2),(2257,10,3,248.37000,248.37000,248.37000,248.37000,1690823040,5,0.00000,'1690823040','1min',2),(2258,1,3,29216.51000,29216.51000,29216.51000,29216.51000,1690823100,5,0.00000,'1690823100','1min',2),(2259,6,3,92.02000,92.02000,92.02000,92.02000,1690823100,5,0.00000,'1690823100','1min',2),(2260,8,3,0.74780,0.74780,0.74780,0.74780,1690823100,5,0.00000,'1690823100','1min',2),(2261,2,3,1859.68000,1859.68000,1859.68000,1859.68000,1690823100,5,0.00000,'1690823100','1min',2),(2262,10,3,248.37000,248.37000,248.37000,248.37000,1690823100,5,0.00000,'1690823100','1min',2);
/*!40000 ALTER TABLE `market_hour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `micro_numbers`
--

DROP TABLE IF EXISTS `micro_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `micro_numbers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '币种id',
  `number` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '数量',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `micro_numbers`
--

LOCK TABLES `micro_numbers` WRITE;
/*!40000 ALTER TABLE `micro_numbers` DISABLE KEYS */;
INSERT INTO `micro_numbers` VALUES (44,3,1000.00000000,'2020-03-18 07:21:52','2020-07-26 07:33:30'),(45,3,100.00000000,'2020-03-18 07:21:56','2020-03-25 14:08:18'),(46,3,500.00000000,'2020-03-18 07:22:00','2020-03-18 07:22:00'),(47,3,200.00000000,'2020-04-28 22:25:05','2020-07-26 07:32:55'),(48,3,100000.00000000,'2020-12-30 11:46:44','2020-12-30 11:46:44'),(49,3,0.00000000,'2021-05-10 20:49:04','2021-05-10 20:49:04'),(50,3,5.00000000,'2021-11-30 13:20:29','2021-11-30 13:20:29');
/*!40000 ALTER TABLE `micro_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `micro_orders`
--

DROP TABLE IF EXISTS `micro_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `micro_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `match_id` int(11) unsigned NOT NULL COMMENT '交易对id',
  `currency_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '支付的币种',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '买卖类型1.买涨,2.买跌',
  `is_insurance` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单险种:0.无,1.正向，2反向。',
  `seconds` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '秒数',
  `number` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '下单数量',
  `open_price` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '开仓价',
  `end_price` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '收盘价',
  `fee` decimal(20,8) unsigned NOT NULL COMMENT '手续费',
  `profit_ratio` decimal(20,2) unsigned NOT NULL COMMENT '收益率',
  `fact_profits` decimal(20,8) NOT NULL COMMENT '最终收益',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态:1.交易中,2.平仓中,3.已平仓',
  `pre_profit_result` tinyint(4) NOT NULL DEFAULT '0' COMMENT '预设盈利状态:-1.亏损,0.未设置,1.盈利',
  `profit_result` tinyint(4) NOT NULL DEFAULT '0' COMMENT '盈利结果:-1.亏损,0.平,1.盈利',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '提交日期',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新日期',
  `handled_at` timestamp NULL DEFAULT NULL COMMENT '平仓时间',
  `complete_at` timestamp NULL DEFAULT NULL COMMENT '完成时间',
  `return_at` timestamp NULL DEFAULT NULL COMMENT '返还手续费的时间',
  `agent_path` varchar(2048) DEFAULT '1' COMMENT '代理商关系',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='秒合约订单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `micro_orders`
--

LOCK TABLES `micro_orders` WRITE;
/*!40000 ALTER TABLE `micro_orders` DISABLE KEYS */;
INSERT INTO `micro_orders` VALUES (1,1,2,3,1,0,30,55.00000000,19332.99000000,19432.54000000,0.00000000,40.00,22.00000000,3,1,1,'2022-10-25 13:05:14','2022-10-25 16:02:46','2022-10-25 13:05:44','2022-10-25 16:02:46',NULL,'1'),(2,1,2,3,1,0,30,111.00000000,19355.56000000,19432.54000000,0.00000000,40.00,44.40000000,3,1,1,'2022-10-25 13:13:03','2022-10-25 16:02:46','2022-10-25 13:13:33','2022-10-25 16:02:46',NULL,'1'),(3,2,2,3,1,0,30,100.00000000,19432.51000000,19432.54000000,0.00000000,40.00,40.00000000,3,1,1,'2022-10-25 13:34:45','2022-10-25 16:02:46','2022-10-25 13:35:15','2022-10-25 16:02:46',NULL,'1'),(4,2,2,3,1,0,30,100.00000000,19769.09000000,19969.46000000,0.00000000,40.00,0.00000000,2,1,0,'2022-10-25 16:25:34','2023-07-31 16:18:02','2022-10-25 16:26:04',NULL,NULL,'1'),(5,1,3,3,1,0,30,100.00000000,1450.48200000,27984.88300000,0.00000000,40.00,0.00000000,1,1,0,'2022-10-25 16:55:13','2023-07-31 16:18:03','2022-10-25 16:55:43',NULL,NULL,'1'),(6,1,2,3,1,0,30,100.00000000,19969.41000000,19969.46000000,0.00000000,40.00,0.00000000,1,1,0,'2022-10-26 02:26:57','2023-07-31 16:18:02','2022-10-26 02:27:27',NULL,NULL,'1'),(7,2,2,3,1,0,30,10.00000000,19969.54000000,19969.49000000,0.00000000,40.00,0.00000000,1,-1,0,'2022-10-26 03:29:49','2023-07-31 16:18:02','2022-10-26 03:30:19',NULL,NULL,'1'),(8,3,3,3,1,0,30,100.00000000,27890.26100000,27984.88300000,0.00000000,40.00,0.00000000,1,1,0,'2023-05-29 12:32:02','2023-07-31 16:18:04','2023-05-29 12:32:32',NULL,NULL,'1'),(9,3,3,3,1,0,30,100.00000000,27942.81500000,27984.88300000,0.00000000,40.00,0.00000000,1,1,0,'2023-05-29 12:33:35','2023-07-31 16:18:05','2023-05-29 12:34:05',NULL,NULL,'1'),(10,3,3,3,1,0,60,300.00000000,27948.89700000,27917.78500000,0.00000000,50.00,0.00000000,1,-1,0,'2023-05-30 03:41:56','2023-07-31 16:18:00','2023-05-30 03:42:56',NULL,NULL,'1'),(11,3,2,3,1,0,30,100.00000000,28011.72000000,19969.49000000,0.00000000,40.00,0.00000000,1,-1,0,'2023-06-02 03:16:02','2023-07-31 16:18:02','2023-06-02 03:16:32',NULL,NULL,'1'),(12,6,2,3,1,0,30,5000.00000000,28011.74000000,19969.49000000,0.00000000,40.00,0.00000000,1,-1,0,'2023-07-24 20:39:50','2023-07-31 16:18:02','2023-07-24 20:40:20',NULL,NULL,'1'),(13,3,2,3,2,0,30,1000.00000000,29234.27000000,19969.49000000,0.00000000,40.00,0.00000000,1,1,0,'2023-07-31 16:08:17','2023-07-31 16:18:02','2023-07-31 16:08:47',NULL,NULL,'1'),(14,3,2,3,1,0,30,400.00000000,29205.29000000,19969.49000000,0.00000000,40.00,0.00000000,1,-1,0,'2023-07-31 16:12:29','2023-07-31 16:18:02','2023-07-31 16:12:59',NULL,NULL,'1'),(15,3,2,3,1,0,60,500.00000000,29234.06000000,29045.50000000,0.00000000,50.00,0.00000000,1,1,0,'2023-07-31 17:04:40','2023-08-06 16:39:22','2023-07-31 17:05:40',NULL,NULL,'1'),(16,3,2,3,1,0,30,100.00000000,29232.92000000,29045.50000000,0.00000000,40.00,0.00000000,1,-1,0,'2023-08-06 02:03:24','2023-08-06 16:39:22','2023-08-06 02:03:54',NULL,NULL,'1'),(17,9,2,3,1,0,60,5000.00000000,29090.62000000,29197.02000000,0.00000000,10.00,0.00000000,1,0,0,'2023-08-08 06:26:07','2023-08-08 09:57:42','2023-08-08 06:27:07',NULL,NULL,'1'),(18,10,2,3,1,0,120,5000.00000000,29090.71000000,29197.02000000,0.00000000,12.00,0.00000000,1,0,0,'2023-08-08 06:33:30','2023-08-08 09:57:42','2023-08-08 06:35:30',NULL,NULL,'1');
/*!40000 ALTER TABLE `micro_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `micro_seconds`
--

DROP TABLE IF EXISTS `micro_seconds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `micro_seconds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seconds` int(11) unsigned NOT NULL COMMENT '秒数',
  `min_num` int(11) NOT NULL DEFAULT '0' COMMENT '最小下注限制（0）不限',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态:0.禁用,1.启用',
  `profit_ratio` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '收益率',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='秒合约秒数配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `micro_seconds`
--

LOCK TABLES `micro_seconds` WRITE;
/*!40000 ALTER TABLE `micro_seconds` DISABLE KEYS */;
INSERT INTO `micro_seconds` VALUES (1,60,10,1,10.00,'2019-03-31 16:00:00','2023-08-08 06:24:59'),(3,120,10,1,12.00,NULL,'2023-08-08 06:24:54'),(4,180,10,1,15.00,'2021-05-09 16:46:44','2023-08-08 06:25:04'),(5,240,10,1,18.00,'2021-05-09 16:50:14','2023-08-08 06:25:08'),(6,300,10,1,21.00,'2021-05-09 16:51:12','2023-08-08 06:25:14'),(7,600,10,1,24.00,'2021-05-09 16:56:58','2023-08-08 06:25:18');
/*!40000 ALTER TABLE `micro_seconds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mining_list`
--

DROP TABLE IF EXISTS `mining_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mining_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `sort` int(1) NOT NULL DEFAULT '1',
  `cycle` int(8) NOT NULL,
  `max_exchange` int(5) NOT NULL,
  `cl_sum` decimal(10,2) NOT NULL,
  `cl_h` decimal(10,2) NOT NULL,
  `buy_type` int(5) NOT NULL DEFAULT '1',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='矿机产品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mining_list`
--

LOCK TABLES `mining_list` WRITE;
/*!40000 ALTER TABLE `mining_list` DISABLE KEYS */;
INSERT INTO `mining_list` VALUES (2,'大型矿机',100000.00,1,8640,999,200000.00,23.00,3,1509027150),(3,'小型矿机',10000.00,1,2160,999,12000.00,5.50,3,1509027150),(5,'微型矿机',150.00,1,720,999,300.00,2.40,2,0),(6,'微型云矿机',100.00,2,1440,3,200.00,8.32,1,0),(7,'小型云矿机',500.00,2,27720,3,1500.00,5000.00,1,0),(8,'中型云矿机',1000.00,2,27720,3,4000.00,0.14,1,0),(9,'大中型云矿机',5000.00,2,27720,3,25000.00,0.90,1,0);
/*!40000 ALTER TABLE `mining_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my_mining`
--

DROP TABLE IF EXISTS `my_mining`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `my_mining` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kj_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `prcie` decimal(10,2) NOT NULL,
  `zhouqi` int(5) NOT NULL,
  `ok_zhouqi` int(10) NOT NULL DEFAULT '0',
  `xs_shouyi` int(11) NOT NULL,
  `ok_shouyi` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shouyi` decimal(10,2) NOT NULL,
  `addtime` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  `sort` int(2) DEFAULT '1',
  `yest_shouyi` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my_mining`
--

LOCK TABLES `my_mining` WRITE;
/*!40000 ALTER TABLE `my_mining` DISABLE KEYS */;
/*!40000 ALTER TABLE `my_mining` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myquotation`
--

DROP TABLE IF EXISTS `myquotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myquotation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `open` decimal(25,8) DEFAULT NULL COMMENT '开',
  `high` decimal(25,8) DEFAULT NULL COMMENT '高',
  `low` decimal(25,8) DEFAULT NULL COMMENT '低',
  `close` decimal(25,8) DEFAULT NULL COMMENT '收',
  `symbol` varchar(255) DEFAULT NULL COMMENT '交易对名称 BTC/USDT',
  `base` varchar(24) DEFAULT NULL COMMENT '基础币种BTC',
  `target` varchar(24) DEFAULT NULL COMMENT '交易币种USDT',
  `itime` int(10) unsigned DEFAULT NULL COMMENT '时间戳',
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `vol` decimal(25,8) unsigned DEFAULT '0.00000000' COMMENT '交易量',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `symbol` (`symbol`) USING BTREE,
  KEY `base` (`base`) USING BTREE,
  KEY `itime` (`itime`,`base`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myquotation`
--

LOCK TABLES `myquotation` WRITE;
/*!40000 ALTER TABLE `myquotation` DISABLE KEYS */;
/*!40000 ALTER TABLE `myquotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myquotation_sum`
--

DROP TABLE IF EXISTS `myquotation_sum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myquotation_sum` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `open` decimal(25,8) DEFAULT NULL COMMENT '开',
  `high` decimal(25,8) DEFAULT NULL COMMENT '高',
  `low` decimal(25,8) DEFAULT NULL COMMENT '低',
  `close` decimal(25,8) DEFAULT NULL COMMENT '收',
  `symbol` varchar(255) DEFAULT NULL COMMENT '交易对名称 BTC/USDT',
  `base` varchar(24) DEFAULT NULL COMMENT '基础币种BTC',
  `target` varchar(24) DEFAULT NULL COMMENT '交易币种USDT',
  `itime` int(10) unsigned DEFAULT NULL COMMENT '时间戳',
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `ktype` varchar(10) DEFAULT '5' COMMENT 'k线分类 5 15 30 60 1day 1week 1mon',
  `vol` decimal(25,8) unsigned DEFAULT '0.00000000' COMMENT '交易量',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `symbol` (`symbol`) USING BTREE,
  KEY `ktype` (`ktype`) USING BTREE,
  KEY `base` (`base`) USING BTREE,
  KEY `itime` (`itime`,`base`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myquotation_sum`
--

LOCK TABLES `myquotation_sum` WRITE;
/*!40000 ALTER TABLE `myquotation_sum` DISABLE KEYS */;
/*!40000 ALTER TABLE `myquotation_sum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `needle`
--

DROP TABLE IF EXISTS `needle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `needle` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `open` decimal(25,8) DEFAULT NULL COMMENT '开',
  `high` decimal(25,8) DEFAULT NULL COMMENT '高',
  `low` decimal(25,8) DEFAULT NULL COMMENT '低',
  `close` decimal(25,8) DEFAULT NULL COMMENT '收',
  `symbol` varchar(255) DEFAULT NULL COMMENT '交易对名称 BTC/USDT',
  `base` varchar(24) DEFAULT NULL COMMENT '基础币种BTC',
  `target` varchar(24) DEFAULT NULL COMMENT '交易币种USDT',
  `itime` int(10) unsigned DEFAULT NULL COMMENT '精确到秒的时间戳',
  `updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `needle`
--

LOCK TABLES `needle` WRITE;
/*!40000 ALTER TABLE `needle` DISABLE KEYS */;
/*!40000 ALTER TABLE `needle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL DEFAULT '0',
  `lang` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '语言类型',
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `recommend` tinyint(4) NOT NULL DEFAULT '0',
  `audit` tinyint(4) NOT NULL DEFAULT '0',
  `display` tinyint(4) NOT NULL DEFAULT '0',
  `discuss` tinyint(4) NOT NULL DEFAULT '0',
  `author` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `browse_grant` tinyint(4) NOT NULL DEFAULT '0',
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `abstract` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `thumbnail` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cover` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorts` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=290 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='新闻';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,23,'zh','关于我们',0,0,0,0,'简体-关于-关于我们',0,'关于我们','关于我们','<p>《YCoin平台反洗錢和反恐怖融資用戶指引》</p><p>&nbsp;</p><p><br/></p><p>第一條：制定的目的和依據 鑑於洗錢活動將嚴重危害數字資產交易的發展，助長和滋生腐敗、敗壞社會風氣，損害用戶的正當權益，破壞數字資產交易平台穩健經營的基礎，加大數字資產交易平台的法律和運營風險，YCoin 為預防洗錢和恐怖融資活動，全面履行反洗錢和反恐融資法律的相關規定，根據《YCoin 反洗錢規則》、《客戶協議》、《大額交易管理辦法》等公司規定，制定本指引。</p><p><br/></p><p>第二條：適用範圍 本指引適用於在YCoin平台交易的所有用戶。用戶應當在遵循其所在地國家或地區反洗錢和反恐融資方面的法律規定，在用戶所在地區法律規定的範圍內，執行本指引之規定。用戶所在國家或者地區有更嚴格要求的，遵守其規定。</p><p><br/></p><p>第三條：反洗錢和反恐怖融資 是指為了防範不法分子通過YCoin平台進行交易從而掩飾、隱瞞毒品犯罪、黑社會性質的組織犯罪、恐怖活動犯罪、走私犯罪、貪污賄賂犯罪、金融詐騙犯罪、破壞金融管理秩序犯罪等違法所得及其收益的來源和性質的洗錢活動，依照相關法律和 YCoin反洗錢相關規定採取相關措施的行為。</p><p><br/></p><p>第四條：YCoin反洗錢相關規定 YCoin 的反洗錢（包括反恐怖融資，下同）相關規則包括《 YCoin 反洗錢規則》、《用戶協議》中反洗錢的部分、《大額交易管理辦法》與本指引。若本指引中規定的內容與其它規則相衝突，則本指引優先適用。</p><p><br/></p><p>第五條：YCoin平台反洗錢基本原則 YCoin平台按照以下原則開展客戶風險監控工作：</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;全面性原則。 YCoin平台會綜合考慮客戶可能涉嫌洗錢的各類風險因素，採取合理方式對所有客戶進行風險監控。</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;審慎性原則。 YCoin平台會在充分了解客戶的基礎上，提高對客戶身份的識別能力，審慎進行客戶風險監控。</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;持續性原則。 YCoin平台會對客戶風險進行持續關注，根據實際情況適做出應對。</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;保密性原則。 YCoin平台所掌握的客戶身份信息、交易信息和風險等級信息等予以嚴格保密，非依法律規定和監管要求，不會向任何單位和個人提供。</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;分級管理原則。 YCoin平台根據客戶的風險等級，定期審核所保存的客戶基本信息，對風險等級較高客戶的審核應當嚴於對風險等級較低客戶的審核。</p><p><br/></p><p>第六條：個人用戶文件之提交YCoin個人用戶應當依據 YCoin 反洗錢相關規定提交以下信息和資料：</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;個人姓名；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;身份證或護照複印件；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;其它應YCoin要求應當提供之信息或文件。</p><p><br/></p><p>第七條：機構用戶文件之提交 YCoin機構用戶應當依據 YCoin 反洗錢相關規定提交以下信息和資料：</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司名稱；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司註冊辦公地址；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司法定代表人；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司法定代表人住所地；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司營業執照；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司法定代表人身份證或護照複印件；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;其它應YCoin要求應當提供之信息或文件。</p><p><br/></p><p>第八條：用戶文件之審查 YCoin平台會依據 YCoin 反洗錢相關規定中的客戶識別制度對客戶所提交的相關信息進行核實和記錄，若YCoin平台對於客戶所提交的資料有疑問時，有權向相關主管機構或部門進行核實。</p><p><br/></p><p>第九條：低風險用戶之監測 YCoin平台會根據 YCoin 反洗錢規定的具體要求對低風險用戶進行檢測，YCoin平台保留對低風險用戶進行調級的權利。</p><p><br/></p><p>第十條：高風險用戶之監測 YCoin平台對於高風險類別的客戶，會於每半年進行一次審核，更新客戶身份基本信息並了解其資金來源、資金用途、經濟狀況或者經營狀況等信息。</p><p><br/></p><p>第十一條：用戶文件之保存 YCoin平台會依法採取必要措施將客戶身份資料和交易信息保存一定期限。參照國際通行規則，用戶身份資料自業務關係結束後，客戶交易信息自交易結束後，應至少保存五年。</p><p><br/></p><p>第十二條：用戶之注意 YCoin用戶應當注意以下事項：</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;禁止將用戶本人的賬號出借給他人使用；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;禁止出租、出借用戶本人身份證件；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;禁止出租、出借、透露用戶本人的賬戶、銀行卡、存摺、密碼等重要個人財產信息；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;用戶應當主動配合YCoin平台進行客戶身份識別；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;在YCoin平台進行交易時，選擇並使用安全可靠的第三方金融機構進行支付活動。</p><p><br/></p><p>第十三條：可疑行為之報告 若YCoin平台用戶在平台交易時發現任何賬戶可能從事洗錢或恐怖融資活動，用戶可以向YCoin平台進行報告。</p><p><br/></p><p>第十四條：指引之解釋 本指引由YCoin平台進行解釋。</p><p><br/></p><p>第十五條：生效期 本指引自發布之日起實施。</p><p><br/></p>',0,1635652800,1640196492,'/images/zwtp.png','/images/zwtp.png',0),(2,23,'zh','法律声明',0,0,0,0,'简体-关于-法律声明',0,'法律声明','法律声明','<p>《YCoin平台反洗錢和反恐怖融資用戶指引》</p><p>&nbsp;</p><p><br/></p><p>第一條：制定的目的和依據 鑑於洗錢活動將嚴重危害數字資產交易的發展，助長和滋生腐敗、敗壞社會風氣，損害用戶的正當權益，破壞數字資產交易平台穩健經營的基礎，加大數字資產交易平台的法律和運營風險，YCoin 為預防洗錢和恐怖融資活動，全面履行反洗錢和反恐融資法律的相關規定，根據《YCoin 反洗錢規則》、《客戶協議》、《大額交易管理辦法》等公司規定，制定本指引。</p><p><br/></p><p>第二條：適用範圍 本指引適用於在 YCoin平台交易的所有用戶。用戶應當在遵循其所在地國家或地區反洗錢和反恐融資方面的法律規定，在用戶所在地區法律規定的範圍內，執行本指引之規定。用戶所在國家或者地區有更嚴格要求的，遵守其規定。</p><p><br/></p><p>第三條：反洗錢和反恐怖融資 是指為了防範不法分子通過YCoin平台進行交易從而掩飾、隱瞞毒品犯罪、黑社會性質的組織犯罪、恐怖活動犯罪、走私犯罪、貪污賄賂犯罪、金融詐騙犯罪、破壞金融管理秩序犯罪等違法所得及其收益的來源和性質的洗錢活動，依照相關法律和 IDEX 反洗錢相關規定採取相關措施的行為。</p><p><br/></p><p>第四條：YCoin 反洗錢相關規定YCoin 的反洗錢（包括反恐怖融資，下同）相關規則包括《 YCoin 反洗錢規則》、《用戶協議》中反洗錢的部分、《大額交易管理辦法》與本指引。若本指引中規定的內容與其它規則相衝突，則本指引優先適用。</p><p><br/></p><p>第五條：YCoin平台反洗錢基本原則 YCoin平台按照以下原則開展客戶風險監控工作：</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;全面性原則。 YCoin平台會綜合考慮客戶可能涉嫌洗錢的各類風險因素，採取合理方式對所有客戶進行風險監控。</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;審慎性原則。 YCoin平台會在充分了解客戶的基礎上，提高對客戶身份的識別能力，審慎進行客戶風險監控。</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;持續性原則。 YCoin平台會對客戶風險進行持續關注，根據實際情況適做出應對。</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;保密性原則。 YCoin平台所掌握的客戶身份信息、交易信息和風險等級信息等予以嚴格保密，非依法律規定和監管要求，不會向任何單位和個人提供。</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;分級管理原則。 YCoin平台根據客戶的風險等級，定期審核所保存的客戶基本信息，對風險等級較高客戶的審核應當嚴於對風險等級較低客戶的審核。</p><p><br/></p><p>第六條：個人用戶文件之提交 YCoin個人用戶應當依據 YCoin 反洗錢相關規定提交以下信息和資料：</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;個人姓名；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;身份證或護照複印件；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;其它應YCoin要求應當提供之信息或文件。</p><p><br/></p><p>第七條：機構用戶文件之提交 YCoin機構用戶應當依據 YCoin 反洗錢相關規定提交以下信息和資料：</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司名稱；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司註冊辦公地址；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司法定代表人；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司法定代表人住所地；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司營業執照；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司法定代表人身份證或護照複印件；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;其它應YCoin要求應當提供之信息或文件。</p><p><br/></p><p>第八條：用戶文件之審查 YCoin平台會依據 YCoin 反洗錢相關規定中的客戶識別制度對客戶所提交的相關信息進行核實和記錄，若YCoin平台對於客戶所提交的資料有疑問時，有權向相關主管機構或部門進行核實。</p><p><br/></p><p>第九條：低風險用戶之監測 YCoin平台會根據 YCoin 反洗錢規定的具體要求對低風險用戶進行檢測，YCoin平台保留對低風險用戶進行調級的權利。</p><p><br/></p><p>第十條：高風險用戶之監測 YCoin平台對於高風險類別的客戶，會於每半年進行一次審核，更新客戶身份基本信息並了解其資金來源、資金用途、經濟狀況或者經營狀況等信息。</p><p><br/></p><p>第十一條：用戶文件之保存 YCoin平台會依法採取必要措施將客戶身份資料和交易信息保存一定期限。參照國際通行規則，用戶身份資料自業務關係結束後，客戶交易信息自交易結束後，應至少保存五年。</p><p><br/></p><p>第十二條：用戶之注意 YCoin用戶應當注意以下事項：</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;禁止將用戶本人的賬號出借給他人使用；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;禁止出租、出借用戶本人身份證件；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;禁止出租、出借、透露用戶本人的賬戶、銀行卡、存摺、密碼等重要個人財產信息；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;用戶應當主動配合YCoin平台進行客戶身份識別；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;在YCoin平台進行交易時，選擇並使用安全可靠的第三方金融機構進行支付活動。</p><p><br/></p><p>第十三條：可疑行為之報告 若YCoin平台用戶在平台交易時發現任何賬戶可能從事洗錢或恐怖融資活動，用戶可以向YCoin平台進行報告。</p><p><br/></p><p>第十四條：指引之解釋 本指引由YCoin平台進行解釋。</p><p><br/></p><p>第十五條：生效期 本指引自發布之日起實施。</p><p><br/></p>',0,1635652800,1640196881,'/images/zwtp.png','/images/zwtp.png',0),(231,19,'hk','隱私條列',0,0,0,0,'繁体-条款说明-隱私條列',0,'隱私條列','隱私條列','<p>第一條&nbsp;</p><p>本網站的宗旨是在不違反美利堅共和國相關法律法規的前提下，盡可能地為全球廣大數字資產愛好者及用戶提供專業、安全、可信賴的數字資產交易及資產管理服務。但您所在國家或地區屬於監管明確禁止數字資產交易的法域或屬於被列入相關受制裁國家名單的，您應禁止使用本網站項下的服務。</p><p>第二條&nbsp;</p><p>本平台致力於為用戶創建一個合規、安全、可靠的數字資產交易環境，禁止用戶使用本網站從事洗錢、走私、商業賄賂、惡意操縱市場等一切非法交易活動或違法行為。為此我們盡最大努力製定嚴格的反洗錢反恐怖方案及採取有效的安全風險控制措施，以最大限度地保障用戶的合法權益，並使平台自身維持著一個良好的品牌聲譽。</p><p>第三條&nbsp;</p><p>當有權機關出示相應的調查文件要求本網站配合對指定用戶進行調查時， 或對用戶賬戶採取查封、凍結或者劃轉等措施時，本網站將在核查司法文件的有效性和真實性後，按照經平台判定的有權機關的要求協助提供相應的用戶數據，或進行相應的操作，因此造成的用戶隱私洩露、賬戶不能操作及由此給用戶所造成的其他損失等，本網站不承擔任何責任。</p><p>第四條&nbsp;</p><p>凡使用本網站服務的用戶，在交易前均應知悉：數字資產不以任何政府或中央銀行為後盾支持，且數字資產價格波動大，持有或使用數字資產具有較高的風險。在作出交易決策前，您應理性審慎自身的財務狀況以判斷是否適合您。</p><p>第五條</p><p>本網站使用者因為違反本聲明的規定而觸犯美利堅共和國相關法律的，本網站作為服務的提供方，有義務對平台的規則及服務進行完善， 但本站並無觸犯美利堅共和國相關法律的動機和事實，對使用者的行為不承擔任何連帶責任。</p><p>第六條</p><p>凡以任何方式登錄本網站或直接、間接使用本網站服務者，視為自願接受本網站聲明的約束。</p><p>第七條</p><p>本聲明未涉及的問題參見美利堅共和國有關法律法規，當本聲明與美利堅共和國相關法律法規衝突時，以美利堅共和國相關法律法規為準。</p><p><br/></p>',0,1635696000,1638954836,'/images/zwtp.png','/images/zwtp.png',0),(232,19,'hk','用戶協議',0,0,0,0,'繁体-条款说明-用戶協議',0,'用戶協議','用戶協議','<p>《YCoin平台反洗錢和反恐怖融資用戶指引》</p><p>&nbsp;</p><p><br/></p><p>第一條：制定的目的和依據 鑑於洗錢活動將嚴重危害數字資產交易的發展，助長和滋生腐敗、敗壞社會風氣，損害用戶的正當權益，破壞數字資產交易平台穩健經營的基礎，加大數字資產交易平台的法律和運營風險，YCoin 為預防洗錢和恐怖融資活動，全面履行反洗錢和反恐融資法律的相關規定，根據《YCoin 反洗錢規則》、《客戶協議》、《大額交易管理辦法》等公司規定，制定本指引。</p><p><br/></p><p>第二條：適用範圍 本指引適用於在 YCoin平台交易的所有用戶。用戶應當在遵循其所在地國家或地區反洗錢和反恐融資方面的法律規定，在用戶所在地區法律規定的範圍內，執行本指引之規定。用戶所在國家或者地區有更嚴格要求的，遵守其規定。</p><p><br/></p><p>第三條：反洗錢和反恐怖融資 是指為了防範不法分子通過YCoin平台進行交易從而掩飾、隱瞞毒品犯罪、黑社會性質的組織犯罪、恐怖活動犯罪、走私犯罪、貪污賄賂犯罪、金融詐騙犯罪、破壞金融管理秩序犯罪等違法所得及其收益的來源和性質的洗錢活動，依照相關法律和 YCoin 反洗錢相關規定採取相關措施的行為。</p><p><br/></p><p>第四條：YCoin 反洗錢相關規定 YCoin的反洗錢（包括反恐怖融資，下同）相關規則包括《YCoin 反洗錢規則》、《用戶協議》中反洗錢的部分、《大額交易管理辦法》與本指引。若本指引中規定的內容與其它規則相衝突，則本指引優先適用。</p><p><br/></p><p>第五條：YCoin平台反洗錢基本原則 YCoin平台按照以下原則開展客戶風險監控工作：</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;全面性原則。 YCoin平台會綜合考慮客戶可能涉嫌洗錢的各類風險因素，採取合理方式對所有客戶進行風險監控。</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;審慎性原則。 YCoin平台會在充分了解客戶的基礎上，提高對客戶身份的識別能力，審慎進行客戶風險監控。</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;持續性原則。YCoin平台會對客戶風險進行持續關注，根據實際情況適做出應對。</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;保密性原則。YCoin平台所掌握的客戶身份信息、交易信息和風險等級信息等予以嚴格保密，非依法律規定和監管要求，不會向任何單位和個人提供。</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;分級管理原則。 YCoin平台根據客戶的風險等級，定期審核所保存的客戶基本信息，對風險等級較高客戶的審核應當嚴於對風險等級較低客戶的審核。</p><p><br/></p><p>第六條：個人用戶文件之提交 YCoin個人用戶應當依據 YCoin 反洗錢相關規定提交以下信息和資料：</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;個人姓名；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;身份證或護照複印件；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;其它應YCoin要求應當提供之信息或文件。</p><p><br/></p><p>第七條：機構用戶文件之提交 YCoin機構用戶應當依據 YCoin 反洗錢相關規定提交以下信息和資料：</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司名稱；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司註冊辦公地址；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司法定代表人；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司法定代表人住所地；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司營業執照；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司法定代表人身份證或護照複印件；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;其它應YCoin要求應當提供之信息或文件。</p><p><br/></p><p>第八條：用戶文件之審查 YCoin平台會依據 YCoin 反洗錢相關規定中的客戶識別制度對客戶所提交的相關信息進行核實和記錄，若YCoin平台對於客戶所提交的資料有疑問時，有權向相關主管機構或部門進行核實。</p><p><br/></p><p>第九條：低風險用戶之監測 YCoin平台會根據 YCoin 反洗錢規定的具體要求對低風險用戶進行檢測，YCoin平台保留對低風險用戶進行調級的權利。</p><p><br/></p><p>第十條：高風險用戶之監測 YCoin平台對於高風險類別的客戶，會於每半年進行一次審核，更新客戶身份基本信息並了解其資金來源、資金用途、經濟狀況或者經營狀況等信息。</p><p><br/></p><p>第十一條：用戶文件之保存 YCoin平台會依法採取必要措施將客戶身份資料和交易信息保存一定期限。參照國際通行規則，用戶身份資料自業務關係結束後，客戶交易信息自交易結束後，應至少保存五年。</p><p><br/></p><p>第十二條：用戶之注意 YCoin用戶應當注意以下事項：</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;禁止將用戶本人的賬號出借給他人使用；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;禁止出租、出借用戶本人身份證件；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;禁止出租、出借、透露用戶本人的賬戶、銀行卡、存摺、密碼等重要個人財產信息；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;用戶應當主動配合YCoin平台進行客戶身份識別；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;在YCoin平台進行交易時，選擇並使用安全可靠的第三方金融機構進行支付活動。</p><p><br/></p><p>第十三條：可疑行為之報告 若YCoin平台用戶在平台交易時發現任何賬戶可能從事洗錢或恐怖融資活動，用戶可以向YCoin平台進行報告。</p><p><br/></p><p>第十四條：指引之解釋 本指引由YCoin平台進行解釋。</p><p><br/></p><p>第十五條：生效期 本指引自發布之日起實施。</p><p><br/></p>',0,1635652800,1640197030,'/images/zwtp.png','/images/zwtp.png',0),(234,19,'en','Privacy policy',0,0,0,0,'YCoin',0,'Privacy policy','Privacy policy','<p>YCoin&nbsp;Privacy Policy</p><p>Last updated: December&nbsp;15, 2021.</p><p>This Privacy Policy describes how YCoin&nbsp;collects and processes your personal information through the YCoin&nbsp;websites and applications that reference this Privacy Notice. YCoin&nbsp;refers to an ecosystem comprising YCoin&nbsp;websites (whose domain names include but are not limited tohttps://eme.plus/&nbsp;), mobile applications, clients, applets and other applications that are developed to offer YCoin&nbsp;Services, and includes independently-operated platforms, websites and clients within the ecosystem (e.g., YCoin’s Open Platform, YCoin&nbsp;Launchpad, YCoin&nbsp;Labs, YCoin&nbsp;Charity, YCoin&nbsp;DEX, YCoin&nbsp;X, JEX, Trust Wallet, and fiat gateways). “YCoin&nbsp;Operators” refer to all parties that run YCoin, including but not limited to legal persons, unincorporated organizations and teams that provide YCoin&nbsp;Services and are responsible for such services. “YCoin” as used in this Policy includes YCoin&nbsp;Operators.</p><p>This Privacy Policy applies to all platforms, websites, and departments of YCoin&nbsp;and YCoin&nbsp;Operators. By using YCoin&nbsp;Services, you are consenting to the collection, storage, processing and transfer of your personal information as described in this Privacy Policy.</p><p>YCoin&nbsp;UAB, (legal entity code: 305595206, registered office address: Didžioji str. 18, Vilnius, the Republic of Lithuania) is the Data Controller for personal information collected and processed in connection with provision of YCoin&nbsp;Services.</p><h3>1. What Personal Information About Users Does YCoin&nbsp;Collect?</h3><p>YCoin&nbsp;collects your personal information in order to provide and continually improve our products and services.</p><p>Here are the types of personal information we collect:</p><p>Information you give us: we receive and store any information you provide in relation to YCoin. You can choose not to provide certain information but then you might not be able to use some YCoin&nbsp;Services. Examples of information that you give us include:</p><p>·&nbsp;</p><p>email address</p><p>·&nbsp;</p><p>·&nbsp;</p><p>name</p><p>·&nbsp;</p><p>·&nbsp;</p><p>gender</p><p>·&nbsp;</p><p>·&nbsp;</p><p>date of birth</p><p>·&nbsp;</p><p>·&nbsp;</p><p>home address</p><p>·&nbsp;</p><p>·&nbsp;</p><p>nationality</p><p>·&nbsp;</p><p>·&nbsp;</p><p>country code</p><p>·&nbsp;</p><p>·&nbsp;</p><p>other information to help us identify you</p><p>·&nbsp;</p><p>Automatically Collected information: we automatically collect and store certain types of information about your use of YCoin&nbsp;Services including your interaction with content and services available through YCoin&nbsp;Services. Like many websites, we use cookies and other unique identifiers and we obtain certain types of information when your web browser or device accesses YCoin&nbsp;Services. Examples of the information we collect and analyse include:</p><p>·&nbsp;</p><p>the Internet protocol (IP) address used to connect your computer to the Internet,</p><p>·&nbsp;</p><p>·&nbsp;</p><p>login, e-mail address, password and location of your device or computer;</p><p>·&nbsp;</p><p>·&nbsp;</p><p>YCoin&nbsp;Services metrics (e.g., the occurrences of technical errors, your interactions with service features and content, and your settings preferences);</p><p>·&nbsp;</p><p>·&nbsp;</p><p>version and time zone settings;</p><p>·&nbsp;</p><p>·&nbsp;</p><p>transaction history.</p><p>·&nbsp;</p><p>Information from other sources: we may receive information about you from other sources such as credit history information from credit bureaus, which we use to help prevent and detect fraud.</p><h3>2. Can Children Use YCoin&nbsp;Services?</h3><p>YCoin&nbsp;does not allow anyone under the age of 18 to use YCoin&nbsp;Services.</p><h3>3. For What Purposes Does YCoin&nbsp;Process My Personal Information?</h3><p>We process your personal information to operate, provide, and improve the YCoin&nbsp;Services that we offer our users. These purposes include:</p><p>·&nbsp;</p><p>Transaction services. We use your personal information to take and handle orders, process payments, and communicate with you about orders and services, and promotional offers.</p><p>·&nbsp;</p><p>·&nbsp;</p><p>Provide, troubleshoot, and improve YCoin&nbsp;Services. We use your personal information to provide functionality, analyse performance, fix errors, and improve the usability and effectiveness of YCoin&nbsp;Services.</p><p>·&nbsp;</p><p>·&nbsp;</p><p>Recommendations and personalisation. We use your personal information to recommend features and services that might be of interest to you, identify your preferences, and personalise your experience with YCoin&nbsp;Services.</p><p>·&nbsp;</p><p>·&nbsp;</p><p>Comply with legal obligations. In certain cases, we collect and use your personal information to comply with laws and regulations. For instance, we collect bank account information for identity verification and other purposes.</p><p>·&nbsp;</p><p>·&nbsp;</p><p>Communicate with you. We use your personal information to communicate with you in relation to YCoin&nbsp;Services.</p><p>·&nbsp;</p><p>·&nbsp;</p><p>Fraud prevention and credit risks. We process personal information to prevent and detect fraud and abuse in order to protect the security of our users, YCoin&nbsp;Services and others. We may also use scoring methods to assess and manage credit risks.</p><p>·&nbsp;</p><p>·&nbsp;</p><p>Purposes for which we seek your consent. We may also ask for your consent to process your personal information for a specific purpose that we communicate to you. When you consent to our processing your personal information for a specified purpose, you may withdraw your consent at any time and we will stop processing of your data for that purpose.</p><p>·&nbsp;</p><h3>4. What About Cookies and Other Identifiers?</h3><p>We use cookies and similar tools to enhance your user experience, provide our services, and understand how customers use our services so we can make improvements. To enable our systems to recognise your browser or device and to provide YCoin&nbsp;Services to you, we use cookies.</p><p>We use operational cookies and similar tools (collectively, &quot;cookies&quot;) to provide our services, for example:</p><p>·&nbsp;</p><p>Recognising you when you sign-in to use our services.</p><p>·&nbsp;</p><p>·&nbsp;</p><p>Providing customised features and services.</p><p>·&nbsp;</p><p>·&nbsp;</p><p>Displaying features and services which might be of interest to you, including ads on our services.</p><p>·&nbsp;</p><p>·&nbsp;</p><p>Preventing fraudulent activity.</p><p>·&nbsp;</p><p>·&nbsp;</p><p>Improving security.</p><p>·&nbsp;</p><p>·&nbsp;</p><p>Keeping track of your preferences such as currency and language.</p><p>·&nbsp;</p><p>·&nbsp;</p><p>We also use cookies to understand how users use our services so we can make improvements.</p><p>·&nbsp;</p><p>The settings on your browser will tell you how to prevent your browser from accepting new cookies, how to have the browser notify you when you receive a new cookie, how to disable and remove cookies, and when cookies will expire.</p><p>Operational cookies allow you to take advantage of some of YCoin&#39;s essential features. If you block or otherwise reject operational cookies through your browser settings some features and services may not work.</p><h3>5. Does YCoin&nbsp;Share My Personal Information?</h3><p>Information about our users is an important part of our business and we are not in the business of selling our users&#39; personal information to others. &nbsp; YCoin&nbsp;shares users&#39; personal information only as described below and with the subsidiaries or affiliates of YCoin&nbsp;that are either subject to this Privacy Notice or follow practices at least as protective as those described in this Privacy Notice.</p><p>Third party service providers: We employ other companies and individuals to perform functions on our behalf.&nbsp; Examples include analysing data, providing marketing assistance, processing payments, transmitting content, and assessing and managing credit risk.&nbsp; These third-party service providers have access to personal information needed to perform their functions, but may not use it for other purposes. Further, they must process the personal information in accordance with this Privacy Notice and as only permitted by applicable data protection laws.</p><p>Business transfers: As we continue to develop our business, we might sell or buy other businesses or services. In such transactions, user information generally is one of the transferred business assets but remains subject to the promises made in any pre-existing Privacy Notice (unless, of course, the user consents otherwise). Also, in the unlikely event that YCoin&nbsp;or substantially all of its assets are acquired, user information will be one of the transferred assets.</p><p>Protection of YCoin&nbsp;and others: We release account and other personal information when we believe release is appropriate to comply with the law or with our regulatory obligations; enforce or apply our Terms of Use and other agreements; or protect the rights, property or safety of YCoin, our users or others. This includes exchanging information with other companies and organisations for fraud protection and credit risk reduction.</p><h3>6. International transfers of personal data</h3><p>YCoin&nbsp;may transfer your data outside of the European Economic Area (“EEA”). YCoin&nbsp;puts in place suitable safeguards to ensure that such transfer is carried out in compliance with applicable data protection rules, except where the country to which the data is transferred has already been determined by the European Commission to provide an adequate level of protection.</p><p>Where YCoin&nbsp;transfers personal data to affiliates or service providers, YCoin&nbsp;relies on the standard contractual clauses approved by the European Commission.</p><h3>7. How Secure is My Information?</h3><p>We design our systems with your security and privacy in mind.&nbsp; We work to protect the security of your personal information during transmission by using encryption protocols and software.</p><p>We maintain physical, electronic and procedural safeguards in connection with the collection, storage and disclosure of your personal information. Our security procedures mean that we may ask you to verify your identity before we disclose personal information to you.</p><p>It is important for you to protect against unauthorised access to your account password. We recommend using a unique password for your YCoin&nbsp;account that is not utilized for other online accounts. Be sure to sign off when you finish using a shared computer.</p><h3>8. What About Advertising?</h3><p>We may share your personal information with our marketing partners for the purposes of targeting, modeling, and/or analytics as well as marketing and advertising.</p><h3>9. What Information Can I Access?</h3><p>You can access your information, including your name, address, payment options, profile information, and transaction history in the &quot;Your Account&quot; section of the website.</p><h3>10. What Choices Do I Have?</h3><p>If you have any questions or objection as to how we collect and process your personal information, please contact dpo@YCoin.com.</p><p>When you consent to our processing your personal information for a specified purpose, you may withdraw your consent at any time and we will stop any further processing of your data for that purpose.</p><p>In addition, subject to applicable law, you have the right to request access to, correct, and delete your personal data, and to ask for data portability. You may also object to our processing of your personal data or ask that we restrict the processing of your personal data in certain instances. If you wish to do any of these things, please contact dpo@YCoin.com.</p><h3>11. How Long Does YCoin&nbsp;Keep My Personal Information?</h3><p>We keep your personal information to enable your continued use of YCoin&nbsp;Services, for as long as it is required in order to fulfil the relevant purposes described in this Privacy Notice, as may be required by law such as for tax and accounting purposes, or as otherwise communicated to you.</p><h3>12. EU GDPR and UK Data Protection Laws - Legal Basis</h3><p>The EU GDPR and UK data protection laws require a legal basis for our use of personal information. Our basis varies depending on the specific purpose for which we use personal information. We rely on:</p><p>·&nbsp;</p><p>Performance of a contract when we provide you with products or services, or communicate with you about them. This includes when we use your personal information to take and handle orders, and process payments.</p><p>·&nbsp;</p><p>·&nbsp;</p><p>Our legitimate business interests and the interests of our users when we detect and prevent fraud and abuse in order to protect the security of our users, ourselves, or others.</p><p>·&nbsp;</p><p>·&nbsp;</p><p>Your consent when we ask for your consent to process your personal information for a specific purpose that we communicate to you. When you consent to our processing your personal information for a specified purpose, you may withdraw your consent at any time and we will stop processing of your data for that purpose.</p><p>·&nbsp;</p><p>·&nbsp;</p><p>Compliance with a legal obligation when we use your personal information to comply with laws. For instance, we collect bank account information for identity verification purposes.</p><p>·&nbsp;</p><p>·&nbsp;</p><p>These and other legal bases depending on the purpose for which we use personal information.</p><p>·&nbsp;</p><h3>13. Contact Information</h3><p>Our data protection officer can be contacted at dpo@YCoin.com, and will work to address any questions or issues that you have with respect to the collection and processing of your personal information.</p><h3>14. Conditions of Use, Notices and Revisions</h3><p>If you choose to use YCoin&nbsp;Services, your use and any dispute over privacy is subject to this Notice and our Terms of Use. If you have any concerns about privacy at YCoin, please contact us with a thorough description, and we will try to resolve it. You also have the right to contact your local Data Protection Authority.</p><p>Our business changes constantly, and our Privacy Notice will change also. You should check our websites frequently to see recent changes. If you do not agree with the revised content, you shall stop accessing YCoin&nbsp;immediately. When an updated version of the Privacy Policy is released, your continued access to YCoin&nbsp;means that you agree to the updated content and agree to abide by the updated Privacy Policy. Unless stated otherwise, our current Privacy Notice applies to all information that we have about you and your account.</p><p>&nbsp;</p><p>&nbsp;</p><p><br/></p>',0,1635652800,1649816293,'/images/zwtp.png','/images/zwtp.png',0),(235,19,'en','User Agreement',0,0,1,0,'YCoin',0,'User Agreement','User Agreement','<p>YCoin&nbsp;Terms of Use</p><p>Last revised: 27 September, 2021</p><p>These YCoin&nbsp;Terms of Use is entered into between you (hereinafter referred to as “you” or “your”) and YCoin&nbsp;operators (as defined below). By accessing, downloading, using or clicking on “I agree” to accept any YCoin&nbsp;Services (as defined below) provided by YCoin&nbsp;(as defined below), you agree that you have read, understood and accepted all of the terms and conditions stipulated in these Terms of Use (hereinafter referred to as “these Terms”) as well as our Privacy Policy at.&nbsp;<a href=\"https://eme.plus/\" target=\"_self\">https://eme.plus/</a>.In addition, when using some features of the Services, you may be subject to specific additional terms and conditions applicable to those features.</p><p>Please read the terms carefully as they govern your use of YCoin&nbsp;Services.THESE TERMS CONTAIN IMPORTANT PROVISIONS INCLUDING AN ARBITRATION PROVISION THAT REQUIRES ALL CLAIMS TO BE RESOLVED BY WAY OF LEGALLY BINDING ARBITRATION.The terms of the arbitration provision are set forth in Article 10, “Resolving Disputes: Forum, Arbitration, Class Action Waiver”, hereunder. As with any asset, the values of Digital Currencies (as defined below) may fluctuate significantly and there is a substantial risk of economic losses when purchasing, selling, holding or investing in Digital Currencies and their derivatives.BY MAKING USE OF YCoin&nbsp;SERVICES, YOU ACKNOWLEDGE AND AGREE THAT: (1) YOU ARE AWARE OF THE RISKS ASSOCIATED WITH TRANSACTIONS OF DIGITAL CURRENCIES AND THEIR DERIVATIVES; (2) YOU SHALL ASSUME ALL RISKS RELATED TO THE USE OF YCoin&nbsp;SERVICES AND TRANSACTIONS OF DIGITAL CURRENCIES AND THEIR DERIVATIVES; AND (3) YCoin&nbsp;SHALL NOT BE LIABLE FOR ANY SUCH RISKS OR ADVERSE OUTCOMES.</p><p>By accessing, using or attempting to use YCoin&nbsp;Services in any capacity, you acknowledge that you accept and agree to be bound by these Terms. If you do not agree, do not access YCoin&nbsp;or utilize YCoin&nbsp;services.</p><h3>I. Definitions</h3><p>1. YCoin&nbsp;refers to an ecosystem comprising YCoin&nbsp;websites (whose domain names include but are not limited tohttps://eme.plus/), mobile applications, clients, applets and other applications that are developed to offer YCoin&nbsp;Services, and includes independently-operated platforms, websites and clients within the ecosystem (e.g. YCoin’s Open Platform, YCoin&nbsp;Launchpad, YCoin&nbsp;Labs, YCoin&nbsp;Charity, YCoin&nbsp;DEX, YCoin&nbsp;X, JEX, Trust Wallet, and fiat gateways). In case of any inconsistency between relevant terms of use of the above platforms and the contents of these Terms, the respective applicable terms of such platforms shall prevail.</p><p>2. YCoin&nbsp;Operators&nbsp;：refer to all parties that run YCoin, including but not limited to legal persons (including YCoin&nbsp;UAB), unincorporated organizations and teams that provide YCoin&nbsp;Services and are responsible for such services. For convenience, unless otherwise stated, references to “YCoin” and “we” in these Terms specifically mean YCoin&nbsp;Operators.&nbsp;UNDER THESE TERMS, YCoin&nbsp;OPERATORS MAY CHANGE AS YCoin’S BUSINESS ADJUSTS, IN WHICH CASE, THE CHANGED OPERATORS SHALL PERFORM THEIR OBLIGATIONS UNDER THESE TERMS WITH YOU AND PROVIDE SERVICES TO YOU, AND SUCH CHANGE DOES NOT AFFECT YOUR RIGHTS AND INTERESTS UNDER THESE TERMS. ADDITIONALLY, THE SCOPE OF YCoin&nbsp;OPERATORS MAY BE EXPANDED DUE TO THE PROVISION OF NEW YCoin&nbsp;SERVICES, IN WHICH CASE, IF YOU CONTINUE TO USE YCoin&nbsp;SERVICES, IT IS DEEMED THAT YOU HAVE AGREED TO JOINTLY EXECUTE THESE TERMS WITH THE NEWLY ADDED YCoin&nbsp;OPERATORS. IN CASE OF A DISPUTE, YOU SHALL DETERMINE THE ENTITIES BY WHICH THESE TERMS ARE PERFORMED WITH YOU AND THE COUNTERPARTIES OF THE DISPUTE, DEPENDING ON THE SPECIFIC SERVICES YOU USE AND THE PARTICULAR ACTIONS THAT AFFECT YOUR RIGHTS OR INTERESTS.</p><p>3. YCoin&nbsp;Services&nbsp;refer to various services provided to you by YCoin&nbsp;that are based on Internet and/or blockchain technologies and offered via YCoin&nbsp;websites, mobile applications, clients and other forms (including new ones enabled by future technological development). YCoin&nbsp;Services include but are not limited to such YCoin&nbsp;ecosystem components as Digital Asset Trading Platforms, the financing sector, YCoin&nbsp;Labs, YCoin&nbsp;Academy, YCoin&nbsp;Charity, YCoin&nbsp;Info, YCoin&nbsp;Launchpad, YCoin&nbsp;Research, YCoin&nbsp;Chain, YCoin&nbsp;X, YCoin&nbsp;Fiat Gateway, existing services offered by Trust Wallet and novel services to be provided by YCoin.</p><p>4. YCoin&nbsp;Platform Rules&nbsp;refer to all rules, interpretations, announcements, statements, letters of consent and other contents that have been and will be subsequently released by YCoin, as well as all regulations, implementation rules, product process descriptions, and announcements published in the Help Center or within products or service processes.</p><p>5. Users&nbsp;refer to all individuals, institutions or organizations that access, download or use YCoin&nbsp;or YCoin&nbsp;Services and who meet the criteria and conditions stipulated by YCoin. If there exist other agreements for such entities as developers, distributors, market makers, and Digital Currencies exchanges, such agreements shall be followed.</p><p>6. Digital Currencies&nbsp;refer to encrypted or digital tokens or cryptocurrencies with a certain value that are based on blockchain and cryptography technologies and are issued and managed in a decentralized form.</p><p>7. Digital Assets&nbsp;refer to Digital Currencies, their derivatives or other types of digitalized assets with a certain value.</p><p>8. YCoin&nbsp;Accounts&nbsp;refer to the foundational virtual accounts, including main accounts and subaccounts, which are opened by YCoin&nbsp;for Users to record on YCoin&nbsp;their usage of YCoin&nbsp;Services, transactions, asset changes and basic information. YCoin&nbsp;Accounts serve as the basis for Users to enjoy and exercise their rights on YCoin.</p><p>9. Crypto-to-crypto Trading&nbsp;refers to spot transactions in which one digital currency is exchanged for another digital currency.</p><p>10. Fiat Trading&nbsp;refers to spot transactions in which Digital Currencies are exchanged for fiat currencies or vice versa.</p><p>11. Collateral Accounts&nbsp;refer to special accounts opened by Users on YCoin&nbsp;to deposit and withdraw collateral (such as margins) in accordance with these Terms (including the YCoin&nbsp;Contract Services Agreement and YCoin&nbsp;Platform Rules), as required for contract transactions, leveraged trading and/or currency borrowing services.</p><p>12. Loan/Lending&nbsp;refers to YCoin’s lending of Digital Currencies to Users at an interest collected in certain ways (in the form of Digital Currencies), including but not limited to the leveraged trading and currency lending services currently offered, and other forms of loan/lending services to be launched by YCoin.</p><h3>II. General Provisions</h3><p>1. About These Terms</p><p>a. Contractual Relationship</p><p>These Terms constitute a legal agreement and create a binding contract between you and YCoin&nbsp;Operators.</p><p>b. Supplementary Terms</p><p>Due to the rapid development of Digital Currencies and YCoin, these Terms between you and YCoin&nbsp;Operators do not enumerate or cover all rights and obligations of each party, and do not guarantee full alignment with needs arising from future development. Therefore,THE PRIVACY POLICY (（）), YCoin&nbsp;PLATFORM RULES, AND ALL OTHER AGREEMENTS ENTERED INTO SEPARATELY BETWEEN YOU AND YCoin&nbsp;ARE DEEMED SUPPLEMENTARY TERMS THAT ARE AN INTEGRAL PART OF THESE TERMS AND SHALL HAVE THE SAME LEGAL EFFECT. YOUR USE OF YCoin&nbsp;SERVICES IS DEEMED YOUR ACCEPTANCE OF THE ABOVE SUPPLEMENTARY TERMS.</p><p>c. Changes to These Terms</p><p>YCoin&nbsp;reserves the right to change or modify these Terms in its discretion at any time. YCoin&nbsp;will notify such changes by updating the terms on its website () and modifying the [Last revised] date displayed on this page.。ANY AND ALL MODIFICATIONS OR CHANGES TO THESE TERMS WILL BECOME EFFECTIVE UPON PUBLICATION ON THE WEBSITE OR RELEASE TO USERS. THEREFORE, YOUR CONTINUED USE OF YCoin&nbsp;SERVICES IS DEEMED YOUR ACCEPTANCE OF THE MODIFIED AGREEMENT AND RULES. IF YOU DO NOT AGREE TO ANY CHANGES TO THESE TERMS, YOU MUST STOP USING YCoin&nbsp;SERVICES IMMEDIATELY. YOU ARE RECOMMENDED TO FREQUENTLY REVIEW THESE TERMS TO ENSURE YOUR UNDERSTANDING OF THE TERMS AND CONDITIONS THAT APPLY TO YOUR ACCESS TO AND USE OF YCoin&nbsp;SERVICES.</p><p>d. Prohibition of Use</p><p>BY ACCESSING AND USING YCoin&nbsp;SERVICES, YOU REPRESENT AND WARRANT THAT YOU HAVE NOT BEEN INCLUDED IN ANY TRADE EMBARGOES OR ECONOMIC SANCTIONS LIST (SUCH AS THE UNITED NATIONS SECURITY COUNCIL SANCTIONS LIST), THE LIST OF SPECIALLY DESIGNATED NATIONALS MAINTAINED BY OFAC (THE OFFICE OF FOREIGN ASSETS CONTROL OF THE U.S. DEPARTMENT OF THE TREASURY), OR THE DENIED PERSONS OR ENTITY LIST OF THE U.S. DEPARTMENT OF COMMERCE. YCoin&nbsp;RESERVES THE RIGHT TO CHOOSE MARKETS AND JURISDICTIONS TO CONDUCT BUSINESS, AND MAY RESTRICT OR REFUSE, IN ITS DISCRETION, THE PROVISION OF YCoin&nbsp;SERVICES IN CERTAIN COUNTRIES OR REGIONS.</p><p>2. About YCoin</p><p>As an important part of the YCoin&nbsp;Ecosystem, YCoin&nbsp;mainly serves as a global online platform for Digital Assets trading, and provides Users with a trading platform, financing services, technical services and other Digital Assets-related services. As further detailed in Article 3 below, Users must register and open an account with YCoin, and deposit Digital Assets into their account prior to trading. Users may, subject to the restrictions set forth in these Terms, apply for the withdrawal of Digital Assets.</p><p>Although YCoin&nbsp;has been committed to maintaining the accuracy of the information provided through YCoin&nbsp;Services, YCoin&nbsp;cannot and does not guarantee its accuracy, applicability, reliability, integrity, performance or appropriateness, nor shall YCoin&nbsp;be liable for any loss or damage that may be caused directly or indirectly by your use of these contents. The information about YCoin&nbsp;Services may change without notice, and the main purpose of providing such information is to help Users make independent decisions. YCoin&nbsp;does not provide investment or consulting advice of any kind, and is not responsible for the use or interpretation of information on YCoin&nbsp;or any other communication medium. All Users of YCoin&nbsp;Services must understand the risks involved in Digital Assets trading, and are recommended to exercise prudence and trade responsibly within their own capabilities.</p><p>3. YCoin&nbsp;Account Registration and Requirements</p><p>a. Registration</p><p>All Users must apply for a YCoin&nbsp;Account at (https://accounts.YCoin.com/en/register) before using YCoin&nbsp;Services. When you register a YCoin&nbsp;Account, you must provide your real name, email address and password, and accept these Terms, the Privacy Policy, and other YCoin&nbsp;Platform Rules. YCoin&nbsp;may refuse, in its discretion, to open a YCoin&nbsp;Account for you. You agree to provide complete and accurate information when opening a YCoin&nbsp;Account, and agree to timely update any information you provide to YCoin&nbsp;to maintain the integrity and accuracy of the information. Only one User can be registered at a time, but each individual User (including any User that is a business or legal entity) may maintain only one main account at any given time. Institutional Users (including Users that are businesses and other legal entities) can open one or more subaccounts under the main account with the consent of YCoin. For certain YCoin&nbsp;Services, you may be required to set up a special account independent from your YCoin&nbsp;Account, based on the provisions of these Terms or the Supplementary Terms. The registration, use, protection and management of such trading accounts are equally governed by the provisions of this article and article 6, unless otherwise stated in these Terms or the Supplementary Terms.</p><p>b. Eligibility</p><p>By registering to use a YCoin&nbsp;Account, you represent and warrant that (i) as an individual, you are at least 18 or are of legal age to form a binding contract under applicable laws; (ii) as an individual, legal person, or other organization, you have full legal capacity and sufficient authorizations to enter into these Terms; (iii) you have not been previously suspended or removed from using YCoin&nbsp;Services; (iv) you do not currently have a YCoin&nbsp;Account; (v) you are neither a United States user, a Malaysia user, a Singapore-based user, or an Ontario (Canada)-based user; nor are you acting on behalf of a United States user, a Malaysia user, a Singapore-based user, or an Ontario (Canada)-based user. If you act as an employee or agent of a legal entity, and enter into these Terms on their behalf, you represent and warrant that you have all the necessary rights and authorizations to bind such legal entity; (vi) your use of YCoin&nbsp;Services will not violate any and all laws and regulations applicable to you, including but not limited to regulations on anti-money laundering, anti-corruption, and counter-terrorist financing.</p><p>Please note that some products and services may not be available in certain jurisdictions or regions or to certain users. YCoin&nbsp;reserves the right to change, modify or impose additional restrictions at its discretion at any time.</p><p>Futures and Derivatives Products.&nbsp;USDⓈ-M Futures, Coin-M Futures, Margin, YCoin&nbsp;Options, Vanilla Options and Leveraged Tokens (“Futures and Derivatives Products”) will not be available to all users of the Netherlands, Germany, Italy, Australia and Hong Kong, and retail users of the United Kingdom.</p><p>Crypto Tokens.&nbsp;Privacy tokens (XMR, ZEC, DASH, XVG, XZC, KMD, ZEN, PIVX and GRS) will not be available to users of Australia with PayID associated with the YCoin&nbsp;accounts.</p><p>c. User Identity Verification</p><p>Your registration of an account with YCoin&nbsp;will be deemed your agreement to provide required personal information for identity verification. Such information will be used to verify Users’ identity, identify traces of money laundering, terrorist financing, fraud and other financial crimes through YCoin, or for other lawful purposes stated by YCoin. We will collect, use and share such information in accordance with our Privacy Policy. In addition to providing such information, you agree to allow us to keep a record of that information during the period for which your account is active and within five (5) years after your account is closed, in compliance with global industry standards on data storage. You also authorize us to conduct necessary investigations directly or through a third party to verify your identity or protect you and/or us from financial crimes, such as fraud. The information we require to verify your identity may include, but is not limited to, your name, email address, contact information, phone number, username, government-issued ID, date of birth, and other information collected during account registration. When providing the required information, you confirm it is true and accurate.AFTER REGISTRATION, YOU MUST ENSURE THAT THE INFORMATION IS TRUE, COMPLETE, AND TIMELY UPDATED WHEN CHANGED. IF THERE ARE ANY GROUNDS FOR BELIEVING THAT ANY OF THE INFORMATION YOU PROVIDED IS INCORRECT, FALSE, OUTDATED OR INCOMPLETE, YCoin&nbsp;RESERVES THE RIGHT TO SEND YOU A NOTICE TO DEMAND CORRECTION, DIRECTLY DELETE THE RELEVANT INFORMATION, AND, AS THE CASE MAY BE, TERMINATE ALL OR PART OF YCoin&nbsp;SERVICES WE PROVIDE FOR YOU. IF WE ARE UNABLE TO REACH YOU WITH THE CONTACT INFORMATION YOU PROVIDED, YOU SHALL BE FULLY LIABLE FOR ANY LOSS OR EXPENSE CAUSED TO YCoin&nbsp;DURING YOUR USE OF YCoin&nbsp;SERVICES. YOU HEREBY ACKNOWLEDGE AND AGREE THAT YOU HAVE THE OBLIGATION TO UPDATE ALL THE INFORMATION IF THERE IS ANY CHANGE.BY REGISTERING AN ACCOUNT, YOU HEREBY AUTHORIZE YCoin&nbsp;TO CONDUCT INVESTIGATIONS THAT YCoin&nbsp;CONSIDERS NECESSARY, EITHER DIRECTLY OR THROUGH A THIRD PARTY, TO VERIFY YOUR IDENTITY OR PROTECT YOU, OTHER USERS AND/OR YCoin&nbsp;FROM FRAUD OR OTHER FINANCIAL CRIMES, AND TO TAKE NECESSARY ACTIONS BASED ON THE RESULTS OF SUCH INVESTIGATIONS. YOU ALSO ACKNOWLEDGE AND AGREE THAT YOUR PERSONAL INFORMATION MAY BE DISCLOSED TO CREDIT BUREAUS AND AGENCIES FOR FRAUD PREVENTION OR FINANCIAL CRIME PREVENTION, WHICH MAY RESPOND TO OUR INVESTIGATIONS IN FULL.</p><p>d. Account Usage Requirements</p><p>The YCoin&nbsp;Account can only be used by the account registrant. YCoin&nbsp;reserves the right to suspend, freeze or cancel the use of YCoin&nbsp;Accounts by persons other than account registrant. If you suspect or become aware of any unauthorized use of your username and password, you should notify YCoin&nbsp;immediately. YCoin&nbsp;assumes no liability for any loss or damage arising from the use of YCoin&nbsp;Account by you or any third party with or without your authorization.</p><p>e. Account Security</p><p>YCoin&nbsp;has been committed to maintaining the security of User entrusted funds, and has implemented industry standard protection for YCoin&nbsp;Services. However, the actions of individual Users may pose risks. You shall agree to treat your access credentials (such as username and password) as confidential information, and not to disclose such information to any third party. You also agree to be solely responsible for taking the necessary security measures to protect your YCoin&nbsp;Account and personal information.</p><p>You should be solely responsible for keeping safe of your YCoin&nbsp;Account and password, and be responsible for all the transactions under your YCoin&nbsp;Account. YCoin&nbsp;assumes no liability for any loss or consequences caused by authorized or unauthorized use of your account credentials, including but not limited to information disclosure, information release, consent or submission of various rules and agreements by clicking on the website, online agreement renewal, etc.</p><p>By creating a YCoin&nbsp;Account, you hereby agree that:</p><p>1.&nbsp;</p><p>you will notify YCoin&nbsp;immediately if you are aware of any unauthorized use of your YCoin&nbsp;Account and password or any other violation of security rules;</p><p>2.&nbsp;</p><p>3.&nbsp;</p><p>you will strictly abide by all mechanisms or procedures of YCoin&nbsp;regarding security, authentication, trading, charging, and withdrawal; and</p><p>4.&nbsp;</p><p>5.&nbsp;</p><p>you will take appropriate steps to logout from YCoin&nbsp;at the end of each visit.</p><p>6.&nbsp;</p><p>f. Personal Data</p><p>Your personal data will be properly protected and kept confidential, but YCoin&nbsp;has the right to collect, process, use or disclose your personal data in accordance with the Terms (including the Privacy Policy) or applicable laws. Depending on the products or services concerned, your personal data may be disclosed to the following third parties:</p><p>1.&nbsp;</p><p>your transaction counterparty;</p><p>2.&nbsp;</p><p>3.&nbsp;</p><p>YCoin&nbsp;Operators, and the shareholders, partners, investors, directors, supervisors, senior managers and employees of such entities;</p><p>4.&nbsp;</p><p>5.&nbsp;</p><p>our joint ventures, alliance partners and business partners;</p><p>6.&nbsp;</p><p>7.&nbsp;</p><p>our agents, contractors, suppliers, third-party service providers and professional advisers, including the parties who have been contracted to provide us with administrative, financial, research, operations, IT and other services, in such areas as telecommunications, information technology, payroll, information processing, training, market research, storage and archival;</p><p>8.&nbsp;</p><p>9.&nbsp;</p><p>third-party business partners who provide goods and services or sponsor contests or other promotional activities, whether or not in cooperation with us;</p><p>10.&nbsp;</p><p>11.&nbsp;</p><p>insurance companies or insurance investigators and credit providers;</p><p>12.&nbsp;</p><p>13.&nbsp;</p><p>credit bureaus, or any debt collection agencies or dispute resolution centers in the event of violation or dispute;</p><p>14.&nbsp;</p><p>15.&nbsp;</p><p>business partners, investors, trustees or assignees (actual or expected) that promote business asset transactions (which can be broadened to include any merger, acquisition or asset sale) of YCoin&nbsp;Operators;</p><p>16.&nbsp;</p><p>17.&nbsp;</p><p>professional consultants such as auditors and lawyers;</p><p>18.&nbsp;</p><p>19.&nbsp;</p><p>relevant government regulatory agencies or law enforcement agencies to comply with laws or regulations formulated by government authorities;</p><p>20.&nbsp;</p><p>21.&nbsp;</p><p>assignees of our rights and obligations;</p><p>22.&nbsp;</p><p>23.&nbsp;</p><p>banks, credit card companies and their respective service providers;</p><p>24.&nbsp;</p><p>25.&nbsp;</p><p>persons with your consent as determined by you or the applicable contract.</p><p>26.&nbsp;</p><h3>III. YCoin&nbsp;Services</h3><p>Upon completion of the registration and identity verification for your YCoin&nbsp;Account, you may use various YCoin&nbsp;Services, including but not limited to, Crypto-to-crypto Trading, Fiat Trading, contract trading, leveraged trading, YCoin&nbsp;Savings services, staking, acquiring market-related data, research and other information released by YCoin, participating in User activities held by YCoin, etc., in accordance with the provisions of these Terms (including YCoin&nbsp;Platform Rules and other individual agreements). YCoin&nbsp;has the right to:</p><p>·&nbsp;</p><p>Provide, modify or terminate, in its discretion, any YCoin&nbsp;Services based on its development plan; and</p><p>·&nbsp;</p><p>·&nbsp;</p><p>Allow or prohibit some Users’ use of any YCoin&nbsp;Services in accordance with relevant YCoin&nbsp;Platform Rules.</p><p>·&nbsp;</p><h3>1. Service Usage Guidelines</h3><p>a. License</p><p>Provided that you constantly comply with the express terms and conditions stated in these Terms, YCoin&nbsp;grants you a revocable, limited, royalty-free, non-exclusive, non-transferable, and non-sublicensable license to access and use YCoin&nbsp;Services through your computer or Internet compatible devices for your personal/internal purposes. You are prohibited to use YCoin&nbsp;Services for resale or commercial purposes, including transactions on behalf of other persons or entities. All the above actions are expressly prohibited and constitute a material violation of these Terms. The content layout, format, function and access rights regarding YCoin&nbsp;Services should be stipulated in the discretion of YCoin. YCoin&nbsp;reserves all rights not expressly granted in these Terms. Therefore, you are hereby prohibited from using YCoin&nbsp;Services in any way not expressly authorized by these Terms.</p><p>These Terms only grant a limited license to access and use YCoin&nbsp;Services. Therefore, you hereby agree that when you use YCoin&nbsp;Services, YCoin&nbsp;does not transfer YCoin&nbsp;Services or the ownership or intellectual property rights of any YCoin&nbsp;intellectual property to you or anyone else. All the text, graphics, user interfaces, visual interface, photos, sounds, process flow diagrams, computer code (including html code), programs, software, products, information and documents, as well as the design, structure, selection, coordination, expression, look and feel, and layout of any content included in the services or provided through YCoin&nbsp;Services, are exclusively owned, controlled and/or licensed by YCoin&nbsp;Operators or its members, parent companies, licensors or affiliates.</p><p>YCoin&nbsp;owns any feedback, suggestions, ideas, or other information or materials (hereinafter collectively referred to as “Feedback”) about YCoin&nbsp;or YCoin&nbsp;Services that you provide through email, YCoin&nbsp;Services, or other ways. You hereby transfer all rights, ownership and interests of the Feedback and all related intellectual property rights to YCoin. You have no right and hereby waive any request for acknowledgment or compensation based on any Feedback, or any modifications based on any Feedback.</p><p>b. Restriction</p><p>When you use YCoin&nbsp;Services, you agree and undertake to comply with the following provisions:</p><p>1.&nbsp;</p><p>During the use of YCoin&nbsp;Services, all activities you carry out should comply with the requirements of applicable laws and regulations, these Terms, and various guidelines of YCoin;</p><p>2.&nbsp;</p><p>3.&nbsp;</p><p>Your use of YCoin&nbsp;Services should not violate public interests, public morals, or the legitimate interests of others, including any actions that would interfere with, disrupt, negatively affect, or prohibit other Users from using YCoin&nbsp;Services;</p><p>4.&nbsp;</p><p>5.&nbsp;</p><p>You agree not to use the services for market manipulation (such as pump and dump schemes, wash trading, self-trading, front running, quote stuffing, and spoofing or layering, regardless of whether prohibited by law);</p><p>6.&nbsp;</p><p>7.&nbsp;</p><p>Without written consent from YCoin, the following commercial uses of YCoin&nbsp;data are prohibited:</p><p>8.&nbsp;</p><p>1) Trading services that make use of YCoin&nbsp;quotes or market bulletin board information.</p><p>9.&nbsp;</p><p>2) Data feeding or streaming services that make use of any market data of YCoin.</p><p>10.&nbsp;</p><p>3) Any other websites/apps/services that charge for or otherwise profit from (including through advertising or referral fees) market data obtained from YCoin.</p><p>11.&nbsp;</p><p>12.&nbsp;</p><p>Without prior written consent from YCoin, you may not modify, replicate, duplicate, copy, download, store, further transmit, disseminate, transfer, disassemble, broadcast, publish, remove or alter any copyright statement or label, or license, sub-license, sell, mirror, design, rent, lease, private label, grant security interests in the properties or any part of the properties, or create their derivative works or otherwise take advantage of any part of the properties.</p><p>13.&nbsp;</p><p>14.&nbsp;</p><p>You may not (i) use any deep linking, web crawlers, bots, spiders or other automatic devices, programs, scripts, algorithms or methods, or any similar or equivalent manual processes to access, obtain, copy or monitor any part of the properties, or replicate or bypass the navigational structure or presentation of YCoin&nbsp;Services in any way, in order to obtain or attempt to obtain any materials, documents or information in any manner not purposely provided through YCoin&nbsp;Services; (ii) attempt to access any part or function of the properties without authorization, or connect to YCoin&nbsp;Services or any YCoin&nbsp;servers or any other systems or networks of any YCoin&nbsp;Services provided through the services by hacking, password mining or any other unlawful or prohibited means; (iii) probe, scan or test the vulnerabilities of YCoin&nbsp;Services or any network connected to the properties, or violate any security or authentication measures on YCoin&nbsp;Services or any network connected to YCoin&nbsp;Services; (iv) reverse look-up, track or seek to track any information of any other Users or visitors of YCoin&nbsp;Services; (v) take any actions that imposes an unreasonable or disproportionately large load on the infrastructure of systems or networks of YCoin&nbsp;Services or YCoin, or the infrastructure of any systems or networks connected to YCoin&nbsp;services; (vi) use any devices, software or routine programs to interfere with the normal operation of YCoin&nbsp;Services or any transactions on YCoin&nbsp;Services, or any other person’s use of YCoin&nbsp;Services; (vii) forge headers, impersonate, or otherwise manipulate identification, to disguise your identity or the origin of any messages or transmissions you send to YCoin, or (viii) use YCoin&nbsp;Services in an illegal way.</p><p>15.&nbsp;</p><p>By accessing YCoin&nbsp;Services, you agree that YCoin&nbsp;has the right to investigate any violation of these Terms, unilaterally determine whether you have violated these Terms, and take actions under relevant regulations without your consent or prior notice. Examples of such actions include, but are not limited to:</p><p>·&nbsp;</p><p>Blocking and closing order requests;</p><p>·&nbsp;</p><p>·&nbsp;</p><p>Freezing your account;</p><p>·&nbsp;</p><p>·&nbsp;</p><p>Reporting the incident to the authorities;</p><p>·&nbsp;</p><p>·&nbsp;</p><p>Publishing the alleged violations and actions that have been taken;</p><p>·&nbsp;</p><p>·&nbsp;</p><p>Deleting any information you published that are found to be violations.</p><p>·&nbsp;</p><h3>2. Crypto-to-crypto Trading</h3><p>Upon completion of the registration and identity verification for your YCoin&nbsp;Account, you may conduct Crypto-to-crypto Trading on YCoin&nbsp;in accordance with the provisions of these Terms and YCoin&nbsp;Platform Rules.</p><p>a. Orders</p><p>Upon sending an instruction of using YCoin&nbsp;Services for Crypto-to-crypto Trading (an “Order”), your account will be immediately updated to reflect the open Orders, and your Orders will be included in YCoin’s order book to match other users’ Orders. If one of your Orders fully or partially matches another user’s Order, YCoin&nbsp;will execute an exchange (a “Transaction”). Once the Transaction is executed, your account will be updated to reflect that the Order has been fully executed and closed, or the Order has been partially executed. The Order will remain uncompleted until it is fully executed or cancelled under paragraph (b) below. To conclude a Transaction, you authorize YCoin&nbsp;to temporarily control the Digital Currencies involved in your Transaction.</p><p>b. Cancellation</p><p>For Orders initiated through YCoin&nbsp;Services, you may only cancel them before they have been matched with other Users’ Orders. Once your Order has been matched with another user’s Order, you may not change, revoke or cancel YCoin’s authorization to complete the Order. For any partially matched Order, you may cancel the unmatched part of the Order unless such portion has been matched. YCoin&nbsp;reserves the right to reject any cancellation request related to the Order you have submitted. If your account does not have sufficient amount of Digital Currencies to execute an Order, YCoin&nbsp;may cancel the entire Order, or execute part of the Order with the amount of Digital Currencies you have in your account (in each case, any Transaction related fees payable to YCoin&nbsp;are deducted as stated in paragraph (c) below).</p><p>c. Fees</p><p>You agree to pay YCoin&nbsp;the fees specified in&nbsp;<a href=\"https://eme.plus/\" target=\"_self\">https://eme.plus/</a>.YCoin&nbsp;may, in its discretion, update the fees at any time. Any updated fees will apply to any sales or other Transactions that occur following the effective date of the updated fees. You authorize YCoin&nbsp;to deduct from your account any applicable fees that you owe under these Terms.</p><p>d. Other Types of Crypto-to-crypto Trading</p><p>In addition to the Crypto-to-crypto Trading that allows users to directly place orders as mentioned in paragraph (a) above, YCoin&nbsp;may, in its discretion, provide technical and platform services for other types of Crypto-to-crypto Trading under its separately formulated YCoin&nbsp;Platform Rules, such as One Cancels the Other (OCO) and block trade.</p><h3>3. Fiat Trading</h3><p>Prior to conducting Fiat Trading, in accordance with type of fiat trading, you shall separately read and agree User Agreements with various YCoin&nbsp;partnered OTC platforms, and comply with the Legal Statement, Privacy Policy, P2P User Transaction Policy (<a href=\"https://eme.plus/\" target=\"_self\">zh-TC/support/faq/360041066751</a>) and other specific YCoin&nbsp;Platform Rules related to Fiat Trading as well as the business rules of such partners, and open an account on such YCoin&nbsp;OTC platforms, following the completion of the registration and identity verification for your YCoin&nbsp;Account, if applicable.&nbsp;a. Fiat Payments.&nbsp;If you choose to utilise the Fiat Trading, you agree that YCoin&nbsp;UAB (registration number: 305595206) having its registered office at Didžioji g. 18, Vilnius, Lithuania shall be the main YCoin&nbsp;Operator responsible for the transaction (including for the purpose of refunds and cancellations). YCoin&nbsp;UAB is the YCoin&nbsp;Operator responsible for the transactions processed by MasterCard. The activities of YCoin&nbsp;UAB defined herein are governed by the laws of the Republic of Lithuania.</p><h3>4. Futures Trading</h3><p>Unless otherwise specified by YCoin, to conduct Futures Trading, you must conclude with YCoin&nbsp;a separate YCoin&nbsp;Futures Service Agreement (<a href=\"https://eme.plus/\" target=\"_self\">https://eme.plus/</a>) and open a special Collateral Account, following the completion of registration and identity verification for your YCoin&nbsp;Account. You acknowledge and agree that:</p><p>a. You fully understand the high risks of Futures Trading, including but not limited to the risk of major fluctuations of Digital Assets in Futures Trading, and the risk of exacerbated adverse outcome when leverage is used;</p><p>b. You have sufficient investment knowledge and experience and the capacity to take risks arising from Futures Trading, and agree to independently assume all the risks arising from the investment of Futures Trading;</p><p>c. Before performing Futures Trading, you have read and understood all the contents of the YCoin&nbsp;Futures Service Agreement and the relevant YCoin&nbsp;Platform Rules, and have consulted relevant professionals to make informed decisions on whether and how to complete Futures Trading according to their recommendations and your own reasonable judgment;</p><p>d. You agree and authorize YCoin&nbsp;to take various reasonable measures in its discretion (including but not limited to forced liquidation and forced position reduction under specific circumstances) in accordance with the YCoin&nbsp;Futures Service Agreement and the relevant YCoin&nbsp;Platform Rules to protect the legitimate interests of you, YCoin&nbsp;and other Users.</p><h3>5. Options Trading</h3><p>You acknowledge and agree that:</p><p>a. You fully understand the high risks of Options Trading, including but not limited to the risk of major fluctuations of Digital Assets in Options Trading, and the risk of exacerbated adverse outcome when leverage is used;</p><p>b. You have sufficient investment knowledge and experience and the capacity to take risks arising from Options Trading, and agree to independently assume all the risks arising from the investment of Options Trading;</p><p>c. Before performing Options Trading, you have read and understood all the relevant YCoin&nbsp;Platform Rules, and have consulted relevant professionals to make informed decisions on whether and how to complete Options Trading according to their recommendations and your own reasonable judgment;</p><p>d. You agree and authorize YCoin&nbsp;to take various reasonable measures in its discretion (including but not limited to forced liquidation and forced position reduction under specific circumstances) in accordance with the relevant YCoin&nbsp;Platform Rules to protect the legitimate interests of you, YCoin&nbsp;and other Users.</p><h3>6. Margins Trading</h3><p>Unless otherwise specified by YCoin, prior to conducting Margins Trading, you must open a special Collateral Account and/or complete other related procedures, following the completion of registration and identity verification for your YCoin&nbsp;Account.</p><p>a. Risks of Margins Trading</p><p>Margins Trading is highly risky. As a leveraged trader, you acknowledge and agree that you access and use Margins Trading and borrowing services at your own risk, which include but are not limited to:</p><p>1.&nbsp;</p><p>The liquidity, market depth and dynamics of the trading market fluctuate violently and change rapidly. The use of leverage may work to your advantage or disadvantage, which may result in major gains or losses as the case may be.</p><p>2.&nbsp;</p><p>3.&nbsp;</p><p>You are not eligible to receive forked currencies split from any blockchain assets in your Collateral Account, even if you have not engaged in any Margins Trading or borrowing at all.</p><p>4.&nbsp;</p><p>5.&nbsp;</p><p>Loans carry risk, and the value of your blockchain assets may decline. If the value of your assets drops to a certain level, you are responsible for dealing with these market circumstances.</p><p>6.&nbsp;</p><p>7.&nbsp;</p><p>In some market situations, you may find it difficult or impossible to liquidate a position. This may occur, for example, as a result of insufficient market liquidity or technical issues on YCoin.</p><p>8.&nbsp;</p><p>9.&nbsp;</p><p>Placing contingent Orders does not necessarily limit your losses to the expected amount, as market conditions may prevent you from executing such orders.</p><p>10.&nbsp;</p><p>11.&nbsp;</p><p>Margins Trading does not have guaranteed measures against losses. As a borrower, you may suffer losses that exceed the amount you deposited into your Collateral Account.</p><p>12.&nbsp;</p><p>b. To start Margins Trading:</p><p>1.&nbsp;</p><p>You represent and warrant that you are neither from the U.S. nor on any list of trade embargoes or economic sanctions, such as the Specially Designated National by OFAC (The Office of Foreign Assets Control of the U.S. Department of the Treasury).</p><p>2.&nbsp;</p><p>3.&nbsp;</p><p>You should fully understand the risks associated with Margins Trading and Lending, and be fully responsible for any trading and non-trading activities under your YCoin&nbsp;Account and Collateral Account. You should not engage in Transactions or invest in funds that are beyond your financial capacities;</p><p>4.&nbsp;</p><p>5.&nbsp;</p><p>You are fully responsible for knowing the true status of any position, even if YCoin&nbsp;may present it incorrectly at any time;</p><p>6.&nbsp;</p><p>7.&nbsp;</p><p>You agree to keep enough Digital Assets in your Collateral Account, as required by YCoin&nbsp;for Users’ engagement in Margins Trading, and promptly repay your loan in full. Failure to keep enough assets or to timely repay the outstanding loan may result in forced liquidation of the assets in your Collateral Account;</p><p>8.&nbsp;</p><p>9.&nbsp;</p><p>Even if with the ability to forcefully liquidate any position, YCoin&nbsp;cannot guarantee to stop losses. If your assets are insufficient to repay the outstanding loan after the liquidation of your position, you are still liable for any further shortfall of assets;</p><p>10.&nbsp;</p><p>11.&nbsp;</p><p>YCoin&nbsp;may take measures, in its discretion and on your behalf, to reduce your potential losses, including but not limited to, transferring assets from your Collateral Account into your YCoin&nbsp;Account and/or vice versa;</p><p>12.&nbsp;</p><p>13.&nbsp;</p><p>During YCoin&nbsp;system maintenance, you agree to be fully responsible for managing your Collateral Account under risks, including but not limited to, closing positions and repaying your loan.</p><p>14.&nbsp;</p><p>15.&nbsp;</p><p>You agree to conduct all Transactions, Margins Trading and/or borrowing on your own, and be fully responsible for your activities. YCoin&nbsp;assumes no liability for any loss or damage caused by your use of any YCoin&nbsp;services or your unawareness of the risks associated with the use of Digital Assets or with your use of YCoin&nbsp;Services.</p><p>16.&nbsp;</p><h3>7. Lending Services</h3><p>Unless otherwise provided by YCoin, to borrow currencies, you must conclude with YCoin&nbsp;a separate Lending Services User Agreement and open a special Collateral Account and/or finish other relevant procedures, following the completion of registration and identity verification for your YCoin&nbsp;Account. You understand and agree that:</p><p>a. There are considerable risks involved in Lending Services, which include without limitation to risks of fluctuation of the borrowed Digital Assets’ value, derivative risks and technical risks. You shall carefully consider and exercise clear judgment to evaluate your financial situation and the aforesaid risks to make any decision on using Lending Services, and you shall be responsible for all losses arising therefrom;</p><p>b. you shall cooperate to provide the information and materials related to identity verification and Lending Services as required by YCoin, and be solely responsible for taking necessary security measures to protect the security of your Collateral Account and personal information;</p><p>c. you shall carefully read relevant YCoin&nbsp;Platform Rules before using Lending Services, and be aware of, understand and observe the specific information and rules regarding the operations of Lending Services, and you undertake that the use of the assets borrowed shall conform to requirements of these Terms and related laws and regulations;</p><p>d. YCoin&nbsp;has the full right to manage your Collateral Account and collateral during the period in which Lending Services are offered, and reserves the right, under the circumstances specified in the Lending Services User Agreement or these Terms, to implement various risk control measures, which include but are not limited to forced liquidation. Such steps may cause major losses to you and you shall be solely responsible for the outcomes of such measures;</p><p>e. YCoin&nbsp;has the right to temporarily or permanently prohibit you from using Lending Services when it deems it necessary or reasonable, and to the maximum extent permitted by law, without liability of any kind to you.</p><h3>8. YCoin&nbsp;Savings Service</h3><p>YCoin&nbsp;offers YCoin&nbsp;Savings, a service to provide Users with value-added services for their idle Digital Assets. To use YCoin&nbsp;Savings service, you must conclude with YCoin&nbsp;a separate YCoin&nbsp;Savings Service User Agreement (&nbsp;<a href=\"https://eme.plus/\" target=\"_self\" title=\"https://eme.plus/\">https://eme.plus/ </a>and open a special YCoin&nbsp;Savings service account, following the completion of registration and identity verification for your YCoin&nbsp;Account. When using YCoin&nbsp;Savings service, you should note that:</p><p>a. YCoin&nbsp;Savings assets will be used in cryptocurrency leveraged borrowing and other businesses.</p><p>b. When you use YCoin&nbsp;Savings service, you will unconditionally authorize YCoin&nbsp;to distribute and grant the leveraged interest according to YCoin&nbsp;Platform Rules.</p><p>c. You shall abide by relevant laws and regulations to ensure that the sources of Digital Assets are legitimate and compliant when using YCoin&nbsp;Savings service.</p><p>d. When you use YCoin&nbsp;Savings service, you should fully recognize the risks of investing in Digital Assets and operate cautiously.</p><p>e. You agree that all investment operations conducted on YCoin&nbsp;represent your true investment intentions and that unconditionally accept the potential risks and benefits of your investment decisions.</p><p>f. YCoin&nbsp;reserves the right to suspend or terminate YCoin&nbsp;Savings service. If necessary, YCoin&nbsp;can suspend and terminate YCoin&nbsp;Savings service at any time.</p><p>g. Due to network delay, computer system failures and other force majeure, which may lead to delay, suspension, termination or deviation of execution of YCoin&nbsp;Savings service, YCoin&nbsp;will use reasonable effort to ensure but not promise that YCoin&nbsp;Savings service execution system runs stably and effectively. YCoin&nbsp;does not take any responsibility if the final execution fails to match your expectations due to the above factors.</p><h3>9. Staking Programs</h3><p>YCoin&nbsp;will from time to time launch Staking Programs for specific types of Digital Currencies to reward, as per certain rules, users who hold such Digital Currencies in their YCoin&nbsp;Accounts. When participating in Staking Programs, you should note that:</p><p>a. Unless otherwise stipulated by YCoin, Staking Programs are free of charge and Users may trade during the staking period;</p><p>b. YCoin&nbsp;does not guarantee Users’ proceeds under any Staking Program;</p><p>c. YCoin&nbsp;has the right to initiate or terminate Staking Program for any Digital Currencies or modify rules on such programs in its sole discretion;</p><p>d. Users shall ensure that sources of the Digital Currencies they hold in YCoin&nbsp;Accounts are legal and compliant and undertake to observe related laws and regulations. Otherwise, YCoin&nbsp;has the right to take necessary steps in accordance with these Terms or YCoin&nbsp;Platform Rules, including, without limitation, freezing YCoin&nbsp;Accounts or deducting the Digital Currencies awarded to Users who violate the rules of respective Staking Programs.</p><h3>10. YCoin&nbsp;POS Service Agreement</h3><p>a. YCoin.com launched YCoin&nbsp;POS service for YCoin.com users to gain proceeds through idle cryptocurrency assets.</p><p>b. YCoin&nbsp;POS assets will be used in cryptocurrency staking to gain proceeds and other businesses.</p><p>c. When you use YCoin&nbsp;POS service, you will unconditionally authorize YCoin.com to distribute the staking interest according to the rules of the platform.</p><p>d. You shall abide by the relevant laws of the State to ensure that the sources of assets are legitimate and compliant when using YCoin&nbsp;POS service.</p><p>e. When you use YCoin&nbsp;POS service, you should fully recognize the risks of investment in cryptocurrency and operate cautiously.</p><p>f. You agree that all investment operations conducted on YCoin.com represent your true investment intentions and that unconditionally accept the potential risks and benefits of your investment decisions.</p><p>g. YCoin.com reserves the right to suspend or terminate YCoin&nbsp;POS service. If necessary, YCoin.com can suspend and terminate YCoin&nbsp;POS service at any time.</p><p>h. Due to network delay, computer system failures and other force majeure, which may lead to delay, suspension or deviation of YCoin&nbsp;POS service execution, YCoin.com will use commercially reasonable effort to ensure but not promise that YCoin&nbsp;POS service execution system run stably and effectively. YCoin.com does not take any responsibility if the final execution doesn’t match your expectations due to the above factors.</p><h3>IV. Liabilities</h3><h3>1. Disclaimer of Warranties</h3><p>TO THE MAXIMUM EXTENT PERMITTED UNDER APPLICABLE LAW, YCoin&nbsp;SERVICES, YCoin&nbsp;MATERIALS AND ANY PRODUCT, SERVICE OR OTHER ITEM PROVIDED BY OR ON BEHALF OF YCoin&nbsp;ARE OFFERED ON AN “AS IS” AND “AS AVAILABLE” BASIS, AND YCoin&nbsp;EXPRESSLY DISCLAIMS, AND YOU WAIVE, ANY AND ALL OTHER WARRANTIES OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING, WITHOUT LIMITATION, WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE OR NON-INFRINGEMENT OR WARRANTIES ARISING FROM COURSE OF PERFORMANCE, COURSE OF DEALING OR USAGE IN TRADE. WITHOUT LIMITING THE FOREGOING, YCoin&nbsp;DOES NOT REPRESENT OR WARRANT THAT THE SITE, YCoin&nbsp;SERVICES OR YCoin&nbsp;MATERIALS ARE ACCURATE, COMPLETE, RELIABLE, CURRENT, ERROR-FREE, OR FREE OF VIRUSES OR OTHER HARMFUL COMPONENTS. YCoin&nbsp;DOES NOT GUARANTEE THAT ANY ORDER WILL BE EXECUTED, ACCEPTED, RECORDED OR REMAIN OPEN. EXCEPT FOR THE EXPRESS STATEMENTS, AGREEMENTS AND RULES SET FORTH IN THESE TERMS, YOU HEREBY ACKNOWLEDGE AND AGREE THAT YOU HAVE NOT RELIED UPON ANY OTHER STATEMENT OR AGREEMENT, WHETHER WRITTEN OR ORAL, WITH RESPECT TO YOUR USE AND ACCESS OF YCoin&nbsp;SERVICES. WITHOUT LIMITING THE FOREGOING, YOU HEREBY UNDERSTAND AND AGREE THAT YCoin&nbsp;WILL NOT BE LIABLE FOR ANY LOSSES OR DAMAGES ARISING OUT OF OR RELATING TO: (A) ANY INACCURACY, DEFECT OR OMISSION OF DIGITAL ASSETS PRICE DATA, (B) ANY ERROR OR DELAY IN THE TRANSMISSION OF SUCH DATA, (C) INTERRUPTION IN ANY SUCH DATA, (D) REGULAR OR UNSCHEDULED MAINTENANCE CARRIED OUT BY YCoin&nbsp;AND SERVICE INTERRUPTION AND CHANGE RESULTING FROM SUCH MAINTENANCE, (E) ANY DAMAGES INCURRED BY OTHER USERS’ ACTIONS, OMISSIONS OR VIOLATION OF THESE TERMS, (F) ANY DAMAGE CAUSED BY ILLEGAL ACTIONS OF OTHER THIRD PARTIES OR ACTIONS WITHOUT AUTHORIZED BY YCoin; AND (G) OTHER EXEMPTIONS MENTIONED IN DISCLAIMERS AND PLATFORM RULES ISSUED BY YCoin.</p><p>THE DISCLAIMER OF IMPLIED WARRANTIES CONTAINED HEREIN MAY NOT APPLY IF AND TO THE EXTENT IT IS PROHIBITED BY APPLICABLE LAW OF THE JURISDICTION IN WHICH YOU RESIDE.</p><h3>2. Disclaimer of Damages and Limitation of Liability</h3><p>TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, IN NO EVENT WILL YCoin, ITS AFFILIATES AND THEIR RESPECTIVE SHAREHOLDERS, MEMBERS, DIRECTORS, OFFICERS, EMPLOYEES, ATTORNEYS, AGENTS, REPRESENTATIVES, SUPPLIERS OR CONTRACTORS BE LIABLE FOR ANY INCIDENTAL, INDIRECT, SPECIAL, PUNITIVE, CONSEQUENTIAL OR SIMILAR DAMAGES OR LIABILITIES WHATSOEVER (INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF DATA, INFORMATION, REVENUE, PROFITS OR OTHER BUSINESSES OR FINANCIAL BENEFITS) ARISING OUT OF YCoin&nbsp;SERVICES, ANY PERFORMANCE OR NON-PERFORMANCE OF YCoin&nbsp;SERVICES, OR ANY OTHER PRODUCT, SERVICE OR OTHER ITEM PROVIDED BY OR ON BEHALF OF YCoin&nbsp;AND ITS AFFILIATES, WHETHER UNDER CONTRACT, STATUTE, STRICT LIABILITY OR OTHER THEORY EVEN IF YCoin&nbsp;HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES EXCEPT TO THE EXTENT OF A FINAL JUDICIAL DETERMINATION THAT SUCH DAMAGES WERE A RESULT OF YCoin’S GROSS NEGLIGENCE, FRAUD, WILLFUL MISCONDUCT OR INTENTIONAL VIOLATION OF LAW. SOME JURISDICTIONS DO NOT ALLOW THE EXCLUSION OR LIMITATION OF INCIDENTAL OR CONSEQUENTIAL DAMAGES, SO THE ABOVE LIMITATION MAY NOT APPLY TO YOU.</p><p>NOTWITHSTANDING THE FOREGOING, IN NO EVENT WILL THE LIABILITY OF YCoin, ITS AFFILIATES AND THEIR RESPECTIVE SHAREHOLDERS, MEMBERS, DIRECTORS, OFFICERS, EMPLOYEES, ATTORNEYS, AGENTS, REPRESENTATIVES, SUPPLIERS OR CONTRACTORS ARISING OUT OF SERVICES OFFERED BY OR ON BEHALF OF YCoin&nbsp;AND ITS AFFILIATES, ANY PERFORMANCE OR NON-PERFORMANCE OF YCoin&nbsp;SERVICES, OR ANY OTHER PRODUCT, SERVICE OR OTHER ITEM, WHETHER UNDER CONTRACT, STATUTE, STRICT LIABILITY OR OTHER THEORY, EXCEED THE AMOUNT OF THE FEES PAID BY YOU TO YCoin&nbsp;UNDER THESE TERMS IN THE TWELVE-MONTH PERIOD IMMEDIATELY PRECEDING THE EVENT GIVING RISE TO THE CLAIM FOR LIABILITY.</p><h3>3. Indemnification</h3><p>You agree to indemnify and hold harmless YCoin&nbsp;Operators, their affiliates, contractors, licensors, and their respective directors, officers, employees and agents from and against any claims, actions, proceedings, investigations, demands, suits, costs, expenses and damages (including attorneys’ fees, fines or penalties imposed by any regulatory authority) arising out of or related to (i) your use of, or conduct in connection with, YCoin&nbsp;Services, (ii) your breach or our enforcement of these Terms, or (iii) your violation of any applicable law, regulation, or rights of any third party during your use of YCoin&nbsp;Services. If you are obligated to indemnify YCoin&nbsp;Operators, their affiliates, contractors, licensors, and their respective directors, officers, employees or agents pursuant to these Terms, YCoin&nbsp;will have the right, in its sole discretion, to control any action or proceeding and to determine whether YCoin&nbsp;wishes to settle, and if so, on what terms.</p><h3>V. Announcements</h3><p>Please be aware that all official announcements, news, promotions, competitions and airdrops will be listed onhttps://direct.lc.chat/13353816/&nbsp;.&nbsp;USERS UNDERTAKE TO REFER TO THESE MATERIALS REGULARLY AND PROMPTLY. YCoin&nbsp;WILL NOT BE HELD LIABLE OR RESPONSIBLE IN ANY MANNER OF COMPENSATION SHOULD USERS INCUR PERSONAL LOSSES ARISING FROM IGNORANCE OR NEGLIGENCE OF THE ANNOUNCEMENTS.</p><h3>VI. Termination of Agreement</h3><h3>1. Suspension of YCoin&nbsp;Accounts</h3><p>You agree that YCoin&nbsp;shall have the right to immediately suspend your YCoin&nbsp;Account (and any accounts beneficially owned by related entities or affiliates), freeze or lock the Digital Assets or funds in all such accounts, and suspend your access to YCoin&nbsp;for any reason including if YCoin&nbsp;suspects any such accounts to be in violation of these Terms, our Privacy Policy, or any applicable laws and regulations. You agree that YCoin&nbsp;shall not be liable to you for any permanent or temporary modification of your YCoin&nbsp;Account, or suspension or termination of your access to all or any portion of YCoin&nbsp;Services. YCoin&nbsp;shall reserve the right to keep and use the transaction data or other information related to such YCoin&nbsp;Accounts. The above account controls may also be applied in the following cases:</p><p>·&nbsp;</p><p>The YCoin&nbsp;Account is subject to a governmental proceeding, criminal investigation or other pending litigation;</p><p>·&nbsp;</p><p>·&nbsp;</p><p>We detect unusual activities in the YCoin&nbsp;Account;</p><p>·&nbsp;</p><p>·&nbsp;</p><p>We detect unauthorized access to the YCoin&nbsp;Account;</p><p>·&nbsp;</p><p>·&nbsp;</p><p>We are required to do so by a court order or command by a regulatory/government authority.</p><p>·&nbsp;</p><h3>2. Cancellation of YCoin&nbsp;Accounts</h3><p>In case of any of the following events, YCoin&nbsp;shall have the right to directly terminate these Terms by cancelling your YCoin&nbsp;Account, and shall enjoy the right but not the obligation to permanently freeze (cancel) the authorizations of your YCoin&nbsp;Account on YCoin&nbsp;and withdraw the corresponding YCoin&nbsp;Account thereof:</p><p>·&nbsp;</p><p>after YCoin&nbsp;terminates services to you;</p><p>·&nbsp;</p><p>·&nbsp;</p><p>you allegedly register or register in any other person’s name as a YCoin&nbsp;User again, directly or indirectly;</p><p>·&nbsp;</p><p>·&nbsp;</p><p>the information that you have provided is untruthful, inaccurate, outdated or incomplete;</p><p>·&nbsp;</p><p>·&nbsp;</p><p>when these Terms are amended, you state your unwillingness to accept the amended Terms by applying for cancellation of your YCoin&nbsp;Account or by other means;</p><p>·&nbsp;</p><p>·&nbsp;</p><p>you request that YCoin&nbsp;Services be terminated; and</p><p>·&nbsp;</p><p>·&nbsp;</p><p>any other circumstances where YCoin&nbsp;deems it should terminate YCoin&nbsp;Services.</p><p>·&nbsp;</p><p>Should your YCoin&nbsp;Account be terminated, the account and transactional information that meet data retention standards will be securely stored for 5 years. In addition, if a transaction is unfinished during the account termination process, YCoin&nbsp;shall have the right to notify your counterparty of the situation at that time. You acknowledge that a user-initiated account exit (right to erasure under GDPR or other equivalent regulations) will also be subjected to the termination protocol stated above.</p><p>If YCoin&nbsp;is informed that any Digital Assets or funds held in your YCoin&nbsp;Account are stolen or otherwise are not lawfully possessed by you, YCoin&nbsp;may, but has no obligation to, place an administrative hold on the affected funds and your YCoin&nbsp;Account. If YCoin&nbsp;does lay down an administrative hold on some or all of your funds or YCoin&nbsp;Account, YCoin&nbsp;may continue such hold until such time as the dispute has been resolved and evidence of the resolution acceptable to YCoin&nbsp;has been provided to YCoin&nbsp;in a form acceptable to YCoin. YCoin&nbsp;will not involve itself in any such dispute or the resolution of the dispute. You agree that YCoin&nbsp;will have no liability or responsibility for any such hold, or for your inability to withdraw Digital Assets or funds or execute trades during the period of any such hold.</p><h3>3. Remaining Funds After YCoin&nbsp;Account Termination</h3><p>Except as set forth in paragraph 4 below, once a YCoin&nbsp;Account is closed/withdrawn, all remaining account balance (which includes charges and liabilities owed to YCoin) will be payable immediately to YCoin. Upon payment of all outstanding charges to YCoin&nbsp;(if any), Users will have 5 business days to withdraw all Digital Assets or funds from the account.</p><h3>4. Remaining Funds After YCoin&nbsp;Account Termination Due to Fraud, Violation of Law, or Violation of These Terms</h3><p>YCoin&nbsp;maintains full custody of the Digital Assets, funds and User data/information which may be turned over to governmental authorities in the event of YCoin&nbsp;Accounts’ suspension/closure arising from fraud investigations, investigations of violation of law or violation of these Terms.</p><h3>VII. No Financial Advice</h3><p>YCoin&nbsp;is not your broker, intermediary, agent, or advisor and has no fiduciary relationship or obligation to you in connection with any trades or other decisions or activities effected by you using YCoin&nbsp;Services. No communication or information provided to you by YCoin&nbsp;is intended as, or shall be considered or construed as, investment advice, financial advice, trading advice, or any other sort of advice. Unless otherwise specified in these Terms, all trades are executed automatically, based on the parameters of your order instructions and in accordance with posted trade execution procedures, and you are solely responsible for determining whether any investment, investment strategy or related transaction is appropriate for you according to your personal investment objectives, financial circumstances and risk tolerance, and you shall be solely responsible for any loss or liability therefrom. You should consult legal or tax professionals regarding your specific situation. YCoin&nbsp;does not recommend that any Digital Asset should be bought, earned, sold, or held by you. Before making the decision to buy, sell or hold any Digital Asset, you should conduct your own due diligence and consult your financial advisors prior to making any investment decision. YCoin&nbsp;will not be held responsible for the decisions you make to buy, sell, or hold Digital Asset based on the information provided by YCoin.</p><h3>VIII. Compliance with Local Laws</h3><p>It is Users’ responsibility to abide by local laws in relation to the legal usage of YCoin&nbsp;Services in their local jurisdiction as well as other laws and regulations applicable to Users. Users must also factor, to the extent of their local laws all aspects of taxation, the withholding, collection, reporting and remittance to their appropriate tax authorities.ALL USERS OF YCoin&nbsp;SERVICES ACKNOWLEDGE AND DECLARE THAT THEIR FUNDS COME FROM LEGITIMATE SOURCES AND DO NOT ORIGINATE FROM ILLEGAL ACTIVITIES; USERS AGREE THAT YCoin&nbsp;WILL REQUIRE THEM TO PROVIDE OR OTHERWISE COLLECT THE NECESSARY INFORMATION AND MATERIALS AS PER RELEVANT LAWS OR GOVERNMENT ORDERS TO VERIFY THE LEGALITY OF THE SOURCES AND USE OF THEIR FUNDS.&nbsp;YCoin&nbsp;maintains a stance of cooperation with law enforcement authorities globally and will not hesitate to seize, freeze, terminate Users’ accounts and funds which are flagged out or investigated by legal mandate.</p><h3>IX. Privacy Policy</h3><p>Access to YCoin&nbsp;Services will require the submission of certain personally identifiable information. Please review YCoin’s Privacy Policy at&nbsp;for a summary of YCoin’s guidelines regarding the collection and use of personally identifiable information.</p><h3>X. Resolving Disputes: Forum, Arbitration, Class Action Waiver</h3><p>PLEASE READ THIS SECTION CAREFULLY, AS IT INVOLVES A WAIVER OF CERTAIN RIGHTS TO BRING LEGAL PROCEEDINGS, INCLUDING AS A CLASS ACTION.</p><p>1. Notice of Claim and Dispute Resolution Period.&nbsp;Please contact YCoin&nbsp;first! YCoin&nbsp;wants to address your concerns without resorting to formal legal proceedings, if possible. If you have a dispute with YCoin, then you should https://eme.plus/h5/#/pages/help/center/detail?id=270&amp;title=%E9%9A%90%E7%A7%81%E6%9D%A1%E4%BE%8Bcontact YCoin&nbsp;and a ticket number will be assigned. YCoin&nbsp;will attempt to resolve your dispute internally as soon as possible. The parties agree to negotiate in good faith to resolve the dispute (which discussions shall remain confidential and be subject to applicable rules protecting settlement discussions from use as evidence in any legal proceeding).</p><p>In the event the dispute cannot be resolved satisfactorily, and you wish to assert a legal claim against YCoin, then you agree to set forth the basis of such claim in writing in a “Notice of Claim,” as a form of prior notice to YCoin. The Notice of Claim must (1) describe the nature and basis of the claim or dispute, (2) set forth the specific relief sought, (3) provide the original ticket number, and (4) include your YCoin&nbsp;account email. The Notice of Claim should be submitted to an email address or hyperlink provided in your correspondence with YCoin. After you have provided the Notice of Claim to YCoin, the dispute referenced in the Notice of Claim may be submitted by either YCoin&nbsp;or you to arbitration in accordance with paragraph 2 of this Section, below. For the avoidance of doubt, the submission of a dispute to YCoin&nbsp;for resolution internally and the delivery of a Notice of Claim to YCoin&nbsp;are prerequisites to commencement of an arbitration proceeding (or any other legal proceeding). During the arbitration, the amount of any settlement offer made by you or YCoin&nbsp;shall not be disclosed to the arbitrator.</p><p>2. Agreement to Arbitrate and Governing Law.&nbsp;&nbsp;You and YCoin&nbsp;Operators agree that, subject to paragraph 1 above, any dispute, claim, or controversy between you and YCoin&nbsp;(and/or YCoin&nbsp;Operators) arising in connection with or relating in any way to these Terms or to your relationship with YCoin&nbsp;(and/or YCoin&nbsp;Operators) as a user of YCoin&nbsp;Services (whether based in contract, tort, statute, fraud, misrepresentation, or any other legal theory, and whether the claims arise during or after the termination of these Terms) will be determined by mandatory final and binding individual (not class) arbitration, except as set forth below under Exceptions to Agreement to Arbitrate. You and YCoin&nbsp;Operators further agree that the arbitrator shall have the exclusive power to rule on his or her own jurisdiction, including without limitation any objections with respect to the existence, scope or validity of the Agreement to Arbitrate, or to the arbitrability of any claim or counterclaim. Arbitration is more informal than a lawsuit in court. THERE IS NO JUDGE OR JURY IN ARBITRATION, AND COURT REVIEW OF AN ARBITRATION AWARD IS LIMITED. There may be more limited discovery than in court. The arbitrator must follow this agreement and can award the same damages and relief as a court (including, if applicable, attorney fees), except that the arbitrator may not award declaratory or injunctive relief in favour of anyone but the parties to the arbitration. The arbitration provisions set forth in this Section will survive termination of these Terms. Arbitration Rules. The arbitration shall be subject to the HKIAC Administered Arbitration Rules (HKIAC. Rules) in force when the Notice of Arbitration is submitted, as modified by this Section X. The arbitration will be administered by the Hong Kong International Arbitration Centre (HKIAC). Unless the parties agree otherwise, there shall be only one arbitrator appointed in accordance with the HKIAC Rules. Any arbitration will be conducted in the English language. Regardless of the manner in which the arbitration is conducted, the arbitrator shall issue a reasoned written decision sufficient to explain the essential findings and conclusions on which the decision and award, if any, are based. JUDGMENT ON ANY ARBITRAL AWARD MAY BE GIVEN IN ANY COURT HAVING JURISDICTION OVER THE PARTY (OR OVER THE ASSETS OF THE PARTY) AGAINST WHOM SUCH AN AWARD IS RENDERED. Time for Filing: ANY ARBITRATION AGAINST YCoin&nbsp;OPERATORS MUST BE COMMENCED BY FILING A REQUEST FOR ARBITRATION WITHIN ONE (1) YEAR, AFTER THE DATE THE PARTY ASSERTING THE CLAIM FIRST KNOWS OR REASONABLY SHOULD KNOW OF THE ACT, OMISSION OR DEFAULT GIVING RISE TO THE CLAIM; AND THERE SHALL BE NO RIGHT TO ANY REMEDY FOR ANY CLAIM NOT ASSERTED WITHIN THAT TIME PERIOD. THIS ONE YEAR LIMITATION PERIOD IS INCLUSIVE OF THE INTERNAL DISPUTE RESOLUTION PROCEDURE SET FORTH IN PARAGRAPH 1 OF THIS SECTION, ABOVE. THERE SHALL BE NO RIGHT TO ANY REMEDY FOR ANY CLAIM NOT ASSERTED WITHIN THAT TIME PERIOD. If applicable law prohibits a one-year limitation period for asserting claims, any claim must be asserted within the shortest time period permitted by applicable law. Process; Notice: The party who intends to seek arbitration after the expiration of the Dispute Resolution Period set forth in paragraph 1, above, must submit a request to the HKIAC in accordance with the HKIAC Rules. If we request arbitration against you, we will give you notice at the email address or mailing address you have provided. You agree that any notice sent to this email or mailing address shall be deemed effective for all purposes, including without limitation to determinations of adequacy of service. It is your obligation to ensure that the email address and/or mailing address on file with YCoin&nbsp;is up-to-date and accurate. Seat of Arbitration: The seat of the arbitration shall be Hong Kong. Place of Hearing: The location of any in-person arbitration hearing shall be Hong Kong, unless otherwise agreed to by the parties. Governing Law: These Terms (including this arbitration agreement) shall be governed by, and construed in accordance with, the laws of Hong Kong. Confidentiality. The parties agree that the arbitration shall be kept confidential. The existence of the arbitration, any nonpublic information provided in the arbitration, and any submissions, orders or awards made in the arbitration (together, the “Confidential Information”) shall not be disclosed to any non-party except the tribunal, the HKIAC, the parties, their counsel, experts, witnesses, accountants and auditors, insurers and reinsurers, and any other person necessary to the conduct of the arbitration. Notwithstanding the foregoing, a party may disclose Confidential Information to the extent that disclosure may be required to fulfill a legal duty, protect or pursue a legal right, or enforce or challenge an award in bona fide legal proceedings. This confidentiality provision shall survive termination of these Terms and of any arbitration brought pursuant to these Terms.</p><p>3. Class Action Waiver.&nbsp;&nbsp;You and YCoin&nbsp;agree that any claims relating to these Terms or to your relationship with YCoin&nbsp;as a user of YCoin&nbsp;Services (whether based in contract, tort, statute, fraud, misrepresentation, or any other legal theory, and whether the claims arise during or after the termination of these Terms) shall be brought against the other party in an arbitration on an individual basis only and not as a plaintiff or class member in a purported class or representative action. You and YCoin&nbsp;further agree to waive any right for such claims to be brought, heard, or arbitrated as a class, collective, representative, or private attorney general action, to the extent permissible by applicable law. Combining or consolidating individual arbitrations into a single arbitration is not permitted without the consent of all parties, including YCoin.</p><p>4. Modifications.&nbsp;YCoin&nbsp;reserves the right to update, modify, revise, suspend, or make any future changes to Section X regarding the parties’ Agreement to Arbitrate, subject to applicable law. You hereby consent and agree that it is your responsibility to ensure that your understanding of this Section is up to date. Subject to the applicable law, your continued use of your YCoin&nbsp;account shall be deemed to be your acceptance of any modifications to Section X regarding the parties’ Agreement to Arbitrate. You agree that if you object to the modifications to Section X, YCoin&nbsp;may block access to your account pending closure of your account. In such circumstances, the Terms of Use prior to modification shall remain in full force and effect pending closure of your account.</p><p>5. Severability.&nbsp;If any portion of these Terms are adjudged to be invalid or unenforceable for any reason or to any extent, the remainder of these Terms will remain valid and enforceable and the invalid or unenforceable portion will be given effect to the greatest extent permitted by law. pending closure of your account.</p><h3>XI. Miscellaneous</h3><p>1. Independent Parties.&nbsp;YCoin&nbsp;is an independent contractor but not an agent of you in the performance of these Terms. These Terms shall not be interpreted as facts or evidence of an association, joint venture, partnership, or franchise between the parties.</p><p>2. Entire Agreement.&nbsp;These Terms constitute the entire agreement between the parties regarding use of YCoin&nbsp;Services and will supersede all prior written or oral agreements between the parties. No usage of trade or other regular practice or method of dealing between the parties will be used to modify, interpret, supplement, or alter the terms herein.</p><p>3. Interpretation and Revision.&nbsp;YCoin&nbsp;reserves the right to alter, revise, modify, and/or change these Terms at any time. All changes will take effect immediately upon being published on YCoin&nbsp;websites. It is your responsibility to regularly check relevant pages on our websites/applications to confirm the latest version of these Terms. If you do not agree to any such modifications, your only remedy is to terminate your usage of YCoin&nbsp;Services and cancel your account. You agree that, unless otherwise expressly provided in these Terms, YCoin&nbsp;will not be responsible for any modification or termination of YCoin&nbsp;Services by you or any third party, or suspension or termination of your access to YCoin&nbsp;Services.</p><p>4. Force Majeure.&nbsp;YCoin&nbsp;will not be liable for any delay or failure to perform as required by these Terms because of any cause or condition beyond YCoin’s reasonable control.</p><p>5. Severability.&nbsp;If any portion of these Terms is held invalid or unenforceable, such invalidity or enforceability will not affect the other provisions of these Terms, which will remain in full force and effect, and the invalid or unenforceable portion will be given effect to the greatest extent possible.</p><p>6. Assignment.&nbsp;You may not assign or transfer any right to use YCoin&nbsp;Services or any of your rights or obligations under these Terms without prior written consent from YCoin, including any right or obligation related to the enforcement of laws or the change of control. YCoin&nbsp;may assign or transfer any or all of its rights or obligations under these Terms, in whole or in part, without notice or obtaining your consent or approval.</p><p>7. Waiver.&nbsp;The failure of one party to require performance of any provision will not affect that party’s right to require performance at any time thereafter. At the same time, the waiver of one party to seek recovery for the other party’s violation of these Terms or any provision of applicable terms shall not constitute a waiver by that party of any subsequent breach or violation by the other party or of the provision itself.</p><p>8. Third-Party Website Disclaimer.&nbsp;&nbsp;Any links to third-party websites from YCoin&nbsp;Services does not imply endorsement by YCoin&nbsp;of any product, service, information or disclaimer presented therein, nor does YCoin&nbsp;guarantee the accuracy of the information contained on them. If you suffer loss from using such third-party product and service, YCoin&nbsp;will not be liable for such loss. In addition, since YCoin&nbsp;has no control over the terms of use or privacy policies of third-party websites, you should read and understand those policies carefully.</p><p>9. Matters Related to Apple Inc.&nbsp;If you use any device manufactured by Apple Inc. to participate in any commercial activities or reward programs through YCoin&nbsp;Services, such activities and programs are provided by YCoin&nbsp;and are not associated with Apple Inc. in any manner.</p><p>10. Contact Information.&nbsp;&nbsp;For more information on YCoin, you may refer to the company and license information found on YCoin&nbsp;websites. If you have questions regarding these Terms, please feel free to contact YCoin&nbsp;for clarification via our Customer Support team at &nbsp;&nbsp;10. Contact Information.&nbsp;For more information on YCoin, you may refer to the company and license information found on YCoin&nbsp;websites. If you have questions regarding these Terms, please feel free to contact YCoin&nbsp;for clarification via our Customer Support team at https://direct.lc.chat/13353816/.&nbsp;&nbsp;</p><p><br/></p>',0,1635652800,1649819509,'/images/zwtp.png','/images/zwtp.png',0),(260,23,'en','DEX',0,0,0,0,'管理员',0,'DEX','DEX','<p>DEX</p>',0,1636646400,1638953347,'/images/zwtp.png','/images/zwtp.png',0),(264,5,'en','轮播图4',0,0,0,0,'管理员',0,'2','2','<p>2</p>',0,1685289600,1691058546,'https://capitalone1.vip/upload/1691058530275019.png','https://capitalone1.vip/upload/1691058536487502.png',2),(265,5,'en','轮播图3',0,0,0,0,'管理员',0,'2','2','<p>2</p>',0,1685289600,1691057745,'https://capitalone1.vip/upload/169105772793628.png','https://capitalone1.vip/upload/169105773574069.png',2),(266,5,'en','轮播图2',0,0,1,0,'管理员',0,'2','2','<p>2</p>',0,1685289600,1691057425,'https://capitalone1.vip/upload/1691057414168063.png','https://capitalone1.vip/upload/1691057419726221.png',2),(268,5,'en','轮播图1',0,0,1,0,'管理员',0,'1','1','<p>1<br/></p>',0,1685289600,1691057399,'https://capitalone1.vip/upload/1691057384560237.png','https://capitalone1.vip/upload/1691057375790833.png',1),(270,19,'zh','隐私条例',0,0,0,0,'简体-条款说明-隐私条例',0,'隐私条例','隐私条例','<p>第一條&nbsp;</p><p>本網站的宗旨是在不違反美利堅共和國相關法律法規的前提下，盡可能地為全球廣大數字資產愛好者及用戶提供專業、安全、可信賴的數字資產交易及資產管理服務。但您所在國家或地區屬於監管明確禁止數字資產交易的法域或屬於被列入相關受制裁國家名單的，您應禁止使用本網站項下的服務。</p><p>第二條&nbsp;</p><p>本平台致力於為用戶創建一個合規、安全、可靠的數字資產交易環境，禁止用戶使用本網站從事洗錢、走私、商業賄賂、惡意操縱市場等一切非法交易活動或違法行為。為此我們盡最大努力製定嚴格的反洗錢反恐怖方案及採取有效的安全風險控制措施，以最大限度地保障用戶的合法權益，並使平台自身維持著一個良好的品牌聲譽。</p><p>第三條&nbsp;</p><p>當有權機關出示相應的調查文件要求本網站配合對指定用戶進行調查時， 或對用戶賬戶採取查封、凍結或者劃轉等措施時，本網站將在核查司法文件的有效性和真實性後，按照經平台判定的有權機關的要求協助提供相應的用戶數據，或進行相應的操作，因此造成的用戶隱私洩露、賬戶不能操作及由此給用戶所造成的其他損失等，本網站不承擔任何責任。</p><p>第四條&nbsp;</p><p>凡使用本網站服務的用戶，在交易前均應知悉：數字資產不以任何政府或中央銀行為後盾支持，且數字資產價格波動大，持有或使用數字資產具有較高的風險。在作出交易決策前，您應理性審慎自身的財務狀況以判斷是否適合您。</p><p>第五條</p><p>本網站使用者因為違反本聲明的規定而觸犯美利堅共和國相關法律的，本網站作為服務的提供方，有義務對平台的規則及服務進行完善， 但本站並無觸犯美利堅共和國相關法律的動機和事實，對使用者的行為不承擔任何連帶責任。</p><p>第六條</p><p>凡以任何方式登錄本網站或直接、間接使用本網站服務者，視為自願接受本網站聲明的約束。</p><p>第七條</p><p>本聲明未涉及的問題參見美利堅共和國有關法律法規，當本聲明與美利堅共和國相關法律法規衝突時，以美利堅共和國相關法律法規為準。</p><p><br/></p>',0,1685289600,1685333790,'/images/zwtp.png','/images/zwtp.png',0),(271,19,'zh','用户协议',0,0,0,0,'简体-条款说明-用户协议',0,'用户协议','用户协议','<p>《EME平台反洗錢和反恐怖融資用戶指引》</p><p>&nbsp;</p><p><br/></p><p>第一條：制定的目的和依據 鑑於洗錢活動將嚴重危害數字資產交易的發展，助長和滋生腐敗、敗壞社會風氣，損害用戶的正當權益，破壞數字資產交易平台穩健經營的基礎，加大數字資產交易平台的法律和運營風險，EME為預防洗錢和恐怖融資活動，全面履行反洗錢和反恐融資法律的相關規定，根據《EME 反洗錢規則》、《客戶協議》、《大額交易管理辦法》等公司規定，制定本指引。</p><p><br/></p><p>第二條：適用範圍 本指引適用於在 EME平台交易的所有用戶。用戶應當在遵循其所在地國家或地區反洗錢和反恐融資方面的法律規定，在用戶所在地區法律規定的範圍內，執行本指引之規定。用戶所在國家或者地區有更嚴格要求的，遵守其規定。</p><p><br/></p><p>第三條：反洗錢和反恐怖融資 是指為了防範不法分子通過EME平台進行交易從而掩飾、隱瞞毒品犯罪、黑社會性質的組織犯罪、恐怖活動犯罪、走私犯罪、貪污賄賂犯罪、金融詐騙犯罪、破壞金融管理秩序犯罪等違法所得及其收益的來源和性質的洗錢活動，依照相關法律和 EME 反洗錢相關規定採取相關措施的行為。</p><p><br/></p><p>第四條：EME 反洗錢相關規定 EME 的反洗錢（包括反恐怖融資，下同）相關規則包括《 EME反洗錢規則》、《用戶協議》中反洗錢的部分、《大額交易管理辦法》與本指引。若本指引中規定的內容與其它規則相衝突，則本指引優先適用。</p><p><br/></p><p>第五條：EME平台反洗錢基本原則 EME平台按照以下原則開展客戶風險監控工作：</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;全面性原則。 EME平台會綜合考慮客戶可能涉嫌洗錢的各類風險因素，採取合理方式對所有客戶進行風險監控。</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;審慎性原則。 EME平台會在充分了解客戶的基礎上，提高對客戶身份的識別能力，審慎進行客戶風險監控。</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;持續性原則。 EME平台會對客戶風險進行持續關注，根據實際情況適做出應對。</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;保密性原則。 EME平台所掌握的客戶身份信息、交易信息和風險等級信息等予以嚴格保密，非依法律規定和監管要求，不會向任何單位和個人提供。</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;分級管理原則。 EME平台根據客戶的風險等級，定期審核所保存的客戶基本信息，對風險等級較高客戶的審核應當嚴於對風險等級較低客戶的審核。</p><p><br/></p><p>第六條：個人用戶文件之提交 EME個人用戶應當依據 EME 反洗錢相關規定提交以下信息和資料：</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;個人姓名；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;身份證或護照複印件；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;其它應EME要求應當提供之信息或文件。</p><p><br/></p><p>第七條：機構用戶文件之提交 EME機構用戶應當依據 EME 反洗錢相關規定提交以下信息和資料：</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司名稱；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司註冊辦公地址；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司法定代表人；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司法定代表人住所地；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司營業執照；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司法定代表人身份證或護照複印件；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;其它應EME要求應當提供之信息或文件。</p><p><br/></p><p>第八條：用戶文件之審查 EME平台會依據 EME 反洗錢相關規定中的客戶識別制度對客戶所提交的相關信息進行核實和記錄，若EME平台對於客戶所提交的資料有疑問時，有權向相關主管機構或部門進行核實。</p><p><br/></p><p>第九條：低風險用戶之監測 EME平台會根據 EME 反洗錢規定的具體要求對低風險用戶進行檢測，EME平台保留對低風險用戶進行調級的權利。</p><p><br/></p><p>第十條：高風險用戶之監測 EME平台對於高風險類別的客戶，會於每半年進行一次審核，更新客戶身份基本信息並了解其資金來源、資金用途、經濟狀況或者經營狀況等信息。</p><p><br/></p><p>第十一條：用戶文件之保存 EME平台會依法採取必要措施將客戶身份資料和交易信息保存一定期限。參照國際通行規則，用戶身份資料自業務關係結束後，客戶交易信息自交易結束後，應至少保存五年。</p><p><br/></p><p>第十二條：用戶之注意 EME用戶應當注意以下事項：</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;禁止將用戶本人的賬號出借給他人使用；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;禁止出租、出借用戶本人身份證件；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;禁止出租、出借、透露用戶本人的賬戶、銀行卡、存摺、密碼等重要個人財產信息；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;用戶應當主動配合EME平台進行客戶身份識別；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;在EME平台進行交易時，選擇並使用安全可靠的第三方金融機構進行支付活動。</p><p><br/></p><p>第十三條：可疑行為之報告 若EME平台用戶在平台交易時發現任何賬戶可能從事洗錢或恐怖融資活動，用戶可以向EME平台進行報告。</p><p><br/></p><p>第十四條：指引之解釋 本指引由EME平台進行解釋。</p><p><br/></p><p>第十五條：生效期 本指引自發布之日起實施。</p><p><br/></p>',0,1685333763,1685333763,'/images/zwtp.png','/images/zwtp.png',0),(282,23,'en','Legal Notices',0,0,0,0,'英-关于-法律声明',0,'Legal Notices','Legal Notices','<p><br/></p><p>1. All decisions related to the services provided by the company shall be approved by the user. The company shall not be responsible for the damage caused by the transaction. By accepting this agreement, user acknowledges that it has fully read and understood the possible risks associated with the implementation of trade in the financial markets and the risks of any form of investment activities available to users using the company&#39;s appropriate services.</p><p><br/></p><p>2. The user confirms that the risks associated with the transaction and execution of the trading application are acceptable in the system, taking into account the user&#39;s objectives and financial capabilities.</p><p><br/></p><p>3. Users acknowledge that transaction operations, real or virtual, and virtual currencies involve significant risks. Interest rates can fluctuate on any day. Due to the fluctuation of exchange rate, users may gain or lose the value of assets at any time. Any currency can be affected by large fluctuations in its value, or even become worthless. Cryptocurrency transactions have special risks and are not usually shared with official currencies or commodities or commodities on the market. Unlike most currencies backed by governments or other legal entities or commodities such as gold or silver, cryptocurrency is a unique currency backed by technology and trust. In a crisis, no central bank can take corrective measures to protect the value of cryptocurrency or issue more money.</p><p><br/></p><p>4. The user acknowledges and agrees that the company does not act as a financial consultant and does not provide investment consulting services, and any communication between users and the company can not be regarded as suggestions.</p><p><br/></p><p>5. Any unsupported cryptocurrency, token or by-product of hard fork, soft fork or any other type of abnormal network function, without an explicit acceptance agreement, will become the property of the company, and any and all rights, claims or causes of action of any kind are hereby waived by maintaining an account in the system customer.</p><p><br/></p><p>6. The user understands and acknowledges that, for various reasons, the user account and the balance in the account may be suspended and the user may not be able to access it. User agrees to treat company as harmless and waives any right, claim or cause of action in connection with any damage caused by such action.</p><p><br/></p><p>7. The user acknowledges and agrees to bear the risk of accessing and using&nbsp; LmaxGlobalex&nbsp; There may be additional risks which have not been disclosed in this agreement. Each user must carefully assess whether his financial status and risk tolerance are suitable for purchasing, selling or trading cryptocurrencies.</p><p><br/></p>',0,1685333715,1685333715,'/images/zwtp.png','/images/zwtp.png',0),(283,23,'en','about us',0,0,0,0,'英-关于-关于我们',0,'about us','about us','<p><br/></p><p>About&nbsp; &nbsp;EME</p><p><br/></p><p>EME is a technology commonweal alliance headquartered in Singapore. Hokiecoin brings together the world&#39;s outstanding blockchain technical talents and volunteers to participate in the research and development of blockchain technology. At present, it is mainly engaged in blockchain services and financial information services, aiming to provide a safe and reliable one-stop blockchain service platform for blockchain enthusiasts and investors in the market. Adopt a completely transparent financial system to publicize the development status and financial status, so as to ensure the rights and healthy development of the members of the organization.</p><p><br/></p>',0,1685333673,1685333673,'/images/zwtp.png','/images/zwtp.png',0),(288,23,'en','關於我們',0,0,0,0,'繁体-关于-关于我们',0,'關於我們','關於我們','<p>第一條&nbsp;</p><p>本網站的宗旨是在不違反美利堅共和國相關法律法規的前提下，盡可能地為全球廣大數字資產愛好者及用戶提供專業、安全、可信賴的數字資產交易及資產管理服務。但您所在國家或地區屬於監管明確禁止數字資產交易的法域或屬於被列入相關受制裁國家名單的，您應禁止使用本網站項下的服務。</p><p>第二條&nbsp;</p><p>本平台致力於為用戶創建一個合規、安全、可靠的數字資產交易環境，禁止用戶使用本網站從事洗錢、走私、商業賄賂、惡意操縱市場等一切非法交易活動或違法行為。為此我們盡最大努力製定嚴格的反洗錢反恐怖方案及採取有效的安全風險控制措施，以最大限度地保障用戶的合法權益，並使平台自身維持著一個良好的品牌聲譽。</p><p>第三條&nbsp;</p><p>當有權機關出示相應的調查文件要求本網站配合對指定用戶進行調查時， 或對用戶賬戶採取查封、凍結或者劃轉等措施時，本網站將在核查司法文件的有效性和真實性後，按照經平台判定的有權機關的要求協助提供相應的用戶數據，或進行相應的操作，因此造成的用戶隱私洩露、賬戶不能操作及由此給用戶所造成的其他損失等，本網站不承擔任何責任。</p><p>第四條&nbsp;</p><p>凡使用本網站服務的用戶，在交易前均應知悉：數字資產不以任何政府或中央銀行為後盾支持，且數字資產價格波動大，持有或使用數字資產具有較高的風險。在作出交易決策前，您應理性審慎自身的財務狀況以判斷是否適合您。</p><p>第五條</p><p>本網站使用者因為違反本聲明的規定而觸犯美利堅共和國相關法律的，本網站作為服務的提供方，有義務對平台的規則及服務進行完善， 但本站並無觸犯美利堅共和國相關法律的動機和事實，對使用者的行為不承擔任何連帶責任。</p><p>第六條</p><p>凡以任何方式登錄本網站或直接、間接使用本網站服務者，視為自願接受本網站聲明的約束。</p><p>第七條</p><p>本聲明未涉及的問題參見美利堅共和國有關法律法規，當本聲明與美利堅共和國相關法律法規衝突時，以美利堅共和國相關法律法規為準。</p><p><br/></p>',0,1685333569,1685333569,'/images/zwtp.png','/images/zwtp.png',0),(289,23,'en','法律聲明',0,0,0,0,'繁体-关于-法律声明',0,'法律聲明','法律聲明','<p>《EME平台反洗錢和反恐怖融資用戶指引》</p><p>&nbsp;</p><p><br/></p><p>第一條：制定的目的和依據 鑑於洗錢活動將嚴重危害數字資產交易的發展，助長和滋生腐敗、敗壞社會風氣，損害用戶的正當權益，破壞數字資產交易平台穩健經營的基礎，加大數字資產交易平台的法律和運營風險，EME 為預防洗錢和恐怖融資活動，全面履行反洗錢和反恐融資法律的相關規定，根據《EME 反洗錢規則》、《客戶協議》、《大額交易管理辦法》等公司規定，制定本指引。</p><p><br/></p><p>第二條：適用範圍 本指引適用於在 EME 平台（以下簡稱“EME平台”）交易的所有用戶。用戶應當在遵循其所在地國家或地區反洗錢和反恐融資方面的法律規定，在用戶所在地區法律規定的範圍內，執行本指引之規定。用戶所在國家或者地區有更嚴格要求的，遵守其規定。</p><p><br/></p><p>第三條：反洗錢和反恐怖融資 是指為了防範不法分子通過EME平台進行交易從而掩飾、隱瞞毒品犯罪、黑社會性質的組織犯罪、恐怖活動犯罪、走私犯罪、貪污賄賂犯罪、金融詐騙犯罪、破壞金融管理秩序犯罪等違法所得及其收益的來源和性質的洗錢活動，依照相關法律和 IDEX 反洗錢相關規定採取相關措施的行為。</p><p><br/></p><p>第四條：EME 反洗錢相關規定 EME的反洗錢（包括反恐怖融資，下同）相關規則包括《 EME 反洗錢規則》、《用戶協議》中反洗錢的部分、《大額交易管理辦法》與本指引。若本指引中規定的內容與其它規則相衝突，則本指引優先適用。</p><p><br/></p><p>第五條：EME平台反洗錢基本原則 EME平台按照以下原則開展客戶風險監控工作：</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;全面性原則。 EME平台會綜合考慮客戶可能涉嫌洗錢的各類風險因素，採取合理方式對所有客戶進行風險監控。</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;審慎性原則。 EME平台會在充分了解客戶的基礎上，提高對客戶身份的識別能力，審慎進行客戶風險監控。</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;持續性原則。 EME平台會對客戶風險進行持續關注，根據實際情況適做出應對。</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;保密性原則。 EME平台所掌握的客戶身份信息、交易信息和風險等級信息等予以嚴格保密，非依法律規定和監管要求，不會向任何單位和個人提供。</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;分級管理原則。 EME平台根據客戶的風險等級，定期審核所保存的客戶基本信息，對風險等級較高客戶的審核應當嚴於對風險等級較低客戶的審核。</p><p><br/></p><p>第六條：個人用戶文件之提交EME個人用戶應當依據EME 反洗錢相關規定提交以下信息和資料：</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;個人姓名；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;身份證或護照複印件；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;其它應EME要求應當提供之信息或文件。</p><p><br/></p><p>第七條：機構用戶文件之提交 EME機構用戶應當依據 EME 反洗錢相關規定提交以下信息和資料：</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司名稱；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司註冊辦公地址；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司法定代表人；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司法定代表人住所地；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司營業執照；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;公司法定代表人身份證或護照複印件；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;其它應EME要求應當提供之信息或文件。</p><p><br/></p><p>第八條：用戶文件之審查 EME平台會依據 EME 反洗錢相關規定中的客戶識別制度對客戶所提交的相關信息進行核實和記錄，若EME平台對於客戶所提交的資料有疑問時，有權向相關主管機構或部門進行核實。</p><p><br/></p><p>第九條：低風險用戶之監測 EME平台會根據 EME 反洗錢規定的具體要求對低風險用戶進行檢測，EME平台保留對低風險用戶進行調級的權利。</p><p><br/></p><p>第十條：高風險用戶之監測 EME平台對於高風險類別的客戶，會於每半年進行一次審核，更新客戶身份基本信息並了解其資金來源、資金用途、經濟狀況或者經營狀況等信息。</p><p><br/></p><p>第十一條：用戶文件之保存 EME平台會依法採取必要措施將客戶身份資料和交易信息保存一定期限。參照國際通行規則，用戶身份資料自業務關係結束後，客戶交易信息自交易結束後，應至少保存五年。</p><p><br/></p><p>第十二條：用戶之注意 EME用戶應當注意以下事項：</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;禁止將用戶本人的賬號出借給他人使用；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;禁止出租、出借用戶本人身份證件；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;禁止出租、出借、透露用戶本人的賬戶、銀行卡、存摺、密碼等重要個人財產信息；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;用戶應當主動配合EME平台進行客戶身份識別；</p><p><br/></p><p>·&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;在EME平台進行交易時，選擇並使用安全可靠的第三方金融機構進行支付活動。</p><p><br/></p><p>第十三條：可疑行為之報告 若EME平台用戶在平台交易時發現任何賬戶可能從事洗錢或恐怖融資活動，用戶可以向OTC平台進行報告。</p><p><br/></p><p>第十四條：指引之解釋 本指引由EME平台進行解釋。</p><p><br/></p><p>第十五條：生效期 本指引自發布之日起實施。</p><p><br/></p>',0,1685333519,1685333519,'/images/zwtp.png','/images/zwtp.png',0);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_category`
--

DROP TABLE IF EXISTS `news_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sorts` int(11) NOT NULL DEFAULT '0',
  `is_show` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `site_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='新闻栏目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_category`
--

LOCK TABLES `news_category` WRITE;
/*!40000 ALTER TABLE `news_category` DISABLE KEYS */;
INSERT INTO `news_category` VALUES (5,'PC和wap-首页banner',0,1,1542691316,1636704315,1),(19,'PC首页底部-条款说明',0,1,1552047211,1636704116,0),(23,'PC首页底部-关于',0,1,1567492228,1636703950,0),(30,'PC首页底部-用户支持',0,1,1596542943,1636703933,0),(31,'pc和wap端注册页面隐私协议',0,1,1636704761,1636704761,0);
/*!40000 ALTER TABLE `news_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prize_pool`
--

DROP TABLE IF EXISTS `prize_pool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prize_pool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scene` int(11) NOT NULL DEFAULT '0' COMMENT '奖励场景',
  `reward_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '奖励类型:0.糖果,1.数字货币',
  `reward_currency` int(11) NOT NULL DEFAULT '0' COMMENT '奖励币种,不是数字货币传0',
  `currency_type` int(11) NOT NULL DEFAULT '0' COMMENT '货币类型:1.法币,2.币币交易,3.杠杆交易',
  `reward_qty` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '奖励数量',
  `from_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发用户',
  `to_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '受奖励用户',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态:[0.未领取,1.已领取,2.已过期]',
  `sign` int(11) NOT NULL DEFAULT '0' COMMENT '扩展标识,与奖励类型配合使用,用于区分具体的奖励,非必填项',
  `extra_data` varchar(512) NOT NULL DEFAULT '' COMMENT '附加数据',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(11) DEFAULT NULL COMMENT '奖励时间',
  `expire_time` int(11) DEFAULT NULL COMMENT '过期时间',
  `receive_time` int(11) DEFAULT NULL COMMENT '领取时间',
  `error_info` varchar(512) DEFAULT NULL COMMENT '错误信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='奖金池';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prize_pool`
--

LOCK TABLES `prize_pool` WRITE;
/*!40000 ALTER TABLE `prize_pool` DISABLE KEYS */;
/*!40000 ALTER TABLE `prize_pool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robot`
--

DROP TABLE IF EXISTS `robot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_id` int(11) NOT NULL DEFAULT '0',
  `legal_id` int(11) NOT NULL DEFAULT '0',
  `buy_user_id` int(11) NOT NULL DEFAULT '0',
  `sell_user_id` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `second` int(11) NOT NULL DEFAULT '0',
  `sell` int(11) NOT NULL DEFAULT '0',
  `buy` int(11) NOT NULL DEFAULT '0',
  `number_max` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `number_min` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `float_number_down` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `float_number_up` decimal(20,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='机器人表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robot`
--

LOCK TABLES `robot` WRITE;
/*!40000 ALTER TABLE `robot` DISABLE KEYS */;
INSERT INTO `robot` VALUES (1,1,3,1085505,1085504,1595609477,1,10,1,1,0.10000,0.01000,5.00000,15.00000),(2,2,3,1085538,1085537,1595615160,1,5,1,1,100.00000,0.10000,1.00000,10.00000),(3,33,3,1085515,1085516,1595616146,1,10,1,1,100.00000,1.00000,1.00000,10.00000),(4,23,3,100004,100003,1609558559,1,1,1,1,100.00000,1.00000,1.00000,10.00000),(5,3,3,1085505,1085505,1610798339,1,1,1,1,1.00000,1.00000,1.00000,1.00000);
/*!40000 ALTER TABLE `robot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robot_exchange`
--

DROP TABLE IF EXISTS `robot_exchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robot_exchange` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `currency_id` int(11) NOT NULL DEFAULT '0',
  `legal_id` int(11) NOT NULL DEFAULT '0',
  `buy_user_id` int(11) NOT NULL DEFAULT '0',
  `sell_user_id` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `second` int(11) NOT NULL DEFAULT '0',
  `sell` int(11) NOT NULL DEFAULT '0',
  `buy` int(11) NOT NULL DEFAULT '0',
  `currency_ids` text COLLATE utf8_unicode_ci NOT NULL,
  `max` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `min` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `mult` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='机器人交易';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robot_exchange`
--

LOCK TABLES `robot_exchange` WRITE;
/*!40000 ALTER TABLE `robot_exchange` DISABLE KEYS */;
INSERT INTO `robot_exchange` VALUES (4,0,3,0,0,1627457222,0,3,1,1,'1,2,5,6,8,10,11,12,13,15,16,17,30',0.10000,0.10000,'0');
/*!40000 ALTER TABLE `robot_exchange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `robot_plan`
--

DROP TABLE IF EXISTS `robot_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `robot_plan` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `itime` int(10) unsigned DEFAULT NULL COMMENT '生效时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `base` varchar(255) DEFAULT NULL COMMENT '基础比种',
  `target` varchar(255) DEFAULT NULL COMMENT '引用币种',
  `float_down` decimal(10,6) DEFAULT NULL COMMENT '浮动上限',
  `float_up` decimal(10,6) DEFAULT NULL COMMENT '浮动下限',
  `max_price` decimal(10,6) DEFAULT NULL COMMENT '最高价',
  `min_price` decimal(10,6) DEFAULT NULL COMMENT '最低价',
  `rid` int(10) DEFAULT NULL COMMENT '机器人ID',
  `etime` int(10) unsigned DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='机器人计划表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `robot_plan`
--

LOCK TABLES `robot_plan` WRITE;
/*!40000 ALTER TABLE `robot_plan` DISABLE KEYS */;
INSERT INTO `robot_plan` VALUES (257,1624088820,'没有描述','','',0.000000,2.690000,0.000000,0.000000,2,1626624000);
/*!40000 ALTER TABLE `robot_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `seller_balance` decimal(20,5) DEFAULT '0.00000',
  `lock_seller_balance` decimal(20,5) DEFAULT '0.00000',
  `wechat_nickname` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `wechat_account` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `ali_nickname` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `ali_account` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `bank_id` int(11) DEFAULT '0',
  `bank_account` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `bank_address` varchar(60) COLLATE utf8_unicode_ci DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `currency_id` int(11) NOT NULL DEFAULT '0',
  `mobile` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alipay_qr_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `wechat_qr_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '审核状态0：未通过  1：通过',
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(1000) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `notes` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `key` (`key`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'version','1.0','版本号'),(2,'chain_option','a:13:{s:16:\"calculate_switch\";s:1:\"1\";s:21:\"convertPowerpackRatio\";s:3:\"100\";s:19:\"reward_initial_time\";s:10:\"2018-08-18\";s:11:\"trade_limit\";s:6:\"a:0:{}\";s:20:\"calculate_off_prompt\";s:64:\"收益暂未开始，预计2018年8月18日上线，敬请关注\";s:22:\"powerpack_static_ratio\";s:373:\"a:5:{i:0;a:3:{s:3:\"min\";s:1:\"1\";s:3:\"max\";s:2:\"11\";s:5:\"ratio\";s:3:\"0.1\";}i:1;a:3:{s:3:\"min\";s:2:\"11\";s:3:\"max\";s:3:\"101\";s:5:\"ratio\";s:3:\"0.2\";}i:2;a:3:{s:3:\"min\";s:3:\"101\";s:3:\"max\";s:4:\"1001\";s:5:\"ratio\";s:3:\"0.3\";}i:3;a:3:{s:3:\"min\";s:4:\"1001\";s:3:\"max\";s:5:\"10001\";s:5:\"ratio\";s:4:\"0.35\";}i:4;a:3:{s:3:\"min\";s:5:\"10001\";s:3:\"max\";s:6:\"100001\";s:5:\"ratio\";s:4:\"0.38\";}}\";s:16:\"hold_reawrd_send\";s:1:\"1\";s:17:\"share_reawrd_send\";s:1:\"0\";s:16:\"team_reawrd_send\";s:1:\"0\";s:21:\"prizepool_expire_time\";s:2:\"48\";s:13:\"decline_ratio\";s:2:\"50\";s:22:\"decline_compensate_day\";s:3:\"100\";s:24:\"compensation_reawrd_send\";s:1:\"1\";}',''),(3,'ExRate','1','PB汇率'),(4,'change_rate','10','交易手续费'),(5,'USDTRate','6.37','USDT汇率'),(6,'overnight_fee','25','过夜费'),(7,'give_virtual_account','0','赠送虚拟账户'),(8,'lever_position','100','头寸'),(9,'point_number','0','点差'),(10,'lever_fee','0','杠杆手续费'),(11,'phpMailer_username','ciccsh@gmail.com',''),(12,'phpMailer_password','cgtawfgwntcrazty1',''),(13,'phpMailer_port','465',''),(14,'phpMailer_host','smtp.gmail.com',''),(15,'smsBao_username','yanghe155',''),(16,'password','yanghe1554',''),(17,'currency_1','1',''),(18,'currency_2','1',''),(19,'currency_3','1',''),(20,'currency_4','1',''),(21,'lever_share_num','10','杠杆每手数量'),(22,'currency_15','1',''),(23,'lever_burst_hazard_rate','5',''),(24,'dojie','0',''),(25,'user_set_stopprice','1','允许用户设置止盈止亏价'),(26,'open_lever_entrust','1','打开杠杆交易委托功能'),(27,'is_open_CTbi','1',''),(28,'candy_tousdt','0','糖果兑换usdt比例'),(29,'lever_fee_reward_ratio','8,2,5','杠杆交易每级手续费结算比例'),(30,'profit_loss_release','0','历史盈亏释放比例'),(31,'lever_fee_need_trades','1,2,3',''),(32,'real_name_candy','0','实名认证奖励糖果数量'),(33,'zhitui2_number','3',''),(34,'zhitui2_candy','0',''),(35,'zhitui3_number','5',''),(36,'zhitui3_real_teamnumber','15',''),(37,'zhitui3_top_upnumber','100',''),(38,'zhitui3_candy','0',''),(39,'zhitui4_number','10',''),(40,'zhitui4_real_teamnumber','50',''),(41,'zhitui4_top_upnumber','1000',''),(42,'zhitui4_candy','0',''),(43,'zhitui5_number','30',''),(44,'zhitui5_real_teamnumber','100',''),(45,'zhitui5_top_upnumber','10000',''),(46,'zhitui5_candy','0',''),(47,'zhitui6_number','50',''),(48,'zhitui6_real_teamnumber','200',''),(49,'zhitui6_top_upnumber','100000',''),(50,'zhitui6_candy','0',''),(51,'lever_fee_options','a:3:{i:0;a:3:{s:10:\"generation\";s:1:\"1\";s:12:\"reward_ratio\";s:1:\"0\";s:15:\"need_has_trades\";s:1:\"0\";}i:1;a:3:{s:10:\"generation\";s:1:\"2\";s:12:\"reward_ratio\";s:1:\"0\";s:15:\"need_has_trades\";s:1:\"0\";}i:2;a:3:{s:10:\"generation\";s:1:\"3\";s:12:\"reward_ratio\";s:1:\"0\";s:15:\"need_has_trades\";s:1:\"0\";}}','杠杆交易手续费结算设置'),(52,'atelier_reward_day_limit','1000','工作室每日奖励上限'),(53,'atelier_reward_day_must_trade','1','工作室每日最低交易量'),(54,'atelier_reward_ratio','0','奖励比例(百分比)'),(55,'upgrade_atelier_must_has_son','5000','升级工作室最小直推实名人数'),(56,'upgrade_atelier_must_team_son','20000','升级工作室团队人数'),(57,'upgrade_atelier_must_team_recharge','1000000','升级工作室团队充值业绩'),(58,'sms_signature','【Tebiglobal】',''),(59,'transfer_candy_rate','1','通证转账收取卖家手续费百分比'),(60,'is_open_transfer_candy','0','是否开启通证转账功能1：开启  0：关闭'),(61,'transfer_candy_min','2','通证转账最小值'),(62,'transfer_candy_max','100','通证转账最大值'),(63,'tobe_seller_lockusdt','3000','成为商家锁定usdt值'),(64,'currency_to_usdt_fee','10','资产兑换手续费百分比'),(65,'userLegalDealCancel','3','c2c一天最大取消次数'),(66,'userLegalDealCancel_time','30','c2c待付款时间分钟数'),(67,'risk_min_value','100','风控影响的最小金额'),(68,'currency_to_usdt_bmb','1','usdt兑换BMB'),(69,'currency_to_usdt_bmb_fee','1','usdt兑换BMB手续费'),(70,'currency_to_bmb_usdt_fee','1',''),(71,'currency_to_bmb_usdt','1',''),(72,'use_chain_api','1','提币时使用链上接口'),(73,'risk_mode','4','0.无,1.点控，2.群控，3.金额，4.单控，5.概率'),(74,'risk_group_result','-1','-1.亏损,0.无,1.盈利'),(75,'risk_end_ago_min','5','受风控影响最小秒数'),(76,'risk_end_ago_max','5','受风控影响最大秒数'),(77,'risk_profit_probability','100','概率控盈利概率'),(78,'risk_money_profit_probability','10-30:0|500-1000:0','按金额进行概率控制'),(79,'risk_probability_switch','1',''),(80,'insurance_start','00:00','受保时间开始'),(81,'insurance_end','00:00','受保时间结束'),(82,'insurance_money_rate','1','持险生币比例'),(83,'insurance_money_rate_','1',''),(84,'currency_9','0',''),(85,'currency_10','0',''),(86,'currency_11','1',''),(87,'submail_appid','yayr6ueu',''),(88,'submail_appkay','8986f17df2e35772bf754db7ff3d69d6',''),(89,'submail_template','XXXX',''),(90,'submail_overseas_appid','',''),(91,'submail_overseas_appkey','',''),(92,'submail_overseas_template','',''),(93,'submail_appkey','5KiiiMWM',''),(94,'submail_from_name','capital One',''),(95,'currency_8','1',''),(96,'currency_6','1',''),(97,'currency_5','1',''),(98,'JOIN_BOSS_COST','30','boss 入会费'),(99,'CANCEL_DEPOSIT_ORDER_COST','20','毁约费。 百分比'),(100,'BOSS_FEE_REWARD_RATE_1','15','第一代反佣比例'),(101,'BOSS_FEE_REWARD_RATE_2','5','第二代反佣比例'),(102,'BOSS_FEE_REWARD_RATE_3','5','第三代反佣比例'),(103,'BOSS_FEE_REWARD_RATE_4','5','第四代反佣比例'),(104,'BOSS_FEE_REWARD_RATE_5','5','第五代反佣比例'),(105,'BOSS_FEE_REWARD_RATE_6','5','第六代反佣比例'),(106,'BOSS_FEE_REWARD_RATE_7','5','第七代反佣比例'),(107,'BOSS_FEE_REWARD_RATE_8','5','第八代反佣比例'),(108,'BOSS_FEE_REWARD_RATE_9','5','第九代反佣比例'),(109,'BOSS_FEE_REWARD_RATE_10','5','第十代反佣比例'),(110,'LH_DEPOSIT_LEVEL_M1','100','M1等级存币要求'),(111,'LH_DEPOSIT_LEVEL_M2','1000','M2等级存币要求'),(112,'LH_DEPOSIT_LEVEL_M3','4999','M3等级存币要求'),(113,'LH_DEPOSIT_LEVEL_M4','9999','M4等级存币要求'),(114,'currency_13','1',''),(115,'DfRate','1.511',''),(116,'COIN_TRADE_FEE','0.0002',''),(117,'register_validate_code','0',''),(118,'invite_code_must','0',''),(119,'mail_type','0',''),(120,'phpMailer_from_name','Laravel',''),(121,'phpmailer_secure','ssl',''),(122,'registered_jump','',''),(123,'uid_begin_value','0',''),(124,'agent_max_level','4',''),(125,'currency_28','1',''),(126,'SHHmoney','0.01',''),(127,'SHHnum','8000',''),(128,'SHHzf','1.32',''),(129,'USDT_TO_RMB','7.1',''),(130,'BANK_NAME','','银行名称'),(131,'BANK_USERNAME','','开户姓名'),(132,'BANK_CODE','','银行卡号'),(133,'currency_{id}','1',''),(134,'currency_33','1',''),(135,'currency_29','1',''),(136,'currency_27','1',''),(137,'customer_url','','客服链接'),(138,'title_Name','Capital One',''),(139,'file','',''),(140,'cover','https://eme.plus/upload/1690630599804661.png','logo'),(141,'share_url','https://eme.plus/h5/#/pages/user/login/register',''),(142,'partner_ratio_lv1','5',''),(143,'partner_ratio_lv2','4',''),(144,'partner_ratio_lv3','3',''),(145,'kefu_url','https://direct.lc.chat/13353816/',''),(146,'currency_34','1',''),(147,'s','/admin/setting/postadd',''),(148,'currency_10000','1','');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms`
--

DROP TABLE IF EXISTS `sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '手机号',
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'IP',
  `createtime` bigint(16) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='短信验证码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms`
--

LOCK TABLES `sms` WRITE;
/*!40000 ALTER TABLE `sms` DISABLE KEYS */;
INSERT INTO `sms` VALUES (1,'register','57314823','186059',0,'103.144.8.91',0);
/*!40000 ALTER TABLE `sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `time_out` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `lang` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES (18,'5cf0c747cda73b9584b1bbcf3e37a5e0',1691543742,9,'zh'),(24,'b8ed1680fc4c8333e4326909b133f664',1691563172,11,'zh'),(25,'d23d32cfe94a11152b837aec6ce4abbb',1691564252,10,'zh'),(26,'f55bb5c3e4fc494749878899b577317b',1691564839,8,'en'),(28,'f2b1d6fbd6d148b80adf9541ce2a2be6',1691574625,3,'en');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL DEFAULT '0',
  `currency` int(11) NOT NULL DEFAULT '0',
  `to_user_id` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `number` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `remarks` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `price` decimal(20,5) NOT NULL DEFAULT '0.00000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_complete`
--

DROP TABLE IF EXISTS `transaction_complete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_complete` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `way` tinyint(4) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `price` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `number` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `currency` int(11) NOT NULL DEFAULT '0',
  `from_user_id` int(11) NOT NULL DEFAULT '0',
  `legal` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_complete`
--

LOCK TABLES `transaction_complete` WRITE;
/*!40000 ALTER TABLE `transaction_complete` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_complete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_in`
--

DROP TABLE IF EXISTS `transaction_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `price` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `number` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `currency` int(11) NOT NULL DEFAULT '0',
  `legal` int(11) NOT NULL DEFAULT '0',
  `total_number` decimal(20,8) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='币币交易买记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_in`
--

LOCK TABLES `transaction_in` WRITE;
/*!40000 ALTER TABLE `transaction_in` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_in` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_out`
--

DROP TABLE IF EXISTS `transaction_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_out` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `price` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `number` decimal(20,5) NOT NULL DEFAULT '0.00000',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `currency` int(11) NOT NULL DEFAULT '0',
  `legal` int(11) NOT NULL DEFAULT '0',
  `total_number` decimal(20,8) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='币币交易卖记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_out`
--

LOCK TABLES `transaction_out` WRITE;
/*!40000 ALTER TABLE `transaction_out` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_out` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_algebra`
--

DROP TABLE IF EXISTS `user_algebra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_algebra` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `touch_user_id` int(11) NOT NULL COMMENT '触发者',
  `algebra` int(11) NOT NULL,
  `value` decimal(25,8) NOT NULL,
  `info` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_algebra`
--

LOCK TABLES `user_algebra` WRITE;
/*!40000 ALTER TABLE `user_algebra` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_algebra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_cash_info`
--

DROP TABLE IF EXISTS `user_cash_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_cash_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `bank_id` int(10) DEFAULT NULL COMMENT '银行id',
  `bank_name` varchar(60) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '银行名称',
  `bank_branch` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '支行',
  `bank_account` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '银行账号',
  `real_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '真实姓名',
  `alipay_account` varchar(60) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '支付宝账号',
  `wechat_nickname` varchar(60) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '微信昵称',
  `wechat_account` varchar(60) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '微信账号',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `alipay_qr_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '支付宝二维码',
  `wechat_qr_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '微信二维码',
  `bank_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '银行地址',
  `swift_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'swift 代码',
  `residence_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '居然地址',
  `postal_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮政编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户银行绑卡';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cash_info`
--

LOCK TABLES `user_cash_info` WRITE;
/*!40000 ALTER TABLE `user_cash_info` DISABLE KEYS */;
INSERT INTO `user_cash_info` VALUES (2,3,NULL,'',NULL,'','','','','',0,'','',NULL,NULL,NULL,NULL),(3,4,NULL,'',NULL,'','','','','',0,'','',NULL,NULL,NULL,NULL),(4,9,NULL,'',NULL,'','','','','',0,'','',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_cash_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_chat`
--

DROP TABLE IF EXISTS `user_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_chat` (
  `id` int(11) NOT NULL,
  `from_user_id` int(11) NOT NULL DEFAULT '0',
  `to_user_id` int(11) NOT NULL DEFAULT '0',
  `content` varchar(500) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `offline` tinyint(4) NOT NULL DEFAULT '0',
  `type` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `add_time` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_chat`
--

LOCK TABLES `user_chat` WRITE;
/*!40000 ALTER TABLE `user_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_login_info`
--

DROP TABLE IF EXISTS `user_login_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login_info` (
  `user_id` int(10) unsigned NOT NULL COMMENT 'user表中的Id号',
  `last_ipaddr` varchar(255) DEFAULT NULL COMMENT '最后登录的ip地址',
  `last_ipaddr_info` varchar(255) DEFAULT NULL COMMENT 'ip地址对应的信息',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后在线时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='记录用户上次登录时间\\ip';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_login_info`
--

LOCK TABLES `user_login_info` WRITE;
/*!40000 ALTER TABLE `user_login_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_login_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profiles`
--

DROP TABLE IF EXISTS `user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `card_id` varchar(32) NOT NULL DEFAULT '' COMMENT '证件号码',
  `front_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '身份证正面',
  `reverse_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '身份证反面',
  `hand_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '手持身份证',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户实名';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profiles`
--

LOCK TABLES `user_profiles` WRITE;
/*!40000 ALTER TABLE `user_profiles` DISABLE KEYS */;
INSERT INTO `user_profiles` VALUES (1,1,'','','','','','2022-10-25 12:48:25','2022-10-25 12:48:25'),(2,2,'','','','','','2022-10-25 12:51:25','2022-10-25 12:51:25'),(3,3,'','','','','','2023-05-28 18:48:20','2023-05-28 18:48:20'),(4,4,'','','','','','2023-05-30 06:46:36','2023-05-30 06:46:36'),(5,5,'','','','','','2023-07-24 19:24:49','2023-07-24 19:24:49'),(6,6,'','','','','','2023-07-24 20:28:23','2023-07-24 20:28:23'),(7,7,'','','','','','2023-08-07 17:05:40','2023-08-07 17:05:40'),(8,8,'','','','','','2023-08-07 17:08:00','2023-08-07 17:08:00'),(9,9,'','','','','','2023-08-08 01:15:25','2023-08-08 01:15:25'),(10,10,'','','','','','2023-08-08 05:35:43','2023-08-08 05:35:43'),(11,11,'','','','','','2023-08-08 06:38:58','2023-08-08 06:38:58');
/*!40000 ALTER TABLE `user_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_real`
--

DROP TABLE IF EXISTS `user_real`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_real` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `card_id` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '身份证号码',
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '国家',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '1初级认证 2高级认证',
  `review_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1,未审核2,已审核',
  `front_pic` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '正面照片',
  `reverse_pic` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '反面照片',
  `hand_pic` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '手持照片',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '提交时间',
  `review_time` int(11) NOT NULL DEFAULT '0' COMMENT '审核时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户实名认证';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_real`
--

LOCK TABLES `user_real` WRITE;
/*!40000 ALTER TABLE `user_real` DISABLE KEYS */;
INSERT INTO `user_real` VALUES (3,3,'111','111','71',1,2,'','','',1685363337,0),(4,6,'dsdjsd','12135484561','44444',2,2,'https://eme.plus/upload/1690231013220366.png','https://eme.plus/upload/1690231031433572.png','https://eme.plus/upload/1690231046885534.png',1690230970,0),(5,9,'李詩涵','454545454545','中国香港',2,2,'https://capitalone1.vip/upload/1691476081945788.jpg','https://capitalone1.vip/upload/1691476084619744.jpg','https://capitalone1.vip/upload/1691476088510170.jpg',1691475563,0),(6,10,'陈玲玲','23456789','中国香港',1,2,'','','',1691475996,0),(7,8,'李国良','370829198910110310','China',1,1,'','','',1691478784,0);
/*!40000 ALTER TABLE `user_real` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_real_high`
--

DROP TABLE IF EXISTS `user_real_high`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_real_high` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `passport_id` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '护照证件号',
  `jiashi_id` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '驾驶证号',
  `review_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1,未审核2,已审核',
  `front_pic` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '手持证件照',
  `passport_pic` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '护照正面照面',
  `jiashi_pic` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '护照正面照面',
  `passport_hand_pic` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '手持护照照片',
  `jiashi_hand_pic` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '手持驾驶证照片',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `review_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_real_user_id_index` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户高级认证';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_real_high`
--

LOCK TABLES `user_real_high` WRITE;
/*!40000 ALTER TABLE `user_real_high` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_real_high` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area_code_id` int(11) NOT NULL DEFAULT '1' COMMENT '国家区号 1默认大陆',
  `area_code` int(10) NOT NULL COMMENT '区号',
  `account_number` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` tinyint(4) NOT NULL DEFAULT '0',
  `phone` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '0表示不是代理商，1以上表示该代理商id',
  `agent_note_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '代理商节点id。当该用户是代理商时该值等于上级代理商Id，当该用户不是代理商时该值等于节点代理商id',
  `parent_id` int(11) DEFAULT '0',
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pay_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `time` int(11) NOT NULL DEFAULT '0',
  `head_portrait` varchar(400) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `extension_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '1，已锁定',
  `gesture_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_auth` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nickname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `wallet_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `is_blacklist` tinyint(4) NOT NULL DEFAULT '0',
  `parents_path` text COLLATE utf8_unicode_ci COMMENT '上级推荐人节点',
  `push_status` int(4) DEFAULT '0' COMMENT '0:未实名认证 1:实名认证  2:直推3人 3:直推5人 4:直推10人  5:直推30人  6:直推50人',
  `candy_number` decimal(10,4) DEFAULT '0.0000' COMMENT '糖果数量',
  `zhitui_real_number` int(11) DEFAULT '0' COMMENT '实名认证过的直推人数',
  `real_teamnumber` int(11) unsigned DEFAULT '0' COMMENT '实名认证通过的团队人数',
  `top_upnumber` decimal(20,6) DEFAULT '0.000000' COMMENT '团队业绩充值金额',
  `is_realname` int(4) NOT NULL DEFAULT '1' COMMENT '1:未实名认证过  2：实名认证过',
  `is_atelier` int(11) NOT NULL DEFAULT '0' COMMENT '是否工作室',
  `new_isreal_time` int(11) DEFAULT '0' COMMENT '最新通过的下级实名认证时间',
  `today_real_teamnumber` int(11) DEFAULT '0' COMMENT '今日新增团队实名认证人数',
  `today_LegalDealCancel_num` int(4) DEFAULT '0' COMMENT '今天c2c订单已经取消次数',
  `LegalDealCancel_num__update_time` int(11) DEFAULT NULL COMMENT 'c2c取消单子更新时间',
  `risk` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1.亏损,0.正常,1.盈利',
  `lock_time` int(11) NOT NULL DEFAULT '0' COMMENT '锁定时间',
  `level` int(25) DEFAULT '0' COMMENT '代数',
  `fund` decimal(30,8) DEFAULT '0.00000000' COMMENT '秒合约资产',
  `is_service` tinyint(4) unsigned DEFAULT '0' COMMENT '是否是客服',
  `agent_path` varchar(2048) COLLATE utf8_unicode_ci DEFAULT '1' COMMENT '代理商关系',
  `wallet_pwd` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nationality` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login_ip` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `score` decimal(10,2) DEFAULT '0.00',
  `value` int(5) NOT NULL DEFAULT '100' COMMENT '信用分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='会员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (3,0,1,'timibbs.net@gmail.com',0,'',0,1,3,'timibbs.net@gmail.com','6e20b1394f05e1f9188ffff90147b4eb','',1685299700,'https://eme.plus/mobile/images/user_head.png','09tq',0,'','','','',0,'3',0,0.0000,0,0,0.000000,2,0,0,0,0,NULL,0,0,0,100000.00000000,0,'1','',NULL,NULL,NULL,'163.53.18.24',0.00,100),(4,0,1,'yicheng@defi-ldmp.com',0,'',0,1,0,'yicheng@defi-ldmp.com','649223377881a3f5c4da5d7077be1f00','',1685429196,'https://eme.plus/mobile/images/user_head.png','z82h',0,'','','','',0,'',0,0.0000,0,0,0.000000,1,0,0,0,0,NULL,0,0,0,0.00000000,0,'1','',NULL,NULL,NULL,'150.129.43.178',0.00,100),(5,0,0,'aa123123@qq.com',0,'',0,1,0,'aa123123@qq.com','1d666c50ac546f62673facaf9feb802e','',1690226689,'https://eme.plus/mobile/images/user_head.png','c420',0,'','','','',0,'',0,0.0000,0,0,0.000000,1,0,0,0,0,NULL,0,0,0,0.00000000,0,'1','',NULL,NULL,NULL,'45.158.182.111',0.00,100),(6,0,0,'aa123@gmail.com',0,'',0,1,0,'aa123@gmail.com','1d666c50ac546f62673facaf9feb802e','',1690230503,'https://eme.plus/mobile/images/user_head.png','zzba',0,'','','','',0,'',0,0.0000,0,0,0.000000,2,0,0,0,0,NULL,0,0,0,0.00000000,0,'1','',NULL,NULL,NULL,'103.211.229.226',0.00,100),(7,0,1,'lixiaobai8899@gmail.com',0,'',0,1,0,'lixiaobai8899@gmail.com','dcfecee6bfbec54fd109e61fd70d852b','',1691427940,'https://capitalone1.vip/mobile/images/user_head.png','yhyv',0,'','','','',0,'',0,0.0000,0,0,0.000000,1,0,0,0,0,NULL,0,0,0,0.00000000,0,'1','',NULL,NULL,NULL,NULL,0.00,100),(8,0,852,'57314823',0,'57314823',0,1,0,'','dcfecee6bfbec54fd109e61fd70d852b','6e20b1394f05e1f9188ffff90147b4eb',1691428080,'https://capitalone1.vip/mobile/images/user_head.png','imbr',0,'','','','',0,'',0,0.0000,0,0,0.000000,1,0,0,0,0,NULL,0,0,0,0.00000000,0,'1','',NULL,NULL,NULL,'103.144.8.91',0.00,100),(9,0,1,'annalie195@gmail.com',0,'',0,1,0,'annalie195@gmail.com','f9a085b3f4bf138f5455bdce94c857b3','6e20b1394f05e1f9188ffff90147b4eb',1691457325,'https://capitalone1.vip/mobile/images/user_head.png','woip',0,'','','','',0,'',0,0.0000,0,0,0.000000,2,0,0,0,0,NULL,0,0,0,0.00000000,0,'1','',NULL,NULL,NULL,'167.179.57.124',0.00,100),(10,0,1,'chenlingling19950518@gmail.com',0,'',0,1,0,'chenlingling19950518@gmail.com','1d666c50ac546f62673facaf9feb802e','1d666c50ac546f62673facaf9feb802e',1691472943,'https://capitalone1.vip/mobile/images/user_head.png','4ld9',0,'','','','',0,'',0,0.0000,0,0,0.000000,2,0,0,0,0,NULL,0,0,0,0.00000000,0,'1','',NULL,NULL,NULL,'167.179.57.124',0.00,100),(11,0,1,'xiaofei2001225@gmail.com',0,'',0,1,0,'xiaofei2001225@gmail.com','24c02774d613268ec51ff4e7b853698c','',1691476738,'https://capitalone1.vip/mobile/images/user_head.png','u1tq',0,'','','','',0,'',0,0.0000,0,0,0.000000,1,0,0,0,0,NULL,0,0,0,0.00000000,0,'1','',NULL,NULL,NULL,'167.179.57.124',0.00,100);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_insurances`
--

DROP TABLE IF EXISTS `users_insurances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_insurances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `insurance_type_id` mediumint(5) unsigned NOT NULL COMMENT '险种类型id',
  `amount` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '投保金额（受保资产）',
  `insurance_amount` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '购买时的保险资产',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `yielded_at` timestamp NULL DEFAULT NULL COMMENT '生币时间',
  `rescinded_at` timestamp NULL DEFAULT NULL COMMENT '解约时间',
  `rescinded_type` tinyint(4) unsigned DEFAULT '0' COMMENT '解约类型0，自动解约。1，手动解约',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1，生效中。0，已失效。',
  `claim_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否申请理赔中1,是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_insurances`
--

LOCK TABLES `users_insurances` WRITE;
/*!40000 ALTER TABLE `users_insurances` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_insurances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_wallet`
--

DROP TABLE IF EXISTS `users_wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_wallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `currency` int(11) NOT NULL DEFAULT '0',
  `address` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `address_2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '第二类型地址usdt',
  `legal_balance` decimal(25,8) NOT NULL DEFAULT '0.00000000' COMMENT '法币交易余额',
  `lock_legal_balance` decimal(25,8) NOT NULL DEFAULT '0.00000000',
  `change_balance` decimal(25,8) NOT NULL DEFAULT '0.00000000' COMMENT '币币交易余额',
  `lock_change_balance` decimal(25,8) NOT NULL DEFAULT '0.00000000',
  `lever_balance` decimal(25,8) NOT NULL DEFAULT '0.00000000' COMMENT '杠杆交易余额',
  `lever_balance_add_allnum` decimal(25,8) NOT NULL DEFAULT '0.00000000' COMMENT '资产兑换累加产生的杠杆值(作为入金的一部分）',
  `lock_lever_balance` decimal(25,8) NOT NULL DEFAULT '0.00000000',
  `micro_balance` decimal(25,8) NOT NULL DEFAULT '0.00000000' COMMENT '微盘',
  `lock_micro_balance` decimal(25,8) NOT NULL DEFAULT '0.00000000' COMMENT '锁定微盘',
  `insurance_balance` decimal(25,8) NOT NULL DEFAULT '0.00000000' COMMENT '受保资产',
  `lock_insurance_balance` decimal(25,8) NOT NULL DEFAULT '0.00000000' COMMENT '锁定受保资产  保险资产',
  `status` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `old_balance` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `private` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cost` decimal(20,5) NOT NULL DEFAULT '0.00000' COMMENT '持仓成本',
  `gl_time` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `txid` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '交易哈希',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='用户钱包';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_wallet`
--

LOCK TABLES `users_wallet` WRITE;
/*!40000 ALTER TABLE `users_wallet` DISABLE KEYS */;
INSERT INTO `users_wallet` VALUES (1,1,1,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702105,0.00000000,'',0.00000,NULL,''),(2,1,2,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702105,0.00000000,'',0.00000,NULL,''),(3,1,3,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,9765.40000000,0.00000000,0.00000000,0.00000000,0,1666702105,0.00000000,'',0.00000,NULL,''),(4,1,5,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702105,0.00000000,'',0.00000,NULL,''),(5,1,6,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702105,0.00000000,'',0.00000,NULL,''),(6,1,8,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702105,0.00000000,'',0.00000,NULL,''),(7,1,10,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702105,0.00000000,'',0.00000,NULL,''),(8,1,11,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702105,0.00000000,'',0.00000,NULL,''),(9,1,12,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702105,0.00000000,'',0.00000,NULL,''),(10,1,14,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702105,0.00000000,'',0.00000,NULL,''),(11,1,15,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702105,0.00000000,'',0.00000,NULL,''),(12,1,16,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702105,0.00000000,'',0.00000,NULL,''),(13,1,19,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702105,0.00000000,'',0.00000,NULL,''),(14,1,21,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702105,0.00000000,'',0.00000,NULL,''),(15,1,23,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702105,0.00000000,'',0.00000,NULL,''),(16,1,27,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702105,0.00000000,'',0.00000,NULL,''),(17,1,29,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702105,0.00000000,'',0.00000,NULL,''),(18,1,30,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702105,0.00000000,'',0.00000,NULL,''),(19,1,33,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702105,0.00000000,'',0.00000,NULL,''),(20,1,34,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702105,0.00000000,'',0.00000,NULL,''),(21,1,9999,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702105,0.00000000,'',0.00000,NULL,''),(22,2,1,NULL,NULL,0.00000000,0.00000000,86.96613729,10.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702285,0.00000000,'',0.00000,NULL,''),(23,2,2,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702285,0.00000000,'',0.00000,NULL,''),(24,2,3,NULL,NULL,0.00000000,0.00000000,7923550.02530697,1100.00000000,100000.00000000,0.00000000,0.00000000,100099930.00000000,0.00000000,0.00000000,0.00000000,0,1666702285,0.00000000,'',0.00000,NULL,''),(25,2,5,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702285,0.00000000,'',0.00000,NULL,''),(26,2,6,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702285,0.00000000,'',0.00000,NULL,''),(27,2,8,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702285,0.00000000,'',0.00000,NULL,''),(28,2,10,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702285,0.00000000,'',0.00000,NULL,''),(29,2,11,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702285,0.00000000,'',0.00000,NULL,''),(30,2,12,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702285,0.00000000,'',0.00000,NULL,''),(31,2,14,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702285,0.00000000,'',0.00000,NULL,''),(32,2,15,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702285,0.00000000,'',0.00000,NULL,''),(33,2,16,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702285,0.00000000,'',0.00000,NULL,''),(34,2,19,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702285,0.00000000,'',0.00000,NULL,''),(35,2,21,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702285,0.00000000,'',0.00000,NULL,''),(36,2,23,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702285,0.00000000,'',0.00000,NULL,''),(37,2,27,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702285,0.00000000,'',0.00000,NULL,''),(38,2,29,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702285,0.00000000,'',0.00000,NULL,''),(39,2,30,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702285,0.00000000,'',0.00000,NULL,''),(40,2,33,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702285,0.00000000,'',0.00000,NULL,''),(41,2,34,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702285,0.00000000,'',0.00000,NULL,''),(42,2,9999,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1666702285,0.00000000,'',0.00000,NULL,''),(43,3,1,NULL,NULL,0.00000000,0.00000000,10.99780000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1685299700,0.00000000,'',0.00000,NULL,''),(44,3,2,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1685299700,0.00000000,'',0.00000,NULL,''),(45,3,3,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,999.80000000,0.00000000,0.00000000,66069.93000000,0.00000000,0.00000000,0.00000000,0,1685299700,0.00000000,'',0.00000,NULL,''),(46,3,5,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1685299700,0.00000000,'',0.00000,NULL,''),(47,3,6,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1685299700,0.00000000,'',0.00000,NULL,''),(48,3,8,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1685299700,0.00000000,'',0.00000,NULL,''),(49,3,10,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1685299700,0.00000000,'',0.00000,NULL,''),(50,3,11,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1685299700,0.00000000,'',0.00000,NULL,''),(51,3,12,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1685299700,0.00000000,'',0.00000,NULL,''),(52,3,14,NULL,NULL,0.00000000,0.00000000,1009.79800000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1685299700,0.00000000,'',0.00000,NULL,''),(53,3,15,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1685299700,0.00000000,'',0.00000,NULL,''),(54,3,16,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1685299700,0.00000000,'',0.00000,NULL,''),(55,3,19,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1685299700,0.00000000,'',0.00000,NULL,''),(56,3,21,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1685299700,0.00000000,'',0.00000,NULL,''),(57,3,23,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1685299700,0.00000000,'',0.00000,NULL,''),(58,3,27,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1685299700,0.00000000,'',0.00000,NULL,''),(59,3,29,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1685299700,0.00000000,'',0.00000,NULL,''),(60,3,30,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1685299700,0.00000000,'',0.00000,NULL,''),(61,3,34,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1685299700,0.00000000,'',0.00000,NULL,''),(62,3,9999,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1685299700,0.00000000,'',0.00000,NULL,''),(63,4,1,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1685429196,0.00000000,'',0.00000,NULL,''),(64,4,2,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1685429196,0.00000000,'',0.00000,NULL,''),(65,4,3,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,1000.00000000,0.00000000,0.00000000,0.00000000,0,1685429196,0.00000000,'',0.00000,NULL,''),(66,4,4,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1685429196,0.00000000,'',0.00000,NULL,''),(67,4,6,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1685429196,0.00000000,'',0.00000,NULL,''),(68,5,1,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690226689,0.00000000,'',0.00000,NULL,''),(69,5,2,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690226689,0.00000000,'',0.00000,NULL,''),(70,5,3,NULL,NULL,0.00000000,0.00000000,99982.79568454,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690226689,0.00000000,'',0.00000,NULL,''),(71,5,4,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690226689,0.00000000,'',0.00000,NULL,''),(72,5,5,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690226689,0.00000000,'',0.00000,NULL,''),(73,5,6,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690226689,0.00000000,'',0.00000,NULL,''),(74,5,8,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690226689,0.00000000,'',0.00000,NULL,''),(75,5,10,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690226689,0.00000000,'',0.00000,NULL,''),(76,5,11,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690226689,0.00000000,'',0.00000,NULL,''),(77,5,12,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690226689,0.00000000,'',0.00000,NULL,''),(78,5,14,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690226689,0.00000000,'',0.00000,NULL,''),(79,5,15,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690226689,0.00000000,'',0.00000,NULL,''),(80,5,16,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690226689,0.00000000,'',0.00000,NULL,''),(81,5,19,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690226689,0.00000000,'',0.00000,NULL,''),(82,5,21,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690226689,0.00000000,'',0.00000,NULL,''),(83,5,23,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690226689,0.00000000,'',0.00000,NULL,''),(84,5,27,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690226689,0.00000000,'',0.00000,NULL,''),(85,5,29,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690226689,0.00000000,'',0.00000,NULL,''),(86,5,30,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690226689,0.00000000,'',0.00000,NULL,''),(87,5,33,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690226689,0.00000000,'',0.00000,NULL,''),(88,5,34,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690226689,0.00000000,'',0.00000,NULL,''),(89,5,9999,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690226689,0.00000000,'',0.00000,NULL,''),(90,6,1,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690230503,0.00000000,'',0.00000,NULL,''),(91,6,2,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690230503,0.00000000,'',0.00000,NULL,''),(92,6,3,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,95000.00000000,0.00000000,0.00000000,0.00000000,0,1690230503,0.00000000,'',0.00000,NULL,''),(93,6,4,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690230503,0.00000000,'',0.00000,NULL,''),(94,6,5,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690230503,0.00000000,'',0.00000,NULL,''),(95,6,6,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690230503,0.00000000,'',0.00000,NULL,''),(96,6,8,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690230503,0.00000000,'',0.00000,NULL,''),(97,6,10,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690230503,0.00000000,'',0.00000,NULL,''),(98,6,11,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690230503,0.00000000,'',0.00000,NULL,''),(99,6,12,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690230503,0.00000000,'',0.00000,NULL,''),(100,6,14,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690230503,0.00000000,'',0.00000,NULL,''),(101,6,15,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690230503,0.00000000,'',0.00000,NULL,''),(102,6,16,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690230503,0.00000000,'',0.00000,NULL,''),(103,6,19,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690230503,0.00000000,'',0.00000,NULL,''),(104,6,21,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690230503,0.00000000,'',0.00000,NULL,''),(105,6,23,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690230503,0.00000000,'',0.00000,NULL,''),(106,6,27,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690230503,0.00000000,'',0.00000,NULL,''),(107,6,29,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690230503,0.00000000,'',0.00000,NULL,''),(108,6,30,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690230503,0.00000000,'',0.00000,NULL,''),(109,6,33,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690230503,0.00000000,'',0.00000,NULL,''),(110,6,34,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690230503,0.00000000,'',0.00000,NULL,''),(111,6,9999,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1690230503,0.00000000,'',0.00000,NULL,''),(112,7,1,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691427940,0.00000000,'',0.00000,NULL,''),(113,7,2,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691427940,0.00000000,'',0.00000,NULL,''),(114,7,3,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691427940,0.00000000,'',0.00000,NULL,''),(115,7,5,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691427940,0.00000000,'',0.00000,NULL,''),(116,7,6,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691427940,0.00000000,'',0.00000,NULL,''),(117,7,8,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691427940,0.00000000,'',0.00000,NULL,''),(118,7,10,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691427940,0.00000000,'',0.00000,NULL,''),(119,7,11,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691427940,0.00000000,'',0.00000,NULL,''),(120,7,12,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691427940,0.00000000,'',0.00000,NULL,''),(121,7,14,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691427940,0.00000000,'',0.00000,NULL,''),(122,7,15,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691427940,0.00000000,'',0.00000,NULL,''),(123,7,16,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691427940,0.00000000,'',0.00000,NULL,''),(124,7,19,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691427940,0.00000000,'',0.00000,NULL,''),(125,7,21,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691427940,0.00000000,'',0.00000,NULL,''),(126,7,23,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691427940,0.00000000,'',0.00000,NULL,''),(127,7,27,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691427940,0.00000000,'',0.00000,NULL,''),(128,7,29,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691427940,0.00000000,'',0.00000,NULL,''),(129,7,30,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691427940,0.00000000,'',0.00000,NULL,''),(130,7,33,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691427940,0.00000000,'',0.00000,NULL,''),(131,7,34,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691427940,0.00000000,'',0.00000,NULL,''),(132,8,1,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691428080,0.00000000,'',0.00000,NULL,''),(133,8,2,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691428080,0.00000000,'',0.00000,NULL,''),(134,8,3,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,10000.00000000,0.00000000,0.00000000,0.00000000,0,1691428080,0.00000000,'',0.00000,NULL,''),(135,8,5,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691428080,0.00000000,'',0.00000,NULL,''),(136,8,6,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691428080,0.00000000,'',0.00000,NULL,''),(137,8,8,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691428080,0.00000000,'',0.00000,NULL,''),(138,8,10,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691428080,0.00000000,'',0.00000,NULL,''),(139,8,11,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691428080,0.00000000,'',0.00000,NULL,''),(140,8,12,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691428080,0.00000000,'',0.00000,NULL,''),(141,8,14,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691428080,0.00000000,'',0.00000,NULL,''),(142,8,15,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691428080,0.00000000,'',0.00000,NULL,''),(143,8,16,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691428080,0.00000000,'',0.00000,NULL,''),(144,8,19,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691428080,0.00000000,'',0.00000,NULL,''),(145,8,21,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691428080,0.00000000,'',0.00000,NULL,''),(146,8,23,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691428080,0.00000000,'',0.00000,NULL,''),(147,8,27,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691428080,0.00000000,'',0.00000,NULL,''),(148,8,29,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691428080,0.00000000,'',0.00000,NULL,''),(149,8,30,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691428080,0.00000000,'',0.00000,NULL,''),(150,8,33,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691428080,0.00000000,'',0.00000,NULL,''),(151,8,34,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691428080,0.00000000,'',0.00000,NULL,''),(152,9,1,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691457325,0.00000000,'',0.00000,NULL,''),(153,9,2,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691457325,0.00000000,'',0.00000,NULL,''),(154,9,3,NULL,NULL,0.00000000,0.00000000,5000.00000000,0.00000000,0.00000000,0.00000000,0.00000000,90000.00000000,0.00000000,0.00000000,0.00000000,0,1691457325,0.00000000,'',0.00000,NULL,''),(155,9,5,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691457325,0.00000000,'',0.00000,NULL,''),(156,9,6,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691457325,0.00000000,'',0.00000,NULL,''),(157,9,8,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691457325,0.00000000,'',0.00000,NULL,''),(158,9,10,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691457325,0.00000000,'',0.00000,NULL,''),(159,9,11,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691457325,0.00000000,'',0.00000,NULL,''),(160,9,12,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691457325,0.00000000,'',0.00000,NULL,''),(161,9,14,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691457325,0.00000000,'',0.00000,NULL,''),(162,9,15,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691457325,0.00000000,'',0.00000,NULL,''),(163,9,16,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691457325,0.00000000,'',0.00000,NULL,''),(164,9,19,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691457325,0.00000000,'',0.00000,NULL,''),(165,9,21,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691457325,0.00000000,'',0.00000,NULL,''),(166,9,23,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691457325,0.00000000,'',0.00000,NULL,''),(167,9,27,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691457325,0.00000000,'',0.00000,NULL,''),(168,9,29,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691457325,0.00000000,'',0.00000,NULL,''),(169,9,30,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691457325,0.00000000,'',0.00000,NULL,''),(170,9,33,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691457325,0.00000000,'',0.00000,NULL,''),(171,9,34,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691457325,0.00000000,'',0.00000,NULL,''),(172,10,1,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691472943,0.00000000,'',0.00000,NULL,''),(173,10,2,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691472943,0.00000000,'',0.00000,NULL,''),(174,10,3,NULL,NULL,0.00000000,0.00000000,45000.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691472943,0.00000000,'',0.00000,NULL,''),(175,10,5,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691472943,0.00000000,'',0.00000,NULL,''),(176,10,6,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691472943,0.00000000,'',0.00000,NULL,''),(177,10,8,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691472943,0.00000000,'',0.00000,NULL,''),(178,10,10,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691472943,0.00000000,'',0.00000,NULL,''),(179,10,11,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691472943,0.00000000,'',0.00000,NULL,''),(180,10,12,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691472943,0.00000000,'',0.00000,NULL,''),(181,10,14,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691472943,0.00000000,'',0.00000,NULL,''),(182,10,15,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691472943,0.00000000,'',0.00000,NULL,''),(183,10,16,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691472943,0.00000000,'',0.00000,NULL,''),(184,10,19,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691472943,0.00000000,'',0.00000,NULL,''),(185,10,21,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691472943,0.00000000,'',0.00000,NULL,''),(186,10,23,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691472943,0.00000000,'',0.00000,NULL,''),(187,10,27,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691472943,0.00000000,'',0.00000,NULL,''),(188,10,29,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691472943,0.00000000,'',0.00000,NULL,''),(189,10,30,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691472943,0.00000000,'',0.00000,NULL,''),(190,10,33,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691472943,0.00000000,'',0.00000,NULL,''),(191,10,34,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691472943,0.00000000,'',0.00000,NULL,''),(192,11,1,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691476738,0.00000000,'',0.00000,NULL,''),(193,11,2,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691476738,0.00000000,'',0.00000,NULL,''),(194,11,3,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691476738,0.00000000,'',0.00000,NULL,''),(195,11,5,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691476738,0.00000000,'',0.00000,NULL,''),(196,11,6,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691476738,0.00000000,'',0.00000,NULL,''),(197,11,8,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691476738,0.00000000,'',0.00000,NULL,''),(198,11,10,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691476738,0.00000000,'',0.00000,NULL,''),(199,11,11,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691476738,0.00000000,'',0.00000,NULL,''),(200,11,12,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691476738,0.00000000,'',0.00000,NULL,''),(201,11,14,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691476738,0.00000000,'',0.00000,NULL,''),(202,11,15,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691476738,0.00000000,'',0.00000,NULL,''),(203,11,16,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691476738,0.00000000,'',0.00000,NULL,''),(204,11,19,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691476738,0.00000000,'',0.00000,NULL,''),(205,11,21,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691476738,0.00000000,'',0.00000,NULL,''),(206,11,23,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691476738,0.00000000,'',0.00000,NULL,''),(207,11,27,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691476738,0.00000000,'',0.00000,NULL,''),(208,11,29,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691476738,0.00000000,'',0.00000,NULL,''),(209,11,30,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691476738,0.00000000,'',0.00000,NULL,''),(210,11,33,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691476738,0.00000000,'',0.00000,NULL,''),(211,11,34,NULL,NULL,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0.00000000,0,1691476738,0.00000000,'',0.00000,NULL,'');
/*!40000 ALTER TABLE `users_wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_wallet_out`
--

DROP TABLE IF EXISTS `users_wallet_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_wallet_out` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `currency` int(11) NOT NULL DEFAULT '0',
  `address` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nettype` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '通道',
  `number` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `rate` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8_unicode_ci NOT NULL,
  `real_number` decimal(20,8) NOT NULL DEFAULT '0.00000000',
  `txid` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '链上哈希',
  `verificationcode` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `update_time` int(11) DEFAULT NULL,
  `is_bank` tinyint(1) NOT NULL DEFAULT '0' COMMENT ' 1银行卡  0普通',
  `tibi_rmb` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '提币金额 rmb',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='提币记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_wallet_out`
--

LOCK TABLES `users_wallet_out` WRITE;
/*!40000 ALTER TABLE `users_wallet_out` DISABLE KEYS */;
INSERT INTO `users_wallet_out` VALUES (1,1,3,'TRGYyuYpb8zs6F9D1THUQcrn4dzD2QZvRx',NULL,100.00000000,1666753580,1.0000,2,'',99.00000000,'','',1666753659,0,0.00000000),(2,2,1,'111111111',NULL,10.00000000,1666755479,0.0010,1,'',9.99900000,'','',NULL,0,0.00000000),(3,2,3,'--',NULL,100.00000000,1666755784,1.0000,1,'',99.00000000,'','',NULL,1,0.00000000),(4,2,3,'--',NULL,1000.00000000,1666755827,10.0000,1,'',990.00000000,'','',NULL,1,0.00000000);
/*!40000 ALTER TABLE `users_wallet_out` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_address_log`
--

DROP TABLE IF EXISTS `wallet_address_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallet_address_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ctime` int(10) unsigned DEFAULT NULL,
  `old_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `currency_id` int(10) DEFAULT NULL,
  `manager_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_address_log`
--

LOCK TABLES `wallet_address_log` WRITE;
/*!40000 ALTER TABLE `wallet_address_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallet_address_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet_log`
--

DROP TABLE IF EXISTS `wallet_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallet_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `from_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '触发者id',
  `account_log_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联account_log',
  `wallet_id` int(11) NOT NULL DEFAULT '0' COMMENT '钱包id',
  `balance_type` int(11) NOT NULL DEFAULT '0' COMMENT '余额类型:1.法币,2.币币,3.杆杠',
  `lock_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否锁定',
  `before` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '原余额',
  `change` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '变动余额',
  `after` decimal(20,8) NOT NULL DEFAULT '0.00000000' COMMENT '当前余额',
  `memo` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  `extra_sign` int(11) NOT NULL DEFAULT '0' COMMENT '扩展标识',
  `extra_data` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '扩展数据',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '发生时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='钱包流水';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet_log`
--

LOCK TABLES `wallet_log` WRITE;
/*!40000 ALTER TABLE `wallet_log` DISABLE KEYS */;
INSERT INTO `wallet_log` VALUES (1,1,0,1,3,2,0,0.00000000,1000.00000000,1000.00000000,'链上充币',0,'',1666702458),(2,2,0,2,24,2,0,0.00000000,9999999.99999999,9999999.99999999,'链上充币',0,'',1666702660),(3,0,0,3,3,4,0,0.00000000,9999.00000000,9999.00000000,'后台调节期权账户余额:00',0,'',1666702857),(4,1,0,4,3,4,0,9999.00000000,-55.00000000,9944.00000000,'秒合约下单扣除本金',0,'',1666703114),(5,2,0,5,24,2,0,9999999.99999999,-2499999.99836132,7500000.00163867,'币币交易下单，资金冻结',0,'',1666703171),(6,2,0,6,24,2,1,0.00000000,2499999.99836132,2499999.99836132,'币币交易下单，冻结资金增加',0,'a:0:{}',1666703171),(7,2,0,7,24,2,1,2499999.99836132,-2499999.99836132,0.00000000,'币币交易成功，冻结资金减少',0,'a:0:{}',1666703172),(8,2,0,8,22,2,0,0.00000000,129.28818299,129.28818299,'币币交易成功',0,'',1666703172),(9,2,0,9,22,2,0,129.28818299,-32.32204570,96.96613729,'币币交易下单，资金冻结',0,'',1666703182),(10,2,0,10,22,2,1,0.00000000,32.32204570,32.32204570,'币币交易下单，冻结资金增加',0,'a:0:{}',1666703182),(11,2,0,11,22,2,1,32.32204570,-32.32204570,0.00000000,'币币交易冻结减少',0,'a:0:{}',1666703194),(12,2,0,12,24,2,0,7500000.00163867,624750.02366830,8124750.02530697,'币币交易成功',0,'',1666703194),(13,1,0,13,3,4,0,9944.00000000,-111.00000000,9833.00000000,'秒合约下单扣除本金',0,'',1666703582),(14,0,0,14,24,4,0,0.00000000,100000000.00000000,100000000.00000000,'后台调节期权账户余额:1',0,'',1666704678),(15,2,0,15,24,2,0,8124750.02530697,-100000.00000000,8024750.02530697,'币币划转合约',0,'',1666704756),(16,2,0,16,24,3,0,0.00000000,100000.00000000,100000.00000000,'币币划转合约',0,'',1666704756),(17,2,0,17,24,2,0,8024750.02530697,-100000.00000000,7924750.02530697,'币币划转期权',0,'',1666704789),(18,2,0,18,24,4,0,100000000.00000000,100000.00000000,100100000.00000000,'币币划转期权',0,'',1666704789),(19,2,0,19,24,2,0,7924750.02530697,-100.00000000,7924650.02530697,'锁仓',0,'a:0:{}',1666704799),(20,2,0,20,24,4,0,100100000.00000000,-100.00000000,100099900.00000000,'秒合约下单扣除本金',0,'',1666704885),(21,1,0,21,3,2,0,1000.00000000,-1000.00000000,0.00000000,'锁仓',0,'a:0:{}',1666707977),(22,1,0,22,3,4,0,9833.00000000,77.00000000,9910.00000000,'秒合约订单平仓,盈利结算',0,'订单号1',1666713766),(23,1,0,23,3,4,0,9910.00000000,155.40000000,10065.40000000,'秒合约订单平仓,盈利结算',0,'订单号2',1666713766),(24,2,0,24,24,4,0,100099900.00000000,140.00000000,100100040.00000000,'秒合约订单平仓,盈利结算',0,'订单号3',1666713766),(25,2,0,25,24,4,0,100100040.00000000,-100.00000000,100099940.00000000,'秒合约下单扣除本金',0,'',1666715134),(26,1,0,26,3,4,0,10065.40000000,-100.00000000,9965.40000000,'秒合约下单扣除本金',0,'',1666716913),(27,1,0,27,3,4,0,9965.40000000,-100.00000000,9865.40000000,'秒合约下单扣除本金',0,'',1666751216),(28,1,0,28,3,4,0,9865.40000000,-100.00000000,9765.40000000,'期权划转币币',0,'',1666753561),(29,1,0,29,3,2,0,0.00000000,100.00000000,100.00000000,'期权划转币币',0,'',1666753561),(30,1,0,30,3,2,0,100.00000000,-100.00000000,0.00000000,'申请提币扣除余额',0,'',1666753580),(31,1,0,31,3,2,1,0.00000000,100.00000000,100.00000000,'申请提币冻结余额',0,'',1666753580),(32,1,0,32,3,2,1,100.00000000,-100.00000000,0.00000000,'提币成功',0,'',1666753659),(33,2,0,33,24,4,0,100099940.00000000,-10.00000000,100099930.00000000,'秒合约下单扣除本金',0,'',1666754989),(34,2,0,34,22,2,0,96.96613729,-10.00000000,86.96613729,'申请提币扣除余额',0,'',1666755479),(35,2,0,35,22,2,1,0.00000000,10.00000000,10.00000000,'申请提币冻结余额',0,'',1666755479),(36,2,0,36,24,2,0,7924650.02530697,-100.00000000,7924550.02530697,'申请提币扣除余额',0,'',1666755784),(37,2,0,37,24,2,1,0.00000000,100.00000000,100.00000000,'申请提币冻结余额',0,'',1666755784),(38,2,0,38,24,2,0,7924550.02530697,-1000.00000000,7923550.02530697,'申请提币扣除余额',0,'',1666755827),(39,2,0,39,24,2,1,100.00000000,1000.00000000,1100.00000000,'申请提币冻结余额',0,'',1666755827),(40,3,0,44,45,2,0,0.00000000,100000.00000000,100000.00000000,'链上充币',0,'',1685329707),(41,3,0,1,45,2,0,100000.00000000,-1000.00000000,99000.00000000,'币币划转合约',0,'',1685362962),(42,3,0,2,45,3,0,0.00000000,1000.00000000,1000.00000000,'币币划转合约',0,'',1685362962),(43,3,0,3,45,2,0,99000.00000000,-1000.00000000,98000.00000000,'币币划转合约',0,'',1685363476),(44,3,0,4,45,3,0,1000.00000000,1000.00000000,2000.00000000,'币币划转合约',0,'',1685363476),(45,3,0,5,45,3,0,2000.00000000,-2000.00000000,0.00000000,'合约划转期权',0,'',1685363513),(46,3,0,6,45,4,0,0.00000000,2000.00000000,2000.00000000,'合约划转期权',0,'',1685363513),(47,3,0,7,45,4,0,2000.00000000,-100.00000000,1900.00000000,'秒合约下单扣除本金',0,'',1685363522),(48,3,0,8,45,4,0,1900.00000000,-100.00000000,1800.00000000,'秒合约下单扣除本金',0,'',1685363615),(49,3,0,9,45,4,0,1800.00000000,-300.00000000,1500.00000000,'秒合约下单扣除本金',0,'',1685418116),(50,3,0,10,45,2,0,98000.00000000,-1000.00000000,97000.00000000,'币币划转合约',0,'',1685418474),(51,3,0,11,45,3,0,0.00000000,1000.00000000,1000.00000000,'币币划转合约',0,'',1685418474),(52,0,0,12,65,4,0,0.00000000,1000.00000000,1000.00000000,'后台调节期权账户余额:充值',0,'',1685430472),(53,3,0,13,43,2,0,0.00000000,9.99800000,9.99800000,'币币交易成功',0,'',1685466876),(54,3,0,14,45,2,0,97000.00000000,-27731.34000000,69268.66000000,'币币交易下单，资金冻结',0,'',1685469273),(55,3,0,15,45,2,1,0.00000000,27731.34000000,27731.34000000,'币币交易下单，冻结资金增加',0,'a:0:{}',1685469273),(56,3,0,16,45,2,1,27731.34000000,-27731.34000000,0.00000000,'币币交易成功，冻结资金减少',0,'a:0:{}',1685517433),(57,3,0,17,43,2,0,9.99800000,0.99980000,10.99780000,'币币交易成功',0,'',1685517433),(58,3,0,18,45,4,0,1500.00000000,-100.00000000,1400.00000000,'秒合约下单扣除本金',0,'',1685675762),(59,5,0,19,70,2,0,0.00000000,100000.00000000,100000.00000000,'链上充币',0,'',1690227078),(60,5,0,20,70,2,0,100000.00000000,-100000.00000000,0.00000000,'币币划转合约',0,'',1690227552),(61,5,0,21,70,3,0,0.00000000,100000.00000000,100000.00000000,'币币划转合约',0,'',1690227552),(62,5,0,22,70,3,0,100000.00000000,-100000.00000000,0.00000000,'合约划转期权',0,'',1690227915),(63,5,0,23,70,4,0,0.00000000,100000.00000000,100000.00000000,'合约划转期权',0,'',1690227915),(64,5,0,24,70,4,0,100000.00000000,-100000.00000000,0.00000000,'期权划转币币',0,'',1690228199),(65,5,0,25,70,2,0,0.00000000,100000.00000000,100000.00000000,'期权划转币币',0,'',1690228199),(66,5,0,26,70,2,0,100000.00000000,-29119.26000000,70880.74000000,'币币交易下单，资金冻结',0,'',1690228227),(67,5,0,27,70,2,1,0.00000000,29119.26000000,29119.26000000,'币币交易下单，冻结资金增加',0,'a:0:{}',1690228227),(68,5,0,28,70,2,1,29119.26000000,-29119.26000000,0.00000000,'币币交易成功，冻结资金减少',0,'a:0:{}',1690228375),(69,5,0,29,68,2,0,0.00000000,0.99980000,0.99980000,'币币交易成功',0,'',1690228375),(70,5,0,30,68,2,0,0.99980000,-0.99980000,0.00000000,'币币交易下单，资金冻结',0,'',1690228417),(71,5,0,31,68,2,1,0.00000000,0.99980000,0.99980000,'币币交易下单，冻结资金增加',0,'a:0:{}',1690228417),(72,6,0,32,92,2,0,0.00000000,100000.00000000,100000.00000000,'链上充币',0,'',1690230737),(73,6,0,33,92,2,0,100000.00000000,-100000.00000000,0.00000000,'币币划转合约',0,'',1690230771),(74,6,0,34,92,3,0,0.00000000,100000.00000000,100000.00000000,'币币划转合约',0,'',1690230771),(75,6,0,35,92,3,0,100000.00000000,-100000.00000000,0.00000000,'合约划转币币',0,'',1690230822),(76,6,0,36,92,2,0,0.00000000,100000.00000000,100000.00000000,'合约划转币币',0,'',1690230822),(77,6,0,37,92,2,0,100000.00000000,-100000.00000000,0.00000000,'币币划转期权',0,'',1690230839),(78,6,0,38,92,4,0,0.00000000,100000.00000000,100000.00000000,'币币划转期权',0,'',1690230839),(79,6,0,39,92,4,0,100000.00000000,-5000.00000000,95000.00000000,'秒合约下单扣除本金',0,'',1690231190),(80,5,0,40,68,2,1,0.99980000,-0.99980000,0.00000000,'币币交易冻结减少',0,'a:0:{}',1690258579),(81,5,0,41,70,2,0,70880.74000000,29102.05568454,99982.79568454,'币币交易成功',0,'',1690258579),(82,3,0,42,45,4,0,1400.00000000,-1000.00000000,400.00000000,'秒合约下单扣除本金',0,'',1690819697),(83,3,0,43,45,4,0,400.00000000,-400.00000000,0.00000000,'秒合约下单扣除本金',0,'',1690819949),(84,3,0,44,45,3,0,1000.00000000,-148.57920000,851.42080000,'提交ETH/USDT槓桿交易,價格1857.24000000扣除保證金',0,'a:3:{s:8:\"trade_id\";i:1;s:9:\"all_money\";s:9:\"742.89600\";s:8:\"multiple\";s:1:\"5\";}',1690820145),(85,3,0,45,45,3,0,851.42080000,148.37920000,999.80000000,'平倉資金處理',0,'a:4:{s:8:\"trade_id\";i:1;s:13:\"caution_money\";s:12:\"148.57920000\";s:6:\"profit\";s:11:\"-0.20000000\";s:4:\"diff\";i:0;}',1690820181),(86,3,0,46,45,3,0,999.80000000,-292.30000000,707.50000000,'提交BTC/USDT杠杆交易,价格29230.00000000,扣除保证金',0,'a:3:{s:8:\"trade_id\";i:2;s:9:\"all_money\";s:11:\"29230.00000\";s:8:\"multiple\";s:3:\"100\";}',1690820956),(87,3,0,47,45,2,0,69268.66000000,-2598.73000000,66669.93000000,'币币交易下单，资金冻结',0,'',1690821213),(88,3,0,48,45,2,1,0.00000000,2598.73000000,2598.73000000,'币币交易下单，冻结资金增加',0,'a:0:{}',1690821213),(89,3,0,49,45,3,0,707.50000000,292.30000000,999.80000000,'平仓资金处理',0,'a:4:{s:8:\"trade_id\";i:2;s:13:\"caution_money\";s:12:\"292.30000000\";s:6:\"profit\";s:10:\"0.00000000\";s:4:\"diff\";i:0;}',1690821329),(90,3,0,50,45,2,0,66669.93000000,-10000.00000000,56669.93000000,'币币划转期权',0,'',1690823064),(91,3,0,51,45,4,0,0.00000000,10000.00000000,10000.00000000,'币币划转期权',0,'',1690823064),(92,3,0,52,45,4,0,10000.00000000,-500.00000000,9500.00000000,'秒合约下单扣除本金',0,'',1690823080),(93,3,0,53,45,2,1,2598.73000000,-2598.73000000,0.00000000,'币币交易成功，冻结资金减少',0,'a:0:{}',1691287188),(94,3,0,54,52,2,0,0.00000000,1009.79800000,1009.79800000,'币币交易成功',0,'',1691287189),(95,3,0,55,45,4,0,9500.00000000,-100.00000000,9400.00000000,'秒合约下单扣除本金',0,'',1691287404),(96,3,0,56,45,2,0,56669.93000000,-56669.93000000,0.00000000,'币币划转期权',0,'',1691290880),(97,3,0,57,45,4,0,9400.00000000,56669.93000000,66069.93000000,'币币划转期权',0,'',1691290880),(98,3,0,58,45,4,0,66069.93000000,-66069.93000000,0.00000000,'期权划转币币',0,'',1691291916),(99,3,0,59,45,2,0,0.00000000,66069.93000000,66069.93000000,'期权划转币币',0,'',1691291916),(100,3,0,60,45,2,0,66069.93000000,-66069.93000000,0.00000000,'币币划转期权',0,'',1691298191),(101,3,0,61,45,4,0,0.00000000,66069.93000000,66069.93000000,'币币划转期权',0,'',1691298191),(102,10,0,62,174,2,0,0.00000000,50000.00000000,50000.00000000,'链上充币',0,'',1691475468),(103,9,0,63,154,2,0,0.00000000,100000.00000000,100000.00000000,'链上充币',0,'',1691475531),(104,9,0,64,154,2,0,100000.00000000,-100000.00000000,0.00000000,'币币划转期权',0,'',1691475762),(105,9,0,65,154,4,0,0.00000000,100000.00000000,100000.00000000,'币币划转期权',0,'',1691475762),(106,10,0,66,174,2,0,50000.00000000,-50000.00000000,0.00000000,'币币划转期权',0,'',1691475840),(107,10,0,67,174,4,0,0.00000000,50000.00000000,50000.00000000,'币币划转期权',0,'',1691475840),(108,9,0,68,154,4,0,100000.00000000,-5000.00000000,95000.00000000,'秒合约下单扣除本金',0,'',1691475967),(109,10,0,69,174,4,0,50000.00000000,-50000.00000000,0.00000000,'期权划转币币',0,'',1691476198),(110,10,0,70,174,2,0,0.00000000,50000.00000000,50000.00000000,'期权划转币币',0,'',1691476198),(111,10,0,71,174,2,0,50000.00000000,-50000.00000000,0.00000000,'币币划转期权',0,'',1691476386),(112,10,0,72,174,4,0,0.00000000,50000.00000000,50000.00000000,'币币划转期权',0,'',1691476386),(113,10,0,73,174,4,0,50000.00000000,-5000.00000000,45000.00000000,'秒合约下单扣除本金',0,'',1691476410),(114,9,0,74,154,4,0,95000.00000000,-5000.00000000,90000.00000000,'期权划转币币',0,'',1691477504),(115,9,0,75,154,2,0,0.00000000,5000.00000000,5000.00000000,'期权划转币币',0,'',1691477504),(116,10,0,76,174,4,0,45000.00000000,-45000.00000000,0.00000000,'期权划转币币',0,'',1691478088),(117,10,0,77,174,2,0,0.00000000,45000.00000000,45000.00000000,'期权划转币币',0,'',1691478088),(118,0,0,78,134,4,0,0.00000000,10000.00000000,10000.00000000,'后台调节期权账户余额:1',0,'',1691478538);
/*!40000 ALTER TABLE `wallet_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wealth_product`
--

DROP TABLE IF EXISTS `wealth_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wealth_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wealth_name` varchar(64) NOT NULL COMMENT '产品名字',
  `period` tinyint(4) NOT NULL COMMENT '期限',
  `max_daily_return_rate` decimal(10,2) NOT NULL COMMENT '最多日收益率',
  `min_daily_return_rate` decimal(10,2) NOT NULL COMMENT '最小日收益率',
  `max_single_limit` decimal(10,2) NOT NULL COMMENT '单日最大限额',
  `min_single_limit` decimal(10,2) NOT NULL COMMENT '单日最小限额',
  `reneged` decimal(10,2) NOT NULL COMMENT '违约金比例',
  `status` tinyint(4) NOT NULL COMMENT '产品状态 0正常 1已下架',
  `create_time` bigint(20) NOT NULL COMMENT '添加时间',
  `currency` int(10) NOT NULL COMMENT '币种',
  `nlimit` int(10) NOT NULL COMMENT '每个用户限购次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='理财产品';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wealth_product`
--

LOCK TABLES `wealth_product` WRITE;
/*!40000 ALTER TABLE `wealth_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `wealth_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wealth_transaction`
--

DROP TABLE IF EXISTS `wealth_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wealth_transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `wealth_product_id` int(11) NOT NULL COMMENT '理财产品id',
  `period` tinyint(4) NOT NULL COMMENT '期限',
  `max_daily_return_rate` decimal(10,2) NOT NULL COMMENT '最多日收益率',
  `min_daily_return_rate` decimal(10,2) NOT NULL COMMENT '最小日收益率',
  `caution_money` decimal(20,8) NOT NULL COMMENT '本金',
  `revenue` decimal(20,8) NOT NULL COMMENT '收益',
  `status` tinyint(4) NOT NULL COMMENT '交易状态',
  `expire_time` bigint(20) NOT NULL COMMENT '到期时间',
  `last_calc_time` bigint(20) NOT NULL COMMENT '最后计算收益时间',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='理财交易';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wealth_transaction`
--

LOCK TABLES `wealth_transaction` WRITE;
/*!40000 ALTER TABLE `wealth_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `wealth_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ztpay_log`
--

DROP TABLE IF EXISTS `ztpay_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ztpay_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unique_key` varchar(100) DEFAULT NULL,
  `body` longtext,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ztpay_log`
--

LOCK TABLES `ztpay_log` WRITE;
/*!40000 ALTER TABLE `ztpay_log` DISABLE KEYS */;
INSERT INTO `ztpay_log` VALUES (1,'712184c6ad15279bcec2e452aefc18afeb1c5c0a21788165c021374aeb7138f3','{\"appid\":\"ztpayuvtt1mplmjlcp\",\"name\":\"BTC\",\"name_alias\":\"\",\"time\":\"2020-08-01 11:55:01\",\"sign\":\"DF3F2D08A5A5D6EFD289550493A89732\",\"data\":{\"appid\":\"ztpayuvtt1mplmjlcp\",\"hash\":\"712184c6ad15279bcec2e452aefc18afeb1c5c0a21788165c021374aeb7138f3\",\"from\":\"1DjNaYeNRpL1ag3ezY55uWhGTAkoLLxhGA\",\"to\":\"14qMhQZNMVaHN9ytupxG5tkEnQX8vm9x9u\",\"memo\":null,\"amount\":\"0.00198\",\"fee_amount\":\"0.0008838\",\"add_time\":\"2020-08-01 11:54:01\",\"data\":\"\",\"type\":1,\"state\":1}}','2020-08-01 11:55:01'),(2,'842367c7c157d374c5764944c54061f3edb90be1589f64a0d8f7673741639c27','{\"appid\":\"ztpayuvtt1mplmjlcp\",\"name\":\"BTC\",\"name_alias\":\"\",\"time\":\"2020-08-01 17:07:02\",\"sign\":\"E70E092C548C68D10895B2C6A30403B6\",\"data\":{\"appid\":\"ztpayuvtt1mplmjlcp\",\"hash\":\"842367c7c157d374c5764944c54061f3edb90be1589f64a0d8f7673741639c27\",\"from\":\"13uUqMH1vPc47xomj44sXkv5SbvfCNmeu5\",\"to\":\"14qMhQZNMVaHN9ytupxG5tkEnQX8vm9x9u\",\"memo\":null,\"amount\":\"0.001\",\"fee_amount\":\"0.00024507\",\"add_time\":\"2020-08-01 17:06:01\",\"data\":\"\",\"type\":1,\"state\":1}}','2020-08-01 17:07:02'),(3,'f3f9318306c910db4dc7909c9afda93550f7c1d5afd6509b6643b09a759bf2e6','{\"appid\":\"ztpayuvtt1mplmjlcp\",\"name\":\"BTC\",\"name_alias\":\"\",\"time\":\"2020-08-02 15:52:01\",\"sign\":\"A95C6D33CA8C02EECE640E5315E26BA2\",\"data\":{\"appid\":\"ztpayuvtt1mplmjlcp\",\"hash\":\"f3f9318306c910db4dc7909c9afda93550f7c1d5afd6509b6643b09a759bf2e6\",\"from\":\"13uUqMH1vPc47xomj44sXkv5SbvfCNmeu5\",\"to\":\"14qMhQZNMVaHN9ytupxG5tkEnQX8vm9x9u\",\"memo\":null,\"amount\":\"0.001\",\"fee_amount\":\"0.00036779\",\"add_time\":\"2020-08-02 15:51:01\",\"data\":\"\",\"type\":1,\"state\":1}}','2020-08-02 15:52:01'),(4,'528386f1f93ed6fcb425d44aebd6690844daa28bebb8ae212cc75a79e1e60d93','{\"appid\":\"ztpayuvtt1mplmjlcp\",\"name\":\"BTC\",\"name_alias\":\"\",\"time\":\"2020-08-03 10:25:01\",\"sign\":\"A127E2B6C303F9EFCDD0A4F9D71A4DE7\",\"data\":{\"appid\":\"ztpayuvtt1mplmjlcp\",\"hash\":\"528386f1f93ed6fcb425d44aebd6690844daa28bebb8ae212cc75a79e1e60d93\",\"from\":\"13uUqMH1vPc47xomj44sXkv5SbvfCNmeu5\",\"to\":\"14qMhQZNMVaHN9ytupxG5tkEnQX8vm9x9u\",\"memo\":null,\"amount\":\"0.001\",\"fee_amount\":\"0.00019492\",\"add_time\":\"2020-08-03 10:24:01\",\"data\":\"\",\"type\":1,\"state\":1}}','2020-08-03 10:25:01'),(5,'1413db6a8ae06cbdc2b6d505ba86479131c5f0ed7d875ae832286764dec9e66d','{\"appid\":\"ztpayuvtt1mplmjlcp\",\"name\":\"BTC\",\"name_alias\":\"\",\"time\":\"2020-08-04 11:04:02\",\"sign\":\"08DE96DCC60FBFC44D199BAFACF3B3E1\",\"data\":{\"appid\":\"ztpayuvtt1mplmjlcp\",\"hash\":\"1413db6a8ae06cbdc2b6d505ba86479131c5f0ed7d875ae832286764dec9e66d\",\"from\":\"13uUqMH1vPc47xomj44sXkv5SbvfCNmeu5\",\"to\":\"14qMhQZNMVaHN9ytupxG5tkEnQX8vm9x9u\",\"memo\":null,\"amount\":\"0.001\",\"fee_amount\":\"0.00001222\",\"add_time\":\"2020-08-04 11:03:01\",\"data\":\"\",\"type\":1,\"state\":1}}','2020-08-04 11:04:02');
/*!40000 ALTER TABLE `ztpay_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'timibbs_emejys'
--

--
-- Dumping routines for database 'timibbs_emejys'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-08 18:10:25
