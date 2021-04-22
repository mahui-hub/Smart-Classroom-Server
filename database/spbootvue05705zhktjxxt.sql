/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : spbootvue05705zhktjxxt

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2021-04-02 19:11:53
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admins`
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '帐号',
  `pwd` varchar(50) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员';

-- ----------------------------
-- Records of admins
-- ----------------------------
 `admins` VALUES ('1', 'admin', 'admin', '2021-03-27 23:16:02');

-- ----------------------------
-- Table structure for `banji`
-- ----------------------------
DROP TABLE IF EXISTS `banji`;
CREATE TABLE `banji` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `xueyuan` varchar(50) NOT NULL COMMENT '学院',
  `zhuanye` varchar(255) NOT NULL COMMENT '专业',
  `banjimingcheng` varchar(255) NOT NULL COMMENT '班级名称',
  `banjirenshu` varchar(50) NOT NULL COMMENT '班级人数',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='班级';

-- ----------------------------
-- Records of banji
-- ----------------------------
INSERT INTO `banji` VALUES ('1', '计算机系', '计算机', '计算机1班', '50', '2021-03-27 23:20:30');
INSERT INTO `banji` VALUES ('2', '建筑系', '建筑', '建筑1班', '60', '2021-03-27 23:20:46');

-- ----------------------------
-- Table structure for `chengji`
-- ----------------------------
DROP TABLE IF EXISTS `chengji`;
CREATE TABLE `chengji` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `xueshengid` int(10) unsigned NOT NULL COMMENT '学生id',
  `xuehao` varchar(50) NOT NULL COMMENT '学号',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `banji` varchar(255) NOT NULL COMMENT '班级',
  `zhuanye` varchar(255) NOT NULL COMMENT '专业',
  `kaoqinchengji` decimal(18,2) NOT NULL COMMENT '考勤成绩',
  `shenghupingchengji` decimal(18,2) NOT NULL COMMENT '生互评成绩',
  `jiaoshipingjiachengji` decimal(18,2) NOT NULL COMMENT '教师评价成绩',
  `suitangceshichengji` decimal(18,2) NOT NULL COMMENT '随堂测试成绩',
  `qiangdawentichengji` decimal(18,2) NOT NULL COMMENT '抢答问题成绩',
  `zongfen` decimal(18,2) NOT NULL COMMENT '总分',
  `tianjiaren` varchar(50) NOT NULL COMMENT '添加人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `chengji_xueshengid_index` (`xueshengid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='成绩';

-- ----------------------------
-- Records of chengji
-- ----------------------------
INSERT INTO `chengji` VALUES ('1', '1', '001', '张三', '建筑1班', '建筑', '88.00', '55.00', '56.00', '88.00', '77.00', '364.00', '100', '2021-03-28 00:53:23');
INSERT INTO `chengji` VALUES ('2', '2', '002', '李四', '计算机1班', '计算机', '22.00', '22.00', '22.00', '22.00', '22.00', '110.00', '100', '2021-03-30 03:15:37');

-- ----------------------------
-- Table structure for `dati`
-- ----------------------------
DROP TABLE IF EXISTS `dati`;
CREATE TABLE `dati` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `suitangceshiid` int(10) unsigned NOT NULL COMMENT '随堂测试id',
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `timu` varchar(255) NOT NULL COMMENT '题目',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `fujian` varchar(255) NOT NULL COMMENT '附件',
  `fenshu` decimal(18,2) NOT NULL COMMENT '分数',
  `beizhu` text NOT NULL COMMENT '备注',
  `huidaren` varchar(50) NOT NULL COMMENT '回答人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `dati_suitangceshiid_index` (`suitangceshiid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='答题';

-- ----------------------------
-- Records of dati
-- ----------------------------
INSERT INTO `dati` VALUES ('1', '1', '032723314025', '随堂测试1', '100', 'upload/20210327/afa274f0-eec0-4194-887d-f29821fa70df.zip', '66.00', '十大歌手电饭锅发送到', '001', '2021-03-27 23:38:28');
INSERT INTO `dati` VALUES ('2', '1', '032723314025', '随堂测试1', '100', 'upload/20210330/f6ff1e56-ea2b-42bc-b552-3e3b9503e388.docx', '88.00', '测试', '001', '2021-03-30 03:11:17');

-- ----------------------------
-- Table structure for `datipingyue`
-- ----------------------------
DROP TABLE IF EXISTS `datipingyue`;
CREATE TABLE `datipingyue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `datiid` int(10) unsigned NOT NULL COMMENT '答题id',
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `timu` varchar(255) NOT NULL COMMENT '题目',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `huidaren` varchar(50) NOT NULL COMMENT '回答人',
  `dafen` decimal(18,2) NOT NULL COMMENT '打分',
  `beizhu` text NOT NULL COMMENT '备注',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `datipingyue_datiid_index` (`datiid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='答题评阅';

-- ----------------------------
-- Records of datipingyue
-- ----------------------------
INSERT INTO `datipingyue` VALUES ('1', '1', '032723314025', '随堂测试1', '100', '001', '66.00', '十大歌手电饭锅发送到', '2021-03-28 01:04:25');
INSERT INTO `datipingyue` VALUES ('2', '2', '032723314025', '随堂测试1', '100', '001', '88.00', '测试', '2021-03-30 03:16:38');

-- ----------------------------
-- Table structure for `dianzan`
-- ----------------------------
DROP TABLE IF EXISTS `dianzan`;
CREATE TABLE `dianzan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tieziid` int(10) unsigned NOT NULL COMMENT '帖子id',
  `tiezibianhao` varchar(50) NOT NULL COMMENT '帖子编号',
  `biaoti` varchar(255) NOT NULL COMMENT '标题',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `beizhu` text NOT NULL COMMENT '备注',
  `dianzanren` varchar(50) NOT NULL COMMENT '点赞人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `dianzan_tieziid_index` (`tieziid`),
  KEY `dianzan_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='点赞';

-- ----------------------------
-- Records of dianzan
-- ----------------------------
INSERT INTO `dianzan` VALUES ('1', '1', '032723342725', '001发帖子', '2', '001', '发送到发给第三方', '100', '2021-03-28 00:15:19');
INSERT INTO `dianzan` VALUES ('2', '1', '032723342725', '001发帖子', '2', '001', '水电费大发电', '001', '2021-03-28 00:46:58');

-- ----------------------------
-- Table structure for `gonggao`
-- ----------------------------
DROP TABLE IF EXISTS `gonggao`;
CREATE TABLE `gonggao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `biaoti` varchar(50) NOT NULL COMMENT '标题',
  `tupian` varchar(255) NOT NULL COMMENT '图片',
  `neirong` longtext NOT NULL COMMENT '内容',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='公告';

-- ----------------------------
-- Records of gonggao
-- ----------------------------
INSERT INTO `gonggao` VALUES ('1', '032723252723', 'XX公告1', 'upload/20210327/f3ab40ba-0e61-481f-837b-8698d2e5240f.png', '<p>XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1XX公告1</p>', 'admin', '2021-03-27 23:25:56');
INSERT INTO `gonggao` VALUES ('2', '03272325560', 'XX公告2', 'upload/20210327/eb614e48-e83f-4bb4-abe0-c71bc1491d2c.png', '<p>XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2XX公告2</p>', 'admin', '2021-03-27 23:26:19');
INSERT INTO `gonggao` VALUES ('3', '032723305588', '教师发公告2', 'upload/20210327/60dc1109-dcae-43a0-b458-90168ca68b08.png', '<p>教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2教师发公告2</p>', '100', '2021-03-27 23:30:55');

-- ----------------------------
-- Table structure for `huidawenti`
-- ----------------------------
DROP TABLE IF EXISTS `huidawenti`;
CREATE TABLE `huidawenti` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qiangdawentiid` int(10) unsigned NOT NULL COMMENT '抢答问题id',
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `biaoti` varchar(50) NOT NULL COMMENT '标题',
  `tupian` varchar(255) NOT NULL COMMENT '图片',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `qiangdaren` varchar(50) NOT NULL COMMENT '抢答人',
  `huidafujian` varchar(255) NOT NULL COMMENT '回答附件',
  `fenshu` decimal(18,2) NOT NULL COMMENT '分数',
  `beizhu` text NOT NULL COMMENT '备注',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `huidawenti_qiangdawentiid_index` (`qiangdawentiid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='回答问题';

