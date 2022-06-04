-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: common_db
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

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
-- Table structure for table `log_login`
--

DROP TABLE IF EXISTS `log_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_login` (
  `loginId` varchar(100) DEFAULT NULL COMMENT '主键 用户登录信息ID',
  `requestId` int NOT NULL COMMENT 'http 请求 id 外键',
  `userId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户ID',
  `time` datetime DEFAULT NULL COMMENT '登录时间',
  `ip` varchar(100) DEFAULT NULL COMMENT '登录的 IP 地址',
  PRIMARY KEY (`requestId`),
  KEY `log_login_FK` (`userId`),
  CONSTRAINT `log_login_FK` FOREIGN KEY (`userId`) REFERENCES `test_user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户的登录日志信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_login`
--

LOCK TABLES `log_login` WRITE;
/*!40000 ALTER TABLE `log_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_request`
--

DROP TABLE IF EXISTS `log_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_request` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键ID 请求id',
  `clientIp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '请求的客户端Ip',
  `protocol` varchar(10) DEFAULT NULL COMMENT '协议',
  `clientPort` int DEFAULT NULL COMMENT '客户端端口',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '请求的路径信息',
  `header` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '请求头',
  `date` datetime DEFAULT NULL COMMENT '请求时间',
  `timeLength` int DEFAULT NULL COMMENT '请求的时间长度（毫秒）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户请求日志信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_request`
--

--
-- Table structure for table `log_system`
--

DROP TABLE IF EXISTS `log_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_system` (
  `logId` varchar(10) NOT NULL COMMENT '日志id',
  `requestId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'http 请求 id（外键）',
  `userId` varchar(100) DEFAULT NULL COMMENT '日志用户ID（外键）',
  `package` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日志所在的包名',
  `classname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日志的类名',
  `methods` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日志的方法名称',
  `linenum` int DEFAULT NULL COMMENT '打印日志的行号',
  `content` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '日志的内容',
  `logTime` datetime DEFAULT NULL COMMENT '日志的时间',
  `threadName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '线程名称',
  PRIMARY KEY (`logId`),
  KEY `system_log_FK` (`userId`),
  KEY `log_system_FK` (`requestId`),
  CONSTRAINT `log_system_FK` FOREIGN KEY (`requestId`) REFERENCES `log_request` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='系统运行的日志信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_system`
--

LOCK TABLES `log_system` WRITE;
/*!40000 ALTER TABLE `log_system` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_user`
--

DROP TABLE IF EXISTS `test_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_user` (
  `userId` varchar(100) NOT NULL COMMENT '用户编号 主键',
  `userName` varchar(100) DEFAULT NULL COMMENT '用户昵称',
  `userNum` varchar(100) DEFAULT NULL COMMENT '用户帐号',
  `userPwd` varchar(100) DEFAULT NULL COMMENT '用户密码',
  `address` varchar(100) DEFAULT NULL COMMENT '用户地址',
  `remark` varchar(100) DEFAULT NULL COMMENT '用户备注',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_user`
--

LOCK TABLES `test_user` WRITE;
/*!40000 ALTER TABLE `test_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-04 20:03:00
