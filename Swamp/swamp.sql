-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: swamp
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
-- Table structure for table `Bin`
--

DROP TABLE IF EXISTS `Bin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bin` (
  `id` varchar(255) COLLATE utf8_bin NOT NULL,
  `locX` double NOT NULL,
  `locY` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bin`
--

LOCK TABLES `Bin` WRITE;
/*!40000 ALTER TABLE `Bin` DISABLE KEYS */;
INSERT INTO `Bin` VALUES ('b8:27:eb:13:eb:d2@iotigniteagent',35.248807,33.022496),('c0:27:eb:13:eb:d2@iotigniteagent',35.257935,33.02336),('c1:27:eb:13:eb:d2@iotigniteagent',10.5,10.5),('c2:27:eb:13:eb:d2@iotigniteagent',13.5,13.5);
/*!40000 ALTER TABLE `Bin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recycled`
--

DROP TABLE IF EXISTS `Recycled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Recycled` (
  `binId` varchar(255) COLLATE utf8_bin NOT NULL,
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  `amount` double NOT NULL,
  `dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`binId`,`username`,`dt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recycled`
--

LOCK TABLES `Recycled` WRITE;
/*!40000 ALTER TABLE `Recycled` DISABLE KEYS */;
INSERT INTO `Recycled` VALUES ('b8:27:eb:13:eb:d2@iotigniteagent','alis',1.2,'2017-03-18 23:25:14'),('b8:27:eb:13:eb:d2@iotigniteagent','alis',1.2,'2017-03-18 23:39:12'),('b8:27:eb:13:eb:d2@iotigniteagent','alis',1.2,'2017-03-18 23:39:14'),('b8:27:eb:13:eb:d2@iotigniteagent','alis',100,'2017-03-19 14:52:39'),('b9:27:eb:13:eb:d2@iotigniteagent','fahriye1',2.5,'2017-03-19 05:34:55'),('b9:27:eb:13:eb:d2@iotigniteagent','ftdev',4.3,'2017-03-19 05:37:51'),('c0:27:eb:13:eb:d2@iotigniteagent','alis',4.2,'2017-03-18 23:24:39'),('c0:27:eb:13:eb:d2@iotigniteagent','alis',1,'2017-03-19 11:51:17'),('c0:27:eb:13:eb:d2@iotigniteagent','alis',1,'2017-03-19 11:51:32'),('c0:27:eb:13:eb:d2@iotigniteagent','didin',3.5,'2017-03-18 23:24:01'),('c0:27:eb:13:eb:d2@iotigniteagent','suleymanu',4,'2017-03-19 11:24:08'),('c0:27:eb:13:eb:d2@iotigniteagent','suleymanu',6,'2017-03-19 11:26:07'),('c0:27:eb:13:eb:d2@iotigniteagent','suleymanu',5,'2017-03-19 11:27:27'),('c0:27:eb:13:eb:d2@iotigniteagent','suleymanu',2,'2017-03-19 11:27:49'),('c0:27:eb:13:eb:d2@iotigniteagent','suleymanu',5,'2017-03-19 11:28:28'),('c0:27:eb:13:eb:d2@iotigniteagent','suleymanu',1,'2017-03-19 11:30:19'),('c0:27:eb:13:eb:d2@iotigniteagent','suleymanu',2,'2017-03-19 11:32:24'),('c0:27:eb:13:eb:d2@iotigniteagent','suleymanu',4,'2017-03-19 11:36:13'),('c0:27:eb:13:eb:d2@iotigniteagent','suleymanu',3,'2017-03-19 11:36:19'),('c0:27:eb:13:eb:d2@iotigniteagent','suleymanu',1,'2017-03-19 11:36:22'),('c0:27:eb:13:eb:d2@iotigniteagent','suleymanu',2,'2017-03-19 11:36:56'),('c0:27:eb:13:eb:d2@iotigniteagent','suleymanu',6,'2017-03-19 11:38:05'),('c0:27:eb:13:eb:d2@iotigniteagent','tanss61',5,'2017-03-19 11:42:39'),('c0:27:eb:13:eb:d2@iotigniteagent','tanss61',1,'2017-03-19 11:59:44'),('c0:27:eb:13:eb:d2@iotigniteagent','tanss61',2,'2017-03-19 11:59:52'),('c0:27:eb:13:eb:d2@iotigniteagent','tanss61',3,'2017-03-19 12:03:01'),('c0:27:eb:13:eb:d2@iotigniteagent','tanss61',6,'2017-03-19 12:29:56'),('c0:27:eb:13:eb:d2@iotigniteagent','tanss61',2,'2017-03-19 12:30:07'),('c0:27:eb:13:eb:d2@iotigniteagent','tanss61',2,'2017-03-19 12:30:33'),('c0:27:eb:13:eb:d2@iotigniteagent','tanss61',3,'2017-03-19 12:30:41'),('c0:27:eb:13:eb:d2@iotigniteagent','tanss61',1,'2017-03-19 12:32:30'),('c0:27:eb:13:eb:d2@iotigniteagent','tanss61',5,'2017-03-19 12:33:17'),('c0:27:eb:13:eb:d2@iotigniteagent','tanss61',1,'2017-03-19 12:35:36'),('c0:27:eb:13:eb:d2@iotigniteagent','tanss61',2,'2017-03-19 12:36:45'),('c0:27:eb:13:eb:d2@iotigniteagent','tanss61',5,'2017-03-19 13:34:15'),('c0:27:eb:13:eb:d2@iotigniteagent','tanss61',6,'2017-03-19 13:37:23'),('c0:27:eb:13:eb:d2@iotigniteagent','tanss61',5,'2017-03-19 13:38:11'),('c0:27:eb:13:eb:d2@iotigniteagent','tanss61',4,'2017-03-19 14:58:04'),('c0:27:eb:13:eb:d2@iotigniteagent','tanss61',5,'2017-03-19 15:11:42'),('c3:27:eb:13:eb:d2@iotigniteagent','ftdev',2.9,'2017-03-19 05:46:41');
/*!40000 ALTER TABLE `Recycled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('a','a'),('aa','a'),('aaa','a'),('alis','aliye123'),('aydinliAsi9','kimsebilemez'),('didin','12345'),('fahriye1','12345'),('ftdev','gizli'),('sonuncuEziq','123'),('suleymanu','123456'),('t','1'),('tanss','1'),('tanss61','1234');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Account`
--

DROP TABLE IF EXISTS `User_Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Account` (
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `surname` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `totalRecycled` double NOT NULL,
  `monthlyRecycled` double NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Account`
--

LOCK TABLES `User_Account` WRITE;
/*!40000 ALTER TABLE `User_Account` DISABLE KEYS */;
INSERT INTO `User_Account` VALUES ('a','a','','a',0,0),('aa','a','','a',0,0),('aaa','a','','a',0,0),('alis','ali','topac','esenlerli_tirrek_alisSs@gmail.com',112.15,0),('aydinliAsi9','gizos','karnibahar','pirenses_gizem99@gmail.com',10.9,0),('didin','Muhammed','Didin','cilginDidin80@gmail.com',5,0),('fahriye1','fahriye','bir','cilginfahri@gmail.com',14.2,0),('ftdev','furkan','tokac','heykir@gmail.com',8.7,0),('sonuncuEziq','Jon','Bariyer','trakyaliJon@gmail.com',1.5,0),('suleymanu','suleyman','cakirtas','enerjiksulo@gmail.com',56.4,0),('t','test','test','test',0,0),('tanss','t','t','t',5.3,0),('tanss61','Tansel','Kahyaoglu','Tansel',59.5,0);
/*!40000 ALTER TABLE `User_Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Bin`
--

DROP TABLE IF EXISTS `User_Bin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Bin` (
  `username` varchar(255) COLLATE utf8_bin NOT NULL,
  `binId` varchar(255) COLLATE utf8_bin NOT NULL,
  `amount` double NOT NULL,
  PRIMARY KEY (`username`,`binId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Bin`
--

LOCK TABLES `User_Bin` WRITE;
/*!40000 ALTER TABLE `User_Bin` DISABLE KEYS */;
INSERT INTO `User_Bin` VALUES ('alis','b8:27:eb:13:eb:d2@iotigniteagent',103.5),('alis','c0:27:eb:13:eb:d2@iotigniteagent',6.2),('didin','c0:27:eb:13:eb:d2@iotigniteagent',3.5),('fahriye1','b9:27:eb:13:eb:d2@iotigniteagent',2.5),('suleymanu','b9:27:eb:13:eb:d2@iotigniteagent',2.3),('suleymanu','c0:27:eb:13:eb:d2@iotigniteagent',46.2),('suleymanu','c1:27:eb:13:eb:d2@iotigniteagent',1.1),('suleymanu','c2:27:eb:13:eb:d2@iotigniteagent',1.9),('tanss61','c0:27:eb:13:eb:d2@iotigniteagent',58);
/*!40000 ALTER TABLE `User_Bin` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-04 22:57:57