-- ----------------------------
-- Records of huidawenti
-- ----------------------------
INSERT INTO `huidawenti` VALUES ('1', '1', '032723323883', '问题抢答1', 'upload/20210327/79fb9e63-64b7-49ea-a49c-63daa672a813.png', '100', '001', 'upload/20210328/4dd274fe-9cdf-4b90-a8a3-73f8cb1b11fa.zip', '88.00', '阿斯蒂芬公司的风格的方法三大阿斯顿', '2021-03-28 00:51:32');
INSERT INTO `huidawenti` VALUES ('2', '3', '033003163759', '测试测试', 'upload/20210330/82c8ed65-fdc8-44f4-a6fc-6f18a2dfbeb9.png', '100', '001', 'upload/20210330/167a6f01-3ac6-4362-b44d-1f27a393f426.zip', '66.00', '十多个发送到发送到的说法是电风扇', '2021-03-30 03:18:09');

-- ----------------------------
-- Table structure for `jiaoshi`
-- ----------------------------
DROP TABLE IF EXISTS `jiaoshi`;
CREATE TABLE `jiaoshi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gonghao` varchar(50) NOT NULL COMMENT '工号',
  `mima` varchar(50) NOT NULL COMMENT '密码',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `xingbie` varchar(255) NOT NULL COMMENT '性别',
  `qqhao` varchar(50) NOT NULL COMMENT 'QQ号',
  `shouji` varchar(50) NOT NULL COMMENT '手机',
  `suojiaobanji` text NOT NULL COMMENT '所教班级',
  `xiangqing` longtext NOT NULL COMMENT '详情',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='教师';

-- ----------------------------
-- Records of jiaoshi
-- ----------------------------
INSERT INTO `jiaoshi` VALUES ('1', '100', '100', '王五', '男', '123456', '15555554444', '建筑1班,计算机1班', '<p>ad所发生的国风大赏广东佛山</p>', '2021-03-27 23:23:03');
INSERT INTO `jiaoshi` VALUES ('2', '200', '200', '测试200', '男', '123456', '15566655555', '建筑1班', '<p>申达股份大幅度飞洒发阿尕都是</p>', '2021-03-30 03:19:49');

-- ----------------------------
-- Table structure for `jieguo`
-- ----------------------------
DROP TABLE IF EXISTS `jieguo`;
CREATE TABLE `jieguo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tikuid` int(10) unsigned NOT NULL COMMENT '题库id',
  `tikubianhao` varchar(50) NOT NULL COMMENT '题库编号',
  `tikumingcheng` varchar(255) NOT NULL COMMENT '题库名称',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `kaoshibianhao` varchar(50) NOT NULL COMMENT '考试编号',
  `shititimu` varchar(255) NOT NULL COMMENT '试题题目',
  `leixing` varchar(50) NOT NULL COMMENT '类型',
  `daan` text NOT NULL COMMENT '答案',
  `defen` decimal(18,2) NOT NULL COMMENT '得分',
  `zimu` varchar(50) NOT NULL COMMENT '字母',
  `kaoshiren` varchar(50) NOT NULL COMMENT '考试人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `jieguo_tikuid_index` (`tikuid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='结果';

-- ----------------------------
-- Records of jieguo
-- ----------------------------
INSERT INTO `jieguo` VALUES ('1', '1', '032800152098', '是的gas电饭锅电饭锅电风扇', 'admin', '03300227431655', '单选题', '单选题', '得分2', '2.00', 'B', 'admin', '2021-03-30 02:27:43');
INSERT INTO `jieguo` VALUES ('2', '1', '032800152098', '是的gas电饭锅电饭锅电风扇', 'admin', '03300227431655', '多选题', '多选题', '得分2,得分2', '5.00', 'B,C', 'admin', '2021-03-30 02:27:43');
INSERT INTO `jieguo` VALUES ('3', '1', '032800152098', '是的gas电饭锅电饭锅电风扇', 'admin', '03300312251498', '单选题', '单选题', '得分2', '2.00', 'B', '001', '2021-03-30 03:12:25');
INSERT INTO `jieguo` VALUES ('4', '1', '032800152098', '是的gas电饭锅电饭锅电风扇', 'admin', '03300312251498', '多选题', '多选题', '得分2', '3.00', 'C', '001', '2021-03-30 03:12:25');
INSERT INTO `jieguo` VALUES ('5', '2', '033003202959', '200教师评价', 'admin', '03300325112088', '教师品德', '单选题', '非常好', '10.00', 'C', 'admin', '2021-03-30 03:25:11');
INSERT INTO `jieguo` VALUES ('6', '2', '033003202959', '200教师评价', 'admin', '03300325112088', '行为XXXXX', '多选题', '非常好,很好,一般', '35.00', 'B,A,C', 'admin', '2021-03-30 03:25:11');

-- ----------------------------
-- Table structure for `kaoshijieguo`
-- ----------------------------
DROP TABLE IF EXISTS `kaoshijieguo`;
CREATE TABLE `kaoshijieguo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tikuid` int(10) unsigned NOT NULL COMMENT '题库id',
  `tikubianhao` varchar(50) NOT NULL COMMENT '题库编号',
  `tikumingcheng` varchar(255) NOT NULL COMMENT '题库名称',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `kaoshibianhao` varchar(50) NOT NULL COMMENT '考试编号',
  `kaoshishichang` varchar(50) NOT NULL COMMENT '考试时长',
  `danxuantidefen` int(11) NOT NULL COMMENT '单选题得分',
  `duoxuantidefen` int(11) NOT NULL COMMENT '多选题得分',
  `tiankongtidefen` int(11) NOT NULL COMMENT '填空题得分',
  `zongdefen` int(11) NOT NULL COMMENT '总得分',
  `kaoshiren` varchar(50) NOT NULL COMMENT '考试人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `kaoshijieguo_tikuid_index` (`tikuid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='考试结果';

-- ----------------------------
-- Records of kaoshijieguo
-- ----------------------------
INSERT INTO `kaoshijieguo` VALUES ('1', '1', '032800152098', '是的gas电饭锅电饭锅电风扇', 'admin', '03300224471558', '', '0', '0', '0', '0', 'admin', '2021-03-30 02:24:47');
INSERT INTO `kaoshijieguo` VALUES ('2', '1', '032800152098', '是的gas电饭锅电饭锅电风扇', 'admin', '03300224471558', '', '0', '0', '0', '0', 'admin', '2021-03-30 02:24:47');
INSERT INTO `kaoshijieguo` VALUES ('3', '1', '032800152098', '是的gas电饭锅电饭锅电风扇', 'admin', '03300225091336', '', '0', '0', '0', '0', 'admin', '2021-03-30 02:25:09');
INSERT INTO `kaoshijieguo` VALUES ('4', '1', '032800152098', '是的gas电饭锅电饭锅电风扇', 'admin', '03300225091336', '', '0', '0', '0', '0', 'admin', '2021-03-30 02:25:09');
INSERT INTO `kaoshijieguo` VALUES ('5', '1', '032800152098', '是的gas电饭锅电饭锅电风扇', 'admin', '03300227431655', '4', '2', '5', '0', '7', 'admin', '2021-03-30 02:27:43');
INSERT INTO `kaoshijieguo` VALUES ('6', '1', '032800152098', '是的gas电饭锅电饭锅电风扇', 'admin', '03300312251498', '3', '2', '3', '0', '5', '001', '2021-03-30 03:12:25');
INSERT INTO `kaoshijieguo` VALUES ('7', '2', '033003202959', '200教师评价', 'admin', '03300325112088', '7', '10', '35', '0', '45', 'admin', '2021-03-30 03:25:11');

