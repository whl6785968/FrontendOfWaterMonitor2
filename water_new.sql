-- MySQL dump 10.13  Distrib 5.7.23, for Win64 (x86_64)
--
-- Host: localhost    Database: watermoni
-- ------------------------------------------------------
-- Server version	5.7.23-log

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
-- Table structure for table `backendresources`
--

DROP TABLE IF EXISTS `backendresources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backendresources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_name` varchar(32) DEFAULT NULL,
  `resource_url` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backendresources`
--

LOCK TABLES `backendresources` WRITE;
/*!40000 ALTER TABLE `backendresources` DISABLE KEYS */;
INSERT INTO `backendresources` VALUES (1,'用户相关','/user/*'),(2,'用户管理','/sys/user/*'),(3,'菜单相关','/sys/menu/*');
/*!40000 ALTER TABLE `backendresources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `district`
--

DROP TABLE IF EXISTS `district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `district` (
  `id` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `district`
--

LOCK TABLES `district` WRITE;
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
INSERT INTO `district` VALUES ('001','长江流域'),('002','黄河流域'),('003','珠江流域'),('004','松花江流域'),('005','淮河流域'),('006','海河流域'),('007','辽河流域'),('008','浙闽片流域'),('009','西南诸河'),('010','西北诸河'),('011','太湖流域'),('012','滇池流域'),('013','巢湖流域');
/*!40000 ALTER TABLE `district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equip_sta`
--

DROP TABLE IF EXISTS `equip_sta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equip_sta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eid` varchar(200) NOT NULL,
  `sid` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eid` (`eid`),
  KEY `sid` (`sid`),
  CONSTRAINT `equip_sta_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `equipment` (`id`),
  CONSTRAINT `equip_sta_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `station` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equip_sta`
--

LOCK TABLES `equip_sta` WRITE;
/*!40000 ALTER TABLE `equip_sta` DISABLE KEYS */;
INSERT INTO `equip_sta` VALUES (1,'00202440000000010','4001'),(2,'00202440000000001','4002'),(3,'00202440000000002','4003'),(4,'00202440000000003','4004'),(5,'00202440000000004','4005'),(6,'00202440000000005','4006'),(7,'00202440000000006','4007'),(8,'00202440000000007','4008'),(9,'00202440000000008','4009'),(10,'00202440000000009','4010'),(11,'00202440000000011','4011'),(12,'00202440000000012','4012'),(13,'00202440000000013','4016'),(14,'00202440000000014','4013'),(15,'00202440000000015','4014'),(16,'00202440000000016','4015');
/*!40000 ALTER TABLE `equip_sta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment` (
  `id` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `model` varchar(200) NOT NULL,
  `productionTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `availableTime` int(11) DEFAULT NULL,
  `productionPlace` varchar(32) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
INSERT INTO `equipment` VALUES ('00202440000000001','高级水质检测仪','GPRS232-734','2020-10-30 22:20:33',7,'波思图智能有效股份公司',1),('00202440000000002','高级水质检测仪','GPRS232-734','2020-10-30 22:21:11',7,'波思图智能有效股份公司',1),('00202440000000003','高级水质检测仪','GPRS232-734','2020-10-30 22:21:33',7,'波思图智能有效股份公司',1),('00202440000000004','高级水质检测仪','GPRS232-734','2020-10-30 22:22:03',7,'波思图智能有效股份公司',1),('00202440000000005','高级水质检测仪','GPRS232-734','2020-10-30 22:22:49',7,'波思图智能有效股份公司',1),('00202440000000006','高级水质检测仪','GPRS232-734','2020-10-30 22:23:44',7,'波思图智能有效股份公司',1),('00202440000000007','高级水质检测仪','GPRS232-734','2020-10-30 22:24:14',7,'波思图智能有效股份公司',1),('00202440000000008','高级水质检测仪','GPRS232-734','2020-10-30 22:25:01',7,'波思图智能有效股份公司',1),('00202440000000009','高级水质检测仪','GPRS232-734','2020-10-30 22:25:46',7,'波思图智能有效股份公司',1),('00202440000000010','高级水质检测仪','GPRS232-734','2020-10-30 22:17:28',7,'波思图智能有效股份公司',1),('00202440000000011','高级水质检测仪','GPRS232-734','2020-10-30 22:26:24',7,'波思图智能有效股份公司',1),('00202440000000012','高级水质检测仪','GPRS232-734','2020-10-30 22:27:00',7,'波思图智能有效股份公司',1),('00202440000000013','高级水质检测仪','GPRS232-734','2020-10-30 22:27:20',7,'波思图智能有效股份公司',1),('00202440000000014','高级水质检测仪','GPRS232-734','2020-10-30 22:28:06',7,'波思图智能有效股份公司',1),('00202440000000015','高级水质检测仪','GPRS232-734','2020-10-30 22:28:30',7,'波思图智能有效股份公司',1),('00202440000000016','高级水质检测仪','GPRS232-734','2020-10-30 22:29:03',7,'波思图智能有效股份公司',1);
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `err_record`
--

DROP TABLE IF EXISTS `err_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `err_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `judge` varchar(200) NOT NULL,
  `emergency` int(11) NOT NULL,
  `charger_id` varchar(32) DEFAULT NULL,
  `charger_name` varchar(32) DEFAULT NULL,
  `is_solve` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sid` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `record_id` (`record_id`),
  KEY `charger_id` (`charger_id`),
  KEY `err_record_ibfk_2` (`sid`),
  CONSTRAINT `err_record_ibfk_1` FOREIGN KEY (`charger_id`) REFERENCES `user` (`userId`),
  CONSTRAINT `err_record_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `station` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `err_record`
--

