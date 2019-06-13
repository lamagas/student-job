/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 80012
Source Host           : localhost:3306
Source Database       : ptj

Target Server Type    : MYSQL
Target Server Version : 80012
File Encoding         : 65001

Date: 2019-04-28 10:12:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_studentid` int(11) DEFAULT NULL,
  `c_inforid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES ('1', '106', '6');
INSERT INTO `collect` VALUES ('2', '122', '2');
INSERT INTO `collect` VALUES ('3', '122', '7');
INSERT INTO `collect` VALUES ('4', '122', '19');
INSERT INTO `collect` VALUES ('5', '122', '18');
INSERT INTO `collect` VALUES ('6', '122', '5');
INSERT INTO `collect` VALUES ('7', '122', '6');
INSERT INTO `collect` VALUES ('8', '172', '1');
INSERT INTO `collect` VALUES ('9', '172', '18');
INSERT INTO `collect` VALUES ('10', '172', '4');
INSERT INTO `collect` VALUES ('11', '174', '5');
INSERT INTO `collect` VALUES ('12', '120', '21');
INSERT INTO `collect` VALUES ('13', '120', '18');
INSERT INTO `collect` VALUES ('14', '116', '21');
INSERT INTO `collect` VALUES ('15', '116', '7');
INSERT INTO `collect` VALUES ('16', '116', '23');
INSERT INTO `collect` VALUES ('17', '175', '30');
INSERT INTO `collect` VALUES ('18', '176', '7');
INSERT INTO `collect` VALUES ('19', '120', '32');
INSERT INTO `collect` VALUES ('20', '169', '23');

