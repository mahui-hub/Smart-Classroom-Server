/*
Navicat MySQL Data Transfer

Source Server         : 192.168.0.114_3306
Source Server Version : 50562
Source Host           : 192.168.0.114:3306
Source Database       : zhkt

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2021-04-21 14:53:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '�ʺ�',
  `pwd` varchar(50) NOT NULL COMMENT '����',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='����Ա';

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'admin', 'admin', '2021-03-27 23:16:02');
INSERT INTO `admins` VALUES ('2', 'ceshi123', 'ceshi', '2021-04-07 18:33:07');

-- ----------------------------
-- Table structure for banji
-- ----------------------------
DROP TABLE IF EXISTS `banji`;
CREATE TABLE `banji` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `xueyuan` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT 'ѧԺ',
  `zhuanye` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'רҵ',
  `banjimingcheng` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '�༶����',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_estonian_ci COMMENT='�༶';

-- ----------------------------
-- Records of banji
-- ----------------------------
INSERT INTO `banji` VALUES ('3', '经济管理学院', '物流管理', '物流161', '2021-04-07 17:12:22');
INSERT INTO `banji` VALUES ('4', '经济管理学院', '信息管理与信息系统＋软件工程', 'R信管162', '2021-04-07 17:16:25');
INSERT INTO `banji` VALUES ('6', '经济管理学院', '信息管理与信息系统＋软件工程', 'R信管161', '2021-04-07 17:17:30');
INSERT INTO `banji` VALUES ('7', '交通学院', '车辆工程', '车辆161', '2021-04-07 17:19:51');
INSERT INTO `banji` VALUES ('8', '软件学院', '软件工程', '软件161', '2021-04-07 17:20:23');
INSERT INTO `banji` VALUES ('9', '交通学院', '交通工程', '交通161', '2021-04-07 17:21:15');
INSERT INTO `banji` VALUES ('10', '经济管理学院', '物流管理', '物流162', '2021-04-07 17:21:44');

-- ----------------------------
-- Table structure for chengji
-- ----------------------------
DROP TABLE IF EXISTS `chengji`;
CREATE TABLE `chengji` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `xueshengid` int(10) unsigned NOT NULL COMMENT 'ѧ��id',
  `xuehao` varchar(50) NOT NULL COMMENT 'ѧ��',
  `xingming` varchar(50) NOT NULL COMMENT '����',
  `banji` varchar(255) NOT NULL COMMENT '�༶',
  `zhuanye` varchar(255) NOT NULL COMMENT 'רҵ',
  `kaoqinchengji` decimal(18,2) NOT NULL COMMENT '���ڳɼ�',
  `shenghupingchengji` decimal(18,2) NOT NULL COMMENT '�������ɼ�',
  `jiaoshipingjiachengji` decimal(18,2) NOT NULL COMMENT '��ʦ���۳ɼ�',
  `suitangceshichengji` decimal(18,2) NOT NULL COMMENT '���ò��Գɼ�',
  `qiangdawentichengji` decimal(18,2) NOT NULL COMMENT '��������ɼ�',
  `zongfen` decimal(18,2) NOT NULL COMMENT '�ܷ�',
  `tianjiaren` varchar(50) NOT NULL COMMENT '�����',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`),
  KEY `chengji_xueshengid_index` (`xueshengid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ɼ�';

-- ----------------------------
-- Records of chengji
-- ----------------------------

-- ----------------------------
-- Table structure for dati
-- ----------------------------
DROP TABLE IF EXISTS `dati`;
CREATE TABLE `dati` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `suitangceshiid` int(10) unsigned NOT NULL COMMENT '���ò���id',
  `bianhao` varchar(50) NOT NULL COMMENT '���',
  `timu` varchar(255) NOT NULL COMMENT '��Ŀ',
  `faburen` varchar(50) NOT NULL COMMENT '������',
  `fujian` varchar(255) NOT NULL COMMENT '����',
  `fenshu` decimal(18,2) NOT NULL COMMENT '����',
  `beizhu` text NOT NULL COMMENT '��ע',
  `huidaren` varchar(50) NOT NULL COMMENT '�ش���',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`),
  KEY `dati_suitangceshiid_index` (`suitangceshiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����';

-- ----------------------------
-- Records of dati
-- ----------------------------

-- ----------------------------
-- Table structure for datipingyue
-- ----------------------------
DROP TABLE IF EXISTS `datipingyue`;
CREATE TABLE `datipingyue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `datiid` int(10) unsigned NOT NULL COMMENT '����id',
  `bianhao` varchar(50) NOT NULL COMMENT '���',
  `timu` varchar(255) NOT NULL COMMENT '��Ŀ',
  `faburen` varchar(50) NOT NULL COMMENT '������',
  `huidaren` varchar(50) NOT NULL COMMENT '�ش���',
  `dafen` decimal(18,2) NOT NULL COMMENT '���',
  `beizhu` text NOT NULL COMMENT '��ע',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`),
  KEY `datipingyue_datiid_index` (`datiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��������';

-- ----------------------------
-- Records of datipingyue
-- ----------------------------

-- ----------------------------
-- Table structure for dianzan
-- ----------------------------
DROP TABLE IF EXISTS `dianzan`;
CREATE TABLE `dianzan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tieziid` int(10) unsigned NOT NULL COMMENT '����id',
  `tiezibianhao` varchar(50) NOT NULL COMMENT '���ӱ��',
  `biaoti` varchar(255) NOT NULL COMMENT '����',
  `fenlei` int(10) unsigned NOT NULL COMMENT '����',
  `faburen` varchar(50) NOT NULL COMMENT '������',
  `beizhu` text NOT NULL COMMENT '��ע',
  `dianzanren` varchar(50) NOT NULL COMMENT '������',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`),
  KEY `dianzan_tieziid_index` (`tieziid`),
  KEY `dianzan_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='����';

-- ----------------------------
-- Records of dianzan
-- ----------------------------
INSERT INTO `dianzan` VALUES ('1', '3', '041201482824', '测试', '6', '1618200126', '完美', '1618200126', '2021-04-12 02:09:04');
INSERT INTO `dianzan` VALUES ('2', '3', '041201482824', '测试', '6', '1618200126', '', '1618200126', '2021-04-12 23:55:02');
INSERT INTO `dianzan` VALUES ('3', '3', '041201482824', '读专科的计算机或二本的烂专业，哪个好？', '6', '1618200126', '挺好', '1618200206', '2021-04-13 00:28:56');
INSERT INTO `dianzan` VALUES ('4', '3', '041201482824', '读专科的计算机或二本的烂专业，哪个好？', '6', '1618200126', '', '1618200206', '2021-04-13 00:30:07');
INSERT INTO `dianzan` VALUES ('5', '3', '041201482824', '读专科的计算机或二本的烂专业，哪个好？', '6', '1618200126', '', '1618200206', '2021-04-13 00:30:42');
INSERT INTO `dianzan` VALUES ('8', '3', '041201482824', '读专科的计算机或二本的烂专业，哪个好？', '6', '1618200126', '', '1618200206', '2021-04-13 00:40:45');

-- ----------------------------
-- Table structure for gonggao
-- ----------------------------
DROP TABLE IF EXISTS `gonggao`;
CREATE TABLE `gonggao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bianhao` varchar(50) NOT NULL COMMENT '���',
  `biaoti` varchar(50) NOT NULL COMMENT '����',
  `tupian` varchar(255) NOT NULL COMMENT 'ͼƬ',
  `neirong` longtext NOT NULL COMMENT '����',
  `faburen` varchar(50) NOT NULL COMMENT '������',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  `kechengid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gonggao_FK` (`kechengid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='����';

-- ----------------------------
-- Records of gonggao
-- ----------------------------
INSERT INTO `gonggao` VALUES ('4', '040800178748', '小学分课程考核方式说明', 'upload/20210408/8f5f555b-f6f2-4dad-8236-e7c0096cdb1d.jfif', '<p class=\"style1\" align=\"center\"><strong>小学分课程考核方式说明</strong></p>\n<p>为了更好的满足学生学习需要，学院开设了一批内容新颖、实用性较强、学习周期较短的小学分课程，这些课程均采取网上考试，考核方式比较灵活。具体办法如下：</p>\n<p><strong>一、选课时间：</strong>小学分课程按照学院统一安排的选课时间选课，选课后即可开通课程。</p>\n<p><strong>二、课程考试：</strong>小学分课程的考试，主要采取在线考试的方式进行，题型均为客观题，学生在考试截止时间前在网上提交考试答卷。</p>\n<p><strong>三、成绩发布：</strong>小学分课程考试成绩与学院其他课程的课程考试成绩同时发布，学生可在个性化学习空间查询。</p>\n<p align=\"right\">&nbsp;大连交通大学&nbsp; 经济管理学院</p>\n<p align=\"right\">2021年4月8日</p>', 'JG0001', '2021-04-08 00:20:38', '1');
INSERT INTO `gonggao` VALUES ('8', '040800239343', '关于2021年上半年递交毕业设计（论文）的通知', 'upload/20210408/e7764064-d180-498d-867b-62e38544fcfb.jpg', '<div class=\"ntitle\" align=\"center\">关于2021年上半年递交毕业设计（论文）的通知</div>\n<div class=\"ncontent left-con\">\n<p><strong>&nbsp;</strong></p>\n<p><strong>注意： 2020年3月1日&mdash;&mdash;3月10日因系统维护，大连交通大学自考平台在此期间不能访问，3月11日以后恢复。</strong></p>\n<p>&nbsp;</p>\n<p>为了保证2021年上半年毕业设计（论文）答辩工作顺利进行，现将递交毕业设计（论文）的要求及事宜通知如下：</p>\n<p><strong>一、递交毕业设计（论文）条件</strong></p>\n<p>根据毕业设计(论文)实施细则的规定，此次递交毕业设计（论文）的考生，应修完并通过其专业考试计划中规定的全部课程，并通过北京教育考试院平台的审核（计算机专业需通过毕业设计任务书的审核）。</p>\n<p>&nbsp;</p>\n<p><strong>二、毕业设计（论文）格式及要求</strong></p>\n<p>毕业设计(论文)必须按格式要求打印，并按顺序要求装订成册，须胶装。</p>\n<p>1、封面必须按统一格式及要求打印（常用下载&mdash;毕业设计栏目）；</p>\n<p>2、论文（报告）正文必须用A4纸打印；</p>\n<p>3、论文格式</p>\n<p>正文：宋体，小四号字；</p>\n<p>一张表尽量在一页，表格居中，表格中的文字、数字用五号字；</p>\n<p><strong>计算机专业论文格式</strong></p>\n<p>一级标题：&nbsp;&nbsp;&nbsp;一．（小三号宋体加黑）</p>\n<p>二级标题： （一）（四号宋体加黑）</p>\n<p>三级标题：&nbsp;&nbsp;&nbsp; 1．（小四号宋体加黑）</p>\n<p>四级标题：&nbsp;&nbsp;（1）（小四号宋体）</p>\n<p>五级标题：&nbsp;&nbsp;&nbsp;&nbsp;①（小四号宋体）</p>\n<p><strong>工程管理专业论文格式</strong></p>\n<p>一级标题：&nbsp;&nbsp;&nbsp;一．（四号黑体）</p>\n<p>二级标题： （一）（小四号黑体）</p>\n<p>三级标题：&nbsp;&nbsp;&nbsp; 1．（小四号宋体）</p>\n<p>四级标题：&nbsp;&nbsp;（1）（小四号宋体）</p>\n<p>4、论文正文要求在1万字或以上（图表、代码等不计算在内）；</p>\n<p>5、凡报告中涉及的计算机程序，要求附上主要程序清单，计算机专业答辩时须自带笔记本电脑进行演示；</p>\n<p>6、毕业设计(论文)装订顺序：封面、任务书、毕业论文评定表、目录、报告正文等。（封面、评定表在平台首页常用下载&mdash;毕业设计栏目）</p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>三、毕业设计（论文）查重</strong></p>\n<p>在中国知网检测系统，去除本人文献，论文文字复制比和论文段落中单篇引用文字复制比均低于30%（含30%）者为查重通过。</p>\n<p>&nbsp;</p>\n<p><strong>四、毕业设计（论文）指导讲座</strong></p>\n<p>预计3月2日安排初稿答疑网上指导，主要对论文初稿中的问题进行讲解，请考生在此前完成初稿，根据指导进行修改。</p>\n<p>预计3月16日安排终稿答疑网上指导，主要对论文终稿中的问题进行解答，请考生根据指导修改和完善论文终稿。</p>\n<p>相关通知2月下旬在平台发布，具体时间以平台公布的为准。</p>\n<p>&nbsp;</p>\n<p><strong>五、毕业设计（论文）提交</strong></p>\n<p>需提交1份纸介毕业设计(论文)&nbsp;及1份评定表，并请提交论文电子版（word格式）至buptzikao@sina.com邮箱。</p>\n<p><strong>提交方式：</strong></p>\n<p>★工程管理专业</p>\n<p>3月27日前交至大连项目管理协会</p>\n<p>递交地址：大连交通大学体育馆1楼</p>\n<p>联系电话：010&mdash;62289962</p>\n<p>★计算机专业</p>\n<p>3月27日当天（8:00&mdash;17:00）交我校自考办</p>\n<p>递交地址：大连交通大学网院315室</p>\n<p>&nbsp;</p>\n<p><strong>六、毕业设计（论文）审核</strong></p>\n<p>我校自考办将于2021年4月初发布审核结果，同时一并发布关于2021年上半年毕业设计（论文）答辩安排等相关信息的通知，请考生及时上网查看。</p>\n<p>毕业设计（论文）审核成绩不及格（含查重不通过）的考生，不能参加本次答辩，2021年上半年重新在北京教育考试院平台申请，费用重新发生。</p>\n<p><strong>&nbsp;</strong></p>\n<p><strong>大连交通大学自考办</strong></p>\n<p><strong>2020</strong><strong>年2月24日</strong></p>\n</div>', 'JG0001', '2021-04-08 00:28:55', '1');
INSERT INTO `gonggao` VALUES ('9', '040812432576', '关于进行2020-2021学年第二学期重修网上选课工作的通知', 'upload/20210408/07626f00-907b-455d-becd-19b42ada019a.jpg', '<p>关于进行2020-2021学年第二学期重修网上选课工作的通知</p>\n<p>大交大教务通知〔2021〕3号</p>\n<p>&nbsp;</p>\n<p>各学院：</p>\n<p>2020-2021学年第二学期重修课程网上选课工作将从1月22日开始至开学第4周（周日）结束。重修课程有插班重修、单独开班重修和单独辅导重修等三种开课形式。单独开班重修本部校区课序号为521、522，旅顺口校区课序号为621、622等。单独辅导重修本部校区课序号为531、532，旅顺口校区课序号为631、632。请学院做好宣传工作，通知学生准时登陆教务处网站选课，逾期将不予选课。</p>\n<p><strong>一、开课原则</strong></p>\n<p>重修课程开设学期及开课学时依据学校本科专业培养方案（2014版、2018版）中的规定执行。</p>\n<p><strong>二、选课程序及时间</strong></p>\n<p>1．选课程序：&ldquo;大连交通大学教务处&mdash;&mdash;综合教务管理系统&rdquo;登陆，在&ldquo;重修重考报名&mdash;&mdash;重修报名&rdquo;模块处选择课程及上课时间。</p>\n<p>2．选课时间：1月22日-3月28日。</p>\n<p>3．由于专业培养方案及其它调整，春季学期应开设而未开设的课程，需要增开重修课程的学生，请开学第1周内到学院申报。（报名截止时间3月7日）。</p>\n<p>4．《体育》课程重修，请学生于第1周到体育工作部确认体育项目与任课教师。</p>\n<p>5．《工程训练》课程重修，请查看教务处网站《关于&lt;工程训练&gt;课程重修、补修的通知》。</p>\n<p>6．为保证课程修读质量，对学生每学期选课最高学分进行限制。2017级及以前学生，选课（正常+重修/再修）总学分&le;40学分；2018级及以后学生，选课（正常+重修/再修）总学分&le;35学分。</p>\n<p><strong>三、课程管理</strong></p>\n<p>1．上课要求</p>\n<p>重修课程课堂管理与正常课程一致。任课教师应严格教学过程管理，执行学生上课考勤制度，请学生根据公布的课表时间按时听课。</p>\n<p>2．成绩管理</p>\n<p>重修课程成绩管理与正常修读课程相同，课程考核依据教学大纲中的规定执行。</p>\n<p>三、缴费及重修考试证发放</p>\n<p>1．教务处将于4月2日（第五周周五）前向各学院提供学生选课数据及费用统计，请学院4月7日（第六周周三）前反馈。</p>\n<p>2．学生应提前在学费卡中预存足额费用，校财务处将在4月9日（第六周周五）划款,重修/再修学分学费的收缴标准按《大连交通大学学分制收费管理办法》（大交大[2006]16、17号文件）执行。</p>\n<p>3.教务处将在财务处划款后发放重修考试证。请学生妥善保管，考试时必须携带重修考试证。</p>\n<p>&nbsp;</p>\n<p>&nbsp;</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;教务处</p>\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 2021年1月15日</p>', 'admin', '2021-04-08 12:47:18', '3');
INSERT INTO `gonggao` VALUES ('15', '1', '1', '1', '1', '1', '2020-10-10 00:00:00', '1');
INSERT INTO `gonggao` VALUES ('18', '042114421571', 'qqq', '', '', 'admin', '2021-04-21 14:42:49', '4');

-- ----------------------------
-- Table structure for huidawenti
-- ----------------------------
DROP TABLE IF EXISTS `huidawenti`;
CREATE TABLE `huidawenti` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qiangdawentiid` int(10) unsigned NOT NULL COMMENT '��������id',
  `bianhao` varchar(50) NOT NULL COMMENT '���',
  `biaoti` varchar(50) NOT NULL COMMENT '����',
  `tupian` varchar(255) NOT NULL COMMENT 'ͼƬ',
  `faburen` varchar(50) NOT NULL COMMENT '������',
  `qiangdaren` varchar(50) NOT NULL COMMENT '������',
  `huidafujian` varchar(255) NOT NULL COMMENT '�ش𸽼�',
  `fenshu` decimal(18,2) NOT NULL COMMENT '����',
  `beizhu` text NOT NULL COMMENT '��ע',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`),
  KEY `huidawenti_qiangdawentiid_index` (`qiangdawentiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ش�����';

-- ----------------------------
-- Records of huidawenti
-- ----------------------------

-- ----------------------------
-- Table structure for jiaoshi
-- ----------------------------
DROP TABLE IF EXISTS `jiaoshi`;
CREATE TABLE `jiaoshi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gonghao` varchar(50) NOT NULL COMMENT '����',
  `mima` varchar(50) NOT NULL COMMENT '����',
  `xingming` varchar(50) NOT NULL COMMENT '����',
  `xingbie` varchar(255) NOT NULL COMMENT '�Ա�',
  `qqhao` varchar(50) NOT NULL COMMENT 'QQ��',
  `shouji` varchar(50) NOT NULL COMMENT '�ֻ�',
  `suojiaobanji` text NOT NULL COMMENT '���̰༶',
  `xiangqing` longtext NOT NULL COMMENT '����',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `xueyuan` varchar(255) NOT NULL,
  `zhicheng` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='��ʦ';

-- ----------------------------
-- Records of jiaoshi
-- ----------------------------
INSERT INTO `jiaoshi` VALUES ('3', 'JT0001', '100000', '王一', '男', '384818073', '15541172000', '交通161,车辆161', '<p>交通学院副教授</p>', '2021-04-07 17:28:26', '', '');
INSERT INTO `jiaoshi` VALUES ('4', 'JG0001', 'JG0001', '张晓涵', '女', '1037575925', '18640203030', '物流161,物流162', '<p>经管学院物流工程讲师</p>', '2021-04-07 17:32:36', '', '');
INSERT INTO `jiaoshi` VALUES ('5', 'RJ0001', 'JG0001', '李明东', '男', '774812096', '15540002000', '软件161', '<p>讲师、副教授</p>', '2021-04-07 17:35:03', '软件学院', '讲师、副教授');
INSERT INTO `jiaoshi` VALUES ('6', 'JG0002', '123456', '张一鸣', '女', '774812096', '15588882222', '软件161,交通161', '<p>经管学院</p>', '2021-04-14 15:08:48', '经济管理学院', '副教授');

-- ----------------------------
-- Table structure for jieguo
-- ----------------------------
DROP TABLE IF EXISTS `jieguo`;
CREATE TABLE `jieguo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tikuid` int(10) unsigned NOT NULL COMMENT '���id',
  `tikubianhao` varchar(50) NOT NULL COMMENT '�����',
  `tikumingcheng` varchar(255) NOT NULL COMMENT '�������',
  `faburen` varchar(50) NOT NULL COMMENT '������',
  `kaoshibianhao` varchar(50) NOT NULL COMMENT '���Ա��',
  `shititimu` varchar(255) NOT NULL COMMENT '������Ŀ',
  `leixing` varchar(50) NOT NULL COMMENT '����',
  `daan` text NOT NULL COMMENT '��',
  `defen` decimal(18,2) NOT NULL COMMENT '�÷�',
  `zimu` varchar(50) NOT NULL COMMENT '��ĸ',
  `kaoshiren` varchar(50) NOT NULL COMMENT '������',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`),
  KEY `jieguo_tikuid_index` (`tikuid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='���';

-- ----------------------------
-- Records of jieguo
-- ----------------------------
INSERT INTO `jieguo` VALUES ('5', '3', '040802551920', 'Java课程评价题库', 'admin', '04081444354903', '你认为本课程的教学目标是否符合本专业的培养目标和规格，符合学科特点和学生实际？', '单选题', '符合', '10.00', 'A', '1618200206', '2021-04-08 14:44:35');
INSERT INTO `jieguo` VALUES ('6', '3', '040802551920', 'Java课程评价题库', 'admin', '04081444354903', '教学目标明确，布置教学任务好', '单选题', '非常好', '10.00', 'A', '1618200206', '2021-04-08 14:44:35');

-- ----------------------------
-- Table structure for kaoshijieguo
-- ----------------------------
DROP TABLE IF EXISTS `kaoshijieguo`;
CREATE TABLE `kaoshijieguo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tikuid` int(10) unsigned NOT NULL COMMENT '���id',
  `tikubianhao` varchar(50) NOT NULL COMMENT '�����',
  `tikumingcheng` varchar(255) NOT NULL COMMENT '�������',
  `faburen` varchar(50) NOT NULL COMMENT '������',
  `kaoshibianhao` varchar(50) NOT NULL COMMENT '���Ա��',
  `kaoshishichang` varchar(50) NOT NULL COMMENT '����ʱ��',
  `danxuantidefen` int(11) NOT NULL COMMENT '��ѡ��÷�',
  `duoxuantidefen` int(11) NOT NULL COMMENT '��ѡ��÷�',
  `tiankongtidefen` int(11) NOT NULL COMMENT '�����÷�',
  `zongdefen` int(11) NOT NULL COMMENT '�ܵ÷�',
  `kaoshiren` varchar(50) NOT NULL COMMENT '������',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`),
  KEY `kaoshijieguo_tikuid_index` (`tikuid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='���Խ��';

-- ----------------------------
-- Records of kaoshijieguo
-- ----------------------------
INSERT INTO `kaoshijieguo` VALUES ('3', '3', '040802551920', 'Java课程评价题库', 'admin', '04081444354903', '3', '20', '0', '0', '20', '1618200206', '2021-04-08 14:44:35');

-- ----------------------------
-- Table structure for kecheng
-- ----------------------------
DROP TABLE IF EXISTS `kecheng`;
CREATE TABLE `kecheng` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kechengbianhao` varchar(50) NOT NULL COMMENT '�γ̱��',
  `kechengmingcheng` varchar(255) NOT NULL COMMENT '�γ�����',
  `kechengleixing` int(10) unsigned NOT NULL COMMENT '�γ�����',
  `tupian` varchar(255) NOT NULL COMMENT 'ͼƬ',
  `kechengwendang` varchar(255) NOT NULL COMMENT '�γ��ĵ�',
  `kechengshipin` varchar(255) NOT NULL COMMENT '�γ���Ƶ',
  `kechengjieshao` longtext NOT NULL COMMENT '�γ̽���',
  `faburen` varchar(50) NOT NULL COMMENT '������',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  `banjimingcheng` varchar(255) NOT NULL,
  `banjiid` int(10) unsigned NOT NULL,
  `jiaoshiid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kecheng_kechengleixing_index` (`kechengleixing`),
  KEY `kecheng_FK` (`banjiid`),
  KEY `kecheng_FK_1` (`jiaoshiid`),
  CONSTRAINT `kecheng_FK` FOREIGN KEY (`banjiid`) REFERENCES `banji` (`id`),
  CONSTRAINT `kecheng_FK_1` FOREIGN KEY (`jiaoshiid`) REFERENCES `jiaoshi` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='�γ�';

-- ----------------------------
-- Records of kecheng
-- ----------------------------
INSERT INTO `kecheng` VALUES ('1', '041323579297', 'java', '3', 'upload/20210421/d0c5b9ec-d0dd-4b0e-982a-d3d216e55612.png', 'upload/20210413/46ad464c-3d95-4364-9700-83fac233f31a.doc', 'upload/20210414/d2c24493-3dfb-4658-b9cc-3e2429b34549.mp4', '<p>78787788</p>', 'admin', '2021-04-13 23:58:27', 'R信管162', '4', '5');
INSERT INTO `kecheng` VALUES ('3', '042023495662', '会计学', '3', 'upload/20210420/a4ae3df9-c1ee-43e0-849b-61b640a83df0.png', 'upload/20210420/914ee48c-d85b-481f-b02e-65057f58c837.zip', 'upload/20210420/92ad1f8c-683d-440d-a77c-c0b859ff7583.mp4', '<p>15787788787888878888888888</p>', 'admin', '2021-04-20 23:50:36', 'R信管162', '6', '5');

-- ----------------------------
-- Table structure for kechengleixing
-- ----------------------------
DROP TABLE IF EXISTS `kechengleixing`;
CREATE TABLE `kechengleixing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kechengleixing` varchar(50) NOT NULL COMMENT '�γ�����',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='�γ�����';

-- ----------------------------
-- Records of kechengleixing
-- ----------------------------
INSERT INTO `kechengleixing` VALUES ('3', '必修课', '2021-04-07 20:08:43');
INSERT INTO `kechengleixing` VALUES ('4', '选修课', '2021-04-07 20:08:51');
INSERT INTO `kechengleixing` VALUES ('5', '公共课', '2021-04-07 20:09:07');

-- ----------------------------
-- Table structure for keqiankaoqin
-- ----------------------------
DROP TABLE IF EXISTS `keqiankaoqin`;
CREATE TABLE `keqiankaoqin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kechengxinxi` int(10) unsigned NOT NULL COMMENT '�γ���ϢID',
  `kechengbianhao` varchar(50) NOT NULL COMMENT '�γ̱��',
  `kechengmingcheng` varchar(255) NOT NULL COMMENT '�γ�����',
  `kechengleixing` varchar(255) NOT NULL COMMENT '�γ�����',
  `kaishishijian` varchar(25) NOT NULL COMMENT '��ʼʱ��',
  `jieshushijian` varchar(25) NOT NULL COMMENT '����ʱ��',
  `faburen` varchar(50) NOT NULL COMMENT '������',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`),
  KEY `keqiankaoqin_kechengxinxi_index` (`kechengxinxi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��ǰ����';

-- ----------------------------
-- Records of keqiankaoqin
-- ----------------------------

-- ----------------------------
-- Table structure for lunbotu
-- ----------------------------
DROP TABLE IF EXISTS `lunbotu`;
CREATE TABLE `lunbotu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '����',
  `image` varchar(255) NOT NULL COMMENT 'ͼƬ',
  `url` varchar(255) NOT NULL COMMENT '���ӵ�ַ',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='�ֲ�ͼ';

-- ----------------------------
-- Records of lunbotu
-- ----------------------------
INSERT INTO `lunbotu` VALUES ('3', '轮播图1', 'upload/20210407/4b85d2ee-3c92-4590-93f5-216c4b8dac09.jfif', 'https://gimg2.baidu.com/image_search/', '2021-04-07 23:03:52');
INSERT INTO `lunbotu` VALUES ('4', '轮播图1', 'upload/20210407/fc58bb70-da72-4e02-a104-95ea22113c44.jfif', 'http://localhost:8080/?#/admin/lunbotuadd', '2021-04-07 23:05:49');
INSERT INTO `lunbotu` VALUES ('5', '考试通知2020-2021学年', 'upload/20210408/97c010bd-43cc-40c6-8ac3-30aa28aec872.jpg', '/gonggaodetail?id=9', '2021-04-08 12:48:21');
INSERT INTO `lunbotu` VALUES ('6', '测试2', 'upload/20210420/6f91c9e2-3bad-4b08-aab3-0aca6ddcffa1.jpg', '/gonggaodetail?id=9', '2021-04-20 11:36:29');

-- ----------------------------
-- Table structure for pingbici
-- ----------------------------
DROP TABLE IF EXISTS `pingbici`;
CREATE TABLE `pingbici` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guanjianzi` varchar(255) NOT NULL COMMENT '�ؼ���',
  `tihuanci` varchar(50) NOT NULL COMMENT '�滻��',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='���δ�';

-- ----------------------------
-- Records of pingbici
-- ----------------------------
INSERT INTO `pingbici` VALUES ('1', '123', '***', '2021-04-14 01:58:35');
INSERT INTO `pingbici` VALUES ('2', '沙bqq11', '***', '2021-04-21 01:39:26');

-- ----------------------------
-- Table structure for pinglun
-- ----------------------------
DROP TABLE IF EXISTS `pinglun`;
CREATE TABLE `pinglun` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `biao` varchar(50) NOT NULL COMMENT '��',
  `biaoid` int(11) NOT NULL COMMENT '��id',
  `biaoti` varchar(255) NOT NULL COMMENT '����',
  `pingfen` varchar(255) NOT NULL COMMENT '����',
  `pinglunneirong` text NOT NULL COMMENT '��������',
  `pinglunren` varchar(50) NOT NULL COMMENT '������',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='����';

-- ----------------------------
-- Records of pinglun
-- ----------------------------
INSERT INTO `pinglun` VALUES ('1', 'kecheng', '11', '物流管理', '5', '真好', 'admin', '2021-04-13 12:23:05');
INSERT INTO `pinglun` VALUES ('2', 'kecheng', '11', '物流管理', '5', '真好121', 'admin', '2021-04-13 12:23:21');
INSERT INTO `pinglun` VALUES ('3', '', '11', '', '3', '还行吧', 'admin', '2021-04-13 18:56:34');
INSERT INTO `pinglun` VALUES ('4', '', '11', '', '3', '787', 'admin', '2021-04-13 18:57:31');
INSERT INTO `pinglun` VALUES ('5', '', '11', '', '2', '121', 'admin', '2021-04-13 18:58:01');
INSERT INTO `pinglun` VALUES ('6', '', '11', '', '3', '你好', 'admin', '2021-04-13 18:59:48');
INSERT INTO `pinglun` VALUES ('7', '', '11', '', '2', '你好', 'admin', '2021-04-13 19:01:15');
INSERT INTO `pinglun` VALUES ('8', '', '10', '', '3', '不错', 'admin', '2021-04-13 19:03:02');
INSERT INTO `pinglun` VALUES ('9', '', '11', '', '3', 'HAO', '1618200206', '2021-04-13 19:07:50');
INSERT INTO `pinglun` VALUES ('10', '', '11', '', '2', 'HAO', '1618200206', '2021-04-13 19:08:02');
INSERT INTO `pinglun` VALUES ('11', '', '11', '', '2', '你好', '1618200206', '2021-04-13 19:08:13');
INSERT INTO `pinglun` VALUES ('12', '', '11', '', '2', '你好', '1618200206', '2021-04-13 19:08:35');
INSERT INTO `pinglun` VALUES ('13', '', '11', '', '2', '121', '1618200206', '2021-04-13 19:10:03');
INSERT INTO `pinglun` VALUES ('14', '', '11', '', '0', '121', '1618200206', '2021-04-13 19:10:11');
INSERT INTO `pinglun` VALUES ('15', '', '11', '', '3', '1212', '1618200206', '2021-04-13 19:15:02');
INSERT INTO `pinglun` VALUES ('16', 'kecheng', '11', '物流管理', '5', '1212', '1618200206', '2021-04-13 19:16:37');
INSERT INTO `pinglun` VALUES ('17', '', '11', '', '3', '121221212112', '1618200206', '2021-04-13 19:16:58');
INSERT INTO `pinglun` VALUES ('18', '11', '11', '物流管理', '2', '1212', '1618200206', '2021-04-13 19:20:27');
INSERT INTO `pinglun` VALUES ('19', '11', '11', '物流管理', '3', '7878455', '1618200206', '2021-04-13 19:20:42');
INSERT INTO `pinglun` VALUES ('20', '2', '2', 'wjulspiu', '3', '231', 'admin', '2021-04-19 14:31:44');

-- ----------------------------
-- Table structure for pingyuewenti
-- ----------------------------
DROP TABLE IF EXISTS `pingyuewenti`;
CREATE TABLE `pingyuewenti` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `huidawentiid` int(10) unsigned NOT NULL COMMENT '�ش�����id',
  `bianhao` varchar(50) NOT NULL COMMENT '���',
  `biaoti` varchar(50) NOT NULL COMMENT '����',
  `faburen` varchar(50) NOT NULL COMMENT '������',
  `qiangdaren` varchar(50) NOT NULL COMMENT '������',
  `pingfen` decimal(18,2) NOT NULL COMMENT '����',
  `pingyuejianjie` varchar(50) NOT NULL COMMENT '���ļ��',
  `pingyueren` varchar(50) NOT NULL COMMENT '������',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`),
  KEY `pingyuewenti_huidawentiid_index` (`huidawentiid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='��������';

-- ----------------------------
-- Records of pingyuewenti
-- ----------------------------
INSERT INTO `pingyuewenti` VALUES ('10', '0', '040815586116', '创建线程的方式', 'JG0001', '1618200206', '90.00', '差一点', 'JG0001', '2021-04-08 17:59:43');
INSERT INTO `pingyuewenti` VALUES ('11', '0', '040815536011', '多线程有什么用？', 'JG0001', '1618200206', '100.00', '', 'JG0001', '2021-04-08 18:00:12');

-- ----------------------------
-- Table structure for qiandao
-- ----------------------------
DROP TABLE IF EXISTS `qiandao`;
CREATE TABLE `qiandao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `keqiankaoqinid` int(10) unsigned NOT NULL COMMENT '��ǰ����id',
  `kechengxinxi` int(10) unsigned NOT NULL COMMENT '�γ���ϢID',
  `kechengbianhao` varchar(50) NOT NULL COMMENT '�γ̱��',
  `kechengmingcheng` varchar(255) NOT NULL COMMENT '�γ�����',
  `kechengleixing` varchar(255) NOT NULL COMMENT '�γ�����',
  `kaishishijian` varchar(25) NOT NULL COMMENT '��ʼʱ��',
  `jieshushijian` varchar(25) NOT NULL COMMENT '����ʱ��',
  `faburen` varchar(50) NOT NULL COMMENT '������',
  `qiandaoshijian` varchar(25) NOT NULL COMMENT 'ǩ��ʱ��',
  `qiandaoren` varchar(50) NOT NULL COMMENT 'ǩ����',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`),
  KEY `qiandao_keqiankaoqinid_index` (`keqiankaoqinid`),
  KEY `qiandao_kechengxinxi_index` (`kechengxinxi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ǩ��';

-- ----------------------------
-- Records of qiandao
-- ----------------------------

-- ----------------------------
-- Table structure for qiangdawenti
-- ----------------------------
DROP TABLE IF EXISTS `qiangdawenti`;
CREATE TABLE `qiangdawenti` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wentiqiangdaid` int(10) unsigned NOT NULL COMMENT '��������id',
  `bianhao` varchar(50) NOT NULL COMMENT '���',
  `biaoti` varchar(50) NOT NULL COMMENT '����',
  `tupian` varchar(255) NOT NULL COMMENT 'ͼƬ',
  `faburen` varchar(50) NOT NULL COMMENT '������',
  `beizhu` text NOT NULL COMMENT '��ע',
  `qiangdaren` varchar(50) NOT NULL COMMENT '������',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`),
  KEY `qiangdawenti_wentiqiangdaid_index` (`wentiqiangdaid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='��������';

-- ----------------------------
-- Records of qiangdawenti
-- ----------------------------
INSERT INTO `qiangdawenti` VALUES ('1', '2', '040815586116', '创建线程的方式', '', 'JG0001', '（1）继承Thread类\n（2）实现Runnable接口', '1618200206', '2021-04-08 16:11:21');
INSERT INTO `qiangdawenti` VALUES ('2', '1', '040815536011', '多线程有什么用？', '', 'JG0001', '（1）发挥多核CPU的优势\n（2）防止阻塞\n（3）便于建模', '1618200206', '2021-04-08 16:12:28');

-- ----------------------------
-- Table structure for qiuzhujiaoshi
-- ----------------------------
DROP TABLE IF EXISTS `qiuzhujiaoshi`;
CREATE TABLE `qiuzhujiaoshi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `laoshigonghao` varchar(50) NOT NULL COMMENT '��ʦ����',
  `laoshixingming` varchar(50) NOT NULL COMMENT '��ʦ����',
  `kemu` varchar(50) NOT NULL COMMENT '��Ŀ',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='������ʦ';

-- ----------------------------
-- Records of qiuzhujiaoshi
-- ----------------------------

-- ----------------------------
-- Table structure for shiti
-- ----------------------------
DROP TABLE IF EXISTS `shiti`;
CREATE TABLE `shiti` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tikuid` int(10) unsigned NOT NULL COMMENT '���id',
  `tikubianhao` varchar(50) NOT NULL COMMENT '�����',
  `tikumingcheng` varchar(255) NOT NULL COMMENT '�������',
  `shititimu` text NOT NULL COMMENT '������Ŀ',
  `leixing` varchar(255) NOT NULL COMMENT '����',
  `daan` text NOT NULL COMMENT '��',
  `faburen` varchar(50) NOT NULL COMMENT '������',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`),
  KEY `shiti_tikuid_index` (`tikuid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='����';

-- ----------------------------
-- Records of shiti
-- ----------------------------
INSERT INTO `shiti` VALUES ('5', '3', '040802551920', 'Java课程评价题库', '教学目标明确，布置教学任务好', '单选题', '[{\"zimu\":\"A\",\"title\":\"非常好\",\"point\":\"10\"},{\"zimu\":\"B\",\"title\":\"很好\",\"point\":\"8\"},{\"zimu\":\"C\",\"title\":\"一般\",\"point\":\"6\"},{\"zimu\":\"D\",\"title\":\"很差\",\"point\":\"4\"},{\"zimu\":\"E\",\"title\":\"非常差\",\"point\":\"2\"}]', 'admin', '2021-04-08 03:08:14');
INSERT INTO `shiti` VALUES ('6', '3', '040802551920', 'Java课程评价题库', '你认为本课程的教学目标是否符合本专业的培养目标和规格，符合学科特点和学生实际？', '单选题', '[{\"zimu\":\"A\",\"title\":\"符合\",\"point\":\"10\"},{\"zimu\":\"B\",\"title\":\"比较符合\",\"point\":\"7\"},{\"zimu\":\"C\",\"title\":\"基本符合\",\"point\":\"4\"},{\"zimu\":\"D\",\"title\":\"不符合\",\"point\":\"1\"}]', 'admin', '2021-04-08 13:11:38');

-- ----------------------------
-- Table structure for suitangceshi
-- ----------------------------
DROP TABLE IF EXISTS `suitangceshi`;
CREATE TABLE `suitangceshi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bianhao` varchar(50) NOT NULL COMMENT '���',
  `timu` varchar(255) NOT NULL COMMENT '��Ŀ',
  `tupian` varchar(255) NOT NULL COMMENT 'ͼƬ',
  `fujian` varchar(255) NOT NULL COMMENT '����',
  `xiangqing` longtext NOT NULL COMMENT '����',
  `faburen` varchar(50) NOT NULL COMMENT '������',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���ò���';

-- ----------------------------
-- Records of suitangceshi
-- ----------------------------

-- ----------------------------
-- Table structure for tiezi
-- ----------------------------
DROP TABLE IF EXISTS `tiezi`;
CREATE TABLE `tiezi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tiezibianhao` varchar(50) NOT NULL COMMENT '���ӱ��',
  `biaoti` varchar(255) NOT NULL COMMENT '����',
  `fenlei` int(10) unsigned NOT NULL COMMENT '����',
  `fujian` varchar(255) NOT NULL COMMENT '����',
  `dianzanliang` int(11) NOT NULL COMMENT '������',
  `tupian` varchar(255) NOT NULL COMMENT 'ͼƬ',
  `neirong` longtext NOT NULL COMMENT '����',
  `faburen` varchar(50) NOT NULL COMMENT '������',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`),
  KEY `tiezi_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='����';

-- ----------------------------
-- Records of tiezi
-- ----------------------------
INSERT INTO `tiezi` VALUES ('1', '041123277899', '1205', '7', '', '0', '', '<p>121</p>', '1618200126', '2021-04-11 23:27:57');
INSERT INTO `tiezi` VALUES ('2', '041201207825', '测试样式', '7', '', '2', 'upload/20210412/284d9acb-c518-49fa-b971-7470d976d890.png', '<p>测试样式aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa互杀我你睡觉前你手机壳呢剑圣靠你全家你睡觉前你说去哪你是男神去你那</p>', '1618200126', '2021-04-12 01:21:55');
INSERT INTO `tiezi` VALUES ('3', '041201482824', '读专科的计算机或二本的烂专业，哪个好？', '6', '', '10', 'upload/20210413/46a6324b-c7a6-4e06-9ed8-ffea0cc27e13.pptx', '<p>高考分数线大概刚能过二本线，但是非常想学计算机专业。如果报二本计算机可能分数不够，可能被调剂到不好的专业，如果不服从调剂可能滑档。应该报专科的计算机吗？<br /><br />　　请天涯网友们提供宝贵意见</p>', '1618200126', '2021-04-12 01:51:24');

-- ----------------------------
-- Table structure for tiezifenlei
-- ----------------------------
DROP TABLE IF EXISTS `tiezifenlei`;
CREATE TABLE `tiezifenlei` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fenleimingcheng` varchar(255) NOT NULL COMMENT '��������',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='���ӷ���';

-- ----------------------------
-- Records of tiezifenlei
-- ----------------------------
INSERT INTO `tiezifenlei` VALUES ('4', '学习经验', '2021-04-11 23:10:56');
INSERT INTO `tiezifenlei` VALUES ('5', '答疑解惑', '2021-04-11 23:11:49');
INSERT INTO `tiezifenlei` VALUES ('6', '我的大学', '2021-04-11 23:19:23');
INSERT INTO `tiezifenlei` VALUES ('7', '学业交流', '2021-04-11 23:20:15');

-- ----------------------------
-- Table structure for tiezihuifu
-- ----------------------------
DROP TABLE IF EXISTS `tiezihuifu`;
CREATE TABLE `tiezihuifu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tieziid` int(10) unsigned NOT NULL COMMENT '����id',
  `tiezibianhao` varchar(50) NOT NULL COMMENT '���ӱ��',
  `biaoti` varchar(255) NOT NULL COMMENT '����',
  `fenlei` int(10) unsigned NOT NULL COMMENT '����',
  `huifuneirong` longtext NOT NULL COMMENT '�ظ�����',
  `huifuren` varchar(50) NOT NULL COMMENT '�ظ���',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`),
  KEY `tiezihuifu_tieziid_index` (`tieziid`),
  KEY `tiezihuifu_fenlei_index` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='���ӻظ�';

-- ----------------------------
-- Records of tiezihuifu
-- ----------------------------
INSERT INTO `tiezihuifu` VALUES ('1', '3', '041201482824', '测试', '6', '<p>挺好啊</p>', '1618200126', '2021-04-12 02:09:14');
INSERT INTO `tiezihuifu` VALUES ('2', '3', '041201482824', '读专科的计算机或二本的烂专业，哪个好？', '6', '<p>还好</p>', '1618200126', '2021-04-13 00:27:28');
INSERT INTO `tiezihuifu` VALUES ('3', '3', '041201482824', '读专科的计算机或二本的烂专业，哪个好？', '6', '<p>还行吧</p>\n<p>&nbsp;</p>', '1618200206', '2021-04-13 00:28:35');
INSERT INTO `tiezihuifu` VALUES ('4', '3', '041201482824', '读专科的计算机或二本的烂专业，哪个好？', '6', '<p>真不错</p>', '1618200206', '2021-04-13 00:51:52');
INSERT INTO `tiezihuifu` VALUES ('5', '0', '041201482824', '读专科的计算机或二本的烂专业，哪个好？', '6', '<p>123</p>', '1618200206', '2021-04-13 01:07:24');
INSERT INTO `tiezihuifu` VALUES ('6', '0', '041201482824', '读专科的计算机或二本的烂专业，哪个好？', '6', '<p>12121111111</p>', '1618200206', '2021-04-13 01:08:02');
INSERT INTO `tiezihuifu` VALUES ('7', '3', '041201482824', '读专科的计算机或二本的烂专业，哪个好？', '6', '<p>1212</p>', '1618200206', '2021-04-13 01:10:53');
INSERT INTO `tiezihuifu` VALUES ('8', '3', '041201482824', '读专科的计算机或二本的烂专业，哪个好？', '6', '<p>1212</p>', '1618200206', '2021-04-13 01:15:34');
INSERT INTO `tiezihuifu` VALUES ('9', '3', '041201482824', '读专科的计算机或二本的烂专业，哪个好？', '6', '<p>1212</p>', '1618200206', '2021-04-13 01:16:34');
INSERT INTO `tiezihuifu` VALUES ('10', '3', '041201482824', '读专科的计算机或二本的烂专业，哪个好？', '6', '<p>121</p>', '1618200206', '2021-04-13 01:17:31');
INSERT INTO `tiezihuifu` VALUES ('11', '3', '041201482824', '读专科的计算机或二本的烂专业，哪个好？', '6', '<p>1212</p>', '1618200206', '2021-04-13 01:19:41');

-- ----------------------------
-- Table structure for tiku
-- ----------------------------
DROP TABLE IF EXISTS `tiku`;
CREATE TABLE `tiku` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tikubianhao` varchar(50) NOT NULL COMMENT '�����',
  `tikumingcheng` varchar(255) NOT NULL COMMENT '�������',
  `jiaoshi` varchar(255) NOT NULL COMMENT '��ʦ',
  `faburen` varchar(50) NOT NULL COMMENT '������',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='���';

-- ----------------------------
-- Records of tiku
-- ----------------------------
INSERT INTO `tiku` VALUES ('3', '040802551920', 'Java课程评价题库', 'RJ0001', 'admin', '2021-04-08 02:55:25');
INSERT INTO `tiku` VALUES ('5', '040812548386', '物流管理教学评价题库', 'JG0001', 'admin', '2021-04-08 12:54:43');

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `token` char(32) NOT NULL COMMENT 'Ψһֵ',
  `` text NOT NULL COMMENT '���������',
  `cx` varchar(50) NOT NULL COMMENT '��¼Ȩ��',
  `login` varchar(50) NOT NULL COMMENT '��¼ģ��',
  `username` varchar(50) NOT NULL COMMENT '��¼�û�',
  `valueid` varchar(50) NOT NULL COMMENT '�û�id',
  `token_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '��ǰʱ��',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ǰ�˵�¼ƾ֤';

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES ('0MPZNXEA48UYK3GM220G8IZXVBMDPDC6', '{\"addtime\":\"2021-04-07 17:53:09.0\",\"banji\":\"R信管161\",\"banjiId\":\"6\",\"chengjiCount\":0,\"id\":3,\"lianxidianhua\":\"18845256623\",\"mima\":\"1618200126\",\"qqhao\":\"1432234386\",\"touxiang\":\"\",\"xiangqing\":\"<p>R信管161班26号同学</p>\",\"xingbie\":\"男\",\"xingming\":\"赵雨晴\",\"xuehao\":\"1618200126\",\"xueshenghupingCount\":0,\"zhuanye\":\"信息管理与信息系统＋软件工程\"}', '学生', '学生', '1618200126', '3', '2021-04-28 18:20:17');
INSERT INTO `token` VALUES ('0VHH306U0GFA3B0B5T4UY4KGDIH9NYCH', '{\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-28 18:29:38');
INSERT INTO `token` VALUES ('1ETL22MPAE19G97NYEEW2ICWY31U45PQ', '{\"addtime\":\"2021-04-07 17:32:36.0\",\"gonghao\":\"JG0001\",\"id\":4,\"mima\":\"JG0001\",\"qqhao\":\"1037575925\",\"shouji\":\"18640203030\",\"suojiaobanji\":\"物流161,物流162\",\"xiangqing\":\"<p>经管学院物流工程讲师</p>\",\"xingbie\":\"女\",\"xingming\":\"张晓涵\"}', '教师', '教师', 'JG0001', '4', '2021-04-24 02:11:01');
INSERT INTO `token` VALUES ('33EHYYR95T6BMU195V751D7R0BSDYQ67', '{\"addtime\":\"2021-04-07 17:53:09.0\",\"banji\":\"R信管161\",\"banjiId\":\"6\",\"chengjiCount\":0,\"id\":3,\"lianxidianhua\":\"18845256623\",\"mima\":\"1618200126\",\"qqhao\":\"1432234386\",\"touxiang\":\"\",\"xiangqing\":\"<p>R信管161班26号同学</p>\",\"xingbie\":\"男\",\"xingming\":\"赵雨晴\",\"xuehao\":\"1618200126\",\"xueshenghupingCount\":0,\"zhuanye\":\"信息管理与信息系统＋软件工程\"}', '学生', '学生', '1618200126', '3', '2021-04-28 18:16:53');
INSERT INTO `token` VALUES ('38CRZEPRGCL5QD4GETIXZ24X7G1HW7IF', '{\"addtime\":\"2021-04-07 17:53:09.0\",\"banji\":\"R信管161\",\"chengjiCount\":0,\"id\":3,\"lianxidianhua\":\"18845256623\",\"mima\":\"1618200126\",\"qqhao\":\"1432234386\",\"touxiang\":\"\",\"xiangqing\":\"<p>R信管161班26号同学</p>\",\"xingbie\":\"男\",\"xingming\":\"赵雨晴\",\"xuehao\":\"1618200126\",\"xueshenghupingCount\":0,\"zhuanye\":\"信息管理与信息系统＋软件工程\"}', '学生', '学生', '1618200126', '3', '2021-04-22 00:24:36');
INSERT INTO `token` VALUES ('43Y8H7T46ZZFPSBBKZFK66ESNQFB9N4Q', '{\"suojiaobanji\":\"物流161,物流162\",\"mima\":\"JG0001\",\"xingbie\":\"女\",\"xueyuan\":\"\",\"login\":\"教师\",\"xingming\":\"张晓涵\",\"shouji\":\"\",\"cx\":\"教师\",\"addtime\":\"2021-04-07 17:32:36.0\",\"id\":4,\"qqhao\":\"1037575925\",\"xiangqing\":\"<p>经管学院物流工程讲师</p>\",\"gonghao\":\"JG0001\",\"username\":\"JG0001\"}', '教师', '教师', 'JG0001', '4', '2021-04-28 18:30:50');
INSERT INTO `token` VALUES ('49ZFGWUYWGCK8ZSGP7KGHVD2Z6W10O7T', '{\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-28 15:46:25');
INSERT INTO `token` VALUES ('4HN47IFS7HGSBAGCS64C0T1QCXZKYGW2', '{\"suojiaobanji\":\"物流161,物流162\",\"mima\":\"JG0001\",\"xingbie\":\"女\",\"login\":\"教师\",\"xingming\":\"张晓涵\",\"shouji\":\"18640203030\",\"cx\":\"教师\",\"addtime\":\"2021-04-07 17:32:36.0\",\"id\":4,\"qqhao\":\"1037575925\",\"xiangqing\":\"<p>经管学院物流工程讲师</p>\",\"gonghao\":\"JG0001\",\"username\":\"JG0001\"}', '教师', '教师', 'JG0001', '4', '2021-04-24 02:14:07');
INSERT INTO `token` VALUES ('4LR0P9DRWVIIC5WXOLDVDRGG6VOO94GY', '{\"touxiang\":\"\",\"mima\":\"1618200126\",\"xingbie\":\"男\",\"lianxidianhua\":\"18845256623\",\"xuehao\":\"1618200126\",\"chengjiCount\":0,\"login\":\"学生\",\"zhuanye\":\"信息管理与信息系统＋软件工程\",\"xingming\":\"赵雨晴\",\"cx\":\"学生\",\"addtime\":\"2021-04-07 17:53:09.0\",\"xueshenghupingCount\":0,\"id\":3,\"qqhao\":\"1432234386\",\"xiangqing\":\"<p>R信管161班26号同学</p>\",\"banji\":\"R信管161\",\"username\":\"1618200126\"}', '学生', '学生', '1618200126', '3', '2021-04-23 00:00:20');
INSERT INTO `token` VALUES ('4QD8I7AH1ID6GOWD6MTSXSCCDV2970CT', '{\"touxiang\":\"\",\"mima\":\"1618200126\",\"xingbie\":\"男\",\"lianxidianhua\":\"18845256623\",\"xuehao\":\"1618200126\",\"chengjiCount\":0,\"login\":\"学生\",\"zhuanye\":\"信息管理与信息系统＋软件工程\",\"xingming\":\"赵雨晴\",\"cx\":\"学生\",\"addtime\":\"2021-04-07 17:53:09.0\",\"xueshenghupingCount\":0,\"id\":3,\"qqhao\":\"1432234386\",\"xiangqing\":\"<p>R信管161班26号同学</p>\",\"banji\":\"R信管161\",\"username\":\"1618200126\"}', '学生', '学生', '1618200126', '3', '2021-04-22 23:56:51');
INSERT INTO `token` VALUES ('52LPY5CXADQKBE7WW2AL8GYL2ZG359P7', '{\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-30 00:42:36');
INSERT INTO `token` VALUES ('6I29A5SIDF6W20F32GMKZKWIV40IKOX6', '{\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-28 15:24:16');
INSERT INTO `token` VALUES ('8ALEP1CTCYGG4CZC2H3B7ZAFN38D002S', '{\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-29 22:50:09');
INSERT INTO `token` VALUES ('8GQFTYX2B6SALKLO2TC5G5H4Z7NO2W79', '{\"addtime\":\"2021-04-07 17:53:09.0\",\"banji\":\"R信管161\",\"banjiid\":6,\"chengjiCount\":0,\"id\":3,\"lianxidianhua\":\"18845256623\",\"mima\":\"1618200126\",\"qqhao\":\"1432234386\",\"touxiang\":\"\",\"xiangqing\":\"<p>R信管161班26号同学</p>\",\"xingbie\":\"男\",\"xingming\":\"赵雨晴\",\"xuehao\":\"1618200126\",\"xueshenghupingCount\":0,\"zhuanye\":\"信息管理与信息系统＋软件工程\"}', '学生', '学生', '1618200126', '3', '2021-04-29 16:00:19');
INSERT INTO `token` VALUES ('8LA5EZD6YO78E1G8VUT0WI8WGCCQ3I62', '{\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-28 17:23:02');
INSERT INTO `token` VALUES ('9462EMDWEEE9DAZ436MKRLV0O2CVLPHV', '{\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-23 12:33:12');
INSERT INTO `token` VALUES ('9XH18AORK4YLSBGGUEHRPQQGKIZHSQ25', '{\"touxiang\":\"\",\"mima\":\"1618200126\",\"xingbie\":\"男\",\"lianxidianhua\":\"18845256623\",\"xuehao\":\"1618200126\",\"chengjiCount\":0,\"login\":\"学生\",\"zhuanye\":\"信息管理与信息系统＋软件工程\",\"xingming\":\"赵雨晴\",\"cx\":\"学生\",\"addtime\":\"2021-04-07 17:53:09.0\",\"xueshenghupingCount\":0,\"id\":3,\"qqhao\":\"1432234386\",\"xiangqing\":\"<p>R信管161班26号同学</p>\",\"banji\":\"R信管161\",\"username\":\"1618200126\"}', '学生', '学生', '1618200126', '3', '2021-04-21 20:06:39');
INSERT INTO `token` VALUES ('A3TT2R5I51F2P2Z5QU6OAXN7MYIXOQO5', '{\"touxiang\":\"\",\"mima\":\"1618200126\",\"xingbie\":\"男\",\"lianxidianhua\":\"18845256623\",\"xuehao\":\"1618200126\",\"chengjiCount\":0,\"login\":\"学生\",\"zhuanye\":\"信息管理与信息系统＋软件工程\",\"xingming\":\"赵雨晴\",\"cx\":\"学生\",\"addtime\":\"2021-04-07 17:53:09.0\",\"xueshenghupingCount\":0,\"id\":3,\"qqhao\":\"1432234386\",\"xiangqing\":\"<p>R信管161班26号同学</p>\",\"banji\":\"R信管161\",\"username\":\"1618200126\"}', '学生', '学生', '1618200126', '3', '2021-04-23 02:03:16');
INSERT INTO `token` VALUES ('ALEPDS0IBGBSVV0BCTOXEMVF0NEWSF34', '{\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-05-01 01:52:01');
INSERT INTO `token` VALUES ('C2WGD2T56NLFI5T1TXCZHER35SV2GN9G', '{\"addtime\":\"2021-04-07 17:32:36.0\",\"gonghao\":\"JG0001\",\"id\":4,\"mima\":\"JG0001\",\"qqhao\":\"1037575925\",\"shouji\":\"18640203030\",\"suojiaobanji\":\"物流161,物流162\",\"xiangqing\":\"<p>经管学院物流工程讲师</p>\",\"xingbie\":\"女\",\"xingming\":\"张晓涵\"}', '教师', '教师', 'JG0001', '4', '2021-04-21 20:19:37');
INSERT INTO `token` VALUES ('CGUM4T3O5DDE976BFN67WEZTSH19VYZF', '{\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-21 23:25:55');
INSERT INTO `token` VALUES ('CKBLX8LVPIU1GHTS0XNEXGZ8POLS77TK', '{\"touxiang\":\"\",\"banjiId\":\"6\",\"mima\":\"1618200126\",\"xingbie\":\"男\",\"lianxidianhua\":\"18845256623\",\"xuehao\":\"1618200126\",\"chengjiCount\":0,\"login\":\"学生\",\"zhuanye\":\"信息管理与信息系统＋软件工程\",\"xingming\":\"赵雨晴\",\"cx\":\"学生\",\"addtime\":\"2021-04-07 17:53:09.0\",\"xueshenghupingCount\":0,\"id\":3,\"qqhao\":\"1432234386\",\"xiangqing\":\"<p>R信管161班26号同学</p>\",\"banji\":\"R信管161\",\"username\":\"1618200126\"}', '学生', '学生', '1618200126', '3', '2021-04-28 18:17:46');
INSERT INTO `token` VALUES ('CYCBKPGQHMAIG3MGMWCD738G0G2TL3I6', '{\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-28 14:36:55');
INSERT INTO `token` VALUES ('DU8FYMZGTFOSS65MHW064P108H7SYD2M', '{\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-29 11:53:41');
INSERT INTO `token` VALUES ('FBVOD66UFGVWMBUNA7FFIY7CYUTEZBWN', '{\"addtime\":\"2021-04-07 17:32:36.0\",\"gonghao\":\"JG0001\",\"id\":4,\"mima\":\"JG0001\",\"qqhao\":\"1037575925\",\"shouji\":\"18640203030\",\"suojiaobanji\":\"物流161,物流162\",\"xiangqing\":\"<p>经管学院物流工程讲师</p>\",\"xingbie\":\"女\",\"xingming\":\"张晓涵\",\"xueyuan\":\"\",\"zhicheng\":\"\"}', '教师', '教师', 'JG0001', '4', '2021-04-28 18:30:19');
INSERT INTO `token` VALUES ('FCVSU3Y29GZ2Z5NH2C0RDAGRAHWMQBNL', '{\"addtime\":\"2021-04-07 18:14:09.0\",\"banji\":\"软件161\",\"banjiid\":8,\"chengjiCount\":0,\"id\":6,\"lianxidianhua\":\"18652524496\",\"mima\":\"1618230122\",\"qqhao\":\"774812096\",\"touxiang\":\"\",\"xiangqing\":\"\",\"xingbie\":\"男\",\"xingming\":\"何楠\",\"xuehao\":\"1618230122\",\"xueshenghupingCount\":0,\"zhuanye\":\"软件工程\"}', '学生', '学生', '1618230122', '6', '2021-04-30 10:41:59');
INSERT INTO `token` VALUES ('GC1USU9MEMCFUMPHE0MMGZYSBZH6FGCD', '{\"cx\":\"管理员\",\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"login\":\"管理员\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-22 01:20:10');
INSERT INTO `token` VALUES ('GNKZNK6NORAUXBOEMNIEXDAMR7L6T3L9', '{\"touxiang\":\"\",\"mima\":\"1618200206\",\"xingbie\":\"女\",\"lianxidianhua\":\"15541172026\",\"xuehao\":\"1618200206\",\"chengjiCount\":0,\"login\":\"学生\",\"zhuanye\":\"信息管理与信息系统＋软件工程\",\"xingming\":\"马慧\",\"cx\":\"学生\",\"addtime\":\"2021-04-07 18:14:56.0\",\"xueshenghupingCount\":1,\"id\":7,\"qqhao\":\"774812096\",\"xiangqing\":\"<p>1212123</p>\",\"banji\":\"R信管162\",\"username\":\"1618200206\"}', '学生', '学生', '1618200206', '7', '2021-04-24 02:04:21');
INSERT INTO `token` VALUES ('GWDGPCOHAF41R0F9ZKHF4HDEQC7YUK6V', '{\"touxiang\":\"\",\"banjiid\":6,\"mima\":\"1618200126\",\"xingbie\":\"男\",\"lianxidianhua\":\"18845256623\",\"xuehao\":\"1618200126\",\"chengjiCount\":0,\"login\":\"学生\",\"zhuanye\":\"信息管理与信息系统＋软件工程\",\"xingming\":\"赵雨晴\",\"cx\":\"学生\",\"addtime\":\"2021-04-07 17:53:09.0\",\"xueshenghupingCount\":0,\"id\":3,\"qqhao\":\"1432234386\",\"xiangqing\":\"<p>R信管161班26号同学</p>\",\"banji\":\"R信管161\",\"username\":\"1618200126\"}', '学生', '学生', '1618200126', '3', '2021-05-01 12:21:59');
INSERT INTO `token` VALUES ('HM5G88QMONU1F46DKMZ23MPGXY3METFG', '{\"addtime\":\"2021-04-07 17:53:09.0\",\"banji\":\"R信管161\",\"chengjiCount\":0,\"id\":3,\"lianxidianhua\":\"18845256623\",\"mima\":\"1618200126\",\"qqhao\":\"1432234386\",\"touxiang\":\"\",\"xiangqing\":\"<p>R信管161班26号同学</p>\",\"xingbie\":\"男\",\"xingming\":\"赵雨晴\",\"xuehao\":\"1618200126\",\"xueshenghupingCount\":0,\"zhuanye\":\"信息管理与信息系统＋软件工程\"}', '学生', '学生', '1618200126', '3', '2021-04-22 02:02:25');
INSERT INTO `token` VALUES ('IXZAY7QF0PI0H9R1SRVONQZKGWLO89MK', '{\"addtime\":\"2021-04-07 17:53:09.0\",\"banji\":\"R信管161\",\"chengjiCount\":0,\"id\":3,\"lianxidianhua\":\"18845256623\",\"mima\":\"1618200126\",\"qqhao\":\"1432234386\",\"touxiang\":\"\",\"xiangqing\":\"<p>R信管161班26号同学</p>\",\"xingbie\":\"男\",\"xingming\":\"赵雨晴\",\"xuehao\":\"1618200126\",\"xueshenghupingCount\":0,\"zhuanye\":\"信息管理与信息系统＋软件工程\"}', '学生', '学生', '1618200126', '3', '2021-04-23 00:25:09');
INSERT INTO `token` VALUES ('KYMRP0YTZC9ZBXKTCEYCXY3PYB0ZDCX5', '{\"touxiang\":\"\",\"mima\":\"1618200206\",\"xingbie\":\"女\",\"lianxidianhua\":\"15541172026\",\"xuehao\":\"1618200206\",\"chengjiCount\":0,\"login\":\"学生\",\"zhuanye\":\"信息管理与信息系统＋软件工程\",\"xingming\":\"马慧\",\"cx\":\"学生\",\"addtime\":\"2021-04-07 18:14:56.0\",\"xueshenghupingCount\":1,\"id\":7,\"qqhao\":\"774812096\",\"xiangqing\":\"<p>1212123</p>\",\"banji\":\"R信管162\",\"username\":\"1618200206\"}', '学生', '学生', '1618200206', '7', '2021-04-28 14:49:02');
INSERT INTO `token` VALUES ('L08B2Q2FNY9XBGAQ3Z683TE2B7OV3NCV', '{\"addtime\":\"2021-04-07 17:53:09.0\",\"banji\":\"R信管161\",\"chengjiCount\":0,\"id\":3,\"lianxidianhua\":\"18845256623\",\"mima\":\"1618200126\",\"qqhao\":\"1432234386\",\"touxiang\":\"\",\"xiangqing\":\"<p>R信管161班26号同学</p>\",\"xingbie\":\"男\",\"xingming\":\"赵雨晴\",\"xuehao\":\"1618200126\",\"xueshenghupingCount\":0,\"zhuanye\":\"信息管理与信息系统＋软件工程\"}', '学生', '学生', '1618200126', '3', '2021-04-22 23:43:48');
INSERT INTO `token` VALUES ('L17GGP16VKHGDOB2C9FB5BHECKWL8DHK', '{\"touxiang\":\"\",\"mima\":\"1618200206\",\"xingbie\":\"女\",\"lianxidianhua\":\"15541172026\",\"xuehao\":\"1618200206\",\"chengjiCount\":0,\"login\":\"学生\",\"zhuanye\":\"信息管理与信息系统＋软件工程\",\"xingming\":\"马慧\",\"cx\":\"学生\",\"addtime\":\"2021-04-07 18:14:56.0\",\"xueshenghupingCount\":1,\"id\":7,\"qqhao\":\"774812096\",\"xiangqing\":\"<p>1212123</p>\",\"banji\":\"R信管162\",\"username\":\"1618200206\"}', '学生', '学生', '1618200206', '7', '2021-04-28 14:50:05');
INSERT INTO `token` VALUES ('L5NDHMDG8O0KUFC05EUN1GNFY013VXY0', '{\"suojiaobanji\":\"物流161,物流162\",\"mima\":\"JG0001\",\"xingbie\":\"女\",\"login\":\"教师\",\"xingming\":\"张晓涵\",\"shouji\":\"18640203030\",\"cx\":\"教师\",\"addtime\":\"2021-04-07 17:32:36.0\",\"id\":4,\"qqhao\":\"1037575925\",\"xiangqing\":\"<p>经管学院物流工程讲师</p>\",\"gonghao\":\"JG0001\",\"username\":\"JG0001\"}', '教师', '教师', 'JG0001', '4', '2021-04-21 23:26:15');
INSERT INTO `token` VALUES ('LWK3GX8AA83ZGK0PFD2GDGUTMY575011', '{\"touxiang\":\"\",\"mima\":\"1618200126\",\"xingbie\":\"男\",\"lianxidianhua\":\"18845256623\",\"xuehao\":\"1618200126\",\"chengjiCount\":0,\"login\":\"学生\",\"zhuanye\":\"信息管理与信息系统＋软件工程\",\"xingming\":\"赵雨晴\",\"cx\":\"学生\",\"addtime\":\"2021-04-07 17:53:09.0\",\"xueshenghupingCount\":0,\"id\":3,\"qqhao\":\"1432234386\",\"xiangqing\":\"<p>R信管161班26号同学</p>\",\"banji\":\"R信管161\",\"username\":\"1618200126\"}', '学生', '学生', '1618200126', '3', '2021-04-28 15:25:02');
INSERT INTO `token` VALUES ('M8NCR3PCEWRM5ZXP2DVS2WEGRAXSX2QG', '{\"cx\":\"管理员\",\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"login\":\"管理员\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-22 02:05:29');
INSERT INTO `token` VALUES ('MA2RA1AV8IUMOEAIEWQ3W4EVZUQKO4QR', '{\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-24 02:01:10');
INSERT INTO `token` VALUES ('MDHFPDMAEUY2Y9CP9DBAZ5CNYFLPVHF2', '{\"addtime\":\"2021-04-07 18:14:56.0\",\"banji\":\"R信管162\",\"banjiId\":\"4\",\"chengjiCount\":0,\"id\":7,\"lianxidianhua\":\"15541172026\",\"mima\":\"1618200206\",\"qqhao\":\"774812096\",\"touxiang\":\"\",\"xiangqing\":\"<p>1212123</p>\",\"xingbie\":\"女\",\"xingming\":\"马慧\",\"xuehao\":\"1618200206\",\"xueshenghupingCount\":1,\"zhuanye\":\"信息管理与信息系统＋软件工程\"}', '学生', '学生', '1618200206', '7', '2021-04-28 18:01:09');
INSERT INTO `token` VALUES ('ME5XBS4UHSP5T5W6RDDNGXTHIMQYYW6X', '{\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-24 17:50:23');
INSERT INTO `token` VALUES ('OQAX4NIGLLHDNBGKOVWNV4640H3WGL6O', '{\"addtime\":\"2021-04-07 17:32:36.0\",\"gonghao\":\"JG0001\",\"id\":4,\"mima\":\"JG0001\",\"qqhao\":\"1037575925\",\"shouji\":\"18640203030\",\"suojiaobanji\":\"物流161,物流162\",\"xiangqing\":\"<p>经管学院物流工程讲师</p>\",\"xingbie\":\"女\",\"xingming\":\"张晓涵\"}', '教师', '教师', 'JG0001', '4', '2021-04-21 21:07:33');
INSERT INTO `token` VALUES ('P3OGT23KG6CCHDFX7YZDW62LFTD5MGR0', '{\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-05-01 01:31:42');
INSERT INTO `token` VALUES ('P4NVNCAVQ3LYAY5HHOIUXQ3R29SZCB45', '{\"cx\":\"管理员\",\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"login\":\"管理员\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-05-01 12:21:10');
INSERT INTO `token` VALUES ('PKA9I69VPGDFVUE213N3ZMDWVKC78LYE', '{\"cx\":\"管理员\",\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"login\":\"管理员\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-28 18:01:16');
INSERT INTO `token` VALUES ('QSV0KSB1Z3VLQWPGSB236OL814II450T', '{\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-22 01:13:26');
INSERT INTO `token` VALUES ('QSVIEC7KS6DQZUT4097A9IE5GENKEDC7', '{\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-23 19:06:13');
INSERT INTO `token` VALUES ('RGGZ4NTW572KYQY8XS2HLC4Y22GLGCFG', '{\"cx\":\"管理员\",\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"login\":\"管理员\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-24 00:41:28');
INSERT INTO `token` VALUES ('S24YH3BMD9OPF30O6M5QHXFM5G052YTX', '{\"addtime\":\"2021-04-07 17:32:36.0\",\"gonghao\":\"JG0001\",\"id\":4,\"mima\":\"JG0001\",\"qqhao\":\"1037575925\",\"shouji\":\"18640203030\",\"suojiaobanji\":\"物流161,物流162\",\"xiangqing\":\"<p>经管学院物流工程讲师</p>\",\"xingbie\":\"女\",\"xingming\":\"张晓涵\"}', '教师', '教师', 'JG0001', '4', '2021-04-21 23:26:47');
INSERT INTO `token` VALUES ('T7RD34SCVNPLRNQR3WOH5VKGQ63LPI52', '{\"addtime\":\"2021-04-07 17:55:44.0\",\"banji\":\"R信管162\",\"banjiId\":\"4\",\"chengjiCount\":0,\"id\":4,\"lianxidianhua\":\"15541178585\",\"mima\":\"1618200201\",\"qqhao\":\"1037575925\",\"touxiang\":\"\",\"xiangqing\":\"\",\"xingbie\":\"女\",\"xingming\":\"李佳睿\",\"xuehao\":\"1618200201\",\"xueshenghupingCount\":0,\"zhuanye\":\"信息管理与信息系统＋软件工程\"}', '学生', '学生', '1618200201', '4', '2021-04-28 18:25:10');
INSERT INTO `token` VALUES ('TVHMV36KZE93UGNF36RXQI4E9XT81EGD', '{\"addtime\":\"2021-04-07 17:53:09.0\",\"banji\":\"R信管161\",\"banjiId\":\"6\",\"chengjiCount\":0,\"id\":3,\"lianxidianhua\":\"18845256623\",\"mima\":\"1618200126\",\"qqhao\":\"1432234386\",\"touxiang\":\"\",\"xiangqing\":\"<p>R信管161班26号同学</p>\",\"xingbie\":\"男\",\"xingming\":\"赵雨晴\",\"xuehao\":\"1618200126\",\"xueshenghupingCount\":0,\"zhuanye\":\"信息管理与信息系统＋软件工程\"}', '学生', '学生', '1618200126', '3', '2021-04-28 18:07:49');
INSERT INTO `token` VALUES ('U5QU2YZCR1K2C3CVGIUOMOSZ3IV46119', '{\"addtime\":\"2021-04-07 18:14:56.0\",\"banji\":\"R信管162\",\"chengjiCount\":0,\"id\":7,\"lianxidianhua\":\"15541172026\",\"mima\":\"1618200206\",\"qqhao\":\"774812096\",\"touxiang\":\"\",\"xiangqing\":\"<p>1212</p>\",\"xingbie\":\"女\",\"xingming\":\"马慧\",\"xuehao\":\"1618200206\",\"xueshenghupingCount\":1,\"zhuanye\":\"信息管理与信息系统＋软件工程\"}', '学生', '学生', '1618200206', '7', '2021-04-23 01:34:22');
INSERT INTO `token` VALUES ('UMB8WG2BKFTZSVZE2APEG7DRHMRHTGW7', '{\"touxiang\":\"\",\"banjiid\":4,\"mima\":\"1618200206\",\"xingbie\":\"女\",\"lianxidianhua\":\"15541172026\",\"xuehao\":\"1618200206\",\"chengjiCount\":0,\"login\":\"学生\",\"zhuanye\":\"信息管理与信息系统＋软件工程\",\"xingming\":\"马慧\",\"cx\":\"学生\",\"addtime\":\"2021-04-07 18:14:56.0\",\"xueshenghupingCount\":1,\"id\":7,\"qqhao\":\"774812096\",\"xiangqing\":\"<p>1212123</p>\",\"banji\":\"R信管162\",\"username\":\"1618200206\"}', '学生', '学生', '1618200206', '7', '2021-05-01 01:56:25');
INSERT INTO `token` VALUES ('UN8K8FCBW5GDGZKEWD2V6FGFF0XUAD3I', '{\"cx\":\"管理员\",\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"login\":\"管理员\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-21 13:19:28');
INSERT INTO `token` VALUES ('VQ560MHSLPBQZDNWKYQ0L3WXYB3DMAUG', '{\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-05-01 14:42:28');
INSERT INTO `token` VALUES ('VUXX3OSLA5428HD39KIO2APGKK090T0B', '{\"touxiang\":\"\",\"banjiid\":4,\"mima\":\"1618200206\",\"xingbie\":\"女\",\"lianxidianhua\":\"15541172026\",\"xuehao\":\"1618200206\",\"chengjiCount\":0,\"login\":\"学生\",\"zhuanye\":\"信息管理与信息系统＋软件工程\",\"xingming\":\"马慧\",\"cx\":\"学生\",\"addtime\":\"2021-04-07 18:14:56.0\",\"xueshenghupingCount\":1,\"id\":7,\"qqhao\":\"774812096\",\"xiangqing\":\"<p>1212123</p>\",\"banji\":\"R信管162\",\"username\":\"1618200206\"}', '学生', '学生', '1618200206', '7', '2021-05-01 01:32:23');
INSERT INTO `token` VALUES ('WF9906540RNUGP29GW80OCF8K2XWMSPZ', '{\"addtime\":\"2021-04-07 17:53:09.0\",\"banji\":\"R信管161\",\"banjiid\":6,\"chengjiCount\":0,\"id\":3,\"lianxidianhua\":\"18845256623\",\"mima\":\"1618200126\",\"qqhao\":\"1432234386\",\"touxiang\":\"\",\"xiangqing\":\"<p>R信管161班26号同学</p>\",\"xingbie\":\"男\",\"xingming\":\"赵雨晴\",\"xuehao\":\"1618200126\",\"xueshenghupingCount\":0,\"zhuanye\":\"信息管理与信息系统＋软件工程\"}', '学生', '学生', '1618200126', '3', '2021-04-30 10:14:15');
INSERT INTO `token` VALUES ('WSEVGCPU8AXE8SP2B0B7678VKKI39CYT', '{\"addtime\":\"2021-04-07 17:53:09.0\",\"banji\":\"R信管161\",\"banjiId\":\"6\",\"chengjiCount\":0,\"id\":3,\"lianxidianhua\":\"18845256623\",\"mima\":\"1618200126\",\"qqhao\":\"1432234386\",\"touxiang\":\"\",\"xiangqing\":\"<p>R信管161班26号同学</p>\",\"xingbie\":\"男\",\"xingming\":\"赵雨晴\",\"xuehao\":\"1618200126\",\"xueshenghupingCount\":0,\"zhuanye\":\"信息管理与信息系统＋软件工程\"}', '学生', '学生', '1618200126', '3', '2021-04-28 18:09:16');
INSERT INTO `token` VALUES ('X0S2SE06CGZOY8HGBIFQZSCHXWZENMM1', '{\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-28 22:46:46');
INSERT INTO `token` VALUES ('X263D98A6RAEOGNRHXN0DLCZQ5BTH52U', '{\"addtime\":\"2021-04-07 17:53:09.0\",\"banji\":\"R信管161\",\"banjiId\":\"6\",\"chengjiCount\":0,\"id\":3,\"lianxidianhua\":\"18845256623\",\"mima\":\"1618200126\",\"qqhao\":\"1432234386\",\"touxiang\":\"\",\"xiangqing\":\"<p>R信管161班26号同学</p>\",\"xingbie\":\"男\",\"xingming\":\"赵雨晴\",\"xuehao\":\"1618200126\",\"xueshenghupingCount\":0,\"zhuanye\":\"信息管理与信息系统＋软件工程\"}', '学生', '学生', '1618200126', '3', '2021-04-28 18:11:24');
INSERT INTO `token` VALUES ('XFPBB9G3HFGGAH41OU7UGZW3Z0D0G9WG', '{\"addtime\":\"2021-04-07 18:14:56.0\",\"banji\":\"R信管162\",\"chengjiCount\":0,\"id\":7,\"lianxidianhua\":\"15541172026\",\"mima\":\"1618200206\",\"qqhao\":\"774812096\",\"touxiang\":\"\",\"xiangqing\":\"<p>1212123</p>\",\"xingbie\":\"女\",\"xingming\":\"马慧\",\"xuehao\":\"1618200206\",\"xueshenghupingCount\":1,\"zhuanye\":\"信息管理与信息系统＋软件工程\"}', '学生', '学生', '1618200206', '7', '2021-04-24 19:11:05');
INSERT INTO `token` VALUES ('YR2UGFVQPFS395KG278A3VZ95KXACPDA', '{\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-21 20:02:28');
INSERT INTO `token` VALUES ('YTWE4OMLWFKQHW2LR8G0TST6QWHOLUN8', '{\"addtime\":\"2021-03-27 23:16:02.0\",\"id\":1,\"pwd\":\"admin\",\"username\":\"admin\"}', '管理员', '管理员', 'admin', '1', '2021-04-29 15:14:16');
INSERT INTO `token` VALUES ('ZRFOS19BV50PXBYQBVTGSMEORAW9FDZ6', '{\"addtime\":\"2021-04-07 18:14:56.0\",\"banji\":\"R信管162\",\"chengjiCount\":0,\"id\":7,\"lianxidianhua\":\"15541172026\",\"mima\":\"1618200206\",\"qqhao\":\"774812096\",\"touxiang\":\"\",\"xiangqing\":\"<p>1212</p>\",\"xingbie\":\"女\",\"xingming\":\"马慧\",\"xuehao\":\"1618200206\",\"xueshenghupingCount\":1,\"zhuanye\":\"信息管理与信息系统＋软件工程\"}', '学生', '学生', '1618200206', '7', '2021-04-23 19:21:53');

-- ----------------------------
-- Table structure for wentiqiangda
-- ----------------------------
DROP TABLE IF EXISTS `wentiqiangda`;
CREATE TABLE `wentiqiangda` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bianhao` varchar(50) NOT NULL COMMENT '���',
  `biaoti` varchar(50) NOT NULL COMMENT '����',
  `tupian` varchar(255) NOT NULL COMMENT 'ͼƬ',
  `qiangdarenshu` int(11) NOT NULL COMMENT '��������',
  `yiqiangrenshu` int(11) NOT NULL COMMENT '��������',
  `fujian` varchar(255) NOT NULL COMMENT '����',
  `xiangqing` longtext NOT NULL COMMENT '����',
  `faburen` varchar(50) NOT NULL COMMENT '������',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='��������';

-- ----------------------------
-- Records of wentiqiangda
-- ----------------------------
INSERT INTO `wentiqiangda` VALUES ('1', '040815536011', '多线程有什么用？', '', '5', '5', '', '<p>多线程有什么用？</p>', 'JG0001', '2021-04-08 15:56:02');
INSERT INTO `wentiqiangda` VALUES ('2', '040815586116', '创建线程的方式', '', '20', '1', 'upload/20210408/83623d85-fc6e-4a5b-8df5-a14fdadea31f.doc', '<p>创建线程的方式</p>', 'JG0001', '2021-04-08 16:00:12');

-- ----------------------------
-- Table structure for wentisousuo
-- ----------------------------
DROP TABLE IF EXISTS `wentisousuo`;
CREATE TABLE `wentisousuo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kechengmingcheng` varchar(255) NOT NULL COMMENT '�γ�����',
  `wentibiaoti` text NOT NULL COMMENT '�������',
  `wentineirong` text NOT NULL COMMENT '��������',
  `dayineirong` text NOT NULL COMMENT '��������',
  `xuehao` varchar(50) NOT NULL COMMENT 'ѧ��',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='��������';

-- ----------------------------
-- Records of wentisousuo
-- ----------------------------
INSERT INTO `wentisousuo` VALUES ('4', '会计学', '哪个会计核算制度最能准确的反应盈利能力？', '哪个会计核算制度最能准确的反应盈利能力？', '1、权责发生制最能准确反映盈利能力。\n\n2、权责发生制又称“应收应付制”。它是以本会计期间发生的费用和收入是否应计入本期损益为标准，处理有关经济业务的一种制度。凡在本期发生应从本期收入中获得补偿的费用，不论是否在本期已实际支付或未付的货币资金，均应作为本期的费用处理；凡在本期发生应归属于本期的收入，不论是否在本期已实际收到或未收到的货币资金，均应作为本期的收入处理。实行这种制度，有利于正确反映各期的费用水平和盈亏状况。', 'JG0001', '2021-04-08 00:50:36');
INSERT INTO `wentisousuo` VALUES ('5', 'JAVA', '抽象类和接口的区别', '抽象类和接口的区别', '1.语法区别\n（1）抽象类可以有构造方法，接口不能有构造方法；\n（2）抽象类中可以有普通成员变量，接口中没有普通成员变量；\n（3）抽象类中可以有非抽象的方法，接口中的方法都必须是抽象的；\n（4）抽象类中的方法可以是public，protected类型，接口中的方法只能是public类型的，切 默认为public abstract类型；\n（5）抽象类中可以有静态方法，接口中不能有静态方法；\n（6）抽象类中的静态变量访问类型可以是任意的，但接口中的静态变量只能是public static final 类型。\n（7）.一个类可以实现多个接口，但一个类只能继承一个抽象类；\n\n2.应用区别\n接口更多是在系统架构方面发挥作用，主要用于定义模块之间的通信契约；而抽象类在代码方法 发挥作用，可以使用代码块的重用；', 'JG0001', '2021-04-08 01:04:21');

-- ----------------------------
-- Table structure for xuesheng
-- ----------------------------
DROP TABLE IF EXISTS `xuesheng`;
CREATE TABLE `xuesheng` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `xuehao` varchar(50) NOT NULL COMMENT 'ѧ��',
  `mima` varchar(50) NOT NULL COMMENT '����',
  `xingming` varchar(50) NOT NULL COMMENT '����',
  `xingbie` varchar(255) NOT NULL COMMENT '�Ա�',
  `banji` varchar(255) NOT NULL COMMENT '�༶',
  `zhuanye` varchar(255) NOT NULL COMMENT 'רҵ',
  `lianxidianhua` varchar(50) NOT NULL COMMENT '��ϵ�绰',
  `qqhao` varchar(50) NOT NULL COMMENT 'QQ��',
  `touxiang` varchar(255) DEFAULT NULL COMMENT 'ͷ',
  `xiangqing` longtext NOT NULL COMMENT '����',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  `banjiid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xuesheng_FK` (`banjiid`),
  CONSTRAINT `xuesheng_FK` FOREIGN KEY (`banjiid`) REFERENCES `banji` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='ѧ��';

-- ----------------------------
-- Records of xuesheng
-- ----------------------------
INSERT INTO `xuesheng` VALUES ('3', '1618200126', '1618200126', '赵雨晴', '男', 'R信管161', '信息管理与信息系统＋软件工程', '18845256623', '1432234386', '', '<p>R信管161班26号同学</p>', '2021-04-07 17:53:09', '6');
INSERT INTO `xuesheng` VALUES ('4', '1618200201', '1618200201', '李佳睿', '女', 'R信管162', '信息管理与信息系统＋软件工程', '15541178585', '1037575925', '', '', '2021-04-07 17:55:44', '4');
INSERT INTO `xuesheng` VALUES ('5', '1618220152', '1618220152', '张明', '男', '车辆161', '车辆工程', '15541172026', '384818073', '', '', '2021-04-07 17:58:10', '7');
INSERT INTO `xuesheng` VALUES ('6', '1618230122', '1618230122', '何楠', '男', '软件161', '软件工程', '18652524496', '774812096', '', '', '2021-04-07 18:14:09', '8');
INSERT INTO `xuesheng` VALUES ('7', '1618200206', '1618200206', '马慧', '女', 'R信管162', '信息管理与信息系统＋软件工程', '15541172026', '774812096', '', '<p>1212123</p>', '2021-04-07 18:14:56', '4');
INSERT INTO `xuesheng` VALUES ('8', '1618200120', '1618200120', '邱浩', '男', 'R信管162', '信息管理与信息系统＋软件工程', '15541178282', '7778888122', '', '<p>你的</p>', '2021-04-18 15:43:48', '4');

-- ----------------------------
-- Table structure for xueshenghuping
-- ----------------------------
DROP TABLE IF EXISTS `xueshenghuping`;
CREATE TABLE `xueshenghuping` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `xueshengid` int(10) unsigned NOT NULL COMMENT 'ѧ��id',
  `xuehao` varchar(50) NOT NULL COMMENT 'ѧ��',
  `xingming` varchar(50) NOT NULL COMMENT '����',
  `hupingneirong` text NOT NULL COMMENT '��������',
  `hupingfenshu` decimal(18,2) NOT NULL COMMENT '��������',
  `hupingren` varchar(50) NOT NULL COMMENT '������',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`),
  KEY `xueshenghuping_xueshengid_index` (`xueshengid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='ѧ������';

-- ----------------------------
-- Records of xueshenghuping
-- ----------------------------
INSERT INTO `xueshenghuping` VALUES ('3', '7', '1618200206', '马慧', '', '100.00', 'JG0001', '2021-04-07 23:47:11');

-- ----------------------------
-- Table structure for youqinglianjie
-- ----------------------------
DROP TABLE IF EXISTS `youqinglianjie`;
CREATE TABLE `youqinglianjie` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wangzhanmingcheng` varchar(50) NOT NULL COMMENT '��վ����',
  `wangzhi` varchar(50) NOT NULL COMMENT '��ַ',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='��������';

-- ----------------------------
-- Records of youqinglianjie
-- ----------------------------
INSERT INTO `youqinglianjie` VALUES ('1', '大连交通大学教务在线', 'http://jw.djtu.edu.cn/homepage/index.do', '2021-04-13 12:26:39');
INSERT INTO `youqinglianjie` VALUES ('2', '大连交通大学官网', 'http://www.djtu.edu.cn/', '2021-04-13 12:28:58');
INSERT INTO `youqinglianjie` VALUES ('3', '大连交通大学就业信息网', 'http://jobs.djtu.edu.cn/', '2021-04-13 12:30:08');
INSERT INTO `youqinglianjie` VALUES ('4', '大连交通大学图书馆', 'http://library.djtu.edu.cn/', '2021-04-13 12:30:37');

-- ----------------------------
-- Table structure for zhuanye
-- ----------------------------
DROP TABLE IF EXISTS `zhuanye`;
CREATE TABLE `zhuanye` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `zhuanyeID` varchar(50) NOT NULL COMMENT 'רҵID',
  `zhuanye` varchar(50) NOT NULL COMMENT 'רҵ',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='רҵ';

-- ----------------------------
-- Records of zhuanye
-- ----------------------------
INSERT INTO `zhuanye` VALUES ('1', 'JG_01', '经济学', '2021-04-07 16:43:11');
INSERT INTO `zhuanye` VALUES ('2', 'JG_02', '信息管理与信息系统＋软件工程', '2021-04-07 16:52:45');
INSERT INTO `zhuanye` VALUES ('3', 'JG_03', '物流管理', '2021-04-07 16:59:59');
INSERT INTO `zhuanye` VALUES ('7', 'JG_04', '会计学', '2021-04-07 17:02:45');
INSERT INTO `zhuanye` VALUES ('8', 'JT_01', '车辆工程', '2021-04-07 17:03:17');
INSERT INTO `zhuanye` VALUES ('9', 'JT_02', '交通工程', '2021-04-07 17:03:52');
INSERT INTO `zhuanye` VALUES ('13', 'RJ_01', '软件工程', '2021-04-11 22:47:06');

-- ----------------------------
-- Table structure for ziyuan
-- ----------------------------
DROP TABLE IF EXISTS `ziyuan`;
CREATE TABLE `ziyuan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bianhao` varchar(50) NOT NULL COMMENT '���',
  `biaoti` varchar(50) NOT NULL COMMENT '����',
  `fenlei` varchar(255) NOT NULL COMMENT '����',
  `tupian` varchar(255) NOT NULL COMMENT 'ͼƬ',
  `fujian` varchar(255) NOT NULL COMMENT '����',
  `xiangqing` longtext NOT NULL COMMENT '����',
  `faburen` varchar(50) NOT NULL COMMENT '������',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '���ʱ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='��Դ';

-- ----------------------------
-- Records of ziyuan
-- ----------------------------
INSERT INTO `ziyuan` VALUES ('1', '04112110589', '12', '', 'upload/20210411/bc0af05a-ec30-4c79-b0eb-9dcff72551a9.jpg', 'upload/20210411/c4802ed3-7508-4aa8-b44f-7b822cb642e5.doc', '', 'JG0001', '2021-04-11 21:10:44');
INSERT INTO `ziyuan` VALUES ('5', '041402111884', 'swsw', '学业交流', '', 'upload/20210414/06aa17a8-d90b-4812-b418-abc995b564e0.mp4', '', 'JG0001', '2021-04-14 02:11:38');
