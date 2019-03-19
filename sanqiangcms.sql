-- phpMyAdmin SQL Dump
-- version 4.4.15
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2019-03-15 17:15:48
-- 服务器版本： 5.7.22
-- PHP Version: 7.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sanqiangcms`
--

-- --------------------------------------------------------

--
-- 表的结构 `dc_admin`
--

CREATE TABLE IF NOT EXISTS `dc_admin` (
  `id` int(10) NOT NULL,
  `gid` int(10) NOT NULL DEFAULT '1',
  `user` varchar(20) NOT NULL,
  `password` varchar(32) NOT NULL,
  `nicename` varchar(20) DEFAULT NULL,
  `regtime` int(10) DEFAULT NULL,
  `logintime` int(10) DEFAULT NULL,
  `ip` varchar(15) DEFAULT '未知',
  `status` int(1) unsigned DEFAULT '1',
  `loginnum` int(10) DEFAULT '1',
  `keep` int(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员信息表';

--
-- 转存表中的数据 `dc_admin`
--

INSERT INTO `dc_admin` (`id`, `gid`, `user`, `password`, `nicename`, `regtime`, `logintime`, `ip`, `status`, `loginnum`, `keep`) VALUES
(1, 1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'duxcms', 1350138971, 1552620061, '127.0.0.1', 1, 112, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dc_admin_group`
--

