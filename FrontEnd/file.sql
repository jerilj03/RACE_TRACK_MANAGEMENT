-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: rtmgmt
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `cars`
--
CREATE DATABASE RTMGMT;
USE RTMGMT;
DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `CARID` int NOT NULL,
  `Engine` int NOT NULL,
  `FRAME` int NOT NULL,
  PRIMARY KEY (`CARID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,200,1),(2,250,2),(3,180,3),(4,150,2),(5,200,120),(6,250,9),(7,300,200),(8,200,1);
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `updateDriversCarid` AFTER DELETE ON `cars` FOR EACH ROW BEGIN
UPDATE drivers
SET carid = 0
WHERE carid = OLD.carid;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `SetDriverCarIDToZero` AFTER DELETE ON `cars` FOR EACH ROW BEGIN
    UPDATE drivers
    SET CARID = 0
    WHERE CARID = OLD.CARID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers` (
  `DRIVERID` int NOT NULL,
  `D_Name` varchar(255) DEFAULT NULL,
  `DOB` varchar(20) DEFAULT NULL,
  `Dpoints` int NOT NULL,
  `CARID` int DEFAULT NULL,
  PRIMARY KEY (`DRIVERID`),
  UNIQUE KEY `D_Name` (`D_Name`),
  KEY `CARID` (`CARID`),
  CONSTRAINT `new_drivers_fk` FOREIGN KEY (`CARID`) REFERENCES `cars` (`CARID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (1,'Driver1','1990-01-01',16,1),(2,'Driver2','1991-02-02',28,2),(3,'Driver3','1992-03-03',22,3),(4,'Driver4','1993-04-04',10,4),(5,'Driver5','1994-05-05',8,6),(6,'Driver6','1995-06-06',6,5),(7,'Driver7','1984',0,NULL);
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UpdateTeamPoints` AFTER UPDATE ON `drivers` FOR EACH ROW BEGIN
  
  UPDATE TEAMS AS t
  SET t.Tpts = (
    SELECT SUM(D.Dpoints)
    FROM DRIVERS AS D
    WHERE D.DRIVERID IN (t.DRIVER1ID, t.DRIVER2ID)
  )
  WHERE t.DRIVER1ID = NEW.DRIVERID OR t.DRIVER2ID = NEW.DRIVERID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `race_tracks`
--

DROP TABLE IF EXISTS `race_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `race_tracks` (
  `Trackid` int NOT NULL,
  `rt_name` varchar(20) NOT NULL,
  `location` varchar(20) NOT NULL,
  `Capacity` int NOT NULL,
  PRIMARY KEY (`Trackid`),
  UNIQUE KEY `Location` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `race_tracks`
--

LOCK TABLES `race_tracks` WRITE;
/*!40000 ALTER TABLE `race_tracks` DISABLE KEYS */;
INSERT INTO `race_tracks` VALUES (1,'Track A','Location A',5000),(2,'Track B','Location B',6000),(3,'Track C','Location C',7000);
/*!40000 ALTER TABLE `race_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `races`
--

DROP TABLE IF EXISTS `races`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `races` (
  `RACEID` int NOT NULL,
  `time` time DEFAULT NULL,
  `date` date DEFAULT NULL,
  `Trackid` int DEFAULT NULL,
  `P1DRIVERID` int NOT NULL,
  `P2DRIVERID` int NOT NULL,
  `P3DRIVERID` int NOT NULL,
  `P4DRIVERID` int NOT NULL,
  `P5DRIVERID` int NOT NULL,
  PRIMARY KEY (`RACEID`),
  UNIQUE KEY `P1DRIVERID` (`P1DRIVERID`,`P2DRIVERID`,`P3DRIVERID`,`P4DRIVERID`,`P5DRIVERID`),
  KEY `Trackid` (`Trackid`),
  KEY `P2DRIVERID` (`P2DRIVERID`),
  KEY `P3DRIVERID` (`P3DRIVERID`),
  KEY `P4DRIVERID` (`P4DRIVERID`),
  KEY `P5DRIVERID` (`P5DRIVERID`),
  CONSTRAINT `races_ibfk_1` FOREIGN KEY (`Trackid`) REFERENCES `race_tracks` (`Trackid`) ON DELETE SET NULL,
  CONSTRAINT `races_ibfk_2` FOREIGN KEY (`P1DRIVERID`) REFERENCES `drivers` (`DRIVERID`),
  CONSTRAINT `races_ibfk_3` FOREIGN KEY (`P2DRIVERID`) REFERENCES `drivers` (`DRIVERID`),
  CONSTRAINT `races_ibfk_4` FOREIGN KEY (`P3DRIVERID`) REFERENCES `drivers` (`DRIVERID`),
  CONSTRAINT `races_ibfk_5` FOREIGN KEY (`P4DRIVERID`) REFERENCES `drivers` (`DRIVERID`),
  CONSTRAINT `races_ibfk_6` FOREIGN KEY (`P5DRIVERID`) REFERENCES `drivers` (`DRIVERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `races`
--

LOCK TABLES `races` WRITE;
/*!40000 ALTER TABLE `races` DISABLE KEYS */;
INSERT INTO `races` VALUES (1,'10:00:00','2023-11-15',1,1,2,3,4,5),(2,'11:30:00','2023-11-20',2,2,3,4,5,6),(3,'12:00:00','2023-11-25',2,2,3,1,6,5);
/*!40000 ALTER TABLE `races` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UpdateDriverPoints` BEFORE INSERT ON `races` FOR EACH ROW BEGIN
  UPDATE DRIVERS
  SET Dpoints = Dpoints + 10
  WHERE DRIVERID = NEW.P1DRIVERID;

  UPDATE DRIVERS
  SET Dpoints = Dpoints + 8
  WHERE DRIVERID = NEW.P2DRIVERID;

  UPDATE DRIVERS
  SET Dpoints = Dpoints + 6
  WHERE DRIVERID = NEW.P3DRIVERID;

  UPDATE DRIVERS
  SET Dpoints = Dpoints + 4
  WHERE DRIVERID = NEW.P4DRIVERID;

  UPDATE DRIVERS
  SET Dpoints = Dpoints + 2
  WHERE DRIVERID = NEW.P5DRIVERID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `TEAMID` int NOT NULL,
  `T_NAME` varchar(255) DEFAULT NULL,
  `Owner` varchar(100) DEFAULT NULL,
  `Tpts` int NOT NULL,
  `DRIVER1ID` int DEFAULT NULL,
  `DRIVER2ID` int DEFAULT NULL,
  PRIMARY KEY (`TEAMID`),
  UNIQUE KEY `T_NAME` (`T_NAME`),
  KEY `DRIVER1ID` (`DRIVER1ID`),
  KEY `DRIVER2ID` (`DRIVER2ID`),
  CONSTRAINT `teams_driver1_fk` FOREIGN KEY (`DRIVER1ID`) REFERENCES `drivers` (`DRIVERID`) ON DELETE SET NULL,
  CONSTRAINT `teams_driver2_fk` FOREIGN KEY (`DRIVER2ID`) REFERENCES `drivers` (`DRIVERID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Team1','Owner1',44,1,2),(2,'Team2','Owner2',32,3,4),(3,'Team3','Owner3',14,5,6);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('jill','1234'),('john','1234');
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

-- Dump completed on 2023-11-17 10:06:53