LOCK TABLES `err_record` WRITE;
/*!40000 ALTER TABLE `err_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `err_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flow_direction`
--

DROP TABLE IF EXISTS `flow_direction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flow_direction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upstream_id` varchar(32) NOT NULL,
  `downstream_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flow_direction`
--

LOCK TABLES `flow_direction` WRITE;
/*!40000 ALTER TABLE `flow_direction` DISABLE KEYS */;
/*!40000 ALTER TABLE `flow_direction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_list`
--

DROP TABLE IF EXISTS `history_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `create_time` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_list`
--

LOCK TABLES `history_list` WRITE;
/*!40000 ALTER TABLE `history_list` DISABLE KEYS */;
INSERT INTO `history_list` VALUES (1,'2019-11-29水质自动监测周报','2019-11-29');
/*!40000 ALTER TABLE `history_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history_record`
--

DROP TABLE IF EXISTS `history_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `curr_level` int(11) NOT NULL,
  `pre_level` int(11) NOT NULL,
  `responsible` varchar(32) NOT NULL,
  `did` varchar(32) NOT NULL,
  `dname` varchar(32) NOT NULL,
  `create_time` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history_record`
--

LOCK TABLES `history_record` WRITE;
/*!40000 ALTER TABLE `history_record` DISABLE KEYS */;
INSERT INTO `history_record` VALUES (1,'001','玄武湖菱州',2,3,'test1','001','玄武湖片区','2019-11-29'),(2,'003','玄武湖东湖',4,3,'test1','001','玄武湖片区','2019-11-29'),(3,'004','玄武湖北湖',3,2,'test1','001','玄武湖片区','2019-11-29'),(4,'005','玄武湖牡丹岛',2,3,'test1','001','玄武湖片区','2019-11-29'),(5,'002','石臼湖',1,2,'test2','002','石臼湖片区','2019-11-29'),(6,'006','石臼湖2',3,3,'test2','002','石臼湖片区','2019-11-29');
/*!40000 ALTER TABLE `history_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `knowledge`
--

DROP TABLE IF EXISTS `knowledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `knowledge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` varchar(32) NOT NULL,
  `entity_type` varchar(32) NOT NULL,
  `relation` varchar(32) NOT NULL,
  `entity_value` varchar(2000) NOT NULL,
  `node_desc` varchar(2000) DEFAULT NULL,
  `entity_index` varchar(2000) DEFAULT NULL,
  `ambiguous` varchar(200) DEFAULT NULL,
  `entity_id` int(32) DEFAULT NULL,
  `value_id` int(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `knowledge`
--

LOCK TABLES `knowledge` WRITE;
/*!40000 ALTER TABLE `knowledge` DISABLE KEYS */;
INSERT INTO `knowledge` VALUES (1,'中国地表水水质标准','knowledge','内容','Ⅰ类水',NULL,NULL,NULL,1,2),(2,'Ⅰ类水','knowledge','溶解氧','≥7.5',NULL,NULL,NULL,2,3);
/*!40000 ALTER TABLE `knowledge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `path` varchar(200) NOT NULL,
  `component` varchar(200) NOT NULL,
  `title` varchar(200) NOT NULL,
  `iconCls` varchar(200) DEFAULT NULL,
  `keepAlive` tinyint(1) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `requireAuth` int(11) NOT NULL,
  `enable` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (0,'/','/dashboard','dashboard','all',NULL,1,NULL,1,1),(1,'/','/dashboard','dashboard','用户管理',NULL,1,0,1,1),(2,'/','/dashboard','dashboard','数据展示',NULL,1,0,1,1),(3,'/sys/user/**','/userManager/authContol','authControl','权限控制',NULL,1,1,1,1),(4,'/data/basic/**','/dataRelated/equipList','checkData','数据详情',NULL,1,2,1,1),(5,'/sys/menu/**','/userManager/menuConfig','menuConfig','菜单配置',NULL,1,1,1,1),(6,'/user/basic/**','/dashboard','dashboard','userbasic',NULL,1,0,0,0),(7,'/data/basic/**','/dataRelated/equipList/dataDetails/:id','dataDetails','dataDetails',NULL,1,2,1,0),(8,'/data/basic/**','/dataRelated/map','map','站点地图',NULL,1,2,1,1),(9,'/','dashboard','dashboard','消息',NULL,1,0,1,1),(10,'/msg/basic/**','/msg/posting','posting','发送消息',NULL,1,9,1,1),(11,'/msg/basic/**','/msg/readablePost','readablePost','消息列表',NULL,1,9,1,1),(12,'/sys/msg/**','/msg/review','review','消息审查',NULL,1,9,1,1),(13,'/msg/basic/**','/msg/postDetail/:id','postDetail','postDetail',NULL,1,9,1,0),(14,'/','dashboard','dashboard','报告',NULL,1,0,1,1),(15,'/report/basic/**','/report/reportList','reportList','报告列表',NULL,1,14,1,1),(16,'/report/basic/**','/report/reportDeatils/:createTime','reportDetails','reportDetails',NULL,1,14,1,0),(17,'/','/dashboard','dashboard','异常处理',NULL,1,0,1,1),(18,'/algo/basic/**','/algo/anomalyMonitoring','isoForest','异常监控',NULL,1,17,1,1),(19,'/','/dashboard','dashboard','非用户管理',NULL,1,0,1,1),(20,'/sys/data/**','/manager/stationManager','stationManager','站点管理',NULL,1,19,1,1),(21,'/sys/data/**','/manager/districtManager','districtManager','区域管理',NULL,1,19,1,1),(22,'/sys/data/**','/manager/equipManager','equipManager','设备管理',NULL,1,19,1,1),(23,'/','/dashboard','dashboard','知识图谱',NULL,1,0,1,1),(24,'/kg/**','/kg/showKg','showKg','知识图谱展示',NULL,1,23,1,1),(25,'/algo/basic/**','/algo/errRecord','errRecord','异常记录',NULL,1,17,1,1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg`
--

DROP TABLE IF EXISTS `msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postId` varchar(200) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `imgList` varchar(2000) DEFAULT NULL,
  `isEmergency` int(11) NOT NULL,
  `isReviewd` int(11) NOT NULL,
  `postTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(32) NOT NULL,
  `uid` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `postId` (`postId`),
  KEY `uid` (`uid`),
  CONSTRAINT `msg_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg`
--

LOCK TABLES `msg` WRITE;
/*!40000 ALTER TABLE `msg` DISABLE KEYS */;
INSERT INTO `msg` VALUES (48,'7a328021afbc446e87bfe7c4487f76271574669482776','111','111','',0,1,'2019-11-25 00:11:23','','test1'),(49,'34e0870d173c42b3ac1d28fd91ff87951574669874599','client test','client test','',0,1,'2019-11-25 00:17:55','','test2'),(50,'89d70fdab63648d6a20104647d7ffcbd1574670154709','admin test','admin test','',0,1,'2019-11-25 00:22:35','','test1'),(51,'37415f0d443c43b1b8907ab15fc4d0261574672157752','珂朵莉祈求无BUG','我是珂学家，BUG全没啦','/static/d1148cebb5804b46b4e1eaa163fb44c5.jpg',0,1,'2019-11-25 00:55:58','','test2'),(52,'a988b5947e6e4c2cb9b87e576fa9a1181574672321609','这是一条永远的not review 消息','谁也发现不了我~','/static/8de7933c92e64ba69ba04e90aea7aa6e.jpg',0,0,'2019-11-25 00:58:42','其他','test1'),(53,'ecbbe95e8943440c820b57e5100b155c1582005063949','测试','没啥形式','/static/7745050b1fca46d19ace94fbfb6fc48e.png,/static/39df9e677675444e92c6e9a679296d7c.jpg',1,1,'2020-02-17 21:51:04','设备故障','test1'),(54,'3d21d1ccd00545528ed54cd02c60920d1582007648532','XXX站点水质出现严重问题，如何解决？','如题，求解','',0,1,'2020-02-17 22:34:09','水质异常','test1'),(55,'0c3abfa4b1af4e37994e1af9c6dc79d71582007949881','水质富营养化','水质富营养化如何解决？？','/static/aaa20b518eea4e43af38746df269ccde.png',0,1,'2020-02-17 22:39:10','水质异常','test1'),(56,'18afe2f904d84ea185064633152440651582346061942','loadrunner tst','loadrunner  tst','',0,1,'2020-02-21 20:34:22','其他','test1'),(57,'154bbe90473a4342861149e1bf9f48ef1582346395787','哈哈哈哈','垃圾load rununer','',0,1,'2020-02-21 20:39:56','其他','test1'),(58,'8ec042cf49b04b25a59c4cb3dddb43d41582346889739','发一个贴子吧，求审核通过','管理员大大网开一面','',0,1,'2020-02-21 20:48:10','其他','test2'),(59,'e0ed0782e0c84eed94629d029d98d2dd1589183679289','我胡汉三又回来了','一身败绩的归来','/static/f79008d650d542b58b8fe3a4b854c47e.jpg',1,1,'2020-05-10 23:54:39','其他','test1'),(60,'05def1a58fdf49ccacf072ef13a65c3b1592721809246','目前，连挂三家！','越挫越勇~永远不灰心','',0,1,'2020-06-20 22:43:29','其他','test1'),(61,'198d84a514d9486390a80d88541a7c701593768405064','张子豪：这是我爸爸','我爸爸帅不帅','/static/2d030644ef9b4f649510937dee826020.JPG',1,1,'2020-07-03 01:26:45','其他','test1'),(62,'6e9809775322421b926d7afce537ea4c1597204130124','彪哥，你好帅','真的帅','',1,1,'2020-08-11 19:48:50','','test2'),(63,'8887dfd00b424e659acb4cbf606d25bf1602644207412','王彦，吃屎了吧','屎王，王彦','',1,1,'2020-10-13 18:56:47','水质异常','test1');
/*!40000 ALTER TABLE `msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msg_user`
--

DROP TABLE IF EXISTS `msg_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `msg_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` varchar(200) NOT NULL,
  `uid` varchar(32) NOT NULL,
  `is_read` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `uid` (`uid`),
  CONSTRAINT `msg_user_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `msg` (`postId`),
  CONSTRAINT `msg_user_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msg_user`
--

LOCK TABLES `msg_user` WRITE;
/*!40000 ALTER TABLE `msg_user` DISABLE KEYS */;
INSERT INTO `msg_user` VALUES (39,'34e0870d173c42b3ac1d28fd91ff87951574669874599','test2',1),(40,'89d70fdab63648d6a20104647d7ffcbd1574670154709','test1',1),(41,'89d70fdab63648d6a20104647d7ffcbd1574670154709','test2',1),(43,'37415f0d443c43b1b8907ab15fc4d0261574672157752','test2',1),(44,'a988b5947e6e4c2cb9b87e576fa9a1181574672321609','test1',1),(45,'ecbbe95e8943440c820b57e5100b155c1582005063949','admin',0),(48,'3d21d1ccd00545528ed54cd02c60920d1582007648532','admin',0),(49,'3d21d1ccd00545528ed54cd02c60920d1582007648532','test1',1),(51,'0c3abfa4b1af4e37994e1af9c6dc79d71582007949881','admin',0),(52,'0c3abfa4b1af4e37994e1af9c6dc79d71582007949881','test1',1),(54,'18afe2f904d84ea185064633152440651582346061942','admin',0),(57,'154bbe90473a4342861149e1bf9f48ef1582346395787','admin',0),(60,'8ec042cf49b04b25a59c4cb3dddb43d41582346889739','admin',1),(63,'e0ed0782e0c84eed94629d029d98d2dd1589183679289','admin',0),(66,'e0ed0782e0c84eed94629d029d98d2dd1589183679289','test3',0),(67,'05def1a58fdf49ccacf072ef13a65c3b1592721809246','admin',0),(70,'05def1a58fdf49ccacf072ef13a65c3b1592721809246','test3',0),(71,'198d84a514d9486390a80d88541a7c701593768405064','admin',0),(73,'198d84a514d9486390a80d88541a7c701593768405064','test3',0),(75,'6e9809775322421b926d7afce537ea4c1597204130124','admin',0),(76,'6e9809775322421b926d7afce537ea4c1597204130124','test1',1),(77,'6e9809775322421b926d7afce537ea4c1597204130124','test3',0),(78,'6e9809775322421b926d7afce537ea4c1597204130124','test2',1),(79,'8887dfd00b424e659acb4cbf606d25bf1602644207412','admin',0),(80,'8887dfd00b424e659acb4cbf606d25bf1602644207412','test1',1),(81,'8887dfd00b424e659acb4cbf606d25bf1602644207412','test3',0),(82,'8887dfd00b424e659acb4cbf606d25bf1602644207412','test2',0);
/*!40000 ALTER TABLE `msg_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (8601,'北京市'),(8602,'上海市'),(8603,'天津市'),(8604,'重庆市'),(8605,'河北省'),(8606,'山西省'),(8607,'内蒙古自治区'),(8608,'辽宁省'),(8609,'吉林省'),(8610,'黑龙江省'),(8611,'江苏省'),(8612,'浙江省'),(8613,'安徽省'),(8614,'江西省'),(8615,'山东省'),(8616,'河南省'),(8617,'湖北省'),(8618,'广西壮族自治区'),(8619,'四川省'),(8620,'云南省'),(8621,'陕西省'),(8622,'甘肃省'),(8623,'宁夏回族自治区'),(8624,'湖南省');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_id` varchar(200) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `img_list` varchar(2000) DEFAULT NULL,
  `reply_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uid` varchar(32) NOT NULL,
  `post_id` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reply_id` (`reply_id`),
  KEY `uid` (`uid`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`userId`),
  CONSTRAINT `reply_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `msg` (`postId`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (1,'f319106afb12466bbeccdf6f683abf981582001669266','<h2><span style=\"font-weight: bold;\">reply test</span></h2>',NULL,'2020-02-17 20:54:29','test1','89d70fdab63648d6a20104647d7ffcbd1574670154709'),(2,'2d299d566e6146dbacf1b680fd08f3771582007735575','<p>你可从以下几点分析：</p><ol><li>查看设备是否异常</li><li>查看上下游水质是否异常</li><li>可以查看附近工厂最近的废水排放量</li></ol>',NULL,'2020-02-17 22:35:36','test1','3d21d1ccd00545528ed54cd02c60920d1582007648532'),(3,'517174e0388f44dda07cbc9bb9c609731582008140379','<p><span style=\"font-size: 1rem;\">水体富营养化的防治对策</span><br></p><p><br>一、控制外源性营养物质输入<br><br>二、减少内源性营养物质负荷<br><br>★ 投放水生动物：螺、蚌等<a href=\"https://www.baidu.com/s?wd=%E5%BA%95%E6%A0%96%E5%8A%A8%E7%89%A9&amp;tn=SE_PcZhidaonwhc_ngpagmjz&amp;rsv_dl=gh_pc_zhidao\" target=\"_blank\">底栖动物</a>可过滤悬浮物质，摄食生物碎屑，其分泌物有絮凝作用，螺有刮食着生藻类功能，虾和若干种类鱼类可摄食藻类、碎屑、<a href=\"https://www.baidu.com/s?wd=%E6%B5%AE%E6%B8%B8%E5%8A%A8%E7%89%A9&amp;tn=SE_PcZhidaonwhc_ngpagmjz&amp;rsv_dl=gh_pc_zhidao\" target=\"_blank\">浮游动物</a>等。这些动物，作为健康水生态系统的补充组成，也有重要作用。 根据水体的特定环境，投放相适应的水生动物，如鱼类、<a href=\"https://www.baidu.com/s?wd=%E5%BA%95%E6%A0%96%E5%8A%A8%E7%89%A9&amp;tn=SE_PcZhidaonwhc_ngpagmjz&amp;rsv_dl=gh_pc_zhidao\" target=\"_blank\">底栖动物</a>。<br><br>★ 建立人工生态体系：人工生态系统利用种植水生植物、养鱼、养鸭、养鹅等形成多条食物链。其中不仅有分解者生物、生产者生物、还有消费者生物，三者分工协作，对污水中的污染物进行更有效的处理与利用，并由此可形成许多条食物链，构成纵横交错的食物网生态系统。如果在各营养级之间保持适宜的数量比和能量比，就可建立良好的生态平衡系统。当一定量的污水进入这种生态塘中，其中的有机污染物不仅被细菌和真菌降解净化，而其降解的最终产物，一些无机化合物作为碳源、氮源和磷源，以太阳能为初始能源，参与食物网中的新陈代谢过程，并从低营养级到高营养级逐级迁移转化，最后转变成水生作物、鱼、虾、蚌、鹅、鸭等产物,人们不仅可以不断的取走这些增殖的产品，而且通过人们的不断的取走和加入的措施来保持水体的综合生态平衡，达到防治水体的富营养化的目的。&nbsp;&nbsp;<br></p>',NULL,'2020-02-17 22:42:20','test1','0c3abfa4b1af4e37994e1af9c6dc79d71582007949881'),(4,'2c4d17714a6d404ea63c716ea518db9d1582346425612','<p>楼主，是load runner把 ，不过我也觉得垃圾</p>',NULL,'2020-02-21 20:40:26','test1','154bbe90473a4342861149e1bf9f48ef1582346395787'),(5,'9cb74455f13c4e53a7d2d4e4d60e2a2b1582346435788','',NULL,'2020-02-21 20:40:36','test1','154bbe90473a4342861149e1bf9f48ef1582346395787'),(6,'4890d0b25d524d3d8a3594ab526761731582346476363','<p>3L，你说的什么</p>',NULL,'2020-02-21 20:41:16','test2','154bbe90473a4342861149e1bf9f48ef1582346395787'),(7,'17410b6293254ae99692fc36b3f8ade41582346505369','<p>不文明的字会被过滤吗</p>',NULL,'2020-02-21 20:41:45','test2','18afe2f904d84ea185064633152440651582346061942'),(8,'4950ce61144840bda8d382f53b57e0db1582346510694','<p>草泥马</p>',NULL,'2020-02-21 20:41:51','test2','18afe2f904d84ea185064633152440651582346061942'),(9,'b55afb232097426a83324b0135805c5b1582346517426','<p>奇了怪了</p>',NULL,'2020-02-21 20:41:57','test2','18afe2f904d84ea185064633152440651582346061942'),(10,'cc425a61fa6a47b19bf2766768c745f91582346951946','<p><span style=\"font-weight: bold;\">38张亮，有脸发帖子？？？</span></p>',NULL,'2020-02-21 20:49:12','admin','8ec042cf49b04b25a59c4cb3dddb43d41582346889739'),(11,'5480640a3b254ffabd21e6e1530968ad1582347141042','<p>hehe<br></p>',NULL,'2020-02-21 20:52:21','test1','8ec042cf49b04b25a59c4cb3dddb43d41582346889739'),(12,'04259b6b00cf45fd9fddfde979b19d111582347154506','<p>qiguai<br></p>',NULL,'2020-02-21 20:52:35','test1','8ec042cf49b04b25a59c4cb3dddb43d41582346889739'),(13,'a7e98b63e02b4dbe9b996ff80d527af51589183717485','<p>图挂了？</p>',NULL,'2020-05-10 23:55:17','test1','e0ed0782e0c84eed94629d029d98d2dd1589183679289'),(14,'671f7bbd857d49e29393df90d611619d1592188584412','<p>sb</p>',NULL,'2020-06-14 18:36:24','test1','0c3abfa4b1af4e37994e1af9c6dc79d71582007949881'),(15,'ea08ba8be37b4f2fba68c9e8cfeca76e1592721835327','<p>努力努力，越努力越幸运！</p>',NULL,'2020-06-20 22:43:55','test1','05def1a58fdf49ccacf072ef13a65c3b1592721809246'),(16,'e1facce949c44a00a15cd0f4fb226bc81593768433033','<p>帅</p>',NULL,'2020-07-03 01:27:13','test1','198d84a514d9486390a80d88541a7c701593768405064'),(17,'1b8fdd2f70444eae929dffef4b7ec7dd1593768462897','<p>张子豪是</p>',NULL,'2020-07-03 01:27:43','test1','0c3abfa4b1af4e37994e1af9c6dc79d71582007949881'),(18,'573df795bfc449dca62fbbb4b46dbd101593768472642','<p>SB</p>',NULL,'2020-07-03 01:27:53','test1','0c3abfa4b1af4e37994e1af9c6dc79d71582007949881'),(19,'a17e339f4c934b5ab64f109615d0f6321593768484106','<p>张子豪是SB</p>',NULL,'2020-07-03 01:28:04','test1','0c3abfa4b1af4e37994e1af9c6dc79d71582007949881'),(20,'c36ca429b3e14258adec06490ac002881597204172809','<p>k</p>',NULL,'2020-08-11 19:49:33','test1','6e9809775322421b926d7afce537ea4c1597204130124'),(21,'3354def93f424c08a3a39501aa10dee81597204178872','<p>？？？</p>',NULL,'2020-08-11 19:49:39','test1','6e9809775322421b926d7afce537ea4c1597204130124'),(22,'177caefbbc8e48a5a0240436c9e8d3f41602644223133','<p>真恶心</p>',NULL,'2020-10-13 18:57:03','test1','8887dfd00b424e659acb4cbf606d25bf1602644207412');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `roleId` varchar(32) NOT NULL,
  `role_name` varchar(32) NOT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('001','ROLE_CLIENT'),('002','ROLE_VISITOR'),('777','ROLE_ADMIN');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_back`
--

DROP TABLE IF EXISTS `role_back`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_back` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(32) NOT NULL,
  `back_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `back_id` (`back_id`),
  CONSTRAINT `role_back_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`roleId`),
  CONSTRAINT `role_back_ibfk_2` FOREIGN KEY (`back_id`) REFERENCES `backendresources` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_back`
--

LOCK TABLES `role_back` WRITE;
/*!40000 ALTER TABLE `role_back` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_back` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_menu`
--

DROP TABLE IF EXISTS `role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(32) NOT NULL,
  `menu_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `role_menu_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`),
  CONSTRAINT `role_menu_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=343 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_menu`
--

LOCK TABLES `role_menu` WRITE;
/*!40000 ALTER TABLE `role_menu` DISABLE KEYS */;
INSERT INTO `role_menu` VALUES (184,'001',4),(185,'001',7),(186,'001',8),(187,'001',10),(188,'001',11),(189,'001',13),(190,'001',15),(191,'001',16),(195,'001',18),(326,'777',3),(327,'777',5),(328,'777',4),(329,'777',7),(330,'777',8),(331,'777',10),(332,'777',11),(333,'777',12),(334,'777',13),(335,'777',15),(336,'777',16),(337,'777',18),(338,'777',25),(339,'777',20),(340,'777',21),(341,'777',22),(342,'777',24);
/*!40000 ALTER TABLE `role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station`
--

DROP TABLE IF EXISTS `station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `station` (
  `id` varchar(32) NOT NULL,
  `name` varchar(200) NOT NULL,
  `longtitude` double NOT NULL,
  `latitude` double NOT NULL,
  `currLevel` int(11) DEFAULT NULL,
  `preLevel` int(11) DEFAULT NULL,
  `responsible` varchar(32) DEFAULT NULL,
  `upstream_id` varchar(32) DEFAULT NULL,
  `downstream_id` varchar(32) DEFAULT NULL,
  `is_alert` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station`
--

LOCK TABLES `station` WRITE;
/*!40000 ALTER TABLE `station` DISABLE KEYS */;
INSERT INTO `station` VALUES ('4001','急水港桥',120.728387,31.065884,2,3,'test1','','',0),('4002','林山',118.53752,31.924712,2,3,'test1','null','4001',0),('4003','三江营',119.716451,32.326611,2,3,'test1','4002','4001',0),('4004','皖河口',117.007032,30.514094,1,3,'test2','null','4002',0),('4005','蛤蟆石',116.141209,29.613241,3,4,'test3','null','4004',0),('4006','宗关',114.230694,30.586636,3,5,'test2','null','4005',0),('4007','城陵矶',113.155362,29.441517,3,3,'test2','null','4006',0),('4008','朱沱',105.85829,29.018593,2,1,'test2','null','4007',0),('4009','沱江大桥',105.423024,28.90261,2,3,'test2','null','4008',0),('4010','新城桥',103.491814,36.176026,3,3,'test3','null','null',0),('4011','中卫下河',105.067334,37.458789,1,1,'test3','4010','null',0),('4012','画匠营子',109.93993,40.541363,2,2,'test3','4011','null',0),('4013','河津大桥',110.611575,35.665753,5,3,'test3','4012','null',0),('4014','潼关吊桥',110.230557,34.616997,3,5,'test3','4013','null',0),('4015','小浪底',112.391851,34.926958,2,3,'test3','4014','null',0),('4016','泺口',117.000769,36.725994,5,3,'test3','4015','null',0);
/*!40000 ALTER TABLE `station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station_district`
--

DROP TABLE IF EXISTS `station_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `station_district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(32) NOT NULL,
  `did` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `did` (`did`),
  CONSTRAINT `station_district_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `station` (`id`),
  CONSTRAINT `station_district_ibfk_2` FOREIGN KEY (`did`) REFERENCES `district` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station_district`
--

LOCK TABLES `station_district` WRITE;
/*!40000 ALTER TABLE `station_district` DISABLE KEYS */;
INSERT INTO `station_district` VALUES (6,'4001','001'),(7,'4002','001'),(8,'4003','001'),(9,'4004','001'),(10,'4005','001'),(11,'4006','001'),(12,'4007','001'),(13,'4008','001'),(14,'4009','001'),(15,'4010','002'),(16,'4011','002'),(17,'4012','002'),(18,'4013','002'),(19,'4014','002'),(20,'4015','002'),(21,'4016','002');
/*!40000 ALTER TABLE `station_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `station_province`
--

DROP TABLE IF EXISTS `station_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `station_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(32) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `pid` (`pid`),
  CONSTRAINT `station_province_ibfk_1` FOREIGN KEY (`sid`) REFERENCES `station` (`id`),
  CONSTRAINT `station_province_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `station_province`
--

LOCK TABLES `station_province` WRITE;
/*!40000 ALTER TABLE `station_province` DISABLE KEYS */;
INSERT INTO `station_province` VALUES (6,'4001',8602),(7,'4002',8611),(8,'4003',8611),(9,'4004',8613),(10,'4005',8614),(11,'4006',8617),(12,'4007',8624),(13,'4008',8604),(14,'4009',8619),(15,'4010',8622),(16,'4011',8623),(17,'4012',8607),(18,'4013',8606),(19,'4014',8621),(20,'4015',8616),(21,'4016',8615);
/*!40000 ALTER TABLE `station_province` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userId` varchar(32) NOT NULL,
  `pwd` varchar(32) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin','whl6785968'),('test1','666'),('test2','456'),('test3','789');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `user_id` varchar(32) NOT NULL,
  `role_id` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`userId`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (0,'test1','777'),(1,'test2','001'),(2,'test3','777'),(4,'admin','777');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_station`
--

DROP TABLE IF EXISTS `user_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_station` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(32) NOT NULL,
  `sid` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `sid` (`sid`),
  CONSTRAINT `user_station_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`userId`),
  CONSTRAINT `user_station_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `station` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_station`
--

LOCK TABLES `user_station` WRITE;
/*!40000 ALTER TABLE `user_station` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `sex` varchar(32) NOT NULL,
  `age` int(11) NOT NULL,
  `avatar` varchar(2000) DEFAULT NULL,
  `link` varchar(32) NOT NULL,
  `salt` varchar(2000) DEFAULT NULL,
  `descr` varchar(2000) DEFAULT NULL,
  `token` varchar(2000) DEFAULT NULL,
  `uid` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `userinfo_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (1,'sandalen','男',23,'','18245803818','','管理员','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJ0ZXN0MSJ9.uwzFoA0n1UkwGuQc1sVRuW_DC8Z6reoN7rj3ITiMFxI','test1'),(2,'张亮','女',23,'','18245803818','','38','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJ0ZXN0MiJ9.eLAl51MlgUkPyR99Lyb-nGpE5KYakvyRpqlQCJKDsDo','test2'),(3,'alex','男',22,'','18245803818','','visitor','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJ0ZXN0MyJ9.SVav238wwQmnXEwuUmj7B2ZERA9iS0EYSEq67lf_GFM','test3'),(4,'系统','女',0,NULL,'18245803818',NULL,'系统','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhZG1pbiJ9.VCNbPfR9_uzwkLRV-JLpysxfM47683wv1lf8tcfrNjU','admin');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usersecurityinfo`
--

DROP TABLE IF EXISTS `usersecurityinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usersecurityinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locked` int(11) NOT NULL,
  `enabled` int(11) NOT NULL,
  `attemped` int(11) DEFAULT '0',
  `isAccountExpired` int(11) DEFAULT NULL,
  `createdTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uid` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  CONSTRAINT `usersecurityinfo_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usersecurityinfo`
--

LOCK TABLES `usersecurityinfo` WRITE;
/*!40000 ALTER TABLE `usersecurityinfo` DISABLE KEYS */;
INSERT INTO `usersecurityinfo` VALUES (1,0,1,0,0,'2019-11-15 01:56:45','test1'),(2,0,1,0,0,'2019-11-15 01:56:45','test2'),(3,0,1,0,0,'2020-02-16 03:14:50','admin');
/*!40000 ALTER TABLE `usersecurityinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waterdata`
--

DROP TABLE IF EXISTS `waterdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `waterdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ph` double DEFAULT '0',
  `disslove` double DEFAULT '0',
  `nh` double DEFAULT '0',
  `kmno` double DEFAULT '0',
  `totalp` double DEFAULT '0',
  `create_tame` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `eid` varchar(200) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `eid` (`eid`),
  CONSTRAINT `waterdata_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `equipment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=340 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waterdata`
--

LOCK TABLES `waterdata` WRITE;
/*!40000 ALTER TABLE `waterdata` DISABLE KEYS */;
INSERT INTO `waterdata` VALUES (1,7.73,9.72,0.15,0,0,'2020-10-31 08:07:59','00202440000000001',1),(2,8.91,7.25,0,2.5,20,'2020-10-31 08:07:59','00202440000000001',2),(3,6.44,7.96,0.84,3.4,2.37292,'2020-10-31 08:07:59','00202440000000001',3),(4,6.96,13.59,0.42,0,0,'2020-10-31 08:07:59','00202440000000001',2),(5,8.88,10.64,0.44,0,0,'2020-10-31 08:07:59','00202440000000001',2),(6,8.05,10.82,0.06,3.19,0,'2020-10-31 08:07:59','00202440000000001',2),(7,8.45,10.7,0,7.73,0,'2020-10-31 08:07:59','00202440000000001',4),(8,7.64,13.32,0.26,4.67,0,'2020-10-31 08:07:59','00202440000000001',3),(9,8.74,11.66,0,4.02,0,'2020-10-31 08:07:59','00202440000000001',3),(10,7.88,8.58,0,3.63,0,'2020-10-31 08:07:59','00202440000000001',2),(11,8.52,9.32,0.73,3.97,0,'2020-10-31 08:07:59','00202440000000001',3),(12,7.7,10.38,0.19,2.1,0,'2020-10-31 08:07:59','00202440000000001',2),(13,7.12,8.6,0.12,0,0,'2020-10-31 08:07:59','00202440000000001',1),(14,7.07,4.49,0.9,6.78,0,'2020-10-31 08:07:59','00202440000000001',4),(15,8.53,11.06,0.21,3.79,0,'2020-10-31 08:07:59','00202440000000001',2),(16,8.31,16.12,0.32,4.82,0,'2020-10-31 08:07:59','00202440000000001',3),(17,8.44,12.26,0.05,6.22,0,'2020-10-31 08:07:59','00202440000000001',4),(18,7.76,10.8,0,3.84,0,'2020-10-31 08:07:59','00202440000000001',2),(19,8.38,10.14,0.15,2.82,0,'2020-10-31 08:07:59','00202440000000001',2),(20,7.78,8.44,0.12,3.65,0,'2020-10-31 08:07:59','00202440000000002',2),(21,8.06,11.01,0.95,5.15,2.5,'2020-10-31 08:07:59','00202440000000002',3),(22,7.51,12.36,0.13,5.43,0,'2020-10-31 08:07:59','00202440000000002',3),(23,7.57,7.71,0,2.98,0,'2020-10-31 08:07:59','00202440000000002',2),(24,8.25,11.59,0.23,2.36,0,'2020-10-31 08:07:59','00202440000000002',2),(25,8.17,9.16,0.09,4.12,0,'2020-10-31 08:07:59','00202440000000002',3),(26,7.23,5.57,0.14,1.44,0,'2020-10-31 08:07:59','00202440000000002',3),(27,8.06,7.28,0.29,4.2,0,'2020-10-31 08:07:59','00202440000000002',3),(28,7.59,9.29,0.15,1.83,0,'2020-10-31 08:07:59','00202440000000002',1),(29,7.81,8.5,0.14,1.69,0,'2020-10-31 08:07:59','00202440000000002',1),(30,8.8,10.66,0.19,2.63,0,'2020-10-31 08:07:59','00202440000000002',2),(31,7.66,11.69,0.05,2,0,'2020-10-31 08:07:59','00202440000000002',1),(32,7.84,8.69,0,1.98,0,'2020-10-31 08:07:59','00202440000000002',1),(33,7.04,3.34,0.65,4.3,0,'2020-10-31 08:07:59','00202440000000002',4),(34,8.66,9.63,0.36,5.97,0,'2020-10-31 08:07:59','00202440000000002',3),(35,8.3,14.6,0.46,3.5,0,'2020-10-31 08:07:59','00202440000000002',2),(36,8.68,13.17,0.07,8.33,0,'2020-10-31 08:07:59','00202440000000002',4),(37,7.79,8.26,0.09,1.58,0,'2020-10-31 08:07:59','00202440000000002',1),(38,7.62,10.47,0.17,0,0,'2020-10-31 08:07:59','00202440000000002',2),(39,6.66,8.26,0.06,0.86,0,'2020-10-31 08:07:59','00202440000000002',1),(40,7.48,9.1,0.24,2.73,0,'2020-10-31 08:07:59','00202440000000003',2),(41,8.13,9.49,0.37,2.02,0,'2020-10-31 08:07:59','00202440000000003',2),(42,7.82,8.65,0.14,1.88,0,'2020-10-31 08:07:59','00202440000000003',1),(43,7.67,8.02,0.18,2.91,0,'2020-10-31 08:07:59','00202440000000003',2),(44,8.28,10.1,0.08,2.67,0,'2020-10-31 08:07:59','00202440000000003',2),(45,7.39,6.31,0.44,8.9,0,'2020-10-31 08:07:59','00202440000000003',4),(46,7.8,9.56,0.27,4.78,0,'2020-10-31 08:07:59','00202440000000003',3),(47,7.8,7.33,0.11,1,0,'2020-10-31 08:07:59','00202440000000003',2),(48,7.45,9.36,0.18,5.15,0,'2020-10-31 08:07:59','00202440000000003',3),(49,7.83,11.68,0.14,3.61,0,'2020-10-31 08:07:59','00202440000000003',2),(50,7.78,7.72,0.21,4.65,0,'2020-10-31 08:07:59','00202440000000003',3),(51,8.91,8.85,0.32,3.24,0,'2020-10-31 08:07:59','00202440000000003',2),(52,7.92,8.9,0.1,1.22,0,'2020-10-31 08:07:59','00202440000000003',1),(53,8.58,8.97,0.49,1.86,0,'2020-10-31 08:07:59','00202440000000003',2),(54,8.27,6.46,0.13,6.7,0,'2020-10-31 08:07:59','00202440000000003',4),(55,8.26,8.86,0.02,0.97,0,'2020-10-31 08:07:59','00202440000000003',1),(56,8.31,16.12,0.32,4.82,0,'2020-10-31 08:07:59','00202440000000003',3),(57,8.05,10.82,0.06,3.19,0,'2020-10-31 08:07:59','00202440000000003',2),(58,7.88,8.58,0,3.63,0,'2020-10-31 08:07:59','00202440000000003',2),(59,8.91,8.85,0.32,3.24,0,'2020-10-31 08:07:59','00202440000000003',2),(60,7.78,7.72,0.21,4.65,0,'2020-10-31 08:07:59','00202440000000004',3),(61,7.23,5.57,0.14,1.44,0,'2020-10-31 08:07:59','00202440000000004',3),(62,6.66,8.26,0.06,0.86,0,'2020-10-31 08:07:59','00202440000000004',1),(63,7.7,10.38,0.19,2.1,0,'2020-10-31 08:07:59','00202440000000004',2),(64,7.51,12.36,0.13,5.43,0,'2020-10-31 08:07:59','00202440000000004',3),(65,7.62,10.47,0.17,0,0,'2020-10-31 08:07:59','00202440000000004',2),(66,9.19,9.94,0.16,2.48,0,'2020-10-31 08:07:59','00202440000000004',5),(67,8.23,11.64,0.16,2.36,0,'2020-10-31 08:07:59','00202440000000004',2),(68,8.91,7.25,0,2.5,20,'2020-10-31 08:07:59','00202440000000004',2),(69,8.06,7.28,0.29,4.2,0,'2020-10-31 08:07:59','00202440000000004',3),(70,7.84,8.69,0,1.98,0,'2020-10-31 08:07:59','00202440000000004',1),(71,8.74,11.66,0,4.02,0,'2020-10-31 08:07:59','00202440000000004',3),(72,8.53,11.06,0.21,3.79,0,'2020-10-31 08:07:59','00202440000000004',2),(73,7.59,9.29,0.15,1.83,0,'2020-10-31 08:07:59','00202440000000004',1),(74,7.39,6.31,0.44,8.9,0,'2020-10-31 08:07:59','00202440000000004',4),(75,7.97,10.35,2.73,0.67,0,'2020-10-31 08:07:59','00202440000000004',5),(76,8.45,10.7,0,7.73,0,'2020-10-31 08:07:59','00202440000000004',4),(77,8.66,9.63,0.36,5.97,0,'2020-10-31 08:07:59','00202440000000004',3),(78,8.3,14.6,0.46,3.5,0,'2020-10-31 08:07:59','00202440000000004',2),(79,8.68,13.17,0.07,8.33,0,'2020-10-31 08:07:59','00202440000000004',4),(80,6.44,7.96,0.84,3.4,2.37292,'2020-10-31 08:07:59','00202440000000005',3),(81,7.95,9.39,0.1,1.48,0,'2020-10-31 08:07:59','00202440000000005',1),(82,8.17,9.16,0.09,4.12,0,'2020-10-31 08:07:59','00202440000000005',3),(83,7.66,11.69,0.05,2,0,'2020-10-31 08:07:59','00202440000000005',1),(84,8.23,10.47,0.29,2.62,0,'2020-10-31 08:07:59','00202440000000005',2),(85,7.81,8.5,0.14,1.69,0,'2020-10-31 08:07:59','00202440000000005',1),(86,7.73,10.63,0,4.18,0,'2020-10-31 08:07:59','00202440000000005',3),(87,8.58,8.97,0.49,1.86,0,'2020-10-31 08:07:59','00202440000000005',2),(88,8.44,12.26,0.05,6.22,0,'2020-10-31 08:07:59','00202440000000005',4),(89,8.8,10.66,0.19,2.63,0,'2020-10-31 08:07:59','00202440000000005',2),(90,7.82,8.65,0.14,1.88,0,'2020-10-31 08:07:59','00202440000000005',1),(91,7.78,8.44,0.12,3.65,0,'2020-10-31 08:07:59','00202440000000005',2),(92,8.88,10.64,0.44,0,0,'2020-10-31 08:07:59','00202440000000005',2),(93,8.06,11.01,0.95,5.15,2.5,'2020-10-31 08:07:59','00202440000000005',3),(94,8.28,10.1,0.08,2.67,0,'2020-10-31 08:07:59','00202440000000005',2),(95,8.52,9.32,0.73,3.97,0,'2020-10-31 08:07:59','00202440000000005',3),(96,6.96,13.59,0.42,0,0,'2020-10-31 08:07:59','00202440000000005',2),(97,7.67,8.02,0.18,2.91,0,'2020-10-31 08:07:59','00202440000000005',2),(98,7.8,9.56,0.27,4.78,0,'2020-10-31 08:07:59','00202440000000005',3),(99,7.64,13.32,0.26,4.67,0,'2020-10-31 08:07:59','00202440000000005',3),(100,8.38,10.14,0.15,2.82,0,'2020-10-31 08:07:59','00202440000000006',2),(101,7.48,9.1,0.24,2.73,0,'2020-10-31 08:07:59','00202440000000006',2),(102,7.8,7.33,0.11,1,0,'2020-10-31 08:07:59','00202440000000006',2),(103,7.83,11.68,0.14,3.61,0,'2020-10-31 08:07:59','00202440000000006',2),(104,7.07,4.49,0.9,6.78,0,'2020-10-31 08:07:59','00202440000000006',4),(105,7.79,8.26,0.09,1.58,0,'2020-10-31 08:07:59','00202440000000006',1),(106,7.12,8.6,0.12,0,0,'2020-10-31 08:07:59','00202440000000006',1),(107,8.13,9.49,0.37,2.02,0,'2020-10-31 08:07:59','00202440000000006',2),(108,7.04,3.34,0.65,4.3,0,'2020-10-31 08:07:59','00202440000000006',4),(109,7.73,9.72,0.15,0,0,'2020-10-31 08:07:59','00202440000000006',1),(110,7.41,13.2,0.34,5.71,0,'2020-10-31 08:07:59','00202440000000006',3),(111,7.55,9.1,0.31,1.9,0,'2020-10-31 08:07:59','00202440000000006',2),(112,6.46,8.52,0.79,3.66,2.575,'2020-10-31 08:07:59','00202440000000006',3),(113,7.07,4.49,0.9,6.78,0,'2020-10-31 08:07:59','00202440000000006',4),(114,8.1,10.76,0.2,5.19,0.8,'2020-10-31 08:07:59','00202440000000006',3),(115,8.75,9.73,0.26,3.83,0,'2020-10-31 08:07:59','00202440000000006',2),(116,7.83,9.8,0.31,4.72,0,'2020-10-31 08:07:59','00202440000000006',3),(117,8.47,12.98,0.05,4.38,0,'2020-10-31 08:07:59','00202440000000006',3),(118,8.28,10.1,0.08,2.67,0,'2020-10-31 08:07:59','00202440000000006',2),(119,7.97,10.35,0.41,0.22,0,'2020-10-31 08:07:59','00202440000000006',2),(120,7.82,7.42,0.11,1.37,0,'2020-10-31 08:07:59','00202440000000007',2),(121,7.71,8.3,0.13,0,0,'2020-10-31 08:07:59','00202440000000007',1),(122,7.89,8.79,0.11,1.83,0,'2020-10-31 08:07:59','00202440000000007',1),(123,7.81,8.46,0.14,1.79,0,'2020-10-31 08:07:59','00202440000000007',1),(124,7.6,9.34,0.24,2.27,0,'2020-10-31 08:07:59','00202440000000007',2),(125,8.66,9.58,0.35,5.9,0,'2020-10-31 08:07:59','00202440000000007',3),(126,7.08,8.61,0.05,0,0,'2020-10-31 08:07:59','00202440000000007',1),(127,7,3.11,0.52,4.16,0,'2020-10-31 08:07:59','00202440000000007',4),(128,7.81,12.15,0.14,3.7,0,'2020-10-31 08:07:59','00202440000000007',2),(129,7.39,6.31,0.44,8.9,0,'2020-10-31 08:07:59','00202440000000007',4),(130,8.33,10.48,0.11,3.04,0,'2020-10-31 08:07:59','00202440000000007',2),(131,7.6,9.02,0.05,1.03,0,'2020-10-31 08:07:59','00202440000000007',1),(132,8.46,10.8,0,7.71,0,'2020-10-31 08:07:59','00202440000000007',4),(133,8.15,10.02,0.36,1.84,0,'2020-10-31 08:07:59','00202440000000007',2),(134,8.26,11.77,0.17,2.34,0,'2020-10-31 08:07:59','00202440000000007',2),(135,8.77,10.86,0.18,2.58,0,'2020-10-31 08:07:59','00202440000000007',2),(136,8.8,11.5,0.06,3.67,0,'2020-10-31 08:07:59','00202440000000007',2),(137,8.57,12.71,0.07,6.89,0,'2020-10-31 08:07:59','00202440000000007',4),(138,8.27,7.82,0.14,1.7,0,'2020-10-31 08:07:59','00202440000000007',1),(139,7.71,10.06,0.19,3.01,0,'2020-10-31 08:07:59','00202440000000007',2),(140,6.95,8.34,0,1.33,0,'2020-10-31 08:07:59','00202440000000008',1),(141,8.5,10.98,0.18,3.66,0,'2020-10-31 08:07:59','00202440000000008',2),(142,8.91,8.85,0.32,3.24,0,'2020-10-31 08:07:59','00202440000000008',2),(143,7.81,8.16,0.12,3.07,0,'2020-10-31 08:07:59','00202440000000008',2),(144,7.7,10.38,0.19,2.1,0,'2020-10-31 08:07:59','00202440000000008',2),(145,7.64,10.76,0,4.11,0,'2020-10-31 08:07:59','00202440000000008',3),(146,8.11,10.97,0.1,3.14,0,'2020-10-31 08:07:59','00202440000000008',2),(147,7.74,7.83,0,3.57,0,'2020-10-31 08:07:59','00202440000000008',2),(148,7.25,5.49,0,1.36,0,'2020-10-31 08:07:59','00202440000000008',3),(149,8.62,9.2,0.54,1.02,0,'2020-10-31 08:07:59','00202440000000008',3),(150,7.36,13.08,0.14,4.72,0,'2020-10-31 08:07:59','00202440000000008',3),(151,7.8,7.77,0.14,4.55,0,'2020-10-31 08:07:59','00202440000000008',3),(152,7.91,8.98,0,1.14,0,'2020-10-31 08:07:59','00202440000000008',1),(153,8.33,9.5,0.22,2.64,0,'2020-10-31 08:07:59','00202440000000008',2),(154,8.71,11.05,0.44,0,0,'2020-10-31 08:07:59','00202440000000008',2),(155,8.94,7.21,0.14,2.48,20,'2020-10-31 08:07:59','00202440000000008',2),(156,7.69,11.57,0.05,1.16,0,'2020-10-31 08:07:59','00202440000000008',1),(157,8.16,7.3,0.29,5,0,'2020-10-31 08:07:59','00202440000000008',3),(158,7.85,8.75,0,1.3,0,'2020-10-31 08:07:59','00202440000000008',1),(159,7.06,9.23,0.29,3.15,0,'2020-10-31 08:07:59','00202440000000008',2),(160,7.91,8.96,0.09,4.21,0,'2020-10-31 08:07:59','00202440000000009',3),(161,7.42,9.3,0.25,6.49,0,'2020-10-31 08:07:59','00202440000000009',4),(162,8.28,16.94,0.22,4.05,0,'2020-10-31 08:07:59','00202440000000009',3),(163,7.52,10.48,0.17,0,0,'2020-10-31 08:07:59','00202440000000009',2),(164,7.7,8.12,0.19,2.99,0,'2020-10-31 08:07:59','00202440000000009',2),(165,8.38,16.75,0.28,5.15,0,'2020-10-31 08:07:59','00202440000000009',3),(166,7.96,9.43,0.16,1.4,0,'2020-10-31 08:07:59','00202440000000009',2),(167,7.56,7.81,0,2.7,0,'2020-10-31 08:07:59','00202440000000009',2),(168,7.83,8.1,0.14,4.19,0,'2020-10-31 08:07:59','00202440000000009',3),(169,8.24,11.86,0.26,2.23,0,'2020-10-31 08:07:59','00202440000000009',2),(170,8.33,8.09,0.14,1.1,0,'2020-10-31 08:07:59','00202440000000009',1),(171,7.67,9.95,0.19,3.07,0,'2020-10-31 08:07:59','00202440000000009',2),(172,8.29,17.28,0.31,4.3,0,'2020-10-31 08:07:59','00202440000000009',3),(173,7.91,9.1,0.07,0.95,0,'2020-10-31 08:07:59','00202440000000009',1),(174,7.89,10.3,0.38,1.96,0,'2020-10-31 08:07:59','00202440000000009',2),(175,7.93,9.25,0.07,4.07,0,'2020-10-31 08:07:59','00202440000000009',3),(176,8.87,7.33,0.1,2.5,20,'2020-10-31 08:07:59','00202440000000009',2),(177,8.86,11.2,0.15,2.33,0,'2020-10-31 08:07:59','00202440000000009',2),(178,7.74,7.83,0,3.57,0,'2020-10-31 08:07:59','00202440000000009',2),(179,7.77,13.35,0.38,9.35,0,'2020-10-31 08:07:59','00202440000000009',4),(180,7.97,8.84,0.18,1.92,0,'2020-10-31 08:07:59','00202440000000010',2),(181,8.91,8.85,0.32,3.24,0,'2020-10-31 08:07:59','00202440000000010',2),(182,8.28,10.1,0.08,2.67,0,'2020-10-31 08:07:59','00202440000000010',2),(183,7.41,13.1,0.14,4.65,0,'2020-10-31 08:07:59','00202440000000010',3),(184,8.19,11.17,0.22,5.05,0.8,'2020-10-31 08:07:59','00202440000000010',3),(185,7.23,5.1,0.02,1.55,0,'2020-10-31 08:07:59','00202440000000010',3),(186,7.82,11.97,0.15,3.57,0,'2020-10-31 08:07:59','00202440000000010',2),(187,7.81,8.25,0.13,3.19,0,'2020-10-31 08:07:59','00202440000000010',2),(188,8.56,8.69,0.48,1.05,0,'2020-10-31 08:07:59','00202440000000010',2),(189,7.76,11.67,0.05,1.83,0,'2020-10-31 08:07:59','00202440000000010',1),(190,7.5,8.98,0.36,1.88,0,'2020-10-31 08:07:59','00202440000000010',2),(191,8.71,11.13,0.43,0,0,'2020-10-31 08:07:59','00202440000000010',2),(192,8.67,10.29,0.41,5.9,0,'2020-10-31 08:07:59','00202440000000010',3),(193,8.33,10.48,0.11,3.04,0,'2020-10-31 08:07:59','00202440000000010',2),(194,7,2.67,0.68,3.91,0,'2020-10-31 08:07:59','00202440000000010',5),(195,8.16,7.3,0.29,5,0,'2020-10-31 08:07:59','00202440000000010',3),(196,7.57,7.71,0,2.84,0,'2020-10-31 08:07:59','00202440000000010',2),(197,8.8,9.7,0.18,3.8,0,'2020-10-31 08:07:59','00202440000000010',2),(198,7.55,9.49,0.24,6.77,0,'2020-10-31 08:07:59','00202440000000010',4),(199,7.88,10.3,0.3,5.03,0,'2020-10-31 08:07:59','00202440000000010',3),(200,7.35,9.38,0.27,2.69,0,'2020-10-31 08:07:59','00202440000000011',2),(201,7.82,7.42,0.11,1.37,0,'2020-10-31 08:07:59','00202440000000011',2),(202,8.15,10.02,0.36,1.84,0,'2020-10-31 08:07:59','00202440000000011',2),(203,8.5,11.72,0,8.42,0,'2020-10-31 08:07:59','00202440000000011',4),(204,8.47,12.98,0.05,4.38,0,'2020-10-31 08:07:59','00202440000000011',3),(205,7.52,10.48,0.17,0,0,'2020-10-31 08:07:59','00202440000000011',2),(206,7.7,10.38,0.19,2.1,0,'2020-10-31 08:07:59','00202440000000011',2),(207,8.57,11.34,0.23,3.7,0,'2020-10-31 08:07:59','00202440000000011',2),(208,8.25,17.12,0.3,5.11,0,'2020-10-31 08:07:59','00202440000000011',3),(209,7.67,8.26,0,0,0,'2020-10-31 08:07:59','00202440000000011',1),(210,8.13,10.99,0.1,3.14,0,'2020-10-31 08:07:59','00202440000000011',2),(211,7.62,11.12,0,3.86,0,'2020-10-31 08:07:59','00202440000000011',2),(212,7.85,8.5,0.15,1.77,0,'2020-10-31 08:07:59','00202440000000011',1),(213,7.39,6.31,0.44,8.9,0,'2020-10-31 08:07:59','00202440000000011',4),(214,7.71,8.16,0.17,2.8,0,'2020-10-31 08:07:59','00202440000000011',2),(215,7.07,4.49,0.9,6.78,0,'2020-10-31 08:07:59','00202440000000011',4),(216,7.96,9.41,0.17,1.34,0,'2020-10-31 08:07:59','00202440000000011',2),(217,7.34,8.72,0.25,5.39,0,'2020-10-31 08:07:59','00202440000000011',3),(218,7.06,8.63,0.07,0,0,'2020-10-31 08:07:59','00202440000000011',1),(219,7.88,8.81,0,1.3,0,'2020-10-31 08:07:59','00202440000000011',1),(220,6.5,8.43,1.16,3.7,2.61,'2020-10-31 08:07:59','00202440000000012',4),(221,6.95,8.34,0,1.33,0,'2020-10-31 08:07:59','00202440000000012',1),(222,8.8,12.64,0.08,5.84,0,'2020-10-31 08:07:59','00202440000000012',3),(223,7.83,11.23,0.05,1.19,0,'2020-10-31 08:07:59','00202440000000012',1),(224,8.3,9.58,0.18,2.37,0,'2020-10-31 08:07:59','00202440000000012',2),(225,8.8,11.5,0.06,3.67,0,'2020-10-31 08:07:59','00202440000000012',2),(226,8.37,5.97,0.2,3.1,0,'2020-10-31 08:07:59','00202440000000012',3),(227,7.96,10.25,0.04,4.73,0,'2020-10-31 08:07:59','00202440000000012',3),(228,7.15,11.1,0.29,4.51,0,'2020-10-31 08:07:59','00202440000000012',3),(229,7.47,6.73,0.62,4.64,0,'2020-10-31 08:07:59','00202440000000012',3),(230,8.91,8.85,0.32,3.24,0,'2020-10-31 08:07:59','00202440000000012',2),(231,8.4,9.82,0.25,3.91,0,'2020-10-31 08:07:59','00202440000000012',2),(232,7.95,8.33,0.49,4.05,0,'2020-10-31 08:07:59','00202440000000012',3),(233,7.56,7.78,0,3.6,0,'2020-10-31 08:07:59','00202440000000012',2),(234,7.75,10.52,0.21,0,0,'2020-10-31 08:07:59','00202440000000012',2),(235,7.39,13.2,0.06,6.01,0,'2020-10-31 08:07:59','00202440000000012',4),(236,6.12,9.17,0.8,2.84,2.505,'2020-10-31 08:07:59','00202440000000012',3),(237,8.54,9.73,0.57,2.2,0,'2020-10-31 08:07:59','00202440000000012',3),(238,8.31,12,0.18,3.24,0,'2020-10-31 08:07:59','00202440000000012',2),(239,8.21,7.7,0.28,3.8,0,'2020-10-31 08:07:59','00202440000000012',2),(240,8.13,9.88,0.46,1.69,0,'2020-10-31 08:07:59','00202440000000013',2),(241,8.15,11.98,0.14,3.6,0.6,'2020-10-31 08:07:59','00202440000000013',2),(242,8.26,12.72,0.11,3.1,0,'2020-10-31 08:07:59','00202440000000013',2),(243,7.77,11.43,0.13,3.01,0,'2020-10-31 08:07:59','00202440000000013',2),(244,7.92,8.89,0.16,0,0,'2020-10-31 08:07:59','00202440000000013',2),(245,7.19,7.46,0.03,1.25,0,'2020-10-31 08:07:59','00202440000000013',2),(246,7.89,8.52,0.13,1.3,0,'2020-10-31 08:07:59','00202440000000013',1),(247,8.58,15.45,0.05,5.34,0,'2020-10-31 08:07:59','00202440000000013',3),(248,8,10.88,0.19,4.18,0,'2020-10-31 08:07:59','00202440000000013',3),(249,7.78,7.44,0,2.24,0,'2020-10-31 08:07:59','00202440000000013',2),(250,8.53,15.07,0.06,5.28,0,'2020-10-31 08:07:59','00202440000000013',3),(251,8.28,10.1,0.08,2.67,0,'2020-10-31 08:07:59','00202440000000013',2),(252,7.7,10.38,0.19,2.1,0,'2020-10-31 08:07:59','00202440000000013',2),(253,8.94,10.77,0.23,4.79,0,'2020-10-31 08:07:59','00202440000000013',3),(254,7.71,11.43,0.14,3.94,0,'2020-10-31 08:07:59','00202440000000013',2),(255,7,8.57,0.27,2.65,0,'2020-10-31 08:07:59','00202440000000013',2),(256,8.17,12.64,0.19,2.4,0,'2020-10-31 08:07:59','00202440000000013',2),(257,7.09,11.54,0.53,9.47,0,'2020-10-31 08:07:59','00202440000000013',4),(258,7.29,3.87,0.67,5,0,'2020-10-31 08:07:59','00202440000000013',4),(259,7.52,10.18,0.16,2.87,0,'2020-10-31 08:07:59','00202440000000013',2),(260,7.7,12.58,0,1.88,0,'2020-10-31 08:07:59','00202440000000014',1),(261,7.11,11.1,0.25,5.36,0,'2020-10-31 08:07:59','00202440000000014',3),(262,7.75,11.66,0.15,2.96,0,'2020-10-31 08:07:59','00202440000000014',2),(263,6.37,9.05,0.79,2.9,2.465,'2020-10-31 08:07:59','00202440000000014',3),(264,8.66,16.21,0.02,4.73,0,'2020-10-31 08:07:59','00202440000000014',3),(265,7.98,9.05,0.13,0,0,'2020-10-31 08:07:59','00202440000000014',1),(266,7.37,8.65,0.06,1.1,0,'2020-10-31 08:07:59','00202440000000014',1),(267,7.67,8.28,0,4.57,0,'2020-10-31 08:07:59','00202440000000014',3),(268,8.42,10.6,0.52,0,0,'2020-10-31 08:07:59','00202440000000014',3),(269,8.15,10.97,0.17,2.68,0,'2020-10-31 08:07:59','00202440000000014',2),(270,7.47,8.64,0.26,2.47,0,'2020-10-31 08:07:59','00202440000000014',2),(271,7.17,10.5,0,4.12,0,'2020-10-31 08:07:59','00202440000000014',3),(272,7.46,8.73,0.46,1.2,0,'2020-10-31 08:07:59','00202440000000014',2),(273,7.93,9.58,0.17,0.86,0,'2020-10-31 08:07:59','00202440000000014',2),(274,7.91,9.47,0.08,1.62,0,'2020-10-31 08:07:59','00202440000000014',1),(275,8.37,5.97,0.2,3.1,0,'2020-10-31 08:07:59','00202440000000014',3),(276,7.2,4.22,0.5,4.75,0,'2020-10-31 08:07:59','00202440000000014',4),(277,8.04,2.38,0.13,4.15,0,'2020-10-31 08:07:59','00202440000000014',5),(278,7.74,10.06,0.27,4.49,0,'2020-10-31 08:07:59','00202440000000014',3),(279,8.22,11.3,0,2.61,0,'2020-10-31 08:07:59','00202440000000014',2),(280,6.96,8.27,0.26,2.64,0,'2020-10-31 08:07:59','00202440000000015',2),(281,7.87,8.55,0.12,1.45,0,'2020-10-31 08:07:59','00202440000000015',1),(282,7.95,9.75,0,1.66,0,'2020-10-31 08:07:59','00202440000000015',1),(283,7.9,7.76,0.12,1.23,0,'2020-10-31 08:07:59','00202440000000015',1),(284,8.67,14.25,0,9.43,0,'2020-10-31 08:07:59','00202440000000015',4),(285,7.7,10.38,0.19,2.1,0,'2020-10-31 08:07:59','00202440000000015',2),(286,8.09,9.38,0.24,2.02,0,'2020-10-31 08:07:59','00202440000000015',2),(287,8.5,15.56,0.08,5.66,0,'2020-10-31 08:07:59','00202440000000015',3),(288,7.75,10.52,0.21,0,0,'2020-10-31 08:07:59','00202440000000015',2),(289,8.5,9.3,0.57,2.2,0,'2020-10-31 08:07:59','00202440000000015',3),(290,8.62,10.37,0.06,6.14,0,'2020-10-31 08:07:59','00202440000000015',4),(291,7.65,8.58,0.06,2.32,0,'2020-10-31 08:07:59','00202440000000015',2),(292,8.91,8.85,0.32,3.24,0,'2020-10-31 08:07:59','00202440000000015',2),(293,8,10.88,0.19,4.18,0,'2020-10-31 08:07:59','00202440000000015',3),(294,8.12,12.63,0.25,3.71,0.9,'2020-10-31 08:07:59','00202440000000015',2),(295,7.67,12.77,0,1.91,0,'2020-10-31 08:07:59','00202440000000015',1),(296,7.78,8.22,0.22,4.19,0,'2020-10-31 08:07:59','00202440000000015',3),(297,8.24,7.56,0.26,4.66,0,'2020-10-31 08:07:59','00202440000000015',3),(298,8.36,12.18,0.2,3.54,0,'2020-10-31 08:07:59','00202440000000015',2),(299,7.52,9.63,0.19,1.88,0,'2020-10-31 08:07:59','00202440000000015',2),(300,8.16,9.69,0,3.99,0,'2020-10-31 08:07:59','00202440000000016',2),(301,8.52,8.5,0.09,2.29,20,'2020-10-31 08:07:59','00202440000000016',2),(302,8.85,10.37,0.08,3.37,0,'2020-10-31 08:07:59','00202440000000016',2),(303,7.39,13.8,1.55,5.21,0,'2020-10-31 08:07:59','00202440000000016',5),(304,7.69,10.64,0.32,3.37,0,'2020-10-31 08:07:59','00202440000000016',2),(305,8.1,9.75,0.47,1.75,0,'2020-10-31 08:07:59','00202440000000016',2),(306,7.2,7.76,0,1.16,0,'2020-10-31 08:07:59','00202440000000016',1),(307,8.28,10.1,0.08,2.67,0,'2020-10-31 08:07:59','00202440000000016',2),(308,7.47,6.73,0.62,4.64,0,'2020-10-31 08:07:59','00202440000000016',3),(309,7.75,7.58,0,1.4,0,'2020-10-31 08:07:59','00202440000000016',1),(310,7.7,11.45,0.13,3.78,0,'2020-10-31 08:07:59','00202440000000016',2),(311,8.19,12.52,0.16,2.26,0,'2020-10-31 08:07:59','00202440000000016',2),(312,7.57,12.73,0.61,9.29,0,'2020-10-31 08:07:59','00202440000000016',4),(313,7.7,10.06,0.15,5.25,0,'2020-10-31 08:07:59','00202440000000016',3),(314,8.09,7.32,0.2,4,0,'2020-10-31 08:07:59','00202440000000016',2),(315,8.24,10.01,0.11,0.72,0,'2020-10-31 08:07:59','00202440000000016',1),(316,8.01,9.46,0.23,2,0,'2020-10-31 08:07:59','00202440000000016',2),(317,8.64,13.73,0,8.72,0,'2020-10-31 08:07:59','00202440000000016',4),(318,7.55,9.52,0.23,1.84,0,'2020-10-31 08:07:59','00202440000000016',2),(319,7.49,7.22,0,6.58,0,'2020-10-31 08:07:59','00202440000000016',4),(324,8.34,10.56,0.39,6.82,1.09,'2020-10-31 08:14:47','00202440000000001',4),(325,8,12.11,0.13,1.24,0.85,'2020-10-31 08:14:47','00202440000000002',1),(326,8.27,9.63,0.3,2.49,0.056,'2020-10-31 08:15:52','00202440000000003',2),(327,7.8,8.58,0.18,1.83,0.095,'2020-10-31 08:15:52','00202440000000004',2),(328,8.34,9.95,0.32,6.82,0.035,'2020-10-31 08:17:35','00202440000000005',4),(329,7.77,13.37,0.18,2.75,0,'2020-10-31 08:17:35','00202440000000006',2),(330,7.91,11.25,2.73,3.4,0,'2020-10-31 08:18:37','00202440000000007',6),(331,7.71,11.16,0.05,1.48,0,'2020-10-31 08:18:37','00202440000000008',1),(332,8.05,10.14,0.16,2.22,0,'2020-10-31 08:19:41','00202440000000009',2),(333,7.47,6.73,0.62,4.64,0,'2020-10-31 08:19:41','00202440000000010',3),(334,6.8,9.35,0.13,4.85,0,'2020-10-31 08:20:56','00202440000000011',3),(335,8.2,11.96,0.51,5.28,1.1,'2020-10-31 08:20:56','00202440000000012',3),(336,6.74,7.19,0.14,6.03,0,'2020-10-31 08:22:06','00202440000000013',4),(337,8.43,10.85,0.24,2.18,0,'2020-10-31 08:22:06','00202440000000014',2),(338,7.75,10.52,0.21,0,0,'2020-10-31 08:22:57','00202440000000015',2),(339,7.72,11.23,0.41,0,0,'2020-10-31 08:22:57','00202440000000016',2);
/*!40000 ALTER TABLE `waterdata` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-31 17:18:41
