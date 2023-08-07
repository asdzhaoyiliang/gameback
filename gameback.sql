/*
Navicat MySQL Data Transfer

Source Server         : helloyuan.com
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : gameback

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-07-04 16:48:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bg_activity
-- ----------------------------
DROP TABLE IF EXISTS `bg_activity`;
CREATE TABLE `bg_activity` (
  `id` int(11) unsigned NOT NULL,
  `name` char(30) NOT NULL,
  `stime` datetime DEFAULT NULL,
  `etime` datetime DEFAULT NULL,
  `serverid` varchar(200) DEFAULT NULL,
  `repeat` enum('1','0') NOT NULL DEFAULT '0' COMMENT '是否重置活动，0不重置，1重置',
  `sync` enum('1','0') NOT NULL DEFAULT '0' COMMENT '同步，0未同步，1同步',
  `strcom` varchar(20000) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动表';

-- ----------------------------
-- Records of bg_activity
-- ----------------------------
INSERT INTO `bg_activity` VALUES ('1', '每日充值', '2019-05-06 00:00:00', '2019-05-07 00:00:00', '1', '1', '1', '{\n    cmd_id = 1561915, -- 命令id，用于批量停止、删除活动  \n    act_id = 1, -- 活动id (每日充值)\n    act_name = \"每日充值\", -- 活动名称\n    act_desc = \"充值对应金额,可以领取对应奖励,充值金额不累计\", -- 活动描述\n	act_priority = 0, -- 活动优先级(0为正常,大于0为推荐,值越大越排在前)\n	ver_id = 1,	-- 版本id，用于兼容性检查，由服务端提供，活动id一致但是版本id不一致时可忽略该命令\n	pkg_id = 1,	-- 活动包id，只做记录\n	cmd_flag = 1,	-- 命令标记，0/1 活动已开启时忽略修改/活动已开启时强制修改\n	\n    beg_time = 1557141378,  -- 活动开始时间(unix timestamp)\n    end_time = 1557158399,  -- 活动结束时间(unix timestamp)\n\n	cfg_id = 1,	-- 配置id，用于标识活动配置，配置变更时配置id也会改变	\n    config = {Gold = {60,300,1980,6480,6480,20000},	\n    Rewards =       --充值奖励	\n { {	\n	{type = 0, id = 517, count =5, bind = 1,},--绑元票(小)x5\n	{type = 0, id = 571, count =3, bind = 1,},--白色羽毛x3\n	{type = 0, id = 763, count =3, bind = 1,},--洗练符x3\n	{type = 0, id = 594, count =3, bind = 1,},--5倍内功珠x3\n	{type = 0, id = 563, count =1, bind = 1,},--功勋令牌(中)x1\n  },	\n{	-- 第二档奖励\n	{type = 0, id = 571, count =10, bind = 1,},--白色羽毛x10\n	{type = 0, id = 524, count =2, bind = 1,},--血符碎片(大)x2\n	{type = 0, id = 553, count =2, bind = 1,},--灵气结晶(中)x2\n	{type = 0, id = 563, count =2, bind = 1,},--功勋令牌(中)x2\n	{type = 0, id = 763, count =15, bind = 1,},--洗练符x15\n	{type = 0, id = 630, count =2, bind = 1,},--一捆副本通行令x2\n  },	\n{	-- 第三档奖励\n	{type = 0, id = 518, count =2, bind = 1,},--绑元票(中)x2\n	{type = 0, id = 549, count =4, bind = 1,},--内功神符(大)x4\n	{type = 0, id = 525, count =1, bind = 1,},--血符碎片(巨)x1\n	{type = 0, id = 656, count =1, bind = 1,},--特戒碎片x1\n	{type = 0, id = 613, count =2, bind = 1,},--攻击药水(中)x2\n	{type = 0, id = 543, count =3, bind = 1,},--魂石结晶(中)x3\n  },	\n{	-- 第四档奖励\n	{type = 0, id = 518, count =5, bind = 1,},--绑元票(中)x5\n	{type = 0, id = 1076, count =10, bind = 1,},--天穹钢x10\n	{type = 0, id = 540, count =2, bind = 1,},--魂珠碎片(巨)x2\n	{type = 0, id = 653, count =2, bind = 1,},--特戒结晶(中)x2\n	{type = 0, id = 509, count =1, bind = 1,},--转生丹(大)x1\n	{type = 0, id = 763, count =118, bind = 1,},--洗练符x118\n  },	\n{	-- 第五档奖励\n	{type = 0, id = 518, count =7, bind = 1,},--绑元票(中)x7\n	{type = 0, id = 763, count =110, bind = 1,},--洗练符x110\n	{type = 0, id = 544, count =2, bind = 1,},--魂石结晶(大)x2\n	{type = 0, id = 610, count =2, bind = 1,},--超级祝福油x2\n	{type = 0, id = 525, count =2, bind = 1,},--血符碎片(巨)x2\n	{type = 0, id = 571, count =110, bind = 1,},--白色羽毛x110\n  },	\n{	-- 第六档奖励\n	{type = 0, id = 519, count =1, bind = 1,},--绑元票(大)x1\n	{type = 0, id = 544, count =3, bind = 1,},--魂石结晶(大)x3\n	{type = 0, id = 540, count =3, bind = 1,},--魂珠碎片(巨)x3\n	{type = 0, id = 1077, count =20, bind = 1,},--幻海绸x20\n	{type = 0, id = 515, count =1, bind = 1,},--金砖(巨)x1\n	{type = 0, id = 554, count =2, bind = 1,},--灵气结晶(大)x2\n  },},},	\n\n}');
INSERT INTO `bg_activity` VALUES ('2', '限时商品', '2019-05-05 00:00:00', '2019-05-05 23:59:00', '1', '1', '1', '{\n    cmd_id = 2551753, -- 命令id，用于批量停止、删除活动  \n    act_id = 2, -- 活动id (2 限时商品)\n    act_name = \"限时商品\", -- 活动名称\n    act_desc = \"充值对应金额可以获取相对奖励\", -- 活动描述\n   beg_time = 1557046421,  -- 活动开始时间(unix timestamp)\n	end_time = 1557071999,  -- 活动结束时间(unix timestamp)\n    config = { Money = {30,98,328},  -- 充值的金额\n  Gold = {300,980,3280},       -- 充值元宝\n  LimitCount = 15,        --活动期间最多可以领取15次\n  Rewards =  {{    -- 第一档奖励\n  {type = 0, id = 534, count =1, bind = 1,},  --宝石碎片(大)x1\n  {type = 0, id = 518, count =1, bind = 1,},  --绑元票(中)x1\n  },\n {      -- 第二档奖励\n  {type = 0, id = 1080, count =2, bind = 1,},  --幻彩羽x2\n  {type = 0, id = 571, count =30, bind = 1,},  --白色羽毛x30\n },\n {      -- 第三档奖励\n  {type = 0, id = 554, count =1, bind = 1,},  --灵气结晶(大)x1\n  {type = 0, id = 763, count =22, bind = 1,},  --洗练符x22\n },},},\n\n}\n');
INSERT INTO `bg_activity` VALUES ('3', '累计充值', '2019-05-05 00:00:00', '2019-05-08 00:00:00', '1', '1', '1', '{\n    cmd_id = 3551952, -- 命令id，用于批量停止、删除活动  \n    act_id = 3, -- 活动id (3 累计充值)\n    act_name = \"累计充值\", -- 活动名称\n    act_desc = \"充值达到对应金额，可以领取对应奖励\", -- 活动描述\n    beg_time = 1557046421,  -- 活动开始时间(unix timestamp)\n    end_time = 1557331199,  -- 活动结束时间(unix timestamp)\n    config = {\n Gold = {300,1000,5000,15000,30000,50000,100000,300000},     --充值元宝\n Rewards = \n{ {        -- 第一档奖励\n  {type = 0, id = 518, count =2, bind = 1,},  --绑元票(中)x2 \n  {type = 0, id = 645, count =10, bind = 1,},  --副本通行令x10 \n  {type = 0, id = 763, count =3, bind = 1,},  --洗练符x3 \n  {type = 0, id = 595, count =3, bind = 1,},  --6倍内功珠x3 \n},\n{         -- 第二档奖励\n  {type = 0, id = 563, count =3, bind = 1,},  --功勋令牌(中)x3 \n  {type = 0, id = 553, count =3, bind = 1,},  --灵气结晶(中)x3 \n  {type = 0, id = 524, count =3, bind = 1,},  --血符碎片(大)x3 \n  {type = 0, id = 1077, count =3, bind = 1,},  --幻海绸x3 \n  {type = 0, id = 518, count =5, bind = 1,},  --绑元票(中)x5 \n},\n{         -- 第三档奖励\n  {type = 0, id = 200, count =1, bind = 1,},  --神铸碎片x1 \n  {type = 0, id = 553, count =6, bind = 1,},  --灵气结晶(中)x6 \n  {type = 0, id = 524, count =5, bind = 1,},  --血符碎片(大)x5 \n  {type = 0, id = 1077, count =6, bind = 1,},  --幻海绸x6 \n  {type = 0, id = 763, count =30, bind = 1,},  --洗练符x30 \n},\n{         -- 第四档奖励\n  {type = 0, id = 200, count =3, bind = 1,},  --神铸碎片x3 \n  {type = 0, id = 554, count =1, bind = 1,},  --灵气结晶(大)x1 \n  {type = 0, id = 525, count =1, bind = 1,},  --血符碎片(巨)x1 \n  {type = 0, id = 558, count =10, bind = 1,},  --成就令牌(中)x10 \n  {type = 0, id = 519, count =3, bind = 1,},  --绑元票(大)x3 \n},\n{         -- 第五档奖励\n  {type = 0, id = 569, count =3, bind = 1,},  --积分令牌(大)x3 \n  {type = 0, id = 554, count =2, bind = 1,},  --灵气结晶(大)x2 \n  {type = 0, id = 525, count =2, bind = 1,},  --血符碎片(巨)x2 \n  {type = 0, id = 504, count =3, bind = 1,},  --经验宝典(大)x3 \n  {type = 0, id = 763, count =300, bind = 1,},  --洗练符x300 \n},\n{         -- 第六档奖励\n  {type = 0, id = 200, count =8, bind = 1,},  --神铸碎片x8 \n  {type = 0, id = 554, count =3, bind = 1,},  --灵气结晶(大)x3 \n  {type = 0, id = 525, count =3, bind = 1,},  --血符碎片(巨)x3 \n  {type = 0, id = 1077, count =28, bind = 1,},  --幻海绸x28 \n  {type = 0, id = 656, count =4, bind = 1,},  --特戒碎片x4 \n},\n{         -- 第七档奖励\n  {type = 0, id = 653, count =10, bind = 1,},  --特戒结晶(中)x10 \n  {type = 0, id = 554, count =4, bind = 1,},  --灵气结晶(大)x4 \n  {type = 0, id = 525, count =6, bind = 1,},  --血符碎片(巨)x6 \n  {type = 0, id = 569, count =6, bind = 1,},  --积分令牌(大)x6 \n  {type = 0, id = 763, count =500, bind = 1,},  --洗练符x500 \n},\n{         -- 第八档奖励\n  {type = 0, id = 200, count =28, bind = 1,},  --神铸碎片x28 \n  {type = 0, id = 544, count =6, bind = 1,},  --魂石结晶(大)x6 \n  {type = 0, id = 525, count =8, bind = 1,},  --血符碎片(巨)x8 \n  {type = 0, id = 1070, count =10, bind = 1,},  --1阶圣装碎片x10 \n  {type = 0, id = 519, count =6, bind = 1,},  --绑元票(大)x6 \n},},},\n\n}\n');
INSERT INTO `bg_activity` VALUES ('13', '重复充值', '2019-05-06 00:00:00', '2019-05-07 00:00:00', '1', '1', '1', '{\n    cmd_id = 13561926, -- 命令id，用于批量停止、删除活动  \n    act_id = 13, -- 活动id (13 重复充值)\n    act_name = \'重复充值\', -- 活动名称\n    act_desc = \'每次充值980元宝即可领取奖励！\', -- 活动描述\n    beg_time = 1557141378,  -- 活动开始时间(unix timestamp)\n    end_time = 1557158399,  -- 活动结束时间(unix timestamp)\n    config =    {\n   Gold = 980,      --充值元宝\n   LimitCount = 25,        --活动期间最多可以领取25次\n   Rewards =  {\n  {type = 0, id = 558, count =3, bind = 1,},--成就令牌(中)x3\n  {type = 0, id = 571, count =10, bind = 1,},--白色羽毛x10\n  {type = 0, id = 524, count =1, bind = 1,},--血符碎片(大)x1\n  {type = 0, id = 1078, count =2, bind = 1,},--地之痕x2\n  {type = 0, id = 763, count =12, bind = 1,},--洗练符x12\n  {type = 0, id = 514, count =1, bind = 1,},--金砖(大)x1\n },},\n\n\n\n}');
INSERT INTO `bg_activity` VALUES ('19', '每日血符比拼', '2019-05-06 00:00:00', '2019-05-07 00:00:00', '1', '1', '1', '{\n    cmd_id = 19562007, -- 命令id，用于批量停止、删除活动  \n    act_id = 19, -- 活动id (5 达标竞技)\n    act_name = \"每日血符竞技\", -- 活动名称\n    act_desc = \"活动期间每天获取血符值达到对应档次则可领取丰厚奖励！\", -- 活动描述\n    beg_time = 1557141378,  -- 活动开始时间(unix timestamp)\n    end_time = 1557145800,  -- 活动结束时间(unix timestamp)\n    config = -- 配置数据\n    {   Awards =   { {\n  desc = \"10万血符值\" ,\n  icon = 1,\n  needValue = 100000,   --获得奖励类型值得数量\n  maxCount = 1,\n  mailReward = 1,      --邮件奖励，不能领取\n  awards = {\n   {type = 0, id = 525, count =3, bind = 1,},  --血符碎片(巨)x3 \n   {type = 0, id = 554, count =1, bind = 1,},  --灵气结晶(大)x1 \n   {type = 0, id = 1882, count =1, bind = 1,},  --活力一夏碎片x1 \n},},{\n  desc = \"3万血符值\" ,\n  icon = 2,\n  needValue = 30000,   --获得奖励类型值得数量\nneedBroadcast = true,\n  maxCount = 10,\n  awards = {\n   {type = 0, id = 1080, count =5, bind = 1,},  --幻彩羽x5 \n   {type = 0, id = 519, count =1, bind = 1,},  --绑元票(大)x1 \n},},{\n  desc = \"1万血符值\" ,\n  icon = 3,\n  needValue = 10000,   --获得奖励类型值得数量\nneedBroadcast = true,\n  maxCount = 50,\n  awards = {\n   {type = 0, id = 523, count =15, bind = 1,},  --血符碎片(中)x15 \n   {type = 0, id = 558, count =1, bind = 1,},  --成就令牌(中)x1 \n},},{\n  desc = \"3千血符值\" ,\n  icon = 5,\n  needValue = 3000,   --获得奖励类型值得数量\nneedBroadcast = true,\n  maxCount = -1,\n  awards = {\n   {type = 0, id = 523, count =5, bind = 1,},  --血符碎片(中)x5 \n   {type = 0, id = 557, count =5, bind = 1,},  --成就令牌(小)x5 \n},},},},\n\n}');
INSERT INTO `bg_activity` VALUES ('52', '限量商品', '2019-05-06 00:00:00', '2019-05-07 00:00:00', '1', '1', '1', '{\n    cmd_id = 52561936, -- 命令id，用于批量停止、删除活动  \n    act_id = 52, -- 活动id (52 限量商品)\n    act_name = \"限量商品\", -- 活动名称\n    act_desc = \"充值对应金额可以获取相对奖励\", -- 活动描述\n    beg_time = 1557141378,  -- 活动开始时间(unix timestamp)\n    end_time = 1557158399,  -- 活动结束时间(unix timestamp)\n    config = {  Money = {648,1000,2000},      --充值的金额\n  Gold = {6480,10000,20000},    --充值元宝\n  LimitCount = 20,    --活动期间最多可以领取20次\n  Rewards = { {      --第一档奖励\n  {type = 0, id = 518, count =4, bind = 1,}, --绑元票(中)x4\n  {type = 0, id = 563, count =12, bind = 1,}, --功勋令牌(中)x12\n  {type = 0, id = 544, count =1, bind = 1,}, --魂石结晶(大)x1\n  {type = 0, id = 525, count =1, bind = 1,}, --血符碎片(巨)x1\n  {type = 0, id = 559, count =3, bind = 1,}, --成就令牌(大)x3\n  },\n  {      --第二档奖励\n  {type = 0, id = 571, count =60, bind = 1,}, --白色羽毛x60\n  {type = 0, id = 200, count =1, bind = 1,}, --神铸碎片x1\n  {type = 0, id = 544, count =1, bind = 1,}, --魂石结晶(大)x1\n  {type = 0, id = 525, count =1, bind = 1,}, --血符碎片(巨)x1\n  {type = 0, id = 656, count =1, bind = 1,}, --特戒碎片x1\n  },\n  {      --第三档奖励\n  {type = 0, id = 763, count =150, bind = 1,}, --洗练符x150\n  {type = 0, id = 509, count =2, bind = 1,}, --转生丹(大)x2\n  {type = 0, id = 544, count =2, bind = 1,}, --魂石结晶(大)x2\n  {type = 0, id = 525, count =2, bind = 1,}, --血符碎片(巨)x2\n  {type = 0, id = 535, count =2, bind = 1,}, --宝石碎片(巨)x2\n  },  },  },\n\n\n}');
INSERT INTO `bg_activity` VALUES ('63', '超级团购', '2019-05-05 00:00:00', '2019-05-05 23:59:00', '1', '1', '1', '{\n	cmd_id = 63551643, -- 命令id，用于批量停止、删除活动	\n	act_id = 63, -- 活动id (63 超级团购)\n	act_name = \"超级团购\", -- 活动名称\n	act_desc = \"参与团购！你们的购买数量只要达到指定数量即可领取奖励！\", -- 活动描述\n	beg_time = 1557046421,  -- 活动开始时间(unix timestamp)\n	end_time = 1557071999,  -- 活动结束时间(unix timestamp)\n	config = -- 配置数据\n	{\n    choiceItemNum = 12,  --团购数量 \n    itemList = \n  {\n  { weight = 1, type = 0, id = 1883, count = 1, buyLimit = 5, nowPrice = 3000, oldPrice = 5000, bind = 0,}, --网球拍碎片x1\n  { weight = 1, type = 0, id = 613, count = 2, buyLimit = 5, nowPrice = 150, oldPrice = 300, bind = 1,}, --攻击药水(中)x2\n  { weight = 1, type = 0, id = 1098, count = 2, buyLimit = 5, nowPrice = 150, oldPrice = 200, bind = 1,}, --成就令牌x2\n  { weight = 1, type = 0, id = 763, count = 10, buyLimit = 10, nowPrice = 160, oldPrice = 300, bind = 1,}, --洗练符x10\n  { weight = 1, type = 0, id = 509, count = 1, buyLimit = 5, nowPrice = 1200, oldPrice = 2000, bind = 1,}, --转生丹(大)x1\n  { weight = 1, type = 0, id = 642, count = 10, buyLimit = 2, nowPrice = 150, oldPrice = 200, bind = 1,}, --寻宝钥匙x10\n  { weight = 1, type = 0, id = 571, count = 30, buyLimit = 10, nowPrice = 200, oldPrice = 300, bind = 1,}, --白色羽毛x30\n  { weight = 1, type = 0, id = 1076, count = 3, buyLimit = 8, nowPrice = 200, oldPrice = 300, bind = 1,}, --天穹钢x3\n  { weight = 1, type = 0, id = 1077, count = 3, buyLimit = 8, nowPrice = 200, oldPrice = 300, bind = 1,}, --幻海绸x3\n  { weight = 1, type = 0, id = 1078, count = 3, buyLimit = 8, nowPrice = 200, oldPrice = 300, bind = 1,}, --地之痕x3\n  { weight = 1, type = 0, id = 1079, count = 3, buyLimit = 8, nowPrice = 200, oldPrice = 300, bind = 1,}, --山之灵x3\n  { weight = 1, type = 0, id = 1080, count = 3, buyLimit = 8, nowPrice = 200, oldPrice = 300, bind = 1,}, --幻彩羽x3\n   },\n   Rewards=\n  {  {\n   buyCount=100,\n   Awards=\n{ --第一档奖励\n     { type = 0, id = 518, count = 1, bind = 1, },   --绑元票(中)x1 \n     { type = 0, id = 558, count = 5, bind = 1, },   --成就令牌(中)x5 \n},  },\n{\n   buyCount=200,\n   Awards=\n{ --第二档奖励\n     { type = 0, id = 518, count = 5, bind = 1, },   --绑元票(中)x5 \n     { type = 0, id = 559, count = 2, bind = 1, },   --成就令牌(大)x2 \n},  },\n{\n   buyCount=300,\n   Awards=\n{ --第三档奖励\n     { type = 0, id = 519, count = 1, bind = 1, },   --绑元票(大)x1 \n     { type = 0, id = 559, count = 2, bind = 1, },   --成就令牌(大)x2 \n},  }, },  },\n\n}');
INSERT INTO `bg_activity` VALUES ('79', '限时单笔', '2019-05-05 00:00:00', '2019-05-05 23:59:00', '1', '1', '1', '{\n    cmd_id = 79551558, -- 命令id，用于批量停止、删除活动  \n    act_id = 79, -- 活动id (79 限时单笔)\n    act_name = \"单笔首充\", -- 活动名称\n    act_desc = \"充值等于对应金额，可以领取对应奖励\", -- 活动描述\n    beg_time = 1557046421,  -- 活动开始时间(unix timestamp)\n	end_time = 1557071999,  -- 活动结束时间(unix timestamp)\n    config = {\n   Awards = \n  {  {\n    Gold = 500,  --元宝\n    Money = 50,  --金额\n    desc = \"需要单笔充值50元\",\n    Rewards = \n{\n{type = 0, id = 563, count = 2, bind = 1,},  --功勋令牌(中)x2  \n{type = 0, id = 571, count = 6, bind = 1,},  --白色羽毛x6  \n{type = 0, id = 763, count = 6, bind = 1,},  --洗练符x6  \n},   },  {\n    Gold = 3280,  --元宝\n    Money = 328,  --金额\n    desc = \"需要单笔充值328元\",\n    Rewards = \n{\n{type = 0, id = 564, count = 1, bind = 1,},  --功勋令牌(大)x1  \n{type = 0, id = 543, count = 3, bind = 1,},  --魂石结晶(中)x3  \n{type = 0, id = 553, count = 5, bind = 1,},  --灵气结晶(中)x5  \n{type = 0, id = 549, count = 6, bind = 1,},  --内功神符(大)x6  \n},   },  {\n    Gold = 6480,  --元宝\n    Money = 648,  --金额\n    desc = \"需要单笔充值648元\",\n    Rewards = \n{\n{type = 0, id = 564, count = 2, bind = 1,},  --功勋令牌(大)x2  \n{type = 0, id = 525, count = 1, bind = 1,},  --血符碎片(巨)x1  \n{type = 0, id = 553, count = 8, bind = 1,},  --灵气结晶(中)x8  \n{type = 0, id = 540, count = 1, bind = 1,},  --魂珠碎片(巨)x1  \n{type = 0, id = 514, count = 6, bind = 1,},  --金砖(大)x6  \n},   },  {\n    Gold = 20000,  --元宝\n    Money = 2000,  --金额\n    desc = \"需要单笔充值2000元\",\n    Rewards = \n{\n{type = 0, id = 1098, count = 3, bind = 1,},  --成就令牌x3  \n{type = 0, id = 509, count = 1, bind = 1,},  --转生丹(大)x1  \n{type = 0, id = 200, count = 3, bind = 1,},  --神铸碎片x3  \n{type = 0, id = 554, count = 2, bind = 1,},  --灵气结晶(大)x2  \n{type = 0, id = 763, count = 138, bind = 1,},  --洗练符x138  \n},   }, },   },\n\n\n}\n');
INSERT INTO `bg_activity` VALUES ('81', '消费排行', '2019-05-06 00:00:00', '2019-05-07 00:00:00', '1', '1', '1', '{\n	cmd_id = 81562049, -- 命令id，用于批量停止、删除活动	\n	act_id = 81, -- 活动id (81 新消费排行)\n	act_name = \"新消费排行\", -- 活动名称\n	act_desc = \"活动结束时根据消费排名领取丰厚奖励！\", -- 活动描述\n	beg_time = 1557141378,  -- 活动开始时间(unix timestamp)\n	end_time = 1557147600,  -- 活动结束时间(unix timestamp)\n	config = -- 配置数据\n	{  needMinValue = 1222, --上榜最低要求\n  exAward =  \n  {\n  desc = \"消费3333元宝奖励\" ,\n  needValue = 3333,  --大于等于上榜最低要求，不然有bug\n  icon = 1,\n  awards =  {\n  { type = 0, id = 554, count = 1, bind = 1, },  --灵气结晶(大)x1\n  { type = 0, id = 535, count = 1, bind = 1, },  --宝石碎片(巨)x1\n  { type = 0, id = 630, count = 8, bind = 1, },  --一捆副本通行令x8\n  { type = 0, id = 559, count = 2, bind = 1, },  --成就令牌(大)x2\n  },}, \n  Awards =\n  {{\n  desc = \"消费第1名\" ,\n  icon = 1,\n  cond = {1, 1},\n  awards =  {\n  { type = 0, id = 525, count = 3, bind = 1, },  --血符碎片(巨)x3\n  { type = 0, id = 571, count = 288, bind = 1, },  --白色羽毛x288\n  { type = 0, id = 554, count = 1, bind = 1, },  --灵气结晶(大)x1\n  { type = 0, id = 763, count = 288, bind = 1, },  --洗练符x288\n },\n },\n{\n  desc = \"消费第2名\" ,\n  icon = 1,\n  cond = {2, 2},\n  awards =  {\n  { type = 0, id = 525, count = 2, bind = 1, },  --血符碎片(巨)x2\n  { type = 0, id = 571, count = 120, bind = 1, },  --白色羽毛x120\n  { type = 0, id = 553, count = 4, bind = 1, },  --灵气结晶(中)x4\n  { type = 0, id = 549, count = 3, bind = 1, },  --内功神符(大)x3\n },\n },\n{\n  desc = \"消费第3名\" ,\n  icon = 1,\n  cond = {3, 3},\n  awards =  {\n  { type = 0, id = 525, count = 1, bind = 1, },  --血符碎片(巨)x1\n  { type = 0, id = 571, count = 80, bind = 1, },  --白色羽毛x80\n  { type = 0, id = 553, count = 3, bind = 1, },  --灵气结晶(中)x3\n  { type = 0, id = 549, count = 2, bind = 1, },  --内功神符(大)x2\n },\n },\n{\n  desc = \"消费第4-10名\" ,\n  icon = 1,\n  cond = {4, 10},\n  awards =  {\n  { type = 0, id = 534, count = 5, bind = 1, },  --宝石碎片(大)x5\n  { type = 0, id = 571, count = 50, bind = 1, },  --白色羽毛x50\n  { type = 0, id = 553, count = 2, bind = 1, },  --灵气结晶(中)x2\n  { type = 0, id = 549, count = 1, bind = 1, },  --内功神符(大)x1\n }, }, }, },\n\n}');

-- ----------------------------
-- Table structure for bg_actors
-- ----------------------------
DROP TABLE IF EXISTS `bg_actors`;
CREATE TABLE `bg_actors` (
  `actorid` int(10) unsigned NOT NULL COMMENT '角色ID',
  `actorname` varchar(32) NOT NULL COMMENT '角色名',
  `accountid` int(10) unsigned NOT NULL COMMENT '账户ID',
  `accountname` varchar(80) NOT NULL COMMENT '账户的名字',
  `serverindex` int(10) unsigned NOT NULL COMMENT '玩家所在的服务器的编号',
  `createtime` datetime NOT NULL COMMENT '角色的创建时间',
  `sex` tinyint(3) unsigned NOT NULL COMMENT '性别',
  `job` tinyint(3) unsigned NOT NULL COMMENT '职业',
  `level` tinyint(3) unsigned NOT NULL COMMENT '等级',
  `exp` int(10) unsigned DEFAULT NULL COMMENT '玩家的经验',
  `bindcoin` int(10) unsigned DEFAULT NULL COMMENT '绑定金钱',
  `bindyuanbao` int(10) unsigned DEFAULT NULL COMMENT '绑定元宝',
  `nonbindyuanbao` int(11) DEFAULT NULL COMMENT '非绑定元宝',
  `nonbindcoin` int(10) unsigned DEFAULT NULL COMMENT '非绑定金钱',
  `personalscore` int(10) unsigned DEFAULT NULL COMMENT '个人积分',
  `fightvalue` int(10) unsigned DEFAULT NULL COMMENT '战斗力',
  `recharge` int(10) unsigned DEFAULT NULL COMMENT '充值元宝数',
  UNIQUE KEY `actorid` (`actorid`,`serverindex`,`accountid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='全服角色表';

-- ----------------------------
-- Records of bg_actors
-- ----------------------------

-- ----------------------------
-- Table structure for bg_batch
-- ----------------------------
DROP TABLE IF EXISTS `bg_batch`;
CREATE TABLE `bg_batch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(20) NOT NULL COMMENT '批名',
  `item_id` int(11) unsigned NOT NULL COMMENT '道具id',
  `limit_times` tinyint(4) unsigned NOT NULL COMMENT '使用次数',
  `limit_pi` tinyint(4) unsigned NOT NULL COMMENT '同批号使用限制',
  `serverid` varchar(500) NOT NULL COMMENT '服务器id',
  `stime` datetime DEFAULT NULL COMMENT '开始时间',
  `etime` datetime DEFAULT NULL COMMENT '结束时间',
  `des` varchar(500) DEFAULT NULL COMMENT '描述',
  `mutex` int(11) unsigned DEFAULT NULL COMMENT '互斥组',
  `create_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='激活码-批管理';

-- ----------------------------
-- Records of bg_batch
-- ----------------------------
INSERT INTO `bg_batch` VALUES ('1', 'helloyuancom', '0', '2', '1', '1', '2019-11-09 12:43:00', '2019-11-16 17:58:00', '超级装备礼盒', null, '1573274528');

-- ----------------------------
-- Table structure for bg_cdkey
-- ----------------------------
DROP TABLE IF EXISTS `bg_cdkey`;
CREATE TABLE `bg_cdkey` (
  `cdkey` char(8) NOT NULL COMMENT '激活码',
  `batch_id` int(11) unsigned NOT NULL COMMENT '批id',
  `use_times` tinyint(3) unsigned DEFAULT '0' COMMENT '使用次数',
  PRIMARY KEY (`cdkey`),
  KEY `bg_cdkey_ibfk_1` (`batch_id`) USING BTREE,
  CONSTRAINT `bg_cdkey_ibfk_1` FOREIGN KEY (`batch_id`) REFERENCES `bg_batch` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='激活码';

-- ----------------------------
-- Records of bg_cdkey
-- ----------------------------
INSERT INTO `bg_cdkey` VALUES ('9jmLXJyr', '1', '0');
INSERT INTO `bg_cdkey` VALUES ('gg5bkE2L', '1', '0');
INSERT INTO `bg_cdkey` VALUES ('XSZ3MGUv', '1', '0');

-- ----------------------------
-- Table structure for bg_cdkey_use
-- ----------------------------
DROP TABLE IF EXISTS `bg_cdkey_use`;
CREATE TABLE `bg_cdkey_use` (
  `actorid` int(11) unsigned NOT NULL,
  `cdkey` char(16) NOT NULL,
  `mutex` int(11) unsigned DEFAULT '1',
  `batch_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '批号',
  `serverid` int(10) unsigned NOT NULL,
  `logdate` datetime NOT NULL,
  `account` varchar(32) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `cardtype` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='激活码使用表';

-- ----------------------------
-- Records of bg_cdkey_use
-- ----------------------------

-- ----------------------------
-- Table structure for bg_channel
-- ----------------------------
DROP TABLE IF EXISTS `bg_channel`;
CREATE TABLE `bg_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flag` varchar(50) NOT NULL COMMENT '渠道标识',
  `name` varchar(50) NOT NULL COMMENT '渠道名称',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `flag` (`flag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='渠道';

-- ----------------------------
-- Records of bg_channel
-- ----------------------------
INSERT INTO `bg_channel` VALUES ('7', 'game', 'game', '2018-09-18 21:32:38');

-- ----------------------------
-- Table structure for bg_economy
-- ----------------------------
DROP TABLE IF EXISTS `bg_economy`;
CREATE TABLE `bg_economy` (
  `logdate` date NOT NULL COMMENT '记录时间',
  `serverid` int(10) unsigned NOT NULL COMMENT '服务器id',
  `actorid` int(10) unsigned NOT NULL COMMENT '角色id',
  `content` text NOT NULL COMMENT '金额总数',
  UNIQUE KEY `lian` (`actorid`,`serverid`,`logdate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生产消耗统计-按角色';

-- ----------------------------
-- Records of bg_economy
-- ----------------------------
INSERT INTO `bg_economy` VALUES ('2018-11-22', '30001', '0', '[{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5376\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"220\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"128888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"19500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"70664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"70\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"270\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"15000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"15000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"70\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"26900\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"34260\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"13000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"485200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"97776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"187776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"903240\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"18000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5376\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"52576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"15000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"15000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"210\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"210\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"70\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"120\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3461\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"750\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"150\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"257400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"17776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"350\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"28080\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2496\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"110640\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"14040\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"584\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"25900\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2688\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1498\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"14040\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3992\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"222648\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"548060\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"25400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"22000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"79200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"27776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"15000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"39000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"46800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"98280\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"42992\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2688\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"160\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"330\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1750\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"11488\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"70\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"14000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"210\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"120\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"110\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12860\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"18040\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3864\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"890\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"11180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"960\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"79560\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"170\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"590\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1010\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"250\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"280\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"130\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"270\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"70\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"16500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"13552\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"120\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"120\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"711360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"24000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"128880\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5376\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"18000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"110\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3960\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"43864\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12976\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"712360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"24000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"42992\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"120\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9464\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1010\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"170\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"170536\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"229320\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"48440\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"287600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"240\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"53328\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4176\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1580\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"14040\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"47216\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"566780\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"24000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"81656\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5376\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"94528\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"17064\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"16400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"121216\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3560\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"780\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"150\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"25664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200380\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"42992\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"21600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"19960\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"240\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"23688\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10976\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"140\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"690\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"540\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"900\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1050\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7920\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"220\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"130\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"120\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"230\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"935\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"70\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"330\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":n');
INSERT INTO `bg_economy` VALUES ('2018-11-23', '30001', '0', '[{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2688\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"758000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"19500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"248040\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"55640\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"57776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"280\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"540\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"11180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"33000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9860\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"13000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"170536\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"322920\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"19500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5376\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"63064\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"15000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1498\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"117500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6986\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"11664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"239180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"900\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"51480\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"16040\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"17040\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3050\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"38664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"127544\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"472680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"15800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"287600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"81180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"15400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"338460\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5376\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"250\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"110\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"420\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"230\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"150\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"520\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1580\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"960\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1580\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"28080\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"13860\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"57160\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"250\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"14040\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"280\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"160\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"584\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1229\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"250\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"140\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2090\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"370\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"93600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"11000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"140\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"65328\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"252720\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30176\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"25328\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"25280\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"415840\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"24000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"170536\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"23760\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"105000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"900\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"660\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"170536\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"524160\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"13000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"233700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"900\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"16000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"170\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7064\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50328\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"68520\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"24000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"38664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"18888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"11288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3268\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"220\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"110\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"270\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"143400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"11776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"19960\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1480\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"570\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"540\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"140\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2488\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"210\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"150\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"19220\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"81104\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"44900\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"41920\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"440\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"880\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1090\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"14040\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"15000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2688\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"56776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"15000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"210\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1580\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"69992\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"11664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"220\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"18720\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2688\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"15000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"240\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"290\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3080\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"11664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2250\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"31440\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4900\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80880\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2496\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"89820\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"140\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3960\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"16664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"690\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"220\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"14000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"curr');
INSERT INTO `bg_economy` VALUES ('2018-11-24', '30001', '0', '[{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5376\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"115352\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"28888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"19500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"18888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"110\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"14040\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"430\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2496\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1250\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"410\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1830\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"15200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"330\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"235280\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"13000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"19500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5376\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"124528\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"61768\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"15000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"14040\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"13860\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3992\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5940\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"32760\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"13664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"310\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20220\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"14540\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2688\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"16700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2688\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"24000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"57776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"66000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"116320\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5376\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"110\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"70\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3160\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3864\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"18720\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"450\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"52900\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"70\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"15540\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3960\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1580\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"540\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"70\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2688\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"18888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"130\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"250\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"26000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"740\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"860000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9640\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3992\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"14040\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1168\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"190\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2688\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"48300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3960\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3494\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9140\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1330\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2730\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"220\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"650\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"150\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1229\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"110\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"160\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"250\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"985\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"56160\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"250\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"69656\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"38800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"39920\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"230\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"510\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1290\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"120\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"215140\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"88920\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"58500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"25000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"25776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"108800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"13000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"162840\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"16500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"85000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"55000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"658\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"270\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5152\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"330\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"610\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"85\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"118656\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"24000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"81656\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5376\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"108800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"14000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"19200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"29904\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"36704\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"15000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"13552\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4176\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"11664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"630\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"11000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"270\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"18720\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2050\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3950\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1633\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"14000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"18200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"28440\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1498\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"22776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"14500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"39104\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"57600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"150\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"11100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1070\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"150\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"520\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"15000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"210\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2900\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"790\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5990\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"11664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"19960\"}');
INSERT INTO `bg_economy` VALUES ('2018-11-25', '30001', '0', '[{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5376\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"28220\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"131208\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"19500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"70\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"11680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"70\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"14040\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"48120\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"19500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"28080\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"19500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5376\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40440\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1900\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"70\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"970\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3992\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"11180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"52328\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"56160\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"330\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"18720\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"21552\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"18800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"23400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5376\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"24000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"117776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2088\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9860\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"14664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5376\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"750\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"18800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"390\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4740\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"160\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"130\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"290\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"21600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"94880\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"83700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1760\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"15000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1280\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"15000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"540\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9900\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"23400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"42992\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"41440\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"26000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9952\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"129984\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"350660\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"120\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"960\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"11360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"14664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"70\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"140\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"250\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"23400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"150\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"450\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2176\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"160\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"630\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"150\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"630\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"630\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12640\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"131872\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"58800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"18000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"450\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"14664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"215280\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"170536\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2933\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"41552\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5376\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"24000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"19200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3064\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"14800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2488\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2488\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"13552\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"38800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"17552\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"18800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"130\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"242992\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"708\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"139984\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"19664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"18720\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3960\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"21664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3992\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"13300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"150\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1860\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"22664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"25400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"930\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2250\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"330\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"70\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"110\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"150\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"310\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"17552\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"420\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1650\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"230\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"660\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8120\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"280\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4650\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"146872\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"83700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"19960\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"13300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"240\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"70\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"130\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"13900\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"139760\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"29940\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1060\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"k');
INSERT INTO `bg_economy` VALUES ('2018-11-26', '30001', '0', '[{\"currency\":null,\"kingdom\":null,\"amount\":\"5376\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"170\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"21000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"930\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1370\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3960\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5376\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"19200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"58800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"70\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"70\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"390\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"290\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"11000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"56160\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"900\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"190\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"52480\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"25720\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"18776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2688\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"176664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"45800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5376\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"16540\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2688\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"41104\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"270\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"480\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"110\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"150\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"21360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"160\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"70\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"110\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"29328\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"58800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"380\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"610\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"570\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9860\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"130\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4560\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"110\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1280\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"320\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"57776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"14400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5152\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10976\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"140\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"260\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"110\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"36088\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4176\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"150\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"750\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"120\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"900\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"270\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"660\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"750\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"850\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"170\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"140\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"120\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"935\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"150\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"580\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1550\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"24900\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"96760\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"88800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"18000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"29940\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"14460\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3080\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"32760\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"65328\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"24000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30440\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5376\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"28000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3376\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"250\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"18720\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"17552\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"35260\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"13552\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"70\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"25740\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"37440\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"19960\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1230\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"11664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"230\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"520\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"23400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"190\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"110\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2380\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"260\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"330\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"22440\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2160\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1650\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"140\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"250\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"11664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"210\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"230\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3960\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"87984\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"57600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"59880\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"480\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"22780\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1160\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"120\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"950\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1160\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"270\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"740\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"150\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"13000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"14664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"140\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"750\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"910\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"32760\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12900\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"18552\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2790\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"410\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"210\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20960\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"210\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"420\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1990\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"620\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"530\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"120\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3160\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"13000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"620\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"250\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3650\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1350\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"70\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2460\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"11500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"11400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"140\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"110\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5040\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"850\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"920\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5984\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"19980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\"');
INSERT INTO `bg_economy` VALUES ('2018-11-27', '30001', '0', '[{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5376\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1498\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"19500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2688\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"210\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5376\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"17952\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"110\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"150\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"28080\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"900\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"140\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"21360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5376\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"990\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1498\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1580\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"70\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"13700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"85544\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"170\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"57776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"14040\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"140\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"130\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"37440\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1290\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1020\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"110\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"820\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"118320\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3992\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"31580\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"24000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"38664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5376\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2576\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"250\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1550\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"18664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"250\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"15000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"11776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"15000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4050\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"350\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"150\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"160\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"110544\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"270\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2960\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"630\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"141872\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"41104\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"670\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"430\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"120\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"740\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"19776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"560\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"950\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"530\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"11664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"150\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"240\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"900\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"830\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1288\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"11664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"25900\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"11664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"140\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"17440\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"13300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"340\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"8000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"17664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"10980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"74880\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3250\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"43940\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"610\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"541\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1250\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"23960\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3800\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2994\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"260\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"50\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"34900\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9664\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"9980\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1830\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"90\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"6680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"250\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"160\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"16552\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"13300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"850\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"40\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"16180\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"130\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"60\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"485\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"32760\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"5200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1996\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"13300\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3520\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"220\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"12360\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1580\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"80\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"750\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"7776\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"30\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2400\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"690\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"100\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2560\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"410\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"4680\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"250\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"3888\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"2000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1000\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"700\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"20\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"998\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"1500\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"600\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"200\"},{\"currency\":null,\"kingdom\":null,\"amount\":\"250\"}]');

-- ----------------------------
-- Table structure for bg_economy_all
-- ----------------------------
DROP TABLE IF EXISTS `bg_economy_all`;
CREATE TABLE `bg_economy_all` (
  `logdate` date NOT NULL,
  `currency` char(10) NOT NULL COMMENT '类型,yb元宝,xb铜钱,yl银两,by绑定元宝',
  `serverid` int(10) unsigned NOT NULL COMMENT '服务器id',
  `kingdom` varchar(20) NOT NULL COMMENT '消费类型,earning得到,expenditure消耗',
  `amount` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '数量',
  `num` mediumint(8) unsigned NOT NULL COMMENT '参与人数',
  UNIQUE KEY `logdate` (`logdate`,`serverid`,`currency`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生产消耗统计-按服务器';

-- ----------------------------
-- Records of bg_economy_all
-- ----------------------------
INSERT INTO `bg_economy_all` VALUES ('2018-11-22', '', '30001', '', '98000', '14');
INSERT INTO `bg_economy_all` VALUES ('2018-11-23', '', '30001', '', '78000', '12');
INSERT INTO `bg_economy_all` VALUES ('2018-11-24', '', '30001', '', '97000', '11');
INSERT INTO `bg_economy_all` VALUES ('2018-11-25', '', '30001', '', '91000', '13');
INSERT INTO `bg_economy_all` VALUES ('2018-11-26', '', '30001', '', '123000', '18');
INSERT INTO `bg_economy_all` VALUES ('2018-11-27', '', '30001', '', '49000', '6');

-- ----------------------------
-- Table structure for bg_expend_type
-- ----------------------------
DROP TABLE IF EXISTS `bg_expend_type`;
CREATE TABLE `bg_expend_type` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `phylum` char(50) DEFAULT NULL,
  `classfield` char(50) DEFAULT NULL,
  `phylum_name` char(50) DEFAULT NULL,
  `classfield_name` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `phylum` (`phylum`,`classfield`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消费类型';

-- ----------------------------
-- Records of bg_expend_type
-- ----------------------------

-- ----------------------------
-- Table structure for bg_failed_login
-- ----------------------------
DROP TABLE IF EXISTS `bg_failed_login`;
CREATE TABLE `bg_failed_login` (
  `ip` char(15) NOT NULL DEFAULT '' COMMENT 'ip',
  `username` char(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  KEY `ip` (`ip`) USING BTREE,
  KEY `created` (`created`) USING BTREE,
  KEY `ip_created` (`ip`,`created`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户登录失败记录';

-- ----------------------------
-- Records of bg_failed_login
-- ----------------------------
INSERT INTO `bg_failed_login` VALUES ('112.49.254.162', 'admin', '1572786678');
INSERT INTO `bg_failed_login` VALUES ('112.49.254.162', 'admin', '1572786844');
INSERT INTO `bg_failed_login` VALUES ('112.49.254.162', 'admin', '1572787184');
INSERT INTO `bg_failed_login` VALUES ('112.49.254.162', 'admin', '1572787360');
INSERT INTO `bg_failed_login` VALUES ('112.49.254.162', 'admin', '1572859882');
INSERT INTO `bg_failed_login` VALUES ('112.49.254.162', 'admin', '1572859891');
INSERT INTO `bg_failed_login` VALUES ('112.49.254.162', 'admin', '1572859897');
INSERT INTO `bg_failed_login` VALUES ('112.49.254.162', 'admin', '1572859902');
INSERT INTO `bg_failed_login` VALUES ('112.49.191.147', 'admin', '1573121024');
INSERT INTO `bg_failed_login` VALUES ('120.11.216.47', 'admin', '1586000851');
INSERT INTO `bg_failed_login` VALUES ('120.11.216.47', 'admin', '1586000858');
INSERT INTO `bg_failed_login` VALUES ('120.11.216.47', 'admin', '1586000874');
INSERT INTO `bg_failed_login` VALUES ('120.11.216.47', 'admin', '1586000913');
INSERT INTO `bg_failed_login` VALUES ('121.16.98.35', 'admin', '1586921925');
INSERT INTO `bg_failed_login` VALUES ('121.16.98.35', 'admin', '1586921930');
INSERT INTO `bg_failed_login` VALUES ('121.16.98.35', 'admin', '1586921936');
INSERT INTO `bg_failed_login` VALUES ('192.168.1.111', 'admin', '1588231162');
INSERT INTO `bg_failed_login` VALUES ('192.168.1.111', 'admin', '1588231185');
INSERT INTO `bg_failed_login` VALUES ('192.168.1.111', 'admin', '1588231201');

-- ----------------------------
-- Table structure for bg_insider
-- ----------------------------
DROP TABLE IF EXISTS `bg_insider`;
CREATE TABLE `bg_insider` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `gm_level` tinyint(3) unsigned NOT NULL COMMENT 'gm等级',
  `serverid` smallint(6) unsigned NOT NULL,
  `role_name` char(50) DEFAULT NULL COMMENT '角色名',
  `role_id` bigint(20) unsigned DEFAULT NULL COMMENT '角色id',
  `account` char(50) DEFAULT NULL COMMENT '账号',
  `real_name` char(50) DEFAULT NULL COMMENT '真是姓名',
  `position` char(50) DEFAULT NULL COMMENT '职位',
  PRIMARY KEY (`id`),
  UNIQUE KEY `serverid` (`serverid`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内部号';

-- ----------------------------
-- Records of bg_insider
-- ----------------------------

-- ----------------------------
-- Table structure for bg_integrated_data
-- ----------------------------
DROP TABLE IF EXISTS `bg_integrated_data`;
CREATE TABLE `bg_integrated_data` (
  `logdate` date NOT NULL COMMENT '统计日期',
  `serverid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '服务器id',
  `new_reg_num` int(10) unsigned DEFAULT '0' COMMENT '新注册人数',
  `total_reg_num` int(11) unsigned DEFAULT '0' COMMENT '总注册数',
  `new_role_num` int(10) unsigned DEFAULT '0' COMMENT '新创角数',
  `total_role_num` int(11) DEFAULT '0' COMMENT '总角色数',
  `login_num` int(10) unsigned DEFAULT '0' COMMENT '登录人数，用来求新注册付费率',
  UNIQUE KEY `lodate` (`logdate`,`serverid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='综合数据';

-- ----------------------------
-- Records of bg_integrated_data
-- ----------------------------
INSERT INTO `bg_integrated_data` VALUES ('2018-11-22', '30001', '4', '4', '4', '4', '11148');
INSERT INTO `bg_integrated_data` VALUES ('2018-11-23', '30001', '300', '304', '300', '304', '11200');
INSERT INTO `bg_integrated_data` VALUES ('2018-11-24', '30001', '427', '769', '427', '769', '12055');
INSERT INTO `bg_integrated_data` VALUES ('2018-11-25', '30001', '277', '1070', '277', '1070', '12123');
INSERT INTO `bg_integrated_data` VALUES ('2018-11-26', '30001', '340', '1428', '340', '1428', '15065');
INSERT INTO `bg_integrated_data` VALUES ('2018-11-27', '30001', '131', '1577', '131', '1577', '11180');

-- ----------------------------
-- Table structure for bg_items
-- ----------------------------
DROP TABLE IF EXISTS `bg_items`;
CREATE TABLE `bg_items` (
  `item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '物品id',
  `item_name` varchar(128) NOT NULL DEFAULT '' COMMENT '物品名称',
  UNIQUE KEY `item_id` (`item_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物品表';

-- ----------------------------
-- Records of bg_items
-- ----------------------------
INSERT INTO `bg_items` VALUES ('1', '木剑');
INSERT INTO `bg_items` VALUES ('2', '布衣(男)');
INSERT INTO `bg_items` VALUES ('3', '布衣(女)');
INSERT INTO `bg_items` VALUES ('4', '金手镯');
INSERT INTO `bg_items` VALUES ('5', '黑檀手镯');
INSERT INTO `bg_items` VALUES ('6', '道士手镯');
INSERT INTO `bg_items` VALUES ('7', '黑色水晶戒指');
INSERT INTO `bg_items` VALUES ('8', '生铁戒指');
INSERT INTO `bg_items` VALUES ('9', '珍珠戒指');
INSERT INTO `bg_items` VALUES ('10', '测试用刀');
INSERT INTO `bg_items` VALUES ('11', '超级测试用刀');
INSERT INTO `bg_items` VALUES ('12', '轻布衣(男)');
INSERT INTO `bg_items` VALUES ('13', '轻布衣(女)');
INSERT INTO `bg_items` VALUES ('14', '金玉手镯');
INSERT INTO `bg_items` VALUES ('15', '赤樟手镯');
INSERT INTO `bg_items` VALUES ('16', '寒玉手镯');
INSERT INTO `bg_items` VALUES ('17', '白金玉石戒指');
INSERT INTO `bg_items` VALUES ('18', '墓铁戒指');
INSERT INTO `bg_items` VALUES ('19', '玛瑙戒指');
INSERT INTO `bg_items` VALUES ('20', '八荒');
INSERT INTO `bg_items` VALUES ('21', '炼狱');
INSERT INTO `bg_items` VALUES ('22', '轻型盔甲(男)');
INSERT INTO `bg_items` VALUES ('23', '轻型盔甲(女)');
INSERT INTO `bg_items` VALUES ('24', '骷髅头盔');
INSERT INTO `bg_items` VALUES ('25', '蓝翡翠项链');
INSERT INTO `bg_items` VALUES ('26', '死神手套');
INSERT INTO `bg_items` VALUES ('27', '骷髅戒指');
INSERT INTO `bg_items` VALUES ('28', '神铸·天魔神甲(男)');
INSERT INTO `bg_items` VALUES ('29', '神铸·圣战宝甲(女)');
INSERT INTO `bg_items` VALUES ('30', '海魂');
INSERT INTO `bg_items` VALUES ('31', '魔杖');
INSERT INTO `bg_items` VALUES ('32', '留空');
INSERT INTO `bg_items` VALUES ('33', '留空');
INSERT INTO `bg_items` VALUES ('34', '勇士头盔');
INSERT INTO `bg_items` VALUES ('35', '琥珀项链');
INSERT INTO `bg_items` VALUES ('36', '银手镯');
INSERT INTO `bg_items` VALUES ('37', '魅力戒指');
INSERT INTO `bg_items` VALUES ('38', '神铸·法神披风(男)');
INSERT INTO `bg_items` VALUES ('39', '神铸·霓裳羽衣(女)');
INSERT INTO `bg_items` VALUES ('40', '半月');
INSERT INTO `bg_items` VALUES ('41', '银蛇');
INSERT INTO `bg_items` VALUES ('42', '留空');
INSERT INTO `bg_items` VALUES ('43', '留空');
INSERT INTO `bg_items` VALUES ('44', '道士头盔');
INSERT INTO `bg_items` VALUES ('45', '凤凰明珠');
INSERT INTO `bg_items` VALUES ('46', '道力手镯');
INSERT INTO `bg_items` VALUES ('47', '道德戒指');
INSERT INTO `bg_items` VALUES ('48', '神铸·天尊道袍(男)');
INSERT INTO `bg_items` VALUES ('49', '神铸·天尊道衣(女)');
INSERT INTO `bg_items` VALUES ('50', '黑色水晶项链');
INSERT INTO `bg_items` VALUES ('51', '恶灵炼狱');
INSERT INTO `bg_items` VALUES ('52', '中型盔甲(男)');
INSERT INTO `bg_items` VALUES ('53', '中型盔甲(女)');
INSERT INTO `bg_items` VALUES ('54', '恶魔头盔');
INSERT INTO `bg_items` VALUES ('55', '鱼人泪项链');
INSERT INTO `bg_items` VALUES ('56', '炼狱手镯');
INSERT INTO `bg_items` VALUES ('57', '恶魔戒指');
INSERT INTO `bg_items` VALUES ('58', '留空');
INSERT INTO `bg_items` VALUES ('59', '留空');
INSERT INTO `bg_items` VALUES ('60', '黑檀项链');
INSERT INTO `bg_items` VALUES ('61', '深渊魔杖');
INSERT INTO `bg_items` VALUES ('62', '留空');
INSERT INTO `bg_items` VALUES ('63', '留空');
INSERT INTO `bg_items` VALUES ('64', '胜利头盔');
INSERT INTO `bg_items` VALUES ('65', '绿晶项链');
INSERT INTO `bg_items` VALUES ('66', '白银手镯');
INSERT INTO `bg_items` VALUES ('67', '胜利戒指');
INSERT INTO `bg_items` VALUES ('68', '留空');
INSERT INTO `bg_items` VALUES ('69', '留空');
INSERT INTO `bg_items` VALUES ('70', '黄色水晶项链');
INSERT INTO `bg_items` VALUES ('71', '焚寂银蛇');
INSERT INTO `bg_items` VALUES ('72', '留空');
INSERT INTO `bg_items` VALUES ('73', '留空');
INSERT INTO `bg_items` VALUES ('74', '灵引头盔');
INSERT INTO `bg_items` VALUES ('75', '祝融火丹');
INSERT INTO `bg_items` VALUES ('76', '灵引手镯');
INSERT INTO `bg_items` VALUES ('77', '信念戒指');
INSERT INTO `bg_items` VALUES ('78', '留空');
INSERT INTO `bg_items` VALUES ('79', '留空');
INSERT INTO `bg_items` VALUES ('80', '斩马刀');
INSERT INTO `bg_items` VALUES ('81', '裁决之杖');
INSERT INTO `bg_items` VALUES ('82', '重盔甲(男)');
INSERT INTO `bg_items` VALUES ('83', '重盔甲(女)');
INSERT INTO `bg_items` VALUES ('84', '黑铁头盔');
INSERT INTO `bg_items` VALUES ('85', '绿色项链');
INSERT INTO `bg_items` VALUES ('86', '骑士手镯');
INSERT INTO `bg_items` VALUES ('87', '龙之戒指');
INSERT INTO `bg_items` VALUES ('88', '钢铁腰带');
INSERT INTO `bg_items` VALUES ('89', '重型战靴');
INSERT INTO `bg_items` VALUES ('90', '偃月');
INSERT INTO `bg_items` VALUES ('91', '骨玉权杖');
INSERT INTO `bg_items` VALUES ('92', '魔法长袍(男)');
INSERT INTO `bg_items` VALUES ('93', '魔法长袍(女)');
INSERT INTO `bg_items` VALUES ('94', '魔法头盔');
INSERT INTO `bg_items` VALUES ('95', '恶魔铃铛');
INSERT INTO `bg_items` VALUES ('96', '龙之手镯');
INSERT INTO `bg_items` VALUES ('97', '紫碧螺');
INSERT INTO `bg_items` VALUES ('98', '魔力腰带');
INSERT INTO `bg_items` VALUES ('99', '七星魔靴');
INSERT INTO `bg_items` VALUES ('100', '降魔');
INSERT INTO `bg_items` VALUES ('101', '无极棍');
INSERT INTO `bg_items` VALUES ('102', '灵魂战衣(男)');
INSERT INTO `bg_items` VALUES ('103', '灵魂战衣(女)');
INSERT INTO `bg_items` VALUES ('104', '梦幻头盔');
INSERT INTO `bg_items` VALUES ('105', '灵魂项链');
INSERT INTO `bg_items` VALUES ('106', '三眼手镯');
INSERT INTO `bg_items` VALUES ('107', '泰坦戒指');
INSERT INTO `bg_items` VALUES ('108', '飘逸丝带');
INSERT INTO `bg_items` VALUES ('109', '灵魂道靴');
INSERT INTO `bg_items` VALUES ('110', '金珠宝石项链');
INSERT INTO `bg_items` VALUES ('111', '制裁之杖');
INSERT INTO `bg_items` VALUES ('112', '战神盔甲(男)');
INSERT INTO `bg_items` VALUES ('113', '战神盔甲(女)');
INSERT INTO `bg_items` VALUES ('114', '精铁头盔');
INSERT INTO `bg_items` VALUES ('115', '月牙项链');
INSERT INTO `bg_items` VALUES ('116', '战力手镯');
INSERT INTO `bg_items` VALUES ('117', '黄龙之鳞');
INSERT INTO `bg_items` VALUES ('118', '精铁腰带');
INSERT INTO `bg_items` VALUES ('119', '重力战靴');
INSERT INTO `bg_items` VALUES ('120', '赤樟项链');
INSERT INTO `bg_items` VALUES ('121', '骨魔法杖');
INSERT INTO `bg_items` VALUES ('122', '恶魔长袍(男)');
INSERT INTO `bg_items` VALUES ('123', '恶魔长袍(女)');
INSERT INTO `bg_items` VALUES ('124', '赤月头盔');
INSERT INTO `bg_items` VALUES ('125', '幻影铃铛');
INSERT INTO `bg_items` VALUES ('126', '千魔手镯');
INSERT INTO `bg_items` VALUES ('127', '红宝石戒指');
INSERT INTO `bg_items` VALUES ('128', '千魔腰带');
INSERT INTO `bg_items` VALUES ('129', '星斗魔靴');
INSERT INTO `bg_items` VALUES ('130', '绿色翡翠项链');
INSERT INTO `bg_items` VALUES ('131', '无双棍');
INSERT INTO `bg_items` VALUES ('132', '幽灵战衣(男)');
INSERT INTO `bg_items` VALUES ('133', '幽灵战衣(女)');
INSERT INTO `bg_items` VALUES ('134', '泰坦头盔');
INSERT INTO `bg_items` VALUES ('135', '紫玉项链');
INSERT INTO `bg_items` VALUES ('136', '蓝宝石手镯');
INSERT INTO `bg_items` VALUES ('137', '封印戒指');
INSERT INTO `bg_items` VALUES ('138', '银色腰带');
INSERT INTO `bg_items` VALUES ('139', '灵力道靴');
INSERT INTO `bg_items` VALUES ('140', '神铸·屠龙');
INSERT INTO `bg_items` VALUES ('141', '屠龙');
INSERT INTO `bg_items` VALUES ('142', '天魔神甲(男)');
INSERT INTO `bg_items` VALUES ('143', '圣战宝甲(女)');
INSERT INTO `bg_items` VALUES ('144', '圣战头盔');
INSERT INTO `bg_items` VALUES ('145', '圣战项链');
INSERT INTO `bg_items` VALUES ('146', '圣战手镯');
INSERT INTO `bg_items` VALUES ('147', '圣战戒指');
INSERT INTO `bg_items` VALUES ('148', '圣战腰带');
INSERT INTO `bg_items` VALUES ('149', '圣战鞋子');
INSERT INTO `bg_items` VALUES ('150', '神铸·嗜魂法杖');
INSERT INTO `bg_items` VALUES ('151', '嗜魂法杖');
INSERT INTO `bg_items` VALUES ('152', '法神披风(男)');
INSERT INTO `bg_items` VALUES ('153', '霓裳羽衣(女)');
INSERT INTO `bg_items` VALUES ('154', '法神头盔');
INSERT INTO `bg_items` VALUES ('155', '法神项链');
INSERT INTO `bg_items` VALUES ('156', '法神手镯');
INSERT INTO `bg_items` VALUES ('157', '法神戒指');
INSERT INTO `bg_items` VALUES ('158', '法神腰带');
INSERT INTO `bg_items` VALUES ('159', '法神鞋子');
INSERT INTO `bg_items` VALUES ('160', '神铸·龙纹剑');
INSERT INTO `bg_items` VALUES ('161', '龙纹剑');
INSERT INTO `bg_items` VALUES ('162', '天尊道袍(男)');
INSERT INTO `bg_items` VALUES ('163', '天尊道衣(女)');
INSERT INTO `bg_items` VALUES ('164', '天尊头盔');
INSERT INTO `bg_items` VALUES ('165', '天尊项链');
INSERT INTO `bg_items` VALUES ('166', '天尊手镯');
INSERT INTO `bg_items` VALUES ('167', '天尊戒指');
INSERT INTO `bg_items` VALUES ('168', '天尊腰带');
INSERT INTO `bg_items` VALUES ('169', '天尊鞋子');
INSERT INTO `bg_items` VALUES ('170', '祖传·屠龙');
INSERT INTO `bg_items` VALUES ('171', '若风');
INSERT INTO `bg_items` VALUES ('172', '若风神甲(男)');
INSERT INTO `bg_items` VALUES ('173', '若风宝甲(女)');
INSERT INTO `bg_items` VALUES ('174', '若风头盔');
INSERT INTO `bg_items` VALUES ('175', '若风项链');
INSERT INTO `bg_items` VALUES ('176', '若风手镯');
INSERT INTO `bg_items` VALUES ('177', '若风戒指');
INSERT INTO `bg_items` VALUES ('178', '若风腰带');
INSERT INTO `bg_items` VALUES ('179', '若风鞋子');
INSERT INTO `bg_items` VALUES ('180', '祖传·嗜魂法杖');
INSERT INTO `bg_items` VALUES ('181', '焚寂法杖');
INSERT INTO `bg_items` VALUES ('182', '焚寂披风(男)');
INSERT INTO `bg_items` VALUES ('183', '焚寂羽衣(女)');
INSERT INTO `bg_items` VALUES ('184', '焚寂头盔');
INSERT INTO `bg_items` VALUES ('185', '焚寂项链');
INSERT INTO `bg_items` VALUES ('186', '焚寂手镯');
INSERT INTO `bg_items` VALUES ('187', '焚寂戒指');
INSERT INTO `bg_items` VALUES ('188', '焚寂腰带');
INSERT INTO `bg_items` VALUES ('189', '焚寂鞋子');
INSERT INTO `bg_items` VALUES ('190', '祖传·龙纹剑');
INSERT INTO `bg_items` VALUES ('191', '苍麟剑');
INSERT INTO `bg_items` VALUES ('192', '苍麟道袍(男)');
INSERT INTO `bg_items` VALUES ('193', '苍麟道衣(女)');
INSERT INTO `bg_items` VALUES ('194', '苍麟头盔');
INSERT INTO `bg_items` VALUES ('195', '苍麟项链');
INSERT INTO `bg_items` VALUES ('196', '苍麟手镯');
INSERT INTO `bg_items` VALUES ('197', '苍麟戒指');
INSERT INTO `bg_items` VALUES ('198', '苍麟腰带');
INSERT INTO `bg_items` VALUES ('199', '苍麟鞋子');
INSERT INTO `bg_items` VALUES ('200', '永不能动占位留空');
INSERT INTO `bg_items` VALUES ('201', '留空');
INSERT INTO `bg_items` VALUES ('202', '留空');
INSERT INTO `bg_items` VALUES ('203', '留空');
INSERT INTO `bg_items` VALUES ('204', '留空');
INSERT INTO `bg_items` VALUES ('205', '留空');
INSERT INTO `bg_items` VALUES ('206', '留空');
INSERT INTO `bg_items` VALUES ('207', '留空');
INSERT INTO `bg_items` VALUES ('208', '留空');
INSERT INTO `bg_items` VALUES ('209', '留空');
INSERT INTO `bg_items` VALUES ('210', '留空');
INSERT INTO `bg_items` VALUES ('211', '留空');
INSERT INTO `bg_items` VALUES ('212', '留空');
INSERT INTO `bg_items` VALUES ('213', '留空');
INSERT INTO `bg_items` VALUES ('214', '留空');
INSERT INTO `bg_items` VALUES ('215', '留空');
INSERT INTO `bg_items` VALUES ('216', '留空');
INSERT INTO `bg_items` VALUES ('217', '留空');
INSERT INTO `bg_items` VALUES ('218', '留空');
INSERT INTO `bg_items` VALUES ('219', '留空');
INSERT INTO `bg_items` VALUES ('220', '留空');
INSERT INTO `bg_items` VALUES ('221', '留空');
INSERT INTO `bg_items` VALUES ('222', '留空');
INSERT INTO `bg_items` VALUES ('223', '留空');
INSERT INTO `bg_items` VALUES ('224', '留空');
INSERT INTO `bg_items` VALUES ('225', '留空');
INSERT INTO `bg_items` VALUES ('226', '留空');
INSERT INTO `bg_items` VALUES ('227', '留空');
INSERT INTO `bg_items` VALUES ('228', '留空');
INSERT INTO `bg_items` VALUES ('229', '留空');
INSERT INTO `bg_items` VALUES ('230', '真·雷霆');
INSERT INTO `bg_items` VALUES ('231', '雷霆');
INSERT INTO `bg_items` VALUES ('232', '雷霆战甲(男)');
INSERT INTO `bg_items` VALUES ('233', '雷霆战衣(女)');
INSERT INTO `bg_items` VALUES ('234', '雷霆战盔');
INSERT INTO `bg_items` VALUES ('235', '雷霆项链');
INSERT INTO `bg_items` VALUES ('236', '雷霆护腕');
INSERT INTO `bg_items` VALUES ('237', '雷霆战戒');
INSERT INTO `bg_items` VALUES ('238', '雷霆腰带');
INSERT INTO `bg_items` VALUES ('239', '雷霆战靴');
INSERT INTO `bg_items` VALUES ('240', '真·烈焰');
INSERT INTO `bg_items` VALUES ('241', '烈焰');
INSERT INTO `bg_items` VALUES ('242', '烈焰魔袍(男)');
INSERT INTO `bg_items` VALUES ('243', '烈焰法袍(女)');
INSERT INTO `bg_items` VALUES ('244', '烈焰魔盔');
INSERT INTO `bg_items` VALUES ('245', '烈焰项链');
INSERT INTO `bg_items` VALUES ('246', '烈焰护腕');
INSERT INTO `bg_items` VALUES ('247', '烈焰魔戒');
INSERT INTO `bg_items` VALUES ('248', '烈焰腰带');
INSERT INTO `bg_items` VALUES ('249', '烈焰魔靴');
INSERT INTO `bg_items` VALUES ('250', '真·光芒');
INSERT INTO `bg_items` VALUES ('251', '光芒');
INSERT INTO `bg_items` VALUES ('252', '光芒道袍(男)');
INSERT INTO `bg_items` VALUES ('253', '光芒道衣(女)');
INSERT INTO `bg_items` VALUES ('254', '光芒道盔');
INSERT INTO `bg_items` VALUES ('255', '光芒项链');
INSERT INTO `bg_items` VALUES ('256', '光芒护腕');
INSERT INTO `bg_items` VALUES ('257', '光芒道戒');
INSERT INTO `bg_items` VALUES ('258', '光芒腰带');
INSERT INTO `bg_items` VALUES ('259', '光芒道靴');
INSERT INTO `bg_items` VALUES ('260', '留空');
INSERT INTO `bg_items` VALUES ('261', '留空');
INSERT INTO `bg_items` VALUES ('262', '留空');
INSERT INTO `bg_items` VALUES ('263', '留空');
INSERT INTO `bg_items` VALUES ('264', '留空');
INSERT INTO `bg_items` VALUES ('265', '留空');
INSERT INTO `bg_items` VALUES ('266', '留空');
INSERT INTO `bg_items` VALUES ('267', '留空');
INSERT INTO `bg_items` VALUES ('268', '留空');
INSERT INTO `bg_items` VALUES ('269', '留空');
INSERT INTO `bg_items` VALUES ('270', '留空');
INSERT INTO `bg_items` VALUES ('271', '留空');
INSERT INTO `bg_items` VALUES ('272', '留空');
INSERT INTO `bg_items` VALUES ('273', '留空');
INSERT INTO `bg_items` VALUES ('274', '留空');
INSERT INTO `bg_items` VALUES ('275', '留空');
INSERT INTO `bg_items` VALUES ('276', '留空');
INSERT INTO `bg_items` VALUES ('277', '留空');
INSERT INTO `bg_items` VALUES ('278', '留空');
INSERT INTO `bg_items` VALUES ('279', '留空');
INSERT INTO `bg_items` VALUES ('280', '留空');
INSERT INTO `bg_items` VALUES ('281', '留空');
INSERT INTO `bg_items` VALUES ('282', '留空');
INSERT INTO `bg_items` VALUES ('283', '留空');
INSERT INTO `bg_items` VALUES ('284', '留空');
INSERT INTO `bg_items` VALUES ('285', '留空');
INSERT INTO `bg_items` VALUES ('286', '留空');
INSERT INTO `bg_items` VALUES ('287', '留空');
INSERT INTO `bg_items` VALUES ('288', '留空');
INSERT INTO `bg_items` VALUES ('289', '留空');
INSERT INTO `bg_items` VALUES ('290', '真·赤瞳');
INSERT INTO `bg_items` VALUES ('291', '赤瞳');
INSERT INTO `bg_items` VALUES ('292', '赤瞳战甲(男)');
INSERT INTO `bg_items` VALUES ('293', '赤瞳战衣(女)');
INSERT INTO `bg_items` VALUES ('294', '赤瞳战盔');
INSERT INTO `bg_items` VALUES ('295', '赤瞳项链');
INSERT INTO `bg_items` VALUES ('296', '赤瞳护腕');
INSERT INTO `bg_items` VALUES ('297', '赤瞳战戒');
INSERT INTO `bg_items` VALUES ('298', '赤瞳腰带');
INSERT INTO `bg_items` VALUES ('299', '赤瞳战靴');
INSERT INTO `bg_items` VALUES ('300', '真·紫霞');
INSERT INTO `bg_items` VALUES ('301', '紫霞');
INSERT INTO `bg_items` VALUES ('302', '紫霞魔袍(男)');
INSERT INTO `bg_items` VALUES ('303', '紫霞法袍(女)');
INSERT INTO `bg_items` VALUES ('304', '紫霞魔盔');
INSERT INTO `bg_items` VALUES ('305', '紫霞项链');
INSERT INTO `bg_items` VALUES ('306', '紫霞护腕');
INSERT INTO `bg_items` VALUES ('307', '紫霞魔戒');
INSERT INTO `bg_items` VALUES ('308', '紫霞腰带');
INSERT INTO `bg_items` VALUES ('309', '紫霞魔靴');
INSERT INTO `bg_items` VALUES ('310', '真·青澜');
INSERT INTO `bg_items` VALUES ('311', '青澜');
INSERT INTO `bg_items` VALUES ('312', '青澜道袍(男)');
INSERT INTO `bg_items` VALUES ('313', '青澜道衣(女)');
INSERT INTO `bg_items` VALUES ('314', '青澜道盔');
INSERT INTO `bg_items` VALUES ('315', '青澜项链');
INSERT INTO `bg_items` VALUES ('316', '青澜护腕');
INSERT INTO `bg_items` VALUES ('317', '青澜道戒');
INSERT INTO `bg_items` VALUES ('318', '青澜腰带');
INSERT INTO `bg_items` VALUES ('319', '青澜道靴');
INSERT INTO `bg_items` VALUES ('320', '留空');
INSERT INTO `bg_items` VALUES ('321', '神铸·雷霆');
INSERT INTO `bg_items` VALUES ('322', '神铸·雷霆战甲(男)');
INSERT INTO `bg_items` VALUES ('323', '神铸·雷霆战衣(女)');
INSERT INTO `bg_items` VALUES ('324', '神铸·雷霆战盔');
INSERT INTO `bg_items` VALUES ('325', '神铸·雷霆项链');
INSERT INTO `bg_items` VALUES ('326', '神铸·雷霆护腕');
INSERT INTO `bg_items` VALUES ('327', '神铸·雷霆战戒');
INSERT INTO `bg_items` VALUES ('328', '神铸·雷霆腰带');
INSERT INTO `bg_items` VALUES ('329', '神铸·雷霆战靴');
INSERT INTO `bg_items` VALUES ('330', '留空');
INSERT INTO `bg_items` VALUES ('331', '神铸·烈焰');
INSERT INTO `bg_items` VALUES ('332', '神铸·烈焰魔袍(男)');
INSERT INTO `bg_items` VALUES ('333', '神铸·烈焰法袍(女)');
INSERT INTO `bg_items` VALUES ('334', '神铸·烈焰魔盔');
INSERT INTO `bg_items` VALUES ('335', '神铸·烈焰项链');
INSERT INTO `bg_items` VALUES ('336', '神铸·烈焰护腕');
INSERT INTO `bg_items` VALUES ('337', '神铸·烈焰魔戒');
INSERT INTO `bg_items` VALUES ('338', '神铸·烈焰腰带');
INSERT INTO `bg_items` VALUES ('339', '神铸·烈焰魔靴');
INSERT INTO `bg_items` VALUES ('340', '留空');
INSERT INTO `bg_items` VALUES ('341', '神铸·光芒');
INSERT INTO `bg_items` VALUES ('342', '神铸·光芒道袍(男)');
INSERT INTO `bg_items` VALUES ('343', '神铸·光芒道衣(女)');
INSERT INTO `bg_items` VALUES ('344', '神铸·光芒道盔');
INSERT INTO `bg_items` VALUES ('345', '神铸·光芒项链');
INSERT INTO `bg_items` VALUES ('346', '神铸·光芒护腕');
INSERT INTO `bg_items` VALUES ('347', '神铸·光芒道戒');
INSERT INTO `bg_items` VALUES ('348', '神铸·光芒腰带');
INSERT INTO `bg_items` VALUES ('349', '神铸·光芒道靴');
INSERT INTO `bg_items` VALUES ('350', '真·不朽战王');
INSERT INTO `bg_items` VALUES ('351', '不朽战王');
INSERT INTO `bg_items` VALUES ('352', '不朽战王盔甲(男)');
INSERT INTO `bg_items` VALUES ('353', '不朽战王盔甲(女)');
INSERT INTO `bg_items` VALUES ('354', '不朽战王头盔');
INSERT INTO `bg_items` VALUES ('355', '不朽战王项链');
INSERT INTO `bg_items` VALUES ('356', '不朽战王手镯');
INSERT INTO `bg_items` VALUES ('357', '不朽战王戒指');
INSERT INTO `bg_items` VALUES ('358', '不朽战王腰带');
INSERT INTO `bg_items` VALUES ('359', '不朽战王靴子');
INSERT INTO `bg_items` VALUES ('360', '真·血皇圣魔之刃');
INSERT INTO `bg_items` VALUES ('361', '血皇圣魔之刃');
INSERT INTO `bg_items` VALUES ('362', '血皇圣魔魔袍(男)');
INSERT INTO `bg_items` VALUES ('363', '血皇圣魔法袍(女)');
INSERT INTO `bg_items` VALUES ('364', '血皇圣魔头盔');
INSERT INTO `bg_items` VALUES ('365', '血皇圣魔项链');
INSERT INTO `bg_items` VALUES ('366', '血皇圣魔手镯');
INSERT INTO `bg_items` VALUES ('367', '血皇圣魔戒指');
INSERT INTO `bg_items` VALUES ('368', '血皇圣魔腰带');
INSERT INTO `bg_items` VALUES ('369', '血皇圣魔靴子');
INSERT INTO `bg_items` VALUES ('370', '真·三清镇魂扇');
INSERT INTO `bg_items` VALUES ('371', '三清镇魂扇');
INSERT INTO `bg_items` VALUES ('372', '三清镇魂道袍(男)');
INSERT INTO `bg_items` VALUES ('373', '三清镇魂道衣(女)');
INSERT INTO `bg_items` VALUES ('374', '三清镇魂头盔');
INSERT INTO `bg_items` VALUES ('375', '三清镇魂项链');
INSERT INTO `bg_items` VALUES ('376', '三清镇魂手镯');
INSERT INTO `bg_items` VALUES ('377', '三清镇魂戒指');
INSERT INTO `bg_items` VALUES ('378', '三清镇魂腰带');
INSERT INTO `bg_items` VALUES ('379', '三清镇魂靴子');
INSERT INTO `bg_items` VALUES ('380', '留空');
INSERT INTO `bg_items` VALUES ('381', '至尊神剑');
INSERT INTO `bg_items` VALUES ('382', '至尊神甲(男)');
INSERT INTO `bg_items` VALUES ('383', '至尊神甲(女)');
INSERT INTO `bg_items` VALUES ('384', '至尊神盔');
INSERT INTO `bg_items` VALUES ('385', '至尊神链');
INSERT INTO `bg_items` VALUES ('386', '至尊神镯');
INSERT INTO `bg_items` VALUES ('387', '至尊神戒');
INSERT INTO `bg_items` VALUES ('388', '至尊神带');
INSERT INTO `bg_items` VALUES ('389', '至尊神靴');
INSERT INTO `bg_items` VALUES ('390', '留空');
INSERT INTO `bg_items` VALUES ('391', '留空');
INSERT INTO `bg_items` VALUES ('392', '留空');
INSERT INTO `bg_items` VALUES ('393', '留空');
INSERT INTO `bg_items` VALUES ('394', '留空');
INSERT INTO `bg_items` VALUES ('395', '留空');
INSERT INTO `bg_items` VALUES ('396', '留空');
INSERT INTO `bg_items` VALUES ('397', '留空');
INSERT INTO `bg_items` VALUES ('398', '留空');
INSERT INTO `bg_items` VALUES ('399', '留空');
INSERT INTO `bg_items` VALUES ('400', '留空');
INSERT INTO `bg_items` VALUES ('401', '留空');
INSERT INTO `bg_items` VALUES ('402', '留空');
INSERT INTO `bg_items` VALUES ('403', '留空');
INSERT INTO `bg_items` VALUES ('404', '留空');
INSERT INTO `bg_items` VALUES ('405', '留空');
INSERT INTO `bg_items` VALUES ('406', '留空');
INSERT INTO `bg_items` VALUES ('407', '留空');
INSERT INTO `bg_items` VALUES ('408', '留空');
INSERT INTO `bg_items` VALUES ('409', '留空');
INSERT INTO `bg_items` VALUES ('410', '真·破邪狂岚');
INSERT INTO `bg_items` VALUES ('411', '破邪狂岚');
INSERT INTO `bg_items` VALUES ('412', '破邪狂岚盔甲(男)');
INSERT INTO `bg_items` VALUES ('413', '破邪狂岚盔甲(女)');
INSERT INTO `bg_items` VALUES ('414', '破邪狂岚头盔');
INSERT INTO `bg_items` VALUES ('415', '破邪狂岚项链');
INSERT INTO `bg_items` VALUES ('416', '破邪狂岚手镯');
INSERT INTO `bg_items` VALUES ('417', '破邪狂岚戒指');
INSERT INTO `bg_items` VALUES ('418', '破邪狂岚腰带');
INSERT INTO `bg_items` VALUES ('419', '破邪狂岚靴子');
INSERT INTO `bg_items` VALUES ('420', '真·极寒灭妄');
INSERT INTO `bg_items` VALUES ('421', '极寒灭妄');
INSERT INTO `bg_items` VALUES ('422', '极寒灭妄魔袍(男)');
INSERT INTO `bg_items` VALUES ('423', '极寒灭妄法袍(女)');
INSERT INTO `bg_items` VALUES ('424', '极寒灭妄头盔');
INSERT INTO `bg_items` VALUES ('425', '极寒灭妄项链');
INSERT INTO `bg_items` VALUES ('426', '极寒灭妄手镯');
INSERT INTO `bg_items` VALUES ('427', '极寒灭妄戒指');
INSERT INTO `bg_items` VALUES ('428', '极寒灭妄腰带');
INSERT INTO `bg_items` VALUES ('429', '极寒灭妄靴子');
INSERT INTO `bg_items` VALUES ('430', '真·玉鼎苍穹');
INSERT INTO `bg_items` VALUES ('431', '玉鼎苍穹');
INSERT INTO `bg_items` VALUES ('432', '玉鼎苍穹道袍(男)');
INSERT INTO `bg_items` VALUES ('433', '玉鼎苍穹道衣(女)');
INSERT INTO `bg_items` VALUES ('434', '玉鼎苍穹头盔');
INSERT INTO `bg_items` VALUES ('435', '玉鼎苍穹项链');
INSERT INTO `bg_items` VALUES ('436', '玉鼎苍穹手镯');
INSERT INTO `bg_items` VALUES ('437', '玉鼎苍穹戒指');
INSERT INTO `bg_items` VALUES ('438', '玉鼎苍穹腰带');
INSERT INTO `bg_items` VALUES ('439', '玉鼎苍穹靴子');
INSERT INTO `bg_items` VALUES ('440', '留空');
INSERT INTO `bg_items` VALUES ('441', '神铸·不朽战王');
INSERT INTO `bg_items` VALUES ('442', '神铸·不朽战王盔甲(男)');
INSERT INTO `bg_items` VALUES ('443', '神铸·不朽战王盔甲(女)');
INSERT INTO `bg_items` VALUES ('444', '神铸·不朽战王头盔');
INSERT INTO `bg_items` VALUES ('445', '神铸·不朽战王项链');
INSERT INTO `bg_items` VALUES ('446', '神铸·不朽战王手镯');
INSERT INTO `bg_items` VALUES ('447', '神铸·不朽战王戒指');
INSERT INTO `bg_items` VALUES ('448', '神铸·不朽战王腰带');
INSERT INTO `bg_items` VALUES ('449', '神铸·不朽战王靴子');
INSERT INTO `bg_items` VALUES ('450', '留空');
INSERT INTO `bg_items` VALUES ('451', '神铸·血皇圣魔之刃');
INSERT INTO `bg_items` VALUES ('452', '神铸·血皇圣魔魔袍(男)');
INSERT INTO `bg_items` VALUES ('453', '神铸·血皇圣魔法袍(女)');
INSERT INTO `bg_items` VALUES ('454', '神铸·血皇圣魔头盔');
INSERT INTO `bg_items` VALUES ('455', '神铸·血皇圣魔项链');
INSERT INTO `bg_items` VALUES ('456', '神铸·血皇圣魔手镯');
INSERT INTO `bg_items` VALUES ('457', '神铸·血皇圣魔戒指');
INSERT INTO `bg_items` VALUES ('458', '神铸·血皇圣魔腰带');
INSERT INTO `bg_items` VALUES ('459', '神铸·血皇圣魔靴子');
INSERT INTO `bg_items` VALUES ('460', '留空');
INSERT INTO `bg_items` VALUES ('461', '神铸·三清镇魂扇');
INSERT INTO `bg_items` VALUES ('462', '神铸·三清镇魂道袍(男)');
INSERT INTO `bg_items` VALUES ('463', '神铸·三清镇魂道衣(女)');
INSERT INTO `bg_items` VALUES ('464', '神铸·三清镇魂头盔');
INSERT INTO `bg_items` VALUES ('465', '神铸·三清镇魂项链');
INSERT INTO `bg_items` VALUES ('466', '神铸·三清镇魂手镯');
INSERT INTO `bg_items` VALUES ('467', '神铸·三清镇魂戒指');
INSERT INTO `bg_items` VALUES ('468', '神铸·三清镇魂腰带');
INSERT INTO `bg_items` VALUES ('469', '神铸·三清镇魂靴子');
INSERT INTO `bg_items` VALUES ('470', '真·焚天狂雷');
INSERT INTO `bg_items` VALUES ('471', '焚天狂雷');
INSERT INTO `bg_items` VALUES ('472', '焚天狂雷战甲(男)');
INSERT INTO `bg_items` VALUES ('473', '焚天狂雷战衣(女)');
INSERT INTO `bg_items` VALUES ('474', '焚天狂雷战盔');
INSERT INTO `bg_items` VALUES ('475', '焚天狂雷项链');
INSERT INTO `bg_items` VALUES ('476', '焚天狂雷护腕');
INSERT INTO `bg_items` VALUES ('477', '焚天狂雷战戒');
INSERT INTO `bg_items` VALUES ('478', '焚天狂雷腰带');
INSERT INTO `bg_items` VALUES ('479', '焚天狂雷战靴');
INSERT INTO `bg_items` VALUES ('480', '真·焚城逆火');
INSERT INTO `bg_items` VALUES ('481', '焚城逆火');
INSERT INTO `bg_items` VALUES ('482', '焚城逆火魔袍(男)');
INSERT INTO `bg_items` VALUES ('483', '焚城逆火法袍(女)');
INSERT INTO `bg_items` VALUES ('484', '焚城逆火魔盔');
INSERT INTO `bg_items` VALUES ('485', '焚城逆火项链');
INSERT INTO `bg_items` VALUES ('486', '焚城逆火护腕');
INSERT INTO `bg_items` VALUES ('487', '焚城逆火魔戒');
INSERT INTO `bg_items` VALUES ('488', '焚城逆火腰带');
INSERT INTO `bg_items` VALUES ('489', '焚城逆火魔靴');
INSERT INTO `bg_items` VALUES ('490', '真·赤炎通云');
INSERT INTO `bg_items` VALUES ('491', '赤炎通云');
INSERT INTO `bg_items` VALUES ('492', '赤炎通云道袍(男)');
INSERT INTO `bg_items` VALUES ('493', '赤炎通云道衣(女)');
INSERT INTO `bg_items` VALUES ('494', '赤炎通云道盔');
INSERT INTO `bg_items` VALUES ('495', '赤炎通云项链');
INSERT INTO `bg_items` VALUES ('496', '赤炎通云护腕');
INSERT INTO `bg_items` VALUES ('497', '赤炎通云戒指');
INSERT INTO `bg_items` VALUES ('498', '赤炎通云腰带');
INSERT INTO `bg_items` VALUES ('499', '赤炎通云道靴');
INSERT INTO `bg_items` VALUES ('500', '留空');
INSERT INTO `bg_items` VALUES ('501', '天·至尊神剑');
INSERT INTO `bg_items` VALUES ('502', '天·至尊神甲(男)');
INSERT INTO `bg_items` VALUES ('503', '天·至尊神甲(女)');
INSERT INTO `bg_items` VALUES ('504', '天·至尊神盔');
INSERT INTO `bg_items` VALUES ('505', '天·至尊神链');
INSERT INTO `bg_items` VALUES ('506', '天·至尊神镯');
INSERT INTO `bg_items` VALUES ('507', '天·至尊神戒');
INSERT INTO `bg_items` VALUES ('508', '天·至尊神带');
INSERT INTO `bg_items` VALUES ('509', '天·至尊神靴');
INSERT INTO `bg_items` VALUES ('510', '留空');
INSERT INTO `bg_items` VALUES ('511', '留空');
INSERT INTO `bg_items` VALUES ('512', '留空');
INSERT INTO `bg_items` VALUES ('513', '留空');
INSERT INTO `bg_items` VALUES ('514', '留空');
INSERT INTO `bg_items` VALUES ('515', '留空');
INSERT INTO `bg_items` VALUES ('516', '留空');
INSERT INTO `bg_items` VALUES ('517', '留空');
INSERT INTO `bg_items` VALUES ('518', '留空');
INSERT INTO `bg_items` VALUES ('519', '留空');
INSERT INTO `bg_items` VALUES ('520', '留空');
INSERT INTO `bg_items` VALUES ('521', '留空');
INSERT INTO `bg_items` VALUES ('522', '留空');
INSERT INTO `bg_items` VALUES ('523', '留空');
INSERT INTO `bg_items` VALUES ('524', '留空');
INSERT INTO `bg_items` VALUES ('525', '留空');
INSERT INTO `bg_items` VALUES ('526', '留空');
INSERT INTO `bg_items` VALUES ('527', '留空');
INSERT INTO `bg_items` VALUES ('528', '留空');
INSERT INTO `bg_items` VALUES ('529', '留空');
INSERT INTO `bg_items` VALUES ('530', '真·不灭奔雷');
INSERT INTO `bg_items` VALUES ('531', '不灭奔雷');
INSERT INTO `bg_items` VALUES ('532', '不灭奔雷战甲(男)');
INSERT INTO `bg_items` VALUES ('533', '不灭奔雷战衣(女)');
INSERT INTO `bg_items` VALUES ('534', '不灭奔雷战盔');
INSERT INTO `bg_items` VALUES ('535', '不灭奔雷项链');
INSERT INTO `bg_items` VALUES ('536', '不灭奔雷护腕');
INSERT INTO `bg_items` VALUES ('537', '不灭奔雷战戒');
INSERT INTO `bg_items` VALUES ('538', '不灭奔雷腰带');
INSERT INTO `bg_items` VALUES ('539', '不灭奔雷战靴');
INSERT INTO `bg_items` VALUES ('540', '真·长虹炼火');
INSERT INTO `bg_items` VALUES ('541', '长虹炼火');
INSERT INTO `bg_items` VALUES ('542', '长虹炼火魔袍(男)');
INSERT INTO `bg_items` VALUES ('543', '长虹炼火法袍(女)');
INSERT INTO `bg_items` VALUES ('544', '长虹炼火魔盔');
INSERT INTO `bg_items` VALUES ('545', '长虹炼火项链');
INSERT INTO `bg_items` VALUES ('546', '长虹炼火护腕');
INSERT INTO `bg_items` VALUES ('547', '长虹炼火魔戒');
INSERT INTO `bg_items` VALUES ('548', '长虹炼火腰带');
INSERT INTO `bg_items` VALUES ('549', '长虹炼火魔靴');
INSERT INTO `bg_items` VALUES ('550', '真·七星流云');
INSERT INTO `bg_items` VALUES ('551', '七星流云');
INSERT INTO `bg_items` VALUES ('552', '七星流云道袍(男)');
INSERT INTO `bg_items` VALUES ('553', '七星流云道衣(女)');
INSERT INTO `bg_items` VALUES ('554', '七星流云道盔');
INSERT INTO `bg_items` VALUES ('555', '七星流云项链');
INSERT INTO `bg_items` VALUES ('556', '七星流云护腕');
INSERT INTO `bg_items` VALUES ('557', '七星流云戒指');
INSERT INTO `bg_items` VALUES ('558', '七星流云腰带');
INSERT INTO `bg_items` VALUES ('559', '七星流云道靴');
INSERT INTO `bg_items` VALUES ('560', '留空');
INSERT INTO `bg_items` VALUES ('561', '神铸·焚天狂雷');
INSERT INTO `bg_items` VALUES ('562', '神铸·焚天狂雷战甲(男)');
INSERT INTO `bg_items` VALUES ('563', '神铸·焚天狂雷战衣(女)');
INSERT INTO `bg_items` VALUES ('564', '神铸·焚天狂雷战盔');
INSERT INTO `bg_items` VALUES ('565', '神铸·焚天狂雷项链');
INSERT INTO `bg_items` VALUES ('566', '神铸·焚天狂雷护腕');
INSERT INTO `bg_items` VALUES ('567', '神铸·焚天狂雷战戒');
INSERT INTO `bg_items` VALUES ('568', '神铸·焚天狂雷腰带');
INSERT INTO `bg_items` VALUES ('569', '神铸·焚天狂雷战靴');
INSERT INTO `bg_items` VALUES ('570', '留空');
INSERT INTO `bg_items` VALUES ('571', '神铸·焚城逆火');
INSERT INTO `bg_items` VALUES ('572', '神铸·焚城逆火魔袍(男)');
INSERT INTO `bg_items` VALUES ('573', '神铸·焚城逆火法袍(女)');
INSERT INTO `bg_items` VALUES ('574', '神铸·焚城逆火魔盔');
INSERT INTO `bg_items` VALUES ('575', '神铸·焚城逆火项链');
INSERT INTO `bg_items` VALUES ('576', '神铸·焚城逆火护腕');
INSERT INTO `bg_items` VALUES ('577', '神铸·焚城逆火魔戒');
INSERT INTO `bg_items` VALUES ('578', '神铸·焚城逆火腰带');
INSERT INTO `bg_items` VALUES ('579', '神铸·焚城逆火魔靴');
INSERT INTO `bg_items` VALUES ('580', '留空');
INSERT INTO `bg_items` VALUES ('581', '神铸·赤炎通云');
INSERT INTO `bg_items` VALUES ('582', '神铸·赤炎通云道袍(男)');
INSERT INTO `bg_items` VALUES ('583', '神铸·赤炎通云道衣(女)');
INSERT INTO `bg_items` VALUES ('584', '神铸·赤炎通云道盔');
INSERT INTO `bg_items` VALUES ('585', '神铸·赤炎通云项链');
INSERT INTO `bg_items` VALUES ('586', '神铸·赤炎通云护腕');
INSERT INTO `bg_items` VALUES ('587', '神铸·赤炎通云戒指');
INSERT INTO `bg_items` VALUES ('588', '神铸·赤炎通云腰带');
INSERT INTO `bg_items` VALUES ('589', '神铸·赤炎通云道靴');
INSERT INTO `bg_items` VALUES ('590', '真·无极炎龙');
INSERT INTO `bg_items` VALUES ('591', '无极炎龙');
INSERT INTO `bg_items` VALUES ('592', '无极炎龙战甲(男)');
INSERT INTO `bg_items` VALUES ('593', '无极炎龙战衣(女)');
INSERT INTO `bg_items` VALUES ('594', '无极炎龙战盔');
INSERT INTO `bg_items` VALUES ('595', '无极炎龙项链');
INSERT INTO `bg_items` VALUES ('596', '无极炎龙护腕');
INSERT INTO `bg_items` VALUES ('597', '无极炎龙战戒');
INSERT INTO `bg_items` VALUES ('598', '无极炎龙腰带');
INSERT INTO `bg_items` VALUES ('599', '无极炎龙战靴');
INSERT INTO `bg_items` VALUES ('600', '真·无相玄冰');
INSERT INTO `bg_items` VALUES ('601', '无相玄冰');
INSERT INTO `bg_items` VALUES ('602', '无相玄冰魔袍(男)');
INSERT INTO `bg_items` VALUES ('603', '无相玄冰法袍(女)');
INSERT INTO `bg_items` VALUES ('604', '无相玄冰魔盔');
INSERT INTO `bg_items` VALUES ('605', '无相玄冰项链');
INSERT INTO `bg_items` VALUES ('606', '无相玄冰护腕');
INSERT INTO `bg_items` VALUES ('607', '无相玄冰魔戒');
INSERT INTO `bg_items` VALUES ('608', '无相玄冰腰带');
INSERT INTO `bg_items` VALUES ('609', '无相玄冰魔靴');
INSERT INTO `bg_items` VALUES ('610', '真·金羽风神');
INSERT INTO `bg_items` VALUES ('611', '金羽风神');
INSERT INTO `bg_items` VALUES ('612', '金羽风神道袍(男)');
INSERT INTO `bg_items` VALUES ('613', '金羽风神道衣(女)');
INSERT INTO `bg_items` VALUES ('614', '金羽风神道盔');
INSERT INTO `bg_items` VALUES ('615', '金羽风神项链');
INSERT INTO `bg_items` VALUES ('616', '金羽风神护腕');
INSERT INTO `bg_items` VALUES ('617', '金羽风神道戒');
INSERT INTO `bg_items` VALUES ('618', '金羽风神腰带');
INSERT INTO `bg_items` VALUES ('619', '金羽风神道靴');
INSERT INTO `bg_items` VALUES ('620', '留空');
INSERT INTO `bg_items` VALUES ('621', '地·至尊神剑');
INSERT INTO `bg_items` VALUES ('622', '地·至尊神甲(男)');
INSERT INTO `bg_items` VALUES ('623', '地·至尊神甲(女)');
INSERT INTO `bg_items` VALUES ('624', '地·至尊神盔');
INSERT INTO `bg_items` VALUES ('625', '地·至尊神链');
INSERT INTO `bg_items` VALUES ('626', '地·至尊神镯');
INSERT INTO `bg_items` VALUES ('627', '地·至尊神戒');
INSERT INTO `bg_items` VALUES ('628', '地·至尊神带');
INSERT INTO `bg_items` VALUES ('629', '地·至尊神靴');
INSERT INTO `bg_items` VALUES ('630', '留空');
INSERT INTO `bg_items` VALUES ('631', '留空');
INSERT INTO `bg_items` VALUES ('632', '留空');
INSERT INTO `bg_items` VALUES ('633', '留空');
INSERT INTO `bg_items` VALUES ('634', '留空');
INSERT INTO `bg_items` VALUES ('635', '留空');
INSERT INTO `bg_items` VALUES ('636', '留空');
INSERT INTO `bg_items` VALUES ('637', '留空');
INSERT INTO `bg_items` VALUES ('638', '留空');
INSERT INTO `bg_items` VALUES ('639', '留空');
INSERT INTO `bg_items` VALUES ('640', '留空');
INSERT INTO `bg_items` VALUES ('641', '留空');
INSERT INTO `bg_items` VALUES ('642', '留空');
INSERT INTO `bg_items` VALUES ('643', '留空');
INSERT INTO `bg_items` VALUES ('644', '留空');
INSERT INTO `bg_items` VALUES ('645', '留空');
INSERT INTO `bg_items` VALUES ('646', '留空');
INSERT INTO `bg_items` VALUES ('647', '留空');
INSERT INTO `bg_items` VALUES ('648', '留空');
INSERT INTO `bg_items` VALUES ('649', '留空');
INSERT INTO `bg_items` VALUES ('650', '真·不败修罗');
INSERT INTO `bg_items` VALUES ('651', '不败修罗');
INSERT INTO `bg_items` VALUES ('652', '不败修罗战甲(男)');
INSERT INTO `bg_items` VALUES ('653', '不败修罗战衣(女)');
INSERT INTO `bg_items` VALUES ('654', '不败修罗战盔');
INSERT INTO `bg_items` VALUES ('655', '不败修罗项链');
INSERT INTO `bg_items` VALUES ('656', '不败修罗护腕');
INSERT INTO `bg_items` VALUES ('657', '不败修罗战戒');
INSERT INTO `bg_items` VALUES ('658', '不败修罗腰带');
INSERT INTO `bg_items` VALUES ('659', '不败修罗战靴');
INSERT INTO `bg_items` VALUES ('660', '真·不败罗刹');
INSERT INTO `bg_items` VALUES ('661', '不败罗刹');
INSERT INTO `bg_items` VALUES ('662', '不败罗刹魔袍(男)');
INSERT INTO `bg_items` VALUES ('663', '不败罗刹法袍(女)');
INSERT INTO `bg_items` VALUES ('664', '不败罗刹魔盔');
INSERT INTO `bg_items` VALUES ('665', '不败罗刹项链');
INSERT INTO `bg_items` VALUES ('666', '不败罗刹护腕');
INSERT INTO `bg_items` VALUES ('667', '不败罗刹魔戒');
INSERT INTO `bg_items` VALUES ('668', '不败罗刹腰带');
INSERT INTO `bg_items` VALUES ('669', '不败罗刹魔靴');
INSERT INTO `bg_items` VALUES ('670', '真·不败夜叉');
INSERT INTO `bg_items` VALUES ('671', '不败夜叉');
INSERT INTO `bg_items` VALUES ('672', '不败夜叉道袍(男)');
INSERT INTO `bg_items` VALUES ('673', '不败夜叉道衣(女)');
INSERT INTO `bg_items` VALUES ('674', '不败夜叉道盔');
INSERT INTO `bg_items` VALUES ('675', '不败夜叉项链');
INSERT INTO `bg_items` VALUES ('676', '不败夜叉护腕');
INSERT INTO `bg_items` VALUES ('677', '不败夜叉道戒');
INSERT INTO `bg_items` VALUES ('678', '不败夜叉腰带');
INSERT INTO `bg_items` VALUES ('679', '不败夜叉道靴');
INSERT INTO `bg_items` VALUES ('680', '留空');
INSERT INTO `bg_items` VALUES ('681', '神铸·无极炎龙');
INSERT INTO `bg_items` VALUES ('682', '神铸·无极炎龙战甲(男)');
INSERT INTO `bg_items` VALUES ('683', '神铸·无极炎龙战衣(女)');
INSERT INTO `bg_items` VALUES ('684', '神铸·无极炎龙战盔');
INSERT INTO `bg_items` VALUES ('685', '神铸·无极炎龙项链');
INSERT INTO `bg_items` VALUES ('686', '神铸·无极炎龙护腕');
INSERT INTO `bg_items` VALUES ('687', '神铸·无极炎龙战戒');
INSERT INTO `bg_items` VALUES ('688', '神铸·无极炎龙腰带');
INSERT INTO `bg_items` VALUES ('689', '神铸·无极炎龙战靴');
INSERT INTO `bg_items` VALUES ('690', '留空');
INSERT INTO `bg_items` VALUES ('691', '神铸·无相玄冰');
INSERT INTO `bg_items` VALUES ('692', '神铸·无相玄冰魔袍(男)');
INSERT INTO `bg_items` VALUES ('693', '神铸·无相玄冰法袍(女)');
INSERT INTO `bg_items` VALUES ('694', '神铸·无相玄冰魔盔');
INSERT INTO `bg_items` VALUES ('695', '神铸·无相玄冰项链');
INSERT INTO `bg_items` VALUES ('696', '神铸·无相玄冰护腕');
INSERT INTO `bg_items` VALUES ('697', '神铸·无相玄冰魔戒');
INSERT INTO `bg_items` VALUES ('698', '神铸·无相玄冰腰带');
INSERT INTO `bg_items` VALUES ('699', '神铸·无相玄冰魔靴');
INSERT INTO `bg_items` VALUES ('700', '留空');
INSERT INTO `bg_items` VALUES ('701', '神铸·金羽风神');
INSERT INTO `bg_items` VALUES ('702', '神铸·金羽风神道袍(男)');
INSERT INTO `bg_items` VALUES ('703', '神铸·金羽风神道衣(女)');
INSERT INTO `bg_items` VALUES ('704', '神铸·金羽风神道盔');
INSERT INTO `bg_items` VALUES ('705', '神铸·金羽风神项链');
INSERT INTO `bg_items` VALUES ('706', '神铸·金羽风神护腕');
INSERT INTO `bg_items` VALUES ('707', '神铸·金羽风神道戒');
INSERT INTO `bg_items` VALUES ('708', '神铸·金羽风神腰带');
INSERT INTO `bg_items` VALUES ('709', '神铸·金羽风神道靴');
INSERT INTO `bg_items` VALUES ('710', '真·无量破山');
INSERT INTO `bg_items` VALUES ('711', '无量破山');
INSERT INTO `bg_items` VALUES ('712', '无量破山战甲(男)');
INSERT INTO `bg_items` VALUES ('713', '无量破山战衣(女)');
INSERT INTO `bg_items` VALUES ('714', '无量破山战盔');
INSERT INTO `bg_items` VALUES ('715', '无量破山项链');
INSERT INTO `bg_items` VALUES ('716', '无量破山护腕');
INSERT INTO `bg_items` VALUES ('717', '无量破山战戒');
INSERT INTO `bg_items` VALUES ('718', '无量破山腰带');
INSERT INTO `bg_items` VALUES ('719', '无量破山战靴');
INSERT INTO `bg_items` VALUES ('720', '真·六合混沌');
INSERT INTO `bg_items` VALUES ('721', '六合混沌');
INSERT INTO `bg_items` VALUES ('722', '六合混沌魔袍(男)');
INSERT INTO `bg_items` VALUES ('723', '六合混沌法袍(女)');
INSERT INTO `bg_items` VALUES ('724', '六合混沌魔盔');
INSERT INTO `bg_items` VALUES ('725', '六合混沌项链');
INSERT INTO `bg_items` VALUES ('726', '六合混沌护腕');
INSERT INTO `bg_items` VALUES ('727', '六合混沌魔戒');
INSERT INTO `bg_items` VALUES ('728', '六合混沌腰带');
INSERT INTO `bg_items` VALUES ('729', '六合混沌魔靴');
INSERT INTO `bg_items` VALUES ('730', '真·八荒虚空');
INSERT INTO `bg_items` VALUES ('731', '八荒虚空');
INSERT INTO `bg_items` VALUES ('732', '八荒虚空道袍(男)');
INSERT INTO `bg_items` VALUES ('733', '八荒虚空道衣(女)');
INSERT INTO `bg_items` VALUES ('734', '八荒虚空道盔');
INSERT INTO `bg_items` VALUES ('735', '八荒虚空项链');
INSERT INTO `bg_items` VALUES ('736', '八荒虚空护腕');
INSERT INTO `bg_items` VALUES ('737', '八荒虚空道戒');
INSERT INTO `bg_items` VALUES ('738', '八荒虚空腰带');
INSERT INTO `bg_items` VALUES ('739', '八荒虚空道靴');
INSERT INTO `bg_items` VALUES ('740', '留空');
INSERT INTO `bg_items` VALUES ('741', '玄·至尊神剑');
INSERT INTO `bg_items` VALUES ('742', '玄·至尊神甲(男)');
INSERT INTO `bg_items` VALUES ('743', '玄·至尊神甲(女)');
INSERT INTO `bg_items` VALUES ('744', '玄·至尊神盔');
INSERT INTO `bg_items` VALUES ('745', '玄·至尊神链');
INSERT INTO `bg_items` VALUES ('746', '玄·至尊神镯');
INSERT INTO `bg_items` VALUES ('747', '玄·至尊神戒');
INSERT INTO `bg_items` VALUES ('748', '玄·至尊神带');
INSERT INTO `bg_items` VALUES ('749', '玄·至尊神靴');
INSERT INTO `bg_items` VALUES ('750', '留空');
INSERT INTO `bg_items` VALUES ('751', '留空');
INSERT INTO `bg_items` VALUES ('752', '留空');
INSERT INTO `bg_items` VALUES ('753', '留空');
INSERT INTO `bg_items` VALUES ('754', '留空');
INSERT INTO `bg_items` VALUES ('755', '留空');
INSERT INTO `bg_items` VALUES ('756', '留空');
INSERT INTO `bg_items` VALUES ('757', '留空');
INSERT INTO `bg_items` VALUES ('758', '留空');
INSERT INTO `bg_items` VALUES ('759', '留空');
INSERT INTO `bg_items` VALUES ('760', '留空');
INSERT INTO `bg_items` VALUES ('761', '留空');
INSERT INTO `bg_items` VALUES ('762', '留空');
INSERT INTO `bg_items` VALUES ('763', '留空');
INSERT INTO `bg_items` VALUES ('764', '留空');
INSERT INTO `bg_items` VALUES ('765', '留空');
INSERT INTO `bg_items` VALUES ('766', '留空');
INSERT INTO `bg_items` VALUES ('767', '留空');
INSERT INTO `bg_items` VALUES ('768', '留空');
INSERT INTO `bg_items` VALUES ('769', '留空');
INSERT INTO `bg_items` VALUES ('770', '真·九幽乱武');
INSERT INTO `bg_items` VALUES ('771', '九幽乱武');
INSERT INTO `bg_items` VALUES ('772', '九幽乱武战甲(男)');
INSERT INTO `bg_items` VALUES ('773', '九幽乱武战衣(女)');
INSERT INTO `bg_items` VALUES ('774', '九幽乱武战盔');
INSERT INTO `bg_items` VALUES ('775', '九幽乱武项链');
INSERT INTO `bg_items` VALUES ('776', '九幽乱武护腕');
INSERT INTO `bg_items` VALUES ('777', '九幽乱武战戒');
INSERT INTO `bg_items` VALUES ('778', '九幽乱武腰带');
INSERT INTO `bg_items` VALUES ('779', '九幽乱武战靴');
INSERT INTO `bg_items` VALUES ('780', '真·轩辕血孽');
INSERT INTO `bg_items` VALUES ('781', '轩辕血孽');
INSERT INTO `bg_items` VALUES ('782', '轩辕血孽魔袍(男)');
INSERT INTO `bg_items` VALUES ('783', '轩辕血孽法袍(女)');
INSERT INTO `bg_items` VALUES ('784', '轩辕血孽魔盔');
INSERT INTO `bg_items` VALUES ('785', '轩辕血孽项链');
INSERT INTO `bg_items` VALUES ('786', '轩辕血孽护腕');
INSERT INTO `bg_items` VALUES ('787', '轩辕血孽魔戒');
INSERT INTO `bg_items` VALUES ('788', '轩辕血孽腰带');
INSERT INTO `bg_items` VALUES ('789', '轩辕血孽魔靴');
INSERT INTO `bg_items` VALUES ('790', '真·无影宿命');
INSERT INTO `bg_items` VALUES ('791', '无影宿命');
INSERT INTO `bg_items` VALUES ('792', '无影宿命道袍(男)');
INSERT INTO `bg_items` VALUES ('793', '无影宿命道衣(女)');
INSERT INTO `bg_items` VALUES ('794', '无影宿命道盔');
INSERT INTO `bg_items` VALUES ('795', '无影宿命项链');
INSERT INTO `bg_items` VALUES ('796', '无影宿命护腕');
INSERT INTO `bg_items` VALUES ('797', '无影宿命道戒');
INSERT INTO `bg_items` VALUES ('798', '无影宿命腰带');
INSERT INTO `bg_items` VALUES ('799', '无影宿命道靴');
INSERT INTO `bg_items` VALUES ('800', '留空');
INSERT INTO `bg_items` VALUES ('801', '神铸·无量破山');
INSERT INTO `bg_items` VALUES ('802', '神铸·无量破山战甲(男)');
INSERT INTO `bg_items` VALUES ('803', '神铸·无量破山战衣(女)');
INSERT INTO `bg_items` VALUES ('804', '神铸·无量破山战盔');
INSERT INTO `bg_items` VALUES ('805', '神铸·无量破山项链');
INSERT INTO `bg_items` VALUES ('806', '神铸·无量破山护腕');
INSERT INTO `bg_items` VALUES ('807', '神铸·无量破山战戒');
INSERT INTO `bg_items` VALUES ('808', '神铸·无量破山腰带');
INSERT INTO `bg_items` VALUES ('809', '神铸·无量破山战靴');
INSERT INTO `bg_items` VALUES ('810', '留空');
INSERT INTO `bg_items` VALUES ('811', '神铸·六合混沌');
INSERT INTO `bg_items` VALUES ('812', '神铸·六合混沌魔袍(男)');
INSERT INTO `bg_items` VALUES ('813', '神铸·六合混沌法袍(女)');
INSERT INTO `bg_items` VALUES ('814', '神铸·六合混沌魔盔');
INSERT INTO `bg_items` VALUES ('815', '神铸·六合混沌项链');
INSERT INTO `bg_items` VALUES ('816', '神铸·六合混沌护腕');
INSERT INTO `bg_items` VALUES ('817', '神铸·六合混沌魔戒');
INSERT INTO `bg_items` VALUES ('818', '神铸·六合混沌腰带');
INSERT INTO `bg_items` VALUES ('819', '神铸·六合混沌魔靴');
INSERT INTO `bg_items` VALUES ('820', '留空');
INSERT INTO `bg_items` VALUES ('821', '神铸·八荒虚空');
INSERT INTO `bg_items` VALUES ('822', '神铸·八荒虚空道袍(男)');
INSERT INTO `bg_items` VALUES ('823', '神铸·八荒虚空道衣(女)');
INSERT INTO `bg_items` VALUES ('824', '神铸·八荒虚空道盔');
INSERT INTO `bg_items` VALUES ('825', '神铸·八荒虚空项链');
INSERT INTO `bg_items` VALUES ('826', '神铸·八荒虚空护腕');
INSERT INTO `bg_items` VALUES ('827', '神铸·八荒虚空道戒');
INSERT INTO `bg_items` VALUES ('828', '神铸·八荒虚空腰带');
INSERT INTO `bg_items` VALUES ('829', '神铸·八荒虚空道靴');
INSERT INTO `bg_items` VALUES ('830', '真·浑天龙焰');
INSERT INTO `bg_items` VALUES ('831', '浑天龙焰');
INSERT INTO `bg_items` VALUES ('832', '浑天龙焰战甲(男)');
INSERT INTO `bg_items` VALUES ('833', '浑天龙焰战衣(女)');
INSERT INTO `bg_items` VALUES ('834', '浑天龙焰战盔');
INSERT INTO `bg_items` VALUES ('835', '浑天龙焰项链');
INSERT INTO `bg_items` VALUES ('836', '浑天龙焰护腕');
INSERT INTO `bg_items` VALUES ('837', '浑天龙焰战戒');
INSERT INTO `bg_items` VALUES ('838', '浑天龙焰腰带');
INSERT INTO `bg_items` VALUES ('839', '浑天龙焰战靴');
INSERT INTO `bg_items` VALUES ('840', '真·纯阳凤羽');
INSERT INTO `bg_items` VALUES ('841', '纯阳凤羽');
INSERT INTO `bg_items` VALUES ('842', '纯阳凤羽魔袍(男)');
INSERT INTO `bg_items` VALUES ('843', '纯阳凤羽法袍(女)');
INSERT INTO `bg_items` VALUES ('844', '纯阳凤羽魔盔');
INSERT INTO `bg_items` VALUES ('845', '纯阳凤羽项链');
INSERT INTO `bg_items` VALUES ('846', '纯阳凤羽护腕');
INSERT INTO `bg_items` VALUES ('847', '纯阳凤羽魔戒');
INSERT INTO `bg_items` VALUES ('848', '纯阳凤羽腰带');
INSERT INTO `bg_items` VALUES ('849', '纯阳凤羽魔靴');
INSERT INTO `bg_items` VALUES ('850', '真·斩海鬼域');
INSERT INTO `bg_items` VALUES ('851', '斩海鬼域');
INSERT INTO `bg_items` VALUES ('852', '斩海鬼域道袍(男)');
INSERT INTO `bg_items` VALUES ('853', '斩海鬼域道衣(女)');
INSERT INTO `bg_items` VALUES ('854', '斩海鬼域道盔');
INSERT INTO `bg_items` VALUES ('855', '斩海鬼域项链');
INSERT INTO `bg_items` VALUES ('856', '斩海鬼域护腕');
INSERT INTO `bg_items` VALUES ('857', '斩海鬼域道戒');
INSERT INTO `bg_items` VALUES ('858', '斩海鬼域腰带');
INSERT INTO `bg_items` VALUES ('859', '斩海鬼域道靴');
INSERT INTO `bg_items` VALUES ('860', '留空');
INSERT INTO `bg_items` VALUES ('861', '黄·至尊神剑');
INSERT INTO `bg_items` VALUES ('862', '黄·至尊神甲(男)');
INSERT INTO `bg_items` VALUES ('863', '黄·至尊神甲(女)');
INSERT INTO `bg_items` VALUES ('864', '黄·至尊神盔');
INSERT INTO `bg_items` VALUES ('865', '黄·至尊神链');
INSERT INTO `bg_items` VALUES ('866', '黄·至尊神镯');
INSERT INTO `bg_items` VALUES ('867', '黄·至尊神戒');
INSERT INTO `bg_items` VALUES ('868', '黄·至尊神带');
INSERT INTO `bg_items` VALUES ('869', '黄·至尊神靴');
INSERT INTO `bg_items` VALUES ('870', '留空');
INSERT INTO `bg_items` VALUES ('871', '留空');
INSERT INTO `bg_items` VALUES ('872', '留空');
INSERT INTO `bg_items` VALUES ('873', '留空');
INSERT INTO `bg_items` VALUES ('874', '留空');
INSERT INTO `bg_items` VALUES ('875', '留空');
INSERT INTO `bg_items` VALUES ('876', '留空');
INSERT INTO `bg_items` VALUES ('877', '留空');
INSERT INTO `bg_items` VALUES ('878', '留空');
INSERT INTO `bg_items` VALUES ('879', '留空');
INSERT INTO `bg_items` VALUES ('880', '留空');
INSERT INTO `bg_items` VALUES ('881', '留空');
INSERT INTO `bg_items` VALUES ('882', '留空');
INSERT INTO `bg_items` VALUES ('883', '留空');
INSERT INTO `bg_items` VALUES ('884', '留空');
INSERT INTO `bg_items` VALUES ('885', '留空');
INSERT INTO `bg_items` VALUES ('886', '留空');
INSERT INTO `bg_items` VALUES ('887', '留空');
INSERT INTO `bg_items` VALUES ('888', '留空');
INSERT INTO `bg_items` VALUES ('889', '留空');
INSERT INTO `bg_items` VALUES ('890', '真·天罡日曜');
INSERT INTO `bg_items` VALUES ('891', '天罡日曜');
INSERT INTO `bg_items` VALUES ('892', '天罡日曜战甲(男)');
INSERT INTO `bg_items` VALUES ('893', '天罡日曜战衣(女)');
INSERT INTO `bg_items` VALUES ('894', '天罡日曜战盔');
INSERT INTO `bg_items` VALUES ('895', '天罡日曜项链');
INSERT INTO `bg_items` VALUES ('896', '天罡日曜护腕');
INSERT INTO `bg_items` VALUES ('897', '天罡日曜战戒');
INSERT INTO `bg_items` VALUES ('898', '天罡日曜腰带');
INSERT INTO `bg_items` VALUES ('899', '天罡日曜战靴');
INSERT INTO `bg_items` VALUES ('900', '真·炼狱星芒');
INSERT INTO `bg_items` VALUES ('901', '炼狱星芒');
INSERT INTO `bg_items` VALUES ('902', '炼狱星芒魔袍(男)');
INSERT INTO `bg_items` VALUES ('903', '炼狱星芒法袍(女)');
INSERT INTO `bg_items` VALUES ('904', '炼狱星芒魔盔');
INSERT INTO `bg_items` VALUES ('905', '炼狱星芒项链');
INSERT INTO `bg_items` VALUES ('906', '炼狱星芒护腕');
INSERT INTO `bg_items` VALUES ('907', '炼狱星芒魔戒');
INSERT INTO `bg_items` VALUES ('908', '炼狱星芒腰带');
INSERT INTO `bg_items` VALUES ('909', '炼狱星芒魔靴');
INSERT INTO `bg_items` VALUES ('910', '真·五方幻月');
INSERT INTO `bg_items` VALUES ('911', '五方幻月');
INSERT INTO `bg_items` VALUES ('912', '五方幻月道袍(男)');
INSERT INTO `bg_items` VALUES ('913', '五方幻月道衣(女)');
INSERT INTO `bg_items` VALUES ('914', '五方幻月道盔');
INSERT INTO `bg_items` VALUES ('915', '五方幻月项链');
INSERT INTO `bg_items` VALUES ('916', '五方幻月护腕');
INSERT INTO `bg_items` VALUES ('917', '五方幻月道戒');
INSERT INTO `bg_items` VALUES ('918', '五方幻月腰带');
INSERT INTO `bg_items` VALUES ('919', '五方幻月道靴');
INSERT INTO `bg_items` VALUES ('920', '留空');
INSERT INTO `bg_items` VALUES ('921', '神铸·浑天龙焰');
INSERT INTO `bg_items` VALUES ('922', '神铸·浑天龙焰战甲(男)');
INSERT INTO `bg_items` VALUES ('923', '神铸·浑天龙焰战衣(女)');
INSERT INTO `bg_items` VALUES ('924', '神铸·浑天龙焰战盔');
INSERT INTO `bg_items` VALUES ('925', '神铸·浑天龙焰项链');
INSERT INTO `bg_items` VALUES ('926', '神铸·浑天龙焰护腕');
INSERT INTO `bg_items` VALUES ('927', '神铸·浑天龙焰战戒');
INSERT INTO `bg_items` VALUES ('928', '神铸·浑天龙焰腰带');
INSERT INTO `bg_items` VALUES ('929', '神铸·浑天龙焰战靴');
INSERT INTO `bg_items` VALUES ('930', '留空');
INSERT INTO `bg_items` VALUES ('931', '神铸·纯阳凤羽');
INSERT INTO `bg_items` VALUES ('932', '神铸·纯阳凤羽魔袍(男)');
INSERT INTO `bg_items` VALUES ('933', '神铸·纯阳凤羽法袍(女)');
INSERT INTO `bg_items` VALUES ('934', '神铸·纯阳凤羽魔盔');
INSERT INTO `bg_items` VALUES ('935', '神铸·纯阳凤羽项链');
INSERT INTO `bg_items` VALUES ('936', '神铸·纯阳凤羽护腕');
INSERT INTO `bg_items` VALUES ('937', '神铸·纯阳凤羽魔戒');
INSERT INTO `bg_items` VALUES ('938', '神铸·纯阳凤羽腰带');
INSERT INTO `bg_items` VALUES ('939', '神铸·纯阳凤羽魔靴');
INSERT INTO `bg_items` VALUES ('940', '留空');
INSERT INTO `bg_items` VALUES ('941', '神铸·斩海鬼域');
INSERT INTO `bg_items` VALUES ('942', '神铸·斩海鬼域道袍(男)');
INSERT INTO `bg_items` VALUES ('943', '神铸·斩海鬼域道衣(女)');
INSERT INTO `bg_items` VALUES ('944', '神铸·斩海鬼域道盔');
INSERT INTO `bg_items` VALUES ('945', '神铸·斩海鬼域项链');
INSERT INTO `bg_items` VALUES ('946', '神铸·斩海鬼域护腕');
INSERT INTO `bg_items` VALUES ('947', '神铸·斩海鬼域道戒');
INSERT INTO `bg_items` VALUES ('948', '神铸·斩海鬼域腰带');
INSERT INTO `bg_items` VALUES ('949', '神铸·斩海鬼域道靴');
INSERT INTO `bg_items` VALUES ('950', '真·碎骨黑曜');
INSERT INTO `bg_items` VALUES ('951', '碎骨黑曜');
INSERT INTO `bg_items` VALUES ('952', '碎骨黑曜战甲(男)');
INSERT INTO `bg_items` VALUES ('953', '碎骨黑曜战衣(女)');
INSERT INTO `bg_items` VALUES ('954', '碎骨黑曜战盔');
INSERT INTO `bg_items` VALUES ('955', '碎骨黑曜项链');
INSERT INTO `bg_items` VALUES ('956', '碎骨黑曜护腕');
INSERT INTO `bg_items` VALUES ('957', '碎骨黑曜战戒');
INSERT INTO `bg_items` VALUES ('958', '碎骨黑曜腰带');
INSERT INTO `bg_items` VALUES ('959', '碎骨黑曜战靴');
INSERT INTO `bg_items` VALUES ('960', '真·天罗碎星');
INSERT INTO `bg_items` VALUES ('961', '天罗碎星');
INSERT INTO `bg_items` VALUES ('962', '天罗碎星魔袍(男)');
INSERT INTO `bg_items` VALUES ('963', '天罗碎星法袍(女)');
INSERT INTO `bg_items` VALUES ('964', '天罗碎星魔盔');
INSERT INTO `bg_items` VALUES ('965', '天罗碎星项链');
INSERT INTO `bg_items` VALUES ('966', '天罗碎星护腕');
INSERT INTO `bg_items` VALUES ('967', '天罗碎星魔戒');
INSERT INTO `bg_items` VALUES ('968', '天罗碎星腰带');
INSERT INTO `bg_items` VALUES ('969', '天罗碎星魔靴');
INSERT INTO `bg_items` VALUES ('970', '真·阴阳君王');
INSERT INTO `bg_items` VALUES ('971', '阴阳君王');
INSERT INTO `bg_items` VALUES ('972', '阴阳君王道袍(男)');
INSERT INTO `bg_items` VALUES ('973', '阴阳君王道衣(女)');
INSERT INTO `bg_items` VALUES ('974', '阴阳君王道盔');
INSERT INTO `bg_items` VALUES ('975', '阴阳君王项链');
INSERT INTO `bg_items` VALUES ('976', '阴阳君王护腕');
INSERT INTO `bg_items` VALUES ('977', '阴阳君王道戒');
INSERT INTO `bg_items` VALUES ('978', '阴阳君王腰带');
INSERT INTO `bg_items` VALUES ('979', '阴阳君王道靴');
INSERT INTO `bg_items` VALUES ('980', '留空');
INSERT INTO `bg_items` VALUES ('981', '宇·至尊神剑');
INSERT INTO `bg_items` VALUES ('982', '宇·至尊神甲(男)');
INSERT INTO `bg_items` VALUES ('983', '宇·至尊神甲(女)');
INSERT INTO `bg_items` VALUES ('984', '宇·至尊神盔');
INSERT INTO `bg_items` VALUES ('985', '宇·至尊神链');
INSERT INTO `bg_items` VALUES ('986', '宇·至尊神镯');
INSERT INTO `bg_items` VALUES ('987', '宇·至尊神戒');
INSERT INTO `bg_items` VALUES ('988', '宇·至尊神带');
INSERT INTO `bg_items` VALUES ('989', '宇·至尊神靴');
INSERT INTO `bg_items` VALUES ('990', '留空');
INSERT INTO `bg_items` VALUES ('991', '留空');
INSERT INTO `bg_items` VALUES ('992', '留空');
INSERT INTO `bg_items` VALUES ('993', '留空');
INSERT INTO `bg_items` VALUES ('994', '留空');
INSERT INTO `bg_items` VALUES ('995', '留空');
INSERT INTO `bg_items` VALUES ('996', '留空');
INSERT INTO `bg_items` VALUES ('997', '留空');
INSERT INTO `bg_items` VALUES ('998', '留空');
INSERT INTO `bg_items` VALUES ('999', '留空');
INSERT INTO `bg_items` VALUES ('1000', '留空');
INSERT INTO `bg_items` VALUES ('1001', '留空');
INSERT INTO `bg_items` VALUES ('1002', '留空');
INSERT INTO `bg_items` VALUES ('1003', '留空');
INSERT INTO `bg_items` VALUES ('1004', '留空');
INSERT INTO `bg_items` VALUES ('1005', '留空');
INSERT INTO `bg_items` VALUES ('1006', '留空');
INSERT INTO `bg_items` VALUES ('1007', '留空');
INSERT INTO `bg_items` VALUES ('1008', '留空');
INSERT INTO `bg_items` VALUES ('1009', '留空');
INSERT INTO `bg_items` VALUES ('1010', '真·破元天王');
INSERT INTO `bg_items` VALUES ('1011', '破元天王');
INSERT INTO `bg_items` VALUES ('1012', '破元天王战甲(男)');
INSERT INTO `bg_items` VALUES ('1013', '破元天王战衣(女)');
INSERT INTO `bg_items` VALUES ('1014', '破元天王战盔');
INSERT INTO `bg_items` VALUES ('1015', '破元天王项链');
INSERT INTO `bg_items` VALUES ('1016', '破元天王护腕');
INSERT INTO `bg_items` VALUES ('1017', '破元天王战戒');
INSERT INTO `bg_items` VALUES ('1018', '破元天王腰带');
INSERT INTO `bg_items` VALUES ('1019', '破元天王战靴');
INSERT INTO `bg_items` VALUES ('1020', '真·破元海王');
INSERT INTO `bg_items` VALUES ('1021', '破元海王');
INSERT INTO `bg_items` VALUES ('1022', '破元海王魔袍(男)');
INSERT INTO `bg_items` VALUES ('1023', '破元海王法袍(女)');
INSERT INTO `bg_items` VALUES ('1024', '破元海王魔盔');
INSERT INTO `bg_items` VALUES ('1025', '破元海王项链');
INSERT INTO `bg_items` VALUES ('1026', '破元海王护腕');
INSERT INTO `bg_items` VALUES ('1027', '破元海王魔戒');
INSERT INTO `bg_items` VALUES ('1028', '破元海王腰带');
INSERT INTO `bg_items` VALUES ('1029', '破元海王魔靴');
INSERT INTO `bg_items` VALUES ('1030', '真·破元冥王');
INSERT INTO `bg_items` VALUES ('1031', '破元冥王');
INSERT INTO `bg_items` VALUES ('1032', '破元冥王道袍(男)');
INSERT INTO `bg_items` VALUES ('1033', '破元冥王道衣(女)');
INSERT INTO `bg_items` VALUES ('1034', '破元冥王道盔');
INSERT INTO `bg_items` VALUES ('1035', '破元冥王项链');
INSERT INTO `bg_items` VALUES ('1036', '破元冥王护腕');
INSERT INTO `bg_items` VALUES ('1037', '破元冥王道戒');
INSERT INTO `bg_items` VALUES ('1038', '破元冥王腰带');
INSERT INTO `bg_items` VALUES ('1039', '破元冥王道靴');
INSERT INTO `bg_items` VALUES ('1040', '留空');
INSERT INTO `bg_items` VALUES ('1041', '神铸·碎骨黑曜');
INSERT INTO `bg_items` VALUES ('1042', '神铸·碎骨黑曜战甲(男)');
INSERT INTO `bg_items` VALUES ('1043', '神铸·碎骨黑曜战衣(女)');
INSERT INTO `bg_items` VALUES ('1044', '神铸·碎骨黑曜战盔');
INSERT INTO `bg_items` VALUES ('1045', '神铸·碎骨黑曜项链');
INSERT INTO `bg_items` VALUES ('1046', '神铸·碎骨黑曜护腕');
INSERT INTO `bg_items` VALUES ('1047', '神铸·碎骨黑曜战戒');
INSERT INTO `bg_items` VALUES ('1048', '神铸·碎骨黑曜腰带');
INSERT INTO `bg_items` VALUES ('1049', '神铸·碎骨黑曜战靴');
INSERT INTO `bg_items` VALUES ('1050', '留空');
INSERT INTO `bg_items` VALUES ('1051', '神铸·天罗碎星');
INSERT INTO `bg_items` VALUES ('1052', '神铸·天罗碎星魔袍(男)');
INSERT INTO `bg_items` VALUES ('1053', '神铸·天罗碎星法袍(女)');
INSERT INTO `bg_items` VALUES ('1054', '神铸·天罗碎星魔盔');
INSERT INTO `bg_items` VALUES ('1055', '神铸·天罗碎星项链');
INSERT INTO `bg_items` VALUES ('1056', '神铸·天罗碎星护腕');
INSERT INTO `bg_items` VALUES ('1057', '神铸·天罗碎星魔戒');
INSERT INTO `bg_items` VALUES ('1058', '神铸·天罗碎星腰带');
INSERT INTO `bg_items` VALUES ('1059', '神铸·天罗碎星魔靴');
INSERT INTO `bg_items` VALUES ('1060', '留空');
INSERT INTO `bg_items` VALUES ('1061', '神铸·阴阳君王');
INSERT INTO `bg_items` VALUES ('1062', '神铸·阴阳君王道袍(男)');
INSERT INTO `bg_items` VALUES ('1063', '神铸·阴阳君王道衣(女)');
INSERT INTO `bg_items` VALUES ('1064', '神铸·阴阳君王道盔');
INSERT INTO `bg_items` VALUES ('1065', '神铸·阴阳君王项链');
INSERT INTO `bg_items` VALUES ('1066', '神铸·阴阳君王护腕');
INSERT INTO `bg_items` VALUES ('1067', '神铸·阴阳君王道戒');
INSERT INTO `bg_items` VALUES ('1068', '神铸·阴阳君王腰带');
INSERT INTO `bg_items` VALUES ('1069', '神铸·阴阳君王道靴');
INSERT INTO `bg_items` VALUES ('1070', '真·九霄龙吟');
INSERT INTO `bg_items` VALUES ('1071', '九霄龙吟');
INSERT INTO `bg_items` VALUES ('1072', '九霄龙吟战甲(男)');
INSERT INTO `bg_items` VALUES ('1073', '九霄龙吟战衣(女)');
INSERT INTO `bg_items` VALUES ('1074', '九霄龙吟战盔');
INSERT INTO `bg_items` VALUES ('1075', '九霄龙吟项链');
INSERT INTO `bg_items` VALUES ('1076', '九霄龙吟护腕');
INSERT INTO `bg_items` VALUES ('1077', '九霄龙吟战戒');
INSERT INTO `bg_items` VALUES ('1078', '九霄龙吟腰带');
INSERT INTO `bg_items` VALUES ('1079', '九霄龙吟战靴');
INSERT INTO `bg_items` VALUES ('1080', '真·破魔凤鸣');
INSERT INTO `bg_items` VALUES ('1081', '破魔凤鸣');
INSERT INTO `bg_items` VALUES ('1082', '破魔凤鸣魔袍(男)');
INSERT INTO `bg_items` VALUES ('1083', '破魔凤鸣法袍(女)');
INSERT INTO `bg_items` VALUES ('1084', '破魔凤鸣魔盔');
INSERT INTO `bg_items` VALUES ('1085', '破魔凤鸣项链');
INSERT INTO `bg_items` VALUES ('1086', '破魔凤鸣护腕');
INSERT INTO `bg_items` VALUES ('1087', '破魔凤鸣魔戒');
INSERT INTO `bg_items` VALUES ('1088', '破魔凤鸣腰带');
INSERT INTO `bg_items` VALUES ('1089', '破魔凤鸣魔靴');
INSERT INTO `bg_items` VALUES ('1090', '真·极地虎啸');
INSERT INTO `bg_items` VALUES ('1091', '极地虎啸');
INSERT INTO `bg_items` VALUES ('1092', '极地虎啸道袍(男)');
INSERT INTO `bg_items` VALUES ('1093', '极地虎啸道衣(女)');
INSERT INTO `bg_items` VALUES ('1094', '极地虎啸道盔');
INSERT INTO `bg_items` VALUES ('1095', '极地虎啸项链');
INSERT INTO `bg_items` VALUES ('1096', '极地虎啸护腕');
INSERT INTO `bg_items` VALUES ('1097', '极地虎啸道戒');
INSERT INTO `bg_items` VALUES ('1098', '极地虎啸腰带');
INSERT INTO `bg_items` VALUES ('1099', '极地虎啸道靴');
INSERT INTO `bg_items` VALUES ('1100', '留空');
INSERT INTO `bg_items` VALUES ('1101', '宙·至尊神剑');
INSERT INTO `bg_items` VALUES ('1102', '宙·至尊神甲(男)');
INSERT INTO `bg_items` VALUES ('1103', '宙·至尊神甲(女)');
INSERT INTO `bg_items` VALUES ('1104', '宙·至尊神盔');
INSERT INTO `bg_items` VALUES ('1105', '宙·至尊神链');
INSERT INTO `bg_items` VALUES ('1106', '宙·至尊神镯');
INSERT INTO `bg_items` VALUES ('1107', '宙·至尊神戒');
INSERT INTO `bg_items` VALUES ('1108', '宙·至尊神带');
INSERT INTO `bg_items` VALUES ('1109', '宙·至尊神靴');
INSERT INTO `bg_items` VALUES ('1110', '留空');
INSERT INTO `bg_items` VALUES ('1111', '留空');
INSERT INTO `bg_items` VALUES ('1112', '留空');
INSERT INTO `bg_items` VALUES ('1113', '留空');
INSERT INTO `bg_items` VALUES ('1114', '留空');
INSERT INTO `bg_items` VALUES ('1115', '留空');
INSERT INTO `bg_items` VALUES ('1116', '留空');
INSERT INTO `bg_items` VALUES ('1117', '留空');
INSERT INTO `bg_items` VALUES ('1118', '留空');
INSERT INTO `bg_items` VALUES ('1119', '留空');
INSERT INTO `bg_items` VALUES ('1120', '留空');
INSERT INTO `bg_items` VALUES ('1121', '留空');
INSERT INTO `bg_items` VALUES ('1122', '留空');
INSERT INTO `bg_items` VALUES ('1123', '留空');
INSERT INTO `bg_items` VALUES ('1124', '留空');
INSERT INTO `bg_items` VALUES ('1125', '留空');
INSERT INTO `bg_items` VALUES ('1126', '留空');
INSERT INTO `bg_items` VALUES ('1127', '留空');
INSERT INTO `bg_items` VALUES ('1128', '留空');
INSERT INTO `bg_items` VALUES ('1129', '留空');
INSERT INTO `bg_items` VALUES ('1130', '真·九天龙牙');
INSERT INTO `bg_items` VALUES ('1131', '九天龙牙');
INSERT INTO `bg_items` VALUES ('1132', '九天龙牙战甲(男)');
INSERT INTO `bg_items` VALUES ('1133', '九天龙牙战衣(女)');
INSERT INTO `bg_items` VALUES ('1134', '九天龙牙战盔');
INSERT INTO `bg_items` VALUES ('1135', '九天龙牙项链');
INSERT INTO `bg_items` VALUES ('1136', '九天龙牙护腕');
INSERT INTO `bg_items` VALUES ('1137', '九天龙牙战戒');
INSERT INTO `bg_items` VALUES ('1138', '九天龙牙腰带');
INSERT INTO `bg_items` VALUES ('1139', '九天龙牙战靴');
INSERT INTO `bg_items` VALUES ('1140', '真·九天犬神');
INSERT INTO `bg_items` VALUES ('1141', '九天犬神');
INSERT INTO `bg_items` VALUES ('1142', '九天犬神魔袍(男)');
INSERT INTO `bg_items` VALUES ('1143', '九天犬神法袍(女)');
INSERT INTO `bg_items` VALUES ('1144', '九天犬神魔盔');
INSERT INTO `bg_items` VALUES ('1145', '九天犬神项链');
INSERT INTO `bg_items` VALUES ('1146', '九天犬神护腕');
INSERT INTO `bg_items` VALUES ('1147', '九天犬神魔戒');
INSERT INTO `bg_items` VALUES ('1148', '九天犬神腰带');
INSERT INTO `bg_items` VALUES ('1149', '九天犬神魔靴');
INSERT INTO `bg_items` VALUES ('1150', '真·九天虎翼');
INSERT INTO `bg_items` VALUES ('1151', '九天虎翼');
INSERT INTO `bg_items` VALUES ('1152', '九天虎翼道袍(男)');
INSERT INTO `bg_items` VALUES ('1153', '九天虎翼道衣(女)');
INSERT INTO `bg_items` VALUES ('1154', '九天虎翼道盔');
INSERT INTO `bg_items` VALUES ('1155', '九天虎翼项链');
INSERT INTO `bg_items` VALUES ('1156', '九天虎翼护腕');
INSERT INTO `bg_items` VALUES ('1157', '九天虎翼道戒');
INSERT INTO `bg_items` VALUES ('1158', '九天虎翼腰带');
INSERT INTO `bg_items` VALUES ('1159', '九天虎翼道靴');
INSERT INTO `bg_items` VALUES ('1160', '留空');
INSERT INTO `bg_items` VALUES ('1161', '神铸·九霄龙吟');
INSERT INTO `bg_items` VALUES ('1162', '神铸·九霄龙吟战甲(男)');
INSERT INTO `bg_items` VALUES ('1163', '神铸·九霄龙吟战衣(女)');
INSERT INTO `bg_items` VALUES ('1164', '神铸·九霄龙吟战盔');
INSERT INTO `bg_items` VALUES ('1165', '神铸·九霄龙吟项链');
INSERT INTO `bg_items` VALUES ('1166', '神铸·九霄龙吟护腕');
INSERT INTO `bg_items` VALUES ('1167', '神铸·九霄龙吟战戒');
INSERT INTO `bg_items` VALUES ('1168', '神铸·九霄龙吟腰带');
INSERT INTO `bg_items` VALUES ('1169', '神铸·九霄龙吟战靴');
INSERT INTO `bg_items` VALUES ('1170', '留空');
INSERT INTO `bg_items` VALUES ('1171', '神铸·破魔凤鸣');
INSERT INTO `bg_items` VALUES ('1172', '神铸·破魔凤鸣魔袍(男)');
INSERT INTO `bg_items` VALUES ('1173', '神铸·破魔凤鸣法袍(女)');
INSERT INTO `bg_items` VALUES ('1174', '神铸·破魔凤鸣魔盔');
INSERT INTO `bg_items` VALUES ('1175', '神铸·破魔凤鸣项链');
INSERT INTO `bg_items` VALUES ('1176', '神铸·破魔凤鸣护腕');
INSERT INTO `bg_items` VALUES ('1177', '神铸·破魔凤鸣魔戒');
INSERT INTO `bg_items` VALUES ('1178', '神铸·破魔凤鸣腰带');
INSERT INTO `bg_items` VALUES ('1179', '神铸·破魔凤鸣魔靴');
INSERT INTO `bg_items` VALUES ('1180', '留空');
INSERT INTO `bg_items` VALUES ('1181', '神铸·极地虎啸');
INSERT INTO `bg_items` VALUES ('1182', '神铸·极地虎啸道袍(男)');
INSERT INTO `bg_items` VALUES ('1183', '神铸·极地虎啸道衣(女)');
INSERT INTO `bg_items` VALUES ('1184', '神铸·极地虎啸道盔');
INSERT INTO `bg_items` VALUES ('1185', '神铸·极地虎啸项链');
INSERT INTO `bg_items` VALUES ('1186', '神铸·极地虎啸护腕');
INSERT INTO `bg_items` VALUES ('1187', '神铸·极地虎啸道戒');
INSERT INTO `bg_items` VALUES ('1188', '神铸·极地虎啸腰带');
INSERT INTO `bg_items` VALUES ('1189', '神铸·极地虎啸道靴');
INSERT INTO `bg_items` VALUES ('1190', '真·惊龙神罚');
INSERT INTO `bg_items` VALUES ('1191', '惊龙神罚');
INSERT INTO `bg_items` VALUES ('1192', '惊龙神罚战甲(男)');
INSERT INTO `bg_items` VALUES ('1193', '惊龙神罚战衣(女)');
INSERT INTO `bg_items` VALUES ('1194', '惊龙神罚战盔');
INSERT INTO `bg_items` VALUES ('1195', '惊龙神罚项链');
INSERT INTO `bg_items` VALUES ('1196', '惊龙神罚护腕');
INSERT INTO `bg_items` VALUES ('1197', '惊龙神罚战戒');
INSERT INTO `bg_items` VALUES ('1198', '惊龙神罚腰带');
INSERT INTO `bg_items` VALUES ('1199', '惊龙神罚战靴');
INSERT INTO `bg_items` VALUES ('1200', '真·疾雷妖魂');
INSERT INTO `bg_items` VALUES ('1201', '疾雷妖魂');
INSERT INTO `bg_items` VALUES ('1202', '疾雷妖魂魔袍(男)');
INSERT INTO `bg_items` VALUES ('1203', '疾雷妖魂法袍(女)');
INSERT INTO `bg_items` VALUES ('1204', '疾雷妖魂魔盔');
INSERT INTO `bg_items` VALUES ('1205', '疾雷妖魂项链');
INSERT INTO `bg_items` VALUES ('1206', '疾雷妖魂护腕');
INSERT INTO `bg_items` VALUES ('1207', '疾雷妖魂魔戒');
INSERT INTO `bg_items` VALUES ('1208', '疾雷妖魂腰带');
INSERT INTO `bg_items` VALUES ('1209', '疾雷妖魂魔靴');
INSERT INTO `bg_items` VALUES ('1210', '真·太乙鬼锁');
INSERT INTO `bg_items` VALUES ('1211', '太乙鬼锁');
INSERT INTO `bg_items` VALUES ('1212', '太乙鬼锁道袍(男)');
INSERT INTO `bg_items` VALUES ('1213', '太乙鬼锁道衣(女)');
INSERT INTO `bg_items` VALUES ('1214', '太乙鬼锁道盔');
INSERT INTO `bg_items` VALUES ('1215', '太乙鬼锁项链');
INSERT INTO `bg_items` VALUES ('1216', '太乙鬼锁护腕');
INSERT INTO `bg_items` VALUES ('1217', '太乙鬼锁道戒');
INSERT INTO `bg_items` VALUES ('1218', '太乙鬼锁腰带');
INSERT INTO `bg_items` VALUES ('1219', '太乙鬼锁道靴');
INSERT INTO `bg_items` VALUES ('1220', '留空');
INSERT INTO `bg_items` VALUES ('1221', '洪·至尊神剑');
INSERT INTO `bg_items` VALUES ('1222', '洪·至尊神甲(男)');
INSERT INTO `bg_items` VALUES ('1223', '洪·至尊神甲(女)');
INSERT INTO `bg_items` VALUES ('1224', '洪·至尊神盔');
INSERT INTO `bg_items` VALUES ('1225', '洪·至尊神链');
INSERT INTO `bg_items` VALUES ('1226', '洪·至尊神镯');
INSERT INTO `bg_items` VALUES ('1227', '洪·至尊神戒');
INSERT INTO `bg_items` VALUES ('1228', '洪·至尊神带');
INSERT INTO `bg_items` VALUES ('1229', '洪·至尊神靴');
INSERT INTO `bg_items` VALUES ('1230', '留空');
INSERT INTO `bg_items` VALUES ('1231', '留空');
INSERT INTO `bg_items` VALUES ('1232', '留空');
INSERT INTO `bg_items` VALUES ('1233', '留空');
INSERT INTO `bg_items` VALUES ('1234', '留空');
INSERT INTO `bg_items` VALUES ('1235', '留空');
INSERT INTO `bg_items` VALUES ('1236', '留空');
INSERT INTO `bg_items` VALUES ('1237', '留空');
INSERT INTO `bg_items` VALUES ('1238', '留空');
INSERT INTO `bg_items` VALUES ('1239', '留空');
INSERT INTO `bg_items` VALUES ('1240', '留空');
INSERT INTO `bg_items` VALUES ('1241', '留空');
INSERT INTO `bg_items` VALUES ('1242', '留空');
INSERT INTO `bg_items` VALUES ('1243', '留空');
INSERT INTO `bg_items` VALUES ('1244', '留空');
INSERT INTO `bg_items` VALUES ('1245', '留空');
INSERT INTO `bg_items` VALUES ('1246', '留空');
INSERT INTO `bg_items` VALUES ('1247', '留空');
INSERT INTO `bg_items` VALUES ('1248', '留空');
INSERT INTO `bg_items` VALUES ('1249', '留空');
INSERT INTO `bg_items` VALUES ('1250', '真·屠神炼狱');
INSERT INTO `bg_items` VALUES ('1251', '屠神炼狱');
INSERT INTO `bg_items` VALUES ('1252', '屠神炼狱战甲(男)');
INSERT INTO `bg_items` VALUES ('1253', '屠神炼狱战衣(女)');
INSERT INTO `bg_items` VALUES ('1254', '屠神炼狱战盔');
INSERT INTO `bg_items` VALUES ('1255', '屠神炼狱项链');
INSERT INTO `bg_items` VALUES ('1256', '屠神炼狱护腕');
INSERT INTO `bg_items` VALUES ('1257', '屠神炼狱战戒');
INSERT INTO `bg_items` VALUES ('1258', '屠神炼狱腰带');
INSERT INTO `bg_items` VALUES ('1259', '屠神炼狱战靴');
INSERT INTO `bg_items` VALUES ('1260', '真·赤雷黄泉');
INSERT INTO `bg_items` VALUES ('1261', '赤雷黄泉');
INSERT INTO `bg_items` VALUES ('1262', '赤雷黄泉魔袍(男)');
INSERT INTO `bg_items` VALUES ('1263', '赤雷黄泉法袍(女)');
INSERT INTO `bg_items` VALUES ('1264', '赤雷黄泉魔盔');
INSERT INTO `bg_items` VALUES ('1265', '赤雷黄泉项链');
INSERT INTO `bg_items` VALUES ('1266', '赤雷黄泉护腕');
INSERT INTO `bg_items` VALUES ('1267', '赤雷黄泉魔戒');
INSERT INTO `bg_items` VALUES ('1268', '赤雷黄泉腰带');
INSERT INTO `bg_items` VALUES ('1269', '赤雷黄泉魔靴');
INSERT INTO `bg_items` VALUES ('1270', '真·雷音六道');
INSERT INTO `bg_items` VALUES ('1271', '雷音六道');
INSERT INTO `bg_items` VALUES ('1272', '雷音六道道袍(男)');
INSERT INTO `bg_items` VALUES ('1273', '雷音六道道衣(女)');
INSERT INTO `bg_items` VALUES ('1274', '雷音六道道盔');
INSERT INTO `bg_items` VALUES ('1275', '雷音六道项链');
INSERT INTO `bg_items` VALUES ('1276', '雷音六道护腕');
INSERT INTO `bg_items` VALUES ('1277', '雷音六道道戒');
INSERT INTO `bg_items` VALUES ('1278', '雷音六道腰带');
INSERT INTO `bg_items` VALUES ('1279', '雷音六道道靴');
INSERT INTO `bg_items` VALUES ('1280', '留空');
INSERT INTO `bg_items` VALUES ('1281', '神铸·惊龙神罚');
INSERT INTO `bg_items` VALUES ('1282', '神铸·惊龙神罚战甲(男)');
INSERT INTO `bg_items` VALUES ('1283', '神铸·惊龙神罚战衣(女)');
INSERT INTO `bg_items` VALUES ('1284', '神铸·惊龙神罚战盔');
INSERT INTO `bg_items` VALUES ('1285', '神铸·惊龙神罚项链');
INSERT INTO `bg_items` VALUES ('1286', '神铸·惊龙神罚护腕');
INSERT INTO `bg_items` VALUES ('1287', '神铸·惊龙神罚战戒');
INSERT INTO `bg_items` VALUES ('1288', '神铸·惊龙神罚腰带');
INSERT INTO `bg_items` VALUES ('1289', '神铸·惊龙神罚战靴');
INSERT INTO `bg_items` VALUES ('1290', '留空');
INSERT INTO `bg_items` VALUES ('1291', '神铸·疾雷妖魂');
INSERT INTO `bg_items` VALUES ('1292', '神铸·疾雷妖魂魔袍(男)');
INSERT INTO `bg_items` VALUES ('1293', '神铸·疾雷妖魂法袍(女)');
INSERT INTO `bg_items` VALUES ('1294', '神铸·疾雷妖魂魔盔');
INSERT INTO `bg_items` VALUES ('1295', '神铸·疾雷妖魂项链');
INSERT INTO `bg_items` VALUES ('1296', '神铸·疾雷妖魂护腕');
INSERT INTO `bg_items` VALUES ('1297', '神铸·疾雷妖魂魔戒');
INSERT INTO `bg_items` VALUES ('1298', '神铸·疾雷妖魂腰带');
INSERT INTO `bg_items` VALUES ('1299', '神铸·疾雷妖魂魔靴');
INSERT INTO `bg_items` VALUES ('1300', '留空');
INSERT INTO `bg_items` VALUES ('1301', '神铸·太乙鬼锁');
INSERT INTO `bg_items` VALUES ('1302', '神铸·太乙鬼锁道袍(男)');
INSERT INTO `bg_items` VALUES ('1303', '神铸·太乙鬼锁道衣(女)');
INSERT INTO `bg_items` VALUES ('1304', '神铸·太乙鬼锁道盔');
INSERT INTO `bg_items` VALUES ('1305', '神铸·太乙鬼锁项链');
INSERT INTO `bg_items` VALUES ('1306', '神铸·太乙鬼锁护腕');
INSERT INTO `bg_items` VALUES ('1307', '神铸·太乙鬼锁道戒');
INSERT INTO `bg_items` VALUES ('1308', '神铸·太乙鬼锁腰带');
INSERT INTO `bg_items` VALUES ('1309', '神铸·太乙鬼锁道靴');
INSERT INTO `bg_items` VALUES ('1310', '真·无上武神');
INSERT INTO `bg_items` VALUES ('1311', '无上武神');
INSERT INTO `bg_items` VALUES ('1312', '无上武神战甲(男)');
INSERT INTO `bg_items` VALUES ('1313', '无上武神战衣(女)');
INSERT INTO `bg_items` VALUES ('1314', '无上武神战盔');
INSERT INTO `bg_items` VALUES ('1315', '无上武神项链');
INSERT INTO `bg_items` VALUES ('1316', '无上武神护腕');
INSERT INTO `bg_items` VALUES ('1317', '无上武神战戒');
INSERT INTO `bg_items` VALUES ('1318', '无上武神腰带');
INSERT INTO `bg_items` VALUES ('1319', '无上武神战靴');
INSERT INTO `bg_items` VALUES ('1320', '真·无上法圣');
INSERT INTO `bg_items` VALUES ('1321', '无上法圣');
INSERT INTO `bg_items` VALUES ('1322', '无上法圣魔袍(男)');
INSERT INTO `bg_items` VALUES ('1323', '无上法圣法袍(女)');
INSERT INTO `bg_items` VALUES ('1324', '无上法圣魔盔');
INSERT INTO `bg_items` VALUES ('1325', '无上法圣项链');
INSERT INTO `bg_items` VALUES ('1326', '无上法圣护腕');
INSERT INTO `bg_items` VALUES ('1327', '无上法圣魔戒');
INSERT INTO `bg_items` VALUES ('1328', '无上法圣腰带');
INSERT INTO `bg_items` VALUES ('1329', '无上法圣魔靴');
INSERT INTO `bg_items` VALUES ('1330', '真·无上道圣');
INSERT INTO `bg_items` VALUES ('1331', '无上道圣');
INSERT INTO `bg_items` VALUES ('1332', '无上道圣道袍(男)');
INSERT INTO `bg_items` VALUES ('1333', '无上道圣道衣(女)');
INSERT INTO `bg_items` VALUES ('1334', '无上道圣道盔');
INSERT INTO `bg_items` VALUES ('1335', '无上道圣项链');
INSERT INTO `bg_items` VALUES ('1336', '无上道圣护腕');
INSERT INTO `bg_items` VALUES ('1337', '无上道圣道戒');
INSERT INTO `bg_items` VALUES ('1338', '无上道圣腰带');
INSERT INTO `bg_items` VALUES ('1339', '无上道圣道靴');
INSERT INTO `bg_items` VALUES ('1340', '留空');
INSERT INTO `bg_items` VALUES ('1341', '荒·至尊神剑');
INSERT INTO `bg_items` VALUES ('1342', '荒·至尊神甲(男)');
INSERT INTO `bg_items` VALUES ('1343', '荒·至尊神甲(女)');
INSERT INTO `bg_items` VALUES ('1344', '荒·至尊神盔');
INSERT INTO `bg_items` VALUES ('1345', '荒·至尊神链');
INSERT INTO `bg_items` VALUES ('1346', '荒·至尊神镯');
INSERT INTO `bg_items` VALUES ('1347', '荒·至尊神戒');
INSERT INTO `bg_items` VALUES ('1348', '荒·至尊神带');
INSERT INTO `bg_items` VALUES ('1349', '荒·至尊神靴');
INSERT INTO `bg_items` VALUES ('1350', '留空');
INSERT INTO `bg_items` VALUES ('1351', '留空');
INSERT INTO `bg_items` VALUES ('1352', '留空');
INSERT INTO `bg_items` VALUES ('1353', '留空');
INSERT INTO `bg_items` VALUES ('1354', '留空');
INSERT INTO `bg_items` VALUES ('1355', '留空');
INSERT INTO `bg_items` VALUES ('1356', '留空');
INSERT INTO `bg_items` VALUES ('1357', '留空');
INSERT INTO `bg_items` VALUES ('1358', '留空');
INSERT INTO `bg_items` VALUES ('1359', '留空');
INSERT INTO `bg_items` VALUES ('1360', '留空');
INSERT INTO `bg_items` VALUES ('1361', '留空');
INSERT INTO `bg_items` VALUES ('1362', '留空');
INSERT INTO `bg_items` VALUES ('1363', '留空');
INSERT INTO `bg_items` VALUES ('1364', '留空');
INSERT INTO `bg_items` VALUES ('1365', '留空');
INSERT INTO `bg_items` VALUES ('1366', '留空');
INSERT INTO `bg_items` VALUES ('1367', '留空');
INSERT INTO `bg_items` VALUES ('1368', '留空');
INSERT INTO `bg_items` VALUES ('1369', '留空');
INSERT INTO `bg_items` VALUES ('1370', '真·巅峰王权');
INSERT INTO `bg_items` VALUES ('1371', '巅峰王权');
INSERT INTO `bg_items` VALUES ('1372', '巅峰王权战甲(男)');
INSERT INTO `bg_items` VALUES ('1373', '巅峰王权战衣(女)');
INSERT INTO `bg_items` VALUES ('1374', '巅峰王权战盔');
INSERT INTO `bg_items` VALUES ('1375', '巅峰王权项链');
INSERT INTO `bg_items` VALUES ('1376', '巅峰王权护腕');
INSERT INTO `bg_items` VALUES ('1377', '巅峰王权战戒');
INSERT INTO `bg_items` VALUES ('1378', '巅峰王权腰带');
INSERT INTO `bg_items` VALUES ('1379', '巅峰王权战靴');
INSERT INTO `bg_items` VALUES ('1380', '真·魅影伽罗');
INSERT INTO `bg_items` VALUES ('1381', '魅影伽罗');
INSERT INTO `bg_items` VALUES ('1382', '魅影伽罗魔袍(男)');
INSERT INTO `bg_items` VALUES ('1383', '魅影伽罗法袍(女)');
INSERT INTO `bg_items` VALUES ('1384', '魅影伽罗魔盔');
INSERT INTO `bg_items` VALUES ('1385', '魅影伽罗项链');
INSERT INTO `bg_items` VALUES ('1386', '魅影伽罗护腕');
INSERT INTO `bg_items` VALUES ('1387', '魅影伽罗魔戒');
INSERT INTO `bg_items` VALUES ('1388', '魅影伽罗腰带');
INSERT INTO `bg_items` VALUES ('1389', '魅影伽罗魔靴');
INSERT INTO `bg_items` VALUES ('1390', '真·鸿蒙天道');
INSERT INTO `bg_items` VALUES ('1391', '鸿蒙天道');
INSERT INTO `bg_items` VALUES ('1392', '鸿蒙天道道袍(男)');
INSERT INTO `bg_items` VALUES ('1393', '鸿蒙天道道衣(女)');
INSERT INTO `bg_items` VALUES ('1394', '鸿蒙天道道盔');
INSERT INTO `bg_items` VALUES ('1395', '鸿蒙天道项链');
INSERT INTO `bg_items` VALUES ('1396', '鸿蒙天道护腕');
INSERT INTO `bg_items` VALUES ('1397', '鸿蒙天道道戒');
INSERT INTO `bg_items` VALUES ('1398', '鸿蒙天道腰带');
INSERT INTO `bg_items` VALUES ('1399', '鸿蒙天道道靴');
INSERT INTO `bg_items` VALUES ('1400', '留空');
INSERT INTO `bg_items` VALUES ('1401', '神铸·无上武神');
INSERT INTO `bg_items` VALUES ('1402', '神铸·无上武神战甲(男)');
INSERT INTO `bg_items` VALUES ('1403', '神铸·无上武神战衣(女)');
INSERT INTO `bg_items` VALUES ('1404', '神铸·无上武神战盔');
INSERT INTO `bg_items` VALUES ('1405', '神铸·无上武神项链');
INSERT INTO `bg_items` VALUES ('1406', '神铸·无上武神护腕');
INSERT INTO `bg_items` VALUES ('1407', '神铸·无上武神战戒');
INSERT INTO `bg_items` VALUES ('1408', '神铸·无上武神腰带');
INSERT INTO `bg_items` VALUES ('1409', '神铸·无上武神战靴');
INSERT INTO `bg_items` VALUES ('1410', '留空');
INSERT INTO `bg_items` VALUES ('1411', '神铸·无上法圣');
INSERT INTO `bg_items` VALUES ('1412', '神铸·无上法圣魔袍(男)');
INSERT INTO `bg_items` VALUES ('1413', '神铸·无上法圣法袍(女)');
INSERT INTO `bg_items` VALUES ('1414', '神铸·无上法圣魔盔');
INSERT INTO `bg_items` VALUES ('1415', '神铸·无上法圣项链');
INSERT INTO `bg_items` VALUES ('1416', '神铸·无上法圣护腕');
INSERT INTO `bg_items` VALUES ('1417', '神铸·无上法圣魔戒');
INSERT INTO `bg_items` VALUES ('1418', '神铸·无上法圣腰带');
INSERT INTO `bg_items` VALUES ('1419', '神铸·无上法圣魔靴');
INSERT INTO `bg_items` VALUES ('1420', '留空');
INSERT INTO `bg_items` VALUES ('1421', '神铸·无上道圣');
INSERT INTO `bg_items` VALUES ('1422', '神铸·无上道圣道袍(男)');
INSERT INTO `bg_items` VALUES ('1423', '神铸·无上道圣道衣(女)');
INSERT INTO `bg_items` VALUES ('1424', '神铸·无上道圣道盔');
INSERT INTO `bg_items` VALUES ('1425', '神铸·无上道圣项链');
INSERT INTO `bg_items` VALUES ('1426', '神铸·无上道圣护腕');
INSERT INTO `bg_items` VALUES ('1427', '神铸·无上道圣道戒');
INSERT INTO `bg_items` VALUES ('1428', '神铸·无上道圣腰带');
INSERT INTO `bg_items` VALUES ('1429', '神铸·无上道圣道靴');
INSERT INTO `bg_items` VALUES ('1430', '留空');
INSERT INTO `bg_items` VALUES ('1431', '留空');
INSERT INTO `bg_items` VALUES ('1432', '留空');
INSERT INTO `bg_items` VALUES ('1433', '留空');
INSERT INTO `bg_items` VALUES ('1434', '留空');
INSERT INTO `bg_items` VALUES ('1435', '留空');
INSERT INTO `bg_items` VALUES ('1436', '留空');
INSERT INTO `bg_items` VALUES ('1437', '留空');
INSERT INTO `bg_items` VALUES ('1438', '留空');
INSERT INTO `bg_items` VALUES ('1439', '留空');
INSERT INTO `bg_items` VALUES ('1440', '留空');
INSERT INTO `bg_items` VALUES ('1441', '留空');
INSERT INTO `bg_items` VALUES ('1442', '留空');
INSERT INTO `bg_items` VALUES ('1443', '留空');
INSERT INTO `bg_items` VALUES ('1444', '留空');
INSERT INTO `bg_items` VALUES ('1445', '留空');
INSERT INTO `bg_items` VALUES ('1446', '留空');
INSERT INTO `bg_items` VALUES ('1447', '留空');
INSERT INTO `bg_items` VALUES ('1448', '留空');
INSERT INTO `bg_items` VALUES ('1449', '留空');
INSERT INTO `bg_items` VALUES ('1450', '留空');
INSERT INTO `bg_items` VALUES ('1451', '留空');
INSERT INTO `bg_items` VALUES ('1452', '留空');
INSERT INTO `bg_items` VALUES ('1453', '留空');
INSERT INTO `bg_items` VALUES ('1454', '留空');
INSERT INTO `bg_items` VALUES ('1455', '留空');
INSERT INTO `bg_items` VALUES ('1456', '留空');
INSERT INTO `bg_items` VALUES ('1457', '留空');
INSERT INTO `bg_items` VALUES ('1458', '留空');
INSERT INTO `bg_items` VALUES ('1459', '留空');
INSERT INTO `bg_items` VALUES ('1460', '留空');
INSERT INTO `bg_items` VALUES ('1461', '留空');
INSERT INTO `bg_items` VALUES ('1462', '留空');
INSERT INTO `bg_items` VALUES ('1463', '留空');
INSERT INTO `bg_items` VALUES ('1464', '留空');
INSERT INTO `bg_items` VALUES ('1465', '留空');
INSERT INTO `bg_items` VALUES ('1466', '留空');
INSERT INTO `bg_items` VALUES ('1467', '留空');
INSERT INTO `bg_items` VALUES ('1468', '留空');
INSERT INTO `bg_items` VALUES ('1469', '留空');
INSERT INTO `bg_items` VALUES ('1470', '留空');
INSERT INTO `bg_items` VALUES ('1471', '留空');
INSERT INTO `bg_items` VALUES ('1472', '留空');
INSERT INTO `bg_items` VALUES ('1473', '留空');
INSERT INTO `bg_items` VALUES ('1474', '留空');
INSERT INTO `bg_items` VALUES ('1475', '留空');
INSERT INTO `bg_items` VALUES ('1476', '留空');
INSERT INTO `bg_items` VALUES ('1477', '留空');
INSERT INTO `bg_items` VALUES ('1478', '留空');
INSERT INTO `bg_items` VALUES ('1479', '留空');
INSERT INTO `bg_items` VALUES ('1480', '留空');
INSERT INTO `bg_items` VALUES ('1481', '留空');
INSERT INTO `bg_items` VALUES ('1482', '留空');
INSERT INTO `bg_items` VALUES ('1483', '留空');
INSERT INTO `bg_items` VALUES ('1484', '留空');
INSERT INTO `bg_items` VALUES ('1485', '留空');
INSERT INTO `bg_items` VALUES ('1486', '留空');
INSERT INTO `bg_items` VALUES ('1487', '留空');
INSERT INTO `bg_items` VALUES ('1488', '留空');
INSERT INTO `bg_items` VALUES ('1489', '留空');
INSERT INTO `bg_items` VALUES ('1490', '留空');
INSERT INTO `bg_items` VALUES ('1491', '留空');
INSERT INTO `bg_items` VALUES ('1492', '留空');
INSERT INTO `bg_items` VALUES ('1493', '留空');
INSERT INTO `bg_items` VALUES ('1494', '留空');
INSERT INTO `bg_items` VALUES ('1495', '留空');
INSERT INTO `bg_items` VALUES ('1496', '留空');
INSERT INTO `bg_items` VALUES ('1497', '留空');
INSERT INTO `bg_items` VALUES ('1498', '留空');
INSERT INTO `bg_items` VALUES ('1499', '留空');
INSERT INTO `bg_items` VALUES ('1500', '留空');
INSERT INTO `bg_items` VALUES ('1501', '留空');
INSERT INTO `bg_items` VALUES ('1502', '留空');
INSERT INTO `bg_items` VALUES ('1503', '留空');
INSERT INTO `bg_items` VALUES ('1504', '留空');
INSERT INTO `bg_items` VALUES ('1505', '留空');
INSERT INTO `bg_items` VALUES ('1506', '留空');
INSERT INTO `bg_items` VALUES ('1507', '留空');
INSERT INTO `bg_items` VALUES ('1508', '留空');
INSERT INTO `bg_items` VALUES ('1509', '留空');
INSERT INTO `bg_items` VALUES ('1510', '留空');
INSERT INTO `bg_items` VALUES ('1511', '留空');
INSERT INTO `bg_items` VALUES ('1512', '留空');
INSERT INTO `bg_items` VALUES ('1513', '留空');
INSERT INTO `bg_items` VALUES ('1514', '留空');
INSERT INTO `bg_items` VALUES ('1515', '留空');
INSERT INTO `bg_items` VALUES ('1516', '留空');
INSERT INTO `bg_items` VALUES ('1517', '留空');
INSERT INTO `bg_items` VALUES ('1518', '留空');
INSERT INTO `bg_items` VALUES ('1519', '留空');
INSERT INTO `bg_items` VALUES ('1520', '留空');
INSERT INTO `bg_items` VALUES ('1521', '留空');
INSERT INTO `bg_items` VALUES ('1522', '留空');
INSERT INTO `bg_items` VALUES ('1523', '留空');
INSERT INTO `bg_items` VALUES ('1524', '留空');
INSERT INTO `bg_items` VALUES ('1525', '留空');
INSERT INTO `bg_items` VALUES ('1526', '留空');
INSERT INTO `bg_items` VALUES ('1527', '留空');
INSERT INTO `bg_items` VALUES ('1528', '留空');
INSERT INTO `bg_items` VALUES ('1529', '留空');
INSERT INTO `bg_items` VALUES ('1530', '留空');
INSERT INTO `bg_items` VALUES ('1531', '留空');
INSERT INTO `bg_items` VALUES ('1532', '留空');
INSERT INTO `bg_items` VALUES ('1533', '留空');
INSERT INTO `bg_items` VALUES ('1534', '留空');
INSERT INTO `bg_items` VALUES ('1535', '留空');
INSERT INTO `bg_items` VALUES ('1536', '留空');
INSERT INTO `bg_items` VALUES ('1537', '留空');
INSERT INTO `bg_items` VALUES ('1538', '留空');
INSERT INTO `bg_items` VALUES ('1539', '留空');
INSERT INTO `bg_items` VALUES ('1540', '留空');
INSERT INTO `bg_items` VALUES ('1541', '留空');
INSERT INTO `bg_items` VALUES ('1542', '留空');
INSERT INTO `bg_items` VALUES ('1543', '留空');
INSERT INTO `bg_items` VALUES ('1544', '留空');
INSERT INTO `bg_items` VALUES ('1545', '留空');
INSERT INTO `bg_items` VALUES ('1546', '留空');
INSERT INTO `bg_items` VALUES ('1547', '留空');
INSERT INTO `bg_items` VALUES ('1548', '留空');
INSERT INTO `bg_items` VALUES ('1549', '留空');
INSERT INTO `bg_items` VALUES ('1550', '留空');
INSERT INTO `bg_items` VALUES ('1551', '留空');
INSERT INTO `bg_items` VALUES ('1552', '留空');
INSERT INTO `bg_items` VALUES ('1553', '留空');
INSERT INTO `bg_items` VALUES ('1554', '留空');
INSERT INTO `bg_items` VALUES ('1555', '留空');
INSERT INTO `bg_items` VALUES ('1556', '留空');
INSERT INTO `bg_items` VALUES ('1557', '留空');
INSERT INTO `bg_items` VALUES ('1558', '留空');
INSERT INTO `bg_items` VALUES ('1559', '留空');
INSERT INTO `bg_items` VALUES ('1560', '留空');
INSERT INTO `bg_items` VALUES ('1561', '留空');
INSERT INTO `bg_items` VALUES ('1562', '留空');
INSERT INTO `bg_items` VALUES ('1563', '留空');
INSERT INTO `bg_items` VALUES ('1564', '留空');
INSERT INTO `bg_items` VALUES ('1565', '留空');
INSERT INTO `bg_items` VALUES ('1566', '留空');
INSERT INTO `bg_items` VALUES ('1567', '留空');
INSERT INTO `bg_items` VALUES ('1568', '留空');
INSERT INTO `bg_items` VALUES ('1569', '留空');
INSERT INTO `bg_items` VALUES ('1570', '留空');
INSERT INTO `bg_items` VALUES ('1571', '留空');
INSERT INTO `bg_items` VALUES ('1572', '留空');
INSERT INTO `bg_items` VALUES ('1573', '留空');
INSERT INTO `bg_items` VALUES ('1574', '留空');
INSERT INTO `bg_items` VALUES ('1575', '留空');
INSERT INTO `bg_items` VALUES ('1576', '留空');
INSERT INTO `bg_items` VALUES ('1577', '留空');
INSERT INTO `bg_items` VALUES ('1578', '留空');
INSERT INTO `bg_items` VALUES ('1579', '留空');
INSERT INTO `bg_items` VALUES ('1580', '留空');
INSERT INTO `bg_items` VALUES ('1581', '留空');
INSERT INTO `bg_items` VALUES ('1582', '留空');
INSERT INTO `bg_items` VALUES ('1583', '留空');
INSERT INTO `bg_items` VALUES ('1584', '留空');
INSERT INTO `bg_items` VALUES ('1585', '留空');
INSERT INTO `bg_items` VALUES ('1586', '留空');
INSERT INTO `bg_items` VALUES ('1587', '留空');
INSERT INTO `bg_items` VALUES ('1588', '留空');
INSERT INTO `bg_items` VALUES ('1589', '留空');
INSERT INTO `bg_items` VALUES ('1590', '留空');
INSERT INTO `bg_items` VALUES ('1591', '留空');
INSERT INTO `bg_items` VALUES ('1592', '留空');
INSERT INTO `bg_items` VALUES ('1593', '留空');
INSERT INTO `bg_items` VALUES ('1594', '留空');
INSERT INTO `bg_items` VALUES ('1595', '留空');
INSERT INTO `bg_items` VALUES ('1596', '留空');
INSERT INTO `bg_items` VALUES ('1597', '留空');
INSERT INTO `bg_items` VALUES ('1598', '留空');
INSERT INTO `bg_items` VALUES ('1599', '留空');
INSERT INTO `bg_items` VALUES ('1600', '留空');
INSERT INTO `bg_items` VALUES ('1601', '留空');
INSERT INTO `bg_items` VALUES ('1602', '留空');
INSERT INTO `bg_items` VALUES ('1603', '留空');
INSERT INTO `bg_items` VALUES ('1604', '留空');
INSERT INTO `bg_items` VALUES ('1605', '留空');
INSERT INTO `bg_items` VALUES ('1606', '留空');
INSERT INTO `bg_items` VALUES ('1607', '留空');
INSERT INTO `bg_items` VALUES ('1608', '留空');
INSERT INTO `bg_items` VALUES ('1609', '留空');
INSERT INTO `bg_items` VALUES ('1610', '留空');
INSERT INTO `bg_items` VALUES ('1611', '留空');
INSERT INTO `bg_items` VALUES ('1612', '留空');
INSERT INTO `bg_items` VALUES ('1613', '留空');
INSERT INTO `bg_items` VALUES ('1614', '留空');
INSERT INTO `bg_items` VALUES ('1615', '留空');
INSERT INTO `bg_items` VALUES ('1616', '留空');
INSERT INTO `bg_items` VALUES ('1617', '留空');
INSERT INTO `bg_items` VALUES ('1618', '留空');
INSERT INTO `bg_items` VALUES ('1619', '留空');
INSERT INTO `bg_items` VALUES ('1620', '留空');
INSERT INTO `bg_items` VALUES ('1621', '留空');
INSERT INTO `bg_items` VALUES ('1622', '留空');
INSERT INTO `bg_items` VALUES ('1623', '留空');
INSERT INTO `bg_items` VALUES ('1624', '留空');
INSERT INTO `bg_items` VALUES ('1625', '留空');
INSERT INTO `bg_items` VALUES ('1626', '留空');
INSERT INTO `bg_items` VALUES ('1627', '留空');
INSERT INTO `bg_items` VALUES ('1628', '留空');
INSERT INTO `bg_items` VALUES ('1629', '留空');
INSERT INTO `bg_items` VALUES ('1630', '留空');
INSERT INTO `bg_items` VALUES ('1631', '留空');
INSERT INTO `bg_items` VALUES ('1632', '留空');
INSERT INTO `bg_items` VALUES ('1633', '留空');
INSERT INTO `bg_items` VALUES ('1634', '留空');
INSERT INTO `bg_items` VALUES ('1635', '留空');
INSERT INTO `bg_items` VALUES ('1636', '留空');
INSERT INTO `bg_items` VALUES ('1637', '留空');
INSERT INTO `bg_items` VALUES ('1638', '留空');
INSERT INTO `bg_items` VALUES ('1639', '留空');
INSERT INTO `bg_items` VALUES ('1640', '留空');
INSERT INTO `bg_items` VALUES ('1641', '留空');
INSERT INTO `bg_items` VALUES ('1642', '留空');
INSERT INTO `bg_items` VALUES ('1643', '留空');
INSERT INTO `bg_items` VALUES ('1644', '留空');
INSERT INTO `bg_items` VALUES ('1645', '留空');
INSERT INTO `bg_items` VALUES ('1646', '留空');
INSERT INTO `bg_items` VALUES ('1647', '留空');
INSERT INTO `bg_items` VALUES ('1648', '留空');
INSERT INTO `bg_items` VALUES ('1649', '留空');
INSERT INTO `bg_items` VALUES ('1650', '留空');
INSERT INTO `bg_items` VALUES ('1651', '留空');
INSERT INTO `bg_items` VALUES ('1652', '留空');
INSERT INTO `bg_items` VALUES ('1653', '留空');
INSERT INTO `bg_items` VALUES ('1654', '留空');
INSERT INTO `bg_items` VALUES ('1655', '留空');
INSERT INTO `bg_items` VALUES ('1656', '留空');
INSERT INTO `bg_items` VALUES ('1657', '留空');
INSERT INTO `bg_items` VALUES ('1658', '留空');
INSERT INTO `bg_items` VALUES ('1659', '留空');
INSERT INTO `bg_items` VALUES ('1660', '留空');
INSERT INTO `bg_items` VALUES ('1661', '留空');
INSERT INTO `bg_items` VALUES ('1662', '留空');
INSERT INTO `bg_items` VALUES ('1663', '留空');
INSERT INTO `bg_items` VALUES ('1664', '留空');
INSERT INTO `bg_items` VALUES ('1665', '留空');
INSERT INTO `bg_items` VALUES ('1666', '留空');
INSERT INTO `bg_items` VALUES ('1667', '留空');
INSERT INTO `bg_items` VALUES ('1668', '留空');
INSERT INTO `bg_items` VALUES ('1669', '留空');
INSERT INTO `bg_items` VALUES ('1670', '留空');
INSERT INTO `bg_items` VALUES ('1671', '留空');
INSERT INTO `bg_items` VALUES ('1672', '留空');
INSERT INTO `bg_items` VALUES ('1673', '留空');
INSERT INTO `bg_items` VALUES ('1674', '留空');
INSERT INTO `bg_items` VALUES ('1675', '留空');
INSERT INTO `bg_items` VALUES ('1676', '留空');
INSERT INTO `bg_items` VALUES ('1677', '留空');
INSERT INTO `bg_items` VALUES ('1678', '留空');
INSERT INTO `bg_items` VALUES ('1679', '留空');
INSERT INTO `bg_items` VALUES ('1680', '留空');
INSERT INTO `bg_items` VALUES ('1681', '留空');
INSERT INTO `bg_items` VALUES ('1682', '留空');
INSERT INTO `bg_items` VALUES ('1683', '留空');
INSERT INTO `bg_items` VALUES ('1684', '留空');
INSERT INTO `bg_items` VALUES ('1685', '留空');
INSERT INTO `bg_items` VALUES ('1686', '留空');
INSERT INTO `bg_items` VALUES ('1687', '留空');
INSERT INTO `bg_items` VALUES ('1688', '留空');
INSERT INTO `bg_items` VALUES ('1689', '留空');
INSERT INTO `bg_items` VALUES ('1690', '留空');
INSERT INTO `bg_items` VALUES ('1691', '留空');
INSERT INTO `bg_items` VALUES ('1692', '留空');
INSERT INTO `bg_items` VALUES ('1693', '留空');
INSERT INTO `bg_items` VALUES ('1694', '留空');
INSERT INTO `bg_items` VALUES ('1695', '留空');
INSERT INTO `bg_items` VALUES ('1696', '留空');
INSERT INTO `bg_items` VALUES ('1697', '留空');
INSERT INTO `bg_items` VALUES ('1698', '留空');
INSERT INTO `bg_items` VALUES ('1699', '留空');
INSERT INTO `bg_items` VALUES ('1700', '留空');
INSERT INTO `bg_items` VALUES ('1701', '留空');
INSERT INTO `bg_items` VALUES ('1702', '留空');
INSERT INTO `bg_items` VALUES ('1703', '留空');
INSERT INTO `bg_items` VALUES ('1704', '留空');
INSERT INTO `bg_items` VALUES ('1705', '留空');
INSERT INTO `bg_items` VALUES ('1706', '留空');
INSERT INTO `bg_items` VALUES ('1707', '留空');
INSERT INTO `bg_items` VALUES ('1708', '留空');
INSERT INTO `bg_items` VALUES ('1709', '留空');
INSERT INTO `bg_items` VALUES ('1710', '留空');
INSERT INTO `bg_items` VALUES ('1711', '留空');
INSERT INTO `bg_items` VALUES ('1712', '留空');
INSERT INTO `bg_items` VALUES ('1713', '留空');
INSERT INTO `bg_items` VALUES ('1714', '留空');
INSERT INTO `bg_items` VALUES ('1715', '留空');
INSERT INTO `bg_items` VALUES ('1716', '留空');
INSERT INTO `bg_items` VALUES ('1717', '留空');
INSERT INTO `bg_items` VALUES ('1718', '留空');
INSERT INTO `bg_items` VALUES ('1719', '留空');
INSERT INTO `bg_items` VALUES ('1720', '留空');
INSERT INTO `bg_items` VALUES ('1721', '留空');
INSERT INTO `bg_items` VALUES ('1722', '留空');
INSERT INTO `bg_items` VALUES ('1723', '留空');
INSERT INTO `bg_items` VALUES ('1724', '留空');
INSERT INTO `bg_items` VALUES ('1725', '留空');
INSERT INTO `bg_items` VALUES ('1726', '留空');
INSERT INTO `bg_items` VALUES ('1727', '留空');
INSERT INTO `bg_items` VALUES ('1728', '留空');
INSERT INTO `bg_items` VALUES ('1729', '留空');
INSERT INTO `bg_items` VALUES ('1730', '留空');
INSERT INTO `bg_items` VALUES ('1731', '留空');
INSERT INTO `bg_items` VALUES ('1732', '留空');
INSERT INTO `bg_items` VALUES ('1733', '留空');
INSERT INTO `bg_items` VALUES ('1734', '留空');
INSERT INTO `bg_items` VALUES ('1735', '留空');
INSERT INTO `bg_items` VALUES ('1736', '留空');
INSERT INTO `bg_items` VALUES ('1737', '留空');
INSERT INTO `bg_items` VALUES ('1738', '留空');
INSERT INTO `bg_items` VALUES ('1739', '留空');
INSERT INTO `bg_items` VALUES ('1740', '留空');
INSERT INTO `bg_items` VALUES ('1741', '留空');
INSERT INTO `bg_items` VALUES ('1742', '留空');
INSERT INTO `bg_items` VALUES ('1743', '留空');
INSERT INTO `bg_items` VALUES ('1744', '留空');
INSERT INTO `bg_items` VALUES ('1745', '留空');
INSERT INTO `bg_items` VALUES ('1746', '留空');
INSERT INTO `bg_items` VALUES ('1747', '留空');
INSERT INTO `bg_items` VALUES ('1748', '留空');
INSERT INTO `bg_items` VALUES ('1749', '留空');
INSERT INTO `bg_items` VALUES ('1750', '留空');
INSERT INTO `bg_items` VALUES ('1751', '留空');
INSERT INTO `bg_items` VALUES ('1752', '留空');
INSERT INTO `bg_items` VALUES ('1753', '留空');
INSERT INTO `bg_items` VALUES ('1754', '留空');
INSERT INTO `bg_items` VALUES ('1755', '留空');
INSERT INTO `bg_items` VALUES ('1756', '留空');
INSERT INTO `bg_items` VALUES ('1757', '留空');
INSERT INTO `bg_items` VALUES ('1758', '留空');
INSERT INTO `bg_items` VALUES ('1759', '留空');
INSERT INTO `bg_items` VALUES ('1760', '留空');
INSERT INTO `bg_items` VALUES ('1761', '留空');
INSERT INTO `bg_items` VALUES ('1762', '留空');
INSERT INTO `bg_items` VALUES ('1763', '留空');
INSERT INTO `bg_items` VALUES ('1764', '留空');
INSERT INTO `bg_items` VALUES ('1765', '留空');
INSERT INTO `bg_items` VALUES ('1766', '留空');
INSERT INTO `bg_items` VALUES ('1767', '留空');
INSERT INTO `bg_items` VALUES ('1768', '留空');
INSERT INTO `bg_items` VALUES ('1769', '留空');
INSERT INTO `bg_items` VALUES ('1770', '留空');
INSERT INTO `bg_items` VALUES ('1771', '留空');
INSERT INTO `bg_items` VALUES ('1772', '留空');
INSERT INTO `bg_items` VALUES ('1773', '留空');
INSERT INTO `bg_items` VALUES ('1774', '留空');
INSERT INTO `bg_items` VALUES ('1775', '留空');
INSERT INTO `bg_items` VALUES ('1776', '留空');
INSERT INTO `bg_items` VALUES ('1777', '留空');
INSERT INTO `bg_items` VALUES ('1778', '留空');
INSERT INTO `bg_items` VALUES ('1779', '留空');
INSERT INTO `bg_items` VALUES ('1780', '留空');
INSERT INTO `bg_items` VALUES ('1781', '留空');
INSERT INTO `bg_items` VALUES ('1782', '留空');
INSERT INTO `bg_items` VALUES ('1783', '留空');
INSERT INTO `bg_items` VALUES ('1784', '留空');
INSERT INTO `bg_items` VALUES ('1785', '留空');
INSERT INTO `bg_items` VALUES ('1786', '留空');
INSERT INTO `bg_items` VALUES ('1787', '留空');
INSERT INTO `bg_items` VALUES ('1788', '留空');
INSERT INTO `bg_items` VALUES ('1789', '留空');
INSERT INTO `bg_items` VALUES ('1790', '留空');
INSERT INTO `bg_items` VALUES ('1791', '留空');
INSERT INTO `bg_items` VALUES ('1792', '留空');
INSERT INTO `bg_items` VALUES ('1793', '留空');
INSERT INTO `bg_items` VALUES ('1794', '留空');
INSERT INTO `bg_items` VALUES ('1795', '留空');
INSERT INTO `bg_items` VALUES ('1796', '留空');
INSERT INTO `bg_items` VALUES ('1797', '留空');
INSERT INTO `bg_items` VALUES ('1798', '留空');
INSERT INTO `bg_items` VALUES ('1799', '留空');
INSERT INTO `bg_items` VALUES ('1800', '留空');
INSERT INTO `bg_items` VALUES ('1801', '留空');
INSERT INTO `bg_items` VALUES ('1802', '留空');
INSERT INTO `bg_items` VALUES ('1803', '留空');
INSERT INTO `bg_items` VALUES ('1804', '留空');
INSERT INTO `bg_items` VALUES ('1805', '留空');
INSERT INTO `bg_items` VALUES ('1806', '留空');
INSERT INTO `bg_items` VALUES ('1807', '留空');
INSERT INTO `bg_items` VALUES ('1808', '留空');
INSERT INTO `bg_items` VALUES ('1809', '留空');
INSERT INTO `bg_items` VALUES ('1810', '留空');
INSERT INTO `bg_items` VALUES ('1811', '留空');
INSERT INTO `bg_items` VALUES ('1812', '留空');
INSERT INTO `bg_items` VALUES ('1813', '留空');
INSERT INTO `bg_items` VALUES ('1814', '留空');
INSERT INTO `bg_items` VALUES ('1815', '留空');
INSERT INTO `bg_items` VALUES ('1816', '留空');
INSERT INTO `bg_items` VALUES ('1817', '留空');
INSERT INTO `bg_items` VALUES ('1818', '留空');
INSERT INTO `bg_items` VALUES ('1819', '留空');
INSERT INTO `bg_items` VALUES ('1820', '留空');
INSERT INTO `bg_items` VALUES ('1821', '留空');
INSERT INTO `bg_items` VALUES ('1822', '留空');
INSERT INTO `bg_items` VALUES ('1823', '留空');
INSERT INTO `bg_items` VALUES ('1824', '留空');
INSERT INTO `bg_items` VALUES ('1825', '留空');
INSERT INTO `bg_items` VALUES ('1826', '留空');
INSERT INTO `bg_items` VALUES ('1827', '留空');
INSERT INTO `bg_items` VALUES ('1828', '留空');
INSERT INTO `bg_items` VALUES ('1829', '留空');
INSERT INTO `bg_items` VALUES ('1830', '留空');
INSERT INTO `bg_items` VALUES ('1831', '留空');
INSERT INTO `bg_items` VALUES ('1832', '留空');
INSERT INTO `bg_items` VALUES ('1833', '留空');
INSERT INTO `bg_items` VALUES ('1834', '留空');
INSERT INTO `bg_items` VALUES ('1835', '留空');
INSERT INTO `bg_items` VALUES ('1836', '留空');
INSERT INTO `bg_items` VALUES ('1837', '留空');
INSERT INTO `bg_items` VALUES ('1838', '留空');
INSERT INTO `bg_items` VALUES ('1839', '留空');
INSERT INTO `bg_items` VALUES ('1840', '留空');
INSERT INTO `bg_items` VALUES ('1841', '留空');
INSERT INTO `bg_items` VALUES ('1842', '留空');
INSERT INTO `bg_items` VALUES ('1843', '留空');
INSERT INTO `bg_items` VALUES ('1844', '留空');
INSERT INTO `bg_items` VALUES ('1845', '留空');
INSERT INTO `bg_items` VALUES ('1846', '留空');
INSERT INTO `bg_items` VALUES ('1847', '留空');
INSERT INTO `bg_items` VALUES ('1848', '留空');
INSERT INTO `bg_items` VALUES ('1849', '留空');
INSERT INTO `bg_items` VALUES ('1850', '留空');
INSERT INTO `bg_items` VALUES ('1851', '留空');
INSERT INTO `bg_items` VALUES ('1852', '留空');
INSERT INTO `bg_items` VALUES ('1853', '留空');
INSERT INTO `bg_items` VALUES ('1854', '留空');
INSERT INTO `bg_items` VALUES ('1855', '留空');
INSERT INTO `bg_items` VALUES ('1856', '留空');
INSERT INTO `bg_items` VALUES ('1857', '留空');
INSERT INTO `bg_items` VALUES ('1858', '留空');
INSERT INTO `bg_items` VALUES ('1859', '留空');
INSERT INTO `bg_items` VALUES ('1860', '留空');
INSERT INTO `bg_items` VALUES ('1861', '留空');
INSERT INTO `bg_items` VALUES ('1862', '留空');
INSERT INTO `bg_items` VALUES ('1863', '留空');
INSERT INTO `bg_items` VALUES ('1864', '留空');
INSERT INTO `bg_items` VALUES ('1865', '留空');
INSERT INTO `bg_items` VALUES ('1866', '留空');
INSERT INTO `bg_items` VALUES ('1867', '留空');
INSERT INTO `bg_items` VALUES ('1868', '留空');
INSERT INTO `bg_items` VALUES ('1869', '留空');
INSERT INTO `bg_items` VALUES ('1870', '留空');
INSERT INTO `bg_items` VALUES ('1871', '留空');
INSERT INTO `bg_items` VALUES ('1872', '留空');
INSERT INTO `bg_items` VALUES ('1873', '留空');
INSERT INTO `bg_items` VALUES ('1874', '留空');
INSERT INTO `bg_items` VALUES ('1875', '留空');
INSERT INTO `bg_items` VALUES ('1876', '留空');
INSERT INTO `bg_items` VALUES ('1877', '留空');
INSERT INTO `bg_items` VALUES ('1878', '留空');
INSERT INTO `bg_items` VALUES ('1879', '留空');
INSERT INTO `bg_items` VALUES ('1880', '留空');
INSERT INTO `bg_items` VALUES ('1881', '留空');
INSERT INTO `bg_items` VALUES ('1882', '留空');
INSERT INTO `bg_items` VALUES ('1883', '留空');
INSERT INTO `bg_items` VALUES ('1884', '留空');
INSERT INTO `bg_items` VALUES ('1885', '留空');
INSERT INTO `bg_items` VALUES ('1886', '留空');
INSERT INTO `bg_items` VALUES ('1887', '留空');
INSERT INTO `bg_items` VALUES ('1888', '留空');
INSERT INTO `bg_items` VALUES ('1889', '留空');
INSERT INTO `bg_items` VALUES ('1890', '留空');
INSERT INTO `bg_items` VALUES ('1891', '留空');
INSERT INTO `bg_items` VALUES ('1892', '留空');
INSERT INTO `bg_items` VALUES ('1893', '留空');
INSERT INTO `bg_items` VALUES ('1894', '留空');
INSERT INTO `bg_items` VALUES ('1895', '留空');
INSERT INTO `bg_items` VALUES ('1896', '留空');
INSERT INTO `bg_items` VALUES ('1897', '留空');
INSERT INTO `bg_items` VALUES ('1898', '留空');
INSERT INTO `bg_items` VALUES ('1899', '留空');
INSERT INTO `bg_items` VALUES ('1900', '留空');
INSERT INTO `bg_items` VALUES ('1901', '留空');
INSERT INTO `bg_items` VALUES ('1902', '留空');
INSERT INTO `bg_items` VALUES ('1903', '留空');
INSERT INTO `bg_items` VALUES ('1904', '留空');
INSERT INTO `bg_items` VALUES ('1905', '留空');
INSERT INTO `bg_items` VALUES ('1906', '留空');
INSERT INTO `bg_items` VALUES ('1907', '留空');
INSERT INTO `bg_items` VALUES ('1908', '留空');
INSERT INTO `bg_items` VALUES ('1909', '留空');
INSERT INTO `bg_items` VALUES ('1910', '留空');
INSERT INTO `bg_items` VALUES ('1911', '留空');
INSERT INTO `bg_items` VALUES ('1912', '留空');
INSERT INTO `bg_items` VALUES ('1913', '留空');
INSERT INTO `bg_items` VALUES ('1914', '留空');
INSERT INTO `bg_items` VALUES ('1915', '留空');
INSERT INTO `bg_items` VALUES ('1916', '留空');
INSERT INTO `bg_items` VALUES ('1917', '留空');
INSERT INTO `bg_items` VALUES ('1918', '留空');
INSERT INTO `bg_items` VALUES ('1919', '留空');
INSERT INTO `bg_items` VALUES ('1920', '留空');
INSERT INTO `bg_items` VALUES ('1921', '留空');
INSERT INTO `bg_items` VALUES ('1922', '留空');
INSERT INTO `bg_items` VALUES ('1923', '留空');
INSERT INTO `bg_items` VALUES ('1924', '留空');
INSERT INTO `bg_items` VALUES ('1925', '留空');
INSERT INTO `bg_items` VALUES ('1926', '留空');
INSERT INTO `bg_items` VALUES ('1927', '留空');
INSERT INTO `bg_items` VALUES ('1928', '留空');
INSERT INTO `bg_items` VALUES ('1929', '留空');
INSERT INTO `bg_items` VALUES ('1930', '留空');
INSERT INTO `bg_items` VALUES ('1931', '留空');
INSERT INTO `bg_items` VALUES ('1932', '留空');
INSERT INTO `bg_items` VALUES ('1933', '留空');
INSERT INTO `bg_items` VALUES ('1934', '留空');
INSERT INTO `bg_items` VALUES ('1935', '留空');
INSERT INTO `bg_items` VALUES ('1936', '留空');
INSERT INTO `bg_items` VALUES ('1937', '留空');
INSERT INTO `bg_items` VALUES ('1938', '留空');
INSERT INTO `bg_items` VALUES ('1939', '留空');
INSERT INTO `bg_items` VALUES ('1940', '留空');
INSERT INTO `bg_items` VALUES ('1941', '留空');
INSERT INTO `bg_items` VALUES ('1942', '留空');
INSERT INTO `bg_items` VALUES ('1943', '留空');
INSERT INTO `bg_items` VALUES ('1944', '留空');
INSERT INTO `bg_items` VALUES ('1945', '留空');
INSERT INTO `bg_items` VALUES ('1946', '留空');
INSERT INTO `bg_items` VALUES ('1947', '留空');
INSERT INTO `bg_items` VALUES ('1948', '留空');
INSERT INTO `bg_items` VALUES ('1949', '留空');
INSERT INTO `bg_items` VALUES ('1950', '留空');
INSERT INTO `bg_items` VALUES ('1951', '留空');
INSERT INTO `bg_items` VALUES ('1952', '留空');
INSERT INTO `bg_items` VALUES ('1953', '留空');
INSERT INTO `bg_items` VALUES ('1954', '留空');
INSERT INTO `bg_items` VALUES ('1955', '留空');
INSERT INTO `bg_items` VALUES ('1956', '留空');
INSERT INTO `bg_items` VALUES ('1957', '留空');
INSERT INTO `bg_items` VALUES ('1958', '留空');
INSERT INTO `bg_items` VALUES ('1959', '留空');
INSERT INTO `bg_items` VALUES ('1960', '留空');
INSERT INTO `bg_items` VALUES ('1961', '留空');
INSERT INTO `bg_items` VALUES ('1962', '留空');
INSERT INTO `bg_items` VALUES ('1963', '留空');
INSERT INTO `bg_items` VALUES ('1964', '留空');
INSERT INTO `bg_items` VALUES ('1965', '留空');
INSERT INTO `bg_items` VALUES ('1966', '留空');
INSERT INTO `bg_items` VALUES ('1967', '留空');
INSERT INTO `bg_items` VALUES ('1968', '留空');
INSERT INTO `bg_items` VALUES ('1969', '留空');
INSERT INTO `bg_items` VALUES ('1970', '留空');
INSERT INTO `bg_items` VALUES ('1971', '留空');
INSERT INTO `bg_items` VALUES ('1972', '留空');
INSERT INTO `bg_items` VALUES ('1973', '留空');
INSERT INTO `bg_items` VALUES ('1974', '留空');
INSERT INTO `bg_items` VALUES ('1975', '留空');
INSERT INTO `bg_items` VALUES ('1976', '留空');
INSERT INTO `bg_items` VALUES ('1977', '留空');
INSERT INTO `bg_items` VALUES ('1978', '留空');
INSERT INTO `bg_items` VALUES ('1979', '留空');
INSERT INTO `bg_items` VALUES ('1980', '留空');
INSERT INTO `bg_items` VALUES ('1981', '留空');
INSERT INTO `bg_items` VALUES ('1982', '留空');
INSERT INTO `bg_items` VALUES ('1983', '留空');
INSERT INTO `bg_items` VALUES ('1984', '留空');
INSERT INTO `bg_items` VALUES ('1985', '留空');
INSERT INTO `bg_items` VALUES ('1986', '留空');
INSERT INTO `bg_items` VALUES ('1987', '留空');
INSERT INTO `bg_items` VALUES ('1988', '留空');
INSERT INTO `bg_items` VALUES ('1989', '留空');
INSERT INTO `bg_items` VALUES ('1990', '留空');
INSERT INTO `bg_items` VALUES ('1991', '留空');
INSERT INTO `bg_items` VALUES ('1992', '留空');
INSERT INTO `bg_items` VALUES ('1993', '留空');
INSERT INTO `bg_items` VALUES ('1994', '留空');
INSERT INTO `bg_items` VALUES ('1995', '留空');
INSERT INTO `bg_items` VALUES ('1996', '留空');
INSERT INTO `bg_items` VALUES ('1997', '留空');
INSERT INTO `bg_items` VALUES ('1998', '留空');
INSERT INTO `bg_items` VALUES ('1999', '留空');
INSERT INTO `bg_items` VALUES ('2000', '留空');
INSERT INTO `bg_items` VALUES ('2001', '留空');
INSERT INTO `bg_items` VALUES ('2002', '留空');
INSERT INTO `bg_items` VALUES ('2003', '留空');
INSERT INTO `bg_items` VALUES ('2004', '留空');
INSERT INTO `bg_items` VALUES ('2005', '留空');
INSERT INTO `bg_items` VALUES ('2006', '留空');
INSERT INTO `bg_items` VALUES ('2007', '留空');
INSERT INTO `bg_items` VALUES ('2008', '留空');
INSERT INTO `bg_items` VALUES ('2009', '留空');
INSERT INTO `bg_items` VALUES ('2010', '留空');
INSERT INTO `bg_items` VALUES ('2011', '留空');
INSERT INTO `bg_items` VALUES ('2012', '留空');
INSERT INTO `bg_items` VALUES ('2013', '留空');
INSERT INTO `bg_items` VALUES ('2014', '留空');
INSERT INTO `bg_items` VALUES ('2015', '留空');
INSERT INTO `bg_items` VALUES ('2016', '留空');
INSERT INTO `bg_items` VALUES ('2017', '留空');
INSERT INTO `bg_items` VALUES ('2018', '留空');
INSERT INTO `bg_items` VALUES ('2019', '留空');
INSERT INTO `bg_items` VALUES ('2020', '留空');
INSERT INTO `bg_items` VALUES ('2021', '留空');
INSERT INTO `bg_items` VALUES ('2022', '留空');
INSERT INTO `bg_items` VALUES ('2023', '留空');
INSERT INTO `bg_items` VALUES ('2024', '留空');
INSERT INTO `bg_items` VALUES ('2025', '留空');
INSERT INTO `bg_items` VALUES ('2026', '留空');
INSERT INTO `bg_items` VALUES ('2027', '留空');
INSERT INTO `bg_items` VALUES ('2028', '留空');
INSERT INTO `bg_items` VALUES ('2029', '留空');
INSERT INTO `bg_items` VALUES ('2030', '留空');
INSERT INTO `bg_items` VALUES ('2031', '留空');
INSERT INTO `bg_items` VALUES ('2032', '留空');
INSERT INTO `bg_items` VALUES ('2033', '留空');
INSERT INTO `bg_items` VALUES ('2034', '留空');
INSERT INTO `bg_items` VALUES ('2035', '留空');
INSERT INTO `bg_items` VALUES ('2036', '留空');
INSERT INTO `bg_items` VALUES ('2037', '留空');
INSERT INTO `bg_items` VALUES ('2038', '留空');
INSERT INTO `bg_items` VALUES ('2039', '留空');
INSERT INTO `bg_items` VALUES ('2040', '留空');
INSERT INTO `bg_items` VALUES ('2041', '留空');
INSERT INTO `bg_items` VALUES ('2042', '留空');
INSERT INTO `bg_items` VALUES ('2043', '留空');
INSERT INTO `bg_items` VALUES ('2044', '留空');
INSERT INTO `bg_items` VALUES ('2045', '留空');
INSERT INTO `bg_items` VALUES ('2046', '留空');
INSERT INTO `bg_items` VALUES ('2047', '留空');
INSERT INTO `bg_items` VALUES ('2048', '留空');
INSERT INTO `bg_items` VALUES ('2049', '留空');
INSERT INTO `bg_items` VALUES ('2050', '留空');
INSERT INTO `bg_items` VALUES ('2051', '留空');
INSERT INTO `bg_items` VALUES ('2052', '留空');
INSERT INTO `bg_items` VALUES ('2053', '留空');
INSERT INTO `bg_items` VALUES ('2054', '留空');
INSERT INTO `bg_items` VALUES ('2055', '留空');
INSERT INTO `bg_items` VALUES ('2056', '留空');
INSERT INTO `bg_items` VALUES ('2057', '留空');
INSERT INTO `bg_items` VALUES ('2058', '留空');
INSERT INTO `bg_items` VALUES ('2059', '留空');
INSERT INTO `bg_items` VALUES ('2060', '留空');
INSERT INTO `bg_items` VALUES ('2061', '留空');
INSERT INTO `bg_items` VALUES ('2062', '留空');
INSERT INTO `bg_items` VALUES ('2063', '留空');
INSERT INTO `bg_items` VALUES ('2064', '留空');
INSERT INTO `bg_items` VALUES ('2065', '留空');
INSERT INTO `bg_items` VALUES ('2066', '留空');
INSERT INTO `bg_items` VALUES ('2067', '留空');
INSERT INTO `bg_items` VALUES ('2068', '留空');
INSERT INTO `bg_items` VALUES ('2069', '留空');
INSERT INTO `bg_items` VALUES ('2070', '留空');
INSERT INTO `bg_items` VALUES ('2071', '留空');
INSERT INTO `bg_items` VALUES ('2072', '留空');
INSERT INTO `bg_items` VALUES ('2073', '留空');
INSERT INTO `bg_items` VALUES ('2074', '留空');
INSERT INTO `bg_items` VALUES ('2075', '留空');
INSERT INTO `bg_items` VALUES ('2076', '留空');
INSERT INTO `bg_items` VALUES ('2077', '留空');
INSERT INTO `bg_items` VALUES ('2078', '留空');
INSERT INTO `bg_items` VALUES ('2079', '留空');
INSERT INTO `bg_items` VALUES ('2080', '留空');
INSERT INTO `bg_items` VALUES ('2081', '留空');
INSERT INTO `bg_items` VALUES ('2082', '留空');
INSERT INTO `bg_items` VALUES ('2083', '留空');
INSERT INTO `bg_items` VALUES ('2084', '留空');
INSERT INTO `bg_items` VALUES ('2085', '留空');
INSERT INTO `bg_items` VALUES ('2086', '留空');
INSERT INTO `bg_items` VALUES ('2087', '留空');
INSERT INTO `bg_items` VALUES ('2088', '留空');
INSERT INTO `bg_items` VALUES ('2089', '留空');
INSERT INTO `bg_items` VALUES ('2090', '留空');
INSERT INTO `bg_items` VALUES ('2091', '留空');
INSERT INTO `bg_items` VALUES ('2092', '留空');
INSERT INTO `bg_items` VALUES ('2093', '留空');
INSERT INTO `bg_items` VALUES ('2094', '留空');
INSERT INTO `bg_items` VALUES ('2095', '留空');
INSERT INTO `bg_items` VALUES ('2096', '留空');
INSERT INTO `bg_items` VALUES ('2097', '留空');
INSERT INTO `bg_items` VALUES ('2098', '留空');
INSERT INTO `bg_items` VALUES ('2099', '留空');
INSERT INTO `bg_items` VALUES ('2100', '留空');
INSERT INTO `bg_items` VALUES ('2101', '留空');
INSERT INTO `bg_items` VALUES ('2102', '留空');
INSERT INTO `bg_items` VALUES ('2103', '留空');
INSERT INTO `bg_items` VALUES ('2104', '留空');
INSERT INTO `bg_items` VALUES ('2105', '留空');
INSERT INTO `bg_items` VALUES ('2106', '留空');
INSERT INTO `bg_items` VALUES ('2107', '留空');
INSERT INTO `bg_items` VALUES ('2108', '留空');
INSERT INTO `bg_items` VALUES ('2109', '留空');
INSERT INTO `bg_items` VALUES ('2110', '留空');
INSERT INTO `bg_items` VALUES ('2111', '留空');
INSERT INTO `bg_items` VALUES ('2112', '留空');
INSERT INTO `bg_items` VALUES ('2113', '留空');
INSERT INTO `bg_items` VALUES ('2114', '留空');
INSERT INTO `bg_items` VALUES ('2115', '留空');
INSERT INTO `bg_items` VALUES ('2116', '留空');
INSERT INTO `bg_items` VALUES ('2117', '留空');
INSERT INTO `bg_items` VALUES ('2118', '留空');
INSERT INTO `bg_items` VALUES ('2119', '留空');
INSERT INTO `bg_items` VALUES ('2120', '留空');
INSERT INTO `bg_items` VALUES ('2121', '留空');
INSERT INTO `bg_items` VALUES ('2122', '留空');
INSERT INTO `bg_items` VALUES ('2123', '留空');
INSERT INTO `bg_items` VALUES ('2124', '留空');
INSERT INTO `bg_items` VALUES ('2125', '留空');
INSERT INTO `bg_items` VALUES ('2126', '留空');
INSERT INTO `bg_items` VALUES ('2127', '留空');
INSERT INTO `bg_items` VALUES ('2128', '留空');
INSERT INTO `bg_items` VALUES ('2129', '留空');
INSERT INTO `bg_items` VALUES ('2130', '留空');
INSERT INTO `bg_items` VALUES ('2131', '留空');
INSERT INTO `bg_items` VALUES ('2132', '留空');
INSERT INTO `bg_items` VALUES ('2133', '留空');
INSERT INTO `bg_items` VALUES ('2134', '留空');
INSERT INTO `bg_items` VALUES ('2135', '留空');
INSERT INTO `bg_items` VALUES ('2136', '留空');
INSERT INTO `bg_items` VALUES ('2137', '留空');
INSERT INTO `bg_items` VALUES ('2138', '留空');
INSERT INTO `bg_items` VALUES ('2139', '留空');
INSERT INTO `bg_items` VALUES ('2140', '留空');
INSERT INTO `bg_items` VALUES ('2141', '留空');
INSERT INTO `bg_items` VALUES ('2142', '留空');
INSERT INTO `bg_items` VALUES ('2143', '留空');
INSERT INTO `bg_items` VALUES ('2144', '留空');
INSERT INTO `bg_items` VALUES ('2145', '留空');
INSERT INTO `bg_items` VALUES ('2146', '留空');
INSERT INTO `bg_items` VALUES ('2147', '留空');
INSERT INTO `bg_items` VALUES ('2148', '留空');
INSERT INTO `bg_items` VALUES ('2149', '留空');
INSERT INTO `bg_items` VALUES ('2150', '留空');
INSERT INTO `bg_items` VALUES ('2151', '留空');
INSERT INTO `bg_items` VALUES ('2152', '留空');
INSERT INTO `bg_items` VALUES ('2153', '留空');
INSERT INTO `bg_items` VALUES ('2154', '留空');
INSERT INTO `bg_items` VALUES ('2155', '留空');
INSERT INTO `bg_items` VALUES ('2156', '留空');
INSERT INTO `bg_items` VALUES ('2157', '留空');
INSERT INTO `bg_items` VALUES ('2158', '留空');
INSERT INTO `bg_items` VALUES ('2159', '留空');
INSERT INTO `bg_items` VALUES ('2160', '留空');
INSERT INTO `bg_items` VALUES ('2161', '留空');
INSERT INTO `bg_items` VALUES ('2162', '留空');
INSERT INTO `bg_items` VALUES ('2163', '留空');
INSERT INTO `bg_items` VALUES ('2164', '留空');
INSERT INTO `bg_items` VALUES ('2165', '留空');
INSERT INTO `bg_items` VALUES ('2166', '留空');
INSERT INTO `bg_items` VALUES ('2167', '留空');
INSERT INTO `bg_items` VALUES ('2168', '留空');
INSERT INTO `bg_items` VALUES ('2169', '留空');
INSERT INTO `bg_items` VALUES ('2170', '留空');
INSERT INTO `bg_items` VALUES ('2171', '留空');
INSERT INTO `bg_items` VALUES ('2172', '留空');
INSERT INTO `bg_items` VALUES ('2173', '留空');
INSERT INTO `bg_items` VALUES ('2174', '留空');
INSERT INTO `bg_items` VALUES ('2175', '留空');
INSERT INTO `bg_items` VALUES ('2176', '留空');
INSERT INTO `bg_items` VALUES ('2177', '留空');
INSERT INTO `bg_items` VALUES ('2178', '留空');
INSERT INTO `bg_items` VALUES ('2179', '留空');
INSERT INTO `bg_items` VALUES ('2180', '留空');
INSERT INTO `bg_items` VALUES ('2181', '留空');
INSERT INTO `bg_items` VALUES ('2182', '留空');
INSERT INTO `bg_items` VALUES ('2183', '留空');
INSERT INTO `bg_items` VALUES ('2184', '留空');
INSERT INTO `bg_items` VALUES ('2185', '留空');
INSERT INTO `bg_items` VALUES ('2186', '留空');
INSERT INTO `bg_items` VALUES ('2187', '留空');
INSERT INTO `bg_items` VALUES ('2188', '留空');
INSERT INTO `bg_items` VALUES ('2189', '留空');
INSERT INTO `bg_items` VALUES ('2190', '留空');
INSERT INTO `bg_items` VALUES ('2191', '留空');
INSERT INTO `bg_items` VALUES ('2192', '留空');
INSERT INTO `bg_items` VALUES ('2193', '留空');
INSERT INTO `bg_items` VALUES ('2194', '留空');
INSERT INTO `bg_items` VALUES ('2195', '留空');
INSERT INTO `bg_items` VALUES ('2196', '留空');
INSERT INTO `bg_items` VALUES ('2197', '留空');
INSERT INTO `bg_items` VALUES ('2198', '留空');
INSERT INTO `bg_items` VALUES ('2199', '留空');
INSERT INTO `bg_items` VALUES ('2200', '留空');
INSERT INTO `bg_items` VALUES ('2201', '留空');
INSERT INTO `bg_items` VALUES ('2202', '留空');
INSERT INTO `bg_items` VALUES ('2203', '留空');
INSERT INTO `bg_items` VALUES ('2204', '留空');
INSERT INTO `bg_items` VALUES ('2205', '留空');
INSERT INTO `bg_items` VALUES ('2206', '留空');
INSERT INTO `bg_items` VALUES ('2207', '留空');
INSERT INTO `bg_items` VALUES ('2208', '留空');
INSERT INTO `bg_items` VALUES ('2209', '留空');
INSERT INTO `bg_items` VALUES ('2210', '留空');
INSERT INTO `bg_items` VALUES ('2211', '留空');
INSERT INTO `bg_items` VALUES ('2212', '留空');
INSERT INTO `bg_items` VALUES ('2213', '留空');
INSERT INTO `bg_items` VALUES ('2214', '留空');
INSERT INTO `bg_items` VALUES ('2215', '留空');
INSERT INTO `bg_items` VALUES ('2216', '留空');
INSERT INTO `bg_items` VALUES ('2217', '留空');
INSERT INTO `bg_items` VALUES ('2218', '留空');
INSERT INTO `bg_items` VALUES ('2219', '留空');
INSERT INTO `bg_items` VALUES ('2220', '留空');
INSERT INTO `bg_items` VALUES ('2221', '留空');
INSERT INTO `bg_items` VALUES ('2222', '留空');
INSERT INTO `bg_items` VALUES ('2223', '留空');
INSERT INTO `bg_items` VALUES ('2224', '留空');
INSERT INTO `bg_items` VALUES ('2225', '留空');
INSERT INTO `bg_items` VALUES ('2226', '留空');
INSERT INTO `bg_items` VALUES ('2227', '留空');
INSERT INTO `bg_items` VALUES ('2228', '留空');
INSERT INTO `bg_items` VALUES ('2229', '留空');
INSERT INTO `bg_items` VALUES ('2230', '留空');
INSERT INTO `bg_items` VALUES ('2231', '留空');
INSERT INTO `bg_items` VALUES ('2232', '留空');
INSERT INTO `bg_items` VALUES ('2233', '留空');
INSERT INTO `bg_items` VALUES ('2234', '留空');
INSERT INTO `bg_items` VALUES ('2235', '留空');
INSERT INTO `bg_items` VALUES ('2236', '留空');
INSERT INTO `bg_items` VALUES ('2237', '留空');
INSERT INTO `bg_items` VALUES ('2238', '留空');
INSERT INTO `bg_items` VALUES ('2239', '留空');
INSERT INTO `bg_items` VALUES ('2240', '留空');
INSERT INTO `bg_items` VALUES ('2241', '留空');
INSERT INTO `bg_items` VALUES ('2242', '留空');
INSERT INTO `bg_items` VALUES ('2243', '留空');
INSERT INTO `bg_items` VALUES ('2244', '留空');
INSERT INTO `bg_items` VALUES ('2245', '留空');
INSERT INTO `bg_items` VALUES ('2246', '留空');
INSERT INTO `bg_items` VALUES ('2247', '留空');
INSERT INTO `bg_items` VALUES ('2248', '留空');
INSERT INTO `bg_items` VALUES ('2249', '留空');
INSERT INTO `bg_items` VALUES ('2250', '留空');
INSERT INTO `bg_items` VALUES ('2251', '留空');
INSERT INTO `bg_items` VALUES ('2252', '留空');
INSERT INTO `bg_items` VALUES ('2253', '留空');
INSERT INTO `bg_items` VALUES ('2254', '留空');
INSERT INTO `bg_items` VALUES ('2255', '留空');
INSERT INTO `bg_items` VALUES ('2256', '留空');
INSERT INTO `bg_items` VALUES ('2257', '留空');
INSERT INTO `bg_items` VALUES ('2258', '留空');
INSERT INTO `bg_items` VALUES ('2259', '留空');
INSERT INTO `bg_items` VALUES ('2260', '留空');
INSERT INTO `bg_items` VALUES ('2261', '留空');
INSERT INTO `bg_items` VALUES ('2262', '留空');
INSERT INTO `bg_items` VALUES ('2263', '留空');
INSERT INTO `bg_items` VALUES ('2264', '留空');
INSERT INTO `bg_items` VALUES ('2265', '留空');
INSERT INTO `bg_items` VALUES ('2266', '留空');
INSERT INTO `bg_items` VALUES ('2267', '留空');
INSERT INTO `bg_items` VALUES ('2268', '留空');
INSERT INTO `bg_items` VALUES ('2269', '留空');
INSERT INTO `bg_items` VALUES ('2270', '留空');
INSERT INTO `bg_items` VALUES ('2271', '留空');
INSERT INTO `bg_items` VALUES ('2272', '留空');
INSERT INTO `bg_items` VALUES ('2273', '留空');
INSERT INTO `bg_items` VALUES ('2274', '留空');
INSERT INTO `bg_items` VALUES ('2275', '留空');
INSERT INTO `bg_items` VALUES ('2276', '留空');
INSERT INTO `bg_items` VALUES ('2277', '留空');
INSERT INTO `bg_items` VALUES ('2278', '留空');
INSERT INTO `bg_items` VALUES ('2279', '留空');
INSERT INTO `bg_items` VALUES ('2280', '留空');
INSERT INTO `bg_items` VALUES ('2281', '留空');
INSERT INTO `bg_items` VALUES ('2282', '留空');
INSERT INTO `bg_items` VALUES ('2283', '留空');
INSERT INTO `bg_items` VALUES ('2284', '留空');
INSERT INTO `bg_items` VALUES ('2285', '留空');
INSERT INTO `bg_items` VALUES ('2286', '留空');
INSERT INTO `bg_items` VALUES ('2287', '留空');
INSERT INTO `bg_items` VALUES ('2288', '留空');
INSERT INTO `bg_items` VALUES ('2289', '留空');
INSERT INTO `bg_items` VALUES ('2290', '留空');
INSERT INTO `bg_items` VALUES ('2291', '留空');
INSERT INTO `bg_items` VALUES ('2292', '留空');
INSERT INTO `bg_items` VALUES ('2293', '留空');
INSERT INTO `bg_items` VALUES ('2294', '留空');
INSERT INTO `bg_items` VALUES ('2295', '留空');
INSERT INTO `bg_items` VALUES ('2296', '留空');
INSERT INTO `bg_items` VALUES ('2297', '留空');
INSERT INTO `bg_items` VALUES ('2298', '留空');
INSERT INTO `bg_items` VALUES ('2299', '留空');
INSERT INTO `bg_items` VALUES ('2300', '留空');
INSERT INTO `bg_items` VALUES ('2301', '留空');
INSERT INTO `bg_items` VALUES ('2302', '留空');
INSERT INTO `bg_items` VALUES ('2303', '留空');
INSERT INTO `bg_items` VALUES ('2304', '留空');
INSERT INTO `bg_items` VALUES ('2305', '留空');
INSERT INTO `bg_items` VALUES ('2306', '留空');
INSERT INTO `bg_items` VALUES ('2307', '留空');
INSERT INTO `bg_items` VALUES ('2308', '留空');
INSERT INTO `bg_items` VALUES ('2309', '留空');
INSERT INTO `bg_items` VALUES ('2310', '留空');
INSERT INTO `bg_items` VALUES ('2311', '留空');
INSERT INTO `bg_items` VALUES ('2312', '留空');
INSERT INTO `bg_items` VALUES ('2313', '留空');
INSERT INTO `bg_items` VALUES ('2314', '留空');
INSERT INTO `bg_items` VALUES ('2315', '留空');
INSERT INTO `bg_items` VALUES ('2316', '留空');
INSERT INTO `bg_items` VALUES ('2317', '留空');
INSERT INTO `bg_items` VALUES ('2318', '留空');
INSERT INTO `bg_items` VALUES ('2319', '留空');
INSERT INTO `bg_items` VALUES ('2320', '留空');
INSERT INTO `bg_items` VALUES ('2321', '留空');
INSERT INTO `bg_items` VALUES ('2322', '留空');
INSERT INTO `bg_items` VALUES ('2323', '留空');
INSERT INTO `bg_items` VALUES ('2324', '留空');
INSERT INTO `bg_items` VALUES ('2325', '留空');
INSERT INTO `bg_items` VALUES ('2326', '留空');
INSERT INTO `bg_items` VALUES ('2327', '留空');
INSERT INTO `bg_items` VALUES ('2328', '留空');
INSERT INTO `bg_items` VALUES ('2329', '留空');
INSERT INTO `bg_items` VALUES ('2330', '留空');
INSERT INTO `bg_items` VALUES ('2331', '留空');
INSERT INTO `bg_items` VALUES ('2332', '留空');
INSERT INTO `bg_items` VALUES ('2333', '留空');
INSERT INTO `bg_items` VALUES ('2334', '留空');
INSERT INTO `bg_items` VALUES ('2335', '留空');
INSERT INTO `bg_items` VALUES ('2336', '留空');
INSERT INTO `bg_items` VALUES ('2337', '留空');
INSERT INTO `bg_items` VALUES ('2338', '留空');
INSERT INTO `bg_items` VALUES ('2339', '留空');
INSERT INTO `bg_items` VALUES ('2340', '留空');
INSERT INTO `bg_items` VALUES ('2341', '留空');
INSERT INTO `bg_items` VALUES ('2342', '留空');
INSERT INTO `bg_items` VALUES ('2343', '留空');
INSERT INTO `bg_items` VALUES ('2344', '留空');
INSERT INTO `bg_items` VALUES ('2345', '留空');
INSERT INTO `bg_items` VALUES ('2346', '留空');
INSERT INTO `bg_items` VALUES ('2347', '留空');
INSERT INTO `bg_items` VALUES ('2348', '留空');
INSERT INTO `bg_items` VALUES ('2349', '留空');
INSERT INTO `bg_items` VALUES ('2350', '留空');
INSERT INTO `bg_items` VALUES ('2351', '留空');
INSERT INTO `bg_items` VALUES ('2352', '留空');
INSERT INTO `bg_items` VALUES ('2353', '留空');
INSERT INTO `bg_items` VALUES ('2354', '留空');
INSERT INTO `bg_items` VALUES ('2355', '留空');
INSERT INTO `bg_items` VALUES ('2356', '留空');
INSERT INTO `bg_items` VALUES ('2357', '留空');
INSERT INTO `bg_items` VALUES ('2358', '留空');
INSERT INTO `bg_items` VALUES ('2359', '留空');
INSERT INTO `bg_items` VALUES ('2360', '留空');
INSERT INTO `bg_items` VALUES ('2361', '留空');
INSERT INTO `bg_items` VALUES ('2362', '留空');
INSERT INTO `bg_items` VALUES ('2363', '留空');
INSERT INTO `bg_items` VALUES ('2364', '留空');
INSERT INTO `bg_items` VALUES ('2365', '留空');
INSERT INTO `bg_items` VALUES ('2366', '留空');
INSERT INTO `bg_items` VALUES ('2367', '留空');
INSERT INTO `bg_items` VALUES ('2368', '留空');
INSERT INTO `bg_items` VALUES ('2369', '留空');
INSERT INTO `bg_items` VALUES ('2370', '留空');
INSERT INTO `bg_items` VALUES ('2371', '留空');
INSERT INTO `bg_items` VALUES ('2372', '留空');
INSERT INTO `bg_items` VALUES ('2373', '留空');
INSERT INTO `bg_items` VALUES ('2374', '留空');
INSERT INTO `bg_items` VALUES ('2375', '留空');
INSERT INTO `bg_items` VALUES ('2376', '留空');
INSERT INTO `bg_items` VALUES ('2377', '留空');
INSERT INTO `bg_items` VALUES ('2378', '留空');
INSERT INTO `bg_items` VALUES ('2379', '留空');
INSERT INTO `bg_items` VALUES ('2380', '留空');
INSERT INTO `bg_items` VALUES ('2381', '留空');
INSERT INTO `bg_items` VALUES ('2382', '留空');
INSERT INTO `bg_items` VALUES ('2383', '留空');
INSERT INTO `bg_items` VALUES ('2384', '留空');
INSERT INTO `bg_items` VALUES ('2385', '留空');
INSERT INTO `bg_items` VALUES ('2386', '留空');
INSERT INTO `bg_items` VALUES ('2387', '留空');
INSERT INTO `bg_items` VALUES ('2388', '留空');
INSERT INTO `bg_items` VALUES ('2389', '留空');
INSERT INTO `bg_items` VALUES ('2390', '留空');
INSERT INTO `bg_items` VALUES ('2391', '留空');
INSERT INTO `bg_items` VALUES ('2392', '留空');
INSERT INTO `bg_items` VALUES ('2393', '留空');
INSERT INTO `bg_items` VALUES ('2394', '留空');
INSERT INTO `bg_items` VALUES ('2395', '留空');
INSERT INTO `bg_items` VALUES ('2396', '留空');
INSERT INTO `bg_items` VALUES ('2397', '留空');
INSERT INTO `bg_items` VALUES ('2398', '留空');
INSERT INTO `bg_items` VALUES ('2399', '留空');
INSERT INTO `bg_items` VALUES ('2400', '留空');
INSERT INTO `bg_items` VALUES ('2401', '留空');
INSERT INTO `bg_items` VALUES ('2402', '留空');
INSERT INTO `bg_items` VALUES ('2403', '留空');
INSERT INTO `bg_items` VALUES ('2404', '留空');
INSERT INTO `bg_items` VALUES ('2405', '留空');
INSERT INTO `bg_items` VALUES ('2406', '留空');
INSERT INTO `bg_items` VALUES ('2407', '留空');
INSERT INTO `bg_items` VALUES ('2408', '留空');
INSERT INTO `bg_items` VALUES ('2409', '留空');
INSERT INTO `bg_items` VALUES ('2410', '留空');
INSERT INTO `bg_items` VALUES ('2411', '留空');
INSERT INTO `bg_items` VALUES ('2412', '留空');
INSERT INTO `bg_items` VALUES ('2413', '留空');
INSERT INTO `bg_items` VALUES ('2414', '留空');
INSERT INTO `bg_items` VALUES ('2415', '留空');
INSERT INTO `bg_items` VALUES ('2416', '留空');
INSERT INTO `bg_items` VALUES ('2417', '留空');
INSERT INTO `bg_items` VALUES ('2418', '留空');
INSERT INTO `bg_items` VALUES ('2419', '留空');
INSERT INTO `bg_items` VALUES ('2420', '留空');
INSERT INTO `bg_items` VALUES ('2421', '留空');
INSERT INTO `bg_items` VALUES ('2422', '留空');
INSERT INTO `bg_items` VALUES ('2423', '留空');
INSERT INTO `bg_items` VALUES ('2424', '留空');
INSERT INTO `bg_items` VALUES ('2425', '留空');
INSERT INTO `bg_items` VALUES ('2426', '留空');
INSERT INTO `bg_items` VALUES ('2427', '留空');
INSERT INTO `bg_items` VALUES ('2428', '留空');
INSERT INTO `bg_items` VALUES ('2429', '留空');
INSERT INTO `bg_items` VALUES ('2430', '留空');
INSERT INTO `bg_items` VALUES ('2431', '留空');
INSERT INTO `bg_items` VALUES ('2432', '留空');
INSERT INTO `bg_items` VALUES ('2433', '留空');
INSERT INTO `bg_items` VALUES ('2434', '留空');
INSERT INTO `bg_items` VALUES ('2435', '留空');
INSERT INTO `bg_items` VALUES ('2436', '留空');
INSERT INTO `bg_items` VALUES ('2437', '留空');
INSERT INTO `bg_items` VALUES ('2438', '留空');
INSERT INTO `bg_items` VALUES ('2439', '留空');
INSERT INTO `bg_items` VALUES ('2440', '留空');
INSERT INTO `bg_items` VALUES ('2441', '留空');
INSERT INTO `bg_items` VALUES ('2442', '留空');
INSERT INTO `bg_items` VALUES ('2443', '留空');
INSERT INTO `bg_items` VALUES ('2444', '留空');
INSERT INTO `bg_items` VALUES ('2445', '留空');
INSERT INTO `bg_items` VALUES ('2446', '留空');
INSERT INTO `bg_items` VALUES ('2447', '留空');
INSERT INTO `bg_items` VALUES ('2448', '留空');
INSERT INTO `bg_items` VALUES ('2449', '留空');
INSERT INTO `bg_items` VALUES ('2450', '留空');
INSERT INTO `bg_items` VALUES ('2451', '留空');
INSERT INTO `bg_items` VALUES ('2452', '留空');
INSERT INTO `bg_items` VALUES ('2453', '留空');
INSERT INTO `bg_items` VALUES ('2454', '留空');
INSERT INTO `bg_items` VALUES ('2455', '留空');
INSERT INTO `bg_items` VALUES ('2456', '留空');
INSERT INTO `bg_items` VALUES ('2457', '留空');
INSERT INTO `bg_items` VALUES ('2458', '留空');
INSERT INTO `bg_items` VALUES ('2459', '留空');
INSERT INTO `bg_items` VALUES ('2460', '留空');
INSERT INTO `bg_items` VALUES ('2461', '留空');
INSERT INTO `bg_items` VALUES ('2462', '留空');
INSERT INTO `bg_items` VALUES ('2463', '留空');
INSERT INTO `bg_items` VALUES ('2464', '留空');
INSERT INTO `bg_items` VALUES ('2465', '留空');
INSERT INTO `bg_items` VALUES ('2466', '留空');
INSERT INTO `bg_items` VALUES ('2467', '留空');
INSERT INTO `bg_items` VALUES ('2468', '留空');
INSERT INTO `bg_items` VALUES ('2469', '留空');
INSERT INTO `bg_items` VALUES ('2470', '留空');
INSERT INTO `bg_items` VALUES ('2471', '留空');
INSERT INTO `bg_items` VALUES ('2472', '留空');
INSERT INTO `bg_items` VALUES ('2473', '留空');
INSERT INTO `bg_items` VALUES ('2474', '留空');
INSERT INTO `bg_items` VALUES ('2475', '留空');
INSERT INTO `bg_items` VALUES ('2476', '留空');
INSERT INTO `bg_items` VALUES ('2477', '留空');
INSERT INTO `bg_items` VALUES ('2478', '留空');
INSERT INTO `bg_items` VALUES ('2479', '留空');
INSERT INTO `bg_items` VALUES ('2480', '留空');
INSERT INTO `bg_items` VALUES ('2481', '留空');
INSERT INTO `bg_items` VALUES ('2482', '留空');
INSERT INTO `bg_items` VALUES ('2483', '留空');
INSERT INTO `bg_items` VALUES ('2484', '留空');
INSERT INTO `bg_items` VALUES ('2485', '留空');
INSERT INTO `bg_items` VALUES ('2486', '留空');
INSERT INTO `bg_items` VALUES ('2487', '留空');
INSERT INTO `bg_items` VALUES ('2488', '留空');
INSERT INTO `bg_items` VALUES ('2489', '留空');
INSERT INTO `bg_items` VALUES ('2490', '留空');
INSERT INTO `bg_items` VALUES ('2491', '留空');
INSERT INTO `bg_items` VALUES ('2492', '留空');
INSERT INTO `bg_items` VALUES ('2493', '留空');
INSERT INTO `bg_items` VALUES ('2494', '留空');
INSERT INTO `bg_items` VALUES ('2495', '留空');
INSERT INTO `bg_items` VALUES ('2496', '留空');
INSERT INTO `bg_items` VALUES ('2497', '留空');
INSERT INTO `bg_items` VALUES ('2498', '留空');
INSERT INTO `bg_items` VALUES ('2499', '留空');
INSERT INTO `bg_items` VALUES ('2500', '留空');
INSERT INTO `bg_items` VALUES ('2501', '留空');
INSERT INTO `bg_items` VALUES ('2502', '留空');
INSERT INTO `bg_items` VALUES ('2503', '留空');
INSERT INTO `bg_items` VALUES ('2504', '留空');
INSERT INTO `bg_items` VALUES ('2505', '留空');
INSERT INTO `bg_items` VALUES ('2506', '留空');
INSERT INTO `bg_items` VALUES ('2507', '留空');
INSERT INTO `bg_items` VALUES ('2508', '留空');
INSERT INTO `bg_items` VALUES ('2509', '留空');
INSERT INTO `bg_items` VALUES ('2510', '留空');
INSERT INTO `bg_items` VALUES ('2511', '留空');
INSERT INTO `bg_items` VALUES ('2512', '留空');
INSERT INTO `bg_items` VALUES ('2513', '留空');
INSERT INTO `bg_items` VALUES ('2514', '留空');
INSERT INTO `bg_items` VALUES ('2515', '留空');
INSERT INTO `bg_items` VALUES ('2516', '留空');
INSERT INTO `bg_items` VALUES ('2517', '留空');
INSERT INTO `bg_items` VALUES ('2518', '留空');
INSERT INTO `bg_items` VALUES ('2519', '留空');
INSERT INTO `bg_items` VALUES ('2520', '留空');
INSERT INTO `bg_items` VALUES ('2521', '留空');
INSERT INTO `bg_items` VALUES ('2522', '留空');
INSERT INTO `bg_items` VALUES ('2523', '留空');
INSERT INTO `bg_items` VALUES ('2524', '留空');
INSERT INTO `bg_items` VALUES ('2525', '留空');
INSERT INTO `bg_items` VALUES ('2526', '留空');
INSERT INTO `bg_items` VALUES ('2527', '留空');
INSERT INTO `bg_items` VALUES ('2528', '留空');
INSERT INTO `bg_items` VALUES ('2529', '留空');
INSERT INTO `bg_items` VALUES ('2530', '留空');
INSERT INTO `bg_items` VALUES ('2531', '留空');
INSERT INTO `bg_items` VALUES ('2532', '留空');
INSERT INTO `bg_items` VALUES ('2533', '留空');
INSERT INTO `bg_items` VALUES ('2534', '留空');
INSERT INTO `bg_items` VALUES ('2535', '留空');
INSERT INTO `bg_items` VALUES ('2536', '留空');
INSERT INTO `bg_items` VALUES ('2537', '留空');
INSERT INTO `bg_items` VALUES ('2538', '留空');
INSERT INTO `bg_items` VALUES ('2539', '留空');
INSERT INTO `bg_items` VALUES ('2540', '留空');
INSERT INTO `bg_items` VALUES ('2541', '留空');
INSERT INTO `bg_items` VALUES ('2542', '留空');
INSERT INTO `bg_items` VALUES ('2543', '留空');
INSERT INTO `bg_items` VALUES ('2544', '留空');
INSERT INTO `bg_items` VALUES ('2545', '留空');
INSERT INTO `bg_items` VALUES ('2546', '留空');
INSERT INTO `bg_items` VALUES ('2547', '留空');
INSERT INTO `bg_items` VALUES ('2548', '留空');
INSERT INTO `bg_items` VALUES ('2549', '留空');
INSERT INTO `bg_items` VALUES ('2550', '留空');
INSERT INTO `bg_items` VALUES ('2551', '留空');
INSERT INTO `bg_items` VALUES ('2552', '留空');
INSERT INTO `bg_items` VALUES ('2553', '留空');
INSERT INTO `bg_items` VALUES ('2554', '留空');
INSERT INTO `bg_items` VALUES ('2555', '留空');
INSERT INTO `bg_items` VALUES ('2556', '留空');
INSERT INTO `bg_items` VALUES ('2557', '留空');
INSERT INTO `bg_items` VALUES ('2558', '留空');
INSERT INTO `bg_items` VALUES ('2559', '留空');
INSERT INTO `bg_items` VALUES ('2560', '留空');
INSERT INTO `bg_items` VALUES ('2561', '留空');
INSERT INTO `bg_items` VALUES ('2562', '留空');
INSERT INTO `bg_items` VALUES ('2563', '留空');
INSERT INTO `bg_items` VALUES ('2564', '留空');
INSERT INTO `bg_items` VALUES ('2565', '留空');
INSERT INTO `bg_items` VALUES ('2566', '留空');
INSERT INTO `bg_items` VALUES ('2567', '留空');
INSERT INTO `bg_items` VALUES ('2568', '留空');
INSERT INTO `bg_items` VALUES ('2569', '留空');
INSERT INTO `bg_items` VALUES ('2570', '留空');
INSERT INTO `bg_items` VALUES ('2571', '留空');
INSERT INTO `bg_items` VALUES ('2572', '留空');
INSERT INTO `bg_items` VALUES ('2573', '留空');
INSERT INTO `bg_items` VALUES ('2574', '留空');
INSERT INTO `bg_items` VALUES ('2575', '留空');
INSERT INTO `bg_items` VALUES ('2576', '留空');
INSERT INTO `bg_items` VALUES ('2577', '留空');
INSERT INTO `bg_items` VALUES ('2578', '留空');
INSERT INTO `bg_items` VALUES ('2579', '留空');
INSERT INTO `bg_items` VALUES ('2580', '留空');
INSERT INTO `bg_items` VALUES ('2581', '留空');
INSERT INTO `bg_items` VALUES ('2582', '留空');
INSERT INTO `bg_items` VALUES ('2583', '留空');
INSERT INTO `bg_items` VALUES ('2584', '留空');
INSERT INTO `bg_items` VALUES ('2585', '留空');
INSERT INTO `bg_items` VALUES ('2586', '留空');
INSERT INTO `bg_items` VALUES ('2587', '留空');
INSERT INTO `bg_items` VALUES ('2588', '留空');
INSERT INTO `bg_items` VALUES ('2589', '留空');
INSERT INTO `bg_items` VALUES ('2590', '留空');
INSERT INTO `bg_items` VALUES ('2591', '留空');
INSERT INTO `bg_items` VALUES ('2592', '留空');
INSERT INTO `bg_items` VALUES ('2593', '留空');
INSERT INTO `bg_items` VALUES ('2594', '留空');
INSERT INTO `bg_items` VALUES ('2595', '留空');
INSERT INTO `bg_items` VALUES ('2596', '留空');
INSERT INTO `bg_items` VALUES ('2597', '留空');
INSERT INTO `bg_items` VALUES ('2598', '留空');
INSERT INTO `bg_items` VALUES ('2599', '留空');
INSERT INTO `bg_items` VALUES ('2600', '留空');
INSERT INTO `bg_items` VALUES ('2601', '留空');
INSERT INTO `bg_items` VALUES ('2602', '留空');
INSERT INTO `bg_items` VALUES ('2603', '留空');
INSERT INTO `bg_items` VALUES ('2604', '留空');
INSERT INTO `bg_items` VALUES ('2605', '留空');
INSERT INTO `bg_items` VALUES ('2606', '留空');
INSERT INTO `bg_items` VALUES ('2607', '留空');
INSERT INTO `bg_items` VALUES ('2608', '留空');
INSERT INTO `bg_items` VALUES ('2609', '留空');
INSERT INTO `bg_items` VALUES ('2610', '留空');
INSERT INTO `bg_items` VALUES ('2611', '留空');
INSERT INTO `bg_items` VALUES ('2612', '留空');
INSERT INTO `bg_items` VALUES ('2613', '留空');
INSERT INTO `bg_items` VALUES ('2614', '留空');
INSERT INTO `bg_items` VALUES ('2615', '留空');
INSERT INTO `bg_items` VALUES ('2616', '留空');
INSERT INTO `bg_items` VALUES ('2617', '留空');
INSERT INTO `bg_items` VALUES ('2618', '留空');
INSERT INTO `bg_items` VALUES ('2619', '留空');
INSERT INTO `bg_items` VALUES ('2620', '留空');
INSERT INTO `bg_items` VALUES ('2621', '留空');
INSERT INTO `bg_items` VALUES ('2622', '留空');
INSERT INTO `bg_items` VALUES ('2623', '留空');
INSERT INTO `bg_items` VALUES ('2624', '留空');
INSERT INTO `bg_items` VALUES ('2625', '留空');
INSERT INTO `bg_items` VALUES ('2626', '留空');
INSERT INTO `bg_items` VALUES ('2627', '留空');
INSERT INTO `bg_items` VALUES ('2628', '留空');
INSERT INTO `bg_items` VALUES ('2629', '留空');
INSERT INTO `bg_items` VALUES ('2630', '留空');
INSERT INTO `bg_items` VALUES ('2631', '留空');
INSERT INTO `bg_items` VALUES ('2632', '留空');
INSERT INTO `bg_items` VALUES ('2633', '留空');
INSERT INTO `bg_items` VALUES ('2634', '留空');
INSERT INTO `bg_items` VALUES ('2635', '留空');
INSERT INTO `bg_items` VALUES ('2636', '留空');
INSERT INTO `bg_items` VALUES ('2637', '留空');
INSERT INTO `bg_items` VALUES ('2638', '留空');
INSERT INTO `bg_items` VALUES ('2639', '留空');
INSERT INTO `bg_items` VALUES ('2640', '留空');
INSERT INTO `bg_items` VALUES ('2641', '留空');
INSERT INTO `bg_items` VALUES ('2642', '留空');
INSERT INTO `bg_items` VALUES ('2643', '留空');
INSERT INTO `bg_items` VALUES ('2644', '留空');
INSERT INTO `bg_items` VALUES ('2645', '留空');
INSERT INTO `bg_items` VALUES ('2646', '留空');
INSERT INTO `bg_items` VALUES ('2647', '留空');
INSERT INTO `bg_items` VALUES ('2648', '留空');
INSERT INTO `bg_items` VALUES ('2649', '留空');
INSERT INTO `bg_items` VALUES ('2650', '留空');
INSERT INTO `bg_items` VALUES ('2651', '留空');
INSERT INTO `bg_items` VALUES ('2652', '留空');
INSERT INTO `bg_items` VALUES ('2653', '留空');
INSERT INTO `bg_items` VALUES ('2654', '留空');
INSERT INTO `bg_items` VALUES ('2655', '留空');
INSERT INTO `bg_items` VALUES ('2656', '留空');
INSERT INTO `bg_items` VALUES ('2657', '留空');
INSERT INTO `bg_items` VALUES ('2658', '留空');
INSERT INTO `bg_items` VALUES ('2659', '留空');
INSERT INTO `bg_items` VALUES ('2660', '留空');
INSERT INTO `bg_items` VALUES ('2661', '留空');
INSERT INTO `bg_items` VALUES ('2662', '留空');
INSERT INTO `bg_items` VALUES ('2663', '留空');
INSERT INTO `bg_items` VALUES ('2664', '留空');
INSERT INTO `bg_items` VALUES ('2665', '留空');
INSERT INTO `bg_items` VALUES ('2666', '留空');
INSERT INTO `bg_items` VALUES ('2667', '留空');
INSERT INTO `bg_items` VALUES ('2668', '留空');
INSERT INTO `bg_items` VALUES ('2669', '留空');
INSERT INTO `bg_items` VALUES ('2670', '留空');
INSERT INTO `bg_items` VALUES ('2671', '留空');
INSERT INTO `bg_items` VALUES ('2672', '留空');
INSERT INTO `bg_items` VALUES ('2673', '留空');
INSERT INTO `bg_items` VALUES ('2674', '留空');
INSERT INTO `bg_items` VALUES ('2675', '留空');
INSERT INTO `bg_items` VALUES ('2676', '留空');
INSERT INTO `bg_items` VALUES ('2677', '留空');
INSERT INTO `bg_items` VALUES ('2678', '留空');
INSERT INTO `bg_items` VALUES ('2679', '留空');
INSERT INTO `bg_items` VALUES ('2680', '留空');
INSERT INTO `bg_items` VALUES ('2681', '留空');
INSERT INTO `bg_items` VALUES ('2682', '留空');
INSERT INTO `bg_items` VALUES ('2683', '留空');
INSERT INTO `bg_items` VALUES ('2684', '留空');
INSERT INTO `bg_items` VALUES ('2685', '留空');
INSERT INTO `bg_items` VALUES ('2686', '留空');
INSERT INTO `bg_items` VALUES ('2687', '留空');
INSERT INTO `bg_items` VALUES ('2688', '留空');
INSERT INTO `bg_items` VALUES ('2689', '留空');
INSERT INTO `bg_items` VALUES ('2690', '留空');
INSERT INTO `bg_items` VALUES ('2691', '留空');
INSERT INTO `bg_items` VALUES ('2692', '留空');
INSERT INTO `bg_items` VALUES ('2693', '留空');
INSERT INTO `bg_items` VALUES ('2694', '留空');
INSERT INTO `bg_items` VALUES ('2695', '留空');
INSERT INTO `bg_items` VALUES ('2696', '留空');
INSERT INTO `bg_items` VALUES ('2697', '留空');
INSERT INTO `bg_items` VALUES ('2698', '留空');
INSERT INTO `bg_items` VALUES ('2699', '留空');
INSERT INTO `bg_items` VALUES ('2700', '留空');
INSERT INTO `bg_items` VALUES ('2701', '留空');
INSERT INTO `bg_items` VALUES ('2702', '留空');
INSERT INTO `bg_items` VALUES ('2703', '留空');
INSERT INTO `bg_items` VALUES ('2704', '留空');
INSERT INTO `bg_items` VALUES ('2705', '留空');
INSERT INTO `bg_items` VALUES ('2706', '留空');
INSERT INTO `bg_items` VALUES ('2707', '留空');
INSERT INTO `bg_items` VALUES ('2708', '留空');
INSERT INTO `bg_items` VALUES ('2709', '留空');
INSERT INTO `bg_items` VALUES ('2710', '留空');
INSERT INTO `bg_items` VALUES ('2711', '留空');
INSERT INTO `bg_items` VALUES ('2712', '留空');
INSERT INTO `bg_items` VALUES ('2713', '留空');
INSERT INTO `bg_items` VALUES ('2714', '留空');
INSERT INTO `bg_items` VALUES ('2715', '留空');
INSERT INTO `bg_items` VALUES ('2716', '留空');
INSERT INTO `bg_items` VALUES ('2717', '留空');
INSERT INTO `bg_items` VALUES ('2718', '留空');
INSERT INTO `bg_items` VALUES ('2719', '留空');
INSERT INTO `bg_items` VALUES ('2720', '留空');
INSERT INTO `bg_items` VALUES ('2721', '留空');
INSERT INTO `bg_items` VALUES ('2722', '留空');
INSERT INTO `bg_items` VALUES ('2723', '留空');
INSERT INTO `bg_items` VALUES ('2724', '留空');
INSERT INTO `bg_items` VALUES ('2725', '留空');
INSERT INTO `bg_items` VALUES ('2726', '留空');
INSERT INTO `bg_items` VALUES ('2727', '留空');
INSERT INTO `bg_items` VALUES ('2728', '留空');
INSERT INTO `bg_items` VALUES ('2729', '留空');
INSERT INTO `bg_items` VALUES ('2730', '留空');
INSERT INTO `bg_items` VALUES ('2731', '留空');
INSERT INTO `bg_items` VALUES ('2732', '留空');
INSERT INTO `bg_items` VALUES ('2733', '留空');
INSERT INTO `bg_items` VALUES ('2734', '留空');
INSERT INTO `bg_items` VALUES ('2735', '留空');
INSERT INTO `bg_items` VALUES ('2736', '留空');
INSERT INTO `bg_items` VALUES ('2737', '留空');
INSERT INTO `bg_items` VALUES ('2738', '留空');
INSERT INTO `bg_items` VALUES ('2739', '留空');
INSERT INTO `bg_items` VALUES ('2740', '留空');
INSERT INTO `bg_items` VALUES ('2741', '留空');
INSERT INTO `bg_items` VALUES ('2742', '留空');
INSERT INTO `bg_items` VALUES ('2743', '留空');
INSERT INTO `bg_items` VALUES ('2744', '留空');
INSERT INTO `bg_items` VALUES ('2745', '留空');
INSERT INTO `bg_items` VALUES ('2746', '留空');
INSERT INTO `bg_items` VALUES ('2747', '留空');
INSERT INTO `bg_items` VALUES ('2748', '留空');
INSERT INTO `bg_items` VALUES ('2749', '留空');
INSERT INTO `bg_items` VALUES ('2750', '留空');
INSERT INTO `bg_items` VALUES ('2751', '留空');
INSERT INTO `bg_items` VALUES ('2752', '留空');
INSERT INTO `bg_items` VALUES ('2753', '留空');
INSERT INTO `bg_items` VALUES ('2754', '留空');
INSERT INTO `bg_items` VALUES ('2755', '留空');
INSERT INTO `bg_items` VALUES ('2756', '留空');
INSERT INTO `bg_items` VALUES ('2757', '留空');
INSERT INTO `bg_items` VALUES ('2758', '留空');
INSERT INTO `bg_items` VALUES ('2759', '留空');
INSERT INTO `bg_items` VALUES ('2760', '留空');
INSERT INTO `bg_items` VALUES ('2761', '留空');
INSERT INTO `bg_items` VALUES ('2762', '留空');
INSERT INTO `bg_items` VALUES ('2763', '留空');
INSERT INTO `bg_items` VALUES ('2764', '留空');
INSERT INTO `bg_items` VALUES ('2765', '留空');
INSERT INTO `bg_items` VALUES ('2766', '留空');
INSERT INTO `bg_items` VALUES ('2767', '留空');
INSERT INTO `bg_items` VALUES ('2768', '留空');
INSERT INTO `bg_items` VALUES ('2769', '留空');
INSERT INTO `bg_items` VALUES ('2770', '留空');
INSERT INTO `bg_items` VALUES ('2771', '留空');
INSERT INTO `bg_items` VALUES ('2772', '留空');
INSERT INTO `bg_items` VALUES ('2773', '留空');
INSERT INTO `bg_items` VALUES ('2774', '留空');
INSERT INTO `bg_items` VALUES ('2775', '留空');
INSERT INTO `bg_items` VALUES ('2776', '留空');
INSERT INTO `bg_items` VALUES ('2777', '留空');
INSERT INTO `bg_items` VALUES ('2778', '留空');
INSERT INTO `bg_items` VALUES ('2779', '留空');
INSERT INTO `bg_items` VALUES ('2780', '留空');
INSERT INTO `bg_items` VALUES ('2781', '留空');
INSERT INTO `bg_items` VALUES ('2782', '留空');
INSERT INTO `bg_items` VALUES ('2783', '留空');
INSERT INTO `bg_items` VALUES ('2784', '留空');
INSERT INTO `bg_items` VALUES ('2785', '留空');
INSERT INTO `bg_items` VALUES ('2786', '留空');
INSERT INTO `bg_items` VALUES ('2787', '留空');
INSERT INTO `bg_items` VALUES ('2788', '留空');
INSERT INTO `bg_items` VALUES ('2789', '留空');
INSERT INTO `bg_items` VALUES ('2790', '留空');
INSERT INTO `bg_items` VALUES ('2791', '留空');
INSERT INTO `bg_items` VALUES ('2792', '留空');
INSERT INTO `bg_items` VALUES ('2793', '留空');
INSERT INTO `bg_items` VALUES ('2794', '留空');
INSERT INTO `bg_items` VALUES ('2795', '留空');
INSERT INTO `bg_items` VALUES ('2796', '留空');
INSERT INTO `bg_items` VALUES ('2797', '留空');
INSERT INTO `bg_items` VALUES ('2798', '留空');
INSERT INTO `bg_items` VALUES ('2799', '留空');
INSERT INTO `bg_items` VALUES ('2800', '留空');
INSERT INTO `bg_items` VALUES ('2801', '留空');
INSERT INTO `bg_items` VALUES ('2802', '留空');
INSERT INTO `bg_items` VALUES ('2803', '留空');
INSERT INTO `bg_items` VALUES ('2804', '留空');
INSERT INTO `bg_items` VALUES ('2805', '留空');
INSERT INTO `bg_items` VALUES ('2806', '留空');
INSERT INTO `bg_items` VALUES ('2807', '留空');
INSERT INTO `bg_items` VALUES ('2808', '留空');
INSERT INTO `bg_items` VALUES ('2809', '留空');
INSERT INTO `bg_items` VALUES ('2810', '留空');
INSERT INTO `bg_items` VALUES ('2811', '留空');
INSERT INTO `bg_items` VALUES ('2812', '留空');
INSERT INTO `bg_items` VALUES ('2813', '留空');
INSERT INTO `bg_items` VALUES ('2814', '留空');
INSERT INTO `bg_items` VALUES ('2815', '留空');
INSERT INTO `bg_items` VALUES ('2816', '留空');
INSERT INTO `bg_items` VALUES ('2817', '留空');
INSERT INTO `bg_items` VALUES ('2818', '留空');
INSERT INTO `bg_items` VALUES ('2819', '留空');
INSERT INTO `bg_items` VALUES ('2820', '留空');
INSERT INTO `bg_items` VALUES ('2821', '留空');
INSERT INTO `bg_items` VALUES ('2822', '留空');
INSERT INTO `bg_items` VALUES ('2823', '留空');
INSERT INTO `bg_items` VALUES ('2824', '留空');
INSERT INTO `bg_items` VALUES ('2825', '留空');
INSERT INTO `bg_items` VALUES ('2826', '留空');
INSERT INTO `bg_items` VALUES ('2827', '留空');
INSERT INTO `bg_items` VALUES ('2828', '留空');
INSERT INTO `bg_items` VALUES ('2829', '留空');
INSERT INTO `bg_items` VALUES ('2830', '留空');
INSERT INTO `bg_items` VALUES ('2831', '留空');
INSERT INTO `bg_items` VALUES ('2832', '留空');
INSERT INTO `bg_items` VALUES ('2833', '留空');
INSERT INTO `bg_items` VALUES ('2834', '留空');
INSERT INTO `bg_items` VALUES ('2835', '留空');
INSERT INTO `bg_items` VALUES ('2836', '留空');
INSERT INTO `bg_items` VALUES ('2837', '留空');
INSERT INTO `bg_items` VALUES ('2838', '留空');
INSERT INTO `bg_items` VALUES ('2839', '留空');
INSERT INTO `bg_items` VALUES ('2840', '留空');
INSERT INTO `bg_items` VALUES ('2841', '留空');
INSERT INTO `bg_items` VALUES ('2842', '留空');
INSERT INTO `bg_items` VALUES ('2843', '留空');
INSERT INTO `bg_items` VALUES ('2844', '留空');
INSERT INTO `bg_items` VALUES ('2845', '留空');
INSERT INTO `bg_items` VALUES ('2846', '留空');
INSERT INTO `bg_items` VALUES ('2847', '留空');
INSERT INTO `bg_items` VALUES ('2848', '留空');
INSERT INTO `bg_items` VALUES ('2849', '留空');
INSERT INTO `bg_items` VALUES ('2850', '留空');
INSERT INTO `bg_items` VALUES ('2851', '留空');
INSERT INTO `bg_items` VALUES ('2852', '留空');
INSERT INTO `bg_items` VALUES ('2853', '留空');
INSERT INTO `bg_items` VALUES ('2854', '留空');
INSERT INTO `bg_items` VALUES ('2855', '留空');
INSERT INTO `bg_items` VALUES ('2856', '留空');
INSERT INTO `bg_items` VALUES ('2857', '留空');
INSERT INTO `bg_items` VALUES ('2858', '留空');
INSERT INTO `bg_items` VALUES ('2859', '留空');
INSERT INTO `bg_items` VALUES ('2860', '留空');
INSERT INTO `bg_items` VALUES ('2861', '留空');
INSERT INTO `bg_items` VALUES ('2862', '留空');
INSERT INTO `bg_items` VALUES ('2863', '留空');
INSERT INTO `bg_items` VALUES ('2864', '留空');
INSERT INTO `bg_items` VALUES ('2865', '留空');
INSERT INTO `bg_items` VALUES ('2866', '留空');
INSERT INTO `bg_items` VALUES ('2867', '留空');
INSERT INTO `bg_items` VALUES ('2868', '留空');
INSERT INTO `bg_items` VALUES ('2869', '留空');
INSERT INTO `bg_items` VALUES ('2870', '留空');
INSERT INTO `bg_items` VALUES ('2871', '留空');
INSERT INTO `bg_items` VALUES ('2872', '留空');
INSERT INTO `bg_items` VALUES ('2873', '留空');
INSERT INTO `bg_items` VALUES ('2874', '留空');
INSERT INTO `bg_items` VALUES ('2875', '留空');
INSERT INTO `bg_items` VALUES ('2876', '留空');
INSERT INTO `bg_items` VALUES ('2877', '留空');
INSERT INTO `bg_items` VALUES ('2878', '留空');
INSERT INTO `bg_items` VALUES ('2879', '留空');
INSERT INTO `bg_items` VALUES ('2880', '留空');
INSERT INTO `bg_items` VALUES ('2881', '留空');
INSERT INTO `bg_items` VALUES ('2882', '留空');
INSERT INTO `bg_items` VALUES ('2883', '留空');
INSERT INTO `bg_items` VALUES ('2884', '留空');
INSERT INTO `bg_items` VALUES ('2885', '留空');
INSERT INTO `bg_items` VALUES ('2886', '留空');
INSERT INTO `bg_items` VALUES ('2887', '留空');
INSERT INTO `bg_items` VALUES ('2888', '留空');
INSERT INTO `bg_items` VALUES ('2889', '留空');
INSERT INTO `bg_items` VALUES ('2890', '留空');
INSERT INTO `bg_items` VALUES ('2891', '留空');
INSERT INTO `bg_items` VALUES ('2892', '留空');
INSERT INTO `bg_items` VALUES ('2893', '留空');
INSERT INTO `bg_items` VALUES ('2894', '留空');
INSERT INTO `bg_items` VALUES ('2895', '留空');
INSERT INTO `bg_items` VALUES ('2896', '留空');
INSERT INTO `bg_items` VALUES ('2897', '留空');
INSERT INTO `bg_items` VALUES ('2898', '留空');
INSERT INTO `bg_items` VALUES ('2899', '留空');
INSERT INTO `bg_items` VALUES ('2900', '留空');
INSERT INTO `bg_items` VALUES ('2901', '留空');
INSERT INTO `bg_items` VALUES ('2902', '留空');
INSERT INTO `bg_items` VALUES ('2903', '留空');
INSERT INTO `bg_items` VALUES ('2904', '留空');
INSERT INTO `bg_items` VALUES ('2905', '留空');
INSERT INTO `bg_items` VALUES ('2906', '留空');
INSERT INTO `bg_items` VALUES ('2907', '留空');
INSERT INTO `bg_items` VALUES ('2908', '留空');
INSERT INTO `bg_items` VALUES ('2909', '留空');
INSERT INTO `bg_items` VALUES ('2910', '留空');
INSERT INTO `bg_items` VALUES ('2911', '留空');
INSERT INTO `bg_items` VALUES ('2912', '留空');
INSERT INTO `bg_items` VALUES ('2913', '留空');
INSERT INTO `bg_items` VALUES ('2914', '留空');
INSERT INTO `bg_items` VALUES ('2915', '留空');
INSERT INTO `bg_items` VALUES ('2916', '留空');
INSERT INTO `bg_items` VALUES ('2917', '留空');
INSERT INTO `bg_items` VALUES ('2918', '留空');
INSERT INTO `bg_items` VALUES ('2919', '留空');
INSERT INTO `bg_items` VALUES ('2920', '留空');
INSERT INTO `bg_items` VALUES ('2921', '留空');
INSERT INTO `bg_items` VALUES ('2922', '留空');
INSERT INTO `bg_items` VALUES ('2923', '留空');
INSERT INTO `bg_items` VALUES ('2924', '留空');
INSERT INTO `bg_items` VALUES ('2925', '留空');
INSERT INTO `bg_items` VALUES ('2926', '留空');
INSERT INTO `bg_items` VALUES ('2927', '留空');
INSERT INTO `bg_items` VALUES ('2928', '留空');
INSERT INTO `bg_items` VALUES ('2929', '留空');
INSERT INTO `bg_items` VALUES ('2930', '留空');
INSERT INTO `bg_items` VALUES ('2931', '留空');
INSERT INTO `bg_items` VALUES ('2932', '留空');
INSERT INTO `bg_items` VALUES ('2933', '留空');
INSERT INTO `bg_items` VALUES ('2934', '留空');
INSERT INTO `bg_items` VALUES ('2935', '留空');
INSERT INTO `bg_items` VALUES ('2936', '留空');
INSERT INTO `bg_items` VALUES ('2937', '留空');
INSERT INTO `bg_items` VALUES ('2938', '留空');
INSERT INTO `bg_items` VALUES ('2939', '留空');
INSERT INTO `bg_items` VALUES ('2940', '留空');
INSERT INTO `bg_items` VALUES ('2941', '留空');
INSERT INTO `bg_items` VALUES ('2942', '留空');
INSERT INTO `bg_items` VALUES ('2943', '留空');
INSERT INTO `bg_items` VALUES ('2944', '留空');
INSERT INTO `bg_items` VALUES ('2945', '留空');
INSERT INTO `bg_items` VALUES ('2946', '留空');
INSERT INTO `bg_items` VALUES ('2947', '留空');
INSERT INTO `bg_items` VALUES ('2948', '留空');
INSERT INTO `bg_items` VALUES ('2949', '留空');
INSERT INTO `bg_items` VALUES ('2950', '留空');
INSERT INTO `bg_items` VALUES ('2951', '留空');
INSERT INTO `bg_items` VALUES ('2952', '留空');
INSERT INTO `bg_items` VALUES ('2953', '留空');
INSERT INTO `bg_items` VALUES ('2954', '留空');
INSERT INTO `bg_items` VALUES ('2955', '留空');
INSERT INTO `bg_items` VALUES ('2956', '留空');
INSERT INTO `bg_items` VALUES ('2957', '留空');
INSERT INTO `bg_items` VALUES ('2958', '留空');
INSERT INTO `bg_items` VALUES ('2959', '留空');
INSERT INTO `bg_items` VALUES ('2960', '留空');
INSERT INTO `bg_items` VALUES ('2961', '留空');
INSERT INTO `bg_items` VALUES ('2962', '留空');
INSERT INTO `bg_items` VALUES ('2963', '留空');
INSERT INTO `bg_items` VALUES ('2964', '留空');
INSERT INTO `bg_items` VALUES ('2965', '留空');
INSERT INTO `bg_items` VALUES ('2966', '留空');
INSERT INTO `bg_items` VALUES ('2967', '留空');
INSERT INTO `bg_items` VALUES ('2968', '留空');
INSERT INTO `bg_items` VALUES ('2969', '留空');
INSERT INTO `bg_items` VALUES ('2970', '留空');
INSERT INTO `bg_items` VALUES ('2971', '留空');
INSERT INTO `bg_items` VALUES ('2972', '留空');
INSERT INTO `bg_items` VALUES ('2973', '留空');
INSERT INTO `bg_items` VALUES ('2974', '留空');
INSERT INTO `bg_items` VALUES ('2975', '留空');
INSERT INTO `bg_items` VALUES ('2976', '留空');
INSERT INTO `bg_items` VALUES ('2977', '留空');
INSERT INTO `bg_items` VALUES ('2978', '留空');
INSERT INTO `bg_items` VALUES ('2979', '留空');
INSERT INTO `bg_items` VALUES ('2980', '留空');
INSERT INTO `bg_items` VALUES ('2981', '留空');
INSERT INTO `bg_items` VALUES ('2982', '留空');
INSERT INTO `bg_items` VALUES ('2983', '留空');
INSERT INTO `bg_items` VALUES ('2984', '留空');
INSERT INTO `bg_items` VALUES ('2985', '留空');
INSERT INTO `bg_items` VALUES ('2986', '留空');
INSERT INTO `bg_items` VALUES ('2987', '留空');
INSERT INTO `bg_items` VALUES ('2988', '留空');
INSERT INTO `bg_items` VALUES ('2989', '留空');
INSERT INTO `bg_items` VALUES ('2990', '留空');
INSERT INTO `bg_items` VALUES ('2991', '留空');
INSERT INTO `bg_items` VALUES ('2992', '留空');
INSERT INTO `bg_items` VALUES ('2993', '留空');
INSERT INTO `bg_items` VALUES ('2994', '留空');
INSERT INTO `bg_items` VALUES ('2995', '留空');
INSERT INTO `bg_items` VALUES ('2996', '留空');
INSERT INTO `bg_items` VALUES ('2997', '留空');
INSERT INTO `bg_items` VALUES ('2998', '留空');
INSERT INTO `bg_items` VALUES ('2999', '留空');
INSERT INTO `bg_items` VALUES ('3000', '留空');
INSERT INTO `bg_items` VALUES ('3001', '1阶血符');
INSERT INTO `bg_items` VALUES ('3002', '2阶血符');
INSERT INTO `bg_items` VALUES ('3003', '3阶血符');
INSERT INTO `bg_items` VALUES ('3004', '4阶血符');
INSERT INTO `bg_items` VALUES ('3005', '5阶血符');
INSERT INTO `bg_items` VALUES ('3006', '6阶血符');
INSERT INTO `bg_items` VALUES ('3007', '7阶血符');
INSERT INTO `bg_items` VALUES ('3008', '8阶血符');
INSERT INTO `bg_items` VALUES ('3009', '9阶血符');
INSERT INTO `bg_items` VALUES ('3010', '10阶血符');
INSERT INTO `bg_items` VALUES ('3011', '11阶血符');
INSERT INTO `bg_items` VALUES ('3012', '12阶血符');
INSERT INTO `bg_items` VALUES ('3013', '13阶血符');
INSERT INTO `bg_items` VALUES ('3014', '14阶血符');
INSERT INTO `bg_items` VALUES ('3015', '15阶血符');
INSERT INTO `bg_items` VALUES ('3016', '16阶血符');
INSERT INTO `bg_items` VALUES ('3017', '17阶血符');
INSERT INTO `bg_items` VALUES ('3018', '18阶血符');
INSERT INTO `bg_items` VALUES ('3019', '19阶血符');
INSERT INTO `bg_items` VALUES ('3020', '20阶血符');
INSERT INTO `bg_items` VALUES ('3021', '1阶神盾');
INSERT INTO `bg_items` VALUES ('3022', '2阶神盾');
INSERT INTO `bg_items` VALUES ('3023', '3阶神盾');
INSERT INTO `bg_items` VALUES ('3024', '4阶神盾');
INSERT INTO `bg_items` VALUES ('3025', '5阶神盾');
INSERT INTO `bg_items` VALUES ('3026', '6阶神盾');
INSERT INTO `bg_items` VALUES ('3027', '7阶神盾');
INSERT INTO `bg_items` VALUES ('3028', '8阶神盾');
INSERT INTO `bg_items` VALUES ('3029', '9阶神盾');
INSERT INTO `bg_items` VALUES ('3030', '10阶神盾');
INSERT INTO `bg_items` VALUES ('3031', '11阶神盾');
INSERT INTO `bg_items` VALUES ('3032', '12阶神盾');
INSERT INTO `bg_items` VALUES ('3033', '13阶神盾');
INSERT INTO `bg_items` VALUES ('3034', '14阶神盾');
INSERT INTO `bg_items` VALUES ('3035', '15阶神盾');
INSERT INTO `bg_items` VALUES ('3036', '16阶神盾');
INSERT INTO `bg_items` VALUES ('3037', '17阶神盾');
INSERT INTO `bg_items` VALUES ('3038', '18阶神盾');
INSERT INTO `bg_items` VALUES ('3039', '19阶神盾');
INSERT INTO `bg_items` VALUES ('3040', '20阶神盾');
INSERT INTO `bg_items` VALUES ('3041', '1阶武魂');
INSERT INTO `bg_items` VALUES ('3042', '2阶武魂');
INSERT INTO `bg_items` VALUES ('3043', '3阶武魂');
INSERT INTO `bg_items` VALUES ('3044', '4阶武魂');
INSERT INTO `bg_items` VALUES ('3045', '5阶武魂');
INSERT INTO `bg_items` VALUES ('3046', '6阶武魂');
INSERT INTO `bg_items` VALUES ('3047', '7阶武魂');
INSERT INTO `bg_items` VALUES ('3048', '8阶武魂');
INSERT INTO `bg_items` VALUES ('3049', '9阶武魂');
INSERT INTO `bg_items` VALUES ('3050', '10阶武魂');
INSERT INTO `bg_items` VALUES ('3051', '11阶武魂');
INSERT INTO `bg_items` VALUES ('3052', '12阶武魂');
INSERT INTO `bg_items` VALUES ('3053', '13阶武魂');
INSERT INTO `bg_items` VALUES ('3054', '14阶武魂');
INSERT INTO `bg_items` VALUES ('3055', '15阶武魂');
INSERT INTO `bg_items` VALUES ('3056', '16阶武魂');
INSERT INTO `bg_items` VALUES ('3057', '17阶武魂');
INSERT INTO `bg_items` VALUES ('3058', '18阶武魂');
INSERT INTO `bg_items` VALUES ('3059', '19阶武魂');
INSERT INTO `bg_items` VALUES ('3060', '20阶武魂');
INSERT INTO `bg_items` VALUES ('3061', '1阶灵珠');
INSERT INTO `bg_items` VALUES ('3062', '2阶灵珠');
INSERT INTO `bg_items` VALUES ('3063', '3阶灵珠');
INSERT INTO `bg_items` VALUES ('3064', '4阶灵珠');
INSERT INTO `bg_items` VALUES ('3065', '5阶灵珠');
INSERT INTO `bg_items` VALUES ('3066', '6阶灵珠');
INSERT INTO `bg_items` VALUES ('3067', '7阶灵珠');
INSERT INTO `bg_items` VALUES ('3068', '8阶灵珠');
INSERT INTO `bg_items` VALUES ('3069', '9阶灵珠');
INSERT INTO `bg_items` VALUES ('3070', '10阶灵珠');
INSERT INTO `bg_items` VALUES ('3071', '11阶灵珠');
INSERT INTO `bg_items` VALUES ('3072', '12阶灵珠');
INSERT INTO `bg_items` VALUES ('3073', '13阶灵珠');
INSERT INTO `bg_items` VALUES ('3074', '14阶灵珠');
INSERT INTO `bg_items` VALUES ('3075', '15阶灵珠');
INSERT INTO `bg_items` VALUES ('3076', '16阶灵珠');
INSERT INTO `bg_items` VALUES ('3077', '17阶灵珠');
INSERT INTO `bg_items` VALUES ('3078', '18阶灵珠');
INSERT INTO `bg_items` VALUES ('3079', '19阶灵珠');
INSERT INTO `bg_items` VALUES ('3080', '20阶灵珠');
INSERT INTO `bg_items` VALUES ('3081', '1阶勋章');
INSERT INTO `bg_items` VALUES ('3082', '2阶勋章');
INSERT INTO `bg_items` VALUES ('3083', '3阶勋章');
INSERT INTO `bg_items` VALUES ('3084', '4阶勋章');
INSERT INTO `bg_items` VALUES ('3085', '5阶勋章');
INSERT INTO `bg_items` VALUES ('3086', '6阶勋章');
INSERT INTO `bg_items` VALUES ('3087', '7阶勋章');
INSERT INTO `bg_items` VALUES ('3088', '8阶勋章');
INSERT INTO `bg_items` VALUES ('3089', '9阶勋章');
INSERT INTO `bg_items` VALUES ('3090', '10阶勋章');
INSERT INTO `bg_items` VALUES ('3091', '11阶勋章');
INSERT INTO `bg_items` VALUES ('3092', '12阶勋章');
INSERT INTO `bg_items` VALUES ('3093', '13阶勋章');
INSERT INTO `bg_items` VALUES ('3094', '14阶勋章');
INSERT INTO `bg_items` VALUES ('3095', '15阶勋章');
INSERT INTO `bg_items` VALUES ('3096', '16阶勋章');
INSERT INTO `bg_items` VALUES ('3097', '17阶勋章');
INSERT INTO `bg_items` VALUES ('3098', '18阶勋章');
INSERT INTO `bg_items` VALUES ('3099', '19阶勋章');
INSERT INTO `bg_items` VALUES ('3100', '20阶勋章');
INSERT INTO `bg_items` VALUES ('3101', '1阶麻痹戒指');
INSERT INTO `bg_items` VALUES ('3102', '2阶麻痹戒指');
INSERT INTO `bg_items` VALUES ('3103', '3阶麻痹戒指');
INSERT INTO `bg_items` VALUES ('3104', '4阶麻痹戒指');
INSERT INTO `bg_items` VALUES ('3105', '5阶麻痹戒指');
INSERT INTO `bg_items` VALUES ('3106', '6阶麻痹戒指');
INSERT INTO `bg_items` VALUES ('3107', '7阶麻痹戒指');
INSERT INTO `bg_items` VALUES ('3108', '8阶麻痹戒指');
INSERT INTO `bg_items` VALUES ('3109', '9阶麻痹戒指');
INSERT INTO `bg_items` VALUES ('3110', '10阶麻痹戒指');
INSERT INTO `bg_items` VALUES ('3111', '11阶麻痹戒指');
INSERT INTO `bg_items` VALUES ('3112', '12阶麻痹戒指');
INSERT INTO `bg_items` VALUES ('3113', '13阶麻痹戒指');
INSERT INTO `bg_items` VALUES ('3114', '14阶麻痹戒指');
INSERT INTO `bg_items` VALUES ('3115', '15阶麻痹戒指');
INSERT INTO `bg_items` VALUES ('3116', '16阶麻痹戒指');
INSERT INTO `bg_items` VALUES ('3117', '17阶麻痹戒指');
INSERT INTO `bg_items` VALUES ('3118', '18阶麻痹戒指');
INSERT INTO `bg_items` VALUES ('3119', '19阶麻痹戒指');
INSERT INTO `bg_items` VALUES ('3120', '20阶麻痹戒指');
INSERT INTO `bg_items` VALUES ('3121', '1阶护体戒指');
INSERT INTO `bg_items` VALUES ('3122', '2阶护体戒指');
INSERT INTO `bg_items` VALUES ('3123', '3阶护体戒指');
INSERT INTO `bg_items` VALUES ('3124', '4阶护体戒指');
INSERT INTO `bg_items` VALUES ('3125', '5阶护体戒指');
INSERT INTO `bg_items` VALUES ('3126', '6阶护体戒指');
INSERT INTO `bg_items` VALUES ('3127', '7阶护体戒指');
INSERT INTO `bg_items` VALUES ('3128', '8阶护体戒指');
INSERT INTO `bg_items` VALUES ('3129', '9阶护体戒指');
INSERT INTO `bg_items` VALUES ('3130', '10阶护体戒指');
INSERT INTO `bg_items` VALUES ('3131', '11阶护体戒指');
INSERT INTO `bg_items` VALUES ('3132', '12阶护体戒指');
INSERT INTO `bg_items` VALUES ('3133', '13阶护体戒指');
INSERT INTO `bg_items` VALUES ('3134', '14阶护体戒指');
INSERT INTO `bg_items` VALUES ('3135', '15阶护体戒指');
INSERT INTO `bg_items` VALUES ('3136', '16阶护体戒指');
INSERT INTO `bg_items` VALUES ('3137', '17阶护体戒指');
INSERT INTO `bg_items` VALUES ('3138', '18阶护体戒指');
INSERT INTO `bg_items` VALUES ('3139', '19阶护体戒指');
INSERT INTO `bg_items` VALUES ('3140', '20阶护体戒指');
INSERT INTO `bg_items` VALUES ('3141', '1阶复活戒指');
INSERT INTO `bg_items` VALUES ('3142', '2阶复活戒指');
INSERT INTO `bg_items` VALUES ('3143', '3阶复活戒指');
INSERT INTO `bg_items` VALUES ('3144', '4阶复活戒指');
INSERT INTO `bg_items` VALUES ('3145', '5阶复活戒指');
INSERT INTO `bg_items` VALUES ('3146', '6阶复活戒指');
INSERT INTO `bg_items` VALUES ('3147', '7阶复活戒指');
INSERT INTO `bg_items` VALUES ('3148', '8阶复活戒指');
INSERT INTO `bg_items` VALUES ('3149', '9阶复活戒指');
INSERT INTO `bg_items` VALUES ('3150', '10阶复活戒指');
INSERT INTO `bg_items` VALUES ('3151', '11阶复活戒指');
INSERT INTO `bg_items` VALUES ('3152', '12阶复活戒指');
INSERT INTO `bg_items` VALUES ('3153', '13阶复活戒指');
INSERT INTO `bg_items` VALUES ('3154', '14阶复活戒指');
INSERT INTO `bg_items` VALUES ('3155', '15阶复活戒指');
INSERT INTO `bg_items` VALUES ('3156', '16阶复活戒指');
INSERT INTO `bg_items` VALUES ('3157', '17阶复活戒指');
INSERT INTO `bg_items` VALUES ('3158', '18阶复活戒指');
INSERT INTO `bg_items` VALUES ('3159', '19阶复活戒指');
INSERT INTO `bg_items` VALUES ('3160', '20阶复活戒指');
INSERT INTO `bg_items` VALUES ('3161', '1阶战圣护肩');
INSERT INTO `bg_items` VALUES ('3162', '2阶战圣护肩');
INSERT INTO `bg_items` VALUES ('3163', '3阶战圣护肩');
INSERT INTO `bg_items` VALUES ('3164', '4阶战圣护肩');
INSERT INTO `bg_items` VALUES ('3165', '5阶战圣护肩');
INSERT INTO `bg_items` VALUES ('3166', '6阶战圣护肩');
INSERT INTO `bg_items` VALUES ('3167', '7阶战圣护肩');
INSERT INTO `bg_items` VALUES ('3168', '8阶战圣护肩');
INSERT INTO `bg_items` VALUES ('3169', '9阶战圣护肩');
INSERT INTO `bg_items` VALUES ('3170', '10阶战圣护肩');
INSERT INTO `bg_items` VALUES ('3171', '11阶战圣护肩');
INSERT INTO `bg_items` VALUES ('3172', '12阶战圣护肩');
INSERT INTO `bg_items` VALUES ('3173', '13阶战圣护肩');
INSERT INTO `bg_items` VALUES ('3174', '14阶战圣护肩');
INSERT INTO `bg_items` VALUES ('3175', '15阶战圣护肩');
INSERT INTO `bg_items` VALUES ('3176', '16阶战圣护肩');
INSERT INTO `bg_items` VALUES ('3177', '17阶战圣护肩');
INSERT INTO `bg_items` VALUES ('3178', '18阶战圣护肩');
INSERT INTO `bg_items` VALUES ('3179', '19阶战圣护肩');
INSERT INTO `bg_items` VALUES ('3180', '20阶战圣护肩');
INSERT INTO `bg_items` VALUES ('3181', '1阶战圣护坠');
INSERT INTO `bg_items` VALUES ('3182', '2阶战圣护坠');
INSERT INTO `bg_items` VALUES ('3183', '3阶战圣护坠');
INSERT INTO `bg_items` VALUES ('3184', '4阶战圣护坠');
INSERT INTO `bg_items` VALUES ('3185', '5阶战圣护坠');
INSERT INTO `bg_items` VALUES ('3186', '6阶战圣护坠');
INSERT INTO `bg_items` VALUES ('3187', '7阶战圣护坠');
INSERT INTO `bg_items` VALUES ('3188', '8阶战圣护坠');
INSERT INTO `bg_items` VALUES ('3189', '9阶战圣护坠');
INSERT INTO `bg_items` VALUES ('3190', '10阶战圣护坠');
INSERT INTO `bg_items` VALUES ('3191', '11阶战圣护坠');
INSERT INTO `bg_items` VALUES ('3192', '12阶战圣护坠');
INSERT INTO `bg_items` VALUES ('3193', '13阶战圣护坠');
INSERT INTO `bg_items` VALUES ('3194', '14阶战圣护坠');
INSERT INTO `bg_items` VALUES ('3195', '15阶战圣护坠');
INSERT INTO `bg_items` VALUES ('3196', '16阶战圣护坠');
INSERT INTO `bg_items` VALUES ('3197', '17阶战圣护坠');
INSERT INTO `bg_items` VALUES ('3198', '18阶战圣护坠');
INSERT INTO `bg_items` VALUES ('3199', '19阶战圣护坠');
INSERT INTO `bg_items` VALUES ('3200', '20阶战圣护坠');
INSERT INTO `bg_items` VALUES ('3201', '1阶战圣护镜');
INSERT INTO `bg_items` VALUES ('3202', '2阶战圣护镜');
INSERT INTO `bg_items` VALUES ('3203', '3阶战圣护镜');
INSERT INTO `bg_items` VALUES ('3204', '4阶战圣护镜');
INSERT INTO `bg_items` VALUES ('3205', '5阶战圣护镜');
INSERT INTO `bg_items` VALUES ('3206', '6阶战圣护镜');
INSERT INTO `bg_items` VALUES ('3207', '7阶战圣护镜');
INSERT INTO `bg_items` VALUES ('3208', '8阶战圣护镜');
INSERT INTO `bg_items` VALUES ('3209', '9阶战圣护镜');
INSERT INTO `bg_items` VALUES ('3210', '10阶战圣护镜');
INSERT INTO `bg_items` VALUES ('3211', '11阶战圣护镜');
INSERT INTO `bg_items` VALUES ('3212', '12阶战圣护镜');
INSERT INTO `bg_items` VALUES ('3213', '13阶战圣护镜');
INSERT INTO `bg_items` VALUES ('3214', '14阶战圣护镜');
INSERT INTO `bg_items` VALUES ('3215', '15阶战圣护镜');
INSERT INTO `bg_items` VALUES ('3216', '16阶战圣护镜');
INSERT INTO `bg_items` VALUES ('3217', '17阶战圣护镜');
INSERT INTO `bg_items` VALUES ('3218', '18阶战圣护镜');
INSERT INTO `bg_items` VALUES ('3219', '19阶战圣护镜');
INSERT INTO `bg_items` VALUES ('3220', '20阶战圣护镜');
INSERT INTO `bg_items` VALUES ('3221', '1阶战圣护膝');
INSERT INTO `bg_items` VALUES ('3222', '2阶战圣护膝');
INSERT INTO `bg_items` VALUES ('3223', '3阶战圣护膝');
INSERT INTO `bg_items` VALUES ('3224', '4阶战圣护膝');
INSERT INTO `bg_items` VALUES ('3225', '5阶战圣护膝');
INSERT INTO `bg_items` VALUES ('3226', '6阶战圣护膝');
INSERT INTO `bg_items` VALUES ('3227', '7阶战圣护膝');
INSERT INTO `bg_items` VALUES ('3228', '8阶战圣护膝');
INSERT INTO `bg_items` VALUES ('3229', '9阶战圣护膝');
INSERT INTO `bg_items` VALUES ('3230', '10阶战圣护膝');
INSERT INTO `bg_items` VALUES ('3231', '11阶战圣护膝');
INSERT INTO `bg_items` VALUES ('3232', '12阶战圣护膝');
INSERT INTO `bg_items` VALUES ('3233', '13阶战圣护膝');
INSERT INTO `bg_items` VALUES ('3234', '14阶战圣护膝');
INSERT INTO `bg_items` VALUES ('3235', '15阶战圣护膝');
INSERT INTO `bg_items` VALUES ('3236', '16阶战圣护膝');
INSERT INTO `bg_items` VALUES ('3237', '17阶战圣护膝');
INSERT INTO `bg_items` VALUES ('3238', '18阶战圣护膝');
INSERT INTO `bg_items` VALUES ('3239', '19阶战圣护膝');
INSERT INTO `bg_items` VALUES ('3240', '20阶战圣护膝');
INSERT INTO `bg_items` VALUES ('3241', '1阶法神护肩');
INSERT INTO `bg_items` VALUES ('3242', '2阶法神护肩');
INSERT INTO `bg_items` VALUES ('3243', '3阶法神护肩');
INSERT INTO `bg_items` VALUES ('3244', '4阶法神护肩');
INSERT INTO `bg_items` VALUES ('3245', '5阶法神护肩');
INSERT INTO `bg_items` VALUES ('3246', '6阶法神护肩');
INSERT INTO `bg_items` VALUES ('3247', '7阶法神护肩');
INSERT INTO `bg_items` VALUES ('3248', '8阶法神护肩');
INSERT INTO `bg_items` VALUES ('3249', '9阶法神护肩');
INSERT INTO `bg_items` VALUES ('3250', '10阶法神护肩');
INSERT INTO `bg_items` VALUES ('3251', '11阶法神护肩');
INSERT INTO `bg_items` VALUES ('3252', '12阶法神护肩');
INSERT INTO `bg_items` VALUES ('3253', '13阶法神护肩');
INSERT INTO `bg_items` VALUES ('3254', '14阶法神护肩');
INSERT INTO `bg_items` VALUES ('3255', '15阶法神护肩');
INSERT INTO `bg_items` VALUES ('3256', '16阶法神护肩');
INSERT INTO `bg_items` VALUES ('3257', '17阶法神护肩');
INSERT INTO `bg_items` VALUES ('3258', '18阶法神护肩');
INSERT INTO `bg_items` VALUES ('3259', '19阶法神护肩');
INSERT INTO `bg_items` VALUES ('3260', '20阶法神护肩');
INSERT INTO `bg_items` VALUES ('3261', '1阶法神护坠');
INSERT INTO `bg_items` VALUES ('3262', '2阶法神护坠');
INSERT INTO `bg_items` VALUES ('3263', '3阶法神护坠');
INSERT INTO `bg_items` VALUES ('3264', '4阶法神护坠');
INSERT INTO `bg_items` VALUES ('3265', '5阶法神护坠');
INSERT INTO `bg_items` VALUES ('3266', '6阶法神护坠');
INSERT INTO `bg_items` VALUES ('3267', '7阶法神护坠');
INSERT INTO `bg_items` VALUES ('3268', '8阶法神护坠');
INSERT INTO `bg_items` VALUES ('3269', '9阶法神护坠');
INSERT INTO `bg_items` VALUES ('3270', '10阶法神护坠');
INSERT INTO `bg_items` VALUES ('3271', '11阶法神护坠');
INSERT INTO `bg_items` VALUES ('3272', '12阶法神护坠');
INSERT INTO `bg_items` VALUES ('3273', '13阶法神护坠');
INSERT INTO `bg_items` VALUES ('3274', '14阶法神护坠');
INSERT INTO `bg_items` VALUES ('3275', '15阶法神护坠');
INSERT INTO `bg_items` VALUES ('3276', '16阶法神护坠');
INSERT INTO `bg_items` VALUES ('3277', '17阶法神护坠');
INSERT INTO `bg_items` VALUES ('3278', '18阶法神护坠');
INSERT INTO `bg_items` VALUES ('3279', '19阶法神护坠');
INSERT INTO `bg_items` VALUES ('3280', '20阶法神护坠');
INSERT INTO `bg_items` VALUES ('3281', '1阶法神护镜');
INSERT INTO `bg_items` VALUES ('3282', '2阶法神护镜');
INSERT INTO `bg_items` VALUES ('3283', '3阶法神护镜');
INSERT INTO `bg_items` VALUES ('3284', '4阶法神护镜');
INSERT INTO `bg_items` VALUES ('3285', '5阶法神护镜');
INSERT INTO `bg_items` VALUES ('3286', '6阶法神护镜');
INSERT INTO `bg_items` VALUES ('3287', '7阶法神护镜');
INSERT INTO `bg_items` VALUES ('3288', '8阶法神护镜');
INSERT INTO `bg_items` VALUES ('3289', '9阶法神护镜');
INSERT INTO `bg_items` VALUES ('3290', '10阶法神护镜');
INSERT INTO `bg_items` VALUES ('3291', '11阶法神护镜');
INSERT INTO `bg_items` VALUES ('3292', '12阶法神护镜');
INSERT INTO `bg_items` VALUES ('3293', '13阶法神护镜');
INSERT INTO `bg_items` VALUES ('3294', '14阶法神护镜');
INSERT INTO `bg_items` VALUES ('3295', '15阶法神护镜');
INSERT INTO `bg_items` VALUES ('3296', '16阶法神护镜');
INSERT INTO `bg_items` VALUES ('3297', '17阶法神护镜');
INSERT INTO `bg_items` VALUES ('3298', '18阶法神护镜');
INSERT INTO `bg_items` VALUES ('3299', '19阶法神护镜');
INSERT INTO `bg_items` VALUES ('3300', '20阶法神护镜');
INSERT INTO `bg_items` VALUES ('3301', '1阶法神护膝');
INSERT INTO `bg_items` VALUES ('3302', '2阶法神护膝');
INSERT INTO `bg_items` VALUES ('3303', '3阶法神护膝');
INSERT INTO `bg_items` VALUES ('3304', '4阶法神护膝');
INSERT INTO `bg_items` VALUES ('3305', '5阶法神护膝');
INSERT INTO `bg_items` VALUES ('3306', '6阶法神护膝');
INSERT INTO `bg_items` VALUES ('3307', '7阶法神护膝');
INSERT INTO `bg_items` VALUES ('3308', '8阶法神护膝');
INSERT INTO `bg_items` VALUES ('3309', '9阶法神护膝');
INSERT INTO `bg_items` VALUES ('3310', '10阶法神护膝');
INSERT INTO `bg_items` VALUES ('3311', '11阶法神护膝');
INSERT INTO `bg_items` VALUES ('3312', '12阶法神护膝');
INSERT INTO `bg_items` VALUES ('3313', '13阶法神护膝');
INSERT INTO `bg_items` VALUES ('3314', '14阶法神护膝');
INSERT INTO `bg_items` VALUES ('3315', '15阶法神护膝');
INSERT INTO `bg_items` VALUES ('3316', '16阶法神护膝');
INSERT INTO `bg_items` VALUES ('3317', '17阶法神护膝');
INSERT INTO `bg_items` VALUES ('3318', '18阶法神护膝');
INSERT INTO `bg_items` VALUES ('3319', '19阶法神护膝');
INSERT INTO `bg_items` VALUES ('3320', '20阶法神护膝');
INSERT INTO `bg_items` VALUES ('3321', '1阶道尊护肩');
INSERT INTO `bg_items` VALUES ('3322', '2阶道尊护肩');
INSERT INTO `bg_items` VALUES ('3323', '3阶道尊护肩');
INSERT INTO `bg_items` VALUES ('3324', '4阶道尊护肩');
INSERT INTO `bg_items` VALUES ('3325', '5阶道尊护肩');
INSERT INTO `bg_items` VALUES ('3326', '6阶道尊护肩');
INSERT INTO `bg_items` VALUES ('3327', '7阶道尊护肩');
INSERT INTO `bg_items` VALUES ('3328', '8阶道尊护肩');
INSERT INTO `bg_items` VALUES ('3329', '9阶道尊护肩');
INSERT INTO `bg_items` VALUES ('3330', '10阶道尊护肩');
INSERT INTO `bg_items` VALUES ('3331', '11阶道尊护肩');
INSERT INTO `bg_items` VALUES ('3332', '12阶道尊护肩');
INSERT INTO `bg_items` VALUES ('3333', '13阶道尊护肩');
INSERT INTO `bg_items` VALUES ('3334', '14阶道尊护肩');
INSERT INTO `bg_items` VALUES ('3335', '15阶道尊护肩');
INSERT INTO `bg_items` VALUES ('3336', '16阶道尊护肩');
INSERT INTO `bg_items` VALUES ('3337', '17阶道尊护肩');
INSERT INTO `bg_items` VALUES ('3338', '18阶道尊护肩');
INSERT INTO `bg_items` VALUES ('3339', '19阶道尊护肩');
INSERT INTO `bg_items` VALUES ('3340', '20阶道尊护肩');
INSERT INTO `bg_items` VALUES ('3341', '1阶道尊护坠');
INSERT INTO `bg_items` VALUES ('3342', '2阶道尊护坠');
INSERT INTO `bg_items` VALUES ('3343', '3阶道尊护坠');
INSERT INTO `bg_items` VALUES ('3344', '4阶道尊护坠');
INSERT INTO `bg_items` VALUES ('3345', '5阶道尊护坠');
INSERT INTO `bg_items` VALUES ('3346', '6阶道尊护坠');
INSERT INTO `bg_items` VALUES ('3347', '7阶道尊护坠');
INSERT INTO `bg_items` VALUES ('3348', '8阶道尊护坠');
INSERT INTO `bg_items` VALUES ('3349', '9阶道尊护坠');
INSERT INTO `bg_items` VALUES ('3350', '10阶道尊护坠');
INSERT INTO `bg_items` VALUES ('3351', '11阶道尊护坠');
INSERT INTO `bg_items` VALUES ('3352', '12阶道尊护坠');
INSERT INTO `bg_items` VALUES ('3353', '13阶道尊护坠');
INSERT INTO `bg_items` VALUES ('3354', '14阶道尊护坠');
INSERT INTO `bg_items` VALUES ('3355', '15阶道尊护坠');
INSERT INTO `bg_items` VALUES ('3356', '16阶道尊护坠');
INSERT INTO `bg_items` VALUES ('3357', '17阶道尊护坠');
INSERT INTO `bg_items` VALUES ('3358', '18阶道尊护坠');
INSERT INTO `bg_items` VALUES ('3359', '19阶道尊护坠');
INSERT INTO `bg_items` VALUES ('3360', '20阶道尊护坠');
INSERT INTO `bg_items` VALUES ('3361', '1阶道尊护镜');
INSERT INTO `bg_items` VALUES ('3362', '2阶道尊护镜');
INSERT INTO `bg_items` VALUES ('3363', '3阶道尊护镜');
INSERT INTO `bg_items` VALUES ('3364', '4阶道尊护镜');
INSERT INTO `bg_items` VALUES ('3365', '5阶道尊护镜');
INSERT INTO `bg_items` VALUES ('3366', '6阶道尊护镜');
INSERT INTO `bg_items` VALUES ('3367', '7阶道尊护镜');
INSERT INTO `bg_items` VALUES ('3368', '8阶道尊护镜');
INSERT INTO `bg_items` VALUES ('3369', '9阶道尊护镜');
INSERT INTO `bg_items` VALUES ('3370', '10阶道尊护镜');
INSERT INTO `bg_items` VALUES ('3371', '11阶道尊护镜');
INSERT INTO `bg_items` VALUES ('3372', '12阶道尊护镜');
INSERT INTO `bg_items` VALUES ('3373', '13阶道尊护镜');
INSERT INTO `bg_items` VALUES ('3374', '14阶道尊护镜');
INSERT INTO `bg_items` VALUES ('3375', '15阶道尊护镜');
INSERT INTO `bg_items` VALUES ('3376', '16阶道尊护镜');
INSERT INTO `bg_items` VALUES ('3377', '17阶道尊护镜');
INSERT INTO `bg_items` VALUES ('3378', '18阶道尊护镜');
INSERT INTO `bg_items` VALUES ('3379', '19阶道尊护镜');
INSERT INTO `bg_items` VALUES ('3380', '20阶道尊护镜');
INSERT INTO `bg_items` VALUES ('3381', '1阶道尊护膝');
INSERT INTO `bg_items` VALUES ('3382', '2阶道尊护膝');
INSERT INTO `bg_items` VALUES ('3383', '3阶道尊护膝');
INSERT INTO `bg_items` VALUES ('3384', '4阶道尊护膝');
INSERT INTO `bg_items` VALUES ('3385', '5阶道尊护膝');
INSERT INTO `bg_items` VALUES ('3386', '6阶道尊护膝');
INSERT INTO `bg_items` VALUES ('3387', '7阶道尊护膝');
INSERT INTO `bg_items` VALUES ('3388', '8阶道尊护膝');
INSERT INTO `bg_items` VALUES ('3389', '9阶道尊护膝');
INSERT INTO `bg_items` VALUES ('3390', '10阶道尊护膝');
INSERT INTO `bg_items` VALUES ('3391', '11阶道尊护膝');
INSERT INTO `bg_items` VALUES ('3392', '12阶道尊护膝');
INSERT INTO `bg_items` VALUES ('3393', '13阶道尊护膝');
INSERT INTO `bg_items` VALUES ('3394', '14阶道尊护膝');
INSERT INTO `bg_items` VALUES ('3395', '15阶道尊护膝');
INSERT INTO `bg_items` VALUES ('3396', '16阶道尊护膝');
INSERT INTO `bg_items` VALUES ('3397', '17阶道尊护膝');
INSERT INTO `bg_items` VALUES ('3398', '18阶道尊护膝');
INSERT INTO `bg_items` VALUES ('3399', '19阶道尊护膝');
INSERT INTO `bg_items` VALUES ('3400', '20阶道尊护膝');
INSERT INTO `bg_items` VALUES ('3401', '1阶生命宝石');
INSERT INTO `bg_items` VALUES ('3402', '2阶生命宝石');
INSERT INTO `bg_items` VALUES ('3403', '3阶生命宝石');
INSERT INTO `bg_items` VALUES ('3404', '4阶生命宝石');
INSERT INTO `bg_items` VALUES ('3405', '5阶生命宝石');
INSERT INTO `bg_items` VALUES ('3406', '6阶生命宝石');
INSERT INTO `bg_items` VALUES ('3407', '7阶生命宝石');
INSERT INTO `bg_items` VALUES ('3408', '8阶生命宝石');
INSERT INTO `bg_items` VALUES ('3409', '9阶生命宝石');
INSERT INTO `bg_items` VALUES ('3410', '10阶生命宝石');
INSERT INTO `bg_items` VALUES ('3411', '11阶生命宝石');
INSERT INTO `bg_items` VALUES ('3412', '12阶生命宝石');
INSERT INTO `bg_items` VALUES ('3413', '13阶生命宝石');
INSERT INTO `bg_items` VALUES ('3414', '14阶生命宝石');
INSERT INTO `bg_items` VALUES ('3415', '15阶生命宝石');
INSERT INTO `bg_items` VALUES ('3416', '16阶生命宝石');
INSERT INTO `bg_items` VALUES ('3417', '17阶生命宝石');
INSERT INTO `bg_items` VALUES ('3418', '18阶生命宝石');
INSERT INTO `bg_items` VALUES ('3419', '19阶生命宝石');
INSERT INTO `bg_items` VALUES ('3420', '20阶生命宝石');
INSERT INTO `bg_items` VALUES ('3421', '1阶攻击宝石');
INSERT INTO `bg_items` VALUES ('3422', '2阶攻击宝石');
INSERT INTO `bg_items` VALUES ('3423', '3阶攻击宝石');
INSERT INTO `bg_items` VALUES ('3424', '4阶攻击宝石');
INSERT INTO `bg_items` VALUES ('3425', '5阶攻击宝石');
INSERT INTO `bg_items` VALUES ('3426', '6阶攻击宝石');
INSERT INTO `bg_items` VALUES ('3427', '7阶攻击宝石');
INSERT INTO `bg_items` VALUES ('3428', '8阶攻击宝石');
INSERT INTO `bg_items` VALUES ('3429', '9阶攻击宝石');
INSERT INTO `bg_items` VALUES ('3430', '10阶攻击宝石');
INSERT INTO `bg_items` VALUES ('3431', '11阶攻击宝石');
INSERT INTO `bg_items` VALUES ('3432', '12阶攻击宝石');
INSERT INTO `bg_items` VALUES ('3433', '13阶攻击宝石');
INSERT INTO `bg_items` VALUES ('3434', '14阶攻击宝石');
INSERT INTO `bg_items` VALUES ('3435', '15阶攻击宝石');
INSERT INTO `bg_items` VALUES ('3436', '16阶攻击宝石');
INSERT INTO `bg_items` VALUES ('3437', '17阶攻击宝石');
INSERT INTO `bg_items` VALUES ('3438', '18阶攻击宝石');
INSERT INTO `bg_items` VALUES ('3439', '19阶攻击宝石');
INSERT INTO `bg_items` VALUES ('3440', '20阶攻击宝石');
INSERT INTO `bg_items` VALUES ('3441', '1阶物防宝石');
INSERT INTO `bg_items` VALUES ('3442', '2阶物防宝石');
INSERT INTO `bg_items` VALUES ('3443', '3阶物防宝石');
INSERT INTO `bg_items` VALUES ('3444', '4阶物防宝石');
INSERT INTO `bg_items` VALUES ('3445', '5阶物防宝石');
INSERT INTO `bg_items` VALUES ('3446', '6阶物防宝石');
INSERT INTO `bg_items` VALUES ('3447', '7阶物防宝石');
INSERT INTO `bg_items` VALUES ('3448', '8阶物防宝石');
INSERT INTO `bg_items` VALUES ('3449', '9阶物防宝石');
INSERT INTO `bg_items` VALUES ('3450', '10阶物防宝石');
INSERT INTO `bg_items` VALUES ('3451', '11阶物防宝石');
INSERT INTO `bg_items` VALUES ('3452', '12阶物防宝石');
INSERT INTO `bg_items` VALUES ('3453', '13阶物防宝石');
INSERT INTO `bg_items` VALUES ('3454', '14阶物防宝石');
INSERT INTO `bg_items` VALUES ('3455', '15阶物防宝石');
INSERT INTO `bg_items` VALUES ('3456', '16阶物防宝石');
INSERT INTO `bg_items` VALUES ('3457', '17阶物防宝石');
INSERT INTO `bg_items` VALUES ('3458', '18阶物防宝石');
INSERT INTO `bg_items` VALUES ('3459', '19阶物防宝石');
INSERT INTO `bg_items` VALUES ('3460', '20阶物防宝石');
INSERT INTO `bg_items` VALUES ('3461', '1阶魔防宝石');
INSERT INTO `bg_items` VALUES ('3462', '2阶魔防宝石');
INSERT INTO `bg_items` VALUES ('3463', '3阶魔防宝石');
INSERT INTO `bg_items` VALUES ('3464', '4阶魔防宝石');
INSERT INTO `bg_items` VALUES ('3465', '5阶魔防宝石');
INSERT INTO `bg_items` VALUES ('3466', '6阶魔防宝石');
INSERT INTO `bg_items` VALUES ('3467', '7阶魔防宝石');
INSERT INTO `bg_items` VALUES ('3468', '8阶魔防宝石');
INSERT INTO `bg_items` VALUES ('3469', '9阶魔防宝石');
INSERT INTO `bg_items` VALUES ('3470', '10阶魔防宝石');
INSERT INTO `bg_items` VALUES ('3471', '11阶魔防宝石');
INSERT INTO `bg_items` VALUES ('3472', '12阶魔防宝石');
INSERT INTO `bg_items` VALUES ('3473', '13阶魔防宝石');
INSERT INTO `bg_items` VALUES ('3474', '14阶魔防宝石');
INSERT INTO `bg_items` VALUES ('3475', '15阶魔防宝石');
INSERT INTO `bg_items` VALUES ('3476', '16阶魔防宝石');
INSERT INTO `bg_items` VALUES ('3477', '17阶魔防宝石');
INSERT INTO `bg_items` VALUES ('3478', '18阶魔防宝石');
INSERT INTO `bg_items` VALUES ('3479', '19阶魔防宝石');
INSERT INTO `bg_items` VALUES ('3480', '20阶魔防宝石');
INSERT INTO `bg_items` VALUES ('3481', '1阶暴击宝石');
INSERT INTO `bg_items` VALUES ('3482', '2阶暴击宝石');
INSERT INTO `bg_items` VALUES ('3483', '3阶暴击宝石');
INSERT INTO `bg_items` VALUES ('3484', '4阶暴击宝石');
INSERT INTO `bg_items` VALUES ('3485', '5阶暴击宝石');
INSERT INTO `bg_items` VALUES ('3486', '6阶暴击宝石');
INSERT INTO `bg_items` VALUES ('3487', '7阶暴击宝石');
INSERT INTO `bg_items` VALUES ('3488', '8阶暴击宝石');
INSERT INTO `bg_items` VALUES ('3489', '9阶暴击宝石');
INSERT INTO `bg_items` VALUES ('3490', '10阶暴击宝石');
INSERT INTO `bg_items` VALUES ('3491', '11阶暴击宝石');
INSERT INTO `bg_items` VALUES ('3492', '12阶暴击宝石');
INSERT INTO `bg_items` VALUES ('3493', '13阶暴击宝石');
INSERT INTO `bg_items` VALUES ('3494', '14阶暴击宝石');
INSERT INTO `bg_items` VALUES ('3495', '15阶暴击宝石');
INSERT INTO `bg_items` VALUES ('3496', '16阶暴击宝石');
INSERT INTO `bg_items` VALUES ('3497', '17阶暴击宝石');
INSERT INTO `bg_items` VALUES ('3498', '18阶暴击宝石');
INSERT INTO `bg_items` VALUES ('3499', '19阶暴击宝石');
INSERT INTO `bg_items` VALUES ('3500', '20阶暴击宝石');
INSERT INTO `bg_items` VALUES ('3501', '天元战符');
INSERT INTO `bg_items` VALUES ('3502', '二仪战符');
INSERT INTO `bg_items` VALUES ('3503', '三才战符');
INSERT INTO `bg_items` VALUES ('3504', '四象战符');
INSERT INTO `bg_items` VALUES ('3505', '五行战符');
INSERT INTO `bg_items` VALUES ('3506', '六和战符');
INSERT INTO `bg_items` VALUES ('3507', '七星战符');
INSERT INTO `bg_items` VALUES ('3508', '八卦战符');
INSERT INTO `bg_items` VALUES ('3509', '九宫战符');
INSERT INTO `bg_items` VALUES ('3510', '留空');
INSERT INTO `bg_items` VALUES ('3511', '1阶王者宝石');
INSERT INTO `bg_items` VALUES ('3512', '2阶王者宝石');
INSERT INTO `bg_items` VALUES ('3513', '3阶王者宝石');
INSERT INTO `bg_items` VALUES ('3514', '4阶王者宝石');
INSERT INTO `bg_items` VALUES ('3515', '5阶王者宝石');
INSERT INTO `bg_items` VALUES ('3516', '6阶王者宝石');
INSERT INTO `bg_items` VALUES ('3517', '7阶王者宝石');
INSERT INTO `bg_items` VALUES ('3518', '8阶王者宝石');
INSERT INTO `bg_items` VALUES ('3519', '9阶王者宝石');
INSERT INTO `bg_items` VALUES ('3520', '10阶王者宝石');
INSERT INTO `bg_items` VALUES ('3521', '11阶王者宝石');
INSERT INTO `bg_items` VALUES ('3522', '12阶王者宝石');
INSERT INTO `bg_items` VALUES ('3523', '13阶王者宝石');
INSERT INTO `bg_items` VALUES ('3524', '14阶王者宝石');
INSERT INTO `bg_items` VALUES ('3525', '15阶王者宝石');
INSERT INTO `bg_items` VALUES ('3526', '16阶王者宝石');
INSERT INTO `bg_items` VALUES ('3527', '17阶王者宝石');
INSERT INTO `bg_items` VALUES ('3528', '18阶王者宝石');
INSERT INTO `bg_items` VALUES ('3529', '19阶王者宝石');
INSERT INTO `bg_items` VALUES ('3530', '20阶王者宝石');
INSERT INTO `bg_items` VALUES ('3531', '三才战符(一小时)');
INSERT INTO `bg_items` VALUES ('3532', '留空');
INSERT INTO `bg_items` VALUES ('3533', '留空');
INSERT INTO `bg_items` VALUES ('3534', '留空');
INSERT INTO `bg_items` VALUES ('3535', '留空');
INSERT INTO `bg_items` VALUES ('3536', '留空');
INSERT INTO `bg_items` VALUES ('3537', '留空');
INSERT INTO `bg_items` VALUES ('3538', '留空');
INSERT INTO `bg_items` VALUES ('3539', '留空');
INSERT INTO `bg_items` VALUES ('3540', '留空');
INSERT INTO `bg_items` VALUES ('3541', '留空');
INSERT INTO `bg_items` VALUES ('3542', '留空');
INSERT INTO `bg_items` VALUES ('3543', '留空');
INSERT INTO `bg_items` VALUES ('3544', '留空');
INSERT INTO `bg_items` VALUES ('3545', '留空');
INSERT INTO `bg_items` VALUES ('3546', '留空');
INSERT INTO `bg_items` VALUES ('3547', '留空');
INSERT INTO `bg_items` VALUES ('3548', '留空');
INSERT INTO `bg_items` VALUES ('3549', '留空');
INSERT INTO `bg_items` VALUES ('3550', '留空');
INSERT INTO `bg_items` VALUES ('3551', '留空');
INSERT INTO `bg_items` VALUES ('3552', '留空');
INSERT INTO `bg_items` VALUES ('3553', '留空');
INSERT INTO `bg_items` VALUES ('3554', '留空');
INSERT INTO `bg_items` VALUES ('3555', '留空');
INSERT INTO `bg_items` VALUES ('3556', '留空');
INSERT INTO `bg_items` VALUES ('3557', '留空');
INSERT INTO `bg_items` VALUES ('3558', '留空');
INSERT INTO `bg_items` VALUES ('3559', '留空');
INSERT INTO `bg_items` VALUES ('3560', '留空');
INSERT INTO `bg_items` VALUES ('3561', '留空');
INSERT INTO `bg_items` VALUES ('3562', '留空');
INSERT INTO `bg_items` VALUES ('3563', '留空');
INSERT INTO `bg_items` VALUES ('3564', '留空');
INSERT INTO `bg_items` VALUES ('3565', '留空');
INSERT INTO `bg_items` VALUES ('3566', '留空');
INSERT INTO `bg_items` VALUES ('3567', '留空');
INSERT INTO `bg_items` VALUES ('3568', '留空');
INSERT INTO `bg_items` VALUES ('3569', '留空');
INSERT INTO `bg_items` VALUES ('3570', '留空');
INSERT INTO `bg_items` VALUES ('3571', '留空');
INSERT INTO `bg_items` VALUES ('3572', '留空');
INSERT INTO `bg_items` VALUES ('3573', '留空');
INSERT INTO `bg_items` VALUES ('3574', '留空');
INSERT INTO `bg_items` VALUES ('3575', '留空');
INSERT INTO `bg_items` VALUES ('3576', '留空');
INSERT INTO `bg_items` VALUES ('3577', '留空');
INSERT INTO `bg_items` VALUES ('3578', '留空');
INSERT INTO `bg_items` VALUES ('3579', '留空');
INSERT INTO `bg_items` VALUES ('3580', '留空');
INSERT INTO `bg_items` VALUES ('3581', '留空');
INSERT INTO `bg_items` VALUES ('3582', '留空');
INSERT INTO `bg_items` VALUES ('3583', '留空');
INSERT INTO `bg_items` VALUES ('3584', '留空');
INSERT INTO `bg_items` VALUES ('3585', '留空');
INSERT INTO `bg_items` VALUES ('3586', '留空');
INSERT INTO `bg_items` VALUES ('3587', '留空');
INSERT INTO `bg_items` VALUES ('3588', '留空');
INSERT INTO `bg_items` VALUES ('3589', '留空');
INSERT INTO `bg_items` VALUES ('3590', '留空');
INSERT INTO `bg_items` VALUES ('3591', '留空');
INSERT INTO `bg_items` VALUES ('3592', '留空');
INSERT INTO `bg_items` VALUES ('3593', '留空');
INSERT INTO `bg_items` VALUES ('3594', '留空');
INSERT INTO `bg_items` VALUES ('3595', '留空');
INSERT INTO `bg_items` VALUES ('3596', '留空');
INSERT INTO `bg_items` VALUES ('3597', '留空');
INSERT INTO `bg_items` VALUES ('3598', '留空');
INSERT INTO `bg_items` VALUES ('3599', '留空');
INSERT INTO `bg_items` VALUES ('3600', '留空');
INSERT INTO `bg_items` VALUES ('3601', '留空');
INSERT INTO `bg_items` VALUES ('3602', '留空');
INSERT INTO `bg_items` VALUES ('3603', '留空');
INSERT INTO `bg_items` VALUES ('3604', '留空');
INSERT INTO `bg_items` VALUES ('3605', '留空');
INSERT INTO `bg_items` VALUES ('3606', '留空');
INSERT INTO `bg_items` VALUES ('3607', '留空');
INSERT INTO `bg_items` VALUES ('3608', '留空');
INSERT INTO `bg_items` VALUES ('3609', '留空');
INSERT INTO `bg_items` VALUES ('3610', '留空');
INSERT INTO `bg_items` VALUES ('3611', '留空');
INSERT INTO `bg_items` VALUES ('3612', '留空');
INSERT INTO `bg_items` VALUES ('3613', '留空');
INSERT INTO `bg_items` VALUES ('3614', '留空');
INSERT INTO `bg_items` VALUES ('3615', '留空');
INSERT INTO `bg_items` VALUES ('3616', '留空');
INSERT INTO `bg_items` VALUES ('3617', '留空');
INSERT INTO `bg_items` VALUES ('3618', '留空');
INSERT INTO `bg_items` VALUES ('3619', '留空');
INSERT INTO `bg_items` VALUES ('3620', '留空');
INSERT INTO `bg_items` VALUES ('3621', '留空');
INSERT INTO `bg_items` VALUES ('3622', '留空');
INSERT INTO `bg_items` VALUES ('3623', '留空');
INSERT INTO `bg_items` VALUES ('3624', '留空');
INSERT INTO `bg_items` VALUES ('3625', '留空');
INSERT INTO `bg_items` VALUES ('3626', '留空');
INSERT INTO `bg_items` VALUES ('3627', '留空');
INSERT INTO `bg_items` VALUES ('3628', '留空');
INSERT INTO `bg_items` VALUES ('3629', '留空');
INSERT INTO `bg_items` VALUES ('3630', '留空');
INSERT INTO `bg_items` VALUES ('3631', '留空');
INSERT INTO `bg_items` VALUES ('3632', '留空');
INSERT INTO `bg_items` VALUES ('3633', '留空');
INSERT INTO `bg_items` VALUES ('3634', '留空');
INSERT INTO `bg_items` VALUES ('3635', '留空');
INSERT INTO `bg_items` VALUES ('3636', '留空');
INSERT INTO `bg_items` VALUES ('3637', '留空');
INSERT INTO `bg_items` VALUES ('3638', '留空');
INSERT INTO `bg_items` VALUES ('3639', '留空');
INSERT INTO `bg_items` VALUES ('3640', '留空');
INSERT INTO `bg_items` VALUES ('3641', '留空');
INSERT INTO `bg_items` VALUES ('3642', '留空');
INSERT INTO `bg_items` VALUES ('3643', '留空');
INSERT INTO `bg_items` VALUES ('3644', '留空');
INSERT INTO `bg_items` VALUES ('3645', '留空');
INSERT INTO `bg_items` VALUES ('3646', '留空');
INSERT INTO `bg_items` VALUES ('3647', '留空');
INSERT INTO `bg_items` VALUES ('3648', '留空');
INSERT INTO `bg_items` VALUES ('3649', '留空');
INSERT INTO `bg_items` VALUES ('3650', '留空');
INSERT INTO `bg_items` VALUES ('3651', '留空');
INSERT INTO `bg_items` VALUES ('3652', '留空');
INSERT INTO `bg_items` VALUES ('3653', '留空');
INSERT INTO `bg_items` VALUES ('3654', '留空');
INSERT INTO `bg_items` VALUES ('3655', '留空');
INSERT INTO `bg_items` VALUES ('3656', '留空');
INSERT INTO `bg_items` VALUES ('3657', '留空');
INSERT INTO `bg_items` VALUES ('3658', '留空');
INSERT INTO `bg_items` VALUES ('3659', '留空');
INSERT INTO `bg_items` VALUES ('3660', '留空');
INSERT INTO `bg_items` VALUES ('3661', '留空');
INSERT INTO `bg_items` VALUES ('3662', '留空');
INSERT INTO `bg_items` VALUES ('3663', '留空');
INSERT INTO `bg_items` VALUES ('3664', '留空');
INSERT INTO `bg_items` VALUES ('3665', '留空');
INSERT INTO `bg_items` VALUES ('3666', '留空');
INSERT INTO `bg_items` VALUES ('3667', '留空');
INSERT INTO `bg_items` VALUES ('3668', '留空');
INSERT INTO `bg_items` VALUES ('3669', '留空');
INSERT INTO `bg_items` VALUES ('3670', '留空');
INSERT INTO `bg_items` VALUES ('3671', '留空');
INSERT INTO `bg_items` VALUES ('3672', '留空');
INSERT INTO `bg_items` VALUES ('3673', '留空');
INSERT INTO `bg_items` VALUES ('3674', '留空');
INSERT INTO `bg_items` VALUES ('3675', '留空');
INSERT INTO `bg_items` VALUES ('3676', '留空');
INSERT INTO `bg_items` VALUES ('3677', '留空');
INSERT INTO `bg_items` VALUES ('3678', '留空');
INSERT INTO `bg_items` VALUES ('3679', '留空');
INSERT INTO `bg_items` VALUES ('3680', '留空');
INSERT INTO `bg_items` VALUES ('3681', '留空');
INSERT INTO `bg_items` VALUES ('3682', '留空');
INSERT INTO `bg_items` VALUES ('3683', '留空');
INSERT INTO `bg_items` VALUES ('3684', '留空');
INSERT INTO `bg_items` VALUES ('3685', '留空');
INSERT INTO `bg_items` VALUES ('3686', '留空');
INSERT INTO `bg_items` VALUES ('3687', '留空');
INSERT INTO `bg_items` VALUES ('3688', '留空');
INSERT INTO `bg_items` VALUES ('3689', '留空');
INSERT INTO `bg_items` VALUES ('3690', '留空');
INSERT INTO `bg_items` VALUES ('3691', '留空');
INSERT INTO `bg_items` VALUES ('3692', '留空');
INSERT INTO `bg_items` VALUES ('3693', '留空');
INSERT INTO `bg_items` VALUES ('3694', '留空');
INSERT INTO `bg_items` VALUES ('3695', '留空');
INSERT INTO `bg_items` VALUES ('3696', '留空');
INSERT INTO `bg_items` VALUES ('3697', '留空');
INSERT INTO `bg_items` VALUES ('3698', '留空');
INSERT INTO `bg_items` VALUES ('3699', '留空');
INSERT INTO `bg_items` VALUES ('3700', '留空');
INSERT INTO `bg_items` VALUES ('3701', '留空');
INSERT INTO `bg_items` VALUES ('3702', '留空');
INSERT INTO `bg_items` VALUES ('3703', '留空');
INSERT INTO `bg_items` VALUES ('3704', '留空');
INSERT INTO `bg_items` VALUES ('3705', '留空');
INSERT INTO `bg_items` VALUES ('3706', '留空');
INSERT INTO `bg_items` VALUES ('3707', '留空');
INSERT INTO `bg_items` VALUES ('3708', '留空');
INSERT INTO `bg_items` VALUES ('3709', '留空');
INSERT INTO `bg_items` VALUES ('3710', '留空');
INSERT INTO `bg_items` VALUES ('3711', '留空');
INSERT INTO `bg_items` VALUES ('3712', '留空');
INSERT INTO `bg_items` VALUES ('3713', '留空');
INSERT INTO `bg_items` VALUES ('3714', '留空');
INSERT INTO `bg_items` VALUES ('3715', '留空');
INSERT INTO `bg_items` VALUES ('3716', '留空');
INSERT INTO `bg_items` VALUES ('3717', '留空');
INSERT INTO `bg_items` VALUES ('3718', '留空');
INSERT INTO `bg_items` VALUES ('3719', '留空');
INSERT INTO `bg_items` VALUES ('3720', '留空');
INSERT INTO `bg_items` VALUES ('3721', '留空');
INSERT INTO `bg_items` VALUES ('3722', '留空');
INSERT INTO `bg_items` VALUES ('3723', '留空');
INSERT INTO `bg_items` VALUES ('3724', '留空');
INSERT INTO `bg_items` VALUES ('3725', '留空');
INSERT INTO `bg_items` VALUES ('3726', '留空');
INSERT INTO `bg_items` VALUES ('3727', '留空');
INSERT INTO `bg_items` VALUES ('3728', '留空');
INSERT INTO `bg_items` VALUES ('3729', '留空');
INSERT INTO `bg_items` VALUES ('3730', '留空');
INSERT INTO `bg_items` VALUES ('3731', '留空');
INSERT INTO `bg_items` VALUES ('3732', '留空');
INSERT INTO `bg_items` VALUES ('3733', '留空');
INSERT INTO `bg_items` VALUES ('3734', '留空');
INSERT INTO `bg_items` VALUES ('3735', '留空');
INSERT INTO `bg_items` VALUES ('3736', '留空');
INSERT INTO `bg_items` VALUES ('3737', '留空');
INSERT INTO `bg_items` VALUES ('3738', '留空');
INSERT INTO `bg_items` VALUES ('3739', '留空');
INSERT INTO `bg_items` VALUES ('3740', '留空');
INSERT INTO `bg_items` VALUES ('3741', '留空');
INSERT INTO `bg_items` VALUES ('3742', '留空');
INSERT INTO `bg_items` VALUES ('3743', '留空');
INSERT INTO `bg_items` VALUES ('3744', '留空');
INSERT INTO `bg_items` VALUES ('3745', '留空');
INSERT INTO `bg_items` VALUES ('3746', '留空');
INSERT INTO `bg_items` VALUES ('3747', '留空');
INSERT INTO `bg_items` VALUES ('3748', '留空');
INSERT INTO `bg_items` VALUES ('3749', '留空');
INSERT INTO `bg_items` VALUES ('3750', '留空');
INSERT INTO `bg_items` VALUES ('3751', '留空');
INSERT INTO `bg_items` VALUES ('3752', '留空');
INSERT INTO `bg_items` VALUES ('3753', '留空');
INSERT INTO `bg_items` VALUES ('3754', '留空');
INSERT INTO `bg_items` VALUES ('3755', '留空');
INSERT INTO `bg_items` VALUES ('3756', '留空');
INSERT INTO `bg_items` VALUES ('3757', '留空');
INSERT INTO `bg_items` VALUES ('3758', '留空');
INSERT INTO `bg_items` VALUES ('3759', '留空');
INSERT INTO `bg_items` VALUES ('3760', '留空');
INSERT INTO `bg_items` VALUES ('3761', '留空');
INSERT INTO `bg_items` VALUES ('3762', '留空');
INSERT INTO `bg_items` VALUES ('3763', '留空');
INSERT INTO `bg_items` VALUES ('3764', '留空');
INSERT INTO `bg_items` VALUES ('3765', '留空');
INSERT INTO `bg_items` VALUES ('3766', '留空');
INSERT INTO `bg_items` VALUES ('3767', '留空');
INSERT INTO `bg_items` VALUES ('3768', '留空');
INSERT INTO `bg_items` VALUES ('3769', '留空');
INSERT INTO `bg_items` VALUES ('3770', '留空');
INSERT INTO `bg_items` VALUES ('3771', '留空');
INSERT INTO `bg_items` VALUES ('3772', '留空');
INSERT INTO `bg_items` VALUES ('3773', '留空');
INSERT INTO `bg_items` VALUES ('3774', '留空');
INSERT INTO `bg_items` VALUES ('3775', '留空');
INSERT INTO `bg_items` VALUES ('3776', '留空');
INSERT INTO `bg_items` VALUES ('3777', '留空');
INSERT INTO `bg_items` VALUES ('3778', '留空');
INSERT INTO `bg_items` VALUES ('3779', '留空');
INSERT INTO `bg_items` VALUES ('3780', '留空');
INSERT INTO `bg_items` VALUES ('3781', '留空');
INSERT INTO `bg_items` VALUES ('3782', '留空');
INSERT INTO `bg_items` VALUES ('3783', '留空');
INSERT INTO `bg_items` VALUES ('3784', '留空');
INSERT INTO `bg_items` VALUES ('3785', '留空');
INSERT INTO `bg_items` VALUES ('3786', '留空');
INSERT INTO `bg_items` VALUES ('3787', '留空');
INSERT INTO `bg_items` VALUES ('3788', '留空');
INSERT INTO `bg_items` VALUES ('3789', '留空');
INSERT INTO `bg_items` VALUES ('3790', '留空');
INSERT INTO `bg_items` VALUES ('3791', '留空');
INSERT INTO `bg_items` VALUES ('3792', '留空');
INSERT INTO `bg_items` VALUES ('3793', '留空');
INSERT INTO `bg_items` VALUES ('3794', '留空');
INSERT INTO `bg_items` VALUES ('3795', '留空');
INSERT INTO `bg_items` VALUES ('3796', '留空');
INSERT INTO `bg_items` VALUES ('3797', '留空');
INSERT INTO `bg_items` VALUES ('3798', '留空');
INSERT INTO `bg_items` VALUES ('3799', '留空');
INSERT INTO `bg_items` VALUES ('3800', '留空');
INSERT INTO `bg_items` VALUES ('3801', '留空');
INSERT INTO `bg_items` VALUES ('3802', '留空');
INSERT INTO `bg_items` VALUES ('3803', '留空');
INSERT INTO `bg_items` VALUES ('3804', '留空');
INSERT INTO `bg_items` VALUES ('3805', '留空');
INSERT INTO `bg_items` VALUES ('3806', '留空');
INSERT INTO `bg_items` VALUES ('3807', '留空');
INSERT INTO `bg_items` VALUES ('3808', '留空');
INSERT INTO `bg_items` VALUES ('3809', '留空');
INSERT INTO `bg_items` VALUES ('3810', '留空');
INSERT INTO `bg_items` VALUES ('3811', '留空');
INSERT INTO `bg_items` VALUES ('3812', '留空');
INSERT INTO `bg_items` VALUES ('3813', '留空');
INSERT INTO `bg_items` VALUES ('3814', '留空');
INSERT INTO `bg_items` VALUES ('3815', '留空');
INSERT INTO `bg_items` VALUES ('3816', '留空');
INSERT INTO `bg_items` VALUES ('3817', '留空');
INSERT INTO `bg_items` VALUES ('3818', '留空');
INSERT INTO `bg_items` VALUES ('3819', '留空');
INSERT INTO `bg_items` VALUES ('3820', '留空');
INSERT INTO `bg_items` VALUES ('3821', '留空');
INSERT INTO `bg_items` VALUES ('3822', '留空');
INSERT INTO `bg_items` VALUES ('3823', '留空');
INSERT INTO `bg_items` VALUES ('3824', '留空');
INSERT INTO `bg_items` VALUES ('3825', '留空');
INSERT INTO `bg_items` VALUES ('3826', '留空');
INSERT INTO `bg_items` VALUES ('3827', '留空');
INSERT INTO `bg_items` VALUES ('3828', '留空');
INSERT INTO `bg_items` VALUES ('3829', '留空');
INSERT INTO `bg_items` VALUES ('3830', '留空');
INSERT INTO `bg_items` VALUES ('3831', '留空');
INSERT INTO `bg_items` VALUES ('3832', '留空');
INSERT INTO `bg_items` VALUES ('3833', '留空');
INSERT INTO `bg_items` VALUES ('3834', '留空');
INSERT INTO `bg_items` VALUES ('3835', '留空');
INSERT INTO `bg_items` VALUES ('3836', '留空');
INSERT INTO `bg_items` VALUES ('3837', '留空');
INSERT INTO `bg_items` VALUES ('3838', '留空');
INSERT INTO `bg_items` VALUES ('3839', '留空');
INSERT INTO `bg_items` VALUES ('3840', '留空');
INSERT INTO `bg_items` VALUES ('3841', '留空');
INSERT INTO `bg_items` VALUES ('3842', '留空');
INSERT INTO `bg_items` VALUES ('3843', '留空');
INSERT INTO `bg_items` VALUES ('3844', '留空');
INSERT INTO `bg_items` VALUES ('3845', '留空');
INSERT INTO `bg_items` VALUES ('3846', '留空');
INSERT INTO `bg_items` VALUES ('3847', '留空');
INSERT INTO `bg_items` VALUES ('3848', '留空');
INSERT INTO `bg_items` VALUES ('3849', '留空');
INSERT INTO `bg_items` VALUES ('3850', '留空');
INSERT INTO `bg_items` VALUES ('3851', '留空');
INSERT INTO `bg_items` VALUES ('3852', '留空');
INSERT INTO `bg_items` VALUES ('3853', '留空');
INSERT INTO `bg_items` VALUES ('3854', '留空');
INSERT INTO `bg_items` VALUES ('3855', '留空');
INSERT INTO `bg_items` VALUES ('3856', '留空');
INSERT INTO `bg_items` VALUES ('3857', '留空');
INSERT INTO `bg_items` VALUES ('3858', '留空');
INSERT INTO `bg_items` VALUES ('3859', '留空');
INSERT INTO `bg_items` VALUES ('3860', '留空');
INSERT INTO `bg_items` VALUES ('3861', '留空');
INSERT INTO `bg_items` VALUES ('3862', '留空');
INSERT INTO `bg_items` VALUES ('3863', '留空');
INSERT INTO `bg_items` VALUES ('3864', '留空');
INSERT INTO `bg_items` VALUES ('3865', '留空');
INSERT INTO `bg_items` VALUES ('3866', '留空');
INSERT INTO `bg_items` VALUES ('3867', '留空');
INSERT INTO `bg_items` VALUES ('3868', '留空');
INSERT INTO `bg_items` VALUES ('3869', '留空');
INSERT INTO `bg_items` VALUES ('3870', '留空');
INSERT INTO `bg_items` VALUES ('3871', '留空');
INSERT INTO `bg_items` VALUES ('3872', '留空');
INSERT INTO `bg_items` VALUES ('3873', '留空');
INSERT INTO `bg_items` VALUES ('3874', '留空');
INSERT INTO `bg_items` VALUES ('3875', '留空');
INSERT INTO `bg_items` VALUES ('3876', '留空');
INSERT INTO `bg_items` VALUES ('3877', '留空');
INSERT INTO `bg_items` VALUES ('3878', '留空');
INSERT INTO `bg_items` VALUES ('3879', '留空');
INSERT INTO `bg_items` VALUES ('3880', '留空');
INSERT INTO `bg_items` VALUES ('3881', '留空');
INSERT INTO `bg_items` VALUES ('3882', '留空');
INSERT INTO `bg_items` VALUES ('3883', '留空');
INSERT INTO `bg_items` VALUES ('3884', '留空');
INSERT INTO `bg_items` VALUES ('3885', '留空');
INSERT INTO `bg_items` VALUES ('3886', '留空');
INSERT INTO `bg_items` VALUES ('3887', '留空');
INSERT INTO `bg_items` VALUES ('3888', '留空');
INSERT INTO `bg_items` VALUES ('3889', '留空');
INSERT INTO `bg_items` VALUES ('3890', '留空');
INSERT INTO `bg_items` VALUES ('3891', '留空');
INSERT INTO `bg_items` VALUES ('3892', '留空');
INSERT INTO `bg_items` VALUES ('3893', '留空');
INSERT INTO `bg_items` VALUES ('3894', '留空');
INSERT INTO `bg_items` VALUES ('3895', '留空');
INSERT INTO `bg_items` VALUES ('3896', '留空');
INSERT INTO `bg_items` VALUES ('3897', '留空');
INSERT INTO `bg_items` VALUES ('3898', '留空');
INSERT INTO `bg_items` VALUES ('3899', '留空');
INSERT INTO `bg_items` VALUES ('3900', '留空');
INSERT INTO `bg_items` VALUES ('3901', '留空');
INSERT INTO `bg_items` VALUES ('3902', '留空');
INSERT INTO `bg_items` VALUES ('3903', '留空');
INSERT INTO `bg_items` VALUES ('3904', '留空');
INSERT INTO `bg_items` VALUES ('3905', '留空');
INSERT INTO `bg_items` VALUES ('3906', '留空');
INSERT INTO `bg_items` VALUES ('3907', '留空');
INSERT INTO `bg_items` VALUES ('3908', '留空');
INSERT INTO `bg_items` VALUES ('3909', '留空');
INSERT INTO `bg_items` VALUES ('3910', '留空');
INSERT INTO `bg_items` VALUES ('3911', '留空');
INSERT INTO `bg_items` VALUES ('3912', '留空');
INSERT INTO `bg_items` VALUES ('3913', '留空');
INSERT INTO `bg_items` VALUES ('3914', '留空');
INSERT INTO `bg_items` VALUES ('3915', '留空');
INSERT INTO `bg_items` VALUES ('3916', '留空');
INSERT INTO `bg_items` VALUES ('3917', '留空');
INSERT INTO `bg_items` VALUES ('3918', '留空');
INSERT INTO `bg_items` VALUES ('3919', '留空');
INSERT INTO `bg_items` VALUES ('3920', '留空');
INSERT INTO `bg_items` VALUES ('3921', '留空');
INSERT INTO `bg_items` VALUES ('3922', '留空');
INSERT INTO `bg_items` VALUES ('3923', '留空');
INSERT INTO `bg_items` VALUES ('3924', '留空');
INSERT INTO `bg_items` VALUES ('3925', '留空');
INSERT INTO `bg_items` VALUES ('3926', '留空');
INSERT INTO `bg_items` VALUES ('3927', '留空');
INSERT INTO `bg_items` VALUES ('3928', '留空');
INSERT INTO `bg_items` VALUES ('3929', '留空');
INSERT INTO `bg_items` VALUES ('3930', '留空');
INSERT INTO `bg_items` VALUES ('3931', '留空');
INSERT INTO `bg_items` VALUES ('3932', '留空');
INSERT INTO `bg_items` VALUES ('3933', '留空');
INSERT INTO `bg_items` VALUES ('3934', '留空');
INSERT INTO `bg_items` VALUES ('3935', '留空');
INSERT INTO `bg_items` VALUES ('3936', '留空');
INSERT INTO `bg_items` VALUES ('3937', '留空');
INSERT INTO `bg_items` VALUES ('3938', '留空');
INSERT INTO `bg_items` VALUES ('3939', '留空');
INSERT INTO `bg_items` VALUES ('3940', '留空');
INSERT INTO `bg_items` VALUES ('3941', '留空');
INSERT INTO `bg_items` VALUES ('3942', '留空');
INSERT INTO `bg_items` VALUES ('3943', '留空');
INSERT INTO `bg_items` VALUES ('3944', '留空');
INSERT INTO `bg_items` VALUES ('3945', '留空');
INSERT INTO `bg_items` VALUES ('3946', '留空');
INSERT INTO `bg_items` VALUES ('3947', '留空');
INSERT INTO `bg_items` VALUES ('3948', '留空');
INSERT INTO `bg_items` VALUES ('3949', '留空');
INSERT INTO `bg_items` VALUES ('3950', '留空');
INSERT INTO `bg_items` VALUES ('3951', '留空');
INSERT INTO `bg_items` VALUES ('3952', '留空');
INSERT INTO `bg_items` VALUES ('3953', '留空');
INSERT INTO `bg_items` VALUES ('3954', '留空');
INSERT INTO `bg_items` VALUES ('3955', '留空');
INSERT INTO `bg_items` VALUES ('3956', '留空');
INSERT INTO `bg_items` VALUES ('3957', '留空');
INSERT INTO `bg_items` VALUES ('3958', '留空');
INSERT INTO `bg_items` VALUES ('3959', '留空');
INSERT INTO `bg_items` VALUES ('3960', '留空');
INSERT INTO `bg_items` VALUES ('3961', '留空');
INSERT INTO `bg_items` VALUES ('3962', '留空');
INSERT INTO `bg_items` VALUES ('3963', '留空');
INSERT INTO `bg_items` VALUES ('3964', '留空');
INSERT INTO `bg_items` VALUES ('3965', '留空');
INSERT INTO `bg_items` VALUES ('3966', '留空');
INSERT INTO `bg_items` VALUES ('3967', '留空');
INSERT INTO `bg_items` VALUES ('3968', '留空');
INSERT INTO `bg_items` VALUES ('3969', '留空');
INSERT INTO `bg_items` VALUES ('3970', '留空');
INSERT INTO `bg_items` VALUES ('3971', '留空');
INSERT INTO `bg_items` VALUES ('3972', '留空');
INSERT INTO `bg_items` VALUES ('3973', '留空');
INSERT INTO `bg_items` VALUES ('3974', '留空');
INSERT INTO `bg_items` VALUES ('3975', '留空');
INSERT INTO `bg_items` VALUES ('3976', '留空');
INSERT INTO `bg_items` VALUES ('3977', '留空');
INSERT INTO `bg_items` VALUES ('3978', '留空');
INSERT INTO `bg_items` VALUES ('3979', '留空');
INSERT INTO `bg_items` VALUES ('3980', '留空');
INSERT INTO `bg_items` VALUES ('3981', '留空');
INSERT INTO `bg_items` VALUES ('3982', '留空');
INSERT INTO `bg_items` VALUES ('3983', '留空');
INSERT INTO `bg_items` VALUES ('3984', '留空');
INSERT INTO `bg_items` VALUES ('3985', '留空');
INSERT INTO `bg_items` VALUES ('3986', '留空');
INSERT INTO `bg_items` VALUES ('3987', '留空');
INSERT INTO `bg_items` VALUES ('3988', '留空');
INSERT INTO `bg_items` VALUES ('3989', '留空');
INSERT INTO `bg_items` VALUES ('3990', '留空');
INSERT INTO `bg_items` VALUES ('3991', '留空');
INSERT INTO `bg_items` VALUES ('3992', '留空');
INSERT INTO `bg_items` VALUES ('3993', '留空');
INSERT INTO `bg_items` VALUES ('3994', '留空');
INSERT INTO `bg_items` VALUES ('3995', '留空');
INSERT INTO `bg_items` VALUES ('3996', '留空');
INSERT INTO `bg_items` VALUES ('3997', '留空');
INSERT INTO `bg_items` VALUES ('3998', '留空');
INSERT INTO `bg_items` VALUES ('3999', '留空');
INSERT INTO `bg_items` VALUES ('4000', '留空');
INSERT INTO `bg_items` VALUES ('4001', '经验宝典(微)');
INSERT INTO `bg_items` VALUES ('4002', '经验宝典(小)');
INSERT INTO `bg_items` VALUES ('4003', '经验宝典(中)');
INSERT INTO `bg_items` VALUES ('4004', '经验宝典(大)');
INSERT INTO `bg_items` VALUES ('4005', '经验宝典(巨)');
INSERT INTO `bg_items` VALUES ('4006', '经脉神符(微)');
INSERT INTO `bg_items` VALUES ('4007', '经脉神符(小)');
INSERT INTO `bg_items` VALUES ('4008', '经脉神符(中)');
INSERT INTO `bg_items` VALUES ('4009', '经脉神符(大)');
INSERT INTO `bg_items` VALUES ('4010', '经脉神符(巨)');
INSERT INTO `bg_items` VALUES ('4011', '金砖(微)');
INSERT INTO `bg_items` VALUES ('4012', '金砖(小)');
INSERT INTO `bg_items` VALUES ('4013', '金砖(中)');
INSERT INTO `bg_items` VALUES ('4014', '金砖(大)');
INSERT INTO `bg_items` VALUES ('4015', '金砖(巨)');
INSERT INTO `bg_items` VALUES ('4016', '绑元票(微)');
INSERT INTO `bg_items` VALUES ('4017', '绑元票(小)');
INSERT INTO `bg_items` VALUES ('4018', '绑元票(中)');
INSERT INTO `bg_items` VALUES ('4019', '绑元票(大)');
INSERT INTO `bg_items` VALUES ('4020', '绑元票(巨)');
INSERT INTO `bg_items` VALUES ('4021', '血符碎片(微)');
INSERT INTO `bg_items` VALUES ('4022', '血符碎片(小)');
INSERT INTO `bg_items` VALUES ('4023', '血符碎片(中)');
INSERT INTO `bg_items` VALUES ('4024', '血符碎片(大)');
INSERT INTO `bg_items` VALUES ('4025', '血符碎片(巨)');
INSERT INTO `bg_items` VALUES ('4026', '神盾碎片(微)');
INSERT INTO `bg_items` VALUES ('4027', '神盾碎片(小)');
INSERT INTO `bg_items` VALUES ('4028', '神盾碎片(中)');
INSERT INTO `bg_items` VALUES ('4029', '神盾碎片(大)');
INSERT INTO `bg_items` VALUES ('4030', '神盾碎片(巨)');
INSERT INTO `bg_items` VALUES ('4031', '武魂碎片(微)');
INSERT INTO `bg_items` VALUES ('4032', '武魂碎片(小)');
INSERT INTO `bg_items` VALUES ('4033', '武魂碎片(中)');
INSERT INTO `bg_items` VALUES ('4034', '武魂碎片(大)');
INSERT INTO `bg_items` VALUES ('4035', '武魂碎片(巨)');
INSERT INTO `bg_items` VALUES ('4036', '灵珠碎片(微)');
INSERT INTO `bg_items` VALUES ('4037', '灵珠碎片(小)');
INSERT INTO `bg_items` VALUES ('4038', '灵珠碎片(中)');
INSERT INTO `bg_items` VALUES ('4039', '灵珠碎片(大)');
INSERT INTO `bg_items` VALUES ('4040', '灵珠碎片(巨)');
INSERT INTO `bg_items` VALUES ('4041', '宝石结晶(微)');
INSERT INTO `bg_items` VALUES ('4042', '宝石结晶(小)');
INSERT INTO `bg_items` VALUES ('4043', '宝石结晶(中)');
INSERT INTO `bg_items` VALUES ('4044', '宝石结晶(大)');
INSERT INTO `bg_items` VALUES ('4045', '宝石结晶(巨)');
INSERT INTO `bg_items` VALUES ('4046', '灵气结晶(微)');
INSERT INTO `bg_items` VALUES ('4047', '灵气结晶(小)');
INSERT INTO `bg_items` VALUES ('4048', '灵气结晶(中)');
INSERT INTO `bg_items` VALUES ('4049', '灵气结晶(大)');
INSERT INTO `bg_items` VALUES ('4050', '灵气结晶(巨)');
INSERT INTO `bg_items` VALUES ('4051', '特戒结晶(微)');
INSERT INTO `bg_items` VALUES ('4052', '特戒结晶(小)');
INSERT INTO `bg_items` VALUES ('4053', '特戒结晶(中)');
INSERT INTO `bg_items` VALUES ('4054', '特戒结晶(大)');
INSERT INTO `bg_items` VALUES ('4055', '特戒结晶(巨)');
INSERT INTO `bg_items` VALUES ('4056', '成就令牌(微)');
INSERT INTO `bg_items` VALUES ('4057', '成就令牌(小)');
INSERT INTO `bg_items` VALUES ('4058', '成就令牌(中)');
INSERT INTO `bg_items` VALUES ('4059', '成就令牌(大)');
INSERT INTO `bg_items` VALUES ('4060', '成就令牌(巨)');
INSERT INTO `bg_items` VALUES ('4061', '功勋令牌(微)');
INSERT INTO `bg_items` VALUES ('4062', '功勋令牌(小)');
INSERT INTO `bg_items` VALUES ('4063', '功勋令牌(中)');
INSERT INTO `bg_items` VALUES ('4064', '功勋令牌(大)');
INSERT INTO `bg_items` VALUES ('4065', '功勋令牌(巨)');
INSERT INTO `bg_items` VALUES ('4066', '积分令牌(微)');
INSERT INTO `bg_items` VALUES ('4067', '积分令牌(小)');
INSERT INTO `bg_items` VALUES ('4068', '积分令牌(中)');
INSERT INTO `bg_items` VALUES ('4069', '积分令牌(大)');
INSERT INTO `bg_items` VALUES ('4070', '积分令牌(巨)');
INSERT INTO `bg_items` VALUES ('4071', '小金砖');
INSERT INTO `bg_items` VALUES ('4072', '血符碎片');
INSERT INTO `bg_items` VALUES ('4073', '神盾碎片');
INSERT INTO `bg_items` VALUES ('4074', '武魂碎片');
INSERT INTO `bg_items` VALUES ('4075', '灵珠碎片');
INSERT INTO `bg_items` VALUES ('4076', '金砖');
INSERT INTO `bg_items` VALUES ('4077', '宝石结晶');
INSERT INTO `bg_items` VALUES ('4078', '成就令牌');
INSERT INTO `bg_items` VALUES ('4079', '功勋令牌');
INSERT INTO `bg_items` VALUES ('4080', '积分令牌');
INSERT INTO `bg_items` VALUES ('4081', '1000元宝');
INSERT INTO `bg_items` VALUES ('4082', '大血符碎片');
INSERT INTO `bg_items` VALUES ('4083', '大神盾碎片');
INSERT INTO `bg_items` VALUES ('4084', '大武魂碎片');
INSERT INTO `bg_items` VALUES ('4085', '大灵珠碎片');
INSERT INTO `bg_items` VALUES ('4086', '大金砖');
INSERT INTO `bg_items` VALUES ('4087', '大宝石结晶');
INSERT INTO `bg_items` VALUES ('4088', '大成就令牌');
INSERT INTO `bg_items` VALUES ('4089', '大功勋令牌');
INSERT INTO `bg_items` VALUES ('4090', '大积分令牌');
INSERT INTO `bg_items` VALUES ('4091', '白色羽毛');
INSERT INTO `bg_items` VALUES ('4092', '洗练符');
INSERT INTO `bg_items` VALUES ('4093', '神铸碎片');
INSERT INTO `bg_items` VALUES ('4094', '特戒碎片');
INSERT INTO `bg_items` VALUES ('4095', '暗之钥匙');
INSERT INTO `bg_items` VALUES ('4096', '天穹钢');
INSERT INTO `bg_items` VALUES ('4097', '幻海绸');
INSERT INTO `bg_items` VALUES ('4098', '地之痕');
INSERT INTO `bg_items` VALUES ('4099', '山之灵');
INSERT INTO `bg_items` VALUES ('4100', '幻彩羽');
INSERT INTO `bg_items` VALUES ('4101', '1阶护肩碎片');
INSERT INTO `bg_items` VALUES ('4102', '2阶护肩碎片');
INSERT INTO `bg_items` VALUES ('4103', '3阶护肩碎片');
INSERT INTO `bg_items` VALUES ('4104', '4阶护肩碎片');
INSERT INTO `bg_items` VALUES ('4105', '5阶护肩碎片');
INSERT INTO `bg_items` VALUES ('4106', '6阶护肩碎片');
INSERT INTO `bg_items` VALUES ('4107', '7阶护肩碎片');
INSERT INTO `bg_items` VALUES ('4108', '8阶护肩碎片');
INSERT INTO `bg_items` VALUES ('4109', '9阶护肩碎片');
INSERT INTO `bg_items` VALUES ('4110', '10阶护肩碎片');
INSERT INTO `bg_items` VALUES ('4111', '11阶护肩碎片');
INSERT INTO `bg_items` VALUES ('4112', '12阶护肩碎片');
INSERT INTO `bg_items` VALUES ('4113', '13阶护肩碎片');
INSERT INTO `bg_items` VALUES ('4114', '14阶护肩碎片');
INSERT INTO `bg_items` VALUES ('4115', '15阶护肩碎片');
INSERT INTO `bg_items` VALUES ('4116', '16阶护肩碎片');
INSERT INTO `bg_items` VALUES ('4117', '17阶护肩碎片');
INSERT INTO `bg_items` VALUES ('4118', '18阶护肩碎片');
INSERT INTO `bg_items` VALUES ('4119', '19阶护肩碎片');
INSERT INTO `bg_items` VALUES ('4120', '20阶护肩碎片');
INSERT INTO `bg_items` VALUES ('4121', '1阶护坠碎片');
INSERT INTO `bg_items` VALUES ('4122', '2阶护坠碎片');
INSERT INTO `bg_items` VALUES ('4123', '3阶护坠碎片');
INSERT INTO `bg_items` VALUES ('4124', '4阶护坠碎片');
INSERT INTO `bg_items` VALUES ('4125', '5阶护坠碎片');
INSERT INTO `bg_items` VALUES ('4126', '6阶护坠碎片');
INSERT INTO `bg_items` VALUES ('4127', '7阶护坠碎片');
INSERT INTO `bg_items` VALUES ('4128', '8阶护坠碎片');
INSERT INTO `bg_items` VALUES ('4129', '9阶护坠碎片');
INSERT INTO `bg_items` VALUES ('4130', '10阶护坠碎片');
INSERT INTO `bg_items` VALUES ('4131', '11阶护坠碎片');
INSERT INTO `bg_items` VALUES ('4132', '12阶护坠碎片');
INSERT INTO `bg_items` VALUES ('4133', '13阶护坠碎片');
INSERT INTO `bg_items` VALUES ('4134', '14阶护坠碎片');
INSERT INTO `bg_items` VALUES ('4135', '15阶护坠碎片');
INSERT INTO `bg_items` VALUES ('4136', '16阶护坠碎片');
INSERT INTO `bg_items` VALUES ('4137', '17阶护坠碎片');
INSERT INTO `bg_items` VALUES ('4138', '18阶护坠碎片');
INSERT INTO `bg_items` VALUES ('4139', '19阶护坠碎片');
INSERT INTO `bg_items` VALUES ('4140', '20阶护坠碎片');
INSERT INTO `bg_items` VALUES ('4141', '1阶护镜碎片');
INSERT INTO `bg_items` VALUES ('4142', '2阶护镜碎片');
INSERT INTO `bg_items` VALUES ('4143', '3阶护镜碎片');
INSERT INTO `bg_items` VALUES ('4144', '4阶护镜碎片');
INSERT INTO `bg_items` VALUES ('4145', '5阶护镜碎片');
INSERT INTO `bg_items` VALUES ('4146', '6阶护镜碎片');
INSERT INTO `bg_items` VALUES ('4147', '7阶护镜碎片');
INSERT INTO `bg_items` VALUES ('4148', '8阶护镜碎片');
INSERT INTO `bg_items` VALUES ('4149', '9阶护镜碎片');
INSERT INTO `bg_items` VALUES ('4150', '10阶护镜碎片');
INSERT INTO `bg_items` VALUES ('4151', '11阶护镜碎片');
INSERT INTO `bg_items` VALUES ('4152', '12阶护镜碎片');
INSERT INTO `bg_items` VALUES ('4153', '13阶护镜碎片');
INSERT INTO `bg_items` VALUES ('4154', '14阶护镜碎片');
INSERT INTO `bg_items` VALUES ('4155', '15阶护镜碎片');
INSERT INTO `bg_items` VALUES ('4156', '16阶护镜碎片');
INSERT INTO `bg_items` VALUES ('4157', '17阶护镜碎片');
INSERT INTO `bg_items` VALUES ('4158', '18阶护镜碎片');
INSERT INTO `bg_items` VALUES ('4159', '19阶护镜碎片');
INSERT INTO `bg_items` VALUES ('4160', '20阶护镜碎片');
INSERT INTO `bg_items` VALUES ('4161', '1阶护膝碎片');
INSERT INTO `bg_items` VALUES ('4162', '2阶护膝碎片');
INSERT INTO `bg_items` VALUES ('4163', '3阶护膝碎片');
INSERT INTO `bg_items` VALUES ('4164', '4阶护膝碎片');
INSERT INTO `bg_items` VALUES ('4165', '5阶护膝碎片');
INSERT INTO `bg_items` VALUES ('4166', '6阶护膝碎片');
INSERT INTO `bg_items` VALUES ('4167', '7阶护膝碎片');
INSERT INTO `bg_items` VALUES ('4168', '8阶护膝碎片');
INSERT INTO `bg_items` VALUES ('4169', '9阶护膝碎片');
INSERT INTO `bg_items` VALUES ('4170', '10阶护膝碎片');
INSERT INTO `bg_items` VALUES ('4171', '11阶护膝碎片');
INSERT INTO `bg_items` VALUES ('4172', '12阶护膝碎片');
INSERT INTO `bg_items` VALUES ('4173', '13阶护膝碎片');
INSERT INTO `bg_items` VALUES ('4174', '14阶护膝碎片');
INSERT INTO `bg_items` VALUES ('4175', '15阶护膝碎片');
INSERT INTO `bg_items` VALUES ('4176', '16阶护膝碎片');
INSERT INTO `bg_items` VALUES ('4177', '17阶护膝碎片');
INSERT INTO `bg_items` VALUES ('4178', '18阶护膝碎片');
INSERT INTO `bg_items` VALUES ('4179', '19阶护膝碎片');
INSERT INTO `bg_items` VALUES ('4180', '20阶护膝碎片');
INSERT INTO `bg_items` VALUES ('4181', '风华绝代·引领潮流');
INSERT INTO `bg_items` VALUES ('4182', '独领风骚·独步天下');
INSERT INTO `bg_items` VALUES ('4183', '无法无天·绝顶高手');
INSERT INTO `bg_items` VALUES ('4184', '登峰造极');
INSERT INTO `bg_items` VALUES ('4185', '飞龙在天');
INSERT INTO `bg_items` VALUES ('4186', '不灭金身');
INSERT INTO `bg_items` VALUES ('4187', '盛气凌人');
INSERT INTO `bg_items` VALUES ('4188', '势不可挡');
INSERT INTO `bg_items` VALUES ('4189', '10元宝');
INSERT INTO `bg_items` VALUES ('4190', '500元宝');
INSERT INTO `bg_items` VALUES ('4191', '活力药水包');
INSERT INTO `bg_items` VALUES ('4192', '强效活力药水包');
INSERT INTO `bg_items` VALUES ('4193', '极效活力药水包');
INSERT INTO `bg_items` VALUES ('4194', '超级活力药水包');
INSERT INTO `bg_items` VALUES ('4195', '神话活力药水包');
INSERT INTO `bg_items` VALUES ('4196', '冲锋秘籍');
INSERT INTO `bg_items` VALUES ('4197', '星移秘籍');
INSERT INTO `bg_items` VALUES ('4198', '合体秘籍');
INSERT INTO `bg_items` VALUES ('4199', '留空');
INSERT INTO `bg_items` VALUES ('4200', '戒律书卷');
INSERT INTO `bg_items` VALUES ('4201', '秘籍残片');
INSERT INTO `bg_items` VALUES ('4202', '逐日秘籍');
INSERT INTO `bg_items` VALUES ('4203', '星陨秘籍');
INSERT INTO `bg_items` VALUES ('4204', '焱咒秘籍');
INSERT INTO `bg_items` VALUES ('4205', '技能熟练书');
INSERT INTO `bg_items` VALUES ('4206', '天山雪莲');
INSERT INTO `bg_items` VALUES ('4207', '百年雪莲');
INSERT INTO `bg_items` VALUES ('4208', '千年雪莲');
INSERT INTO `bg_items` VALUES ('4209', '万年雪莲');
INSERT INTO `bg_items` VALUES ('4210', '永生雪莲');
INSERT INTO `bg_items` VALUES ('4211', '2倍经验珠');
INSERT INTO `bg_items` VALUES ('4212', '3倍经验珠');
INSERT INTO `bg_items` VALUES ('4213', '4倍经验珠');
INSERT INTO `bg_items` VALUES ('4214', '5倍经验珠');
INSERT INTO `bg_items` VALUES ('4215', '6倍经验珠');
INSERT INTO `bg_items` VALUES ('4216', '2倍内功珠');
INSERT INTO `bg_items` VALUES ('4217', '3倍内功珠');
INSERT INTO `bg_items` VALUES ('4218', '4倍内功珠');
INSERT INTO `bg_items` VALUES ('4219', '5倍内功珠');
INSERT INTO `bg_items` VALUES ('4220', '6倍内功珠');
INSERT INTO `bg_items` VALUES ('4221', '金创药');
INSERT INTO `bg_items` VALUES ('4222', '强效金创药');
INSERT INTO `bg_items` VALUES ('4223', '超级金创药');
INSERT INTO `bg_items` VALUES ('4224', '留空');
INSERT INTO `bg_items` VALUES ('4225', '留空');
INSERT INTO `bg_items` VALUES ('4226', '魔法药');
INSERT INTO `bg_items` VALUES ('4227', '强效魔法药');
INSERT INTO `bg_items` VALUES ('4228', '超级魔法药');
INSERT INTO `bg_items` VALUES ('4229', '留空');
INSERT INTO `bg_items` VALUES ('4230', '留空');
INSERT INTO `bg_items` VALUES ('4231', '疗伤药');
INSERT INTO `bg_items` VALUES ('4232', '玫瑰花');
INSERT INTO `bg_items` VALUES ('4233', '超屌玫瑰');
INSERT INTO `bg_items` VALUES ('4234', '祝福油');
INSERT INTO `bg_items` VALUES ('4235', '超级祝福油');
INSERT INTO `bg_items` VALUES ('4236', '神圣药水(微)');
INSERT INTO `bg_items` VALUES ('4237', '神圣药水(小)');
INSERT INTO `bg_items` VALUES ('4238', '神圣药水(中)');
INSERT INTO `bg_items` VALUES ('4239', '神圣药水(大)');
INSERT INTO `bg_items` VALUES ('4240', '神圣药水(巨)');
INSERT INTO `bg_items` VALUES ('4241', '生命药水(微)');
INSERT INTO `bg_items` VALUES ('4242', '生命药水(小)');
INSERT INTO `bg_items` VALUES ('4243', '生命药水(中)');
INSERT INTO `bg_items` VALUES ('4244', '生命药水(大)');
INSERT INTO `bg_items` VALUES ('4245', '生命药水(巨)');
INSERT INTO `bg_items` VALUES ('4246', '攻击药水(微)');
INSERT INTO `bg_items` VALUES ('4247', '攻击药水(小)');
INSERT INTO `bg_items` VALUES ('4248', '攻击药水(中)');
INSERT INTO `bg_items` VALUES ('4249', '攻击药水(大)');
INSERT INTO `bg_items` VALUES ('4250', '攻击药水(巨)');
INSERT INTO `bg_items` VALUES ('4251', '物防药水(微)');
INSERT INTO `bg_items` VALUES ('4252', '物防药水(小)');
INSERT INTO `bg_items` VALUES ('4253', '物防药水(中)');
INSERT INTO `bg_items` VALUES ('4254', '物防药水(大)');
INSERT INTO `bg_items` VALUES ('4255', '物防药水(巨)');
INSERT INTO `bg_items` VALUES ('4256', '魔防药水(微)');
INSERT INTO `bg_items` VALUES ('4257', '魔防药水(小)');
INSERT INTO `bg_items` VALUES ('4258', '魔防药水(中)');
INSERT INTO `bg_items` VALUES ('4259', '魔防药水(大)');
INSERT INTO `bg_items` VALUES ('4260', '魔防药水(巨)');
INSERT INTO `bg_items` VALUES ('4261', '副本通行令');
INSERT INTO `bg_items` VALUES ('4262', '一捆副本通行令');
INSERT INTO `bg_items` VALUES ('4263', '扫荡卷轴');
INSERT INTO `bg_items` VALUES ('4264', 'BOSS卷轴');
INSERT INTO `bg_items` VALUES ('4265', '锁妖冢之卷');
INSERT INTO `bg_items` VALUES ('4266', '回城卷');
INSERT INTO `bg_items` VALUES ('4267', '随机传送卷');
INSERT INTO `bg_items` VALUES ('4268', '复活石');
INSERT INTO `bg_items` VALUES ('4269', '沃玛号角');
INSERT INTO `bg_items` VALUES ('4270', '祖玛头像');
INSERT INTO `bg_items` VALUES ('4271', '寻宝钥匙');
INSERT INTO `bg_items` VALUES ('4272', '金锄头');
INSERT INTO `bg_items` VALUES ('4273', '等级丹');
INSERT INTO `bg_items` VALUES ('4274', '改名卡');
INSERT INTO `bg_items` VALUES ('4275', '50元宝');
INSERT INTO `bg_items` VALUES ('4276', '1阶BOSS召唤令');
INSERT INTO `bg_items` VALUES ('4277', '2阶BOSS召唤令');
INSERT INTO `bg_items` VALUES ('4278', '3阶BOSS召唤令');
INSERT INTO `bg_items` VALUES ('4279', '4阶BOSS召唤令');
INSERT INTO `bg_items` VALUES ('4280', '5阶BOSS召唤令');
INSERT INTO `bg_items` VALUES ('4281', '万兽谱一');
INSERT INTO `bg_items` VALUES ('4282', '万兽谱二');
INSERT INTO `bg_items` VALUES ('4283', '万兽谱三');
INSERT INTO `bg_items` VALUES ('4284', '万兽谱四');
INSERT INTO `bg_items` VALUES ('4285', '万兽谱五');
INSERT INTO `bg_items` VALUES ('4286', '万魔谱一');
INSERT INTO `bg_items` VALUES ('4287', '万魔谱二');
INSERT INTO `bg_items` VALUES ('4288', '万魔谱三');
INSERT INTO `bg_items` VALUES ('4289', '万魔谱四');
INSERT INTO `bg_items` VALUES ('4290', '万魔谱五');
INSERT INTO `bg_items` VALUES ('4291', '星宫钥');
INSERT INTO `bg_items` VALUES ('4292', '藏宝图');
INSERT INTO `bg_items` VALUES ('4293', '幻境仙丹');
INSERT INTO `bg_items` VALUES ('4294', '古镜残卷');
INSERT INTO `bg_items` VALUES ('4295', '声援的鲜花');
INSERT INTO `bg_items` VALUES ('4296', '白风晶矿');
INSERT INTO `bg_items` VALUES ('4297', '苍磷晶矿');
INSERT INTO `bg_items` VALUES ('4298', '绮云晶矿');
INSERT INTO `bg_items` VALUES ('4299', '紫月晶矿');
INSERT INTO `bg_items` VALUES ('4300', '金玄晶矿');
INSERT INTO `bg_items` VALUES ('4301', '经验玉(微)');
INSERT INTO `bg_items` VALUES ('4302', '经验玉(小)');
INSERT INTO `bg_items` VALUES ('4303', '经验玉(中)');
INSERT INTO `bg_items` VALUES ('4304', '经验玉(大)');
INSERT INTO `bg_items` VALUES ('4305', '经验玉(巨)');
INSERT INTO `bg_items` VALUES ('4306', '黑铁宝箱');
INSERT INTO `bg_items` VALUES ('4307', '火铜宝箱');
INSERT INTO `bg_items` VALUES ('4308', '白银宝箱');
INSERT INTO `bg_items` VALUES ('4309', '黄金宝箱');
INSERT INTO `bg_items` VALUES ('4310', '黑铁宝箱');
INSERT INTO `bg_items` VALUES ('4311', '火铜宝箱');
INSERT INTO `bg_items` VALUES ('4312', '白银宝箱');
INSERT INTO `bg_items` VALUES ('4313', '黄金宝箱');
INSERT INTO `bg_items` VALUES ('4314', '黑铁宝箱');
INSERT INTO `bg_items` VALUES ('4315', '火铜宝箱');
INSERT INTO `bg_items` VALUES ('4316', '白银宝箱');
INSERT INTO `bg_items` VALUES ('4317', '黄金宝箱');
INSERT INTO `bg_items` VALUES ('4318', '黑铁宝箱');
INSERT INTO `bg_items` VALUES ('4319', '火铜宝箱');
INSERT INTO `bg_items` VALUES ('4320', '白银宝箱');
INSERT INTO `bg_items` VALUES ('4321', '黄金宝箱');
INSERT INTO `bg_items` VALUES ('4322', '黑铁宝箱');
INSERT INTO `bg_items` VALUES ('4323', '火铜宝箱');
INSERT INTO `bg_items` VALUES ('4324', '白银宝箱');
INSERT INTO `bg_items` VALUES ('4325', '黄金宝箱');
INSERT INTO `bg_items` VALUES ('4326', '沙城霸主礼包');
INSERT INTO `bg_items` VALUES ('4327', '沙城猛将礼包');
INSERT INTO `bg_items` VALUES ('4328', '沙城先锋礼包');
INSERT INTO `bg_items` VALUES ('4329', '沙城勇士礼包');
INSERT INTO `bg_items` VALUES ('4330', '沙城枭雄礼包');
INSERT INTO `bg_items` VALUES ('4331', '枭雄猛将礼包');
INSERT INTO `bg_items` VALUES ('4332', '枭雄先锋礼包');
INSERT INTO `bg_items` VALUES ('4333', '枭雄勇士礼包');
INSERT INTO `bg_items` VALUES ('4334', '土城霸主礼包');
INSERT INTO `bg_items` VALUES ('4335', '土城勇士礼包');
INSERT INTO `bg_items` VALUES ('4336', '1级行会王者包');
INSERT INTO `bg_items` VALUES ('4337', '1级行会精英包');
INSERT INTO `bg_items` VALUES ('4338', '1级行会勇士包');
INSERT INTO `bg_items` VALUES ('4339', '2级行会王者包');
INSERT INTO `bg_items` VALUES ('4340', '2级行会精英包');
INSERT INTO `bg_items` VALUES ('4341', '2级行会勇士包');
INSERT INTO `bg_items` VALUES ('4342', '3级行会王者包');
INSERT INTO `bg_items` VALUES ('4343', '3级行会精英包');
INSERT INTO `bg_items` VALUES ('4344', '3级行会勇士包');
INSERT INTO `bg_items` VALUES ('4345', '4级行会王者包');
INSERT INTO `bg_items` VALUES ('4346', '4级行会精英包');
INSERT INTO `bg_items` VALUES ('4347', '4级行会勇士包');
INSERT INTO `bg_items` VALUES ('4348', '5级行会王者包');
INSERT INTO `bg_items` VALUES ('4349', '5级行会精英包');
INSERT INTO `bg_items` VALUES ('4350', '5级行会勇士包');
INSERT INTO `bg_items` VALUES ('4351', '6级行会王者包');
INSERT INTO `bg_items` VALUES ('4352', '6级行会精英包');
INSERT INTO `bg_items` VALUES ('4353', '6级行会勇士包');
INSERT INTO `bg_items` VALUES ('4354', '7级行会王者包');
INSERT INTO `bg_items` VALUES ('4355', '7级行会精英包');
INSERT INTO `bg_items` VALUES ('4356', '7级行会勇士包');
INSERT INTO `bg_items` VALUES ('4357', '8级行会王者包');
INSERT INTO `bg_items` VALUES ('4358', '8级行会精英包');
INSERT INTO `bg_items` VALUES ('4359', '8级行会勇士包');
INSERT INTO `bg_items` VALUES ('4360', '9级行会王者包');
INSERT INTO `bg_items` VALUES ('4361', '9级行会精英包');
INSERT INTO `bg_items` VALUES ('4362', '9级行会勇士包');
INSERT INTO `bg_items` VALUES ('4363', '10级行会王者包');
INSERT INTO `bg_items` VALUES ('4364', '10级行会精英包');
INSERT INTO `bg_items` VALUES ('4365', '10级行会勇士包');
INSERT INTO `bg_items` VALUES ('4366', '魔域迷城领主包');
INSERT INTO `bg_items` VALUES ('4367', '魔域迷城君主包');
INSERT INTO `bg_items` VALUES ('4368', '魔域迷城帝王包');
INSERT INTO `bg_items` VALUES ('4369', '魔域迷城圣王包');
INSERT INTO `bg_items` VALUES ('4370', '魔域迷城神王包');
INSERT INTO `bg_items` VALUES ('4371', '魔域迷城骑将包');
INSERT INTO `bg_items` VALUES ('4372', '魔域迷城军将包');
INSERT INTO `bg_items` VALUES ('4373', '魔域迷城王将包');
INSERT INTO `bg_items` VALUES ('4374', '魔域迷城圣将包');
INSERT INTO `bg_items` VALUES ('4375', '魔域迷城神将包');
INSERT INTO `bg_items` VALUES ('4376', '魔域迷城铁兵包');
INSERT INTO `bg_items` VALUES ('4377', '魔域迷城战兵包');
INSERT INTO `bg_items` VALUES ('4378', '魔域迷城圣兵包');
INSERT INTO `bg_items` VALUES ('4379', '魔域迷城神兵包');
INSERT INTO `bg_items` VALUES ('4380', 'VIP体验卡');
INSERT INTO `bg_items` VALUES ('4381', '特戒启航包');
INSERT INTO `bg_items` VALUES ('4382', '神兵图鉴');
INSERT INTO `bg_items` VALUES ('4383', '特戒3折包');
INSERT INTO `bg_items` VALUES ('4384', '特戒4折包');
INSERT INTO `bg_items` VALUES ('4385', '特戒5折包');
INSERT INTO `bg_items` VALUES ('4386', '留空');
INSERT INTO `bg_items` VALUES ('4387', '留空');
INSERT INTO `bg_items` VALUES ('4388', '宝石3折包');
INSERT INTO `bg_items` VALUES ('4389', '宝石4折包');
INSERT INTO `bg_items` VALUES ('4390', '宝石5折包');
INSERT INTO `bg_items` VALUES ('4391', '直升二阶翅膀符');
INSERT INTO `bg_items` VALUES ('4392', '直升二阶血符符');
INSERT INTO `bg_items` VALUES ('4393', '直升二阶神盾符');
INSERT INTO `bg_items` VALUES ('4394', '直升三阶武魂符');
INSERT INTO `bg_items` VALUES ('4395', '直升二阶灵珠符');
INSERT INTO `bg_items` VALUES ('4396', '翅膀3折包');
INSERT INTO `bg_items` VALUES ('4397', '血符3折包');
INSERT INTO `bg_items` VALUES ('4398', '神盾3折包');
INSERT INTO `bg_items` VALUES ('4399', '武魂3折包');
INSERT INTO `bg_items` VALUES ('4400', '灵珠3折包');
INSERT INTO `bg_items` VALUES ('4401', '翅膀4折包');
INSERT INTO `bg_items` VALUES ('4402', '血符4折包');
INSERT INTO `bg_items` VALUES ('4403', '神盾4折包');
INSERT INTO `bg_items` VALUES ('4404', '武魂4折包');
INSERT INTO `bg_items` VALUES ('4405', '灵珠4折包');
INSERT INTO `bg_items` VALUES ('4406', '翅膀5折包');
INSERT INTO `bg_items` VALUES ('4407', '血符5折包');
INSERT INTO `bg_items` VALUES ('4408', '神盾5折包');
INSERT INTO `bg_items` VALUES ('4409', '武魂5折包');
INSERT INTO `bg_items` VALUES ('4410', '灵珠5折包');
INSERT INTO `bg_items` VALUES ('4411', '开服礼包');
INSERT INTO `bg_items` VALUES ('4412', '开服2天礼包');
INSERT INTO `bg_items` VALUES ('4413', '开服4天礼包');
INSERT INTO `bg_items` VALUES ('4414', '开服7天礼包');
INSERT INTO `bg_items` VALUES ('4415', '开服10天礼包');
INSERT INTO `bg_items` VALUES ('4416', '碎片宝箱');
INSERT INTO `bg_items` VALUES ('4417', '1元宝');
INSERT INTO `bg_items` VALUES ('4418', '10元宝');
INSERT INTO `bg_items` VALUES ('4419', '100元宝');
INSERT INTO `bg_items` VALUES ('4420', '500元宝');
INSERT INTO `bg_items` VALUES ('4421', '1阶自选神装宝箱');
INSERT INTO `bg_items` VALUES ('4422', '2阶自选神装宝箱');
INSERT INTO `bg_items` VALUES ('4423', '3阶自选神装宝箱');
INSERT INTO `bg_items` VALUES ('4424', '4阶自选神装宝箱');
INSERT INTO `bg_items` VALUES ('4425', '5阶自选神装宝箱');
INSERT INTO `bg_items` VALUES ('4426', '6阶自选神装宝箱');
INSERT INTO `bg_items` VALUES ('4427', '7阶自选神装宝箱');
INSERT INTO `bg_items` VALUES ('4428', '8阶自选神装宝箱');
INSERT INTO `bg_items` VALUES ('4429', '9阶自选神装宝箱');
INSERT INTO `bg_items` VALUES ('4430', '10阶自选神装宝箱');
INSERT INTO `bg_items` VALUES ('4431', '留空');
INSERT INTO `bg_items` VALUES ('4432', '留空');
INSERT INTO `bg_items` VALUES ('4433', '留空');
INSERT INTO `bg_items` VALUES ('4434', '留空');
INSERT INTO `bg_items` VALUES ('4435', '9元宝大宝箱');
INSERT INTO `bg_items` VALUES ('4436', 'VIP新贵包');
INSERT INTO `bg_items` VALUES ('4437', 'Ｖ２专属包');
INSERT INTO `bg_items` VALUES ('4438', '超划算大宝箱');
INSERT INTO `bg_items` VALUES ('4439', '行会萌新包');
INSERT INTO `bg_items` VALUES ('4440', '行会晋升包');
INSERT INTO `bg_items` VALUES ('4441', '完美继承符');
INSERT INTO `bg_items` VALUES ('4442', '青铜卡');
INSERT INTO `bg_items` VALUES ('4443', '白银卡');
INSERT INTO `bg_items` VALUES ('4444', '黄金卡');
INSERT INTO `bg_items` VALUES ('4445', '铂金卡');
INSERT INTO `bg_items` VALUES ('4446', '符文灵力(微)');
INSERT INTO `bg_items` VALUES ('4447', '符文灵力(小)');
INSERT INTO `bg_items` VALUES ('4448', '符文灵力(中)');
INSERT INTO `bg_items` VALUES ('4449', '符文灵力(大)');
INSERT INTO `bg_items` VALUES ('4450', '符文灵力(巨)');
INSERT INTO `bg_items` VALUES ('4451', '活力药水');
INSERT INTO `bg_items` VALUES ('4452', '强效活力药水');
INSERT INTO `bg_items` VALUES ('4453', '极效活力药水');
INSERT INTO `bg_items` VALUES ('4454', '超级活力药水');
INSERT INTO `bg_items` VALUES ('4455', '神话活力药水');
INSERT INTO `bg_items` VALUES ('4456', '英雄经验宝盒(微)');
INSERT INTO `bg_items` VALUES ('4457', '英雄经验宝盒(小)');
INSERT INTO `bg_items` VALUES ('4458', '英雄经验宝盒(中)');
INSERT INTO `bg_items` VALUES ('4459', '英雄经验宝盒(大)');
INSERT INTO `bg_items` VALUES ('4460', '英雄经验宝盒(巨)');
INSERT INTO `bg_items` VALUES ('4461', '月笼秋纱');
INSERT INTO `bg_items` VALUES ('4462', '天降元宝');
INSERT INTO `bg_items` VALUES ('4463', '炎龙斩舞');
INSERT INTO `bg_items` VALUES ('4464', '玄黄天罡');
INSERT INTO `bg_items` VALUES ('4465', '青鸾火舞');
INSERT INTO `bg_items` VALUES ('4466', '永夜风华');
INSERT INTO `bg_items` VALUES ('4467', '永夜风华碎片');
INSERT INTO `bg_items` VALUES ('4468', '祖玛宝箱');
INSERT INTO `bg_items` VALUES ('4469', '赤月宝箱');
INSERT INTO `bg_items` VALUES ('4470', '火龙宝箱');
INSERT INTO `bg_items` VALUES ('4471', '70级随机装备包');
INSERT INTO `bg_items` VALUES ('4472', '80级随机装备包');
INSERT INTO `bg_items` VALUES ('4473', '1转随机装备包');
INSERT INTO `bg_items` VALUES ('4474', '3转随机装备包');
INSERT INTO `bg_items` VALUES ('4475', '4转随机装备包');
INSERT INTO `bg_items` VALUES ('4476', '首充大宝箱');
INSERT INTO `bg_items` VALUES ('4477', '小转生丹');
INSERT INTO `bg_items` VALUES ('4478', '转生丹');
INSERT INTO `bg_items` VALUES ('4479', '小英雄转生丹');
INSERT INTO `bg_items` VALUES ('4480', '英雄转生丹');
INSERT INTO `bg_items` VALUES ('4481', '转生丹(微)');
INSERT INTO `bg_items` VALUES ('4482', '转生丹(小)');
INSERT INTO `bg_items` VALUES ('4483', '转生丹(中)');
INSERT INTO `bg_items` VALUES ('4484', '转生丹(大)');
INSERT INTO `bg_items` VALUES ('4485', '转生丹(巨)');
INSERT INTO `bg_items` VALUES ('4486', '英雄转生丹(微)');
INSERT INTO `bg_items` VALUES ('4487', '英雄转生丹(小)');
INSERT INTO `bg_items` VALUES ('4488', '英雄转生丹(中)');
INSERT INTO `bg_items` VALUES ('4489', '英雄转生丹(大)');
INSERT INTO `bg_items` VALUES ('4490', '英雄转生丹(巨)');
INSERT INTO `bg_items` VALUES ('4491', '擂台召唤令');
INSERT INTO `bg_items` VALUES ('4492', '经验加成');
INSERT INTO `bg_items` VALUES ('4493', '荣誉勋章(微)');
INSERT INTO `bg_items` VALUES ('4494', '荣誉勋章(小)');
INSERT INTO `bg_items` VALUES ('4495', '荣誉勋章(中)');
INSERT INTO `bg_items` VALUES ('4496', '荣誉勋章(大)');
INSERT INTO `bg_items` VALUES ('4497', '荣誉勋章(巨)');
INSERT INTO `bg_items` VALUES ('4498', '留空');
INSERT INTO `bg_items` VALUES ('4499', '留空');
INSERT INTO `bg_items` VALUES ('4500', '至尊自选宝箱');
INSERT INTO `bg_items` VALUES ('4501', '留空');
INSERT INTO `bg_items` VALUES ('4502', '留空');
INSERT INTO `bg_items` VALUES ('4503', '留空');
INSERT INTO `bg_items` VALUES ('4504', '留空');
INSERT INTO `bg_items` VALUES ('4505', '留空');
INSERT INTO `bg_items` VALUES ('4506', '留空');
INSERT INTO `bg_items` VALUES ('4507', '留空');
INSERT INTO `bg_items` VALUES ('4508', '留空');
INSERT INTO `bg_items` VALUES ('4509', '留空');
INSERT INTO `bg_items` VALUES ('4510', '60级自选装备宝箱');
INSERT INTO `bg_items` VALUES ('4511', '70级自选装备宝箱');
INSERT INTO `bg_items` VALUES ('4512', '80级自选装备宝箱');
INSERT INTO `bg_items` VALUES ('4513', '1转自选装备宝箱');
INSERT INTO `bg_items` VALUES ('4514', '2转自选装备宝箱');
INSERT INTO `bg_items` VALUES ('4515', '3转自选装备宝箱');
INSERT INTO `bg_items` VALUES ('4516', '4转自选装备宝箱');
INSERT INTO `bg_items` VALUES ('4517', '5转自选装备宝箱');
INSERT INTO `bg_items` VALUES ('4518', '6转自选装备宝箱');
INSERT INTO `bg_items` VALUES ('4519', '7转自选装备宝箱');
INSERT INTO `bg_items` VALUES ('4520', '8转自选装备宝箱');
INSERT INTO `bg_items` VALUES ('4521', '9转自选装备宝箱');
INSERT INTO `bg_items` VALUES ('4522', '10转自选装备宝箱');
INSERT INTO `bg_items` VALUES ('4523', '11转自选装备宝箱');
INSERT INTO `bg_items` VALUES ('4524', '12转自选装备宝箱');
INSERT INTO `bg_items` VALUES ('4525', '13转自选装备宝箱');
INSERT INTO `bg_items` VALUES ('4526', '14转自选装备宝箱');
INSERT INTO `bg_items` VALUES ('4527', '15转自选装备宝箱');
INSERT INTO `bg_items` VALUES ('4528', '16转自选装备宝箱');
INSERT INTO `bg_items` VALUES ('4529', '17转自选装备宝箱');
INSERT INTO `bg_items` VALUES ('4530', '18转自选装备宝箱');
INSERT INTO `bg_items` VALUES ('4531', '19转自选装备宝箱');
INSERT INTO `bg_items` VALUES ('4532', '20转自选装备宝箱');
INSERT INTO `bg_items` VALUES ('4533', '60级随机装备宝箱');
INSERT INTO `bg_items` VALUES ('4534', '70级随机装备宝箱');
INSERT INTO `bg_items` VALUES ('4535', '80级随机装备宝箱');
INSERT INTO `bg_items` VALUES ('4536', '1转随机装备宝箱');
INSERT INTO `bg_items` VALUES ('4537', '2转随机装备宝箱');
INSERT INTO `bg_items` VALUES ('4538', '3转随机装备宝箱');
INSERT INTO `bg_items` VALUES ('4539', '4转随机装备宝箱');
INSERT INTO `bg_items` VALUES ('4540', '5转随机装备宝箱');
INSERT INTO `bg_items` VALUES ('4541', '6转随机装备宝箱');
INSERT INTO `bg_items` VALUES ('4542', '7转随机装备宝箱');
INSERT INTO `bg_items` VALUES ('4543', '8转随机装备宝箱');
INSERT INTO `bg_items` VALUES ('4544', '9转随机装备宝箱');
INSERT INTO `bg_items` VALUES ('4545', '10转随机装备宝箱');
INSERT INTO `bg_items` VALUES ('4546', '11转随机装备宝箱');
INSERT INTO `bg_items` VALUES ('4547', '12转随机装备宝箱');
INSERT INTO `bg_items` VALUES ('4548', '13转随机装备宝箱');
INSERT INTO `bg_items` VALUES ('4549', '14转随机装备宝箱');
INSERT INTO `bg_items` VALUES ('4550', '15转随机装备宝箱');
INSERT INTO `bg_items` VALUES ('4551', '16转随机装备宝箱');
INSERT INTO `bg_items` VALUES ('4552', '17转随机装备宝箱');
INSERT INTO `bg_items` VALUES ('4553', '18转随机装备宝箱');
INSERT INTO `bg_items` VALUES ('4554', '19转随机装备宝箱');
INSERT INTO `bg_items` VALUES ('4555', '20转随机装备宝箱');
INSERT INTO `bg_items` VALUES ('4556', '寒铁矿');
INSERT INTO `bg_items` VALUES ('4557', '火铜矿');
INSERT INTO `bg_items` VALUES ('4558', '玄金矿');
INSERT INTO `bg_items` VALUES ('4559', '祖母绿');
INSERT INTO `bg_items` VALUES ('4560', '蓝田玉');
INSERT INTO `bg_items` VALUES ('4561', '寒铁矿礼包');
INSERT INTO `bg_items` VALUES ('4562', '火铜矿礼包');
INSERT INTO `bg_items` VALUES ('4563', '玄金矿礼包');
INSERT INTO `bg_items` VALUES ('4564', '祖母绿礼包');
INSERT INTO `bg_items` VALUES ('4565', '蓝田玉礼包');
INSERT INTO `bg_items` VALUES ('4566', '1级头盔');
INSERT INTO `bg_items` VALUES ('4567', '2级头盔');
INSERT INTO `bg_items` VALUES ('4568', '3级头盔');
INSERT INTO `bg_items` VALUES ('4569', '1级防弹衣');
INSERT INTO `bg_items` VALUES ('4570', '2级防弹衣');
INSERT INTO `bg_items` VALUES ('4571', '3级防弹衣');
INSERT INTO `bg_items` VALUES ('4572', '越野车');
INSERT INTO `bg_items` VALUES ('4573', '卡丁车');
INSERT INTO `bg_items` VALUES ('4574', '摩托车');
INSERT INTO `bg_items` VALUES ('4575', '1级AK');
INSERT INTO `bg_items` VALUES ('4576', '2级AK');
INSERT INTO `bg_items` VALUES ('4577', '3级AK');
INSERT INTO `bg_items` VALUES ('4578', '1级SKS');
INSERT INTO `bg_items` VALUES ('4579', '2级SKS');
INSERT INTO `bg_items` VALUES ('4580', '3级SKS');
INSERT INTO `bg_items` VALUES ('4581', '1级R1895');
INSERT INTO `bg_items` VALUES ('4582', '2级R1895');
INSERT INTO `bg_items` VALUES ('4583', '3级R1895');
INSERT INTO `bg_items` VALUES ('4584', '1级98K');
INSERT INTO `bg_items` VALUES ('4585', '2级98K');
INSERT INTO `bg_items` VALUES ('4586', '3级98K');
INSERT INTO `bg_items` VALUES ('4587', '1级大砍刀');
INSERT INTO `bg_items` VALUES ('4588', '2级大砍刀');
INSERT INTO `bg_items` VALUES ('4589', '3级大砍刀');
INSERT INTO `bg_items` VALUES ('4590', '1级平底锅');
INSERT INTO `bg_items` VALUES ('4591', '2级平底锅');
INSERT INTO `bg_items` VALUES ('4592', '3级平底锅');
INSERT INTO `bg_items` VALUES ('4593', '1级镰刀');
INSERT INTO `bg_items` VALUES ('4594', '2级镰刀');
INSERT INTO `bg_items` VALUES ('4595', '3级镰刀');
INSERT INTO `bg_items` VALUES ('4596', '1级撬棍');
INSERT INTO `bg_items` VALUES ('4597', '2级撬棍');
INSERT INTO `bg_items` VALUES ('4598', '3级撬棍');
INSERT INTO `bg_items` VALUES ('4599', '4倍镜');
INSERT INTO `bg_items` VALUES ('4600', '8倍镜');
INSERT INTO `bg_items` VALUES ('4601', '16倍镜');
INSERT INTO `bg_items` VALUES ('4602', '子弹');
INSERT INTO `bg_items` VALUES ('4603', '能量饮料');
INSERT INTO `bg_items` VALUES ('4604', '急救包');
INSERT INTO `bg_items` VALUES ('4605', '医药箱');
INSERT INTO `bg_items` VALUES ('4606', '吃鸡金奖');
INSERT INTO `bg_items` VALUES ('4607', '吃鸡银奖');
INSERT INTO `bg_items` VALUES ('4608', '吃鸡铜奖');
INSERT INTO `bg_items` VALUES ('4609', '快递奖');
INSERT INTO `bg_items` VALUES ('4610', '鸡盒奖');
INSERT INTO `bg_items` VALUES ('4611', '绷带');
INSERT INTO `bg_items` VALUES ('4612', '参与奖礼包');
INSERT INTO `bg_items` VALUES ('4613', '联赛冠军礼包');
INSERT INTO `bg_items` VALUES ('4614', '联赛亚军礼包');
INSERT INTO `bg_items` VALUES ('4615', '联赛季军礼包');
INSERT INTO `bg_items` VALUES ('4616', '联赛殿军礼包');
INSERT INTO `bg_items` VALUES ('4617', '联赛酱油礼包');
INSERT INTO `bg_items` VALUES ('4618', '行会召集令');
INSERT INTO `bg_items` VALUES ('4619', '绝世英豪');
INSERT INTO `bg_items` VALUES ('4620', '屠龙圣刃');
INSERT INTO `bg_items` VALUES ('4621', '冰火之翼');
INSERT INTO `bg_items` VALUES ('4622', '屠龙圣甲');
INSERT INTO `bg_items` VALUES ('4623', '屠龙圣袍');
INSERT INTO `bg_items` VALUES ('4624', '冰火之翼碎片');
INSERT INTO `bg_items` VALUES ('4625', '4阶宝石随机礼包');
INSERT INTO `bg_items` VALUES ('4626', '帽子戏法');
INSERT INTO `bg_items` VALUES ('4627', '帽子戏法碎片');
INSERT INTO `bg_items` VALUES ('4628', '我是冠军(男)');
INSERT INTO `bg_items` VALUES ('4629', '我是冠军(女)');
INSERT INTO `bg_items` VALUES ('4630', '我是冠军碎片');
INSERT INTO `bg_items` VALUES ('4631', '我是冠军礼包');
INSERT INTO `bg_items` VALUES ('4632', '内功经验丹(微)');
INSERT INTO `bg_items` VALUES ('4633', '内功经验丹(小)');
INSERT INTO `bg_items` VALUES ('4634', '内功经验丹(中)');
INSERT INTO `bg_items` VALUES ('4635', '内功经验丹(大)');
INSERT INTO `bg_items` VALUES ('4636', '内功经验丹(巨)');
INSERT INTO `bg_items` VALUES ('4637', '冷渊天翔');
INSERT INTO `bg_items` VALUES ('4638', '蔷薇雅薰');
INSERT INTO `bg_items` VALUES ('4639', '暗幽影魅(男)');
INSERT INTO `bg_items` VALUES ('4640', '欧皇光环(男)');
INSERT INTO `bg_items` VALUES ('4641', '排行榜第1名礼包');
INSERT INTO `bg_items` VALUES ('4642', '排行榜第2名礼包');
INSERT INTO `bg_items` VALUES ('4643', '排行榜3-5名礼包');
INSERT INTO `bg_items` VALUES ('4644', '排行榜6-8名礼包');
INSERT INTO `bg_items` VALUES ('4645', '排行榜9-10名礼包');
INSERT INTO `bg_items` VALUES ('4646', '神秘礼包');
INSERT INTO `bg_items` VALUES ('4647', '神器碎片');
INSERT INTO `bg_items` VALUES ('4648', '至尊碎片');
INSERT INTO `bg_items` VALUES ('4649', '1转继承符');
INSERT INTO `bg_items` VALUES ('4650', '2转继承符');
INSERT INTO `bg_items` VALUES ('4651', '3转继承符');
INSERT INTO `bg_items` VALUES ('4652', '4转继承符');
INSERT INTO `bg_items` VALUES ('4653', '5转继承符');
INSERT INTO `bg_items` VALUES ('4654', '6转继承符');
INSERT INTO `bg_items` VALUES ('4655', '7转继承符');
INSERT INTO `bg_items` VALUES ('4656', '8转继承符');
INSERT INTO `bg_items` VALUES ('4657', '9转继承符');
INSERT INTO `bg_items` VALUES ('4658', '10转继承符');
INSERT INTO `bg_items` VALUES ('4659', '11转继承符');
INSERT INTO `bg_items` VALUES ('4660', '12转继承符');
INSERT INTO `bg_items` VALUES ('4661', '13转继承符');
INSERT INTO `bg_items` VALUES ('4662', '14转继承符');
INSERT INTO `bg_items` VALUES ('4663', '15转继承符');
INSERT INTO `bg_items` VALUES ('4664', '16转继承符');
INSERT INTO `bg_items` VALUES ('4665', '17转继承符');
INSERT INTO `bg_items` VALUES ('4666', '18转继承符');
INSERT INTO `bg_items` VALUES ('4667', '19转继承符');
INSERT INTO `bg_items` VALUES ('4668', '20转继承符');
INSERT INTO `bg_items` VALUES ('4669', '暗幽影魅(女)');
INSERT INTO `bg_items` VALUES ('4670', '欧皇光环(女)');
INSERT INTO `bg_items` VALUES ('4671', '经验玉(体验)');
INSERT INTO `bg_items` VALUES ('4672', '财源滚滚');
INSERT INTO `bg_items` VALUES ('4673', '特别的人');
INSERT INTO `bg_items` VALUES ('4674', '我是情圣');
INSERT INTO `bg_items` VALUES ('4675', '征战天下');
INSERT INTO `bg_items` VALUES ('4676', '荒野猎枪');
INSERT INTO `bg_items` VALUES ('4677', '荒野镖甲');
INSERT INTO `bg_items` VALUES ('4678', '荒野镖袍');
INSERT INTO `bg_items` VALUES ('4679', '荒野荣光');
INSERT INTO `bg_items` VALUES ('4680', '荒野风暴');
INSERT INTO `bg_items` VALUES ('4681', '幽魂战刃');
INSERT INTO `bg_items` VALUES ('4682', '冥王战甲');
INSERT INTO `bg_items` VALUES ('4683', '冥王战袍');
INSERT INTO `bg_items` VALUES ('4684', '霜天战魂');
INSERT INTO `bg_items` VALUES ('4685', '伏地雷光');
INSERT INTO `bg_items` VALUES ('4686', '荒野猎枪碎片');
INSERT INTO `bg_items` VALUES ('4687', '荒野镖甲碎片');
INSERT INTO `bg_items` VALUES ('4688', '荒野镖袍碎片');
INSERT INTO `bg_items` VALUES ('4689', '荒野荣光碎片');
INSERT INTO `bg_items` VALUES ('4690', '荒野风暴碎片');
INSERT INTO `bg_items` VALUES ('4691', '幽魂战刃碎片');
INSERT INTO `bg_items` VALUES ('4692', '冥王战甲碎片');
INSERT INTO `bg_items` VALUES ('4693', '冥王战袍碎片');
INSERT INTO `bg_items` VALUES ('4694', '霜天战魂碎片');
INSERT INTO `bg_items` VALUES ('4695', '伏地雷光碎片');
INSERT INTO `bg_items` VALUES ('4696', '璀璨传奇');
INSERT INTO `bg_items` VALUES ('4697', '宝藏碎片');
INSERT INTO `bg_items` VALUES ('4698', '万圣狂欢者');

-- ----------------------------
-- Table structure for bg_keep
-- ----------------------------
DROP TABLE IF EXISTS `bg_keep`;
CREATE TABLE `bg_keep` (
  `serverid` int(11) unsigned NOT NULL,
  `logdate` date NOT NULL,
  `day1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `day2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `day3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `day4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `day5` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `day6` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `day7` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `account` mediumint(8) unsigned DEFAULT '0',
  UNIQUE KEY `serverid` (`serverid`,`logdate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='7日留存';

-- ----------------------------
-- Records of bg_keep
-- ----------------------------
INSERT INTO `bg_keep` VALUES ('30001', '2018-11-15', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `bg_keep` VALUES ('30001', '2018-11-16', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `bg_keep` VALUES ('30001', '2018-11-17', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `bg_keep` VALUES ('30001', '2018-11-18', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `bg_keep` VALUES ('30001', '2018-11-19', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `bg_keep` VALUES ('30001', '2018-11-20', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `bg_keep` VALUES ('30001', '2018-11-21', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `bg_keep` VALUES ('30001', '2018-11-22', '0', '0', '0', '0', '0', '0', '0', '4');
INSERT INTO `bg_keep` VALUES ('30001', '2018-11-23', '0', '0', '0', '0', '0', '0', '0', '338');
INSERT INTO `bg_keep` VALUES ('30001', '2018-11-24', '0', '0', '0', '0', '0', '0', '0', '451');
INSERT INTO `bg_keep` VALUES ('30001', '2018-11-25', '0', '0', '0', '0', '0', '0', '0', '295');
INSERT INTO `bg_keep` VALUES ('30001', '2018-11-26', '0', '0', '0', '0', '0', '0', '0', '358');

-- ----------------------------
-- Table structure for bg_log
-- ----------------------------
DROP TABLE IF EXISTS `bg_log`;
CREATE TABLE `bg_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志表自增id',
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '用户id',
  `username` varchar(128) NOT NULL DEFAULT '' COMMENT '用户名',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户ip',
  `ctrl` varchar(100) NOT NULL DEFAULT '' COMMENT '访问模块',
  `act` varchar(100) NOT NULL DEFAULT '' COMMENT '用户操作',
  `desc` varchar(500) NOT NULL DEFAULT '' COMMENT '简要描述',
  `data` text COMMENT '数据',
  `created` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `username` (`username`) USING BTREE,
  KEY `ip` (`ip`) USING BTREE,
  KEY `ctrl_act` (`ctrl`,`act`) USING BTREE,
  KEY `created` (`created`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of bg_log
-- ----------------------------

-- ----------------------------
-- Table structure for bg_mail
-- ----------------------------
DROP TABLE IF EXISTS `bg_mail`;
CREATE TABLE `bg_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderid` int(11) unsigned NOT NULL COMMENT '发送者id',
  `data` text NOT NULL COMMENT '发送的数据',
  `logdate` datetime NOT NULL COMMENT '发送时间',
  `status` enum('2','1','0') NOT NULL DEFAULT '0' COMMENT '邮件状态,0待审核,1审核通过,2审核不通过',
  `type` enum('1','2','0') NOT NULL DEFAULT '0' COMMENT '邮件类型,0个人邮件，1为全服邮件,2为资源申请',
  `serverid` varchar(200) DEFAULT NULL COMMENT '服务器id',
  `checked_gm` varchar(20) DEFAULT NULL COMMENT '审核GM名字',
  `checked_time` datetime DEFAULT NULL COMMENT '审核时间',
  `error` text COMMENT '错误信息，审核通过发送时返回的错误信息',
  `limit_level` tinyint(3) unsigned DEFAULT NULL COMMENT '等级限制',
  `duration` smallint(5) unsigned DEFAULT NULL COMMENT '有效时间',
  `item` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='邮件';

-- ----------------------------
-- Records of bg_mail
-- ----------------------------
INSERT INTO `bg_mail` VALUES ('1', '33', 'a:7:{s:9:\"condition\";s:1:\"1\";s:8:\"rolelist\";s:8:\"16777367\";s:5:\"title\";s:12:\"系统邮件\";s:7:\"content\";s:4:\"1111\";s:8:\"serverid\";s:1:\"1\";s:11:\"limit_level\";s:0:\"\";s:4:\"item\";a:1:{i:0;a:4:{s:4:\"type\";i:0;s:4:\"sort\";s:4:\"4100\";s:3:\"num\";s:5:\"99999\";s:4:\"bind\";s:1:\"0\";}}}', '2020-05-10 12:59:13', '0', '0', '1', null, null, null, null, null, '幻彩羽 x 99999；');

-- ----------------------------
-- Table structure for bg_menu
-- ----------------------------
DROP TABLE IF EXISTS `bg_menu`;
CREATE TABLE `bg_menu` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单自增id',
  `type` varchar(10) NOT NULL DEFAULT '' COMMENT '菜单类型：央服、单服',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `url` varchar(256) NOT NULL DEFAULT '' COMMENT '链接',
  `parent` int(10) NOT NULL DEFAULT '0' COMMENT '上级菜单id',
  `icon` varchar(128) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `weight` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(10) NOT NULL DEFAULT '0' COMMENT '状态',
  `created` int(10) NOT NULL DEFAULT '0' COMMENT '创建菜单时间戳',
  PRIMARY KEY (`mid`),
  KEY `type_status` (`type`,`status`) USING BTREE,
  KEY `parent` (`parent`) USING BTREE,
  KEY `weight` (`weight`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8 COMMENT='菜单';

-- ----------------------------
-- Records of bg_menu
-- ----------------------------
INSERT INTO `bg_menu` VALUES ('1', 'tree', '系统设置', '', '0', 'style/skin4/images/icon/config.png', '33', '1', '0');
INSERT INTO `bg_menu` VALUES ('2', 'tree', '央服菜单', 'admin.php?ctrl=menu&type=tree', '1', '', '36', '1', '0');
INSERT INTO `bg_menu` VALUES ('4', 'tree', '用户分组', 'admin.php?ctrl=usergroup', '1', '', '38', '1', '0');
INSERT INTO `bg_menu` VALUES ('5', 'tree', '用户管理', 'admin.php?ctrl=user', '1', '', '37', '1', '0');
INSERT INTO `bg_menu` VALUES ('11', 'tree', '操作日志', 'admin.php?ctrl=log', '1', '', '41', '1', '0');
INSERT INTO `bg_menu` VALUES ('20', 'tree', '权限管理', 'admin.php?ctrl=permit', '1', '', '39', '1', '0');
INSERT INTO `bg_menu` VALUES ('21', 'tree', '服务器信息', '', '0', 'style/skin4/images/icon/server.png', '30', '1', '0');
INSERT INTO `bg_menu` VALUES ('28', 'tree', '服务器管理', 'admin.php?ctrl=server', '21', '', '32', '1', '0');
INSERT INTO `bg_menu` VALUES ('76', 'tree', '数据统计', '', '0', 'style/skin4/images/icon/overview.png', '0', '1', '0');
INSERT INTO `bg_menu` VALUES ('77', 'tree', '游戏管理', '', '0', 'style/skin4/images/icon/partic.png', '18', '1', '0');
INSERT INTO `bg_menu` VALUES ('137', 'tree', '玩家管理', '', '0', 'style/skin4/images/icon/user.png', '23', '1', '0');
INSERT INTO `bg_menu` VALUES ('171', 'tree', '调试', 'admin.php?ctrl=test&act=index', '1', '', '35', '1', '0');
INSERT INTO `bg_menu` VALUES ('174', 'tree', '玩家信息', 'admin.php?ctrl=role&act=index', '137', '', '24', '1', '0');
INSERT INTO `bg_menu` VALUES ('179', 'tree', '渠道管理', 'admin.php?ctrl=channel&act=index', '21', '', '31', '1', '0');
INSERT INTO `bg_menu` VALUES ('181', 'tree', '注册统计', 'admin.php?ctrl=stat&act=reg', '76', '', '4', '1', '0');
INSERT INTO `bg_menu` VALUES ('182', 'tree', '产消统计', 'admin.php?ctrl=stat&act=depletion', '76', '', '7', '1', '0');
INSERT INTO `bg_menu` VALUES ('183', 'tree', '登录统计', 'admin.php?ctrl=stat&act=login', '76', '', '5', '1', '0');
INSERT INTO `bg_menu` VALUES ('185', 'tree', 'GM功能', '', '0', 'style/skin4/images/icon/partic.png', '11', '1', '0');
INSERT INTO `bg_menu` VALUES ('186', 'tree', '个人邮件', 'admin.php?ctrl=mail&act=role_mail', '185', '', '15', '1', '0');
INSERT INTO `bg_menu` VALUES ('187', 'tree', '道具管理', 'admin.php?ctrl=item&act=index', '77', '', '22', '1', '0');
INSERT INTO `bg_menu` VALUES ('189', 'tree', '公告管理', 'admin.php?ctrl=notice&act=index', '185', '', '16', '1', '0');
INSERT INTO `bg_menu` VALUES ('190', 'tree', '内部号管理', 'admin.php?ctrl=insider&act=index', '77', '', '20', '1', '0');
INSERT INTO `bg_menu` VALUES ('191', 'tree', '资源申请', 'admin.php?ctrl=mail&act=resource', '185', '', '13', '1', '0');
INSERT INTO `bg_menu` VALUES ('192', 'tree', '单服邮件', 'admin.php?ctrl=mail&act=server_mail', '185', '', '14', '1', '0');
INSERT INTO `bg_menu` VALUES ('194', 'tree', '消费类型管理', 'admin.php?ctrl=expend&act=index', '77', '', '21', '1', '0');
INSERT INTO `bg_menu` VALUES ('195', 'tree', '充值统计', 'admin.php?ctrl=order&act=index', '76', '', '9', '1', '0');
INSERT INTO `bg_menu` VALUES ('196', 'tree', '在线统计', 'admin.php?ctrl=online&act=index', '76', '', '3', '1', '0');
INSERT INTO `bg_menu` VALUES ('197', 'tree', '帮派信息', 'admin.php?ctrl=guild&act=index', '137', '', '25', '1', '0');
INSERT INTO `bg_menu` VALUES ('201', 'tree', '活动管理', 'admin.php?ctrl=activity&act=index', '185', '', '12', '1', '0');
INSERT INTO `bg_menu` VALUES ('202', 'tree', '刷新功能', 'admin.php?ctrl=flush&act=index', '185', '', '17', '1', '0');
INSERT INTO `bg_menu` VALUES ('203', 'tree', '激活码', 'admin.php?ctrl=cdkey&act=index', '77', '', '19', '1', '0');
INSERT INTO `bg_menu` VALUES ('204', 'tree', '等级统计', 'admin.php?ctrl=stat&act=level', '76', '', '6', '1', '0');
INSERT INTO `bg_menu` VALUES ('205', 'tree', '系统信息', 'admin.php?ctrl=system&act=index', '1', '', '40', '1', '0');
INSERT INTO `bg_menu` VALUES ('206', 'tree', '竞技场排名', 'admin.php?ctrl=arena&act=index', '137', '', '27', '1', '0');
INSERT INTO `bg_menu` VALUES ('207', 'tree', '综合排行榜', 'admin.php?ctrl=rolecom&act=rank', '137', '', '26', '1', '0');
INSERT INTO `bg_menu` VALUES ('208', 'tree', '盗梦系统仓库', 'admin.php?ctrl=rolecom&act=daomeng', '137', '', '28', '2', '0');
INSERT INTO `bg_menu` VALUES ('209', 'tree', '秘籍系统仓库', 'admin.php?ctrl=rolecom&act=miji', '137', '', '29', '2', '0');
INSERT INTO `bg_menu` VALUES ('210', 'tree', '消费排行榜', 'admin.php?ctrl=stat&act=consumptionRank', '76', '', '8', '1', '0');
INSERT INTO `bg_menu` VALUES ('212', 'tree', '综合数据', 'admin.php?ctrl=stat&act=integrated', '76', '', '1', '1', '0');
INSERT INTO `bg_menu` VALUES ('214', 'tree', '留存统计', 'admin.php?ctrl=stat&act=keep', '76', '', '2', '1', '0');
INSERT INTO `bg_menu` VALUES ('216', 'tree', '修改密码', 'admin.php?ctrl=user&act=alterPassword', '1', '', '34', '1', '0');
INSERT INTO `bg_menu` VALUES ('217', 'tree', '手机信息', 'admin.php?ctrl=stat&act=phone', '76', '', '10', '1', '0');

-- ----------------------------
-- Table structure for bg_notice
-- ----------------------------
DROP TABLE IF EXISTS `bg_notice`;
CREATE TABLE `bg_notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `logdate` datetime NOT NULL COMMENT '发布时间',
  `serverid` text NOT NULL COMMENT '服务器列表',
  `content` text NOT NULL COMMENT '公告内容',
  `notice_type` tinyint(20) unsigned NOT NULL DEFAULT '1' COMMENT '位置',
  `send_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stime` datetime NOT NULL COMMENT '开始时间',
  `etime` datetime NOT NULL COMMENT '结束时间',
  `gm` char(20) NOT NULL COMMENT '发布人姓名',
  `time_interval` mediumint(8) unsigned DEFAULT '0' COMMENT '时间间隔',
  `delete` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='公告';

-- ----------------------------
-- Records of bg_notice
-- ----------------------------
INSERT INTO `bg_notice` VALUES ('4', '2020-05-10 12:32:18', '', '游戏机房切割维护中，数据将不变，请稍等！', '255', '0', '2020-05-09 00:00:00', '2021-08-31 00:00:00', 'admin', '5', '0');

-- ----------------------------
-- Table structure for bg_online
-- ----------------------------
DROP TABLE IF EXISTS `bg_online`;
CREATE TABLE `bg_online` (
  `logdate` date NOT NULL COMMENT '时间',
  `serverid` int(11) unsigned NOT NULL COMMENT '服务器id',
  `max` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '最大值',
  `min` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '最小值',
  `avg` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '平均值',
  `content` text NOT NULL COMMENT '每分钟每小时在线人数',
  UNIQUE KEY `服务器和时间` (`logdate`,`serverid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线统计-每分钟在线/每小时在线/最大值/最小值/平均值';

-- ----------------------------
-- Records of bg_online
-- ----------------------------

-- ----------------------------
-- Table structure for bg_online_time
-- ----------------------------
DROP TABLE IF EXISTS `bg_online_time`;
CREATE TABLE `bg_online_time` (
  `logdate` date NOT NULL COMMENT '时间',
  `serverid` int(10) unsigned NOT NULL COMMENT '服务器id',
  `content` longtext NOT NULL,
  UNIQUE KEY `logdate` (`logdate`,`serverid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线时长和登录次数';

-- ----------------------------
-- Records of bg_online_time
-- ----------------------------

-- ----------------------------
-- Table structure for bg_order
-- ----------------------------
DROP TABLE IF EXISTS `bg_order`;
CREATE TABLE `bg_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cp_orderid` varchar(250) DEFAULT NULL COMMENT '内部定义的订单号',
  `orderid` varchar(250) DEFAULT NULL COMMENT '联运平台订单id',
  `account` char(50) DEFAULT NULL COMMENT '账号',
  `actorid` int(10) unsigned DEFAULT NULL COMMENT '角色id',
  `channel` char(20) DEFAULT NULL COMMENT '渠道',
  `serverid` int(10) unsigned DEFAULT NULL COMMENT '服务器id',
  `money` float(10,2) unsigned DEFAULT NULL COMMENT '金额',
  `level` smallint(5) unsigned DEFAULT '0' COMMENT '角色等级',
  `time` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `return_data` text COMMENT '平台返回的数据',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderid` (`orderid`,`channel`) USING BTREE,
  KEY `serverid` (`serverid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of bg_order
-- ----------------------------

-- ----------------------------
-- Table structure for bg_order_backups
-- ----------------------------
DROP TABLE IF EXISTS `bg_order_backups`;
CREATE TABLE `bg_order_backups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cp_orderid` char(30) NOT NULL COMMENT '内部定义的订单号',
  `actorid` int(10) unsigned NOT NULL COMMENT '角色id',
  `channel` char(20) NOT NULL COMMENT '渠道',
  `serverid` int(10) unsigned NOT NULL COMMENT '服务器id',
  `create_time` datetime DEFAULT NULL,
  `return_data` text COMMENT '平台返回的数据',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表-备份表';

-- ----------------------------
-- Records of bg_order_backups
-- ----------------------------

-- ----------------------------
-- Table structure for bg_order_fail
-- ----------------------------
DROP TABLE IF EXISTS `bg_order_fail`;
CREATE TABLE `bg_order_fail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderid` char(50) NOT NULL COMMENT '联运平台订单id',
  `channel` char(20) NOT NULL COMMENT '渠道',
  `serverid` int(10) unsigned NOT NULL COMMENT '服务器id',
  `account` char(20) NOT NULL COMMENT '账号',
  `money` float(10,2) unsigned NOT NULL COMMENT '金额',
  `return_data` text NOT NULL COMMENT '平台返回的数据',
  `cp_orderid` char(30) DEFAULT NULL COMMENT '内部定义的订单号',
  `time` int(11) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `errorMsg` char(200) DEFAULT NULL,
  `actiorid` int(11) unsigned DEFAULT NULL,
  `level` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orderid` (`orderid`) USING BTREE,
  KEY `channel` (`channel`) USING BTREE,
  KEY `serverid` (`serverid`) USING BTREE,
  KEY `account` (`account`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='失败订单表';

-- ----------------------------
-- Records of bg_order_fail
-- ----------------------------

-- ----------------------------
-- Table structure for bg_order_level
-- ----------------------------
DROP TABLE IF EXISTS `bg_order_level`;
CREATE TABLE `bg_order_level` (
  `logdate` date NOT NULL,
  `serverid` int(11) NOT NULL,
  `content` text NOT NULL COMMENT '等级',
  UNIQUE KEY `level` (`serverid`,`logdate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='等级充值分布';

-- ----------------------------
-- Records of bg_order_level
-- ----------------------------
INSERT INTO `bg_order_level` VALUES ('2018-11-23', '0', '[{\"level\":0,\"times\":1,\"money\":0}]');
INSERT INTO `bg_order_level` VALUES ('2018-11-23', '30001', '[{\"level\":0,\"times\":34,\"money\":848}]');
INSERT INTO `bg_order_level` VALUES ('2018-11-24', '30001', '[{\"level\":0,\"times\":77,\"money\":2174}]');
INSERT INTO `bg_order_level` VALUES ('2018-11-25', '30001', '[{\"level\":0,\"times\":113,\"money\":3190}]');
INSERT INTO `bg_order_level` VALUES ('2018-11-26', '30001', '[{\"level\":0,\"times\":159,\"money\":4398}]');
INSERT INTO `bg_order_level` VALUES ('2018-11-27', '30001', '[{\"level\":0,\"times\":202,\"money\":5882}]');

-- ----------------------------
-- Table structure for bg_order_rank
-- ----------------------------
DROP TABLE IF EXISTS `bg_order_rank`;
CREATE TABLE `bg_order_rank` (
  `rank` tinyint(3) unsigned NOT NULL COMMENT '排名',
  `account` char(50) NOT NULL COMMENT '账号',
  `serverid` int(10) unsigned NOT NULL COMMENT '服务id',
  `money` int(7) unsigned NOT NULL COMMENT '充值金额',
  `times` smallint(5) unsigned NOT NULL COMMENT '充值次数',
  `last_charge_time` datetime NOT NULL COMMENT '最后充值时间',
  UNIQUE KEY `rank` (`serverid`,`rank`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值排行';

-- ----------------------------
-- Records of bg_order_rank
-- ----------------------------

-- ----------------------------
-- Table structure for bg_order_stat
-- ----------------------------
DROP TABLE IF EXISTS `bg_order_stat`;
CREATE TABLE `bg_order_stat` (
  `logdate` date NOT NULL,
  `serverid` int(11) NOT NULL,
  `num` smallint(5) unsigned NOT NULL COMMENT '充值人数',
  `times` smallint(5) unsigned NOT NULL COMMENT '充值次数',
  `money` smallint(5) unsigned NOT NULL COMMENT '充值金额 ',
  `f_num` smallint(5) unsigned NOT NULL COMMENT '首冲人数',
  `f_times` smallint(5) unsigned NOT NULL COMMENT '首冲次数',
  `f_money` smallint(5) unsigned NOT NULL COMMENT '首冲金额',
  `new_role_charge_num` smallint(5) unsigned DEFAULT '0' COMMENT '新玩家充值人数',
  `new_role_charge_money` smallint(5) unsigned DEFAULT '0' COMMENT '新玩家充值金额',
  UNIQUE KEY `logdate` (`logdate`,`serverid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值统计-每天统计一次';

-- ----------------------------
-- Records of bg_order_stat
-- ----------------------------
INSERT INTO `bg_order_stat` VALUES ('2018-11-23', '30001', '29', '34', '848', '29', '29', '780', '0', '0');
INSERT INTO `bg_order_stat` VALUES ('2018-11-24', '30001', '40', '43', '1326', '35', '35', '1138', '0', '0');
INSERT INTO `bg_order_stat` VALUES ('2018-11-25', '30001', '32', '36', '1016', '21', '21', '390', '0', '0');
INSERT INTO `bg_order_stat` VALUES ('2018-11-26', '30001', '37', '46', '1208', '27', '27', '520', '0', '0');
INSERT INTO `bg_order_stat` VALUES ('2018-11-27', '30001', '26', '43', '1484', '14', '14', '248', '0', '0');

-- ----------------------------
-- Table structure for bg_order_stat_copy
-- ----------------------------
DROP TABLE IF EXISTS `bg_order_stat_copy`;
CREATE TABLE `bg_order_stat_copy` (
  `logdate` date NOT NULL,
  `serverid` int(11) NOT NULL,
  `num` smallint(5) unsigned NOT NULL COMMENT '充值人数',
  `times` smallint(5) unsigned NOT NULL COMMENT '充值次数',
  `money` smallint(5) unsigned NOT NULL COMMENT '充值金额 ',
  `f_num` smallint(5) unsigned NOT NULL COMMENT '首冲人数',
  `f_times` smallint(5) unsigned NOT NULL COMMENT '首冲次数',
  `f_money` smallint(5) unsigned NOT NULL COMMENT '首冲金额',
  `new_role_charge_num` smallint(5) unsigned DEFAULT '0' COMMENT '新玩家充值人数',
  `new_role_charge_money` smallint(5) unsigned DEFAULT '0' COMMENT '新玩家充值金额',
  UNIQUE KEY `logdate` (`logdate`,`serverid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值统计-每天统计一次';

-- ----------------------------
-- Records of bg_order_stat_copy
-- ----------------------------

-- ----------------------------
-- Table structure for bg_permit
-- ----------------------------
DROP TABLE IF EXISTS `bg_permit`;
CREATE TABLE `bg_permit` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限表自增id',
  `type` char(10) NOT NULL DEFAULT '' COMMENT '类型：央服center、单服single',
  `group` varchar(100) NOT NULL DEFAULT '' COMMENT '权限分组名称',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '权限名称',
  `modules` text COMMENT '模块',
  `created` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- ----------------------------
-- Records of bg_permit
-- ----------------------------
INSERT INTO `bg_permit` VALUES ('17', 'center', '系统设置', '用户管理', 'a:1:{i:0;s:6:\"user_*\";}', '1357530464');
INSERT INTO `bg_permit` VALUES ('18', 'center', '系统设置', '用户分组', 'a:1:{i:0;s:11:\"usergroup_*\";}', '1357530586');
INSERT INTO `bg_permit` VALUES ('19', 'center', '系统设置', '央服菜单', 'a:1:{i:0;s:6:\"menu_*\";}', '1357530617');
INSERT INTO `bg_permit` VALUES ('59', 'center', '系统设置', '权限管理', 'a:1:{i:0;s:8:\"permit_*\";}', '1357652997');
INSERT INTO `bg_permit` VALUES ('60', 'center', '系统设置', '系统信息', 'a:1:{i:0;s:8:\"system_*\";}', '1449730965');
INSERT INTO `bg_permit` VALUES ('61', 'center', '系统设置', '操作日志', 'a:1:{i:0;s:5:\"log_*\";}', '1449731048');
INSERT INTO `bg_permit` VALUES ('62', 'center', '系统设置', '调试', 'a:1:{i:0;s:6:\"test_*\";}', '1449731082');
INSERT INTO `bg_permit` VALUES ('64', 'center', '数据统计', '消费排行榜', 'a:3:{i:0;s:20:\"stat_consumptionRank\";i:1;s:24:\"stat_consumptionRankItem\";i:2;s:28:\"stat_consumptionRankAjaxData\";}', '1449731167');
INSERT INTO `bg_permit` VALUES ('65', 'center', '数据统计', '在线统计', 'a:1:{i:0;s:8:\"online_*\";}', '1449731185');
INSERT INTO `bg_permit` VALUES ('66', 'center', '数据统计', '产销统计', 'a:3:{i:0;s:14:\"stat_depletion\";i:1;s:18:\"stat_depletionItem\";i:2;s:22:\"stat_dataTablesRespond\";}', '1449731261');
INSERT INTO `bg_permit` VALUES ('67', 'center', '数据统计', '登录统计', 'a:2:{i:0;s:10:\"stat_login\";i:1;s:22:\"stat_dataTablesRespond\";}', '1449731290');
INSERT INTO `bg_permit` VALUES ('68', 'center', '数据统计', '注册统计', 'a:2:{i:0;s:8:\"stat_reg\";i:1;s:22:\"stat_dataTablesRespond\";}', '1449731312');
INSERT INTO `bg_permit` VALUES ('69', 'center', '数据统计', '等级统计', 'a:2:{i:0;s:10:\"stat_level\";i:1;s:22:\"stat_dataTablesRespond\";}', '1449731335');
INSERT INTO `bg_permit` VALUES ('70', 'center', '数据统计', '充值统计', 'a:1:{i:0;s:7:\"order_*\";}', '1449731353');
INSERT INTO `bg_permit` VALUES ('71', 'center', 'GM功能', '活动管理', 'a:1:{i:0;s:10:\"activity_*\";}', '1449731389');
INSERT INTO `bg_permit` VALUES ('72', 'center', 'GM功能', '邮件 资源申请', 'a:1:{i:0;s:6:\"mail_*\";}', '1449731437');
INSERT INTO `bg_permit` VALUES ('73', 'center', 'GM功能', '公告管理', 'a:1:{i:0;s:8:\"notice_*\";}', '1449731453');
INSERT INTO `bg_permit` VALUES ('74', 'center', 'GM功能', '刷新功能', 'a:1:{i:0;s:7:\"flush_*\";}', '1449731468');
INSERT INTO `bg_permit` VALUES ('75', 'center', '游戏管理', '激活码', 'a:1:{i:0;s:7:\"cdkey_*\";}', '1449731504');
INSERT INTO `bg_permit` VALUES ('76', 'center', '游戏管理', '内部号管理', 'a:1:{i:0;s:9:\"insider_*\";}', '1449731523');
INSERT INTO `bg_permit` VALUES ('77', 'center', '游戏管理', '消费类型管理', 'a:1:{i:0;s:8:\"expend_*\";}', '1449731542');
INSERT INTO `bg_permit` VALUES ('78', 'center', '游戏管理', '道具管理', 'a:1:{i:0;s:6:\"item_*\";}', '1449731556');
INSERT INTO `bg_permit` VALUES ('79', 'center', '玩家管理', '玩家信息', 'a:1:{i:0;s:6:\"role_*\";}', '1449731597');
INSERT INTO `bg_permit` VALUES ('80', 'center', '玩家管理', '帮派信息', 'a:1:{i:0;s:7:\"guild_*\";}', '1449731614');
INSERT INTO `bg_permit` VALUES ('81', 'center', '玩家管理', '综合排行榜', 'a:3:{i:0;s:12:\"rolecom_rank\";i:1;s:25:\"rolecom_dataTableItemRank\";i:2;s:25:\"rolecom_dataTableAjaxRank\";}', '1449731635');
INSERT INTO `bg_permit` VALUES ('82', 'center', '玩家管理', '竞技场排名', 'a:1:{i:0;s:7:\"arena_*\";}', '1449731656');
INSERT INTO `bg_permit` VALUES ('83', 'center', '玩家管理', '盗梦系统仓库', 'a:3:{i:0;s:15:\"rolecom_daomeng\";i:1;s:24:\"rolecom_dataTableItemDao\";i:2;s:24:\"rolecom_dataTableAjaxDao\";}', '1449731716');
INSERT INTO `bg_permit` VALUES ('84', 'center', '玩家管理', '秘籍系统仓库', 'a:3:{i:0;s:12:\"rolecom_miji\";i:1;s:25:\"rolecom_dataTableItemMiji\";i:2;s:25:\"rolecom_dataTableAjaxMiji\";}', '1449731747');
INSERT INTO `bg_permit` VALUES ('85', 'center', '服务器信息', '渠道管理', 'a:1:{i:0;s:9:\"channel_*\";}', '1449731985');
INSERT INTO `bg_permit` VALUES ('86', 'center', '服务器信息', '服务器管理', 'a:1:{i:0;s:8:\"server_*\";}', '1449732003');
INSERT INTO `bg_permit` VALUES ('91', 'center', '数据统计', '综合数据', 'a:2:{i:0;s:15:\"stat_integrated\";i:1;s:22:\"stat_dataTablesRespond\";}', '1450407578');
INSERT INTO `bg_permit` VALUES ('92', 'center', '数据统计', '在线时长', 'a:1:{i:0;s:41:\"stat_onlineTime | stat_dataTabelsAjaxData\";}', '1450672019');
INSERT INTO `bg_permit` VALUES ('93', 'center', '数据统计', '在线时长', 'a:2:{i:0;s:15:\"stat_onlineTime\";i:1;s:22:\"stat_dataTablesRespond\";}', '1450672021');
INSERT INTO `bg_permit` VALUES ('94', 'center', '数据统计', '留存统计', 'a:2:{i:0;s:9:\"stat_keep\";i:1;s:22:\"stat_dataTablesRespond\";}', '1450778663');
INSERT INTO `bg_permit` VALUES ('96', 'center', '系统设置', '修改密码', 'a:2:{i:0;s:18:\"user_alterPassword\";i:1;s:11:\"user_submit\";}', '1451881407');

-- ----------------------------
-- Table structure for bg_phone
-- ----------------------------
DROP TABLE IF EXISTS `bg_phone`;
CREATE TABLE `bg_phone` (
  `logdate` date NOT NULL COMMENT '统计日',
  `serverid` int(11) NOT NULL,
  `actorid` int(10) unsigned NOT NULL COMMENT '角色id',
  `channel` char(20) DEFAULT NULL,
  `level` tinyint(3) unsigned DEFAULT NULL COMMENT '角色等级',
  `version` char(10) DEFAULT NULL COMMENT '前端版本',
  `phone_brand` char(50) DEFAULT NULL COMMENT '手机品牌',
  `phone_type` char(50) NOT NULL COMMENT '手机类型',
  `phone_version` char(20) DEFAULT NULL COMMENT '手机版本',
  `dpi` char(15) DEFAULT NULL COMMENT '分辨率',
  `net_supplier` char(20) DEFAULT NULL COMMENT '网络商',
  `net_type` char(20) DEFAULT NULL COMMENT '网络类型',
  `login_date` datetime DEFAULT NULL COMMENT '用户登录时间',
  UNIQUE KEY `logdate` (`logdate`,`actorid`,`phone_brand`,`phone_version`) USING BTREE,
  KEY `serverid` (`serverid`,`logdate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机信息';

-- ----------------------------
-- Records of bg_phone
-- ----------------------------

-- ----------------------------
-- Table structure for bg_phone_stat
-- ----------------------------
DROP TABLE IF EXISTS `bg_phone_stat`;
CREATE TABLE `bg_phone_stat` (
  `logdate` date NOT NULL,
  `serverid` int(10) unsigned NOT NULL,
  `content` longtext NOT NULL,
  UNIQUE KEY `logdate` (`logdate`,`serverid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='手机品牌统计';

-- ----------------------------
-- Records of bg_phone_stat
-- ----------------------------

-- ----------------------------
-- Table structure for bg_rank
-- ----------------------------
DROP TABLE IF EXISTS `bg_rank`;
CREATE TABLE `bg_rank` (
  `logdate` date NOT NULL COMMENT '日期',
  `serverid` int(10) unsigned NOT NULL COMMENT '服务器id',
  `type` tinyint(3) unsigned NOT NULL COMMENT '1元宝，2商城，3物品',
  `content` text NOT NULL,
  UNIQUE KEY `logdate` (`logdate`,`serverid`,`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='元宝消费 商城消费 物品消费排行榜';

-- ----------------------------
-- Records of bg_rank
-- ----------------------------

-- ----------------------------
-- Table structure for bg_server
-- ----------------------------
DROP TABLE IF EXISTS `bg_server`;
CREATE TABLE `bg_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_id` int(11) NOT NULL COMMENT '区服id',
  `server_ip` char(20) DEFAULT NULL COMMENT '服务器ip',
  `server_port` int(11) unsigned DEFAULT NULL COMMENT '服务器端口',
  `name` varchar(20) NOT NULL COMMENT '服务器名称',
  `status` tinyint(4) NOT NULL DEFAULT '4',
  `game_version` char(20) DEFAULT NULL COMMENT '游戏版本',
  `open_time` datetime DEFAULT NULL COMMENT '开服时间',
  `close_time` datetime DEFAULT NULL COMMENT '关服时间',
  `mysql_host` char(50) NOT NULL COMMENT '数据库地址',
  `mysql_port` int(11) NOT NULL DEFAULT '3306' COMMENT '数据库端口',
  `mysql_user` char(50) NOT NULL DEFAULT 'root' COMMENT '数据库用户',
  `mysql_passwd` char(50) DEFAULT NULL COMMENT '数据库密码',
  `actor_table` char(15) DEFAULT 'actor' COMMENT 'actor数据库名',
  `log_table` char(15) DEFAULT 'log' COMMENT 'log数据库名',
  `channel` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `server_id` (`server_id`) USING BTREE,
  KEY `open_time` (`open_time`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='服务器';

-- ----------------------------
-- Records of bg_server
-- ----------------------------
INSERT INTO `bg_server` VALUES ('2', '1', '192.168.8.111', '13006', '幽冥1区', '1', 'v1.0', '2018-12-05 09:30:00', '2028-09-29 09:51:00', '127.0.0.1', '3306', 'root', 'helloyuan.com', 'cq_actor1', 'cq_log', 'game');
INSERT INTO `bg_server` VALUES ('3', '2', '192.168.8.111', '13007', '幽冥2区', '4', 'v1.0', '2018-12-05 09:30:00', '2028-09-29 09:51:00', '127.0.0.1', '3306', 'root', 'helloyuan.com', 'cq_actor2', 'cq_log', 'game');

-- ----------------------------
-- Table structure for bg_server_login
-- ----------------------------
DROP TABLE IF EXISTS `bg_server_login`;
CREATE TABLE `bg_server_login` (
  `account` char(30) NOT NULL COMMENT '账号',
  `logdate` int(10) unsigned NOT NULL COMMENT '时间',
  `serverid` int(10) unsigned NOT NULL COMMENT '服务器id',
  UNIQUE KEY `account` (`account`,`serverid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='游戏用户登录过的服务器';

-- ----------------------------
-- Records of bg_server_login
-- ----------------------------

-- ----------------------------
-- Table structure for bg_stat_level
-- ----------------------------
DROP TABLE IF EXISTS `bg_stat_level`;
CREATE TABLE `bg_stat_level` (
  `logdate` date NOT NULL,
  `serverid` int(11) NOT NULL,
  `content` text NOT NULL,
  UNIQUE KEY `serverid` (`logdate`,`serverid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='等级统计';

-- ----------------------------
-- Records of bg_stat_level
-- ----------------------------
INSERT INTO `bg_stat_level` VALUES ('2018-11-22', '30001', '[{\"level\":11,\"num\":1},{\"level\":18,\"num\":1},{\"level\":45,\"num\":1},{\"level\":68,\"num\":1}]');
INSERT INTO `bg_stat_level` VALUES ('2018-11-23', '30001', '[{\"level\":0,\"num\":4},{\"level\":1,\"num\":6},{\"level\":2,\"num\":3},{\"level\":3,\"num\":9},{\"level\":4,\"num\":3},{\"level\":5,\"num\":3},{\"level\":6,\"num\":2},{\"level\":7,\"num\":1},{\"level\":9,\"num\":1},{\"level\":10,\"num\":4},{\"level\":11,\"num\":21},{\"level\":12,\"num\":4},{\"level\":13,\"num\":4},{\"level\":14,\"num\":3},{\"level\":15,\"num\":4},{\"level\":16,\"num\":2},{\"level\":17,\"num\":1},{\"level\":18,\"num\":3},{\"level\":19,\"num\":1},{\"level\":20,\"num\":5},{\"level\":21,\"num\":3},{\"level\":22,\"num\":2},{\"level\":23,\"num\":7},{\"level\":24,\"num\":8},{\"level\":25,\"num\":4},{\"level\":26,\"num\":4},{\"level\":27,\"num\":3},{\"level\":28,\"num\":1},{\"level\":29,\"num\":8},{\"level\":30,\"num\":5},{\"level\":31,\"num\":4},{\"level\":32,\"num\":1},{\"level\":33,\"num\":6},{\"level\":34,\"num\":5},{\"level\":35,\"num\":1},{\"level\":36,\"num\":3},{\"level\":37,\"num\":4},{\"level\":38,\"num\":2},{\"level\":39,\"num\":2},{\"level\":40,\"num\":4},{\"level\":41,\"num\":2},{\"level\":42,\"num\":1},{\"level\":43,\"num\":4},{\"level\":44,\"num\":4},{\"level\":45,\"num\":6},{\"level\":47,\"num\":2},{\"level\":48,\"num\":2},{\"level\":50,\"num\":4},{\"level\":52,\"num\":2},{\"level\":54,\"num\":1},{\"level\":55,\"num\":3},{\"level\":56,\"num\":4},{\"level\":57,\"num\":1},{\"level\":58,\"num\":3},{\"level\":59,\"num\":2},{\"level\":60,\"num\":1},{\"level\":61,\"num\":1},{\"level\":62,\"num\":2},{\"level\":63,\"num\":1},{\"level\":64,\"num\":2},{\"level\":65,\"num\":3},{\"level\":66,\"num\":3},{\"level\":67,\"num\":2},{\"level\":68,\"num\":7},{\"level\":69,\"num\":3},{\"level\":70,\"num\":8},{\"level\":71,\"num\":5},{\"level\":72,\"num\":4},{\"level\":73,\"num\":7},{\"level\":74,\"num\":20},{\"level\":75,\"num\":22},{\"level\":76,\"num\":16},{\"level\":77,\"num\":20},{\"level\":78,\"num\":12},{\"level\":79,\"num\":10},{\"level\":80,\"num\":20},{\"level\":81,\"num\":6},{\"level\":82,\"num\":1},{\"level\":83,\"num\":4},{\"level\":84,\"num\":2},{\"level\":85,\"num\":3},{\"level\":86,\"num\":2},{\"level\":87,\"num\":1},{\"level\":97,\"num\":1},{\"level\":100,\"num\":1},{\"level\":150,\"num\":1}]');
INSERT INTO `bg_stat_level` VALUES ('2018-11-24', '30001', '[{\"level\":0,\"num\":4},{\"level\":1,\"num\":7},{\"level\":2,\"num\":6},{\"level\":3,\"num\":23},{\"level\":4,\"num\":8},{\"level\":5,\"num\":5},{\"level\":6,\"num\":3},{\"level\":7,\"num\":3},{\"level\":9,\"num\":1},{\"level\":10,\"num\":15},{\"level\":11,\"num\":34},{\"level\":12,\"num\":17},{\"level\":13,\"num\":12},{\"level\":14,\"num\":4},{\"level\":15,\"num\":7},{\"level\":16,\"num\":6},{\"level\":17,\"num\":4},{\"level\":18,\"num\":5},{\"level\":19,\"num\":6},{\"level\":20,\"num\":11},{\"level\":21,\"num\":3},{\"level\":22,\"num\":5},{\"level\":23,\"num\":11},{\"level\":24,\"num\":12},{\"level\":25,\"num\":10},{\"level\":26,\"num\":8},{\"level\":27,\"num\":9},{\"level\":28,\"num\":9},{\"level\":29,\"num\":13},{\"level\":30,\"num\":9},{\"level\":31,\"num\":6},{\"level\":32,\"num\":8},{\"level\":33,\"num\":12},{\"level\":34,\"num\":7},{\"level\":35,\"num\":7},{\"level\":36,\"num\":4},{\"level\":37,\"num\":7},{\"level\":38,\"num\":3},{\"level\":39,\"num\":7},{\"level\":40,\"num\":6},{\"level\":41,\"num\":2},{\"level\":42,\"num\":4},{\"level\":43,\"num\":6},{\"level\":44,\"num\":8},{\"level\":45,\"num\":9},{\"level\":46,\"num\":9},{\"level\":47,\"num\":4},{\"level\":48,\"num\":7},{\"level\":49,\"num\":5},{\"level\":50,\"num\":5},{\"level\":51,\"num\":5},{\"level\":52,\"num\":2},{\"level\":53,\"num\":2},{\"level\":54,\"num\":1},{\"level\":55,\"num\":3},{\"level\":56,\"num\":5},{\"level\":57,\"num\":5},{\"level\":58,\"num\":6},{\"level\":59,\"num\":4},{\"level\":60,\"num\":2},{\"level\":61,\"num\":2},{\"level\":62,\"num\":7},{\"level\":63,\"num\":5},{\"level\":64,\"num\":3},{\"level\":65,\"num\":7},{\"level\":66,\"num\":6},{\"level\":67,\"num\":4},{\"level\":68,\"num\":10},{\"level\":69,\"num\":4},{\"level\":70,\"num\":17},{\"level\":71,\"num\":8},{\"level\":72,\"num\":7},{\"level\":73,\"num\":7},{\"level\":74,\"num\":31},{\"level\":75,\"num\":39},{\"level\":76,\"num\":20},{\"level\":77,\"num\":29},{\"level\":78,\"num\":19},{\"level\":79,\"num\":14},{\"level\":80,\"num\":47},{\"level\":81,\"num\":20},{\"level\":82,\"num\":8},{\"level\":83,\"num\":9},{\"level\":84,\"num\":5},{\"level\":85,\"num\":6},{\"level\":86,\"num\":12},{\"level\":87,\"num\":7},{\"level\":88,\"num\":6},{\"level\":89,\"num\":7},{\"level\":90,\"num\":1},{\"level\":91,\"num\":5},{\"level\":92,\"num\":5},{\"level\":94,\"num\":3},{\"level\":95,\"num\":1},{\"level\":96,\"num\":2},{\"level\":97,\"num\":3},{\"level\":99,\"num\":1},{\"level\":100,\"num\":2},{\"level\":101,\"num\":1},{\"level\":102,\"num\":2},{\"level\":104,\"num\":1},{\"level\":105,\"num\":1},{\"level\":106,\"num\":1},{\"level\":150,\"num\":1}]');
INSERT INTO `bg_stat_level` VALUES ('2018-11-25', '30001', '[{\"level\":0,\"num\":4},{\"level\":1,\"num\":10},{\"level\":2,\"num\":14},{\"level\":3,\"num\":33},{\"level\":4,\"num\":9},{\"level\":5,\"num\":9},{\"level\":6,\"num\":3},{\"level\":7,\"num\":3},{\"level\":8,\"num\":1},{\"level\":9,\"num\":1},{\"level\":10,\"num\":19},{\"level\":11,\"num\":41},{\"level\":12,\"num\":22},{\"level\":13,\"num\":15},{\"level\":14,\"num\":6},{\"level\":15,\"num\":11},{\"level\":16,\"num\":13},{\"level\":17,\"num\":12},{\"level\":18,\"num\":9},{\"level\":19,\"num\":8},{\"level\":20,\"num\":14},{\"level\":21,\"num\":12},{\"level\":22,\"num\":6},{\"level\":23,\"num\":15},{\"level\":24,\"num\":15},{\"level\":25,\"num\":16},{\"level\":26,\"num\":11},{\"level\":27,\"num\":12},{\"level\":28,\"num\":16},{\"level\":29,\"num\":13},{\"level\":30,\"num\":11},{\"level\":31,\"num\":11},{\"level\":32,\"num\":13},{\"level\":33,\"num\":14},{\"level\":34,\"num\":7},{\"level\":35,\"num\":10},{\"level\":36,\"num\":5},{\"level\":37,\"num\":9},{\"level\":38,\"num\":3},{\"level\":39,\"num\":7},{\"level\":40,\"num\":5},{\"level\":41,\"num\":3},{\"level\":42,\"num\":8},{\"level\":43,\"num\":6},{\"level\":44,\"num\":9},{\"level\":45,\"num\":10},{\"level\":46,\"num\":10},{\"level\":47,\"num\":4},{\"level\":48,\"num\":9},{\"level\":49,\"num\":6},{\"level\":50,\"num\":6},{\"level\":51,\"num\":6},{\"level\":52,\"num\":6},{\"level\":53,\"num\":3},{\"level\":54,\"num\":3},{\"level\":55,\"num\":6},{\"level\":56,\"num\":6},{\"level\":57,\"num\":6},{\"level\":58,\"num\":6},{\"level\":59,\"num\":9},{\"level\":60,\"num\":4},{\"level\":61,\"num\":3},{\"level\":62,\"num\":9},{\"level\":63,\"num\":5},{\"level\":64,\"num\":4},{\"level\":65,\"num\":6},{\"level\":66,\"num\":6},{\"level\":67,\"num\":6},{\"level\":68,\"num\":11},{\"level\":69,\"num\":6},{\"level\":70,\"num\":20},{\"level\":71,\"num\":11},{\"level\":72,\"num\":10},{\"level\":73,\"num\":7},{\"level\":74,\"num\":33},{\"level\":75,\"num\":50},{\"level\":76,\"num\":21},{\"level\":77,\"num\":39},{\"level\":78,\"num\":25},{\"level\":79,\"num\":19},{\"level\":80,\"num\":49},{\"level\":81,\"num\":19},{\"level\":82,\"num\":14},{\"level\":83,\"num\":13},{\"level\":84,\"num\":13},{\"level\":85,\"num\":11},{\"level\":86,\"num\":14},{\"level\":87,\"num\":11},{\"level\":88,\"num\":6},{\"level\":89,\"num\":9},{\"level\":90,\"num\":4},{\"level\":91,\"num\":4},{\"level\":92,\"num\":4},{\"level\":93,\"num\":8},{\"level\":94,\"num\":3},{\"level\":95,\"num\":3},{\"level\":96,\"num\":6},{\"level\":97,\"num\":6},{\"level\":98,\"num\":5},{\"level\":99,\"num\":4},{\"level\":100,\"num\":5},{\"level\":101,\"num\":5},{\"level\":102,\"num\":3},{\"level\":103,\"num\":2},{\"level\":104,\"num\":1},{\"level\":105,\"num\":3},{\"level\":108,\"num\":1},{\"level\":109,\"num\":2},{\"level\":111,\"num\":1},{\"level\":112,\"num\":1},{\"level\":152,\"num\":1}]');
INSERT INTO `bg_stat_level` VALUES ('2018-11-26', '30001', '[{\"level\":0,\"num\":4},{\"level\":1,\"num\":13},{\"level\":2,\"num\":18},{\"level\":3,\"num\":46},{\"level\":4,\"num\":13},{\"level\":5,\"num\":17},{\"level\":6,\"num\":5},{\"level\":7,\"num\":3},{\"level\":8,\"num\":1},{\"level\":9,\"num\":1},{\"level\":10,\"num\":25},{\"level\":11,\"num\":65},{\"level\":12,\"num\":35},{\"level\":13,\"num\":17},{\"level\":14,\"num\":10},{\"level\":15,\"num\":13},{\"level\":16,\"num\":16},{\"level\":17,\"num\":24},{\"level\":18,\"num\":14},{\"level\":19,\"num\":8},{\"level\":20,\"num\":19},{\"level\":21,\"num\":17},{\"level\":22,\"num\":9},{\"level\":23,\"num\":17},{\"level\":24,\"num\":23},{\"level\":25,\"num\":18},{\"level\":26,\"num\":15},{\"level\":27,\"num\":22},{\"level\":28,\"num\":25},{\"level\":29,\"num\":15},{\"level\":30,\"num\":15},{\"level\":31,\"num\":14},{\"level\":32,\"num\":16},{\"level\":33,\"num\":16},{\"level\":34,\"num\":9},{\"level\":35,\"num\":11},{\"level\":36,\"num\":6},{\"level\":37,\"num\":13},{\"level\":38,\"num\":4},{\"level\":39,\"num\":6},{\"level\":40,\"num\":6},{\"level\":41,\"num\":3},{\"level\":42,\"num\":9},{\"level\":43,\"num\":9},{\"level\":44,\"num\":12},{\"level\":45,\"num\":11},{\"level\":46,\"num\":16},{\"level\":47,\"num\":9},{\"level\":48,\"num\":9},{\"level\":49,\"num\":10},{\"level\":50,\"num\":10},{\"level\":51,\"num\":8},{\"level\":52,\"num\":8},{\"level\":53,\"num\":5},{\"level\":54,\"num\":6},{\"level\":55,\"num\":5},{\"level\":56,\"num\":6},{\"level\":57,\"num\":10},{\"level\":58,\"num\":8},{\"level\":59,\"num\":10},{\"level\":60,\"num\":7},{\"level\":61,\"num\":4},{\"level\":62,\"num\":10},{\"level\":63,\"num\":6},{\"level\":64,\"num\":5},{\"level\":65,\"num\":7},{\"level\":66,\"num\":6},{\"level\":67,\"num\":6},{\"level\":68,\"num\":18},{\"level\":69,\"num\":12},{\"level\":70,\"num\":19},{\"level\":71,\"num\":16},{\"level\":72,\"num\":11},{\"level\":73,\"num\":11},{\"level\":74,\"num\":42},{\"level\":75,\"num\":61},{\"level\":76,\"num\":32},{\"level\":77,\"num\":53},{\"level\":78,\"num\":32},{\"level\":79,\"num\":24},{\"level\":80,\"num\":57},{\"level\":81,\"num\":31},{\"level\":82,\"num\":14},{\"level\":83,\"num\":14},{\"level\":84,\"num\":10},{\"level\":85,\"num\":15},{\"level\":86,\"num\":12},{\"level\":87,\"num\":16},{\"level\":88,\"num\":6},{\"level\":89,\"num\":7},{\"level\":90,\"num\":6},{\"level\":91,\"num\":5},{\"level\":92,\"num\":7},{\"level\":93,\"num\":3},{\"level\":94,\"num\":8},{\"level\":95,\"num\":9},{\"level\":96,\"num\":7},{\"level\":97,\"num\":13},{\"level\":98,\"num\":4},{\"level\":99,\"num\":3},{\"level\":100,\"num\":15},{\"level\":101,\"num\":8},{\"level\":102,\"num\":3},{\"level\":103,\"num\":1},{\"level\":104,\"num\":2},{\"level\":105,\"num\":3},{\"level\":106,\"num\":4},{\"level\":107,\"num\":1},{\"level\":108,\"num\":3},{\"level\":109,\"num\":1},{\"level\":110,\"num\":1},{\"level\":111,\"num\":3},{\"level\":112,\"num\":2},{\"level\":113,\"num\":1},{\"level\":114,\"num\":1},{\"level\":115,\"num\":1},{\"level\":153,\"num\":1}]');
INSERT INTO `bg_stat_level` VALUES ('2018-11-27', '30001', '[{\"level\":0,\"num\":5},{\"level\":1,\"num\":15},{\"level\":2,\"num\":21},{\"level\":3,\"num\":49},{\"level\":4,\"num\":17},{\"level\":5,\"num\":18},{\"level\":6,\"num\":5},{\"level\":7,\"num\":3},{\"level\":8,\"num\":1},{\"level\":9,\"num\":1},{\"level\":10,\"num\":26},{\"level\":11,\"num\":73},{\"level\":12,\"num\":38},{\"level\":13,\"num\":19},{\"level\":14,\"num\":11},{\"level\":15,\"num\":14},{\"level\":16,\"num\":17},{\"level\":17,\"num\":24},{\"level\":18,\"num\":14},{\"level\":19,\"num\":9},{\"level\":20,\"num\":22},{\"level\":21,\"num\":17},{\"level\":22,\"num\":8},{\"level\":23,\"num\":17},{\"level\":24,\"num\":24},{\"level\":25,\"num\":18},{\"level\":26,\"num\":15},{\"level\":27,\"num\":22},{\"level\":28,\"num\":25},{\"level\":29,\"num\":16},{\"level\":30,\"num\":18},{\"level\":31,\"num\":14},{\"level\":32,\"num\":17},{\"level\":33,\"num\":17},{\"level\":34,\"num\":10},{\"level\":35,\"num\":11},{\"level\":36,\"num\":7},{\"level\":37,\"num\":13},{\"level\":38,\"num\":5},{\"level\":39,\"num\":6},{\"level\":40,\"num\":6},{\"level\":41,\"num\":2},{\"level\":42,\"num\":9},{\"level\":43,\"num\":9},{\"level\":44,\"num\":14},{\"level\":45,\"num\":12},{\"level\":46,\"num\":17},{\"level\":47,\"num\":8},{\"level\":48,\"num\":10},{\"level\":49,\"num\":11},{\"level\":50,\"num\":12},{\"level\":51,\"num\":8},{\"level\":52,\"num\":7},{\"level\":53,\"num\":4},{\"level\":54,\"num\":9},{\"level\":55,\"num\":7},{\"level\":56,\"num\":6},{\"level\":57,\"num\":10},{\"level\":58,\"num\":8},{\"level\":59,\"num\":10},{\"level\":60,\"num\":7},{\"level\":61,\"num\":3},{\"level\":62,\"num\":9},{\"level\":63,\"num\":6},{\"level\":64,\"num\":5},{\"level\":65,\"num\":6},{\"level\":66,\"num\":6},{\"level\":67,\"num\":6},{\"level\":68,\"num\":18},{\"level\":69,\"num\":11},{\"level\":70,\"num\":20},{\"level\":71,\"num\":16},{\"level\":72,\"num\":13},{\"level\":73,\"num\":12},{\"level\":74,\"num\":45},{\"level\":75,\"num\":62},{\"level\":76,\"num\":31},{\"level\":77,\"num\":50},{\"level\":78,\"num\":34},{\"level\":79,\"num\":26},{\"level\":80,\"num\":61},{\"level\":81,\"num\":29},{\"level\":82,\"num\":24},{\"level\":83,\"num\":15},{\"level\":84,\"num\":15},{\"level\":85,\"num\":13},{\"level\":86,\"num\":12},{\"level\":87,\"num\":17},{\"level\":88,\"num\":11},{\"level\":89,\"num\":10},{\"level\":90,\"num\":4},{\"level\":91,\"num\":4},{\"level\":92,\"num\":9},{\"level\":93,\"num\":4},{\"level\":94,\"num\":5},{\"level\":95,\"num\":8},{\"level\":96,\"num\":9},{\"level\":97,\"num\":8},{\"level\":98,\"num\":5},{\"level\":99,\"num\":3},{\"level\":100,\"num\":15},{\"level\":101,\"num\":13},{\"level\":102,\"num\":10},{\"level\":103,\"num\":5},{\"level\":104,\"num\":5},{\"level\":105,\"num\":3},{\"level\":106,\"num\":1},{\"level\":108,\"num\":1},{\"level\":109,\"num\":2},{\"level\":110,\"num\":3},{\"level\":111,\"num\":5},{\"level\":112,\"num\":4},{\"level\":113,\"num\":2},{\"level\":114,\"num\":2},{\"level\":115,\"num\":1},{\"level\":153,\"num\":1}]');

-- ----------------------------
-- Table structure for bg_stat_login
-- ----------------------------
DROP TABLE IF EXISTS `bg_stat_login`;
CREATE TABLE `bg_stat_login` (
  `logdate` date NOT NULL COMMENT '日期',
  `serverid` int(10) unsigned NOT NULL COMMENT '服务器id',
  `content` text NOT NULL COMMENT '登录人数',
  `total` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `logdate` (`serverid`,`logdate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='登录统计';

-- ----------------------------
-- Records of bg_stat_login
-- ----------------------------
INSERT INTO `bg_stat_login` VALUES ('2018-11-22', '30001', '[{\"hour\":\"00\",\"num\":496},{\"hour\":\"01\",\"num\":334},{\"hour\":\"02\",\"num\":266},{\"hour\":\"03\",\"num\":154},{\"hour\":\"04\",\"num\":89},{\"hour\":\"05\",\"num\":136},{\"hour\":\"06\",\"num\":374},{\"hour\":\"07\",\"num\":471},{\"hour\":\"08\",\"num\":675},{\"hour\":\"09\",\"num\":494},{\"hour\":10,\"num\":544},{\"hour\":11,\"num\":631},{\"hour\":12,\"num\":727},{\"hour\":13,\"num\":464},{\"hour\":14,\"num\":474},{\"hour\":15,\"num\":436},{\"hour\":16,\"num\":625},{\"hour\":17,\"num\":598},{\"hour\":18,\"num\":544},{\"hour\":19,\"num\":543},{\"hour\":20,\"num\":732},{\"hour\":21,\"num\":694},{\"hour\":22,\"num\":647},{\"hour\":23,\"num\":504}]', '11652');
INSERT INTO `bg_stat_login` VALUES ('2018-11-23', '30001', '[{\"hour\":\"00\",\"num\":470},{\"hour\":\"01\",\"num\":216},{\"hour\":\"02\",\"num\":153},{\"hour\":\"03\",\"num\":100},{\"hour\":\"04\",\"num\":79},{\"hour\":\"05\",\"num\":123},{\"hour\":\"06\",\"num\":335},{\"hour\":\"07\",\"num\":448},{\"hour\":\"08\",\"num\":504},{\"hour\":\"09\",\"num\":490},{\"hour\":10,\"num\":524},{\"hour\":11,\"num\":530},{\"hour\":12,\"num\":583},{\"hour\":13,\"num\":480},{\"hour\":14,\"num\":532},{\"hour\":15,\"num\":554},{\"hour\":16,\"num\":660},{\"hour\":17,\"num\":707},{\"hour\":18,\"num\":644},{\"hour\":19,\"num\":718},{\"hour\":20,\"num\":864},{\"hour\":21,\"num\":779},{\"hour\":22,\"num\":707},{\"hour\":23,\"num\":643}]', '11843');
INSERT INTO `bg_stat_login` VALUES ('2018-11-24', '30001', '[{\"hour\":\"00\",\"num\":642},{\"hour\":\"01\",\"num\":365},{\"hour\":\"02\",\"num\":194},{\"hour\":\"03\",\"num\":128},{\"hour\":\"04\",\"num\":130},{\"hour\":\"05\",\"num\":154},{\"hour\":\"06\",\"num\":307},{\"hour\":\"07\",\"num\":542},{\"hour\":\"08\",\"num\":622},{\"hour\":\"09\",\"num\":543},{\"hour\":10,\"num\":661},{\"hour\":11,\"num\":701},{\"hour\":12,\"num\":707},{\"hour\":13,\"num\":544},{\"hour\":14,\"num\":515},{\"hour\":15,\"num\":533},{\"hour\":16,\"num\":613},{\"hour\":17,\"num\":671},{\"hour\":18,\"num\":589},{\"hour\":19,\"num\":632},{\"hour\":20,\"num\":810},{\"hour\":21,\"num\":775},{\"hour\":22,\"num\":675},{\"hour\":23,\"num\":586}]', '12639');
INSERT INTO `bg_stat_login` VALUES ('2018-11-25', '30001', '[{\"hour\":\"00\",\"num\":550},{\"hour\":\"01\",\"num\":286},{\"hour\":\"02\",\"num\":192},{\"hour\":\"03\",\"num\":133},{\"hour\":\"04\",\"num\":139},{\"hour\":\"05\",\"num\":155},{\"hour\":\"06\",\"num\":272},{\"hour\":\"07\",\"num\":674},{\"hour\":\"08\",\"num\":577},{\"hour\":\"09\",\"num\":576},{\"hour\":10,\"num\":602},{\"hour\":11,\"num\":629},{\"hour\":12,\"num\":638},{\"hour\":13,\"num\":502},{\"hour\":14,\"num\":501},{\"hour\":15,\"num\":669},{\"hour\":16,\"num\":694},{\"hour\":17,\"num\":849},{\"hour\":18,\"num\":593},{\"hour\":19,\"num\":559},{\"hour\":20,\"num\":834},{\"hour\":21,\"num\":810},{\"hour\":22,\"num\":689},{\"hour\":23,\"num\":713}]', '12836');
INSERT INTO `bg_stat_login` VALUES ('2018-11-26', '30001', '[{\"hour\":\"00\",\"num\":598},{\"hour\":\"01\",\"num\":301},{\"hour\":\"02\",\"num\":150},{\"hour\":\"03\",\"num\":122},{\"hour\":\"04\",\"num\":158},{\"hour\":\"05\",\"num\":171},{\"hour\":\"06\",\"num\":266},{\"hour\":\"07\",\"num\":495},{\"hour\":\"08\",\"num\":582},{\"hour\":\"09\",\"num\":533},{\"hour\":10,\"num\":706},{\"hour\":11,\"num\":711},{\"hour\":12,\"num\":749},{\"hour\":13,\"num\":487},{\"hour\":14,\"num\":504},{\"hour\":15,\"num\":556},{\"hour\":16,\"num\":2576},{\"hour\":17,\"num\":1508},{\"hour\":18,\"num\":636},{\"hour\":19,\"num\":629},{\"hour\":20,\"num\":957},{\"hour\":21,\"num\":980},{\"hour\":22,\"num\":690},{\"hour\":23,\"num\":780}]', '15845');
INSERT INTO `bg_stat_login` VALUES ('2018-11-27', '30001', '[{\"hour\":\"00\",\"num\":408},{\"hour\":\"01\",\"num\":304},{\"hour\":\"02\",\"num\":180},{\"hour\":\"03\",\"num\":163},{\"hour\":\"04\",\"num\":121},{\"hour\":\"05\",\"num\":164},{\"hour\":\"06\",\"num\":276},{\"hour\":\"07\",\"num\":517},{\"hour\":\"08\",\"num\":584},{\"hour\":\"09\",\"num\":563},{\"hour\":10,\"num\":629},{\"hour\":11,\"num\":1005},{\"hour\":12,\"num\":2753},{\"hour\":13,\"num\":2542},{\"hour\":14,\"num\":970},{\"hour\":15,\"num\":468}]', '11647');

-- ----------------------------
-- Table structure for bg_stat_reg
-- ----------------------------
DROP TABLE IF EXISTS `bg_stat_reg`;
CREATE TABLE `bg_stat_reg` (
  `logdate` date NOT NULL COMMENT '日期',
  `serverid` int(10) unsigned NOT NULL COMMENT '服务器id',
  `content` text NOT NULL COMMENT '注册数',
  `total` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '当天注册数',
  UNIQUE KEY `logdate` (`serverid`,`logdate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='注册数、创角数';

-- ----------------------------
-- Records of bg_stat_reg
-- ----------------------------
INSERT INTO `bg_stat_reg` VALUES ('2018-11-22', '30001', '[{\"hour\":20,\"num\":1},{\"hour\":21,\"num\":3}]', '4');
INSERT INTO `bg_stat_reg` VALUES ('2018-11-23', '30001', '[{\"hour\":\"09\",\"num\":3},{\"hour\":12,\"num\":1},{\"hour\":14,\"num\":32},{\"hour\":15,\"num\":32},{\"hour\":16,\"num\":29},{\"hour\":17,\"num\":24},{\"hour\":18,\"num\":36},{\"hour\":19,\"num\":40},{\"hour\":20,\"num\":31},{\"hour\":21,\"num\":29},{\"hour\":22,\"num\":43},{\"hour\":23,\"num\":33}]', '333');
INSERT INTO `bg_stat_reg` VALUES ('2018-11-24', '30001', '[{\"hour\":17,\"num\":16},{\"hour\":\"07\",\"num\":10},{\"hour\":\"00\",\"num\":25},{\"hour\":10,\"num\":27},{\"hour\":14,\"num\":15},{\"hour\":\"03\",\"num\":8},{\"hour\":20,\"num\":29},{\"hour\":11,\"num\":27},{\"hour\":\"01\",\"num\":13},{\"hour\":\"02\",\"num\":5},{\"hour\":\"08\",\"num\":15},{\"hour\":\"04\",\"num\":5},{\"hour\":\"05\",\"num\":4},{\"hour\":\"06\",\"num\":11},{\"hour\":\"09\",\"num\":16},{\"hour\":13,\"num\":16},{\"hour\":16,\"num\":17},{\"hour\":12,\"num\":25},{\"hour\":15,\"num\":21},{\"hour\":18,\"num\":19},{\"hour\":19,\"num\":25},{\"hour\":21,\"num\":36},{\"hour\":22,\"num\":42},{\"hour\":23,\"num\":24}]', '451');
INSERT INTO `bg_stat_reg` VALUES ('2018-11-25', '30001', '[{\"hour\":\"01\",\"num\":11},{\"hour\":\"07\",\"num\":8},{\"hour\":13,\"num\":13},{\"hour\":\"00\",\"num\":15},{\"hour\":22,\"num\":18},{\"hour\":17,\"num\":10},{\"hour\":23,\"num\":17},{\"hour\":\"06\",\"num\":7},{\"hour\":\"08\",\"num\":10},{\"hour\":11,\"num\":14},{\"hour\":\"09\",\"num\":12},{\"hour\":\"02\",\"num\":4},{\"hour\":\"03\",\"num\":4},{\"hour\":\"04\",\"num\":3},{\"hour\":\"05\",\"num\":3},{\"hour\":20,\"num\":26},{\"hour\":15,\"num\":11},{\"hour\":12,\"num\":9},{\"hour\":10,\"num\":19},{\"hour\":14,\"num\":14},{\"hour\":16,\"num\":11},{\"hour\":18,\"num\":17},{\"hour\":19,\"num\":17},{\"hour\":21,\"num\":21}]', '294');
INSERT INTO `bg_stat_reg` VALUES ('2018-11-26', '30001', '[{\"hour\":11,\"num\":22},{\"hour\":\"09\",\"num\":12},{\"hour\":\"07\",\"num\":5},{\"hour\":\"00\",\"num\":12},{\"hour\":10,\"num\":19},{\"hour\":21,\"num\":36},{\"hour\":\"04\",\"num\":7},{\"hour\":19,\"num\":25},{\"hour\":12,\"num\":15},{\"hour\":\"06\",\"num\":2},{\"hour\":18,\"num\":22},{\"hour\":\"01\",\"num\":7},{\"hour\":13,\"num\":21},{\"hour\":\"03\",\"num\":4},{\"hour\":\"02\",\"num\":5},{\"hour\":\"05\",\"num\":6},{\"hour\":\"08\",\"num\":8},{\"hour\":17,\"num\":10},{\"hour\":14,\"num\":11},{\"hour\":15,\"num\":15},{\"hour\":20,\"num\":28},{\"hour\":16,\"num\":19},{\"hour\":22,\"num\":29},{\"hour\":23,\"num\":18}]', '358');
INSERT INTO `bg_stat_reg` VALUES ('2018-11-27', '30001', '[{\"hour\":11,\"num\":9},{\"hour\":\"03\",\"num\":5},{\"hour\":\"02\",\"num\":11},{\"hour\":14,\"num\":6},{\"hour\":\"07\",\"num\":10},{\"hour\":\"01\",\"num\":12},{\"hour\":\"00\",\"num\":14},{\"hour\":15,\"num\":9},{\"hour\":\"08\",\"num\":4},{\"hour\":12,\"num\":12},{\"hour\":\"04\",\"num\":3},{\"hour\":\"06\",\"num\":2},{\"hour\":10,\"num\":12},{\"hour\":\"05\",\"num\":1},{\"hour\":\"09\",\"num\":15},{\"hour\":13,\"num\":15}]', '140');

-- ----------------------------
-- Table structure for bg_user
-- ----------------------------
DROP TABLE IF EXISTS `bg_user`;
CREATE TABLE `bg_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户自增id',
  `username` varchar(128) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(128) NOT NULL DEFAULT '' COMMENT '加密密码',
  `groupid` int(10) NOT NULL DEFAULT '0' COMMENT '用户组id',
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '姓名',
  `email` varchar(256) NOT NULL DEFAULT '' COMMENT 'email',
  `tel` varchar(128) NOT NULL DEFAULT '' COMMENT '电话',
  `department` varchar(128) NOT NULL DEFAULT '' COMMENT '所在部门',
  `created` int(10) NOT NULL DEFAULT '0' COMMENT '创建用户时间戳',
  `expiration` int(10) NOT NULL DEFAULT '0' COMMENT '用户过期时间戳',
  `last_login_time` int(10) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` varchar(128) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `login_flag` char(16) NOT NULL DEFAULT '' COMMENT '登录跳转验证',
  `status` int(10) NOT NULL DEFAULT '0' COMMENT '用户状态',
  PRIMARY KEY (`uid`),
  KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of bg_user
-- ----------------------------
INSERT INTO `bg_user` VALUES ('33', 'admin', 'a617f15138311ac15e39c7d7053d4b0b', '1', 'admin', '76891828@qq.com', '76891828', '技术部', '1425635928', '1560870400', '1589084962', '180.141.195.222', '', '1');

-- ----------------------------
-- Table structure for bg_user_group
-- ----------------------------
DROP TABLE IF EXISTS `bg_user_group`;
CREATE TABLE `bg_user_group` (
  `groupid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组自增id',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '用户组名称',
  `description` varchar(256) DEFAULT '0' COMMENT '描述',
  `center_permit` text COMMENT '央服权限数据',
  `center_modules` text COMMENT '央服权限模块',
  `server` text COMMENT '服务器',
  `channel` text,
  `allow_ip` text COMMENT 'ip白名单',
  `created` int(10) NOT NULL DEFAULT '0' COMMENT '创建用户组时间戳',
  PRIMARY KEY (`groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户组';

-- ----------------------------
-- Records of bg_user_group
-- ----------------------------
INSERT INTO `bg_user_group` VALUES ('1', '超级管理员', '具有所有权限', 'a:33:{i:0;s:2:\"17\";i:1;s:2:\"18\";i:2;s:2:\"19\";i:3;s:2:\"59\";i:4;s:2:\"60\";i:5;s:2:\"61\";i:6;s:2:\"62\";i:7;s:2:\"64\";i:8;s:2:\"65\";i:9;s:2:\"66\";i:10;s:2:\"67\";i:11;s:2:\"68\";i:12;s:2:\"69\";i:13;s:2:\"70\";i:14;s:2:\"91\";i:15;s:2:\"93\";i:16;s:2:\"94\";i:17;s:2:\"71\";i:18;s:2:\"72\";i:19;s:2:\"73\";i:20;s:2:\"74\";i:21;s:2:\"75\";i:22;s:2:\"76\";i:23;s:2:\"77\";i:24;s:2:\"78\";i:25;s:2:\"79\";i:26;s:2:\"80\";i:27;s:2:\"81\";i:28;s:2:\"82\";i:29;s:2:\"83\";i:30;s:2:\"84\";i:31;s:2:\"85\";i:32;s:2:\"86\";}', 'a:50:{i:0;s:3:\"all\";i:1;s:6:\"user_*\";i:2;s:11:\"usergroup_*\";i:3;s:6:\"menu_*\";i:4;s:8:\"permit_*\";i:5;s:8:\"system_*\";i:6;s:5:\"log_*\";i:7;s:6:\"test_*\";i:8;s:20:\"stat_consumptionRank\";i:9;s:24:\"stat_consumptionRankItem\";i:10;s:28:\"stat_consumptionRankAjaxData\";i:11;s:8:\"online_*\";i:12;s:14:\"stat_depletion\";i:13;s:18:\"stat_depletionItem\";i:14;s:22:\"stat_dataTablesRespond\";i:15;s:10:\"stat_login\";i:16;s:22:\"stat_dataTablesRespond\";i:17;s:8:\"stat_reg\";i:18;s:22:\"stat_dataTablesRespond\";i:19;s:10:\"stat_level\";i:20;s:22:\"stat_dataTablesRespond\";i:21;s:7:\"order_*\";i:22;s:10:\"activity_*\";i:23;s:6:\"mail_*\";i:24;s:8:\"notice_*\";i:25;s:7:\"flush_*\";i:26;s:7:\"cdkey_*\";i:27;s:9:\"insider_*\";i:28;s:8:\"expend_*\";i:29;s:6:\"item_*\";i:30;s:6:\"role_*\";i:31;s:7:\"guild_*\";i:32;s:12:\"rolecom_rank\";i:33;s:25:\"rolecom_dataTableItemRank\";i:34;s:25:\"rolecom_dataTableAjaxRank\";i:35;s:7:\"arena_*\";i:36;s:15:\"rolecom_daomeng\";i:37;s:24:\"rolecom_dataTableItemDao\";i:38;s:24:\"rolecom_dataTableAjaxDao\";i:39;s:12:\"rolecom_miji\";i:40;s:25:\"rolecom_dataTableItemMiji\";i:41;s:25:\"rolecom_dataTableAjaxMiji\";i:42;s:9:\"channel_*\";i:43;s:8:\"server_*\";i:44;s:15:\"stat_integrated\";i:45;s:22:\"stat_dataTablesRespond\";i:46;s:15:\"stat_onlineTime\";i:47;s:22:\"stat_dataTablesRespond\";i:48;s:9:\"stat_keep\";i:49;s:22:\"stat_dataTablesRespond\";}', '', 'all', '', '1348107818');
INSERT INTO `bg_user_group` VALUES ('2', '普通用户', '', 'a:8:{i:0;s:2:\"96\";i:1;s:2:\"75\";i:2;s:2:\"79\";i:3;s:2:\"80\";i:4;s:2:\"81\";i:5;s:2:\"82\";i:6;s:2:\"83\";i:7;s:2:\"84\";}', 'a:15:{i:0;s:7:\"cdkey_*\";i:1;s:6:\"role_*\";i:2;s:7:\"guild_*\";i:3;s:12:\"rolecom_rank\";i:4;s:25:\"rolecom_dataTableItemRank\";i:5;s:25:\"rolecom_dataTableAjaxRank\";i:6;s:7:\"arena_*\";i:7;s:15:\"rolecom_daomeng\";i:8;s:24:\"rolecom_dataTableItemDao\";i:9;s:24:\"rolecom_dataTableAjaxDao\";i:10;s:12:\"rolecom_miji\";i:11;s:25:\"rolecom_dataTableItemMiji\";i:12;s:25:\"rolecom_dataTableAjaxMiji\";i:13;s:18:\"user_alterPassword\";i:14;s:11:\"user_submit\";}', '', 'all', 'a:0:{}', '1348107818');
INSERT INTO `bg_user_group` VALUES ('6', '管理员', '', 'a:26:{i:0;s:2:\"96\";i:1;s:2:\"64\";i:2;s:2:\"65\";i:3;s:2:\"66\";i:4;s:2:\"67\";i:5;s:2:\"68\";i:6;s:2:\"69\";i:7;s:2:\"70\";i:8;s:2:\"91\";i:9;s:2:\"93\";i:10;s:2:\"94\";i:11;s:2:\"71\";i:12;s:2:\"72\";i:13;s:2:\"73\";i:14;s:2:\"74\";i:15;s:2:\"75\";i:16;s:2:\"77\";i:17;s:2:\"78\";i:18;s:2:\"79\";i:19;s:2:\"80\";i:20;s:2:\"81\";i:21;s:2:\"82\";i:22;s:2:\"83\";i:23;s:2:\"84\";i:24;s:2:\"85\";i:25;s:2:\"86\";}', 'a:43:{i:0;s:20:\"stat_consumptionRank\";i:1;s:24:\"stat_consumptionRankItem\";i:2;s:28:\"stat_consumptionRankAjaxData\";i:3;s:8:\"online_*\";i:4;s:14:\"stat_depletion\";i:5;s:18:\"stat_depletionItem\";i:6;s:22:\"stat_dataTablesRespond\";i:7;s:10:\"stat_login\";i:8;s:22:\"stat_dataTablesRespond\";i:9;s:8:\"stat_reg\";i:10;s:22:\"stat_dataTablesRespond\";i:11;s:10:\"stat_level\";i:12;s:22:\"stat_dataTablesRespond\";i:13;s:7:\"order_*\";i:14;s:10:\"activity_*\";i:15;s:6:\"mail_*\";i:16;s:8:\"notice_*\";i:17;s:7:\"flush_*\";i:18;s:7:\"cdkey_*\";i:19;s:8:\"expend_*\";i:20;s:6:\"item_*\";i:21;s:6:\"role_*\";i:22;s:7:\"guild_*\";i:23;s:12:\"rolecom_rank\";i:24;s:25:\"rolecom_dataTableItemRank\";i:25;s:25:\"rolecom_dataTableAjaxRank\";i:26;s:7:\"arena_*\";i:27;s:15:\"rolecom_daomeng\";i:28;s:24:\"rolecom_dataTableItemDao\";i:29;s:24:\"rolecom_dataTableAjaxDao\";i:30;s:12:\"rolecom_miji\";i:31;s:25:\"rolecom_dataTableItemMiji\";i:32;s:25:\"rolecom_dataTableAjaxMiji\";i:33;s:9:\"channel_*\";i:34;s:8:\"server_*\";i:35;s:15:\"stat_integrated\";i:36;s:22:\"stat_dataTablesRespond\";i:37;s:15:\"stat_onlineTime\";i:38;s:22:\"stat_dataTablesRespond\";i:39;s:9:\"stat_keep\";i:40;s:22:\"stat_dataTablesRespond\";i:41;s:18:\"user_alterPassword\";i:42;s:11:\"user_submit\";}', null, null, 'a:0:{}', '1450232151');

-- ----------------------------
-- Procedure structure for four_recently_login_server
-- ----------------------------
DROP PROCEDURE IF EXISTS `four_recently_login_server`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `four_recently_login_server`(IN `iaccount` varchar(50))
    COMMENT '获取用户最近登录过的4个服务器'
BEGIN



	



  SELECT if(s.status=5,2,s.status) as `status`,if(s.status = 5,1,0) as `isNew`,sl.* FROM bg_server AS s INNER JOIN bg_server_login AS sl ON sl.serverid=s.server_id WHERE s.status != 0 AND sl.account=iaccount ORDER BY sl.logdate DESC;



END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for getServerList
-- ----------------------------
DROP PROCEDURE IF EXISTS `getServerList`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `getServerList`()
    COMMENT '返回服务器列表给客户端'
BEGIN



	



  SELECT server_id,server_ip,server_port,`name`,if(`status`=5,4,`status`)  as `status`,if(`status` = 5,1,0)  as `isNew` FROM bg_server WHERE `status` != 0 ORDER BY server_id ASC;



END
;;
DELIMITER ;
