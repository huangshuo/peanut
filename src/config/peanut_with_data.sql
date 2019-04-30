-- --------------------------------------------------------
-- 主机:                           192.168.13.225
-- 服务器版本:                        5.7.22-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 peanut 的数据库结构
CREATE DATABASE IF NOT EXISTS `peanut` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `peanut`;

-- 导出  表 peanut.tb_backend_channel_class_manage 结构
CREATE TABLE IF NOT EXISTS `tb_backend_channel_class_manage` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(30) DEFAULT NULL,
  `label_order` int(30) DEFAULT NULL,
  `fname` varchar(30) DEFAULT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- 正在导出表  peanut.tb_backend_channel_class_manage 的数据：~17 rows (大约)
/*!40000 ALTER TABLE `tb_backend_channel_class_manage` DISABLE KEYS */;
INSERT INTO `tb_backend_channel_class_manage` (`id`, `class_name`, `label_order`, `fname`, `create_date`) VALUES
	(1, '积分墙推广渠道', 2, '无父级', '2019-04-30 16:42:37.953000'),
	(2, '应用市场渠道', 1, '无父级', '2019-04-30 16:42:10.295000'),
	(28, '刷榜推广方式', 3, '无父级', '2019-04-30 16:43:27.522000'),
	(29, '社交平台推广', 4, '无父级', '2019-04-30 16:43:33.785000'),
	(30, '换量推广', 5, '无父级', '2019-04-30 16:43:41.346000'),
	(31, '手机厂商预装', 6, '无父级', '2019-04-30 16:43:52.634000'),
	(32, '线下下载送礼物', 7, '无父级', '2019-04-30 16:44:04.969000'),
	(33, '内容推广', 8, '无父级', '2019-04-30 16:44:12.770000'),
	(34, 'PR传播', 9, '无父级', '2019-04-30 16:44:20.002000'),
	(35, '裂变推广', 10, '无父级', '2019-04-30 16:44:30.171000'),
	(36, '应用宝', 11, '应用市场渠道', '2019-04-30 16:45:32.709000'),
	(37, '小米', 12, '应用市场渠道', '2019-04-30 16:45:41.812000'),
	(38, '华为', 13, '应用市场渠道', '2019-04-30 16:45:50.380000'),
	(39, '91助手', 14, '应用市场渠道', '2019-04-30 16:46:05.004000'),
	(40, '谷歌商店', 15, '应用市场渠道', '2019-04-30 16:46:14.987000'),
	(41, '腾讯应用中心', 16, '应用市场渠道', '2019-04-30 16:46:22.676000'),
	(42, '微云', 17, '积分墙推广渠道', '2019-04-30 16:46:40.277000'),
	(43, '有米', 18, '积分墙推广渠道', '2019-04-30 16:46:47.637000');
/*!40000 ALTER TABLE `tb_backend_channel_class_manage` ENABLE KEYS */;

-- 导出  表 peanut.tb_backend_channel_manage 结构
CREATE TABLE IF NOT EXISTS `tb_backend_channel_manage` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `first_class` varchar(30) DEFAULT NULL COMMENT '一级目录',
  `second_class` varchar(30) DEFAULT NULL COMMENT '二级目录',
  `channel_num` varchar(60) DEFAULT NULL COMMENT '渠道号',
  `channel_download_link` varchar(60) DEFAULT NULL COMMENT '渠道下载地址',
  `product_name` varchar(30) DEFAULT NULL COMMENT '产品名',
  `show_name` varchar(30) DEFAULT NULL COMMENT '产品显示名字',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;

-- 正在导出表  peanut.tb_backend_channel_manage 的数据：~19 rows (大约)
/*!40000 ALTER TABLE `tb_backend_channel_manage` DISABLE KEYS */;
INSERT INTO `tb_backend_channel_manage` (`id`, `first_class`, `second_class`, `channel_num`, `channel_download_link`, `product_name`, `show_name`, `create_date`) VALUES
	(116, '应用市场渠道', '小米', 'x13454486454534437687', 'www. plantsvszombies.com', '植物大战僵尸', '植物大战僵尸', '2019-04-30 16:49:54'),
	(118, '应用市场渠道', '应用宝', 'x13454486454534437687', 'www. plantsvszombies.com', '植物大战僵尸', '植物大战僵尸', '2019-04-30 16:50:06'),
	(120, '应用市场渠道', '谷歌商店', 'x13454486454534437687', 'www. plantsvszombies.com', '植物大战僵尸', '植物大战僵尸', '2019-04-30 16:50:14'),
	(121, '应用市场渠道', '腾讯应用中心', 'x13454486454534437687', 'www. plantsvszombies.com', '植物大战僵尸', '植物大战僵尸', '2019-04-30 16:50:16'),
	(122, '积分墙推广渠道', '微云', 'x13454486454534437687', 'www. plantsvszombies.com', '植物大战僵尸', '植物大战僵尸', '2019-04-30 16:50:30'),
	(123, '积分墙推广渠道', '有米', 'x13454486454534437687', 'www. plantsvszombies.com', '植物大战僵尸', '植物大战僵尸', '2019-04-30 16:50:33'),
	(124, '应用市场渠道', '小米', 'x7527257848654524424254', 'www.bilibili.com', 'bilibili播放器', 'B站', '2019-04-30 16:55:35'),
	(125, '应用市场渠道', '应用宝', 'x7527257848654524424254', 'www.bilibili.com', 'bilibili播放器', 'B站', '2019-04-30 16:56:26'),
	(126, '应用市场渠道', '91助手', 'x7527257848654524424254', 'www.bilibili.com', 'bilibili播放器', 'B站', '2019-04-30 16:58:09'),
	(127, '手机厂商预装', '', 'x7527257848654524424254', 'www.bilibili.com', 'bilibili播放器', 'B站', '2019-04-30 16:58:57'),
	(128, '手机厂商预装', '', 'x2451552454475254', 'www.qq.com', '腾讯QQ', '腾讯QQ', '2019-04-30 17:00:51'),
	(129, '应用市场渠道', '小米', 'x7878574842', 'www.wechat.com', '微信', '微信', '2019-04-30 17:02:58'),
	(130, '应用市场渠道', '小米', 'x7878574842', 'www.wechat.com', '微信', '微信', '2019-04-30 17:03:06'),
	(131, '手机厂商预装', '', 'x7878574842', 'www.wechat.com', '微信', '微信', '2019-04-30 17:03:11'),
	(132, '内容推广', '', 'x7878574842', 'www.wechat.com', '微信', '微信', '2019-04-30 17:04:23'),
	(133, '应用市场渠道', '小米', 'x91512485424515', 'www.baochaojianghu.com', '爆炒江湖', '爆炒江湖', '2019-04-30 17:05:03'),
	(134, '应用市场渠道', '91助手', 'x91512485424515', 'www.baochaojianghu.com', '爆炒江湖', '爆炒江湖', '2019-04-30 17:05:07'),
	(135, '应用市场渠道', '华为', 'x91512485424515', 'www.baochaojianghu.com', '爆炒江湖', '爆炒江湖', '2019-04-30 17:05:10'),
	(136, '应用市场渠道', '腾讯应用中心', 'x91512485424515', 'www.baochaojianghu.com', '爆炒江湖', '爆炒江湖', '2019-04-30 17:05:15'),
	(137, 'PR传播', '', 'x91512485424515', 'www.baochaojianghu.com', '爆炒江湖', '爆炒江湖', '2019-04-30 17:05:19'),
	(138, '内容推广', '', 'x91512485424515', 'www.baochaojianghu.com', '爆炒江湖', '爆炒江湖', '2019-04-30 17:05:24'),
	(139, '积分墙推广渠道', '', '', '', '', '', '2019-04-30 17:12:37');