CREATE TABLE IF NOT EXISTS `dc_admin_group` (
  `id` int(10) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `menu_power` text,
  `model_power` text,
  `class_power` text,
  `form_power` text,
  `grade` tinyint(1) DEFAULT '3',
  `keep` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_admin_group`
--

INSERT INTO `dc_admin_group` (`id`, `name`, `menu_power`, `model_power`, `class_power`, `form_power`, `grade`, `keep`) VALUES
(1, '超级管理组', NULL, '', '', '', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dc_admin_log`
--

CREATE TABLE IF NOT EXISTS `dc_admin_log` (
  `id` int(10) NOT NULL,
  `uid` int(10) DEFAULT NULL,
  `time` int(10) DEFAULT NULL,
  `ip` varchar(250) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_admin_log`
--

INSERT INTO `dc_admin_log` (`id`, `uid`, `time`, `ip`) VALUES
(1, 1, 1540799638, '127.0.0.1'),
(2, 1, 1540802465, '127.0.0.1'),
(3, 1, 1540803077, '127.0.0.1'),
(4, 1, 1540862831, '127.0.0.1'),
(5, 1, 1550642873, '127.0.0.1'),
(6, 1, 1551240033, '127.0.0.1'),
(7, 1, 1551332315, '127.0.0.1'),
(8, 1, 1551403533, '127.0.0.1'),
(9, 1, 1551669241, '127.0.0.1'),
(10, 1, 1551937234, '127.0.0.1'),
(11, 1, 1551937238, '127.0.0.1'),
(12, 1, 1552008242, '127.0.0.1'),
(13, 1, 1552042633, '127.0.0.1'),
(14, 1, 1552097926, '127.0.0.1'),
(15, 1, 1552112459, '127.0.0.1'),
(16, 1, 1552266925, '127.0.0.1'),
(17, 1, 1552298948, '127.0.0.1'),
(18, 1, 1552362247, '127.0.0.1'),
(19, 1, 1552374289, '127.0.0.1'),
(20, 1, 1552378917, '127.0.0.1'),
(21, 1, 1552441921, '127.0.0.1'),
(22, 1, 1552463032, '127.0.0.1'),
(23, 1, 1552468024, '127.0.0.1'),
(24, 1, 1552544331, '127.0.0.1'),
(25, 1, 1552611531, '127.0.0.1'),
(26, 1, 1552612477, '127.0.0.1'),
(27, 1, 1552612557, '127.0.0.1'),
(28, 1, 1552612876, '127.0.0.1'),
(29, 1, 1552612937, '127.0.0.1'),
(30, 1, 1552613234, '127.0.0.1'),
(31, 1, 1552613447, '127.0.0.1'),
(32, 1, 1552620061, '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `dc_admin_menu`
--

CREATE TABLE IF NOT EXISTS `dc_admin_menu` (
  `id` int(10) NOT NULL,
  `pid` int(10) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `module` varchar(250) DEFAULT NULL,
  `status` int(10) NOT NULL DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_admin_menu`
--

INSERT INTO `dc_admin_menu` (`id`, `pid`, `name`, `module`, `status`) VALUES
(1, 0, '首页', NULL, 1),
(3, 1, '系统设置', 'setting', 1),
(4, 1, '模型管理', 'model_manage', 1),
(10, 0, '扩展', NULL, 1),
(11, 10, '扩展模型', 'expand_model', 1),
(12, 10, '自定义变量', 'fragment', 1),
(13, 10, '内容替换', 'replace', 1),
(14, 10, 'TAG管理', 'tags', 1),
(15, 10, '推荐位管理', 'position', 1),
(16, 10, '附件管理', 'upload_file', 1),
(20, 0, '用户', NULL, 1),
(21, 20, '管理组管理', 'user_group', 1),
(22, 20, '管理员管理', 'user', 1),
(23, 20, '后台登录记录', 'log', 1),
(24, 1, '插件管理', 'plugin', 1),
(25, 1, '程序升级', 'upgrade', 1),
(26, 1, '语言管理', 'lang', 1),
(30, 0, '栏目', NULL, 1),
(31, 30, '栏目管理', 'category', 1),
(40, 0, '内容', '', 1),
(41, 40, '内容管理', 'content', 1),
(50, 0, '表单', '', 1),
(51, 50, '表单设置', 'form', 1);

-- --------------------------------------------------------

--
-- 表的结构 `dc_admin_power`
--

CREATE TABLE IF NOT EXISTS `dc_admin_power` (
  `sequence` int(10) DEFAULT NULL,
  `action` varchar(250) DEFAULT NULL,
  `pid` int(10) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_admin_power`
--

INSERT INTO `dc_admin_power` (`sequence`, `action`, `pid`, `name`) VALUES
(1, 'visit', 3, '浏览'),
(2, 'edit', 3, '保存'),
(1, 'visit', 4, '浏览'),
(2, 'in', 4, '导入'),
(3, 'out', 4, '导出'),
(4, 'config', 4, '配置'),
(5, 'del', 4, '删除'),
(3, 'status', 24, '状态'),
(2, 'install', 24, '安装'),
(4, 'out', 24, '导出'),
(5, 'uninstall', 24, '卸载'),
(2, 'upgrade', 25, '升级'),
(1, 'add', 26, '添加'),
(2, 'edit', 26, '修改'),
(3, 'del', 26, '删除'),
(2, 'add', 31, '添加'),
(3, 'edit', 31, '修改'),
(4, 'del', 31, '删除'),
(2, 'add', 41, '添加'),
(3, 'edit', 41, '编辑'),
(4, 'del', 41, '删除'),
(5, 'past', 41, '审核通过'),
(6, 'cancel', 41, '取消审核'),
(1, 'visit', 11, '浏览'),
(1, 'visit', 24, '浏览'),
(1, 'visit', 25, '浏览'),
(1, 'visit', 26, '浏览'),
(1, 'visit', 31, '浏览'),
(1, 'visit', 41, '浏览'),
(6, 'in', 11, '导入'),
(7, 'out', 11, '导出'),
(3, 'add', 11, '添加'),
(4, 'edit', 11, '编辑'),
(5, 'del', 11, '删除'),
(1, 'visit', 12, '浏览'),
(2, 'add', 12, '添加'),
(3, 'edit', 12, '编辑'),
(4, 'del', 12, '删除'),
(1, 'visit', 13, '浏览'),
(2, 'add', 13, '添加'),
(3, 'edit', 13, '编辑'),
(4, 'del', 13, '删除'),
(2, 'del', 14, '删除'),
(3, 'class', 14, '分组'),
(1, 'visit', 15, '浏览'),
(2, 'add', 15, '添加'),
(3, 'edit', 15, '编辑'),
(4, 'del', 15, '删除'),
(1, 'visit', 14, '浏览'),
(1, 'visit', 16, '浏览'),
(2, 'del', 16, '删除'),
(1, 'visit', 21, '浏览'),
(2, 'add', 21, '添加'),
(3, 'edit', 21, '编辑'),
(4, 'del', 21, '删除'),
(1, 'visit', 22, '浏览'),
(2, 'add', 22, '添加'),
(3, 'edit', 22, '编辑'),
(4, 'current', 22, '只显示自己'),
(1, 'visit', 23, '浏览'),
(4, 'class_config', 14, '分组管理'),
(1, 'visit', 51, '浏览'),
(2, 'add', 51, '添加'),
(3, 'edit', 51, '编辑'),
(4, 'del', 51, '删除'),
(5, 'in', 51, '导入'),
(6, 'out', 51, '导出'),
(7, 'field', 51, '字段管理'),
(5, 'info', 22, '资料修改');

-- --------------------------------------------------------

--
-- 表的结构 `dc_category`
--

CREATE TABLE IF NOT EXISTS `dc_category` (
  `cid` int(10) NOT NULL,
  `pid` int(10) NOT NULL DEFAULT '0',
  `mid` int(10) NOT NULL DEFAULT '1',
  `sequence` int(10) NOT NULL DEFAULT '0',
  `show` int(10) NOT NULL DEFAULT '1',
  `type` int(11) NOT NULL DEFAULT '1',
  `name` varchar(250) DEFAULT NULL,
  `urlname` varchar(250) DEFAULT NULL,
  `subname` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `class_tpl` varchar(250) DEFAULT NULL,
  `content_tpl` varchar(250) DEFAULT NULL,
  `page` int(10) DEFAULT NULL,
  `keywords` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `seo_content` text,
  `content_order` varchar(250) DEFAULT NULL,
  `lang` int(10) NOT NULL DEFAULT '1',
  `expand` int(10) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_category`
--

INSERT INTO `dc_category` (`cid`, `pid`, `mid`, `sequence`, `show`, `type`, `name`, `urlname`, `subname`, `image`, `class_tpl`, `content_tpl`, `page`, `keywords`, `description`, `seo_content`, `content_order`, `lang`, `expand`) VALUES
(1, 0, 1, 0, 1, 1, '首页', '00', NULL, '/upload/2019-03/09/product_nav_1-94c0d.png', 'index.html', 'index.html', 10, NULL, NULL, NULL, 'updatetime DESC', 1, 0),
(2, 0, 1, 0, 1, 1, '三强', 'guanyuwomen', NULL, '/upload/2019-03/09/product_nav_5.png', 'sqabout.html', 'sqabout.html', 10, NULL, NULL, NULL, 'updatetime DESC', 1, 0),
(3, 0, 1, 0, 1, 0, '产品', 'chanpinzhanshi', NULL, '/upload/2019-03/09/product_nav_2.png', 'sqproduct.html', 'sqproduct.html', 10, NULL, NULL, NULL, 'updatetime DESC', 1, 0),
(4, 0, 1, 0, 1, 0, '新闻', 'xinwendongtai', NULL, '/upload/2019-03/09/product_nav_3.png', 'sqnews.html', 'sqnewslist.html', 10, NULL, NULL, NULL, 'updatetime DESC', 1, 1),
(5, 0, 1, 0, 1, 1, '招聘', 'rencaitongdao', NULL, '/upload/2019-03/09/product_nav_4.png', 'sqrencai.html', 'rencaidetail.html', 10, NULL, NULL, NULL, 'updatetime DESC', 1, 0),
(25, 4, 1, 0, 1, 1, '公司新闻', 'gongsixinwen', NULL, NULL, 'index.html', 'sqnewslist.html', 10, NULL, NULL, NULL, 'updatetime DESC', 1, 0),
(10, 4, 1, 0, 1, 1, '新闻管理', 'xinwenguanli', NULL, NULL, 'sqnews.html', 'sqnewslist.html', 10, NULL, NULL, NULL, 'updatetime DESC', 1, 1),
(12, 0, 1, 0, 1, 1, '联系我们', 'lianxiwomen', NULL, NULL, 'sqcontectus.html', 'sqcontectus.html', 10, NULL, NULL, NULL, 'updatetime DESC', 1, 0),
(15, 3, 1, 0, 1, 1, '阻燃合金', 'chanpinxinxi', NULL, NULL, 'list.html', 'sqproduct.html', 10, NULL, NULL, NULL, 'updatetime DESC', 1, 0),
(16, 0, 1, 0, 0, 1, '首页轮播图', 'shouyelunbotu', NULL, NULL, 'list.html', 'content.html', 10, NULL, NULL, NULL, 'updatetime DESC', 1, 0),
(17, 3, 1, 0, 1, 1, '阻燃合金', 'zuranhejin', NULL, NULL, 'list.html', 'content.html', 10, NULL, NULL, NULL, 'updatetime DESC', 1, 0),
(18, 3, 1, 0, 1, 1, '改性热塑性聚酯系列', 'gaixingresuxingjuxilie', NULL, NULL, 'list.html', 'content.html', 10, NULL, NULL, NULL, 'updatetime DESC', 1, 0),
(19, 3, 1, 0, 1, 1, '改性聚碳酸酯系列', 'gaixingjutansuanxilie', NULL, NULL, 'list.html', 'content.html', 10, NULL, NULL, NULL, 'updatetime DESC', 1, 0),
(26, 4, 1, 0, 1, 1, '行业新闻', 'xingyexinwen', NULL, NULL, 'index.html', 'sqnewslist.html', 10, NULL, NULL, NULL, 'updatetime DESC', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dc_category_jump`
--

CREATE TABLE IF NOT EXISTS `dc_category_jump` (
  `id` int(11) unsigned NOT NULL,
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `url` varchar(250) DEFAULT NULL COMMENT '内容'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章栏目分类';

-- --------------------------------------------------------

--
-- 表的结构 `dc_category_page`
--

CREATE TABLE IF NOT EXISTS `dc_category_page` (
  `id` int(11) unsigned NOT NULL,
  `cid` int(11) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext COMMENT '内容'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='文章栏目分类';

-- --------------------------------------------------------

--
-- 表的结构 `dc_content`
--

CREATE TABLE IF NOT EXISTS `dc_content` (
  `aid` int(10) NOT NULL COMMENT '文章ID',
  `cid` int(10) DEFAULT NULL COMMENT '栏目ID',
  `title` varchar(250) DEFAULT NULL COMMENT '标题',
  `urltitle` varchar(250) DEFAULT NULL COMMENT 'URL路径',
  `subtitle` varchar(250) DEFAULT NULL COMMENT '短标题',
  `font_color` varchar(250) DEFAULT NULL COMMENT '颜色',
  `font_bold` int(1) DEFAULT NULL COMMENT '加粗',
  `keywords` varchar(250) DEFAULT NULL COMMENT '关键词',
  `description` varchar(250) DEFAULT NULL COMMENT '描述',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `inputtime` int(10) DEFAULT NULL COMMENT '发布时间',
  `image` varchar(250) DEFAULT NULL COMMENT '封面图',
  `url` varchar(250) DEFAULT NULL COMMENT '跳转',
  `sequence` int(10) DEFAULT NULL COMMENT '排序',
  `tpl` varchar(250) DEFAULT NULL COMMENT '模板',
  `status` int(10) DEFAULT NULL COMMENT '状态',
  `copyfrom` varchar(250) DEFAULT NULL COMMENT '来源',
  `views` int(10) NOT NULL DEFAULT '0' COMMENT '浏览数',
  `position` varchar(250) DEFAULT NULL,
  `taglink` int(10) NOT NULL DEFAULT '0' COMMENT 'TAG链接'
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_content`
--

INSERT INTO `dc_content` (`aid`, `cid`, `title`, `urltitle`, `subtitle`, `font_color`, `font_bold`, `keywords`, `description`, `updatetime`, `inputtime`, `image`, `url`, `sequence`, `tpl`, `status`, `copyfrom`, `views`, `position`, `taglink`) VALUES
(1, 10, '泰国提升橡胶使用量，1年内占产胶量30%', 'xinwen1', NULL, NULL, NULL, NULL, NULL, 1552639461, 1552114916, '/upload/2019-03/09/newspeitu1.png', NULL, NULL, NULL, 1, NULL, 34, NULL, 0),
(2, 10, '泰国提升橡胶使用量，1年内占产胶量30%', 'taiguotishengxiangjiaoshiyongl', NULL, NULL, NULL, NULL, NULL, 1552558602, 1552116098, '/upload/2019-03/09/newspeitu1.png', NULL, NULL, NULL, 1, NULL, 58, NULL, 0),
(21, 5, '242134', '242134', NULL, NULL, NULL, NULL, NULL, 1552636342, 1552636346, NULL, NULL, NULL, NULL, 1, NULL, 3, NULL, 0),
(5, 10, '热塑性聚酯弹性体(TPEE)性能与应用', 'resuxingjudanxingtiTPEExingnen', NULL, NULL, NULL, NULL, NULL, 1552558594, 1552557726, '/upload/2019-03/09/newspeitu1.png', NULL, NULL, NULL, 1, NULL, 7, NULL, 0),
(22, 25, '泰国提升橡胶使用量，1年内占产胶量30%', 'taiguotishengxiangjiaoshiyongl2cd1ac8fc58ae01bd79e12c0', NULL, NULL, NULL, NULL, NULL, 1552638644, 1552637998, '/upload/2019-03/15/thumb_newspeitu1-e6990.png', NULL, NULL, NULL, 1, NULL, 4, NULL, 0),
(23, 26, '热塑性聚酯弹性体(TPEE)性能与应用', 'resuxingjudanxingtiTPEExingnencc4e2f66fa6bdcc3333b35e5', NULL, NULL, NULL, NULL, NULL, 1552639014, 1552638028, '/upload/2019-03/15/thumb_middle2.png', NULL, NULL, NULL, 1, NULL, 4, NULL, 0),
(14, 15, '工程塑料', 'gongchengsuliao', 'TPEE', NULL, NULL, NULL, '黑色切粒-55D', 1552632929, 1552630024, '/upload/2019-03/15/thumb_guonei1-832bc.jpg', NULL, NULL, 'sqproduct.html', 1, '阻燃合金', 3, NULL, 0),
(15, 15, '通用塑料', 'tongyongsuliao', 'TPEE', NULL, NULL, NULL, '黑色切粒-55D', 1552632924, 1552630192, '/upload/2019-03/15/thumb_guonei2-5757f.jpg', NULL, NULL, 'sqproduct.html', 1, '阻燃合金', 0, NULL, 0),
(16, 15, '再生塑料', 'zaishengsuliao', 'TPEE', NULL, NULL, NULL, '黑色切粒-55D', 1552632912, 1552630200, '/upload/2019-03/15/thumb_guonei3-4644f.jpg', NULL, NULL, 'sqproduct.html', 1, '改性热塑性聚酯系列', 0, NULL, 0),
(17, 15, '塑料原型', 'suliaoyuanxing', 'TPEE', NULL, NULL, NULL, '黑色切粒-55D', 1552632902, 1552630215, '/upload/2019-03/15/thumb_guonei4-47f5d.jpg', NULL, NULL, 'sqproduct.html', 1, '改性聚碳酸酯系列', 14, NULL, 0),
(18, 15, '橡胶原料', 'xiangjiaoyuanliao', 'TPEE', NULL, NULL, NULL, '黑色切粒-55D', 1552632897, 1552630224, '/upload/2019-03/15/thumb_guonei5-cff91.jpg', NULL, NULL, 'sqproduct.html', 1, '热塑性聚酯弹性体系列', 14, NULL, 0),
(19, 16, '图1', 'tu1', NULL, NULL, NULL, NULL, NULL, 1552635112, 1552635140, '/upload/2019-03/15/banner1.png', NULL, NULL, NULL, 1, NULL, 0, NULL, 0),
(20, 16, '图2', 'tu2', NULL, NULL, NULL, NULL, NULL, 1552635144, 1552635167, '/upload/2019-03/15/newspeitu1.png', NULL, NULL, NULL, 1, NULL, 0, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `dc_content_data`
--

CREATE TABLE IF NOT EXISTS `dc_content_data` (
  `id` int(10) NOT NULL,
  `aid` int(10) DEFAULT NULL,
  `content` text
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_content_data`
--

INSERT INTO `dc_content_data` (`id`, `aid`, `content`) VALUES
(1, 1, '&lt;p&gt;\n	新我i十分士大夫、撒额地方safs地方\n&lt;/p&gt;\n&lt;p&gt;\n	&lt;br /&gt;\n&lt;/p&gt;\n&lt;p&gt;\n	&lt;br /&gt;\n&lt;/p&gt;\n&lt;p&gt;\n	&lt;br /&gt;\n&lt;/p&gt;\n&lt;p&gt;\n	&lt;br /&gt;\n&lt;/p&gt;'),
(2, 2, NULL),
(21, 21, '234234'),
(5, 5, NULL),
(22, 22, '是离开时代峰峻个丰东股份'),
(23, 23, '行业新闻。。。。。。。。。。。。。。。。。。。。。'),
(14, 14, '&lt;img src=&quot;/upload/2019-03/15/guonei1-832bc.jpg&quot; title=&quot;guonei1&quot; alt=&quot;guonei1&quot; /&gt;'),
(15, 15, '&lt;img src=&quot;/upload/2019-03/15/guonei2-5757f.jpg&quot; title=&quot;guonei2&quot; alt=&quot;guonei2&quot; /&gt;'),
(16, 16, '&lt;img src=&quot;/upload/2019-03/15/guonei3-4644f.jpg&quot; title=&quot;guonei3&quot; alt=&quot;guonei3&quot; /&gt;'),
(17, 17, '&lt;img src=&quot;/upload/2019-03/15/guonei4-47f5d.jpg&quot; title=&quot;guonei4&quot; alt=&quot;guonei4&quot; /&gt;'),
(18, 18, '&lt;img src=&quot;/upload/2019-03/15/guonei5-cff91.jpg&quot; title=&quot;guonei5&quot; alt=&quot;guonei5&quot; /&gt;'),
(19, 19, '&lt;img src=&quot;/upload/2019-03/15/banner1.png&quot; title=&quot;banner1&quot; alt=&quot;banner1&quot; /&gt;'),
(20, 20, '&lt;img src=&quot;/upload/2019-03/15/newspeitu1.png&quot; title=&quot;newspeitu1&quot; alt=&quot;newspeitu1&quot; /&gt;');

-- --------------------------------------------------------

--
-- 表的结构 `dc_expand_content_product`
--

CREATE TABLE IF NOT EXISTS `dc_expand_content_product` (
  `id` int(10) NOT NULL,
  `aid` int(10) DEFAULT NULL,
  `product` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `dc_expand_content_recruit`
--

CREATE TABLE IF NOT EXISTS `dc_expand_content_recruit` (
  `id` int(10) NOT NULL,
  `aid` int(10) DEFAULT NULL,
  `recruit` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `dc_expand_content_xinwen`
--

CREATE TABLE IF NOT EXISTS `dc_expand_content_xinwen` (
  `id` int(10) NOT NULL,
  `aid` int(10) DEFAULT NULL,
  `xinwen_image` varchar(250) DEFAULT NULL,
  `xinwen_content` text
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_expand_content_xinwen`
--

INSERT INTO `dc_expand_content_xinwen` (`id`, `aid`, `xinwen_image`, `xinwen_content`) VALUES
(1, 1, '/upload/2019-03/09/talent_recruitment.png', '&lt;p&gt;\n	我是内同\n&lt;/p&gt;\n&lt;p&gt;\n	&lt;br /&gt;\n&lt;/p&gt;\n&lt;p&gt;\n	&lt;br /&gt;\n&lt;/p&gt;\n&lt;p&gt;\n	&amp;nbsp;sd f\n&lt;/p&gt;\n&lt;p&gt;\n	sd\n&lt;/p&gt;\n&lt;p&gt;\n	&amp;nbsp;\n&lt;/p&gt;\n&lt;p&gt;\n	&amp;nbsp;\n&lt;/p&gt;\n&lt;p&gt;\n	&lt;br /&gt;\n&lt;/p&gt;\n&lt;p&gt;\n	&amp;nbsp;\n&lt;/p&gt;\n&lt;p&gt;\n	&amp;nbsp;\n&lt;/p&gt;'),
(2, 2, '/upload/2019-03/09/company_purpose.png', '&lt;p&gt;\n	我的天啊\n&lt;/p&gt;'),
(4, 5, '/upload/2019-03/09/company_purpose.png', '新闻内容');

-- --------------------------------------------------------

--
-- 表的结构 `dc_expand_model`
--

CREATE TABLE IF NOT EXISTS `dc_expand_model` (
  `mid` int(10) NOT NULL,
  `table` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_expand_model`
--

INSERT INTO `dc_expand_model` (`mid`, `table`, `name`) VALUES
(1, 'xinwen', '新闻'),
(2, 'recruit', '招聘'),
(4, 'product', '产品信息');

-- --------------------------------------------------------

--
-- 表的结构 `dc_expand_model_field`
--

CREATE TABLE IF NOT EXISTS `dc_expand_model_field` (
  `fid` int(10) NOT NULL,
  `mid` int(10) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `field` varchar(250) DEFAULT NULL,
  `type` int(10) DEFAULT '1',
  `property` int(10) DEFAULT NULL,
  `len` int(10) DEFAULT NULL,
  `decimal` int(10) DEFAULT NULL,
  `default` varchar(250) DEFAULT NULL,
  `sequence` int(10) DEFAULT '0',
  `tip` varchar(250) DEFAULT NULL,
  `must` int(10) DEFAULT '0',
  `config` text
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_expand_model_field`
--

INSERT INTO `dc_expand_model_field` (`fid`, `mid`, `name`, `field`, `type`, `property`, `len`, `decimal`, `default`, `sequence`, `tip`, `must`, `config`) VALUES
(1, 1, '新闻预览图', 'xinwen_image', 10, 1, 250, 0, NULL, 0, NULL, 1, NULL),
(2, 1, '新闻内容', 'xinwen_content', 3, 3, 0, 0, NULL, 0, NULL, 1, NULL),
(3, 2, '招聘', 'recruit', 3, 3, 0, 0, NULL, 0, '招聘', 0, NULL),
(4, 4, '产品信息', 'product', 1, 1, 250, 0, NULL, 0, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `dc_form`
--

CREATE TABLE IF NOT EXISTS `dc_form` (
  `id` int(10) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `table` varchar(20) DEFAULT NULL,
  `display` int(10) NOT NULL DEFAULT '0',
  `page` int(10) NOT NULL DEFAULT '10',
  `tpl` varchar(250) DEFAULT NULL,
  `alone_tpl` int(10) NOT NULL DEFAULT '0',
  `order` varchar(20) DEFAULT NULL,
  `where` varchar(250) DEFAULT NULL,
  `return_type` int(10) NOT NULL DEFAULT '0',
  `return_msg` varchar(250) DEFAULT NULL,
  `return_url` varchar(250) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_form`
--

INSERT INTO `dc_form` (`id`, `name`, `table`, `display`, `page`, `tpl`, `alone_tpl`, `order`, `where`, `return_type`, `return_msg`, `return_url`) VALUES
(2, '留言板', 'guestbook', 1, 10, 'guestbook.html', 0, 'id desc', 'status=1', 0, '表单提交成功！', NULL),
(3, '联系我们', 'contact_us', 1, 10, NULL, 1, 'id desc', NULL, 0, '表单提交成功', NULL),
(4, '首页轮播图', 'broadcast', 1, 10, NULL, 1, 'id desc', NULL, 0, '表单提交成功', NULL),
(5, '关于我们banner图', 'about_me', 1, 10, NULL, 1, 'id desc', NULL, 0, '表单提交成功', NULL),
(6, '人才招聘banner图', 'rencai_banner', 1, 10, NULL, 1, 'id desc', NULL, 0, '表单提交成功', NULL),
(7, '新闻动态banner图', 'xinwen_dongtai', 1, 10, NULL, 1, 'id desc', NULL, 0, '表单提交成功', NULL),
(8, '产品展示轮播图', 'productview_banner', 1, 10, NULL, 1, 'id desc', NULL, 0, '表单提交成功', NULL),
(9, '留言板1', 'message_board', 1, 10, 'sqabout.html', 1, 'id desc', NULL, 0, '表单提交成功', NULL),
(10, '图片', 'img', 1, 10, NULL, 1, 'id desc', NULL, 0, '表单提交成功', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `dc_form_data_about_me`
--

CREATE TABLE IF NOT EXISTS `dc_form_data_about_me` (
  `id` int(10) NOT NULL,
  `lang` int(10) DEFAULT '1',
  `about_me_img` varchar(250) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_form_data_about_me`
--

INSERT INTO `dc_form_data_about_me` (`id`, `lang`, `about_me_img`) VALUES
(1, 1, '/upload/2019-03/11/aboutus.png');

-- --------------------------------------------------------

--
-- 表的结构 `dc_form_data_broadcast`
--

CREATE TABLE IF NOT EXISTS `dc_form_data_broadcast` (
  `id` int(10) NOT NULL,
  `lang` int(10) DEFAULT '1',
  `broadcast_pic` text
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_form_data_broadcast`
--

INSERT INTO `dc_form_data_broadcast` (`id`, `lang`, `broadcast_pic`) VALUES
(1, 1, 'a:1:{i:0;a:4:{s:3:"url";s:30:"/upload/2019-03/11/banner1.png";s:8:"original";s:0:"";s:5:"title";s:0:"";s:5:"order";s:0:"";}}');

-- --------------------------------------------------------

--
-- 表的结构 `dc_form_data_contact_us`
--

CREATE TABLE IF NOT EXISTS `dc_form_data_contact_us` (
  `id` int(10) NOT NULL,
  `lang` int(10) DEFAULT '1',
  `lianxiwomen` text
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_form_data_contact_us`
--

INSERT INTO `dc_form_data_contact_us` (`id`, `lang`, `lianxiwomen`) VALUES
(1, 1, '&lt;p&gt;\n	三强塑料厂\n&lt;/p&gt;\n&lt;p&gt;\n	地址：佛山市顺德区杏坛镇吕地工业区东乐路9号\n&lt;/p&gt;\n&lt;p&gt;\n	传真：27779022\n&lt;/p&gt;\n&lt;p&gt;\n	电话：0757-27779022\n&lt;/p&gt;\n&lt;p&gt;\n	客服邮箱：27779022@Sanq.com\n&lt;/p&gt;');

-- --------------------------------------------------------

--
-- 表的结构 `dc_form_data_guestbook`
--

CREATE TABLE IF NOT EXISTS `dc_form_data_guestbook` (
  `id` int(10) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `content` text,
  `time` int(10) DEFAULT NULL,
  `http` varchar(250) DEFAULT NULL,
  `reply` text,
  `status` int(1) DEFAULT NULL,
  `lang` int(10) DEFAULT '1'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_form_data_guestbook`
--

INSERT INTO `dc_form_data_guestbook` (`id`, `name`, `email`, `content`, `time`, `http`, `reply`, `status`, `lang`) VALUES
(1, 'duxcms', '244328880@QQ.COM', '欢迎使用duxcms网站内容管理系统', 1363144151, '', '', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `dc_form_data_img`
--

CREATE TABLE IF NOT EXISTS `dc_form_data_img` (
  `id` int(10) NOT NULL,
  `lang` int(10) DEFAULT '1',
  `img` text
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_form_data_img`
--

INSERT INTO `dc_form_data_img` (`id`, `lang`, `img`) VALUES
(2, 1, 'a:3:{i:0;a:4:{s:3:"url";s:34:"/upload/2019-03/15/meide-18b6c.png";s:8:"original";s:0:"";s:5:"title";s:0:"";s:5:"order";s:0:"";}i:1;a:4:{s:3:"url";s:37:"/upload/2019-03/15/zhaoming-14c10.png";s:8:"original";s:0:"";s:5:"title";s:0:"";s:5:"order";s:0:"";}i:2;a:4:{s:3:"url";s:43:"/upload/2019-03/15/foshanzhaoming-21ec3.png";s:8:"original";s:0:"";s:5:"title";s:0:"";s:5:"order";s:0:"";}}');

-- --------------------------------------------------------

--
-- 表的结构 `dc_form_data_message_board`
--

CREATE TABLE IF NOT EXISTS `dc_form_data_message_board` (
  `id` int(10) NOT NULL,
  `lang` int(10) DEFAULT '1',
  `name` varchar(250) DEFAULT NULL,
  `phone` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `content` text
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_form_data_message_board`
--

INSERT INTO `dc_form_data_message_board` (`id`, `lang`, `name`, `phone`, `email`, `content`) VALUES
(1, 1, '1', '2', '3', '4');

-- --------------------------------------------------------

--
-- 表的结构 `dc_form_data_productview_banner`
--

CREATE TABLE IF NOT EXISTS `dc_form_data_productview_banner` (
  `id` int(10) NOT NULL,
  `lang` int(10) DEFAULT '1',
  `productview_banner_img` varchar(250) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_form_data_productview_banner`
--

INSERT INTO `dc_form_data_productview_banner` (`id`, `lang`, `productview_banner_img`) VALUES
(1, 1, '/upload/2019-03/11/chanpinzhanshibanner.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `dc_form_data_rencai_banner`
--

CREATE TABLE IF NOT EXISTS `dc_form_data_rencai_banner` (
  `id` int(10) NOT NULL,
  `lang` int(10) DEFAULT '1',
  `rencai_banner_img` varchar(250) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_form_data_rencai_banner`
--

INSERT INTO `dc_form_data_rencai_banner` (`id`, `lang`, `rencai_banner_img`) VALUES
(1, 1, '/upload/2019-03/11/rencaibanner.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `dc_form_data_xinwen_dongtai`
--

CREATE TABLE IF NOT EXISTS `dc_form_data_xinwen_dongtai` (
  `id` int(10) NOT NULL,
  `lang` int(10) DEFAULT '1',
  `xinwen_dongtai_img` varchar(250) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_form_data_xinwen_dongtai`
--

INSERT INTO `dc_form_data_xinwen_dongtai` (`id`, `lang`, `xinwen_dongtai_img`) VALUES
(1, 1, '/upload/2019-03/11/banner1-71bb2.png');

-- --------------------------------------------------------

--
-- 表的结构 `dc_form_field`
--

CREATE TABLE IF NOT EXISTS `dc_form_field` (
  `id` int(10) NOT NULL,
  `fid` int(10) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `field` varchar(250) DEFAULT NULL,
  `type` int(10) DEFAULT '1',
  `property` int(10) DEFAULT NULL,
  `len` int(10) DEFAULT NULL,
  `decimal` int(10) DEFAULT NULL,
  `default` varchar(250) DEFAULT NULL,
  `sequence` int(10) DEFAULT '0',
  `tip` varchar(250) DEFAULT NULL,
  `config` text,
  `must` int(10) DEFAULT '0',
  `admin_display` int(10) DEFAULT NULL,
  `admin_html` text
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_form_field`
--

INSERT INTO `dc_form_field` (`id`, `fid`, `name`, `field`, `type`, `property`, `len`, `decimal`, `default`, `sequence`, `tip`, `config`, `must`, `admin_display`, `admin_html`) VALUES
(4, 2, '昵称', 'name', 1, 1, 250, 0, '', 1, '', '', 1, 1, ''),
(5, 2, '邮箱', 'email', 1, 1, 250, 0, '', 2, '', '', 1, 1, ''),
(6, 2, '内容', 'content', 3, 3, 0, 0, '', 3, '', '', 1, 1, ''),
(7, 2, '时间', 'time', 7, 2, 10, 0, '', 4, '', '', 1, 1, 'echo date(''Y-m-d H:i:s'',{content});'),
(12, 2, '网址', 'http', 1, 1, 250, 0, '', 0, '', '', 0, 0, ''),
(13, 2, '管理员回复', 'reply', 2, 3, 0, 0, '', 0, '', '', 0, 0, ''),
(14, 2, '审核', 'status', 8, 2, 1, 0, '0', 0, '', '审核|1\n未审核|0', 0, 1, 'if({content}==1){\necho ''审核'';\n}else{\necho ''未审核'';\n}\n'),
(15, 3, '联系我们', 'lianxiwomen', 3, 3, 0, 0, NULL, 0, '联系我们', NULL, 0, 0, NULL),
(16, 4, '首页轮播组图', 'broadcast_pic', 5, 3, 0, 0, NULL, 0, NULL, NULL, 0, 0, NULL),
(17, 5, '关于我们banner图', 'about_me_img', 10, 1, 250, 0, NULL, 0, NULL, NULL, 0, 0, NULL),
(18, 6, '人才招聘banner图', 'rencai_banner_img', 10, 1, 250, 0, NULL, 0, NULL, NULL, 0, 0, NULL),
(19, 7, '新闻动态banner图', 'xinwen_dongtai_img', 10, 1, 250, 0, NULL, 0, NULL, NULL, 0, 0, NULL),
(20, 8, '产品展示轮播图', 'productview_banner_img', 10, 1, 250, 0, NULL, 0, NULL, NULL, 0, 0, NULL),
(21, 9, '姓名', 'name', 1, 1, 250, 0, NULL, 0, NULL, NULL, 0, 1, NULL),
(22, 9, '电话', 'phone', 1, 1, 250, 0, NULL, 0, NULL, NULL, 0, 1, NULL),
(23, 9, '邮箱', 'email', 1, 1, 250, 0, NULL, 0, NULL, NULL, 0, 1, NULL),
(24, 9, '留言内容', 'content', 2, 3, 0, 0, NULL, 0, NULL, NULL, 0, 1, NULL),
(25, 10, '图片', 'img', 5, 3, 0, 0, NULL, 0, NULL, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `dc_fragment`
--

CREATE TABLE IF NOT EXISTS `dc_fragment` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `content` text,
  `title` varchar(250) DEFAULT NULL,
  `sign` varchar(250) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='文章信息表';

--
-- 转存表中的数据 `dc_fragment`
--

INSERT INTO `dc_fragment` (`id`, `content`, `title`, `sign`) VALUES
(1, '欢迎使用DUXCMS网站管理系统，DUXCMS是一款针对中小企业所开发的专业网站管理系统。&lt;br /&gt;\n进入后台请在网之后加admin,后台默认帐号密码均为:admin&lt;br /&gt;\n网站上线后请更改后台密码以免影响您的安全', '简介', 'info'),
(2, '版权所有：DUXCMS 地址：中国.独享网络小组 电话：+86-000000000 &amp;nbsp;传真：\r\n+86-0000000', '底部信息', 'dibu');

-- --------------------------------------------------------

--
-- 表的结构 `dc_lang`
--

CREATE TABLE IF NOT EXISTS `dc_lang` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `lang` varchar(255) DEFAULT NULL,
  `protection` int(1) DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_lang`
--

INSERT INTO `dc_lang` (`id`, `name`, `lang`, `protection`) VALUES
(1, '中文', 'zh', 1),
(2, 'english', 'en', 0);

-- --------------------------------------------------------

--
-- 表的结构 `dc_model`
--

CREATE TABLE IF NOT EXISTS `dc_model` (
  `mid` int(10) NOT NULL,
  `model` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `admin_category` varchar(250) DEFAULT NULL,
  `admin_content` varchar(250) DEFAULT NULL,
  `module_category` varchar(250) DEFAULT NULL,
  `module_content` varchar(250) DEFAULT NULL,
  `url_category` varchar(250) DEFAULT NULL,
  `url_category_page` varchar(250) DEFAULT NULL,
  `url_content` varchar(250) DEFAULT NULL,
  `url_content_page` varchar(250) DEFAULT NULL,
  `table` text,
  `file` text,
  `config` text,
  `befrom` text
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_model`
--

INSERT INTO `dc_model` (`mid`, `model`, `name`, `admin_category`, `admin_content`, `module_category`, `module_content`, `url_category`, `url_category_page`, `url_content`, `url_content_page`, `table`, `file`, `config`, `befrom`) VALUES
(1, 'content', '新闻', 'content_category', 'content', 'category', 'content', '{CDIR}/', '{CDIR}/index-{P}{EXT}', '{CDIR}/{YYYY}/{M}-{D}/{AID}{EXT}', '{CDIR}/{YYYY}/{M}-{D}/{AID}-{P}{EXT}', NULL, NULL, NULL, 'DUXCMS'),
(3, 'jump', '跳转', 'jump_category', NULL, 'jump', NULL, '{CDIR}/', '{CDIR}/index-{P}{EXT}', '{CDIR}/{YYYY}/{M}-{D}/{AID}{EXT}', '{CDIR}/{YYYY}/{M}-{D}/{AID}{EXT}', NULL, NULL, NULL, 'DUXCMS'),
(2, 'pages', '页面', 'pages_category', NULL, 'pages', NULL, '{CDIR}/', '{CDIR}/index-{P}{EXT}', '{CDIR}/{YYYY}/{M}-{D}/{AID}{EXT}', '{CDIR}/{YYYY}/{M}-{D}/{AID}{EXT}', NULL, NULL, NULL, 'DUXCMS');

-- --------------------------------------------------------

--
-- 表的结构 `dc_plugin`
--

CREATE TABLE IF NOT EXISTS `dc_plugin` (
  `id` int(10) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `file` varchar(250) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `mid` int(10) DEFAULT NULL,
  `ver` int(11) DEFAULT NULL,
  `author` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `dc_position`
--

CREATE TABLE IF NOT EXISTS `dc_position` (
  `id` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `sequence` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_position`
--

INSERT INTO `dc_position` (`id`, `name`, `sequence`) VALUES
(1, '首页推荐', 1),
(3, '幻灯片', 0),
(4, '栏目推荐', 0);

-- --------------------------------------------------------

--
-- 表的结构 `dc_position_relation`
--

CREATE TABLE IF NOT EXISTS `dc_position_relation` (
  `aid` int(10) NOT NULL,
  `pid` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_position_relation`
--

INSERT INTO `dc_position_relation` (`aid`, `pid`) VALUES
(43, 4),
(45, 3);

-- --------------------------------------------------------

--
-- 表的结构 `dc_replace`
--

CREATE TABLE IF NOT EXISTS `dc_replace` (
  `id` int(10) unsigned NOT NULL,
  `key` varchar(250) DEFAULT NULL,
  `content` varchar(250) DEFAULT NULL,
  `num` int(5) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `dc_tags`
--

CREATE TABLE IF NOT EXISTS `dc_tags` (
  `id` int(10) NOT NULL,
  `cid` int(10) DEFAULT '0',
  `name` varchar(20) NOT NULL,
  `click` int(10) DEFAULT '1',
  `lang` int(10) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `dc_tags_category`
--

CREATE TABLE IF NOT EXISTS `dc_tags_category` (
  `cid` int(10) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `lang` int(10) DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `dc_tags_relation`
--

CREATE TABLE IF NOT EXISTS `dc_tags_relation` (
  `aid` int(10) DEFAULT NULL,
  `tid` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `dc_upload`
--

CREATE TABLE IF NOT EXISTS `dc_upload` (
  `id` int(10) unsigned NOT NULL,
  `file` varchar(250) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `folder` varchar(250) DEFAULT NULL,
  `ext` varchar(20) DEFAULT NULL,
  `size` int(10) DEFAULT NULL,
  `type` varchar(250) DEFAULT NULL,
  `time` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_upload`
--

INSERT INTO `dc_upload` (`id`, `file`, `title`, `folder`, `ext`, `size`, `type`, `time`) VALUES
(1, '1', '1', '1', '1', 1, '1', 1),
(2, '//syhung.test.upcdn.net/sanqiang.cn/{year}{mon}{day}/{hour}{min}{sec}/upload_{filemd5}{.suffix}', 'product_nav_1', '2019-03-09', 'png', 1028, 'category', 1552112680),
(3, '/upload/2019-03/09/product_nav_1-94c0d.png', 'product_nav_1', '2019-03-09', 'png', 1028, 'category', 1552112766),
(4, '/upload/2019-03/09/product_nav_2.png', 'product_nav_2', '2019-03-09', 'png', 841, 'category', 1552112813),
(5, '/upload/2019-03/09/product_nav_3.png', 'product_nav_3', '2019-03-09', 'png', 789, 'category', 1552112833),
(6, '/upload/2019-03/09/product_nav_4.png', 'product_nav_4', '2019-03-09', 'png', 1524, 'category', 1552112857),
(7, '/upload/2019-03/09/product_nav_5.png', 'product_nav_5', '2019-03-09', 'png', 1164, 'category', 1552112886),
(8, '/upload/2019-03/09/new_03.gif', 'new_03', '2019-03-09', 'gif', 174258, 'content', 1552115375),
(9, '/upload/2019-03/09/talent_recruitment.png', 'talent _recruitment', '2019-03-09', 'png', 45664, 'content', 1552115713),
(10, '/upload/2019-03/09/company_purpose.png', 'company_purpose', '2019-03-09', 'png', 61707, 'content', 1552116082),
(11, '/upload/2019-03/09/about_banner_top.png', 'about_banner_top', '2019-03-09', 'png', 298335, 'content', 1552116372),
(12, '/upload/2019-03/11/banner1.png', 'banner1', '2019-03-11', 'png', 1373799, 'form', 1552267455),
(13, '/upload/2019-03/11/aboutus.png', 'aboutus', '2019-03-11', 'png', 1174156, 'form', 1552268172),
(14, '/upload/2019-03/11/rencaibanner.jpg', 'rencaibanner', '2019-03-11', 'jpg', 67854, 'form', 1552268542),
(15, '/upload/2019-03/11/banner1-71bb2.png', 'banner1', '2019-03-11', 'png', 1373799, 'form', 1552268955),
(17, '/upload/2019-03/15/thumb_zhaoming.png', 'zhaoming', '2019-03-15', 'png', 2076, NULL, 1552613576),
(18, '/upload/2019-03/15/thumb_foshanzhaoming.png', '佛山照明', '2019-03-15', 'png', 1342, NULL, 1552613577),
(19, '/upload/2019-03/15/thumb_meide.png', '美的', '2019-03-15', 'png', 1927, NULL, 1552613577),
(20, '/upload/2019-03/15/thumb_zhaoming-75cf5.png', 'zhaoming', '2019-03-15', 'png', 2076, 'form', 1552613620),
(21, '/upload/2019-03/15/thumb_foshanzhaoming-61227.png', '佛山照明', '2019-03-15', 'png', 1342, 'form', 1552613620),
(22, '/upload/2019-03/15/thumb_meide-84083.png', '美的', '2019-03-15', 'png', 1927, 'form', 1552613620),
(23, '/upload/2019-03/15/meide-18b6c.png', '美的', '2019-03-15', 'png', 1927, 'form', 1552614685),
(24, '/upload/2019-03/15/zhaoming-14c10.png', 'zhaoming', '2019-03-15', 'png', 2076, 'form', 1552614795),
(25, '/upload/2019-03/15/foshanzhaoming-21ec3.png', '佛山照明', '2019-03-15', 'png', 1342, 'form', 1552614795),
(42, '/upload/2019-03/15/thumb_newspeitu1-e6990.png', 'newspeitu1', '2019-03-15', 'png', 91395, 'content', 1552637991),
(43, '/upload/2019-03/15/thumb_middle2.png', 'middle2', '2019-03-15', 'png', 2172, 'content', 1552638027),
(34, '/upload/2019-03/15/thumb_guonei1-832bc.jpg', 'guonei1', '2019-03-15', 'jpg', 23216, 'content', 1552630942),
(35, '/upload/2019-03/15/thumb_guonei2-5757f.jpg', 'guonei2', '2019-03-15', 'jpg', 37793, 'content', 1552631024),
(36, '/upload/2019-03/15/thumb_guonei3-4644f.jpg', 'guonei3', '2019-03-15', 'jpg', 37314, 'content', 1552631060),
(37, '/upload/2019-03/15/thumb_guonei4-47f5d.jpg', 'guonei4', '2019-03-15', 'jpg', 32417, 'content', 1552631083),
(38, '/upload/2019-03/15/thumb_guonei5-cff91.jpg', 'guonei5', '2019-03-15', 'jpg', 48189, 'content', 1552631102),
(39, '/upload/2019-03/15/banner1.png', 'banner1', '2019-03-15', 'png', 1373799, 'content', 1552635137),
(40, '/upload/2019-03/15/newspeitu1.png', 'newspeitu1', '2019-03-15', 'png', 91395, 'content', 1552635166);

-- --------------------------------------------------------

--
-- 表的结构 `dc_upload_category`
--

CREATE TABLE IF NOT EXISTS `dc_upload_category` (
  `id` int(10) DEFAULT NULL,
  `file_id` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_upload_category`
--

INSERT INTO `dc_upload_category` (`id`, `file_id`) VALUES
(1, 3),
(1, 2),
(3, 4),
(4, 5),
(5, 6),
(2, 7);

-- --------------------------------------------------------

--
-- 表的结构 `dc_upload_content`
--

CREATE TABLE IF NOT EXISTS `dc_upload_content` (
  `id` int(10) DEFAULT NULL,
  `file_id` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_upload_content`
--

INSERT INTO `dc_upload_content` (`id`, `file_id`) VALUES
(1, 9),
(1, 8),
(2, 11),
(2, 10),
(22, 42),
(23, 43),
(14, 34),
(15, 35),
(16, 36),
(17, 37),
(18, 38),
(19, 39),
(20, 40);

-- --------------------------------------------------------

--
-- 表的结构 `dc_upload_form`
--

CREATE TABLE IF NOT EXISTS `dc_upload_form` (
  `id` int(10) DEFAULT NULL,
  `file_id` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_upload_form`
--

INSERT INTO `dc_upload_form` (`id`, `file_id`) VALUES
(2, 20),
(2, 21),
(2, 22),
(2, 23),
(2, 24),
(2, 25);

-- --------------------------------------------------------

--
-- 表的结构 `dc_upload_plus`
--

CREATE TABLE IF NOT EXISTS `dc_upload_plus` (
  `id` int(10) DEFAULT NULL,
  `file_id` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `dc_web_config`
--

CREATE TABLE IF NOT EXISTS `dc_web_config` (
  `id` int(11) NOT NULL,
  `sitename` varchar(255) DEFAULT NULL,
  `seoname` varchar(255) DEFAULT NULL,
  `siteurl` varchar(255) DEFAULT NULL,
  `keywords` text,
  `description` text,
  `masteremail` varchar(255) DEFAULT NULL,
  `copyright` varchar(255) DEFAULT NULL,
  `lang` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `dc_web_config`
--

INSERT INTO `dc_web_config` (`id`, `sitename`, `seoname`, `siteurl`, `keywords`, `description`, `masteremail`, `copyright`, `lang`) VALUES
(37, '2', '13', '3', '3', '3', '3', '3', 1),
(29, 'Du11', 'F', 'h', 'Fr', 'D', 'a', 'C', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dc_admin`
--
ALTER TABLE `dc_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_admin_group`
--
ALTER TABLE `dc_admin_group`
  ADD PRIMARY KEY (`id`),
  ADD FULLTEXT KEY `power_value` (`model_power`);

--
-- Indexes for table `dc_admin_log`
--
ALTER TABLE `dc_admin_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_admin_menu`
--
ALTER TABLE `dc_admin_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module` (`module`);

--
-- Indexes for table `dc_category`
--
ALTER TABLE `dc_category`
  ADD PRIMARY KEY (`cid`),
  ADD UNIQUE KEY `urlname` (`urlname`) USING BTREE;

--
-- Indexes for table `dc_category_jump`
--
ALTER TABLE `dc_category_jump`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `dc_category_page`
--
ALTER TABLE `dc_category_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`);

--
-- Indexes for table `dc_content`
--
ALTER TABLE `dc_content`
  ADD PRIMARY KEY (`aid`),
  ADD UNIQUE KEY `urltitle` (`urltitle`) USING BTREE,
  ADD KEY `title` (`title`) USING BTREE,
  ADD KEY `description` (`copyfrom`);

--
-- Indexes for table `dc_content_data`
--
ALTER TABLE `dc_content_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_expand_content_product`
--
ALTER TABLE `dc_expand_content_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_expand_content_recruit`
--
ALTER TABLE `dc_expand_content_recruit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_expand_content_xinwen`
--
ALTER TABLE `dc_expand_content_xinwen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_expand_model`
--
ALTER TABLE `dc_expand_model`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `dc_expand_model_field`
--
ALTER TABLE `dc_expand_model_field`
  ADD PRIMARY KEY (`fid`);

--
-- Indexes for table `dc_form`
--
ALTER TABLE `dc_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_form_data_about_me`
--
ALTER TABLE `dc_form_data_about_me`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_form_data_broadcast`
--
ALTER TABLE `dc_form_data_broadcast`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_form_data_contact_us`
--
ALTER TABLE `dc_form_data_contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_form_data_guestbook`
--
ALTER TABLE `dc_form_data_guestbook`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_form_data_img`
--
ALTER TABLE `dc_form_data_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_form_data_message_board`
--
ALTER TABLE `dc_form_data_message_board`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_form_data_productview_banner`
--
ALTER TABLE `dc_form_data_productview_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_form_data_rencai_banner`
--
ALTER TABLE `dc_form_data_rencai_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_form_data_xinwen_dongtai`
--
ALTER TABLE `dc_form_data_xinwen_dongtai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_form_field`
--
ALTER TABLE `dc_form_field`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_fragment`
--
ALTER TABLE `dc_fragment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sign` (`sign`);

--
-- Indexes for table `dc_lang`
--
ALTER TABLE `dc_lang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lang` (`lang`);

--
-- Indexes for table `dc_model`
--
ALTER TABLE `dc_model`
  ADD PRIMARY KEY (`mid`),
  ADD KEY `model` (`model`);

--
-- Indexes for table `dc_plugin`
--
ALTER TABLE `dc_plugin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_position`
--
ALTER TABLE `dc_position`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `dc_position_relation`
--
ALTER TABLE `dc_position_relation`
  ADD KEY `aid` (`aid`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `dc_replace`
--
ALTER TABLE `dc_replace`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dc_tags`
--
ALTER TABLE `dc_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- Indexes for table `dc_tags_category`
--
ALTER TABLE `dc_tags_category`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `dc_tags_relation`
--
ALTER TABLE `dc_tags_relation`
  ADD KEY `aid` (`aid`),
  ADD KEY `tid` (`tid`);

--
-- Indexes for table `dc_upload`
--
ALTER TABLE `dc_upload`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`) USING BTREE,
  ADD KEY `ext` (`ext`) USING BTREE;

--
-- Indexes for table `dc_upload_category`
--
ALTER TABLE `dc_upload_category`
  ADD KEY `id` (`id`),
  ADD KEY `file_id` (`file_id`);

--
-- Indexes for table `dc_upload_content`
--
ALTER TABLE `dc_upload_content`
  ADD KEY `id` (`id`),
  ADD KEY `file_id` (`file_id`);

--
-- Indexes for table `dc_upload_form`
--
ALTER TABLE `dc_upload_form`
  ADD KEY `id` (`id`),
  ADD KEY `file_id` (`file_id`);

--
-- Indexes for table `dc_upload_plus`
--
ALTER TABLE `dc_upload_plus`
  ADD KEY `id` (`id`),
  ADD KEY `file_id` (`file_id`);

--
-- Indexes for table `dc_web_config`
--
ALTER TABLE `dc_web_config`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dc_admin`
--
ALTER TABLE `dc_admin`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dc_admin_group`
--
ALTER TABLE `dc_admin_group`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dc_admin_log`
--
ALTER TABLE `dc_admin_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `dc_admin_menu`
--
ALTER TABLE `dc_admin_menu`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `dc_category`
--
ALTER TABLE `dc_category`
  MODIFY `cid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `dc_category_jump`
--
ALTER TABLE `dc_category_jump`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dc_category_page`
--
ALTER TABLE `dc_category_page`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `dc_content`
--
ALTER TABLE `dc_content`
  MODIFY `aid` int(10) NOT NULL AUTO_INCREMENT COMMENT '文章ID',AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `dc_content_data`
--
ALTER TABLE `dc_content_data`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `dc_expand_content_product`
--
ALTER TABLE `dc_expand_content_product`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dc_expand_content_recruit`
--
ALTER TABLE `dc_expand_content_recruit`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dc_expand_content_xinwen`
--
ALTER TABLE `dc_expand_content_xinwen`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `dc_expand_model`
--
ALTER TABLE `dc_expand_model`
  MODIFY `mid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `dc_expand_model_field`
--
ALTER TABLE `dc_expand_model_field`
  MODIFY `fid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `dc_form`
--
ALTER TABLE `dc_form`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `dc_form_data_about_me`
--
ALTER TABLE `dc_form_data_about_me`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dc_form_data_broadcast`
--
ALTER TABLE `dc_form_data_broadcast`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dc_form_data_contact_us`
--
ALTER TABLE `dc_form_data_contact_us`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dc_form_data_guestbook`
--
ALTER TABLE `dc_form_data_guestbook`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dc_form_data_img`
--
ALTER TABLE `dc_form_data_img`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `dc_form_data_message_board`
--
ALTER TABLE `dc_form_data_message_board`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dc_form_data_productview_banner`
--
ALTER TABLE `dc_form_data_productview_banner`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dc_form_data_rencai_banner`
--
ALTER TABLE `dc_form_data_rencai_banner`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dc_form_data_xinwen_dongtai`
--
ALTER TABLE `dc_form_data_xinwen_dongtai`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `dc_form_field`
--
ALTER TABLE `dc_form_field`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `dc_fragment`
--
ALTER TABLE `dc_fragment`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `dc_lang`
--
ALTER TABLE `dc_lang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `dc_model`
--
ALTER TABLE `dc_model`
  MODIFY `mid` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `dc_plugin`
--
ALTER TABLE `dc_plugin`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dc_position`
--
ALTER TABLE `dc_position`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `dc_replace`
--
ALTER TABLE `dc_replace`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dc_tags`
--
ALTER TABLE `dc_tags`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dc_tags_category`
--
ALTER TABLE `dc_tags_category`
  MODIFY `cid` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dc_upload`
--
ALTER TABLE `dc_upload`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `dc_web_config`
--
ALTER TABLE `dc_web_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
