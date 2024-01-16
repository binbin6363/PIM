-- MySQL dump 10.13  Distrib 8.0.31, for macos12.6 (x86_64)
--
-- Host: 127.0.0.1    Database: db_pim
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contacts`
--

-- create database db_pim DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_general_ci;
use db_pim;
set names utf8;

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` bigint unsigned NOT NULL COMMENT 'ID',
  `contact_id` bigint unsigned NOT NULL COMMENT 'ID',
  `remark_name` varchar(64) NOT NULL,
  `status` int unsigned NOT NULL COMMENT '0123',
  `sequence` bigint unsigned NOT NULL,
  `create_time` int unsigned NOT NULL,
  `update_time` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uid` (`uid`,`contact_id`),
  KEY `key_remark_name` (`remark_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,10001,10000,'polite',1,1,1670750546,1670750546),(2,10000,10001,'anjin',1,1,1670750574,1670750574);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conversations` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` bigint unsigned NOT NULL COMMENT 'ID',
  `contact_id` bigint unsigned NOT NULL COMMENT 'ID',
  `conversation_type` int unsigned NOT NULL COMMENT '1,;2,;3,',
  `conversation_name` varchar(64) NOT NULL,
  `conversation_status` int unsigned NOT NULL COMMENT '01',
  `unread` int unsigned NOT NULL COMMENT 'uid',
  `msg_digest` varchar(64) NOT NULL,
  `sequence` bigint unsigned NOT NULL COMMENT 'ID',
  `create_time` int unsigned NOT NULL,
  `update_time` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_id` (`uid`,`contact_id`,`conversation_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_messages`
--

DROP TABLE IF EXISTS `group_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `groupid` bigint unsigned NOT NULL COMMENT 'ID',
  `msgid` bigint unsigned NOT NULL COMMENT 'ID',
  `senderid` bigint unsigned NOT NULL COMMENT 'ID',
  `msg_type` int unsigned NOT NULL COMMENT '1,;',
  `content` varchar(4096) NOT NULL,
  `msg_status` int unsigned NOT NULL COMMENT '012',
  `client_msgid` bigint unsigned NOT NULL,
  `create_time` int unsigned NOT NULL,
  `update_time` int unsigned NOT NULL,
  `media` varchar(4096) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_client_msgid` (`senderid`,`client_msgid`),
  UNIQUE KEY `key_id` (`msgid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_messages`
--

LOCK TABLES `group_messages` WRITE;
/*!40000 ALTER TABLE `group_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `single_messages`
--

DROP TABLE IF EXISTS `single_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `single_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` bigint unsigned NOT NULL COMMENT 'ID',
  `msgid` bigint unsigned NOT NULL COMMENT 'ID',
  `senderid` bigint unsigned NOT NULL COMMENT 'ID',
  `receiverid` bigint unsigned NOT NULL COMMENT 'ID',
  `msg_type` int unsigned NOT NULL COMMENT '1,;',
  `content` varchar(4096) NOT NULL,
  `msg_status` int unsigned NOT NULL COMMENT '012',
  `client_msgid` bigint unsigned NOT NULL,
  `create_time` int unsigned NOT NULL,
  `update_time` int unsigned NOT NULL,
  `media` varchar(4096) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_client_msgid` (`senderid`,`client_msgid`),
  UNIQUE KEY `key_id` (`msgid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `single_messages`
--

LOCK TABLES `single_messages` WRITE;
/*!40000 ALTER TABLE `single_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `single_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_infos`
--

DROP TABLE IF EXISTS `user_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_infos` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `uid` bigint unsigned NOT NULL COMMENT 'ID',
  `username` varchar(64) NOT NULL,
  `passhash` varchar(64) NOT NULL,
  `nickname` varchar(64) NOT NULL,
  `phone` varchar(16) NOT NULL,
  `email` varchar(64) NOT NULL,
  `avatar` varchar(128) NOT NULL,
  `gender` int NOT NULL COMMENT '01',
  `user_tag` varchar(128) NOT NULL,
  `motto` varchar(128) NOT NULL,
  `create_time` int unsigned NOT NULL,
  `update_time` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_uid` (`uid`),
  UNIQUE KEY `key_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10002 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_infos`
--

LOCK TABLES `user_infos` WRITE;
/*!40000 ALTER TABLE `user_infos` DISABLE KEYS */;
INSERT INTO `user_infos` VALUES (10000,10001,'anjintang','$2a$14$88iJm.lKOIrtSHsyLkuE0OX87iamtMCJac93Y9IJVu562ERNqM7d6','anjin','17621540179','136800712@qq.com','https://scpic.chinaz.net/files/default/imgs/2022-11-28/310b05216a3ca619.jpg',2,'cs','çˆ±ç”Ÿæ´»çˆ±æ‹‰èŠ³',1670750492,1670750492),(10001,10000,'politewang','$2a$14$y/vJU.WtPvWS4K76AFtezuwsmKb7XLL9mJxKp4EytQbo3blBLQN/u','polite','17621540179','136800712@qq.com','https://scpic.chinaz.net/files/default/imgs/2022-10-28/64fb6542ca7a061a.jpg',2,'cs','é˜³å…‰æ€»åœ¨é£Žé›¨åŽ',1670750524,1670750524);
/*!40000 ALTER TABLE `user_infos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-11 22:08:44
