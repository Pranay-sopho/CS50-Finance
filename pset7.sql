-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0.0    Database: pset7
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `status` text NOT NULL,
  `symbol` varchar(32) NOT NULL,
  `shares` int(10) unsigned NOT NULL,
  `price` decimal(65,4) unsigned NOT NULL DEFAULT '0.0000',
  `timestamp` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (1,13,'BUY','goog',1,806.0000,'2017-01-08 08:14:29'),(2,13,'SELL','GOOG',1,806.0000,'2017-01-08 08:14:51'),(3,14,'BUY','goog',1,806.0000,'2017-01-08 08:17:11'),(4,14,'SELL','GOOG',1,806.0000,'2017-01-08 09:10:19'),(5,15,'BUY','goog',1,806.0000,'2017-01-08 09:14:51'),(6,15,'BUY','goog',7,806.0000,'2017-01-08 09:17:08'),(7,15,'BUY','goog',5,806.0000,'2017-01-08 09:18:11'),(8,16,'BUY','goog',7,806.0000,'2017-01-08 09:18:44'),(9,17,'BUY','GOOG',5,806.0000,'2017-01-08 09:29:42'),(10,17,'SELL','GOOG',5,806.0000,'2017-01-08 09:30:13'),(11,18,'BUY','GOOG',5,806.1500,'2017-01-08 09:34:20'),(12,19,'BUY','GOOG',5,806.1500,'2017-01-08, 09:37:43'),(13,19,'BUY','FB',5,123.4100,'2017-01-08, 09:38:38'),(14,20,'BUY','AA',10,30.6800,'2017-01-08, 09:43:27'),(15,21,'BUY','A',5,47.9900,'2017-01-08, 09:48:37'),(16,22,'BUY','A',10,47.9900,'2017-01-08, 09:54:55'),(17,22,'BUY','FB',8,123.4100,'2017-01-08, 10:20:18'),(18,23,'BUY','TGB',6000,0.9867,'2017-01-08, 11:28:51'),(19,23,'BUY','TRKK',4535,0.0539,'2017-01-08, 11:29:40'),(20,23,'BUY','TRKK',2321313,0.0539,'2017-01-08, 11:30:38'),(21,23,'SELL','TRKK',2325848,0.0539,'2017-01-08, 11:32:40'),(22,24,'BUY','TRKK',4243235,0.0539,'2017-01-08, 11:57:10'),(23,24,'SELL','TRKK',4243235,0.0539,'2017-01-08, 11:58:07'),(24,24,'BUY','GOOG',67,806.1500,'2017-01-08, 11:58:40'),(25,25,'BUY','TRKK',65652,0.0539,'2017-01-08, 13:45:13'),(26,25,'BUY','GOOG',4,806.1500,'2017-01-08, 13:46:46'),(27,25,'BUY','FB',20,123.4100,'2017-01-08, 13:46:56'),(28,25,'BUY','MSFT',3,62.8400,'2017-01-08, 13:47:19'),(29,25,'SELL','GOOG',4,806.1500,'2017-01-08, 13:47:43'),(30,25,'BUY','FB',20,123.4100,'2017-01-08, 13:48:21'),(31,25,'SELL','FB',40,123.4100,'2017-01-08, 13:48:31'),(32,25,'SELL','MSFT',3,62.8400,'2017-01-08, 13:48:43'),(33,25,'SELL','TRKK',65652,0.0539,'2017-01-08, 13:48:48'),(34,26,'BUY','FB',50,123.4100,'2017-01-08, 13:55:56'),(35,26,'SELL','FB',50,123.4100,'2017-01-08, 13:56:55'),(36,29,'BUY','RTTR',34,2.8100,'2017-01-08, 14:40:19'),(37,29,'BUY','FB',21,123.4100,'2017-01-08, 14:40:36'),(38,29,'SELL','FB',21,123.4100,'2017-01-08, 14:40:44'),(39,29,'SELL','RTTR',34,2.8100,'2017-01-08, 14:40:50');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portfolio`
--

DROP TABLE IF EXISTS `portfolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `portfolio` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `symbol` varchar(32) NOT NULL,
  `shares` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`symbol`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portfolio`
--

LOCK TABLES `portfolio` WRITE;
/*!40000 ALTER TABLE `portfolio` DISABLE KEYS */;
INSERT INTO `portfolio` VALUES (4,15,'GOOG',13),(7,16,'GOOG',7),(9,18,'GOOG',5),(10,19,'GOOG',5),(11,19,'FB',5),(12,20,'AA',10),(13,21,'A',5),(14,22,'A',10),(15,22,'FB',8),(16,23,'TGB',6000),(20,24,'GOOG',67);
/*!40000 ALTER TABLE `portfolio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `cash` decimal(65,4) unsigned NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'andi','$2y$10$c.e4DK7pVyLT.stmHxgAleWq4yViMmkwKz3x8XCo4b/u3r8g5OTnS',10000.0000),(2,'caesar','$2y$10$0p2dlmu6HnhzEMf9UaUIfuaQP7tFVDMxgFcVs0irhGqhOxt6hJFaa',10000.0000),(3,'eli','$2y$10$COO6EnTVrCPCEddZyWeEJeH9qPCwPkCS0jJpusNiru.XpRN6Jf7HW',10000.0000),(4,'hdan','$2y$10$o9a4ZoHqVkVHSno6j.k34.wC.qzgeQTBHiwa3rpnLq7j2PlPJHo1G',10000.0000),(5,'jason','$2y$10$ci2zwcWLJmSSqyhCnHKUF.AjoysFMvlIb1w4zfmCS7/WaOrmBnLNe',10000.0000),(6,'john','$2y$10$dy.LVhWgoxIQHAgfCStWietGdJCPjnNrxKNRs5twGcMrQvAPPIxSy',10000.0000),(7,'levatich','$2y$10$fBfk7L/QFiplffZdo6etM.096pt4Oyz2imLSp5s8HUAykdLXaz6MK',10000.0000),(8,'rob','$2y$10$3pRWcBbGdAdzdDiVVybKSeFq6C50g80zyPRAxcsh2t5UnwAkG.I.2',10000.0000),(9,'skroob','$2y$10$395b7wODm.o2N7W5UZSXXuXwrC0OtFB17w4VjPnCIn/nvv9e4XUQK',18.0000),(10,'zamyla','$2y$10$UOaRF0LGOaeHG4oaEkfO4O7vfI34B1W23WqHr9zCpXL68hfQsS3/e',10000.0000),(13,'qwe','$2y$10$/H/iKdc0IsgojGIsBmrRreKbWMjJKkj6jdeO4l.8E4gARSE2i.Qfe',815.1500),(14,'qwer','$2y$10$2WJA9FQIDfWPCuDRg8xaseuBTHYOO6XIgVY3/gT03uSN6V3hmY4n.',815.1500),(15,'123','$2y$10$gM0/Fc5i5uyE0CWm2T1y2.eKptnP7GWlGjZJylW0cpBCd5tIKJFpe',5158.1000),(16,'1234','$2y$10$yzXJNxoHDfnRiQvqrfKiYugynhIHfZ.CbtMdMv2XDIDzDq/6uuIfe',4356.9500),(17,'q','$2y$10$hbWvuCEcu2ImVu52IXPa0uQ1lXnmsEcHGPXw2.8720kP5yywEfXoq',10.0000),(18,'w','$2y$10$U.6.O4Ighknl48NgwShmZuI4uR3j/WxwzwZWtpvFf.MKpHFANrDV.',5969.2500),(19,'e','$2y$10$Q7LBfrM4YAzVvrfBJ8m07eS6mJdsotRwtZXi1JgYX1/W1k80r8COy',5352.2000),(20,'2','$2y$10$Ir.u2AlMD0rIlzJ9sNTEJ.yZ6tYmG1zisRc70lMhhX5DZNdlbvdlm',9693.2000),(21,'4','$2y$10$s4JNPE1VZHJQxX/3ivszNeCx1KnypRiRHZWyDtDJCzF9KnoD0plEq',9760.0500),(22,'6','$2y$10$T7x.jMYUzEJ4vfVAcXRmBeEmFu34q7bQtwJ44M3s3e374Ji9g5r6u',8532.8200),(23,'8','$2y$10$6X1HQDK2pvEFVv2nFEi7IOe.XxufZMHiDHaJEoD.89D8SLDiGvOuq',125363.2072),(24,'p','$2y$10$G4KAWlnNd1YqMI/0CfL8lOirxOmWzLHs8.H9JtyCH4GT16YqRym.6',174698.3165),(25,'u','$2y$10$03Pm.Ju7i8BwoaqcHCycYucy7xK.ynCSUHzFMODhiyHBmJFBNniU6',10000.0000),(26,'swap','$2y$10$dSn39D7udpgYTiDuQsq52Op29SuF7vAHdNodBjUKrr5SNgH0rPzRS',10000.0000),(28,'swapn','$2y$10$Wvb4A0Y.xReXMKDgKOqW8OF5YJvnanVgxJkDepBlzhP4Z6PKg2Hci',10000.0000),(29,'<script>alert(\"hi\");</script>','$2y$10$CaMXYbwGl1K34L8LA5SUDukRxWMmyqzZrfHgzzR4o4Ojr50mxwAV2',10000.0000);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-08 14:49:12