-- ----------------------------
-- Table structure for `kecheng`
-- ----------------------------
DROP TABLE IF EXISTS `kecheng`;
CREATE TABLE `kecheng` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kechengbianhao` varchar(50) NOT NULL COMMENT '课程编号',
  `kechengmingcheng` varchar(255) NOT NULL COMMENT '课程名称',
  `kechengleixing` varchar(255) NOT NULL COMMENT '课程类型',
  `tupian` varchar(255) NOT NULL COMMENT '图片',
  `banjimingcheng` varchar(255) NOT NULL COMMENT '班级名称',
 `kechengshipin` varchar(255) NOT NULL COMMENT '课程视频',
 `kechengwendang` varchar(255) NOT NULL COMMENT '课程文档',
  `kechengjieshao` longtext NOT NULL COMMENT '课程介绍',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='课程';

-- ----------------------------
-- Records of kecheng
-- ----------------------------
INSERT INTO `kecheng` VALUES ('1', '032723249175', '计算机课程', '计算机', 'upload/20210327/d313850e-134f-4bb6-a0ca-fa9d162e84a6.png', '计算机1班', '<p>暗示法说的很对费挂号懂法守法撒</p>', 'admin', '2021-03-27 23:25:03');
INSERT INTO `kecheng` VALUES ('2', '032723249175', '建筑课程', '建筑', 'upload/20210327/4070e8ed-fdb9-459c-860b-a56a75234856.png', '建筑1班', '<p>暗示法说的很对费挂号懂法守法撒</p>', 'admin', '2021-03-27 23:25:28');
INSERT INTO `kecheng` VALUES ('3', '032723299045', '计算机课程1', '计算机', 'upload/20210327/d8b7870a-3f09-4166-bf13-800fd0684d17.png', '计算机1班', '<p>按时段gasGSADFSADHDFSGDF</p>', '100', '2021-03-27 23:29:57');
INSERT INTO `kecheng` VALUES ('4', '032723299045', '建筑课程1', '建筑', 'upload/20210327/53472e9d-7415-4717-b98d-fd7e23839682.png', '建筑1班', '<p>按时段gasGSADFSADHDFSGDF双方都搞活动方式分公司的范德萨</p>', '100', '2021-03-27 23:30:25');

-- ----------------------------
-- Table structure for `kechengleixing`
-- ----------------------------
DROP TABLE IF EXISTS `kechengleixing`;
CREATE TABLE `kechengleixing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kechengleixing` varchar(50) NOT NULL COMMENT '课程类型',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='课程类型';

-- ----------------------------
-- Records of kechengleixing
-- ----------------------------
INSERT INTO `kechengleixing` VALUES ('1', '计算机', '2021-03-27 23:24:34');
INSERT INTO `kechengleixing` VALUES ('2', '建筑', '2021-03-27 23:24:37');

-- ----------------------------
-- Table structure for `keqiankaoqin`
-- ----------------------------
DROP TABLE IF EXISTS `keqiankaoqin`;
CREATE TABLE `keqiankaoqin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kechengxinxi` int(10) unsigned NOT NULL COMMENT '课程信息ID',
  `kechengbianhao` varchar(50) NOT NULL COMMENT '课程编号',
  `kechengmingcheng` varchar(255) NOT NULL COMMENT '课程名称',
  `kechengleixing` varchar(255) NOT NULL COMMENT '课程类型',
  `kaishishijian` varchar(25) NOT NULL COMMENT '开始时间',
  `jieshushijian` varchar(25) NOT NULL COMMENT '结束时间',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `keqiankaoqin_kechengxinxi_index` (`kechengxinxi`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='课前考勤';

-- ----------------------------
-- Records of keqiankaoqin
-- ----------------------------
INSERT INTO `keqiankaoqin` VALUES ('1', '3', '032723299045', '计算机课程1', '计算机', '2021-03-27 23:31:04', '2021-03-27 23:31:06', '100', '2021-03-27 23:31:08');

-- ----------------------------
-- Table structure for `lunbotu`
-- ----------------------------
DROP TABLE IF EXISTS `lunbotu`;
CREATE TABLE `lunbotu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `image` varchar(255) NOT NULL COMMENT '图片',
  `url` varchar(255) NOT NULL COMMENT '连接地址',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='轮播图';

-- ----------------------------
-- Records of lunbotu
-- ----------------------------
INSERT INTO `lunbotu` VALUES ('1', '1', 'upload/20210327/318ef2a5-0c17-49d6-9a63-0737205af8fc.png', '#', '2021-03-27 23:28:39');
INSERT INTO `lunbotu` VALUES ('2', '2', 'upload/20210327/248fc84f-657e-46e1-9ecb-1a33cd033b12.png', '#', '2021-03-27 23:28:45');

-- ----------------------------
-- Table structure for `pingbici`
-- ----------------------------
DROP TABLE IF EXISTS `pingbici`;
CREATE TABLE `pingbici` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guanjianzi` varchar(255) NOT NULL COMMENT '关键字',
  `tihuanci` varchar(50) NOT NULL COMMENT '替换词',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='屏蔽词';

-- ----------------------------
-- Records of pingbici
-- ----------------------------
INSERT INTO `pingbici` VALUES ('1', '中国', '***', '2021-03-27 23:28:10');
INSERT INTO `pingbici` VALUES ('2', '小日本', '***', '2021-03-27 23:28:15');
INSERT INTO `pingbici` VALUES ('3', '沙雕', '***', '2021-03-27 23:28:20');

-- ----------------------------
-- Table structure for `pinglun`
-- ----------------------------
DROP TABLE IF EXISTS `pinglun`;
CREATE TABLE `pinglun` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `biao` varchar(50) NOT NULL COMMENT '表',
  `biaoid` int(11) NOT NULL COMMENT '表id',
  `biaoti` varchar(255) NOT NULL COMMENT '标题',
  `pingfen` varchar(255) NOT NULL COMMENT '评分',
  `pinglunneirong` text NOT NULL COMMENT '评论内容',
  `pinglunren` varchar(50) NOT NULL COMMENT '评论人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='评论';

-- ----------------------------
-- Records of pinglun
-- ----------------------------
INSERT INTO `pinglun` VALUES ('1', 'kecheng', '2', '建筑课程', '5', '第三个放大放大', '001', '2021-03-30 03:03:03');
INSERT INTO `pinglun` VALUES ('2', 'kecheng', '4', '建筑课程1', '5', '水电费东方闪电', '001', '2021-03-30 03:10:53');

-- ----------------------------
-- Table structure for `pingyuewenti`
-- ----------------------------
DROP TABLE IF EXISTS `pingyuewenti`;
CREATE TABLE `pingyuewenti` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `huidawentiid` int(10) unsigned NOT NULL COMMENT '回答问题id',
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `biaoti` varchar(50) NOT NULL COMMENT '标题',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `qiangdaren` varchar(50) NOT NULL COMMENT '抢答人',
  `pingfen` decimal(18,2) NOT NULL COMMENT '评分',
  `pingyuejianjie` varchar(50) NOT NULL COMMENT '评阅简介',
  `pingyueren` varchar(50) NOT NULL COMMENT '评阅人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `pingyuewenti_huidawentiid_index` (`huidawentiid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='评阅问题';

-- ----------------------------
-- Records of pingyuewenti
-- ----------------------------
INSERT INTO `pingyuewenti` VALUES ('1', '1', '032723323883', '问题抢答1', '100', '001', '88.00', '士大夫大使馆的双方各', '100', '2021-03-28 01:05:54');
INSERT INTO `pingyuewenti` VALUES ('2', '2', '033003163759', '测试测试', '100', '001', '66.00', 'xxxx', '100', '2021-03-30 03:18:38');

