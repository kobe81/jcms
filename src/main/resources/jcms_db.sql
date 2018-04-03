/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : jcms_db

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 03/04/2018 12:56:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for hotel
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hotel_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '酒店名称',
  `hotel_level` int(11) NULL DEFAULT NULL COMMENT '酒店级别',
  `hotel_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '酒店类型',
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `lowest_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '最低价格',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '酒店详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO `hotel` VALUES (1, '测试', 5, '民宿', '测试111222', '测试', 250.00);
INSERT INTO `hotel` VALUES (2, '测试酒店', 3, '连锁', '很好的地址', '很好的地址', 200.00);
INSERT INTO `hotel` VALUES (3, '测试酒店', 4, '连锁', '很好的地址', '很好的地址', 200.00);

-- ----------------------------
-- Table structure for rooms
-- ----------------------------
DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hotel_id` bigint(11) NOT NULL COMMENT '酒店ID',
  `room_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '房间类型',
  `room_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '房间价格',
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `beds` int(11) NULL DEFAULT NULL COMMENT '床位',
  `numbers` int(11) NULL DEFAULT NULL COMMENT '房间数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '酒店房间描述' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rooms
-- ----------------------------
INSERT INTO `rooms` VALUES (1, 1, '特价标准大床间', 500.00, '房间18-20㎡ | 大床1.5米 | 楼层：1层 | 包含无线、宽带', 2, 0);
INSERT INTO `rooms` VALUES (2, 1, '特价标准小床间', 300.00, '房间18-20㎡ | 大床1.5米 | 楼层：1层 | 包含无线、宽带', 3, 0);

-- ----------------------------
-- Table structure for scenic_discuss
-- ----------------------------
DROP TABLE IF EXISTS `scenic_discuss`;
CREATE TABLE `scenic_discuss`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) NULL DEFAULT NULL COMMENT '用户ID',
  `scenice_id` bigint(11) NULL DEFAULT NULL COMMENT '景点ID',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `creat_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户景点留言表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scenic_discuss
-- ----------------------------
INSERT INTO `scenic_discuss` VALUES (54, 1240, 1, '江岭，位于婺源县东北部，距县城45公里，总面积38平方公里，每当春暖花开时，置身于江岭万亩梯田中，黄灿灿的油菜花与远山、近水、粉墙、黛瓦相映成趣，构成一幅天人合一的画卷，在这里您可以尽情的释放，让心灵自由飞翔。', '2018-03-25 16:49:28');