/*!40000 ALTER TABLE `tb_backend_channel_manage` ENABLE KEYS */;

-- 导出  表 peanut.tb_backend_novel 结构
CREATE TABLE IF NOT EXISTS `tb_backend_novel` (
  `novel_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `novel_name` varchar(45) NOT NULL,
  `author_name` varchar(45) NOT NULL,
  `primary_type_id` int(11) unsigned DEFAULT NULL,
  `secondary_type_id` int(11) unsigned DEFAULT NULL,
  `novel_status` tinyint(2) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`novel_id`),
  UNIQUE KEY `novel_id_UNIQUE` (`novel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- 正在导出表  peanut.tb_backend_novel 的数据：~10 rows (大约)
/*!40000 ALTER TABLE `tb_backend_novel` DISABLE KEYS */;
INSERT INTO `tb_backend_novel` (`novel_id`, `novel_name`, `author_name`, `primary_type_id`, `secondary_type_id`, `novel_status`) VALUES
	(1, '咩霸已死', '俺', 1, 1, 1),
	(2, '冷的专属宝贝', 'shurad', 1, 2, 1),
	(3, '玩c', 'school', 1, 3, 0),
	(4, 'whatTheFuck', 'badAss', 1, 4, 1),
	(5, '冷的专属宝贝', '哈哈哈哈', 1, 5, 0),
	(6, '黑框glasses', '和i嘿嘿', 2, 6, 0),
	(7, '养鸭子听', '今明', 2, 7, 0),
	(8, '红辣椒', 'parade', 2, 8, 0),
	(9, '差不多了', '还是俺', 2, 9, 0),
	(10, '就这么多吧', '除了俺还能有谁', 3, 10, 1);
/*!40000 ALTER TABLE `tb_backend_novel` ENABLE KEYS */;

-- 导出  表 peanut.tb_backend_novel_type_primary 结构
CREATE TABLE IF NOT EXISTS `tb_backend_novel_type_primary` (
  `type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `type_id_UNIQUE` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- 正在导出表  peanut.tb_backend_novel_type_primary 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `tb_backend_novel_type_primary` DISABLE KEYS */;
INSERT INTO `tb_backend_novel_type_primary` (`type_id`, `type_name`) VALUES
	(1, '沙雕选摘'),
	(2, '都市言情'),
	(3, '文言文'),
	(4, '哲学'),
	(5, '现代魔幻');
/*!40000 ALTER TABLE `tb_backend_novel_type_primary` ENABLE KEYS */;

-- 导出  表 peanut.tb_backend_novel_type_secondary 结构
CREATE TABLE IF NOT EXISTS `tb_backend_novel_type_secondary` (
  `type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(45) NOT NULL,
  `father_type_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `type_id_UNIQUE` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- 正在导出表  peanut.tb_backend_novel_type_secondary 的数据：~21 rows (大约)
/*!40000 ALTER TABLE `tb_backend_novel_type_secondary` DISABLE KEYS */;
INSERT INTO `tb_backend_novel_type_secondary` (`type_id`, `type_name`, `father_type_id`) VALUES
	(1, '超级大沙雕', 1),
	(2, '高级大沙雕', 1),
	(3, '中级大沙雕', 1),
	(4, '无名沙雕', 1),
	(5, '扫地沙雕', 1),
	(6, '男总裁女主', 2),
	(7, '女总裁男主', 2),
	(8, '男总裁男主', 2),
	(9, '女总裁女主', 2),
	(10, '之', 3),
	(11, '呼', 3),
	(12, '者', 3),
	(13, '也', 3),
	(14, '守序善良电车系', 4),
	(15, '守序中立电车系', 4),
	(16, '守序邪恶电车系', 4),
	(17, '混乱邪恶电车系之超棒的大回环', 4),
	(18, 'gcd', 5),
	(19, '资本家', 5),
	(20, '法律', 5),
	(21, '花生米', 5);
/*!40000 ALTER TABLE `tb_backend_novel_type_secondary` ENABLE KEYS */;

-- 导出  表 peanut.tb_backend_user 结构
CREATE TABLE IF NOT EXISTS `tb_backend_user` (
  `uid` bigint(32) NOT NULL COMMENT '用户id',
  `username` varchar(45) NOT NULL COMMENT '用户名',
  `password` varchar(45) NOT NULL COMMENT '密码',
  `status` tinyint(4) DEFAULT NULL COMMENT '帐号状态(1.可用 2.不可用)',
  `role` tinyint(4) DEFAULT NULL COMMENT '角色类型(1.普通用户 2.合作公司 3.管理员)',
  `parent_uid` bigint(32) NOT NULL COMMENT '创建此帐号的用户id',
  `permission` varchar(100) DEFAULT NULL COMMENT '此账号的菜单权限(用,连接多个菜单id)',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '帐号创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '帐号最后更新时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '帐号最后登录时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  peanut.tb_backend_user 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `tb_backend_user` DISABLE KEYS */;
INSERT INTO `tb_backend_user` (`uid`, `username`, `password`, `status`, `role`, `parent_uid`, `permission`, `remark`, `create_time`, `update_time`, `last_login_time`) VALUES
	(1, 'admin', 'BCB9B9855A461B58FB5F03EA7EBC4903', 1, 3, 1, '1,13,14,4,19,6,22,23,8,25', NULL, '2019-04-28 22:29:25', '2019-04-29 17:11:25', '2019-04-30 18:23:20'),
	(1976626265, 'huangshuo', 'BCB9B9855A461B58FB5F03EA7EBC4903', 1, 3, 1, '1,13,14,4,19,6,22,23,8,25', NULL, '2019-04-29 21:17:06', '2019-04-29 21:30:34', '2019-04-30 16:58:53');
/*!40000 ALTER TABLE `tb_backend_user` ENABLE KEYS */;

-- 导出  表 peanut.tb_game 结构
CREATE TABLE IF NOT EXISTS `tb_game` (
  `game_id` bigint(32) NOT NULL COMMENT '游戏id',
  `name` varchar(45) NOT NULL COMMENT '游戏名称',
  `title` varchar(45) DEFAULT NULL COMMENT '游戏标题',
  `recommend_type` tinyint(4) DEFAULT NULL COMMENT '推荐类型(1.普通 2.最新 3.精选)',
  `game_type_id` int(11) DEFAULT NULL COMMENT '游戏分类名称',
  `download_count` int(11) DEFAULT NULL COMMENT '下载数量',
  `game_size` float DEFAULT NULL COMMENT '游戏大小(MB)',
  `game_icon` varchar(100) DEFAULT NULL COMMENT '游戏图标url',
  `game_pictures` varchar(500) DEFAULT NULL COMMENT '游戏详情url(用;拼接多个)',
  `android_url` varchar(100) DEFAULT NULL COMMENT '安卓下载地址',
  `ios_url` varchar(100) DEFAULT NULL COMMENT 'ios下载地址',
  `platform` tinyint(4) DEFAULT NULL COMMENT '平台类型(1.iOS 2.Android 3.所有)',
  `game_status` tinyint(4) DEFAULT NULL COMMENT '游戏状态(1.启用 2.下线)',
  `description` varchar(500) DEFAULT NULL COMMENT '游戏描述',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`game_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  peanut.tb_game 的数据：~16 rows (大约)
/*!40000 ALTER TABLE `tb_game` DISABLE KEYS */;
INSERT INTO `tb_game` (`game_id`, `name`, `title`, `recommend_type`, `game_type_id`, `download_count`, `game_size`, `game_icon`, `game_pictures`, `android_url`, `ios_url`, `platform`, `game_status`, `description`, `create_time`, `update_time`) VALUES
	(1965427795, '1231', '123123123', 1, 1, 0, 123123, '123123', '123123', '312313', '12312311', 1, 1, NULL, '2019-04-30 18:10:28', NULL),
	(1972278279, '', '游戏标题1231313', 1, 2, 9, 200.9, '游戏图标9', '游戏图片9', '', 'iosUrl9', 1, 2, '描述9', NULL, '2019-04-30 17:59:16'),
	(1972278465, '游戏名称14', '游戏标题14', 3, 6, 14, 200.14, '游戏图标14', '游戏图片14', 'androidUrl14', 'iosUrl14', 3, 1, '描述14', NULL, '2019-04-27 20:42:57'),
	(1972278484, '游戏名称13', '游戏标题13', 2, 2, 13, 200.13, '游戏图标13', '游戏图片13', 'androidUrl13', '', 2, 2, '描述13', NULL, '2019-04-27 21:54:35'),
	(1972278498, '游戏名称19', '游戏标题19', 2, 8, 19, 200.19, '游戏图标19', '游戏图片19', 'androidUrl19', '', 2, 2, '描述19', NULL, '2019-04-27 21:54:39'),
	(1972278508, '游戏名称1', '游戏标题15', 1, 2, 15, 200.15, '游戏图标15', '游戏图片15', '', 'iosUrl15', 1, 1, '描述15', NULL, '2019-04-30 17:11:57'),
	(1972278527, '游戏名称5', '游戏标题155', 3, 5, 5, 200.5, '游戏图标5', '游戏图片5', 'androidUrl5', 'iosUrl5', 1, 2, '描述5', NULL, '2019-04-27 23:18:39'),
	(1972278658, '游戏名称3', '游戏标题3', 1, 3, 3, 200.3, '游戏图标3', '游戏图片3', NULL, 'iosUrl3', 1, 2, '描述3', NULL, NULL),
	(1972278726, '游戏名称17', '游戏标题17', 3, 3, 17, 200.17, '游戏图标17', '游戏图片17', 'androidUrl17', 'iosUrl17', 3, 2, '描述17', NULL, '2019-04-27 21:54:52'),
	(1972278732, '游戏名称7', '游戏标题7', 2, 7, 7, 200.7, '游戏图标7', '游戏图片7', 'androidUrl7', NULL, 2, 2, '描述7', NULL, NULL),
	(1972278733, '游戏名称10', '游戏标题10', 2, 6, 10, 200.1, '游戏图标10', '游戏图片10', 'androidUrl10', '', 2, 1, '描述10', NULL, '2019-04-27 21:54:56'),
	(1972278757, '游戏名称2', '游戏标题2', 3, 5, 2, 200.2, '游戏图标2', '游戏图片2', 'androidUrl2', 'iosUrl2', 3, 1, '描述2', NULL, '2019-04-27 21:55:00'),
	(1972278788, '游戏名称8', '游戏标题8', 3, 8, 8, 200.8, '游戏图标8', '游戏图片8', 'androidUrl8', 'iosUrl8', 3, 1, '描述8', NULL, NULL),
	(1972278844, '游戏名称11', '游戏标题11', 3, 4, 11, 200.11, '游戏图标11', '游戏图片11', 'androidUrl11', 'iosUrl11', 3, 2, '描述11', NULL, '2019-04-27 21:55:05'),
	(1972278876, '游戏名称16', '游戏标题16', 2, 5, 16, 200.16, '游戏图标16', '游戏图片16', 'androidUrl16', '', 2, 1, '描述16', NULL, '2019-04-27 21:55:10'),
	(1972278936, '游戏名称6', '游戏标题6', 1, 6, 6, 200.6, '游戏图标6', '游戏图片6', NULL, 'iosUrl6', 1, 1, '描述6', NULL, NULL),
	(1973263123, '游戏99', '游戏标题99', 1, 1, 0, 9123, '游戏图标99', '游戏详情图片99', 'androidUrl99', 'isoUrl99', 1, 1, NULL, '2019-04-28 20:21:03', NULL);
/*!40000 ALTER TABLE `tb_game` ENABLE KEYS */;

-- 导出  表 peanut.tb_game_type 结构
CREATE TABLE IF NOT EXISTS `tb_game_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `type_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  peanut.tb_game_type 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tb_game_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_game_type` ENABLE KEYS */;

-- 导出  表 peanut.tb_menu_manage 结构
CREATE TABLE IF NOT EXISTS `tb_menu_manage` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `mname` varchar(30) NOT NULL COMMENT '菜单名',
  `fid` int(10) NOT NULL DEFAULT '0' COMMENT '父id',
  `is_show` tinyint(10) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `icon` varchar(60) DEFAULT NULL COMMENT '图标',
  `jsp_name` varchar(30) DEFAULT NULL COMMENT 'jsp文件名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- 正在导出表  peanut.tb_menu_manage 的数据：~28 rows (大约)
/*!40000 ALTER TABLE `tb_menu_manage` DISABLE KEYS */;
INSERT INTO `tb_menu_manage` (`id`, `mname`, `fid`, `is_show`, `icon`, `jsp_name`) VALUES
	(1, '管理中心', 0, 1, 'am-icon-wpforms', 'null'),
	(2, '模板管理', 0, 1, 'am-icon-th-large', 'null'),
	(3, '广告管理', 0, 1, 'am-icon-audio-description', 'null'),
	(4, '游戏管理', 0, 1, 'am-icon-gamepad', 'null'),
	(5, '合作公司管理', 0, 1, 'am-icon-building', 'null'),
	(6, '渠道版本', 0, 1, 'am-icon-exchange', 'null'),
	(7, 'CP', 0, 1, 'am-icon-money', 'null'),
	(8, '图书管理', 0, 1, 'am-icon-book', 'null'),
	(9, '标签管理', 0, 1, 'am-icon-tags', 'null'),
	(10, '分类管理', 0, 1, 'am-icon-qrcode', 'null'),
	(11, '推荐管理', 0, 1, 'am-icon-registered', 'null'),
	(12, '认证管理', 0, 1, 'am-icon-spinner', 'null'),
	(13, '权限管理', 1, 1, 'am-icon-lock', 'permission'),
	(14, '菜单管理', 1, 1, 'am-icon-server', 'menuManage'),
	(15, '模板配置 ', 2, 1, NULL, NULL),
	(16, '板板列表', 2, 0, NULL, NULL),
	(17, '首页顶置广告', 3, 1, NULL, NULL),
	(18, '首页分类广告', 3, 1, NULL, NULL),
	(19, '游戏配置', 4, 1, 'am-icon-cogs', 'game'),
	(20, '合作公司管理', 5, 1, 'undefined', NULL),
	(21, '合作订单管理', 5, 1, NULL, NULL),
	(22, '渠道管理', 6, 1, NULL, 'channelManage'),
	(23, '渠道分类管理', 6, 1, NULL, 'channelClassManage'),
	(24, 'CP查询', 7, 1, NULL, NULL),
	(25, '图书列表', 8, 1, NULL, 'novel'),
	(26, '标签列表', 9, 1, NULL, NULL),
	(27, '分类列表', 10, 1, 'am-icon-gitlab', NULL),
	(28, '首页内容推荐', 11, 1, 'am-icon-american-sign-language-interpreting', NULL);
/*!40000 ALTER TABLE `tb_menu_manage` ENABLE KEYS */;

-- 导出  表 peanut.tb_novel 结构
CREATE TABLE IF NOT EXISTS `tb_novel` (
  `novel_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '小说ID',
  `novel_name` varchar(45) NOT NULL COMMENT '小说书名',
  `type_id` int(11) DEFAULT NULL COMMENT '该小说所属小说类型ID',
  `description` varchar(500) DEFAULT NULL COMMENT '小说简介',
  `cover_url` varchar(256) DEFAULT NULL COMMENT '小说封面文件url',
  `author_name` varchar(45) DEFAULT NULL COMMENT '作者名',
  `last_updated_chapter_id` int(11) DEFAULT NULL COMMENT '最后上传的章节',
  `update_date` date DEFAULT NULL COMMENT '更新日期',
  `read_count` int(11) DEFAULT NULL COMMENT '读者统计',
  `word_count` int(11) DEFAULT NULL COMMENT '字数统计',
  PRIMARY KEY (`novel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='小说信息表';

-- 正在导出表  peanut.tb_novel 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `tb_novel` DISABLE KEYS */;
INSERT INTO `tb_novel` (`novel_id`, `novel_name`, `type_id`, `description`, `cover_url`, `author_name`, `last_updated_chapter_id`, `update_date`, `read_count`, `word_count`) VALUES
	(1, '咩霸之死', 1, '明天他就死了', 'hahha', '俺', 1, '2019-04-23', 555, 45345);
/*!40000 ALTER TABLE `tb_novel` ENABLE KEYS */;

-- 导出  表 peanut.tb_novel_chapter 结构
CREATE TABLE IF NOT EXISTS `tb_novel_chapter` (
  `chapter_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '章节ID',
  `chapter_name` varchar(45) NOT NULL COMMENT '章节名称',
  `novel_id` int(11) DEFAULT NULL COMMENT '小说ID',
  `price` decimal(8,2) DEFAULT NULL COMMENT '章节价格',
  `sort_id` int(11) DEFAULT NULL COMMENT '章节序号，即第几章',
  `is_vip` tinyint(4) DEFAULT NULL COMMENT '是否需要VIP才能观看',
  `text` text COMMENT '章节正文',
  PRIMARY KEY (`chapter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='小说章节表';

-- 正在导出表  peanut.tb_novel_chapter 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `tb_novel_chapter` DISABLE KEYS */;
INSERT INTO `tb_novel_chapter` (`chapter_id`, `chapter_name`, `novel_id`, `price`, `sort_id`, `is_vip`, `text`) VALUES
	(1, '紫番薯？', 1, 99.99, 1, 1, '一听哥哥说他不想就这么死去，咩霸知道哥哥的不甘心，但他也无能为力。他轻启朱唇。眼波流转，安慰道：“傻逼，明天要死的人是我！！”');
/*!40000 ALTER TABLE `tb_novel_chapter` ENABLE KEYS */;

-- 导出  表 peanut.tb_novel_type 结构
CREATE TABLE IF NOT EXISTS `tb_novel_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '小说类型ID',
  `type_name` varchar(45) DEFAULT NULL COMMENT '小说类型名称',
  `type_description` varchar(200) DEFAULT NULL COMMENT '小说类型描述',
  `novel_count` int(11) DEFAULT NULL COMMENT '该类型小说数统计',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='小说类型表';

-- 正在导出表  peanut.tb_novel_type 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tb_novel_type` DISABLE KEYS */;
INSERT INTO `tb_novel_type` (`type_id`, `type_name`, `type_description`, `novel_count`) VALUES
	(1, '沙雕选摘', '本系列对抑郁症的疗效未经临床证实，请紧遵医嘱', 1);
/*!40000 ALTER TABLE `tb_novel_type` ENABLE KEYS */;

-- 导出  表 peanut.tb_user 结构
CREATE TABLE IF NOT EXISTS `tb_user` (
  `uid` bigint(32) NOT NULL COMMENT '用户id',
  `username` varchar(16) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `head_pic` varchar(100) DEFAULT NULL COMMENT '用户头像大图url',
  `head_pic_thumb` varchar(100) DEFAULT NULL COMMENT '用户头像缩略图url',
  `des` varchar(45) DEFAULT NULL COMMENT '个性签名',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别:1.男 2.女',
  `birthday` date DEFAULT NULL COMMENT '用户生日',
  `avatar_color` varchar(100) DEFAULT NULL COMMENT '用户爱好',
  `phone` varchar(16) DEFAULT NULL COMMENT '手机号',
  `grade` int(11) DEFAULT NULL COMMENT '用户等级',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- 正在导出表  peanut.tb_user 的数据：~50 rows (大约)
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` (`uid`, `username`, `password`, `head_pic`, `head_pic_thumb`, `des`, `sex`, `birthday`, `avatar_color`, `phone`, `grade`, `create_time`, `update_time`) VALUES
	(1000000, '用户名测试111', 'BCB9B9855A461B58FB5F03EA7EBC4903', '测试头像11', '测试头像缩略图11', '测试签名11', 1, '1994-11-30', '测试爱好11', '手机号测试111', 2, NULL, NULL),
	(1000001, '用户名测试1', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试1', '头像缩略图测试1', '个性签名测试1', 2, '2019-04-22', '兴趣爱好测试1', '手机号测试1', 2, NULL, NULL),
	(1000002, '用户名测试2', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试2', '头像缩略图测试2', '个性签名测试2', 1, '2019-04-22', '兴趣爱好测试2', '手机号测试2', 3, NULL, NULL),
	(1000003, '用户名测试3', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试3', '头像缩略图测试3', '个性签名测试3', 2, '2019-04-22', '兴趣爱好测试3', '手机号测试3', 4, NULL, NULL),
	(1000004, '用户名测试4', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试4', '头像缩略图测试4', '个性签名测试4', 1, '2019-04-22', '兴趣爱好测试4', '手机号测试4', 5, NULL, NULL),
	(1000005, '用户名测试5', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试5', '头像缩略图测试5', '个性签名测试5', 2, '2019-04-22', '兴趣爱好测试5', '手机号测试5', 1, NULL, NULL),
	(1000006, '用户名测试6', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试6', '头像缩略图测试6', '个性签名测试6', 1, '2019-04-22', '兴趣爱好测试6', '手机号测试6', 2, NULL, NULL),
	(1000007, '用户名测试7', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试7', '头像缩略图测试7', '个性签名测试7', 2, '2019-04-22', '兴趣爱好测试7', '手机号测试7', 3, NULL, NULL),
	(1000008, '用户名测试8', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试8', '头像缩略图测试8', '个性签名测试8', 1, '2019-04-22', '兴趣爱好测试8', '手机号测试8', 4, NULL, NULL),
	(1000009, '用户名测试9', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试9', '头像缩略图测试9', '个性签名测试9', 2, '2019-04-22', '兴趣爱好测试9', '手机号测试9', 5, NULL, NULL),
	(1000010, '用户名测试10', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试10', '头像缩略图测试10', '个性签名测试10', 1, '2019-04-22', '兴趣爱好测试10', '手机号测试10', 1, NULL, NULL),
	(1000011, '用户名测试11', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试11', '头像缩略图测试11', '个性签名测试11', 2, '2019-04-22', '兴趣爱好测试11', '手机号测试11', 2, NULL, NULL),
	(1000012, '用户名测试12', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试12', '头像缩略图测试12', '个性签名测试12', 1, '2019-04-22', '兴趣爱好测试12', '手机号测试12', 3, NULL, NULL),
	(1000013, '用户名测试13', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试13', '头像缩略图测试13', '个性签名测试13', 2, '2019-04-22', '兴趣爱好测试13', '手机号测试13', 4, NULL, NULL),
	(1000014, '用户名测试14', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试14', '头像缩略图测试14', '个性签名测试14', 1, '2019-04-22', '兴趣爱好测试14', '手机号测试14', 5, NULL, NULL),
	(1000015, '用户名测试15', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试15', '头像缩略图测试15', '个性签名测试15', 2, '2019-04-22', '兴趣爱好测试15', '手机号测试15', 1, NULL, NULL),
	(1000016, '用户名测试16', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试16', '头像缩略图测试16', '个性签名测试16', 1, '2019-04-22', '兴趣爱好测试16', '手机号测试16', 2, NULL, NULL),
	(1000017, '用户名测试17', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试17', '头像缩略图测试17', '个性签名测试17', 2, '2019-04-22', '兴趣爱好测试17', '手机号测试17', 3, NULL, NULL),
	(1000018, '用户名测试18', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试18', '头像缩略图测试18', '个性签名测试18', 1, '2019-04-22', '兴趣爱好测试18', '手机号测试18', 4, NULL, NULL),
	(1000019, '用户名测试19', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试19', '头像缩略图测试19', '个性签名测试19', 2, '2019-04-22', '兴趣爱好测试19', '手机号测试19', 5, NULL, NULL),
	(1000020, '用户名测试20', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试20', '头像缩略图测试20', '个性签名测试20', 1, '2019-04-22', '兴趣爱好测试20', '手机号测试20', 1, NULL, NULL),
	(1000021, '用户名测试21', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试21', '头像缩略图测试21', '个性签名测试21', 2, '2019-04-22', '兴趣爱好测试21', '手机号测试21', 2, NULL, NULL),
	(1000022, '用户名测试22', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试22', '头像缩略图测试22', '个性签名测试22', 1, '2019-04-22', '兴趣爱好测试22', '手机号测试22', 3, NULL, NULL),
	(1000023, '用户名测试23', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试23', '头像缩略图测试23', '个性签名测试23', 2, '2019-04-22', '兴趣爱好测试23', '手机号测试23', 4, NULL, NULL),
	(1000024, '用户名测试24', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试24', '头像缩略图测试24', '个性签名测试24', 1, '2019-04-22', '兴趣爱好测试24', '手机号测试24', 5, NULL, NULL),
	(1000025, '用户名测试25', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试25', '头像缩略图测试25', '个性签名测试25', 2, '2019-04-22', '兴趣爱好测试25', '手机号测试25', 1, NULL, NULL),
	(1000026, '用户名测试26', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试26', '头像缩略图测试26', '个性签名测试26', 1, '2019-04-22', '兴趣爱好测试26', '手机号测试26', 2, NULL, NULL),
	(1000027, '用户名测试27', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试27', '头像缩略图测试27', '个性签名测试27', 2, '2019-04-22', '兴趣爱好测试27', '手机号测试27', 3, NULL, NULL),
	(1000028, '用户名测试28', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试28', '头像缩略图测试28', '个性签名测试28', 1, '2019-04-22', '兴趣爱好测试28', '手机号测试28', 4, NULL, NULL),
	(1000029, '用户名测试29', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试29', '头像缩略图测试29', '个性签名测试29', 2, '2019-04-22', '兴趣爱好测试29', '手机号测试29', 5, NULL, NULL),
	(1000030, '用户名测试30', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试30', '头像缩略图测试30', '个性签名测试30', 1, '2019-04-22', '兴趣爱好测试30', '手机号测试30', 1, NULL, NULL),
	(1000031, '用户名测试31', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试31', '头像缩略图测试31', '个性签名测试31', 2, '2019-04-22', '兴趣爱好测试31', '手机号测试31', 2, NULL, NULL),
	(1000032, '用户名测试32', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试32', '头像缩略图测试32', '个性签名测试32', 1, '2019-04-22', '兴趣爱好测试32', '手机号测试32', 3, NULL, NULL),
	(1000033, '用户名测试33', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试33', '头像缩略图测试33', '个性签名测试33', 2, '2019-04-22', '兴趣爱好测试33', '手机号测试33', 4, NULL, NULL),
	(1000034, '用户名测试34', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试34', '头像缩略图测试34', '个性签名测试34', 1, '2019-04-22', '兴趣爱好测试34', '手机号测试34', 5, NULL, NULL),
	(1000035, '用户名测试35', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试35', '头像缩略图测试35', '个性签名测试35', 2, '2019-04-22', '兴趣爱好测试35', '手机号测试35', 1, NULL, NULL),
	(1000036, '用户名测试36', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试36', '头像缩略图测试36', '个性签名测试36', 1, '2019-04-22', '兴趣爱好测试36', '手机号测试36', 2, NULL, NULL),
	(1000037, '用户名测试37', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试37', '头像缩略图测试37', '个性签名测试37', 2, '2019-04-22', '兴趣爱好测试37', '手机号测试37', 3, NULL, NULL),
	(1000038, '用户名测试38', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试38', '头像缩略图测试38', '个性签名测试38', 1, '2019-04-22', '兴趣爱好测试38', '手机号测试38', 4, NULL, NULL),
	(1000039, '用户名测试39', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试39', '头像缩略图测试39', '个性签名测试39', 2, '2019-04-22', '兴趣爱好测试39', '手机号测试39', 5, NULL, NULL),
	(1000040, '用户名测试40', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试40', '头像缩略图测试40', '个性签名测试40', 1, '2019-04-22', '兴趣爱好测试40', '手机号测试40', 1, NULL, NULL),
	(1000041, '用户名测试41', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试41', '头像缩略图测试41', '个性签名测试41', 2, '2019-04-22', '兴趣爱好测试41', '手机号测试41', 2, NULL, NULL),
	(1000042, '用户名测试42', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试42', '头像缩略图测试42', '个性签名测试42', 1, '2019-04-22', '兴趣爱好测试42', '手机号测试42', 3, NULL, NULL),
	(1000043, '用户名测试43', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试43', '头像缩略图测试43', '个性签名测试43', 2, '2019-04-22', '兴趣爱好测试43', '手机号测试43', 4, NULL, NULL),
	(1000044, '用户名测试44', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试44', '头像缩略图测试44', '个性签名测试44', 1, '2019-04-22', '兴趣爱好测试44', '手机号测试44', 5, NULL, NULL),
	(1000045, '用户名测试45', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试45', '头像缩略图测试45', '个性签名测试45', 2, '2019-04-22', '兴趣爱好测试45', '手机号测试45', 1, NULL, NULL),
	(1000046, '用户名测试46', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试46', '头像缩略图测试46', '个性签名测试46', 1, '2019-04-22', '兴趣爱好测试46', '手机号测试46', 2, NULL, NULL),
	(1000047, '用户名测试47', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试47', '头像缩略图测试47', '个性签名测试47', 2, '2019-04-22', '兴趣爱好测试47', '手机号测试47', 3, NULL, NULL),
	(1000048, '用户名测试48', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试48', '头像缩略图测试48', '个性签名测试48', 1, '2019-04-22', '兴趣爱好测试48', '手机号测试48', 4, NULL, NULL),
	(1000049, '用户名测试49', 'BCB9B9855A461B58FB5F03EA7EBC4903', '头像大图测试49', '头像缩略图测试49', '个性签名测试49', 2, '2019-04-22', '兴趣爱好测试49', '手机号测试49', 5, NULL, NULL);
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;

-- 导出  表 peanut.tb_user_feedback 结构
CREATE TABLE IF NOT EXISTS `tb_user_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(32) NOT NULL COMMENT '用户id',
  `trouble_list` varchar(45) DEFAULT NULL COMMENT '用户遇到的问题(用,连接多个id)',
  `suggestion` text COMMENT '用户建议',
  `contact` varchar(16) DEFAULT NULL COMMENT '用户联系方式',
  `platform` tinyint(4) DEFAULT NULL COMMENT '用户平台(1.IOS 2.Android)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户反馈表';

-- 正在导出表  peanut.tb_user_feedback 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tb_user_feedback` DISABLE KEYS */;
INSERT INTO `tb_user_feedback` (`id`, `uid`, `trouble_list`, `suggestion`, `contact`, `platform`) VALUES
	(1, 1000000, '132131', '12312312', '12313123123', 1);
/*!40000 ALTER TABLE `tb_user_feedback` ENABLE KEYS */;

-- 导出  表 peanut.tb_user_trouble 结构
CREATE TABLE IF NOT EXISTS `tb_user_trouble` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `desc` varchar(45) DEFAULT NULL COMMENT '问题描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问题表';

-- 正在导出表  peanut.tb_user_trouble 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tb_user_trouble` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_user_trouble` ENABLE KEYS */;

-- 导出  表 peanut.tb_video_detail 结构
CREATE TABLE IF NOT EXISTS `tb_video_detail` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fdncode` varchar(30) DEFAULT NULL,
  `descinfo` varchar(30) DEFAULT NULL COMMENT '视频信息描述',
  `title` varchar(30) NOT NULL COMMENT '视频标题',
  `length` int(30) DEFAULT NULL COMMENT '视频时长',
  `vid` varchar(30) DEFAULT NULL COMMENT '视频编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  peanut.tb_video_detail 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `tb_video_detail` DISABLE KEYS */;
INSERT INTO `tb_video_detail` (`id`, `fdncode`, `descinfo`, `title`, `length`, `vid`) VALUES
	(1, 'FDNB1661272', '', '美国：南海“洗牌”', 2517, '1938600');
/*!40000 ALTER TABLE `tb_video_detail` ENABLE KEYS */;

-- 导出  表 peanut.tb_video_episode_detail 结构
CREATE TABLE IF NOT EXISTS `tb_video_episode_detail` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `vid` varchar(60) DEFAULT NULL COMMENT '视频编号',
  `num` int(30) DEFAULT NULL COMMENT '当前集数',
  `fdncode` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  peanut.tb_video_episode_detail 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tb_video_episode_detail` DISABLE KEYS */;
INSERT INTO `tb_video_episode_detail` (`id`, `vid`, `num`, `fdncode`) VALUES
	(1, '1938600', 10, 'FDNB1661272');
/*!40000 ALTER TABLE `tb_video_episode_detail` ENABLE KEYS */;

-- 导出  表 peanut.tb_video_first_list 结构
CREATE TABLE IF NOT EXISTS `tb_video_first_list` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `icon` varchar(100) NOT NULL COMMENT '图片地址',
  `name` varchar(20) NOT NULL COMMENT '一级目录名',
  `cid` bigint(10) NOT NULL COMMENT '一级目录编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 正在导出表  peanut.tb_video_first_list 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `tb_video_first_list` DISABLE KEYS */;
INSERT INTO `tb_video_first_list` (`id`, `icon`, `name`, `cid`) VALUES
	(1, 'http://mimgs.bestv.cn/bestvapp/20151023/20151023151430361.png', '电视剧', 4),
	(2, 'http://mimgs.bestv.cn/bestvapp/20151023/20151023150826436.png', '电影', 6);
/*!40000 ALTER TABLE `tb_video_first_list` ENABLE KEYS */;

-- 导出  表 peanut.tb_video_page 结构
CREATE TABLE IF NOT EXISTS `tb_video_page` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `img_a` varchar(100) DEFAULT NULL COMMENT '图片地址',
  `img_b` varchar(100) DEFAULT NULL COMMENT '图片地址',
  `isclose` tinyint(10) DEFAULT NULL COMMENT '是否完结/1为true、0为false',
  `title` varchar(30) NOT NULL COMMENT '视频标题',
  `attr` tinyint(10) unsigned DEFAULT NULL COMMENT '视频类型:1单片、2剧集',
  `epcnt` int(30) DEFAULT NULL COMMENT '当前播放到的集数',
  `vid` varchar(20) DEFAULT NULL COMMENT '视频编号',
  `eptotal` int(10) DEFAULT NULL COMMENT '总集数',
  `img_c` varchar(100) DEFAULT NULL COMMENT '图片地址',
  `img_d` varchar(100) DEFAULT NULL COMMENT '图片地址',
  `fid` bigint(10) DEFAULT NULL COMMENT '对应二级目录cid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- 正在导出表  peanut.tb_video_page 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `tb_video_page` DISABLE KEYS */;
INSERT INTO `tb_video_page` (`id`, `img_a`, `img_b`, `isclose`, `title`, `attr`, `epcnt`, `vid`, `eptotal`, `img_c`, `img_d`, `fid`) VALUES
	(1, 'http://tvpic.bbtv.cn/20160721/F3059585.jpg', 'http://tvpic.bbtv.cn/20160721/F3059585.jpg', 0, '无理的英爱小姐第十三季-原声版', 2, 16, '1938600', 16, 'http://tvpic.bbtv.cn/20160721/F3059585.jpg', 'http://tvpic.bbtv.cn/20160721/F3059585.jpg', 5),
	(2, 'http://tvpic.bbtv.cn/20160721/F3059585.jpg', 'http://tvpic.bbtv.cn/20160721/F3059585.jpg', 0, '无理的英爱小姐第十三季-原声版', 3, 16, '2341884', 16, 'http://tvpic.bbtv.cn/20160721/F3059585.jpg', 'http://tvpic.bbtv.cn/20160721/F3059585.jpg', 5),
	(3, 'http://tvpic.bbtv.cn/20160721/F3059585.jpg', 'http://tvpic.bbtv.cn/20160721/F3059585.jpg', 0, '无理的英爱小姐第十三季-原声版', 4, 16, '2341884', 16, 'http://tvpic.bbtv.cn/20160721/F3059585.jpg', 'http://tvpic.bbtv.cn/20160721/F3059585.jpg', 5),
	(4, 'http://tvpic.bbtv.cn/20160721/F3059585.jpg', 'http://tvpic.bbtv.cn/20160721/F3059585.jpg', 0, '无理的英爱小姐第十三季-原声版', 5, 16, '2341884', 16, 'http://tvpic.bbtv.cn/20160721/F3059585.jpg', 'http://tvpic.bbtv.cn/20160721/F3059585.jpg', 5),
	(5, 'http://tvpic.bbtv.cn/20160721/F3059585.jpg', 'http://tvpic.bbtv.cn/20160721/F3059585.jpg', 0, '无理的英爱小姐第十三季-原声版', 6, 16, '2341884', 16, 'http://tvpic.bbtv.cn/20160721/F3059585.jpg', 'http://tvpic.bbtv.cn/20160721/F3059585.jpg', 5),
	(6, 'http://tvpic.bbtv.cn/20160721/F3059585.jpg', 'http://tvpic.bbtv.cn/20160721/F3059585.jpg', 0, '无理的英爱小姐第十三季-原声版', 7, 16, '2341884', 16, 'http://tvpic.bbtv.cn/20160721/F3059585.jpg', 'http://tvpic.bbtv.cn/20160721/F3059585.jpg', 5);
/*!40000 ALTER TABLE `tb_video_page` ENABLE KEYS */;

-- 导出  表 peanut.tb_video_second_list 结构
CREATE TABLE IF NOT EXISTS `tb_video_second_list` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `icon` varchar(100) NOT NULL COMMENT '图片地址',
  `name` varchar(20) NOT NULL COMMENT '二级目录名字',
  `cid` bigint(10) NOT NULL COMMENT '二级目录编号',
  `fid` bigint(10) NOT NULL COMMENT '对应一级目录的cid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  peanut.tb_video_second_list 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tb_video_second_list` DISABLE KEYS */;
INSERT INTO `tb_video_second_list` (`id`, `icon`, `name`, `cid`, `fid`) VALUES
	(1, 'http://mimgs.bestv.cn/bestvapp/20151027/20151027123603415.png', '亚洲', 28, 5);
/*!40000 ALTER TABLE `tb_video_second_list` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
