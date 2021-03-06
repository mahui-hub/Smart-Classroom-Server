-- zhkt.admins definition

CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '管理员账号',
  `pwd` varchar(50) NOT NULL COMMENT '管理员密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员帐户信息表';


-- zhkt.gonggao definition

CREATE TABLE `gonggao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bianhao` varchar(50) NOT NULL COMMENT '公告编号',
  `biaoti` varchar(50) NOT NULL COMMENT '公告标题',
  `tupian` varchar(255) NOT NULL COMMENT '图片',
  `neirong` longtext NOT NULL COMMENT '公告内容',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `kechengid` int(10) unsigned NOT NULL COMMENT '课程ID',
  PRIMARY KEY (`id`),
  KEY `gonggao_FK` (`kechengid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='公告信息表';


-- zhkt.kechengleixing definition

CREATE TABLE `kechengleixing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '课程类型ID',
  `kechengleixing` varchar(50) NOT NULL COMMENT '课程类型',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kechengleixing_un` (`kechengleixing`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='课程类型信息表';


-- zhkt.lunbotu definition

CREATE TABLE `lunbotu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `image` varchar(255) NOT NULL COMMENT '图片',
  `url` varchar(255) NOT NULL COMMENT '链接地址',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='轮播图';


-- zhkt.pinglun definition

CREATE TABLE `pinglun` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `biao` varchar(50) NOT NULL COMMENT '课程',
  `biaoid` int(10) unsigned NOT NULL COMMENT '标题ID',
  `biaoti` varchar(255) NOT NULL COMMENT '标题',
  `pingfen` varchar(255) NOT NULL COMMENT '评分',
  `pinglunneirong` text NOT NULL COMMENT '评论内容',
  `pinglunren` varchar(50) NOT NULL COMMENT '评论人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='课程评论信息表';


-- zhkt.qiandao definition

CREATE TABLE `qiandao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `keqiankaoqinid` int(10) unsigned NOT NULL COMMENT '课程考勤ID',
  `kechengxinxi` int(10) unsigned NOT NULL COMMENT '课程信息',
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='签到信息表';


-- zhkt.suitangceshi definition

CREATE TABLE `suitangceshi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `bianhao` varchar(50) NOT NULL COMMENT '测试编号',
  `timu` varchar(255) NOT NULL COMMENT '题目',
  `tupian` varchar(255) NOT NULL COMMENT '图片',
  `fujian` varchar(255) NOT NULL COMMENT '附件',
  `xiangqing` longtext NOT NULL COMMENT '详情',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='随堂测试信息表';


-- zhkt.tiezifenlei definition

CREATE TABLE `tiezifenlei` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `fenleimingcheng` varchar(255) NOT NULL COMMENT '分类名称',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='帖子分类信息表';


-- zhkt.token definition

CREATE TABLE `token` (
  `token` char(32) NOT NULL COMMENT 'token',
  `session` text NOT NULL COMMENT 'session',
  `cx` varchar(50) NOT NULL COMMENT '角色',
  `login` varchar(50) NOT NULL COMMENT 'login',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `valueid` varchar(50) NOT NULL COMMENT 'valueid',
  `token_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'token时间',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='token信息表';


-- zhkt.xueyuan definition

CREATE TABLE `xueyuan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '学院ID',
  `xueyuan` varchar(50) NOT NULL COMMENT '学院名称',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `xueyuan_un` (`xueyuan`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='学院信息表';


-- zhkt.youqinglianjie definition

CREATE TABLE `youqinglianjie` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wangzhanmingcheng` varchar(50) NOT NULL COMMENT '网站名称',
  `wangzhi` varchar(50) NOT NULL COMMENT '网站网址',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='友情链接表';


-- zhkt.zhicheng definition

CREATE TABLE `zhicheng` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '职称ID',
  `zhicheng` varchar(50) NOT NULL COMMENT '教师职称',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zhicheng_un` (`zhicheng`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='职称信息表';


-- zhkt.ziyuanfenlei definition

CREATE TABLE `ziyuanfenlei` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fenlei` varchar(255) NOT NULL,
  `addtime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ziyuanfenlei_un` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='资源分类表';


-- zhkt.jiaoshi definition

CREATE TABLE `jiaoshi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `gonghao` varchar(50) NOT NULL COMMENT '教师工号',
  `mima` varchar(50) NOT NULL COMMENT '密码',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `xingbie` varchar(50) NOT NULL COMMENT '性别',
  `qqhao` varchar(50) NOT NULL COMMENT 'QQ号',
  `shouji` varchar(50) NOT NULL COMMENT '手机号',
  `xiangqing` longtext NOT NULL COMMENT '详情',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `xueyuan` varchar(50) NOT NULL COMMENT '所属学院',
  `zhicheng` varchar(50) NOT NULL COMMENT '教师职称',
  PRIMARY KEY (`id`),
  KEY `jiaoshi_FK` (`xueyuan`),
  KEY `jiaoshi_FK_1` (`zhicheng`),
  CONSTRAINT `jiaoshi_FK` FOREIGN KEY (`xueyuan`) REFERENCES `xueyuan` (`xueyuan`),
  CONSTRAINT `jiaoshi_FK_1` FOREIGN KEY (`zhicheng`) REFERENCES `zhicheng` (`zhicheng`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='教师信息表';


-- zhkt.tiezi definition

CREATE TABLE `tiezi` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `tiezibianhao` varchar(50) NOT NULL COMMENT '帖子编号',
  `biaoti` varchar(255) NOT NULL COMMENT '帖子标题',
  `fenlei` int(10) unsigned NOT NULL COMMENT '帖子分类',
  `fujian` varchar(255) NOT NULL COMMENT '附件',
  `dianzanliang` int(11) NOT NULL COMMENT '点赞量',
  `tupian` varchar(255) NOT NULL COMMENT '图片',
  `neirong` longtext NOT NULL COMMENT '内容',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `tiezi_fenlei_index` (`fenlei`),
  CONSTRAINT `tiezi_FK` FOREIGN KEY (`fenlei`) REFERENCES `tiezifenlei` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='帖子信息表';


-- zhkt.tiezihuifu definition

CREATE TABLE `tiezihuifu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `tieziid` int(10) unsigned NOT NULL COMMENT '帖子ID',
  `tiezibianhao` varchar(50) NOT NULL COMMENT '帖子编号',
  `biaoti` varchar(255) NOT NULL COMMENT '标题',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `huifuneirong` longtext NOT NULL COMMENT '回复内容',
  `huifuren` varchar(50) NOT NULL COMMENT '回复人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `tiezihuifu_tieziid_index` (`tieziid`),
  KEY `tiezihuifu_fenlei_index` (`fenlei`),
  CONSTRAINT `tiezihuifu_FK` FOREIGN KEY (`tieziid`) REFERENCES `tiezi` (`id`),
  CONSTRAINT `tiezihuifu_FK_1` FOREIGN KEY (`fenlei`) REFERENCES `tiezifenlei` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='帖子回复信息表';


-- zhkt.zhuanye definition

CREATE TABLE `zhuanye` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '专业ID',
  `zhuanye` varchar(50) NOT NULL COMMENT '专业名称',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `xueyuan` varchar(50) NOT NULL COMMENT '学院名称',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zhuanye_un` (`zhuanye`),
  KEY `zhuanye_FK` (`xueyuan`),
  CONSTRAINT `zhuanye_FK` FOREIGN KEY (`xueyuan`) REFERENCES `xueyuan` (`xueyuan`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='专业信息表';


-- zhkt.ziyuan definition

CREATE TABLE `ziyuan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '资源ID',
  `bianhao` varchar(50) NOT NULL COMMENT '资源编号',
  `biaoti` varchar(50) NOT NULL COMMENT '资源标题',
  `fenlei` varchar(255) NOT NULL COMMENT '分类',
  `tupian` varchar(255) NOT NULL COMMENT '图片',
  `fujian` varchar(255) NOT NULL COMMENT '附件',
  `xiangqing` longtext NOT NULL COMMENT '详情',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `ziyuan_FK` (`fenlei`),
  CONSTRAINT `ziyuan_FK` FOREIGN KEY (`fenlei`) REFERENCES `ziyuanfenlei` (`fenlei`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='资源信息表';


-- zhkt.banji definition

CREATE TABLE `banji` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '班级ID',
  `xueyuan` varchar(50) NOT NULL COMMENT '学院名称',
  `zhuanye` varchar(50) NOT NULL COMMENT '专业名称',
  `banjimingcheng` varchar(50) NOT NULL COMMENT '班级名称',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `banji_un` (`banjimingcheng`),
  KEY `banji_FK` (`zhuanye`),
  KEY `banji_FK_1` (`xueyuan`),
  CONSTRAINT `banji_FK` FOREIGN KEY (`zhuanye`) REFERENCES `zhuanye` (`zhuanye`),
  CONSTRAINT `banji_FK_1` FOREIGN KEY (`xueyuan`) REFERENCES `xueyuan` (`xueyuan`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='班级信息表';


-- zhkt.dianzan definition

CREATE TABLE `dianzan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tieziid` int(10) unsigned NOT NULL COMMENT '帖子ID',
  `tiezibianhao` varchar(50) NOT NULL COMMENT '帖子编号',
  `biaoti` varchar(255) NOT NULL COMMENT '标题',
  `fenlei` int(10) unsigned NOT NULL COMMENT '分类',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `beizhu` text NOT NULL COMMENT '备注',
  `dianzanren` varchar(50) NOT NULL COMMENT '点赞人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `dianzan_tieziid_index` (`tieziid`),
  KEY `dianzan_fenlei_index` (`fenlei`),
  CONSTRAINT `dianzan_FK` FOREIGN KEY (`tieziid`) REFERENCES `tiezi` (`id`),
  CONSTRAINT `dianzan_FK_1` FOREIGN KEY (`fenlei`) REFERENCES `tiezifenlei` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='点赞信息表';


-- zhkt.kecheng definition

CREATE TABLE `kecheng` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '课程ID',
  `kechengbianhao` varchar(50) NOT NULL COMMENT '课程编号',
  `kechengmingcheng` varchar(50) NOT NULL COMMENT '课程名称',
  `kechengleixing` int(10) unsigned NOT NULL COMMENT '课程类型',
  `tupian` varchar(255) NOT NULL COMMENT '课程图片',
  `kechengwendang` varchar(255) NOT NULL COMMENT '课程文档',
  `kechengshipin` varchar(255) NOT NULL COMMENT '课程视频',
  `kechengjieshao` longtext NOT NULL COMMENT '课程介绍',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `banjimingcheng` varchar(255) NOT NULL COMMENT '班级名称',
  `banjiid` int(10) unsigned NOT NULL COMMENT '班级ID',
  `jiaoshiid` int(10) unsigned NOT NULL COMMENT '教师ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `kecheng_un` (`kechengmingcheng`),
  KEY `kecheng_kechengleixing_index` (`kechengleixing`),
  KEY `kecheng_FK` (`banjiid`),
  KEY `kecheng_FK_1` (`jiaoshiid`),
  KEY `kecheng_FK_3` (`banjimingcheng`),
  CONSTRAINT `kecheng_FK` FOREIGN KEY (`banjiid`) REFERENCES `banji` (`id`),
  CONSTRAINT `kecheng_FK_1` FOREIGN KEY (`jiaoshiid`) REFERENCES `jiaoshi` (`id`),
  CONSTRAINT `kecheng_FK_2` FOREIGN KEY (`kechengleixing`) REFERENCES `kechengleixing` (`id`),
  CONSTRAINT `kecheng_FK_3` FOREIGN KEY (`banjimingcheng`) REFERENCES `banji` (`banjimingcheng`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='课程信息表';


-- zhkt.kechengziyuan definition

CREATE TABLE `kechengziyuan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '资源ID',
  `fujian` text NOT NULL COMMENT '资源附件',
  `kechengid` int(10) unsigned NOT NULL COMMENT '课程ID',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `ziyuanname` varchar(50) NOT NULL COMMENT '资源名',
  `kechengmingcheng` varchar(50) NOT NULL COMMENT '课程名称',
  `role` varchar(50) NOT NULL COMMENT '用户角色',
  PRIMARY KEY (`id`),
  KEY `kechengziyuan_FK` (`kechengid`),
  CONSTRAINT `kechengziyuan_FK` FOREIGN KEY (`kechengid`) REFERENCES `kecheng` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='课程资源信息表';


-- zhkt.keqiankaoqin definition

CREATE TABLE `keqiankaoqin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `kechengxinxi` int(10) unsigned NOT NULL COMMENT '课程信息',
  `kechengbianhao` varchar(50) NOT NULL COMMENT '课程编号',
  `kechengmingcheng` varchar(50) NOT NULL COMMENT '课程名称',
  `kechengleixing` varchar(50) NOT NULL COMMENT '课程类型',
  `kaishishijian` varchar(50) NOT NULL COMMENT '开始时间',
  `jieshushijian` varchar(50) NOT NULL COMMENT '结束时间',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `qiandaorens` varchar(255) DEFAULT NULL COMMENT '签到人',
  PRIMARY KEY (`id`),
  KEY `keqiankaoqin_kechengxinxi_index` (`kechengxinxi`),
  KEY `keqiankaoqin_FK` (`kechengmingcheng`),
  CONSTRAINT `keqiankaoqin_FK` FOREIGN KEY (`kechengmingcheng`) REFERENCES `kecheng` (`kechengmingcheng`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='课程考勤信息表';


-- zhkt.liuyan definition

CREATE TABLE `liuyan` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '问题ID',
  `kechengid` int(10) unsigned NOT NULL COMMENT '课程ID',
  `wentibiaoti` text NOT NULL COMMENT '问题标题',
  `wentineirong` text NOT NULL COMMENT '问题内容',
  `qiuzhuren` varchar(50) NOT NULL COMMENT '求助人',
  `dayineirong` text NOT NULL COMMENT '答疑内容',
  `jiedaren` varchar(50) NOT NULL COMMENT '解答人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `liuyan_FK` (`kechengid`),
  CONSTRAINT `liuyan_FK` FOREIGN KEY (`kechengid`) REFERENCES `kecheng` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='留言信息表';


-- zhkt.tiku definition

CREATE TABLE `tiku` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `tikubianhao` varchar(50) NOT NULL COMMENT '题库编号',
  `tikumingcheng` varchar(50) NOT NULL COMMENT '题库名称',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `kechengid` int(10) unsigned NOT NULL COMMENT '课程ID',
  `tikutype` varchar(50) NOT NULL COMMENT '题库类型',
  `kaoshirens` varchar(255) DEFAULT NULL COMMENT '考试人',
  `pingjiarens` varchar(255) DEFAULT NULL COMMENT '评价人',
  `state` int(10) unsigned DEFAULT NULL COMMENT '发布状态',
  PRIMARY KEY (`id`),
  KEY `tiku_FK` (`kechengid`),
  CONSTRAINT `tiku_FK` FOREIGN KEY (`kechengid`) REFERENCES `kecheng` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='题库信息表';


-- zhkt.wentiqiangda definition

CREATE TABLE `wentiqiangda` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '抢答序号',
  `bianhao` varchar(50) NOT NULL COMMENT '抢答标号',
  `biaoti` varchar(50) NOT NULL COMMENT '抢答标题',
  `tupian` varchar(255) NOT NULL COMMENT '图片',
  `qiangdarenshu` int(11) NOT NULL COMMENT '抢答人数',
  `yiqiangrenshu` int(11) NOT NULL COMMENT '已抢人数',
  `fujian` varchar(255) NOT NULL COMMENT '附件',
  `xiangqing` longtext NOT NULL COMMENT '问题详情',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `kechengid` int(10) unsigned NOT NULL COMMENT '课程ID',
  `qiangdarens` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wentiqiangda_FK` (`kechengid`),
  CONSTRAINT `wentiqiangda_FK` FOREIGN KEY (`kechengid`) REFERENCES `kecheng` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='抢答问题信息表';


-- zhkt.wentisousuo definition

CREATE TABLE `wentisousuo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '问题ID',
  `kechengmingcheng` varchar(50) NOT NULL COMMENT '课程名称',
  `wentibiaoti` text NOT NULL COMMENT '问题标题',
  `wentineirong` text NOT NULL COMMENT '问题内容',
  `dayineirong` text NOT NULL COMMENT '答疑内容',
  `xuehao` varchar(50) NOT NULL COMMENT '录入人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `wentisousuo_FK` (`kechengmingcheng`),
  CONSTRAINT `wentisousuo_FK` FOREIGN KEY (`kechengmingcheng`) REFERENCES `kecheng` (`kechengmingcheng`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='问题答疑信息表';


-- zhkt.xuesheng definition

CREATE TABLE `xuesheng` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '学生ID',
  `xuehao` varchar(50) NOT NULL COMMENT '学生学号',
  `mima` varchar(50) NOT NULL COMMENT '帐户密码',
  `xingming` varchar(50) NOT NULL COMMENT '姓名',
  `xingbie` varchar(50) NOT NULL COMMENT '性别',
  `banji` varchar(50) NOT NULL COMMENT '班级',
  `zhuanye` varchar(50) NOT NULL COMMENT '专业',
  `lianxidianhua` varchar(50) NOT NULL COMMENT '联系电话',
  `qqhao` varchar(50) NOT NULL COMMENT 'QQ号',
  `touxiang` varchar(255) NOT NULL COMMENT '头像',
  `xiangqing` longtext COMMENT '详情',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `banjiid` int(10) unsigned NOT NULL COMMENT '班级ID',
  `hupingrens` varchar(255) DEFAULT NULL COMMENT '互评人',
  `xueyuan` varchar(100) NOT NULL COMMENT '学院',
  PRIMARY KEY (`id`),
  KEY `xuesheng_FK` (`banjiid`),
  CONSTRAINT `xuesheng_FK` FOREIGN KEY (`banjiid`) REFERENCES `banji` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='学生信息表';


-- zhkt.xueshenghuping definition

CREATE TABLE `xueshenghuping` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '互评ID',
  `xuehao` varchar(50) NOT NULL COMMENT '学生学号',
  `xingming` varchar(50) NOT NULL COMMENT '学生姓名',
  `hupingfenshu` decimal(18,2) NOT NULL COMMENT '互评分数',
  `hupingren` varchar(50) NOT NULL COMMENT '互评人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `kechengid` int(10) unsigned NOT NULL COMMENT '课程ID',
  `banjiid` varchar(100) NOT NULL COMMENT '班级ID',
  PRIMARY KEY (`id`),
  KEY `xueshenghuping_FK` (`kechengid`),
  CONSTRAINT `xueshenghuping_FK` FOREIGN KEY (`kechengid`) REFERENCES `kecheng` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='学生互评成绩表';


-- zhkt.chengji definition

CREATE TABLE `chengji` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `xuehao` varchar(50) NOT NULL COMMENT '学生学号',
  `xingming` varchar(50) NOT NULL COMMENT '学生姓名',
  `banji` varchar(50) NOT NULL COMMENT '学生班级',
  `zhuanye` varchar(50) NOT NULL COMMENT '学生专业',
  `qimochengji` decimal(18,2) NOT NULL COMMENT '考勤成绩',
  `shenghupingchengji` decimal(18,2) NOT NULL COMMENT '学生互评成绩',
  `jiaoshipingjiachengji` decimal(18,2) NOT NULL COMMENT '教师评价成绩',
  `suitangceshichengji` decimal(18,2) NOT NULL COMMENT '随堂测试成绩',
  `qiangdawentichengji` decimal(18,2) NOT NULL COMMENT '抢答问题成绩',
  `zongfen` decimal(18,2) NOT NULL COMMENT '总分',
  `tianjiaren` varchar(50) NOT NULL COMMENT '发布人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `kechengid` int(10) unsigned NOT NULL COMMENT '课程ID',
  `xueshengid` int(10) unsigned NOT NULL COMMENT '学生ID',
  PRIMARY KEY (`id`),
  KEY `chengji_FK_1` (`zhuanye`),
  KEY `chengji_FK` (`xueshengid`),
  KEY `chengji_FK_2` (`kechengid`),
  CONSTRAINT `chengji_FK` FOREIGN KEY (`xueshengid`) REFERENCES `xuesheng` (`id`),
  CONSTRAINT `chengji_FK_1` FOREIGN KEY (`zhuanye`) REFERENCES `zhuanye` (`zhuanye`),
  CONSTRAINT `chengji_FK_2` FOREIGN KEY (`kechengid`) REFERENCES `kecheng` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='成绩信息表';


-- zhkt.chengjibili definition

CREATE TABLE `chengjibili` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qimochengji` varchar(50) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL COMMENT '考勤成绩',
  `shenghupingchengji` varchar(50) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL COMMENT '学生互评成绩',
  `jiaoshipingjiachengji` varchar(50) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL COMMENT '教师评价成绩',
  `suitangceshichengji` varchar(50) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL COMMENT '随堂测试成绩',
  `qiangdawentichengji` varchar(50) CHARACTER SET utf8 COLLATE utf8_estonian_ci NOT NULL COMMENT '抢答问题成绩',
  `kechengid` int(10) unsigned NOT NULL COMMENT '课程ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `chengjibili_un` (`kechengid`),
  CONSTRAINT `chengjibili_FK` FOREIGN KEY (`kechengid`) REFERENCES `kecheng` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='成绩比例表';


-- zhkt.jieguo definition

CREATE TABLE `jieguo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `tikuid` int(10) unsigned NOT NULL COMMENT '题库ID',
  `tikubianhao` varchar(50) NOT NULL COMMENT '题库编号',
  `tikumingcheng` varchar(255) NOT NULL COMMENT '题库名称',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `kaoshibianhao` varchar(50) NOT NULL COMMENT '考试编号',
  `shititimu` varchar(255) NOT NULL COMMENT '试题题目',
  `leixing` varchar(50) NOT NULL COMMENT '试题类型',
  `daan` text NOT NULL COMMENT '答案',
  `defen` decimal(18,2) NOT NULL COMMENT '得分',
  `zimu` varchar(50) NOT NULL COMMENT '选项字母',
  `kaoshiren` varchar(50) NOT NULL COMMENT '考试人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `tikutype` varchar(100) NOT NULL COMMENT '题库类型',
  `kechengid` int(10) unsigned NOT NULL COMMENT '课程ID',
  PRIMARY KEY (`id`),
  KEY `jieguo_tikuid_index` (`tikuid`),
  CONSTRAINT `jieguo_FK` FOREIGN KEY (`tikuid`) REFERENCES `tiku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=406 DEFAULT CHARSET=utf8 COMMENT='试题结果信息表';


-- zhkt.kaoshijieguo definition

CREATE TABLE `kaoshijieguo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `tikuid` int(10) unsigned NOT NULL COMMENT '题库ID',
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
  `kechengid` int(10) unsigned NOT NULL COMMENT '课程ID',
  `tikutype` varchar(100) NOT NULL COMMENT '题库类型',
  `zongfen` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kaoshijieguo_tikuid_index` (`tikuid`),
  KEY `kaoshijieguo_FK_1` (`kechengid`),
  CONSTRAINT `kaoshijieguo_FK` FOREIGN KEY (`tikuid`) REFERENCES `tiku` (`id`),
  CONSTRAINT `kaoshijieguo_FK_1` FOREIGN KEY (`kechengid`) REFERENCES `kecheng` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='考试结果信息表';


-- zhkt.qiangdawenti definition

CREATE TABLE `qiangdawenti` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `wentiqiangdaid` int(10) unsigned NOT NULL COMMENT '问题抢答ID',
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `biaoti` varchar(50) NOT NULL COMMENT '标题',
  `tupian` varchar(255) NOT NULL COMMENT '图片',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `beizhu` text NOT NULL COMMENT '备注',
  `qiangdaren` varchar(50) NOT NULL COMMENT '抢答人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `kechengid` int(10) unsigned NOT NULL COMMENT '课程ID',
  `pingyueren` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qiangdawenti_wentiqiangdaid_index` (`wentiqiangdaid`),
  CONSTRAINT `qiangdawenti_FK` FOREIGN KEY (`wentiqiangdaid`) REFERENCES `wentiqiangda` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='抢答问题信息表';


-- zhkt.shiti definition

CREATE TABLE `shiti` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `tikuid` int(10) unsigned NOT NULL COMMENT '题库ID',
  `tikubianhao` varchar(50) NOT NULL COMMENT '题库编号',
  `tikumingcheng` varchar(50) NOT NULL COMMENT '题库名称',
  `shititimu` text NOT NULL COMMENT '试题题目',
  `leixing` varchar(50) NOT NULL COMMENT '试题类型',
  `daan` text NOT NULL COMMENT '答案',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `kechengid` int(10) unsigned NOT NULL COMMENT '课程ID',
  `tikutype` varchar(50) NOT NULL COMMENT '题库类型',
  PRIMARY KEY (`id`),
  KEY `shiti_tikuid_index` (`tikuid`),
  CONSTRAINT `shiti_FK` FOREIGN KEY (`tikuid`) REFERENCES `tiku` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COMMENT='试题信息表';


-- zhkt.pingyuewenti definition

CREATE TABLE `pingyuewenti` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `huidawentiid` int(10) unsigned NOT NULL COMMENT '回答问题ID',
  `bianhao` varchar(50) NOT NULL COMMENT '编号',
  `biaoti` varchar(50) NOT NULL COMMENT '标题',
  `faburen` varchar(50) NOT NULL COMMENT '发布人',
  `qiangdaren` varchar(50) NOT NULL COMMENT '抢答人',
  `pingfen` decimal(18,2) NOT NULL COMMENT '评分',
  `pingyuejianjie` varchar(50) NOT NULL COMMENT '评阅简介',
  `pingyueren` varchar(50) NOT NULL COMMENT '评阅人',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `kechengid` int(10) unsigned NOT NULL COMMENT '课程ID',
  PRIMARY KEY (`id`),
  KEY `pingyuewenti_huidawentiid_index` (`huidawentiid`),
  KEY `pingyuewenti_FK_1` (`kechengid`),
  CONSTRAINT `pingyuewenti_FK` FOREIGN KEY (`huidawentiid`) REFERENCES `qiangdawenti` (`id`),
  CONSTRAINT `pingyuewenti_FK_1` FOREIGN KEY (`kechengid`) REFERENCES `kecheng` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='评阅问题信息表';