-- ----------------------------
-- Table structure for information
-- ----------------------------
DROP TABLE IF EXISTS `information`;
CREATE TABLE `information` (
  `inforid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `message` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `studentid` int(11) DEFAULT NULL,
  `people` int(3) DEFAULT NULL,
  `nowpeople` int(3) DEFAULT NULL,
  `draft` int(1) DEFAULT NULL,
  PRIMARY KEY (`inforid`) USING BTREE,
  KEY `stuid` (`studentid`) USING BTREE,
  CONSTRAINT `stuid` FOREIGN KEY (`studentid`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of information
-- ----------------------------
INSERT INTO `information` VALUES ('1', 'testasfgf算法的这当然更好are', '            <p style=\"text-align: center;\">tezhdfhgf飞机场通</p><p style=\"text-align: left;\">过谈话导入drhydtghtfrh65465gd我想去看看，你可曾知道多少人即使行将就木，依然没有出过别再说，地铁太挤工作不易，你可曾见过火车上肩扛手提，许多我们叫爸爸的人拖着比自己都高的行李奔赴生计<b>！别再说，压力太大生活艰辛，你可曾知道有人已经年逾古稀依然起早贪黑，只为解决一家温饱别再说，灯红酒绿索然无味，你可曾想过穿梭城市的民工也许连一瓶矿泉水都狠不下心来买别再</b>说，写不完的作业背不完的公式让你身心疲惫，你可曾听过遥远的山村有赤脚的孩子趴在窗前偷听老师讲课！<img src=\"http://localhost:8080/static/layui/images/face/19.gif\" alt=\"[左哼哼]\"></p>\n        ', '2018-10-12', '102', '10', '6', '2');
INSERT INTO `information` VALUES ('2', '香烟普查员', '<p>来公司培训完（培训半小时左右）带平板回去访问香烟消费者</p><p>一天至少做10份问卷，问卷时长15分钟</p><p>项目结束按成功问卷20元一份计算（月结）</p><p>报名备注：香烟普查</p><p>联系人：李生147000000</p><p>地址：中山石歧区中兴大街4号宏光商业大厦3楼</p>', '2018-10-27', '102', '1', '1', '1');
INSERT INTO `information` VALUES ('3', '而和大唐官府中sgh', 'hfdndfb三个订单发货', '2018-9-7', '103', '20', '1', '0');
INSERT INTO `information` VALUES ('4', '个好友可见', '吃个饭就更好', '2018-9-11', '104', '18', '4', '0');
INSERT INTO `information` VALUES ('5', 'Easyjob-(6)-网上问卷', '<p><b>网上填卷</b>，先报名后确认时间(收货地址只要城市)<img src=\"http://localhost:8080/static/layui/images/face/63.gif\" alt=\"[给力]\"></p><p>招募18岁及以上，女性，需满足以下所有【条件】</p><p>一、从18年10月1日到现在，所有平台网上购物12次以上，</p><p>二、18年10月-12月，购买过1次 “个护/美妆/家清用品”</p><p>三、19年1月-3月，购买过1次 “个护/美妆/家清用品”</p><p>四、18年10月-19年3月，淘宝或京东上这个时间内要有过至少1次购物记录。</p><p>【工作内容】</p><p>1、 淘宝和京东在网上搜集，2-3分钟左右即可完成</p><p>2、 其他平台有工作人员协助截图。（截图能看得到订单时间）</p><p>【礼金】</p><p>只上传淘宝或京东的礼金30元，多一个平台多5元,每次礼金最多50元。</p><p>地区：珠海</p>', '2018-11-13', '102', '4', '4', '1');
INSERT INTO `information` VALUES ('7', '会突然发现和分析', '基础土方符合甲方提供机会佛教徒回复他新房天津涛涛涛涛涛涛拖拖沓沓通过嘎嘎嘎嘎嘎', '2018-10-30', '106', '8', '1', '0');
INSERT INTO `information` VALUES ('18', 'Easyjob（8）--试鞋兼职', '<p>【时间】：自由<img src=\"http://localhost:8080/static/layui/images/face/25.gif\" alt=\"[抱抱]\"></p><p>【年龄】：不很</p><p>【要求】：家有小孩 ，小孩必湎要穿30码鞋以上</p><p>【工作内容】带小孩到指门店定体验服务评份</p><p>【工资】：80-100元/店</p><p>【联系人】：刘小姐，微信/13500000（咨询报名加此号！加此号！加此号）</p><p>【地址】：中山市石岐区中兴大街4号宏光商业大厦3楼</p><p>报名麻烦 备注 莲妈试鞋</p>', '2018-12-13  21:08', '102', '2', '2', '1');
INSERT INTO `information` VALUES ('19', '的房价能否给斤斤计较', '                                                的机会你的想法这地方九年法国境内&nbsp; &nbsp; &nbsp; 的发挥的符号标点符号播放功能推荐你恢复骨结核你发给他们你方提供谢谢谢谢谢谢谢谢谢谢你法国呱呱呱呱呱呱呱呱呱那些覆盖面呢法国境内充分沟<img src=\"http://localhost:8080/static/layui/images/face/15.gif\" alt=\"[生病]\">通技能对方核能发电计划能否给石油进口。刚九年法国境内111111111111\n        \n        \n        \n        ', '2018-12-13  22:16', '110', '1', '0', '1');
INSERT INTO `information` VALUES ('21', '错过你经常不能', '<p style=\"text-align: center;\">发布会的发布活动&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p><p style=\"text-align: center;\">东方红东方和规范化办公费还能法国恢复供货非常难妨功害能发过火东方红你发个北化股份成年后官方海报风格和规范化给你还差个发你很过分规范哦方便你吃饭</p>', '2019-01-21  18:30', '110', '20', '0', '0');
INSERT INTO `information` VALUES ('22', '从地方很难的发挥的', '<p style=\"text-align: center;\">东方红新东方喝奶粉那地方</p><p style=\"text-align: center;\"><b>&nbsp; &nbsp; &nbsp; 党纪</b>国法干活发个你觉得非常的符合地方呢分享你的发挥你的烦恼幸福和年度发布会<img src=\"http://localhost:8080/static/layui/images/face/15.gif\" alt=\"[生病]\"></p><p style=\"text-align: center;\">东方CJ你发的红包你吃饭呢发现好地方含苞待放更好地融合东方红等人复活点如何很多人获得任何</p>', '2019-01-23  17:07', '102', '6', '0', '2');
INSERT INTO `information` VALUES ('23', '汽车问卷兼职', '<p>邀请2018年11月后购买的汽车车主，20-55岁，做一个关于汽车满意度访问。</p><p>礼金：100元</p><p>报名备注：车主</p><p>联系人微信/手机：李生1470000000</p>', '2019-01-23  17:10', '102', '10', '0', '0');
INSERT INTO `information` VALUES ('30', '衣服可以规范', '            太费劲复印件妨功害能积分兑换怒发冲冠非常难的非常难', '2019-01-23  23:38', '110', '8', '2', '0');
INSERT INTO `information` VALUES ('31', '太多分年级的发布会吃过饭呢', '<p style=\"text-align: center;\">房间号你</p><p>的头发恢复供货那几个干嘛哪几个方面那个房间吗<img src=\"http://localhost:8080/static/layui/images/face/2.gif\" alt=\"[哈哈]\"></p>', '2019-04-21  15:48', '110', '5', '0', '0');
INSERT INTO `information` VALUES ('32', 'Easy job（1）--pizza试食招募', '<p style=\"text-align: center;\"><b>受知名牌委托现招募试食被访者数名</b></p><p>【进间】5月6-10日，5月13-16日（10:00-18:00）</p><p>【要求】<img src=\"http://localhost:8080/static/layui/images/face/0.gif\" alt=\"[微笑]\"></p><p>1：20-40岁男女 2：要求过去️个月没有参加过任何市场调查访问</p><p>3：提前了名，经确认通知过来</p><p>【工作内容】试食pizza后回答问卷，评份</p><p>【性别】不限，</p><p>【待遇】免费品偿pizza。现金30元即结</p><p>【报名备注】pizza莲</p><p>【联系人】：刘小姐，微信/1300000000（咨询报名加此号！加此号！加此号）</p><p>【地址】：中山市石岐区中兴大街4号</p><p><br></p><p>Easy job（2）pizza 工作人员</p><p>【岗位1】：访问员 10名，在室内负责询问并记录答案</p><p>【岗位2】：产品员 1名，要求有健康证或可以去办健康证，负把产品给试食人员。</p><p>【待遇】85元/天</p><p>【工作时间】：5月6-10日，5月13-16日（9:30-18:00）</p><p>【工作地点】石歧大信新都会</p><p>【联系人】：刘小姐</p><p>【联系电话】：1300000000</p><p>报名备注：工作</p>', '2019-04-22  21:08', '102', '7', '1', '0');
INSERT INTO `information` VALUES ('33', '金湾红旗拍照访问兼职', '<p><b>Easy job (0)-香烟普查员</b></p><p>来公司培训完（培训半小时左右）带平板回去访问香烟消费者</p><p>一天至少做10份问卷，问卷时长15分钟</p><p>项目结束按成功问卷20元一份计算（月结）</p><p>报名备注：香烟普查</p><p>Easy job (1)-汽车问卷兼职</p><p>邀请2018年11月后购买的汽车车主，20-55岁，做一个关于汽车满意度访问。</p><p>礼金：100元</p><p>报名备注：车主</p><p><br></p><p><b>Easy job (2）考驾照问卷谳查</b></p><p>男女都可以，年龄要求20-55岁，有身份证+驾驶证，先电话甄别+后约时间做访问，</p><p>礼金：50元</p><p>报名备注：考证</p><p><br></p><p><b>Easy job (3）汽计车品牌普查员</b></p><p>找到合格汽车进行拍照，发给我确认，才能到本公司参加一个30分钟左右访问</p><p>做完有40元礼金答谢（既结）</p><p>报名备注：兼查员</p><p><br></p><p>报名备注：JD</p>', '2019-04-22  21:13', '102', '7', '1', '0');
INSERT INTO `information` VALUES ('34', '汽计车品牌拍照级统计兼职', '<p>找到合格汽车进行拍照，发给我确认，才能到本公司参加一个30分钟左右访问</p><p>做完有<b>40元礼金</b>答谢（既结）<img src=\"http://localhost:8080/static/layui/images/face/25.gif\" alt=\"[抱抱]\"></p><p>报名备注：拍照</p><p>联系人微信/手机：李生140000000</p><p>Easy job-(4)中山汽车问卷</p><p>认真负责，有空闲时间的，一星期内最少做10份。</p><p>对汽车有一定了解，可以过来公司培训完，再带回去做。</p><p>找到符合汽车拍照+找人做访问，</p><p>薪酬：60元一份月结（按成功问卷）</p><p>报名备注：JD</p><p>联系人：李生147000000</p><p>地址：中山石歧区中兴大街4号宏光商业大厦</p>', '2019-04-22  21:26', '102', '7', '0', '0');
INSERT INTO `information` VALUES ('35', '集体活动更深入的广东人', '<b>收到广东</b>人个人头好痛是个人工<img src=\"http://localhost:8080/static/layui/images/face/17.gif\" alt=\"[白眼]\">', '2019-04-27  09:05', '102', '10', '0', '0');
INSERT INTO `information` VALUES ('36', '各回各家模拟', '覆盖件那份感动你发的发的发布', '2019-04-28  09:10', '102', '5', '0', '0');

-- ----------------------------
-- Table structure for m_message
-- ----------------------------
DROP TABLE IF EXISTS `m_message`;
CREATE TABLE `m_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `m_studentid` int(11) DEFAULT NULL,
  `m_inforid` int(11) DEFAULT NULL,
  `m_time` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_message
-- ----------------------------
INSERT INTO `m_message` VALUES ('1', '的截图好评', '122', '2', '2018-12-13  22:16');
INSERT INTO `m_message` VALUES ('2', '都很难坚持法规和南方姑娘', '122', '2', '2018-12-13  22:16');
INSERT INTO `m_message` VALUES ('3', '对方就能发财姑获鸟', '122', '2', '2018-12-13  22:16');
INSERT INTO `m_message` VALUES ('4', '发现今年丰田国际', '120', '2', '2018-12-13  22:16');
INSERT INTO `m_message` VALUES ('5', '染头发后天发货呢', '116', '2', '2018-12-13  22:16');
INSERT INTO `m_message` VALUES ('7', '和土豆优酷关于还不够', '122', '2', '2019-01-17  00:21');
INSERT INTO `m_message` VALUES ('8', '以后局法规科技环保', '122', '5', '2019-01-17  00:52');
INSERT INTO `m_message` VALUES ('9', '土豆粉君股份', '122', '5', '2019-01-17  17:47');
INSERT INTO `m_message` VALUES ('10', '提到过自己哪些地方更好地发挥', '122', '18', '2019-01-17  21:49');
INSERT INTO `m_message` VALUES ('11', '动态规划拿不到公事公办', '122', '18', '2019-01-17  21:55');
INSERT INTO `m_message` VALUES ('12', '大家给你说的蝴蝶结', '122', '19', '2019-01-18  01:57');
INSERT INTO `m_message` VALUES ('13', '易见股份一会吧', '122', '1', '2019-01-18  18:10');
INSERT INTO `m_message` VALUES ('14', '通风机房含苞待放的房就会', '102', '1', '2019-01-19  14:32');
INSERT INTO `m_message` VALUES ('15', '地方很难的发挥', '110', '21', '2019-01-21  18:33');
INSERT INTO `m_message` VALUES ('16', '初始值', '110', '21', '2019-01-21  18:34');
INSERT INTO `m_message` VALUES ('17', '库好看我会251+64', '102', '30', '2019-02-19  12:32');
INSERT INTO `m_message` VALUES ('18', ' 是当官的', '110', '19', '2019-02-19  15:46');
INSERT INTO `m_message` VALUES ('19', '发的核心的发布会的非常棒', '116', '30', '2019-02-21  12:13');
INSERT INTO `m_message` VALUES ('20', '新东方宾馆的烦恼', '116', '23', '2019-02-21  12:13');
INSERT INTO `m_message` VALUES ('21', '的烦恼不断发现不能重复', '116', '21', '2019-02-21  12:14');
INSERT INTO `m_message` VALUES ('22', '回家考虑好剧看韩剧', '116', '7', '2019-02-21  12:14');
INSERT INTO `m_message` VALUES ('23', '房地产不能发大幅度', '120', '30', '2019-02-21  12:15');
INSERT INTO `m_message` VALUES ('24', '好疯狂的来来来', '102', '2', '2019-03-15  09:19');
INSERT INTO `m_message` VALUES ('25', 'xgsgbfhdhs', '176', '7', '2019-04-17  22:08');
INSERT INTO `m_message` VALUES ('26', '需满足以下所有【条件】', '102', '5', '2019-04-22  21:29');
INSERT INTO `m_message` VALUES ('27', '要求有健康证或可以去办健康证', '102', '32', '2019-04-22  21:29');
INSERT INTO `m_message` VALUES ('28', '60元一份月结（按成功问卷）', '102', '34', '2019-04-22  21:30');
INSERT INTO `m_message` VALUES ('29', '做完有40礼金答谢', '102', '33', '2019-04-22  21:30');
INSERT INTO `m_message` VALUES ('30', '礼金：100元', '102', '23', '2019-04-22  21:30');

-- ----------------------------
-- Table structure for m_reply
-- ----------------------------
DROP TABLE IF EXISTS `m_reply`;
CREATE TABLE `m_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `r_message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `messid` int(11) DEFAULT NULL,
  `r_studentid` int(11) DEFAULT NULL,
  `r_inforid` int(11) DEFAULT NULL,
  `r_time` varchar(25) DEFAULT NULL,
  `for_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of m_reply
-- ----------------------------
INSERT INTO `m_reply` VALUES ('1', '人的活动符合', '1', '102', '2', '2018-12-13  22:16', '伟哥');
INSERT INTO `m_reply` VALUES ('2', '当然很丰厚的', '1', '103', '2', '2018-12-13  22:16', '伟哥');
INSERT INTO `m_reply` VALUES ('3', '的荣华富贵', '3', '104', '2', '2018-12-13  22:16', '伟哥');
INSERT INTO `m_reply` VALUES ('13', '公司GV东方宾馆', '8', '122', '5', '2019-01-18  02:16', '伟哥');
INSERT INTO `m_reply` VALUES ('14', '都会被发现地方不大方便', '8', '122', '5', '2019-01-18  02:16', '伟哥');
INSERT INTO `m_reply` VALUES ('15', '非常保暖财富不断发出', '9', '122', '5', '2019-01-18  02:16', '伟哥');
INSERT INTO `m_reply` VALUES ('16', '发货的相关的方便更多分享', '8', '122', '5', '2019-01-18  02:16', '伟哥');
INSERT INTO `m_reply` VALUES ('17', '金盾股份她和你大范甘迪', '1', '122', '2', '2019-01-18  15:53', '伟哥');
INSERT INTO `m_reply` VALUES ('18', '香港房价很难对方感受到', '10', '122', '18', '2019-01-18  16:22', '伟哥');
INSERT INTO `m_reply` VALUES ('19', '对方喜你大V方法', '12', '110', '19', '2019-01-18  17:35', '伟哥');
INSERT INTO `m_reply` VALUES ('20', '认识的你刚才发你个非常', '4', '122', '2', '2019-01-18  17:45', 'maga');
INSERT INTO `m_reply` VALUES ('21', '存子南方部分地方', '13', '102', '1', '2019-01-19  14:33', '伟哥');
INSERT INTO `m_reply` VALUES ('22', '请问有中午饭吃吗？', '14', '172', '1', '2019-01-21  23:52', '萧炎亮');
INSERT INTO `m_reply` VALUES ('23', '分别受到不少', '15', '120', '21', '2019-02-19  16:10', '林俊杰');
INSERT INTO `m_reply` VALUES ('24', '办学的石膏板的风向标', '17', '116', '30', '2019-02-21  12:13', '萧炎亮');
INSERT INTO `m_reply` VALUES ('25', '多年后发表回复大半年', '15', '116', '21', '2019-02-21  12:14', 'maga');
INSERT INTO `m_reply` VALUES ('26', '动画的风格不大方', '16', '120', '21', '2019-02-21  12:15', '林俊杰');
INSERT INTO `m_reply` VALUES ('27', '地方环保的风险不大', '22', '120', '7', '2019-02-21  12:15', '请问');
INSERT INTO `m_reply` VALUES ('28', '请输入', '18', '110', '19', '2019-02-21  15:30', '林俊杰');
INSERT INTO `m_reply` VALUES ('29', '哦哦哦很关键', '5', '102', '2', '2019-03-15  09:20', '请问');
INSERT INTO `m_reply` VALUES ('30', 'xfhdgsd刚刚回归日', '22', '176', '7', '2019-04-17  22:08', 'maga');
INSERT INTO `m_reply` VALUES ('31', '负把产品给试食人员?', '27', '120', '32', '2019-04-22  22:53', '萧炎亮');

-- ----------------------------
-- Table structure for queryschool
-- ----------------------------
DROP TABLE IF EXISTS `queryschool`;
CREATE TABLE `queryschool` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `inforid` int(11) DEFAULT NULL,
  `schoolid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `school` (`schoolid`) USING BTREE,
  KEY `infor` (`inforid`) USING BTREE,
  CONSTRAINT `info` FOREIGN KEY (`inforid`) REFERENCES `information` (`inforid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `school` FOREIGN KEY (`schoolid`) REFERENCES `school` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of queryschool
-- ----------------------------
INSERT INTO `queryschool` VALUES ('1', '1', '2');
INSERT INTO `queryschool` VALUES ('2', '1', '3');
INSERT INTO `queryschool` VALUES ('3', '2', '4');
INSERT INTO `queryschool` VALUES ('4', '3', '2');
INSERT INTO `queryschool` VALUES ('5', '4', '3');
INSERT INTO `queryschool` VALUES ('6', '5', '4');
INSERT INTO `queryschool` VALUES ('7', '5', '2');
INSERT INTO `queryschool` VALUES ('9', '7', '4');
INSERT INTO `queryschool` VALUES ('11', '1', '4');
INSERT INTO `queryschool` VALUES ('12', '7', '2');
INSERT INTO `queryschool` VALUES ('15', '18', '2');
INSERT INTO `queryschool` VALUES ('16', '18', '3');
INSERT INTO `queryschool` VALUES ('17', '18', '4');
INSERT INTO `queryschool` VALUES ('18', '19', '2');
INSERT INTO `queryschool` VALUES ('19', '19', '4');
INSERT INTO `queryschool` VALUES ('20', '21', '2');
INSERT INTO `queryschool` VALUES ('21', '21', '4');
INSERT INTO `queryschool` VALUES ('22', '22', '2');
INSERT INTO `queryschool` VALUES ('23', '22', '3');
INSERT INTO `queryschool` VALUES ('24', '23', '3');
INSERT INTO `queryschool` VALUES ('25', '23', '4');
INSERT INTO `queryschool` VALUES ('32', '30', '2');
INSERT INTO `queryschool` VALUES ('33', '30', '4');
INSERT INTO `queryschool` VALUES ('34', '31', '2');
INSERT INTO `queryschool` VALUES ('35', '31', '3');
INSERT INTO `queryschool` VALUES ('36', '32', '2');
INSERT INTO `queryschool` VALUES ('37', '32', '3');
INSERT INTO `queryschool` VALUES ('38', '32', '4');
INSERT INTO `queryschool` VALUES ('39', '33', '3');
INSERT INTO `queryschool` VALUES ('40', '33', '4');
INSERT INTO `queryschool` VALUES ('41', '34', '2');
INSERT INTO `queryschool` VALUES ('42', '34', '3');
INSERT INTO `queryschool` VALUES ('43', '35', '3');
INSERT INTO `queryschool` VALUES ('44', '35', '4');
INSERT INTO `queryschool` VALUES ('45', '36', '2');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'issue');
INSERT INTO `role` VALUES ('2', 'student');
INSERT INTO `role` VALUES ('3', 'admin');

-- ----------------------------
-- Table structure for school
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `id` int(11) NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO `school` VALUES ('1', '无');
INSERT INTO `school` VALUES ('2', '城职院');
INSERT INTO `school` VALUES ('3', '艺术学院');
INSERT INTO `school` VALUES ('4', '科干院');

-- ----------------------------
-- Table structure for sign_up
-- ----------------------------
DROP TABLE IF EXISTS `sign_up`;
CREATE TABLE `sign_up` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inforid` int(11) DEFAULT NULL,
  `studentid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `stu` (`studentid`) USING BTREE,
  KEY `infoid` (`inforid`) USING BTREE,
  CONSTRAINT `infoid` FOREIGN KEY (`inforid`) REFERENCES `information` (`inforid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stu` FOREIGN KEY (`studentid`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT COMMENT='报名表，记录每条兼职信息报名的人';

-- ----------------------------
-- Records of sign_up
-- ----------------------------
INSERT INTO `sign_up` VALUES ('1', '1', '102');
INSERT INTO `sign_up` VALUES ('2', '1', '104');
INSERT INTO `sign_up` VALUES ('3', '1', '105');
INSERT INTO `sign_up` VALUES ('4', '2', '105');
INSERT INTO `sign_up` VALUES ('5', '4', '104');
INSERT INTO `sign_up` VALUES ('6', '4', '102');
INSERT INTO `sign_up` VALUES ('7', '4', '103');
INSERT INTO `sign_up` VALUES ('8', '4', '105');
INSERT INTO `sign_up` VALUES ('9', '5', '104');
INSERT INTO `sign_up` VALUES ('10', '5', '105');
INSERT INTO `sign_up` VALUES ('30', '5', '110');
INSERT INTO `sign_up` VALUES ('32', '1', '110');
INSERT INTO `sign_up` VALUES ('33', '18', '116');
INSERT INTO `sign_up` VALUES ('34', '19', '116');
INSERT INTO `sign_up` VALUES ('35', '1', '117');
INSERT INTO `sign_up` VALUES ('42', '1', '172');
INSERT INTO `sign_up` VALUES ('43', '18', '169');
INSERT INTO `sign_up` VALUES ('44', '19', '169');
INSERT INTO `sign_up` VALUES ('45', '18', '120');
INSERT INTO `sign_up` VALUES ('46', '1', '173');
INSERT INTO `sign_up` VALUES ('47', '5', '173');
INSERT INTO `sign_up` VALUES ('52', '5', '174');
INSERT INTO `sign_up` VALUES ('53', '3', '120');
INSERT INTO `sign_up` VALUES ('54', '30', '116');
INSERT INTO `sign_up` VALUES ('55', '30', '175');
INSERT INTO `sign_up` VALUES ('56', '7', '176');
INSERT INTO `sign_up` VALUES ('57', '32', '120');
INSERT INTO `sign_up` VALUES ('58', '33', '102');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lease` int(1) DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `salt` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sex` int(20) DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `school` int(11) DEFAULT NULL,
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `age` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `schoolid` (`school`) USING BTREE,
  CONSTRAINT `schoolid` FOREIGN KEY (`school`) REFERENCES `school` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('102', '1', '萧炎亮', 'beb9660c465edabd27411c9c18a8b7db', 'e7c7cc67a275541ad6cd806a4f478eae', '0', '13112388888', '456415', '1', '是瑞达恒公司的给我塞格ESG物色个无色', '19');
INSERT INTO `student` VALUES ('103', '1', '叶凡凯', 'beb9660c465edabd27411c9c18a8b7db', 'e7c7cc67a275541ad6cd806a4f478eae', '1', '13112399999', '156546', '1', '塞个无色的各色我的色鬼的哇塞单位各位帅哥VS我', '20');
INSERT INTO `student` VALUES ('104', '1', 'test', 'beb9660c465edabd27411c9c18a8b7db', 'e7c7cc67a275541ad6cd806a4f478eae', '0', '13112377777', '5468526', '1', '44444444464745的符号的风格', '21');
INSERT INTO `student` VALUES ('105', '2', '地方', 'beb9660c465edabd27411c9c18a8b7db', 'e7c7cc67a275541ad6cd806a4f478eae', '0', '5466', '5646', '2', 'rsgdrgdrg三个活动公司的', '22');
INSERT INTO `student` VALUES ('106', '1', '啊啊', 'beb9660c465edabd27411c9c18a8b7db', 'e7c7cc67a275541ad6cd806a4f478eae', '1', '56456', '669874587', '1', '密码：1111', '20');
INSERT INTO `student` VALUES ('109', '2', 'admin', 'beb9660c465edabd27411c9c18a8b7db', 'e7c7cc67a275541ad6cd806a4f478eae', '0', '235', '235', '3', '还是让更多人', '21');
INSERT INTO `student` VALUES ('110', '1', '林俊杰', 'beb9660c465edabd27411c9c18a8b7db', 'e7c7cc67a275541ad6cd806a4f478eae', '0', '13112362008', '3463634', '1', '是广发货的提单就', '22');
INSERT INTO `student` VALUES ('116', '2', '请问', 'beb9660c465edabd27411c9c18a8b7db', 'e7c7cc67a275541ad6cd806a4f478eae', '1', '354', '38', '4', '密码：1111', '23');
INSERT INTO `student` VALUES ('117', '2', 'qwe', 'beb9660c465edabd27411c9c18a8b7db', 'e7c7cc67a275541ad6cd806a4f478eae', '0', '374527', '458368463', '2', '密码：1111', '19');
INSERT INTO `student` VALUES ('118', '2', 'sd', 'beb9660c465edabd27411c9c18a8b7db', 'e7c7cc67a275541ad6cd806a4f478eae', '1', '13560636903', '65656', '4', '密码：1111', null);
INSERT INTO `student` VALUES ('120', '2', 'lamaga', 'beb9660c465edabd27411c9c18a8b7db', 'e7c7cc67a275541ad6cd806a4f478eae', '0', '346', '645', '4', '密码：1111', '12');
INSERT INTO `student` VALUES ('169', '2', '伟哥', 'a9488987020a4c7b323d95717d4bde9b', 'cc30eee0f285895263929c370921fe30', '0', '11111111111', null, '3', null, null);
INSERT INTO `student` VALUES ('172', '2', 'maga', 'a7a6574e464322b2b3552ed6de0ec578', 'ae961e48b47ae8280e63fc2ef604cc25', '1', '11111111111', '99999858', '3', '幸从GV你刚才v福不会吃饭吧', '21');
INSERT INTO `student` VALUES ('173', '2', '小明', 'a2b827eadea9a5d6f6d5e07b86b1854e', 'bbeb02d0e1cd9af65928c315b8f44277', '1', '11122233345', null, '4', null, null);
INSERT INTO `student` VALUES ('174', '2', '小红', 'de7e6af68b4cef0358b1d1c10ba62c09', 'b177cfd5f9e588f046172796dc801c25', '0', '12345678978', null, '4', null, null);
INSERT INTO `student` VALUES ('175', '2', '小军', 'c498f219bd73c44070cea96580f4967d', 'c0dd70c70b9748a4ecd1093209aad2be', '1', '11111111111', null, '4', null, null);
INSERT INTO `student` VALUES ('176', '2', 'maga11', '25043ef9ae3cd94914da8865a807c3ad', '76a2d7706bd447b9373b3ccfad703388', '0', '11222222222', null, '4', null, null);
