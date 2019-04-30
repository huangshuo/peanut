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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;


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


-- 导出  表 peanut.tb_backend_novel_type_primary 结构
CREATE TABLE IF NOT EXISTS `tb_backend_novel_type_primary` (
  `type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `type_id_UNIQUE` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


-- 导出  表 peanut.tb_backend_novel_type_secondary 结构
CREATE TABLE IF NOT EXISTS `tb_backend_novel_type_secondary` (
  `type_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(45) NOT NULL,
  `father_type_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `type_id_UNIQUE` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;


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


-- 导出  表 peanut.tb_game_type 结构
CREATE TABLE IF NOT EXISTS `tb_game_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `type_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 导出  表 peanut.tb_menu_manage 结构
CREATE TABLE IF NOT EXISTS `tb_menu_manage` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `mname` varchar(30) NOT NULL COMMENT '菜单名',
  `fid` int(10) NOT NULL DEFAULT '0' COMMENT '父id',
  `is_show` tinyint(10) NOT NULL DEFAULT '1' COMMENT '是否显示',
  `icon` varchar(60) DEFAULT NULL COMMENT '图标',
  `jsp_name` varchar(30) DEFAULT NULL COMMENT 'jsp文件名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;


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


-- 导出  表 peanut.tb_novel_type 结构
CREATE TABLE IF NOT EXISTS `tb_novel_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '小说类型ID',
  `type_name` varchar(45) DEFAULT NULL COMMENT '小说类型名称',
  `type_description` varchar(200) DEFAULT NULL COMMENT '小说类型描述',
  `novel_count` int(11) DEFAULT NULL COMMENT '该类型小说数统计',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='小说类型表';


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


-- 导出  表 peanut.tb_user_trouble 结构
CREATE TABLE IF NOT EXISTS `tb_user_trouble` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `desc` varchar(45) DEFAULT NULL COMMENT '问题描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='问题表';


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


-- 导出  表 peanut.tb_video_episode_detail 结构
CREATE TABLE IF NOT EXISTS `tb_video_episode_detail` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `vid` varchar(60) DEFAULT NULL COMMENT '视频编号',
  `num` int(30) DEFAULT NULL COMMENT '当前集数',
  `fdncode` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


-- 导出  表 peanut.tb_video_first_list 结构
CREATE TABLE IF NOT EXISTS `tb_video_first_list` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `icon` varchar(100) NOT NULL COMMENT '图片地址',
  `name` varchar(20) NOT NULL COMMENT '一级目录名',
  `cid` bigint(10) NOT NULL COMMENT '一级目录编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


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


-- 导出  表 peanut.tb_video_second_list 结构
CREATE TABLE IF NOT EXISTS `tb_video_second_list` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `icon` varchar(100) NOT NULL COMMENT '图片地址',
  `name` varchar(20) NOT NULL COMMENT '二级目录名字',
  `cid` bigint(10) NOT NULL COMMENT '二级目录编号',
  `fid` bigint(10) NOT NULL COMMENT '对应一级目录的cid',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;


/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