-- ----------------------------
-- Table structure for scenic_info
-- ----------------------------
DROP TABLE IF EXISTS `scenic_info`;
CREATE TABLE `scenic_info`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `CONTENT` varchar(20000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `AUTHOR` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `SOURCE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源',
  `CREAT_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `TYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型(10：纯文字，20：图文）',
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '景点详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scenic_info
-- ----------------------------
INSERT INTO `scenic_info` VALUES (1, '中国四大花海之一 ——江岭', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    江岭地处婺源县东北，是婺源田园风光的代表。从江岭开始，公路始终在山间盘旋，凭窗窥看，只见层层梯田，线条曲曲弯弯；山谷盆地中的小河边，村庄房舍点点，四周青山绵绵，构成了一幅美妙的农村风光画卷。\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">\r\n    <img src=\"http://www.wuyuan.cc/upfiles/2015-02-11/9c077b15489844619e0b2156cef03df50.jpg\" height=\"408\"/>\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    婺源的春色非常“养眼”，而江岭则是春天婺源的绝美之地，是婺源旅游最值得去的地方。每当油菜花盛开季节，这里总吸引了来自全国各地的大批游客、无数摄影师。<br/>\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">\r\n    <img src=\"http://www.wuyuan.cc/upfiles/2015-02-11/084ba113c12a4fa3be0270395ee872890.jpg\" height=\"412\"/>\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    江岭油菜花在每年的三月上旬到四月初是花开最美的时间，壮观、震撼、较强的视觉冲击力，不知美了多少人的眼睛，暖了多少人的心，给了我们多少动力，燃起了我们对美好的追求和希望。<br/>\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">\r\n    <img src=\"http://www.wuyuan.cc/upfiles/2015-02-11/a61899b426914b9a82e14e5e39a906cd0.jpg\" height=\"422\"/>\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    江岭金灿灿的油菜花，层层叠叠，蜿蜒流长，肆意的绽放，犹如花浪涌来，淹没了田野，淹没了村庄，我置身于其中，随着金色的花海潮起潮落，油菜花香渗透了我们每一个毛孔，沁人心脾。她热情似火，激情奔放，我陶醉了，陶醉于自然，陶醉于这片似油画般的田园风光。<br/>\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">\r\n    <img src=\"http://www.wuyuan.cc/upfiles/2015-02-11/26a409185aba45e49a9724d13d2d06790.jpg\" height=\"349\"/>\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    江岭在婺源视为最好的赏花地，也被评为油菜花盛开最美的地方。你站在高处，千亩油菜花海一览无遗，漫山遍野的油菜花呈梯田状，从山顶铺散下来，如黄河之水汹涌，如黄绸缎般的在田间飘逸荡漾，感受到了天人合一的圣境，让我心飞翔，尽情释放，仿佛来到了人间天堂。\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>', '婺源旅游 ', '婺源旅游 ', '2018-03-13 19:51:28', '10', '江岭，位于婺源县东北部，距县城45公里，总面积38平方公里，每当春暖花开时，置身于江岭万亩梯田中，黄灿灿的油菜花与远山、近水、粉墙、黛瓦相映成趣，构成一幅天人合一的画卷，在这里您可以尽情的释放，让心灵自由飞翔。');
INSERT INTO `scenic_info` VALUES (2, '小桥流水人家–李坑', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">\r\n    <img alt=\"\" src=\"http://www.wuyuan.cc/upfiles/2015-01-21/f6e14afb5a26470faaa185ccaae651a90.jpg\"/>\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">\r\n    <img alt=\"\" src=\"http://www.wuyuan.cc/upfiles/2015-01-21/e7a76f6d46a74ffc8384eab892e9db7c1.jpg\"/>\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    <strong style=\"padding: 0px; margin: 0px;\"><strong><span style=\"margin: 0px; padding: 0px; border: none; color: rgb(255, 0, 0);\">小桥流水人家 李坑</span>：国家AAAA级景区,</strong>2011年<strong style=\"padding: 0px; margin: 0px;\">由</strong>香港城市及中国城市竞争力研究会联合评议“中国十大美丽乡镇排行榜”，婺源首居一指，而李坑是婺源古镇的典型代表。</strong>\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">\r\n    李坑是一个以李姓聚居为主的古村落，距婺源县城12公里。李坑自古文风鼎盛、人才辈出。自宋至清，仕官富贾达百人，村里的文人留下传世著作达29部，南宋年间出了一位武状元，名叫李知诚。村落群山环抱，山清水秀，风光旖旎。村中明清古建遍布、民居宅院沿溪而建，依山而立，粉墙黛瓦、参差错落；村内街巷溪水贯通、九曲十弯；青石板道纵横交错，石、木、砖各种溪桥数十座沟通两岸，更有两涧清流、柳碣飞琼、双桥叠锁、焦泉浸月、道院钟鸣、仙桥毓秀等景点在其中，构筑了一幅小桥、流水、人家的美丽画卷，是婺源精品线上的一颗灿烂的明珠。<br/><img alt=\"\" src=\"http://www.wuyuan.cc/upfiles/2015-01-21/ae0d7534cd4b4fd4a86bcb009d70f5f62.jpg\"/>\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">\r\n    <strong>李坑村文化</strong>\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">\r\n    <strong style=\"padding: 0px; margin: 0px;\">傩舞</strong><span class=\"headline-content\" style=\"margin: 0px; padding: 0px; border: none;\">是在李坑村十分盛行的一种舞蹈，它原来是我国古代长江流域流行的一种舞蹈，舞者戴着各种质朴而夸张的面具，带有鲜明的巫术色彩，最早是一种祈福和祷告的仪式，后来逐渐发展成为民间舞蹈。傩舞的面具有四五十种，一般为木雕，脸谱生动，忠奸贤愚、喜怒哀乐都是表现的主题。傩舞的传统节目有《开天辟地》、《刘海戏金蟾》、《双猴捉虱》等数十个，舞蹈动作粗犷而朴实</span>\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">\r\n    <strong>中秋舞龙</strong>每年的中秋节前后几天.勤劳李坑人希望来年风调雨顺 五谷丰登 安居乐业 平平安安的好兆头 村里都要举行中秋舞龙的活动。 中秋舞龙从村头开始，带头的是一名德高望重的老人挥着一个圆圆的龙珠 后面由十几名汉子举着纸扎龙灯跟着龙珠舞动，时而高 时而低 时而盘旋 纸龙灯的里面有几十支红色蜡烛照亮着 从远处看去就像传说中的一条巨龙 一位老人带着几个后生在后面敲锣打鼓。每到一家，主人就会燃放，烟花，据说你家的鞭炮 烟花能放多久，纸龙灯就在你家门口舞多久 就意昧着你家来年平安 幸福。整个舞龙过程要走遍全村的每一户人家，一般会持续到凌晨的2点到3点结束。<br/><img alt=\"\" src=\"http://www.wuyuan.cc/upfiles/2015-01-21/35735cf8a6934fa594a98dd7937cc3093.jpg\"/><br/><br/><img alt=\"\" src=\"http://www.wuyuan.cc/upfiles/2015-01-21/5a3b03022b8742379812ed09cf9ff16e4.jpg\"/><br/><br/><img alt=\"\" src=\"http://www.wuyuan.cc/upfiles/2015-01-21/6ac5dcd94d8c4b6baaecab7fbf4ecdaa5.jpg\"/>\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>', '婺源旅游 ', '婺源旅游 ', '2018-03-13 20:49:24', '10', NULL);
INSERT INTO `scenic_info` VALUES (3, '世外桃源 - 严田', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: 0px none; word-break: break-all; word-wrap: break-word; line-height: 22px; white-space: normal; float: left; color: rgb(94, 94, 94); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, &quot;Microsoft JhengHei&quot;, 宋体; font-size: 12px; text-align: center; background-color: rgb(249, 249, 249);\">\r\n    <strong><img alt=\"\" src=\"http://www.wuyuan.cc/upfiles/2015-01-21/3f1647189ce24deab16f89cff41295850.jpg\"/><br/><br/>&nbsp; &nbsp; 严田</strong>古樟民俗园位于江西省上饶市婺源县北线，地处著名景点鸳鸯湖和彩虹桥之间，是极具山水田园特色的精品旅游景点。整个景区与周边自然田园风光浑然一体。古樟、古桥、茶亭、鱼塘、人家、小桥流水、民间民俗文化观赏等。交相辉映景区内文化品位厚重、田园风光秀美，既可旅游又可休闲度假。\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: 0px none; word-break: break-all; word-wrap: break-word; line-height: 22px; white-space: normal; float: left; color: rgb(94, 94, 94); font-family: &quot;Microsoft YaHei&quot;, 微软雅黑, &quot;Microsoft JhengHei&quot;, 宋体; font-size: 12px; text-align: center; background-color: rgb(249, 249, 249);\">\r\n    　　严田古樟民俗园是江西省上饶市婺源县北线极具山水田园特色的精品旅游景点之一，地处著名景点鸳鸯湖和彩虹桥之间，交通十分便捷。景区内生长着一棵举世罕见，被村民拜为树神的千古樟王、该樟树历经1500多年沧桑、树胸围近14米、树冠幅达3亩，堪称天下第一樟。景区是婺源县保存最为完好的水口（村口）文化遗址。整个景区与周边自然田园风光浑然一体。古樟、古桥、茶亭、鱼塘、人家、小桥流水、民间民俗文化观赏等。交相辉映景区内文化品位厚重、田园风光秀美，既可旅游又可休闲度假。所到旅客有如返朴归真、回归自然的真实感受。 　<br/>　<img alt=\"\" src=\"http://www.wuyuan.cc/upfiles/2015-01-21/5684c918e306493895eb7022c66cb1d71.jpg\"/><br/>&nbsp; &nbsp; 在鸳鸯湖和彩虹桥之间，宽阔的柏油公路蜿蜒伸展，沿途阡陌相联，绿山相接，村烟袅袅，鸡犬相闻。车过甲路乡政府，转眼就在一棵浓荫覆盖的硕大樟树下，展现出一派绮丽的田园风光，这就是严田古樟民俗园。据《宗谱》载：严田于北宋乾德甲子年（964）建村。建村者李德鸾取“占得从田之鉴，从严治家”之意取村名严田。严田是李知已的故里，李是南宋贞元甲戌年（1154）进士，官至大理寺丞，摄理右侍郎。 　　<br/>&nbsp; &nbsp; 严田古樟民俗园占地40亩，远望田园村舍，山环水绕，老树古藤，亭台楼阁，天光云影，近看大樟树、小溪流、古石桥、老油榨、豆腐坊、深古井、长寿泉、水车礁、园钓池、方石桌、盆景园、杂货铺、品茗亭、鱼塘人家屋、甲路纸伞坊、民俗博物馆……,曲径通幽处,移步即景,交相辉映,突显出浓厚的乡村气息。<br/><br/><img alt=\"\" src=\"http://www.wuyuan.cc/upfiles/2015-01-21/78b5261e42274402a932c342fb21ac442.jpg\"/><br/><br/><img alt=\"\" src=\"http://www.wuyuan.cc/upfiles/2015-01-21/2c2784245cca4ea6ab63491ec1e3e3f73.jpg\"/><br/><br/><img alt=\"\" src=\"http://www.wuyuan.cc/upfiles/2015-01-21/b93434cd87f2415c8ba66b68581ab3da4.jpg\"/>\r\n</p>\r\n<p>\r\n    <br/>\r\n</p>', '婺源旅游 ', '婺源旅游 ', '2018-03-12 20:51:47', '10', NULL);
INSERT INTO `scenic_info` VALUES (4, '宋代廊桥 – 彩虹桥', '<p>\r\n    <br/>\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">\r\n    <img alt=\"\" src=\"http://www.wuyuan.cc/upfiles/2015-01-21/2584b1327d7444f192ef3e6672e274d30.jpg\"/><br/><br/><br/>中国最美乡村婺源——彩虹桥就是这样一处令人向往的旅游胜地。\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    <strong>彩虹桥是中国廊桥史上的绝版</strong>\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    彩虹桥是中国历史最悠久的廊桥，建于南宋（1137年）规模最大——全长一百四十米，保存最完整，设计最科学的一座廊桥，被众多媒体誉为中国最美的廊桥。彩虹桥是中国最美乡村——婺源的标志性建筑\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    婺源上千年隶属古徽州，她的文化、建筑、民俗、菜系等都属徽州范畴。从古村落看，西递、宏村已成为世界级文化遗产，成为皖南古村落的代表。婺源的任何村落，山水、田园难以代表自己的特点，而彩虹桥在整个徽州，乃至中国仅此一桥，她是徽州文化不可缺少的组成部分，成为婺源的象征，是婺源标志性的建筑。木质部分设计体现哲理思想——越简单实用，越容易传承延续。\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    彩虹桥的桥面部分是木质，不可能永久保存，它面临自然腐化。先辈们考虑到将来的维修，所以整座桥没有雕梁画栋，做工都显得粗糙、不清细。用随时可请的普通木工来建造，只要做到厚重、结实、耐用就行。因此，八百多年来。历代都有维修，充分体现了越简单实用的工艺，越容易传承与延续的哲学思想。彩虹桥的木质部分是古人围绕后人易于维修而设计的。\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">\r\n    <img alt=\"\" src=\"http://www.wuyuan.cc/upfiles/2015-01-21/c057f0168bd84e55af435727e3845b651.jpg\"/><br/><br/>\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    <strong>彩虹桥是婺源民俗文化集中体现</strong>\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    彩虹桥从和尚化缘到建成，历时近十年，在完工时，雨过天睛，西边挂了道亮丽的彩虹，当地人认为这是绝好的兆头，因此命名为彩虹桥。她的寓意：凡过往的行人、商旅踏上此桥，如同登上吉祥、美丽的彩虹，终身有个好运气。寄托了古人的祝福。彩虹桥的西岸是通往饶州府的古驿道，桥十米远处有条四米宽的小河沟，古人做了一座石拱桥，取名登云桥，即登彩云的桥。登云桥与彩虹桥名的组合，体现了婺源桥文化精髓：祈盼吉祥、发达。因此，在古代，仕子们回乡赴任，一定要到这两座桥上走走，踏青天，上彩虹，就能平步青云；学子们，进京赶考，一定要来走走，踏青云，上彩虹，高举榜首，踏上仕途，光宗耀祖；徽商们，临行前，一定要走走，踏青云，上彩虹，希望生意红火，衣锦还乡。在古代，彩虹桥是周边地区的人们讨口彩的地方。虹桥防洪体系的设计是古代婺源人智慧的结晶\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    彩虹桥是建在是宽的河面上——最宽的河面，流速最缓，对桥冲击力就小；桥墩设计成半船形，可以分解洪水的冲击力；桥墩之间的距离，是根据河床的流速设定的，流速最大的地方，墩距最大，有利于泄洪因桥下游三十米的地方，建一石坝，抬高水位，缓解洪水的流速，保护古桥。\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">\r\n    <br/><img alt=\"\" src=\"http://www.wuyuan.cc/upfiles/2015-01-21/28870062f07d4398a5e387108adfb1e02.jpg\"/><br/><strong>彩虹桥</strong>的美是婺源人运用山水文化的集中表现\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\">\r\n    婺源古代人，对任何一种建筑都讲究山水之间的和谐因设计时，做到相互融合，人、建筑、山水（环境）天人合一。彩虹桥建在清华村与毕家墩最佳河面上，两村依山傍水，景色如画，桥上游是笔架山，桥下游筑一道石坝，形成美丽的小西湖——留住水，留住财。廊桥与村落、青山、碧水、驿道构成了中国最美的水墨山水画。尤其是晨雾、细雨、月色下更显诗情画意，成为古人采风的地方。\r\n</p>\r\n<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0.62em 0px; border: none; word-break: break-all; word-wrap: break-word; line-height: 24px; text-indent: 2em; color: rgb(51, 51, 51); font-family: Tahoma, &quot;Microsoft YaHei&quot;, Geneva, sans-serif; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); text-align: center;\">\r\n    <br/><img alt=\"\" src=\"http://www.wuyuan.cc/upfiles/2015-01-21/4c9e3a35ddce4e33a2810c622d46e3f53.jpg\"/>\r\n</p>', '婺源旅游 ', '婺源旅游 ', '2018-03-13 20:57:53', '10', NULL);

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PIC_URL` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址',
  `JOIN_ID` bigint(255) NOT NULL COMMENT '关联ID',
  `CREAT_TIME` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `TYPE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理类型',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统文件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (1, '/resources/showtemp/showImg/jl.jpg', 1, '2018-03-13 20:31:47', 'scenic');
INSERT INTO `sys_file` VALUES (2, '/resources/showtemp/showImg/lk.jpg', 2, '2018-03-13 20:53:54', 'scenic');
INSERT INTO `sys_file` VALUES (3, '/resources/showtemp/showImg/chq.jpg', 4, NULL, 'scenic');
INSERT INTO `sys_file` VALUES (4, '/resources/showtemp/showImg/yt.jpg', 3, NULL, 'scenic');
INSERT INTO `sys_file` VALUES (5, '/resources/showtemp/hotel/jd1.jpg', 1, NULL, 'hotel');
INSERT INTO `sys_file` VALUES (24, '/resources/upload/1521996567672.jpeg', 54, '2018-03-25 16:49:28', 'discuss');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `pid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父ID',
  `permission_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `menu_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单地址',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `order` int(11) NULL DEFAULT NULL COMMENT '顺序',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_permission_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission_relation`;
CREATE TABLE `sys_role_permission_relation`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色主键',
  `permission_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限ID',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色权限关联' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1249 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1240, '123456', 'ea48576f30be1669971699c09ad05c94', '1234567', NULL, '1', NULL);
INSERT INTO `sys_user` VALUES (1248, 'ht', 'abce1560df3fd88dfd3140fb10773780', '18270804681', '871877908@qq.com', '1', 'noValue');

-- ----------------------------
-- Table structure for sys_user_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role_relation`;
CREATE TABLE `sys_user_role_relation`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(32) NOT NULL COMMENT '用户ID',
  `role_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色ID',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_room
-- ----------------------------
DROP TABLE IF EXISTS `user_room`;
CREATE TABLE `user_room`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) NULL DEFAULT NULL COMMENT '用户ID',
  `hotel_id` bigint(11) NULL DEFAULT NULL COMMENT '酒店ID',
  `room_id` bigint(20) NULL DEFAULT NULL COMMENT '房间ID',
  `numbers` int(11) NULL DEFAULT NULL COMMENT '数量',
  `stay_in_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '入住时间',
  `days` int(10) NULL DEFAULT NULL COMMENT '入住天数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户酒店订房表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_room
-- ----------------------------
INSERT INTO `user_room` VALUES (1, 1240, 1, 1, 123456, '2018-03-07 16:00:00', 123456);
INSERT INTO `user_room` VALUES (2, 1240, 1, 1, 1, '2018-03-07 16:00:00', 2);
INSERT INTO `user_room` VALUES (3, 1240, 1, 2, 5, '2018-03-15 16:00:00', 3);
INSERT INTO `user_room` VALUES (4, 1240, 1, 1, 4, '2018-03-07 16:00:00', 1);

SET FOREIGN_KEY_CHECKS = 1;