-- ----------------------------
-- Table structure for `qiandao`
-- ----------------------------
DROP TABLE IF EXISTS `qiandao`;
CREATE TABLE `qiandao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keqiankaoqinid` int(10) unsigned NOT NULL COMMENT '课前考勤id',
  `kechengxinxi` int(10) unsigned NOT NULL COMMENT '课程信息ID',
  `kechengbianhao` varchar(50) NOT NULL COMMENT '课程编号',
  `kechengmingcheng` varchar(255) NOT NULL COMMENT '课程名称',
  `kechengleixing` varchar(255) NOT NULL COMMENT '课程类型',
  `kaishishijian` varchar(25) NOT NULL COMMENT '开始时间',
  `jieshushijian` varchar(25) NOT NULL COMMENT '结束时间',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `qiandaoshijian` varchar(25) NOT NULL COMMENT '签到时间',
  `qiandaoren` varchar(50) NOT NULL COMMENT '签到人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `qiandao_keqiankaoqinid_index` (`keqiankaoqinid`),
  KEY `qiandao_kechengxinxi_index` (`kechengxinxi`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='签到';

-- ----------------------------
-- Records of qiandao
-- ----------------------------
INSERT INTO `qiandao` VALUES ('1', '1', '3', '032723299045', '计算机课程1', '计算机', '2021-03-27 23:31:04', '2021-03-27 23:31:06', '100', '2021-03-28 01:02:23', '001', '2021-03-28 01:02:24');
INSERT INTO `qiandao` VALUES ('2', '1', '3', '032723299045', '计算机课程1', '计算机', '2021-03-27 23:31:04', '2021-03-27 23:31:06', '100', '2021-03-30 03:13:10', '001', '2021-03-30 03:13:11');

-- ----------------------------
-- Table structure for `qiangdawenti`
-- ----------------------------
DROP TABLE IF EXISTS `qiangdawenti`;
CREATE TABLE `qiangdawenti` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wentiqiangdaid` int(10) unsigned NOT NULL COMMENT '问题抢答id',
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `biaoti` varchar(50) NOT NULL COMMENT '标题',
  `tupian` varchar(255) NOT NULL COMMENT '图片',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `beizhu` text NOT NULL COMMENT '备注',
  `qiangdaren` varchar(50) NOT NULL COMMENT '抢答人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `qiangdawenti_wentiqiangdaid_index` (`wentiqiangdaid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='抢答问题';

-- ----------------------------
-- Records of qiangdawenti
-- ----------------------------
INSERT INTO `qiangdawenti` VALUES ('1', '1', '032723323883', '问题抢答1', 'upload/20210327/79fb9e63-64b7-49ea-a49c-63daa672a813.png', '100', '阿斯蒂芬公司的风格的方法三大阿斯顿', '001', '2021-03-27 23:48:42');
INSERT INTO `qiangdawenti` VALUES ('2', '1', '032723323883', '问题抢答1', 'upload/20210327/79fb9e63-64b7-49ea-a49c-63daa672a813.png', '100', 'xxx', 'admin', '2021-03-30 02:11:51');
INSERT INTO `qiangdawenti` VALUES ('3', '2', '033003163759', '测试测试', 'upload/20210330/82c8ed65-fdc8-44f4-a6fc-6f18a2dfbeb9.png', '100', '十多个发送到发送到', '001', '2021-03-30 03:17:52');

-- ----------------------------
-- Table structure for `qiuzhujiaoshi`
-- ----------------------------
DROP TABLE IF EXISTS `qiuzhujiaoshi`;
CREATE TABLE `qiuzhujiaoshi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `laoshigonghao` varchar(50) NOT NULL COMMENT '老师工号',
  `laoshixingming` varchar(50) NOT NULL COMMENT '老师姓名',
  `kemu` varchar(50) NOT NULL COMMENT '科目',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='求助教师';

-- ----------------------------
-- Records of qiuzhujiaoshi
-- ----------------------------

-- ----------------------------
-- Table structure for `shiti`
-- ----------------------------
DROP TABLE IF EXISTS `shiti`;
CREATE TABLE `shiti` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tikuid` int(10) unsigned NOT NULL COMMENT '题库id',
  `tikubianhao` varchar(50) NOT NULL COMMENT '题库编号',
  `tikumingcheng` varchar(255) NOT NULL COMMENT '题库名称',
  `shititimu` text NOT NULL COMMENT '试题题目',
  `leixing` varchar(255) NOT NULL COMMENT '类型',
  `daan` text NOT NULL COMMENT '答案',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `shiti_tikuid_index` (`tikuid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='试题';

-- ----------------------------
-- Records of shiti
-- ----------------------------
INSERT INTO `shiti` VALUES ('1', '1', '032800152098', '是的gas电饭锅电饭锅电风扇', '单选题', '单选题', '[{\"zimu\":\"A\",\"title\":\"得分1\",\"point\":\"1\"},{\"zimu\":\"B\",\"title\":\"得分2\",\"point\":\"2\"},{\"zimu\":\"C\",\"title\":\"得分3\",\"point\":\"3\"}]', 'admin', '2021-03-28 00:20:39');
INSERT INTO `shiti` VALUES ('2', '1', '032800152098', '是的gas电饭锅电饭锅电风扇', '多选题', '多选题', '[{\"zimu\":\"A\",\"title\":\"得分1\",\"point\":\"1\"},{\"zimu\":\"B\",\"title\":\"得分2\",\"point\":\"2\"},{\"zimu\":\"C\",\"title\":\"得分2\",\"point\":\"3\"}]', 'admin', '2021-03-28 00:21:06');
INSERT INTO `shiti` VALUES ('3', '2', '033003202959', '200教师评价', '教师品德', '单选题', '[{\"zimu\":\"A\",\"title\":\"很好\",\"point\":\"2\"},{\"zimu\":\"B\",\"title\":\"一般\",\"point\":\"5\"},{\"zimu\":\"C\",\"title\":\"非常好\",\"point\":\"10\"}]', 'admin', '2021-03-30 03:22:13');
INSERT INTO `shiti` VALUES ('4', '2', '033003202959', '200教师评价', '行为XXXXX', '多选题', '[{\"zimu\":\"A\",\"title\":\"很好\",\"point\":\"10\"},{\"zimu\":\"B\",\"title\":\"非常好\",\"point\":\"20\"},{\"zimu\":\"C\",\"title\":\"一般\",\"point\":\"5\"}]', 'admin', '2021-03-30 03:22:51');

-- ----------------------------
-- Table structure for `suitangceshi`
-- ----------------------------
DROP TABLE IF EXISTS `suitangceshi`;
CREATE TABLE `suitangceshi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `timu` varchar(255) NOT NULL COMMENT '题目',
  `tupian` varchar(255) NOT NULL COMMENT '图片',
  `fujian` varchar(255) NOT NULL COMMENT '附件',
  `xiangqing` longtext NOT NULL COMMENT '详情',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='随堂测试';

-- ----------------------------
-- Records of suitangceshi
-- ----------------------------
INSERT INTO `suitangceshi` VALUES ('1', '032723314025', '随堂测试1', 'upload/20210327/81b49e4a-b017-493f-a101-f8b0b78f3025.png', 'upload/20210327/4b68e87d-1ad3-4206-9e02-7c5af1afe9ab.zip', '<p>随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1随堂测试1</p>', '100', '2021-03-27 23:32:20');

-- ----------------------------
-- Table structure for `tiezi`
-- ----------------------------
DROP TABLE IF EXISTS `tiezi`;
CREATE TABLE `tiezi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tiezibianhao` varchar(50) NOT NULL COMMENT '帖子编号',
  `biaoti` varchar(255) NOT NULL COMMENT '标题',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `fujian` varchar(255) NOT NULL COMMENT '附件',
  `dianzanliang` int(11) NOT NULL COMMENT '点赞量',
  `tupian` varchar(255) NOT NULL COMMENT '图片',
  `neirong` longtext NOT NULL COMMENT '内容',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `tiezi_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='帖子';

-- ----------------------------
-- Records of tiezi
-- ----------------------------
INSERT INTO `tiezi` VALUES ('1', '032723342725', '001发帖子', '2', 'upload/20210327/86a87a9e-1f68-4818-ad9a-b6bad6f58846.zip', '2', 'upload/20210327/af722bdd-6506-489a-83c4-cc583c0798f4.png', '<p>001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子001发帖子</p>', '001', '2021-03-27 23:34:56');

-- ----------------------------
-- Table structure for `tiezifenlei`
-- ----------------------------
DROP TABLE IF EXISTS `tiezifenlei`;
CREATE TABLE `tiezifenlei` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fenleimingcheng` varchar(255) NOT NULL COMMENT '分类名称',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='帖子分类';

-- ----------------------------
-- Records of tiezifenlei
-- ----------------------------
INSERT INTO `tiezifenlei` VALUES ('1', '学习', '2021-03-27 23:26:31');
INSERT INTO `tiezifenlei` VALUES ('2', '生活', '2021-03-27 23:26:36');

-- ----------------------------
-- Table structure for `tiezihuifu`
-- ----------------------------
DROP TABLE IF EXISTS `tiezihuifu`;
CREATE TABLE `tiezihuifu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tieziid` int(10) unsigned NOT NULL COMMENT '帖子id',
  `tiezibianhao` varchar(50) NOT NULL COMMENT '帖子编号',
  `biaoti` varchar(255) NOT NULL COMMENT '标题',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `huifuneirong` longtext NOT NULL COMMENT '回复内容',
  `huifuren` varchar(50) NOT NULL COMMENT '回复人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `tiezihuifu_tieziid_index` (`tieziid`),
  KEY `tiezihuifu_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='帖子回复';

-- ----------------------------
-- Records of tiezihuifu
-- ----------------------------
INSERT INTO `tiezihuifu` VALUES ('1', '1', '032723342725', '001发帖子', '2', '<p>单方事故回答是国风大赏</p>', '100', '2021-03-28 00:15:22');
INSERT INTO `tiezihuifu` VALUES ('2', '1', '032723342725', '001发帖子', '2', '<p>阿萨德鬼地方撒大放送</p>', '001', '2021-03-28 00:47:02');
INSERT INTO `tiezihuifu` VALUES ('3', '1', '032723342725', '001发帖子', '2', '<p>小日本士大夫士大夫是的</p>', 'admin', '2021-03-30 02:34:43');
INSERT INTO `tiezihuifu` VALUES ('4', '1', '032723342725', '001发帖子', '2', '<p>沙雕是屏蔽字</p>', '001', '2021-03-30 03:12:13');

-- ----------------------------
-- Table structure for `tiku`
-- ----------------------------
DROP TABLE IF EXISTS `tiku`;
CREATE TABLE `tiku` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tikubianhao` varchar(50) NOT NULL COMMENT '题库编号',
  `tikumingcheng` varchar(255) NOT NULL COMMENT '题库名称',
  `jiaoshi` varchar(255) NOT NULL COMMENT '教师',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='题库';

-- ----------------------------
-- Records of tiku
-- ----------------------------
INSERT INTO `tiku` VALUES ('1', '032800152098', '是的gas电饭锅电饭锅电风扇', '100', 'admin', '2021-03-28 00:15:56');
INSERT INTO `tiku` VALUES ('2', '033003202959', '200教师评价', '200', 'admin', '2021-03-30 03:21:03');

-- ----------------------------
-- Table structure for `token`
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `token` char(32) NOT NULL COMMENT '唯一值',
  `session` text NOT NULL COMMENT '保存得数据',
  `cx` varchar(50) NOT NULL COMMENT '登录权限',
  `login` varchar(50) NOT NULL COMMENT '登录模块',
  `username` varchar(50) NOT NULL COMMENT '登录用户',
  `valueid` varchar(50) NOT NULL COMMENT '用户id',
  `token_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '当前时间',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='前端登录凭证';

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES ('02D6WU4PXMXKT6ULXRZSW0CXILCY15IH', '{\"touxiang\":\"upload/20210327/6be2b8a9-792c-4cb0-a32d-f56ead6290a7.png\",\"mima\":\"001\",\"xingbie\":\"男\",\"lianxidianhua\":\"15566655555\",\"xuehao\":\"001\",\"chengjiCount\":1,\"login\":\"学生\",\"zhuanye\":\"建筑\",\"xingming\":\"张三\",\"cx\":\"学生\",\"addtime\":\"2021-03-27 23:21:32.0\",\"xueshenghupingCount\":0,\"id\":1,\"qqhao\":\"123456\",\"xiangqing\":\"<p>是打分公司电话感受到飞电风扇</p>\",\"banji\":\"建筑1班\",\"username\":\"001\"}', '学生', '学生', '001', '1', '2021-04-09 03:17:42');
INSERT INTO `token` VALUES ('04GKA1RV0V140I10BDM41OVSM3S0C0LW', '{\"cx\":\"管理员\",\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"login\":\"管理员\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-09 03:09:15');
INSERT INTO `token` VALUES ('0CSZ2KRCEAAVD70XO9M6HS85D0ES7VPN', '{\"suojiaobanji\":\"\",\"mima\":\"100\",\"xingbie\":\"男\",\"login\":\"教师\",\"xingming\":\"王五\",\"shouji\":\"15555554444\",\"cx\":\"教师\",\"addtime\":\"2021-03-27 23:23:03.0\",\"id\":1,\"qqhao\":\"123456\",\"xiangqing\":\"<p>ad所发生的国风大赏广东佛山</p>\",\"gonghao\":\"100\",\"username\":\"100\"}', '教师', '教师', '100', '1', '2021-04-07 00:14:04');
INSERT INTO `token` VALUES ('1SG3UD34KWVU68YIDYZ3Q2MLU1EMUG1D', '{\"cx\":\"管理员\",\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"login\":\"管理员\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-09 03:10:27');
INSERT INTO `token` VALUES ('3E9KLLWNDGDUNRS98XCKTLG47IQH4E4S', '{\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-06 23:27:55');
INSERT INTO `token` VALUES ('4546G1TWFZISMHU3CWBNEC4PN9W1ZC9G', '{\"cx\":\"管理员\",\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"login\":\"管理员\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-07 01:06:19');
INSERT INTO `token` VALUES ('4AF1IQM751ZVPFX652QBIGMUZ4MR3E5G', '{\"touxiang\":\"upload/20210327/6be2b8a9-792c-4cb0-a32d-f56ead6290a7.png\",\"mima\":\"001\",\"xingbie\":\"男\",\"lianxidianhua\":\"15566655555\",\"xuehao\":\"001\",\"chengjiCount\":1,\"login\":\"学生\",\"zhuanye\":\"建筑\",\"xingming\":\"张三\",\"cx\":\"学生\",\"addtime\":\"2021-03-27 23:21:32.0\",\"xueshenghupingCount\":0,\"id\":1,\"qqhao\":\"123456\",\"xiangqing\":\"<p>是打分公司电话感受到飞电风扇</p>\",\"banji\":\"建筑1班\",\"username\":\"001\"}', '学生', '学生', '001', '1', '2021-04-09 03:02:47');
INSERT INTO `token` VALUES ('4GPFXROIRP6H8GI9X25EQ3IQ0CAVOH6E', '{\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-07 00:58:24');
INSERT INTO `token` VALUES ('6XAOSNYCUMAM1ZF74PGHQGWVSFI9SBVV', '{\"suojiaobanji\":\"建筑1班,计算机1班\",\"mima\":\"100\",\"xingbie\":\"男\",\"login\":\"教师\",\"xingming\":\"王五\",\"shouji\":\"15555554444\",\"cx\":\"教师\",\"addtime\":\"2021-03-27 23:23:03.0\",\"id\":1,\"qqhao\":\"123456\",\"xiangqing\":\"<p>ad所发生的国风大赏广东佛山</p>\",\"gonghao\":\"100\",\"username\":\"100\"}', '教师', '教师', '100', '1', '2021-04-09 02:55:56');
INSERT INTO `token` VALUES ('9S24KQN2C67PQVA0N450OUVNYE6G6Z2Q', '{\"cx\":\"管理员\",\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"login\":\"管理员\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-09 03:05:08');
INSERT INTO `token` VALUES ('A9UAP6E3ODNF03XA5EBI58ZTULQZRLFC', '{\"touxiang\":\"upload/20210327/6be2b8a9-792c-4cb0-a32d-f56ead6290a7.png\",\"mima\":\"001\",\"xingbie\":\"男\",\"lianxidianhua\":\"15566655555\",\"xuehao\":\"001\",\"chengjiCount\":0,\"login\":\"学生\",\"zhuanye\":\"建筑\",\"xingming\":\"张三\",\"cx\":\"学生\",\"addtime\":\"2021-03-27 23:21:32.0\",\"xueshenghupingCount\":0,\"id\":1,\"qqhao\":\"123456\",\"xiangqing\":\"<p>是打分公司电话感受到飞电风扇</p>\",\"banji\":\"建筑1班\",\"username\":\"001\"}', '学生', '学生', '001', '1', '2021-04-07 00:49:22');
INSERT INTO `token` VALUES ('AK2IGUS9SIN3LDB60KP6KR9D3QPXSQ6C', '{\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-09 02:37:18');
INSERT INTO `token` VALUES ('ATKF1TZ91SXG5M6PDD1FPBUNW9TG8WLL', '{\"touxiang\":\"upload/20210327/6be2b8a9-792c-4cb0-a32d-f56ead6290a7.png\",\"mima\":\"001\",\"xingbie\":\"男\",\"lianxidianhua\":\"15566655555\",\"xuehao\":\"001\",\"chengjiCount\":0,\"login\":\"学生\",\"zhuanye\":\"建筑\",\"xingming\":\"张三\",\"cx\":\"学生\",\"addtime\":\"2021-03-27 23:21:32.0\",\"xueshenghupingCount\":0,\"id\":1,\"qqhao\":\"123456\",\"xiangqing\":\"<p>是打分公司电话感受到飞电风扇</p>\",\"banji\":\"建筑1班\",\"username\":\"001\"}', '学生', '学生', '001', '1', '2021-04-07 00:46:41');
INSERT INTO `token` VALUES ('B7Q82H3FA86ZBN5XWRDDWX3UQC2M4PGX', '{\"suojiaobanji\":\"\",\"mima\":\"100\",\"xingbie\":\"男\",\"login\":\"教师\",\"xingming\":\"王五\",\"shouji\":\"15555554444\",\"cx\":\"教师\",\"addtime\":\"2021-03-27 23:23:03.0\",\"id\":1,\"qqhao\":\"123456\",\"xiangqing\":\"<p>ad所发生的国风大赏广东佛山</p>\",\"gonghao\":\"100\",\"username\":\"100\"}', '教师', '教师', '100', '1', '2021-04-07 00:52:50');
INSERT INTO `token` VALUES ('C4SVTT78PB9T03L4224CLMPE57I4TV41', '{\"cx\":\"管理员\",\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"login\":\"管理员\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-09 03:10:11');
INSERT INTO `token` VALUES ('CHGP7N8P5EGO4RDO5O038FRMXY112MQT', '{\"suojiaobanji\":\"建筑1班,计算机1班\",\"mima\":\"100\",\"xingbie\":\"男\",\"login\":\"教师\",\"xingming\":\"王五\",\"shouji\":\"15555554444\",\"cx\":\"教师\",\"addtime\":\"2021-03-27 23:23:03.0\",\"id\":1,\"qqhao\":\"123456\",\"xiangqing\":\"<p>ad所发生的国风大赏广东佛山</p>\",\"gonghao\":\"100\",\"username\":\"100\"}', '教师', '教师', '100', '1', '2021-04-09 03:18:23');
INSERT INTO `token` VALUES ('DHQMZTRY6O0YRTH8PB6OCOS0OFUCCC45', '{\"touxiang\":\"upload/20210327/6be2b8a9-792c-4cb0-a32d-f56ead6290a7.png\",\"mima\":\"001\",\"xingbie\":\"男\",\"lianxidianhua\":\"15566655555\",\"xuehao\":\"001\",\"chengjiCount\":1,\"login\":\"学生\",\"zhuanye\":\"建筑\",\"xingming\":\"张三\",\"cx\":\"学生\",\"addtime\":\"2021-03-27 23:21:32.0\",\"xueshenghupingCount\":0,\"id\":1,\"qqhao\":\"123456\",\"xiangqing\":\"<p>是打分公司电话感受到飞电风扇</p>\",\"banji\":\"建筑1班\",\"username\":\"001\"}', '学生', '学生', '001', '1', '2021-04-07 01:09:12');
INSERT INTO `token` VALUES ('GWWGCAW8C93VFI6TDH0DYS3FCLU9NBSQ', '{\"cx\":\"管理员\",\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"login\":\"管理员\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-09 02:58:56');
INSERT INTO `token` VALUES ('HSPRS6IV8CVGDHWVGKKYOE4XCV43M90Q', '{\"cx\":\"管理员\",\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"login\":\"管理员\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-09 03:26:45');
INSERT INTO `token` VALUES ('IW0EWK2ZV334V2WYR1D1VGUCMAQK7GGM', '{\"suojiaobanji\":\"\",\"mima\":\"100\",\"xingbie\":\"男\",\"login\":\"教师\",\"xingming\":\"王五\",\"shouji\":\"15555554444\",\"cx\":\"教师\",\"addtime\":\"2021-03-27 23:23:03.0\",\"id\":1,\"qqhao\":\"123456\",\"xiangqing\":\"<p>ad所发生的国风大赏广东佛山</p>\",\"gonghao\":\"100\",\"username\":\"100\"}', '教师', '教师', '100', '1', '2021-04-06 23:29:17');
INSERT INTO `token` VALUES ('IWKPBNV2DERS3KIAGIXAIHUM20YUS4KM', '{\"addtime\":\"2021-03-27 23:23:03.0\",\"gonghao\":\"100\",\"id\":1,\"mima\":\"100\",\"qqhao\":\"123456\",\"shouji\":\"15555554444\",\"suojiaobanji\":\"\",\"xiangqing\":\"<p>ad所发生的国风大赏广东佛山</p>\",\"xingbie\":\"男\",\"xingming\":\"王五\"}', '教师', '教师', '100', '1', '2021-04-07 01:03:17');
INSERT INTO `token` VALUES ('M0GYVTUGSS7W94VUIMUUOZHYG08W4IXB', '{\"cx\":\"管理员\",\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"login\":\"管理员\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-09 03:19:01');
INSERT INTO `token` VALUES ('MT78CUHTBRC8N9I8UH8IGILB8U4HOYC0', '{\"touxiang\":\"upload/20210327/6be2b8a9-792c-4cb0-a32d-f56ead6290a7.png\",\"mima\":\"001\",\"xingbie\":\"男\",\"lianxidianhua\":\"15566655555\",\"xuehao\":\"001\",\"chengjiCount\":1,\"login\":\"学生\",\"zhuanye\":\"建筑\",\"xingming\":\"张三\",\"cx\":\"学生\",\"addtime\":\"2021-03-27 23:21:32.0\",\"xueshenghupingCount\":0,\"id\":1,\"qqhao\":\"123456\",\"xiangqing\":\"<p>是打分公司电话感受到飞电风扇</p>\",\"banji\":\"建筑1班\",\"username\":\"001\"}', '学生', '学生', '001', '1', '2021-04-07 00:56:33');
INSERT INTO `token` VALUES ('NLYU9NNFHZGI2OWM0X9C01L3V1EM7B8X', '{\"addtime\":\"2021-03-27 23:23:03.0\",\"gonghao\":\"100\",\"id\":1,\"mima\":\"100\",\"qqhao\":\"123456\",\"shouji\":\"15555554444\",\"suojiaobanji\":\"\",\"xiangqing\":\"<p>ad所发生的国风大赏广东佛山</p>\",\"xingbie\":\"男\",\"xingming\":\"王五\"}', '教师', '教师', '100', '1', '2021-04-07 00:07:27');
INSERT INTO `token` VALUES ('NRD9O7BQ87LW86FT2S4689OD0Q74ABHY', '{\"cx\":\"管理员\",\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"login\":\"管理员\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-09 03:02:34');
INSERT INTO `token` VALUES ('POETIVPA0UVLD1CS2Y7ZIFK4OI9FQFG2', '{\"touxiang\":\"upload/20210327/6be2b8a9-792c-4cb0-a32d-f56ead6290a7.png\",\"mima\":\"001\",\"xingbie\":\"男\",\"lianxidianhua\":\"15566655555\",\"xuehao\":\"001\",\"chengjiCount\":0,\"login\":\"学生\",\"zhuanye\":\"建筑\",\"xingming\":\"张三\",\"cx\":\"学生\",\"addtime\":\"2021-03-27 23:21:32.0\",\"xueshenghupingCount\":0,\"id\":1,\"qqhao\":\"123456\",\"xiangqing\":\"<p>是打分公司电话感受到飞电风扇</p>\",\"banji\":\"建筑1班\",\"username\":\"001\"}', '学生', '学生', '001', '1', '2021-04-07 00:48:10');
INSERT INTO `token` VALUES ('PZ6N7KWO6MV8001CG570VK7GG01EAWUC', '{\"suojiaobanji\":\"\",\"mima\":\"100\",\"xingbie\":\"男\",\"login\":\"教师\",\"xingming\":\"王五\",\"shouji\":\"15555554444\",\"cx\":\"教师\",\"addtime\":\"2021-03-27 23:23:03.0\",\"id\":1,\"qqhao\":\"123456\",\"xiangqing\":\"<p>ad所发生的国风大赏广东佛山</p>\",\"gonghao\":\"100\",\"username\":\"100\"}', '教师', '教师', '100', '1', '2021-04-07 00:10:24');
INSERT INTO `token` VALUES ('QAQM6Y265535OGL8EMD19Y18GANGPGMK', '{\"cx\":\"管理员\",\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"login\":\"管理员\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-11 16:45:48');
INSERT INTO `token` VALUES ('QF4Y9H33Q8E76794DRL55OP2IEHWT5EH', '{\"addtime\":\"2021-03-27 23:21:32.0\",\"banji\":\"建筑1班\",\"chengjiCount\":0,\"id\":1,\"lianxidianhua\":\"15566655555\",\"mima\":\"001\",\"qqhao\":\"123456\",\"touxiang\":\"upload/20210327/6be2b8a9-792c-4cb0-a32d-f56ead6290a7.png\",\"xiangqing\":\"<p>是打分公司电话感受到飞电风扇</p>\",\"xingbie\":\"男\",\"xingming\":\"张三\",\"xuehao\":\"001\",\"xueshenghupingCount\":0,\"zhuanye\":\"建筑\"}', '学生', '学生', '001', '1', '2021-04-06 23:55:59');
INSERT INTO `token` VALUES ('QVFMBWKB1YTRD04MY0HBT3G2GUZQUGCG', '{\"suojiaobanji\":\"建筑1班,计算机1班\",\"mima\":\"100\",\"xingbie\":\"男\",\"login\":\"教师\",\"xingming\":\"王五\",\"shouji\":\"15555554444\",\"cx\":\"教师\",\"addtime\":\"2021-03-27 23:23:03.0\",\"id\":1,\"qqhao\":\"123456\",\"xiangqing\":\"<p>ad所发生的国风大赏广东佛山</p>\",\"gonghao\":\"100\",\"username\":\"100\"}', '教师', '教师', '100', '1', '2021-04-09 03:05:59');
INSERT INTO `token` VALUES ('RSSOY9DV4WK0372GVQE684VWLMDSFQZY', '{\"cx\":\"管理员\",\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"login\":\"管理员\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-07 00:15:48');
INSERT INTO `token` VALUES ('RW0MCF8MEQ29T1WZ1LIWRIY7UWK0P1IU', '{\"addtime\":\"2021-03-27 23:21:32.0\",\"banji\":\"建筑1班\",\"chengjiCount\":1,\"id\":1,\"lianxidianhua\":\"15566655555\",\"mima\":\"001\",\"qqhao\":\"123456\",\"touxiang\":\"upload/20210327/6be2b8a9-792c-4cb0-a32d-f56ead6290a7.png\",\"xiangqing\":\"<p>是打分公司电话感受到飞电风扇</p>\",\"xingbie\":\"男\",\"xingming\":\"张三\",\"xuehao\":\"001\",\"xueshenghupingCount\":0,\"zhuanye\":\"建筑\"}', '学生', '学生', '001', '1', '2021-04-07 01:02:01');
INSERT INTO `token` VALUES ('SOFX6QMMPPOGUPFEDB3QP6DX1PAPG63Z', '{\"cx\":\"管理员\",\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"login\":\"管理员\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-11 17:53:31');
INSERT INTO `token` VALUES ('TDBAG7MKSM6OO2O97RB83MH12TD5YEPL', '{\"suojiaobanji\":\"建筑1班,计算机1班\",\"mima\":\"100\",\"xingbie\":\"男\",\"login\":\"教师\",\"xingming\":\"王五\",\"shouji\":\"15555554444\",\"cx\":\"教师\",\"addtime\":\"2021-03-27 23:23:03.0\",\"id\":1,\"qqhao\":\"123456\",\"xiangqing\":\"<p>ad所发生的国风大赏广东佛山</p>\",\"gonghao\":\"100\",\"username\":\"100\"}', '教师', '教师', '100', '1', '2021-04-09 03:15:18');
INSERT INTO `token` VALUES ('UAYEDV2CRUI7GZDOKXLA79GQ0AXX1BBK', '{\"suojiaobanji\":\"建筑1班,计算机1班\",\"mima\":\"100\",\"xingbie\":\"男\",\"login\":\"教师\",\"xingming\":\"王五\",\"shouji\":\"15555554444\",\"cx\":\"教师\",\"addtime\":\"2021-03-27 23:23:03.0\",\"id\":1,\"qqhao\":\"123456\",\"xiangqing\":\"<p>ad所发生的国风大赏广东佛山</p>\",\"gonghao\":\"100\",\"username\":\"100\"}', '教师', '教师', '100', '1', '2021-04-11 17:46:09');
INSERT INTO `token` VALUES ('W5R5F6DT3BU1IF8UFWUGZGUMPKGRYNOW', '{\"touxiang\":\"upload/20210327/6be2b8a9-792c-4cb0-a32d-f56ead6290a7.png\",\"mima\":\"001\",\"xingbie\":\"男\",\"lianxidianhua\":\"15566655555\",\"xuehao\":\"001\",\"chengjiCount\":1,\"login\":\"学生\",\"zhuanye\":\"建筑\",\"xingming\":\"张三\",\"cx\":\"学生\",\"addtime\":\"2021-03-27 23:21:32.0\",\"xueshenghupingCount\":0,\"id\":1,\"qqhao\":\"123456\",\"xiangqing\":\"<p>是打分公司电话感受到飞电风扇</p>\",\"banji\":\"建筑1班\",\"username\":\"001\"}', '学生', '学生', '001', '1', '2021-04-09 03:10:47');
INSERT INTO `token` VALUES ('WCNCY9SOTGZAB4UAZDV5RUHIRDDLZ1GP', '{\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-09 02:55:38');
INSERT INTO `token` VALUES ('Z5DGC8NNLNEEGVE0U86IA8ZMXUMX4LXM', '{\"touxiang\":\"upload/20210327/6be2b8a9-792c-4cb0-a32d-f56ead6290a7.png\",\"mima\":\"001\",\"xingbie\":\"男\",\"lianxidianhua\":\"15566655555\",\"xuehao\":\"001\",\"chengjiCount\":1,\"login\":\"学生\",\"zhuanye\":\"建筑\",\"xingming\":\"张三\",\"cx\":\"学生\",\"addtime\":\"2021-03-27 23:21:32.0\",\"xueshenghupingCount\":0,\"id\":1,\"qqhao\":\"123456\",\"xiangqing\":\"<p>是打分公司电话感受到飞电风扇</p>\",\"banji\":\"建筑1班\",\"username\":\"001\"}', '学生', '学生', '001', '1', '2021-04-07 00:58:35');

-- ----------------------------
-- Table structure for `wentiqiangda`
-- ----------------------------
DROP TABLE IF EXISTS `wentiqiangda`;
CREATE TABLE `wentiqiangda` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `biaoti` varchar(50) NOT NULL COMMENT '标题',
  `tupian` varchar(255) NOT NULL COMMENT '图片',
  `qiangdarenshu` int(11) NOT NULL COMMENT '抢答人数',
  `yiqiangrenshu` int(11) NOT NULL COMMENT '已抢人数',
  `fujian` varchar(255) NOT NULL COMMENT '附件',
  `xiangqing` longtext NOT NULL COMMENT '详情',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='问题抢答';

-- ----------------------------
-- Records of wentiqiangda
-- ----------------------------
INSERT INTO `wentiqiangda` VALUES ('1', '032723323883', '问题抢答1', 'upload/20210327/79fb9e63-64b7-49ea-a49c-63daa672a813.png', '2', '2', 'upload/20210327/47fb6c99-6221-4cc1-b246-6c2001f8ab73.zip', '<p>问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1问题抢答1</p>', '100', '2021-03-27 23:33:02');
INSERT INTO `wentiqiangda` VALUES ('2', '033003163759', '测试测试', 'upload/20210330/82c8ed65-fdc8-44f4-a6fc-6f18a2dfbeb9.png', '5', '1', 'upload/20210330/7fe6e916-f96d-4227-a6f5-c8d425428aff.zip', '<p>测试测试</p>', '100', '2021-03-30 03:17:07');

-- ----------------------------
-- Table structure for `wentisousuo`
-- ----------------------------
DROP TABLE IF EXISTS `wentisousuo`;
CREATE TABLE `wentisousuo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kechengmingcheng` varchar(255) NOT NULL COMMENT '课程名称',
  `wentibiaoti` text NOT NULL COMMENT '问题标题',
  `wentineirong` text NOT NULL COMMENT '问题内容',
  `dayineirong` text NOT NULL COMMENT '答疑内容',
  `xuehao` varchar(50) NOT NULL COMMENT '学号',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='问题搜索';

-- ----------------------------
-- Records of wentisousuo
-- ----------------------------
INSERT INTO `wentisousuo` VALUES ('1', '计算机课程', 'SD敢达发生过的四个获得富士达', '富商大贾懂法守法撒的发生的', '的符号广东夫妇士大夫撒旦', '001', '2021-03-27 23:56:14');
INSERT INTO `wentisousuo` VALUES ('2', '阿斯蒂芬高大上浮点数', '的发撒给对方大蛇兜好地方gas的', '阿道夫好尬水电费发士大夫撒旦', '阿道夫gas打分分数电风扇大啊', '001', '2021-03-27 23:56:40');
INSERT INTO `wentisousuo` VALUES ('3', '计算机课程', '是打发士大夫撒旦', '算法的方式大安法师的', '是打发士大夫是的', '001', '2021-03-30 03:15:02');

-- ----------------------------
-- Table structure for `xuesheng`
-- ----------------------------
DROP TABLE IF EXISTS `xuesheng`;
CREATE TABLE `xuesheng` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `xuehao` varchar(50) NOT NULL COMMENT '学号',
  `mima` varchar(50) NOT NULL COMMENT '密码',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `xingbie` varchar(255) NOT NULL COMMENT '性别',
  `banji` varchar(255) NOT NULL COMMENT '班级',
  `zhuanye` varchar(255) NOT NULL COMMENT '专业',
  `lianxidianhua` varchar(50) NOT NULL COMMENT '联系电话',
  `qqhao` varchar(50) NOT NULL COMMENT 'QQ号',
  `touxiang` varchar(255) NOT NULL COMMENT '头像',
  `xiangqing` longtext NOT NULL COMMENT '详情',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='学生';

-- ----------------------------
-- Records of xuesheng
-- ----------------------------
INSERT INTO `xuesheng` VALUES ('1', '001', '001', '张三', '男', '建筑1班', '建筑', '15566655555', '123456', 'upload/20210327/6be2b8a9-792c-4cb0-a32d-f56ead6290a7.png', '<p>是打分公司电话感受到飞电风扇</p>', '2021-03-27 23:21:32');
INSERT INTO `xuesheng` VALUES ('2', '002', '002', '李四', '女', '计算机1班', '计算机', '15555544444', '123456', 'upload/20210327/bd4a3804-d28e-4249-b88a-804918c4f06f.png', '', '2021-03-27 23:22:01');

-- ----------------------------
-- Table structure for `xueshenghuping`
-- ----------------------------
DROP TABLE IF EXISTS `xueshenghuping`;
CREATE TABLE `xueshenghuping` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `xueshengid` int(10) unsigned NOT NULL COMMENT '学生id',
  `xuehao` varchar(50) NOT NULL COMMENT '学号',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `hupingneirong` text NOT NULL COMMENT '互评内容',
  `hupingfenshu` decimal(18,2) NOT NULL COMMENT '互评分数',
  `hupingren` varchar(50) NOT NULL COMMENT '互评人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `xueshenghuping_xueshengid_index` (`xueshengid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='学生互评';

-- ----------------------------
-- Records of xueshenghuping
-- ----------------------------
INSERT INTO `xueshenghuping` VALUES ('1', '2', '002', '李四', '是大法官色放虎归山的方法', '22.00', '001', '2021-03-27 23:45:44');
INSERT INTO `xueshenghuping` VALUES ('2', '2', '002', '李四', '豆腐干大', '5.00', '001', '2021-03-30 03:11:40');

-- ----------------------------
-- Table structure for `youqinglianjie`
-- ----------------------------
DROP TABLE IF EXISTS `youqinglianjie`;
CREATE TABLE `youqinglianjie` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wangzhanmingcheng` varchar(50) NOT NULL COMMENT '网站名称',
  `wangzhi` varchar(50) NOT NULL COMMENT '网址',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='友情链接';

-- ----------------------------
-- Records of youqinglianjie
-- ----------------------------
INSERT INTO `youqinglianjie` VALUES ('1', '百度', 'http://www.baidu.com', '2021-03-27 23:09:30');
INSERT INTO `youqinglianjie` VALUES ('2', '谷歌', 'http://www.google.cn', '2021-03-27 23:09:30');
INSERT INTO `youqinglianjie` VALUES ('3', '新浪', 'http://www.sina.com', '2021-03-27 23:09:30');
INSERT INTO `youqinglianjie` VALUES ('4', 'QQ', 'http://www.qq.com', '2021-03-27 23:09:30');
INSERT INTO `youqinglianjie` VALUES ('5', '网易', 'http://www.163.com', '2021-03-27 23:09:30');

-- ----------------------------
-- Table structure for `zhuanye`
-- ----------------------------
DROP TABLE IF EXISTS `zhuanye`;
CREATE TABLE `zhuanye` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `zhuanye` varchar(50) NOT NULL COMMENT '专业',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='专业';

-- ----------------------------
-- Records of zhuanye
-- ----------------------------
INSERT INTO `zhuanye` VALUES ('1', '计算机', '2021-03-27 23:20:08');
INSERT INTO `zhuanye` VALUES ('2', '建筑', '2021-03-27 23:20:15');

-- ----------------------------
-- Table structure for `ziyuan`
-- ----------------------------
DROP TABLE IF EXISTS `ziyuan`;
CREATE TABLE `ziyuan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `biaoti` varchar(50) NOT NULL COMMENT '标题',
  `fenlei` varchar(255) NOT NULL COMMENT '分类',
  `tupian` varchar(255) NOT NULL COMMENT '图片',
  `fujian` varchar(255) NOT NULL COMMENT '附件',
  `xiangqing` longtext NOT NULL COMMENT '详情',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='资源';

-- ----------------------------
-- Records of ziyuan
-- ----------------------------
INSERT INTO `ziyuan` VALUES ('1', '032723337448', 'XX资源1', '学习', 'upload/20210327/7447ae36-24b2-4e23-b78a-16c935145b16.png', 'upload/20210327/7350d25f-4173-4855-86e6-a545efc022da.zip', '<p>XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1XX资源1</p>', '100', '2021-03-27 23:34:05');
