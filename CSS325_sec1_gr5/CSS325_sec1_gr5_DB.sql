-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: bangkokairways_final
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `air_crew`
--

DROP TABLE IF EXISTS `air_crew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `air_crew` (
  `AEMP_ID` int NOT NULL,
  `weight` int NOT NULL,
  `height` int NOT NULL,
  `vision` varchar(20) NOT NULL,
  PRIMARY KEY (`AEMP_ID`),
  CONSTRAINT `air_crew_ibfk_1` FOREIGN KEY (`AEMP_ID`) REFERENCES `employee` (`EMP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `air_crew`
--

LOCK TABLES `air_crew` WRITE;
/*!40000 ALTER TABLE `air_crew` DISABLE KEYS */;
INSERT INTO `air_crew` VALUES (632283,87,182,'20/20'),(632286,70,185,'20/20'),(632287,65,176,'20/40'),(632288,72,186,'20/40'),(632289,69,179,'20/20'),(632291,83,183,'20/20'),(632293,65,181,'20/20'),(632294,72,180,'20/20'),(632295,85,185,'20/20'),(632301,86,185,'20/20'),(632303,77,173,'20/20'),(632304,88,180,'20/20'),(632307,84,175,'20/40'),(632309,86,182,'20/40'),(632313,81,166,'20/20'),(632314,67,184,'20/20'),(632317,68,180,'20/40'),(632318,73,173,'20/20'),(632319,76,190,'20/40'),(632321,80,189,'20/20');
/*!40000 ALTER TABLE `air_crew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airplane`
--

DROP TABLE IF EXISTS `airplane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airplane` (
  `AIRP_ID` varchar(10) NOT NULL,
  `company` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `max_capacity` int NOT NULL,
  `num_class` int NOT NULL DEFAULT '3',
  `type` varchar(20) NOT NULL,
  `manufacture_date` date NOT NULL,
  PRIMARY KEY (`AIRP_ID`),
  CONSTRAINT `num_class` CHECK (((`num_class` >= 1) and (`num_class` <= 3)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airplane`
--

LOCK TABLES `airplane` WRITE;
/*!40000 ALTER TABLE `airplane` DISABLE KEYS */;
INSERT INTO `airplane` VALUES ('880455','ATR','ATR72-600',70,3,'ATR','1999-06-23'),('88084F','Airbus SAS','Airbus320-200',162,3,'Airbus','2012-04-18'),('880C4A','Airbus SAS','Airbus319-100',138,3,'Airbus','2001-07-11'),('881056','Airbus SAS','Airbus319-100',132,3,'Airbus','2004-11-25'),('8832B0','Airbus SAS','Airbus320-200',162,3,'Airbus','2013-10-10'),('8832B1','Airbus SAS','Airbus320-200',162,3,'Airbus','2005-04-07'),('88434E','ATR','ATR72-500',70,3,'ATR','2018-12-11'),('88530C','ATR','ATR72-500',70,3,'ATR','2017-12-17'),('885966','Airbus SAS','Airbus319-100',144,3,'Airbus','1997-08-20'),('88596D','Airbus SAS','Airbus319-100',120,3,'Airbus','2009-05-18');
/*!40000 ALTER TABLE `airplane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airplane_can_land_airport`
--

DROP TABLE IF EXISTS `airplane_can_land_airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airplane_can_land_airport` (
  `AIRP_ID` varchar(10) NOT NULL,
  `AIRPT_ID` char(4) NOT NULL,
  PRIMARY KEY (`AIRP_ID`,`AIRPT_ID`),
  KEY `AIRPT_ID` (`AIRPT_ID`),
  CONSTRAINT `airplane_can_land_airport_ibfk_1` FOREIGN KEY (`AIRP_ID`) REFERENCES `airplane` (`AIRP_ID`),
  CONSTRAINT `airplane_can_land_airport_ibfk_2` FOREIGN KEY (`AIRPT_ID`) REFERENCES `airport` (`AIRPT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airplane_can_land_airport`
--

LOCK TABLES `airplane_can_land_airport` WRITE;
/*!40000 ALTER TABLE `airplane_can_land_airport` DISABLE KEYS */;
INSERT INTO `airplane_can_land_airport` VALUES ('88530C','VDPP'),('880C4A','VDSR'),('88530C','VTBD'),('8832B0','VTBO'),('885966','VTBO'),('88596D','VTBS'),('8832B1','VTBU'),('880C4A','VTCC'),('88530C','VTCC'),('8832B1','VTCH'),('880455','VTCL'),('8832B0','VTCT'),('88596D','VTCT'),('88434E','VTPO'),('885966','VTSG'),('88596D','VTSG'),('88084F','VTSM'),('885966','VTSM'),('880C4A','VTSP'),('88596D','VTSP'),('8832B0','VTSS'),('88084F','VVNB'),('880455','VVTS'),('881056','VYYY'),('881056','WMKK'),('88434E','WSSS'),('8832B0','YPPH'),('8832B1','YPPH'),('880455','ZUCK');
/*!40000 ALTER TABLE `airplane_can_land_airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airplane_operation_fs_route`
--

DROP TABLE IF EXISTS `airplane_operation_fs_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airplane_operation_fs_route` (
  `FLTS_ID` int NOT NULL,
  `R_ID` int NOT NULL,
  `AIRP_ID` char(6) NOT NULL,
  PRIMARY KEY (`FLTS_ID`,`R_ID`,`AIRP_ID`),
  KEY `R_ID` (`R_ID`),
  KEY `AIRP_ID` (`AIRP_ID`),
  CONSTRAINT `airplane_operation_fs_route_ibfk_1` FOREIGN KEY (`FLTS_ID`) REFERENCES `flight_schedule` (`FLTS_ID`),
  CONSTRAINT `airplane_operation_fs_route_ibfk_2` FOREIGN KEY (`R_ID`) REFERENCES `route` (`R_ID`),
  CONSTRAINT `airplane_operation_fs_route_ibfk_3` FOREIGN KEY (`AIRP_ID`) REFERENCES `airplane` (`AIRP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airplane_operation_fs_route`
--

LOCK TABLES `airplane_operation_fs_route` WRITE;
/*!40000 ALTER TABLE `airplane_operation_fs_route` DISABLE KEYS */;
INSERT INTO `airplane_operation_fs_route` VALUES (653389,640083,'8832B0'),(655108,640083,'88434E'),(651104,640480,'881056'),(654488,640480,'880C4A'),(656556,640760,'885966'),(658173,640760,'88084F'),(655225,641589,'885966'),(658344,641589,'88084F'),(650823,641923,'881056'),(654398,641923,'880C4A'),(650997,642076,'88530C'),(656432,642076,'8832B1'),(654676,643026,'885966'),(657845,643026,'88084F'),(650035,644480,'88596D'),(651180,644480,'880455'),(658189,644725,'88434E'),(659358,644725,'8832B0'),(654235,645642,'88596D'),(655993,645642,'880455'),(653265,646846,'88530C'),(659925,646846,'8832B1'),(658114,647701,'8832B1'),(659260,647701,'88530C'),(652153,648043,'88434E'),(654040,648043,'8832B0'),(653004,648870,'88596D'),(653156,648870,'880455'),(654177,649853,'880C4A'),(657976,649853,'881056');
/*!40000 ALTER TABLE `airplane_operation_fs_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `airport` (
  `AIRPT_ID` char(4) NOT NULL,
  `IATA_Code` char(3) NOT NULL,
  `flightline_num` int NOT NULL,
  `city` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  `latitude` varchar(30) NOT NULL,
  `longitude` varchar(30) NOT NULL,
  `elevation` float NOT NULL,
  `runway_num` int NOT NULL,
  `AIRPT_name` varchar(250) NOT NULL,
  PRIMARY KEY (`AIRPT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES ('VDPP','PNH',12,'Phnom Penh','Cambodia','N 11° 32\' 47.60\"','E 104° 50\' 38.90\"',12.19,1,'Phnom Penh International Airport'),('VDSR','REP',15,'Siem Reap','Cambodia','N 13° 24\' 38.40\"','E 103° 48\' 46.22\"',17.07,1,'Siem Reap International Airport'),('VTBD','DMK',48,'Bangkok','Thailand','N 13° 54\' 45.30\"','E 100° 36\' 24.30\"',2.74,2,'Don Muang International Airport'),('VTBO','TDX',12,'Trat','Thailand','N 12° 16\' 29.06\"','E 102° 19\' 09.08\"',32,1,'Trat Airport'),('VTBS','BKK',76,'Samut Prakan','Thailand','N 13° 40\' 51.02\"','E 100° 44\' 51.64\"',1.52,2,'Suvarnabhumi Airport'),('VTBU','UTP',21,'Rayong','Thailand','N 12° 40\' 47.80\"','E 101° 00\' 18.10\"',12.8,1,'U-Tapao International Airport'),('VTCC','CNX',24,'Chiang Mai','Thailand','N 18° 46\' 06.36\"','E 098° 57\' 46.29\"',315.77,1,'Chiang Mai International Airport'),('VTCH','HGN',64,'Mae Hong Son','Thailand','N 19° 18\' 06.00\"','E 097° 58\' 30.00\"',283.16,1,'Mae Hong Son Airport'),('VTCL','LPT',40,'Lampang','Thailand','N 18° 16\' 15.36\"','E 099° 30\' 15.00\"',247.19,1,'Lampang Airport'),('VTCT','CEI',16,'Chiang Rai','Thailand','N 19° 57\' 08.43\"','E 099° 52\' 58.54\"',390.14,1,'Chiang Rai International Airport'),('VTPO','THS',8,'Sukhothai','Thailand','N 17° 14\' 16.77\"','E 099° 49\' 05.46\"',54.56,1,'Sukhothai Airport'),('VTSG','KBV',22,'Krabi','Thailand','N 08° 05\' 45.49\"','E 098° 59\' 19.55\"',24.38,1,'Krabi Airport'),('VTSM','USM',15,'Surat Thani','Thailand','N 09° 32\' 52.23\"','E 100° 03\' 44.81\"',19.51,1,'Samui International Airport'),('VTSP','HKT',24,'Phuket','Thailand','N 08° 06\' 47.62\"','E 098° 19\' 00.70\"',24.99,1,'Phuket International Airport'),('VTSS','HDY',8,'Songkhla','Thailand','N 06° 55\' 57.73\"','E 100° 23\' 39.07\"',27.43,1,'Hat Yai Inyernational Airport'),('VVNB','HAN',20,'Hanoi','Vietnam','N 21° 13\' 13.18\"','E 105° 48\' 20.07\"',12.19,2,'Noi Bai International Airport'),('VVTS','SGN',32,'Ho Chi Minh','Vietnam','N 10° 49\' 07.67\"','E 106° 39\' 06.68\"',10.06,2,'Tan Son Nhat International Airport'),('VYYY','RGN',16,'Yangon','Myanmar','N 16° 54\' 26.03\"','E 096° 07\' 59.66\"',33.22,1,'Yangon International Airport'),('WMKK','KUL',60,'Kuala Lumpur','Malaysia','N 02° 44\' 44.08\"','E 101° 42\' 35.70\"',21.03,2,'Kuala Lumpur International Airport'),('WSSS','SIN',42,'Changi','Singapore','N 01° 21\' 00.59\"','E 103° 59\' 39.76\"',6.71,3,'Changi Airport'),('YPPH','PER',27,'Perth','Australia','S 31° 56\' 25.00\"','E 115° 58\' 01.00\"',20.42,2,'Perth Airport'),('ZUCK','CKG',15,'Chongqing','China','N 29° 43\' 09.18\"','E 106° 38\' 30.04\"',416.05,1,'Chongqing Jiangbei International Airport');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boarding_pass`
--

DROP TABLE IF EXISTS `boarding_pass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boarding_pass` (
  `BP_ID` int NOT NULL,
  `dept_time` datetime NOT NULL,
  `BP_time` datetime NOT NULL,
  `TCK_ID` int NOT NULL,
  PRIMARY KEY (`BP_ID`,`TCK_ID`),
  KEY `TCK_ID` (`TCK_ID`),
  CONSTRAINT `boarding_pass_ibfk_1` FOREIGN KEY (`TCK_ID`) REFERENCES `ticket` (`TCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boarding_pass`
--

LOCK TABLES `boarding_pass` WRITE;
/*!40000 ALTER TABLE `boarding_pass` DISABLE KEYS */;
INSERT INTO `boarding_pass` VALUES (165247,'2022-10-27 12:40:00','2022-10-27 12:25:00',485983),(181616,'2022-10-30 17:30:00','2022-10-30 17:15:00',118838),(223398,'2022-10-24 19:46:00','2022-10-24 19:31:00',648282),(283736,'2022-10-24 20:00:00','2022-10-24 19:45:00',734682),(293940,'2022-10-30 18:30:00','2022-10-30 18:15:00',395874),(446665,'2022-10-31 13:25:00','2022-10-31 13:10:00',978865),(726738,'2022-10-30 10:10:00','2022-10-30 09:55:00',288374),(846535,'2022-10-29 20:05:00','2022-10-29 19:50:00',378483),(983635,'2022-10-28 20:46:00','2022-10-28 20:31:00',829348),(984937,'2022-10-31 12:55:00','2022-10-31 12:40:00',805839);
/*!40000 ALTER TABLE `boarding_pass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cabin_crew`
--

DROP TABLE IF EXISTS `cabin_crew`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cabin_crew` (
  `CEMP_ID` int NOT NULL,
  `second_language` varchar(300) NOT NULL,
  PRIMARY KEY (`CEMP_ID`),
  CONSTRAINT `cabin_crew_ibfk_1` FOREIGN KEY (`CEMP_ID`) REFERENCES `air_crew` (`AEMP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabin_crew`
--

LOCK TABLES `cabin_crew` WRITE;
/*!40000 ALTER TABLE `cabin_crew` DISABLE KEYS */;
INSERT INTO `cabin_crew` VALUES (632283,'English'),(632286,'English, Russian, Mandarin'),(632287,'English, Japanese'),(632288,'English, Arabic'),(632291,'English, Dutch, Mandarin, Spanish'),(632304,'English, Dutch'),(632307,'English, Korean, Arabic, Mandarin'),(632309,'English, Dutch, Mandarin'),(632317,'English, Mandarin, Hindi'),(632319,'English, Russian');
/*!40000 ALTER TABLE `cabin_crew` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancellation`
--

DROP TABLE IF EXISTS `cancellation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancellation` (
  `CXL_ID` int NOT NULL,
  `penalty_fee` int NOT NULL,
  `PYMT_ID` int NOT NULL,
  PRIMARY KEY (`CXL_ID`,`PYMT_ID`),
  KEY `PYMT_ID` (`PYMT_ID`),
  CONSTRAINT `cancellation_ibfk_1` FOREIGN KEY (`PYMT_ID`) REFERENCES `payment` (`PYMT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancellation`
--

LOCK TABLES `cancellation` WRITE;
/*!40000 ALTER TABLE `cancellation` DISABLE KEYS */;
INSERT INTO `cancellation` VALUES (102243,0,452168),(219349,2000,234685),(314456,0,254698),(413245,0,253685),(456234,2000,251478),(645734,2000,284152),(734812,0,784125),(734812,2000,846321),(874623,0,796502),(906904,0,646506);
/*!40000 ALTER TABLE `cancellation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_receipt`
--

DROP TABLE IF EXISTS `cash_receipt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cash_receipt` (
  `CASHR_ID` int NOT NULL,
  `medium` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `PYMT_ID` int NOT NULL,
  PRIMARY KEY (`CASHR_ID`,`PYMT_ID`),
  KEY `PYMT_ID` (`PYMT_ID`),
  CONSTRAINT `cash_receipt_ibfk_1` FOREIGN KEY (`PYMT_ID`) REFERENCES `payment` (`PYMT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_receipt`
--

LOCK TABLES `cash_receipt` WRITE;
/*!40000 ALTER TABLE `cash_receipt` DISABLE KEYS */;
INSERT INTO `cash_receipt` VALUES (175678,'Email','2022-08-06',284152),(185345,'Email','2022-08-14',251478),(234712,'Email','2022-08-27',253685),(323487,'Email','2022-08-20',646506),(342677,'Paper','2022-08-17',784125),(345244,'Paper','2022-07-22',452168),(362123,'Paper','2022-07-11',234685),(734563,'Paper','2022-08-23',796502),(756234,'Email','2022-07-26',254698),(978545,'Paper','2022-09-09',846321);
/*!40000 ALTER TABLE `cash_receipt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_detail`
--

DROP TABLE IF EXISTS `contact_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_detail` (
  `CONT_ID` int NOT NULL,
  `email` varchar(250) NOT NULL,
  `pnum` char(10) NOT NULL,
  `tnum` char(9) DEFAULT NULL,
  `guardian` varchar(250) NOT NULL,
  `g_relationship` varchar(50) NOT NULL,
  `gnum` char(10) NOT NULL,
  `CPAX_ID` int NOT NULL,
  PRIMARY KEY (`CONT_ID`,`CPAX_ID`),
  KEY `CPAX_ID` (`CPAX_ID`),
  CONSTRAINT `contact_detail_ibfk_1` FOREIGN KEY (`CPAX_ID`) REFERENCES `passenger` (`PAX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_detail`
--

LOCK TABLES `contact_detail` WRITE;
/*!40000 ALTER TABLE `contact_detail` DISABLE KEYS */;
INSERT INTO `contact_detail` VALUES (127,'giju_y@mail.com','0875173851','024666027','Jiwon','spouse','0835515591',119),(131,'jirattikarn_k@mail.com','0875929325','029125734','Nakarin','spouse','0863546420',104),(192,'taweerat_p@mail.com','0815870237','','Titinan','father','0865510689',102),(240,'nakarin_c@mail.com','0863546420','027196823','Jirattikarn','spouse','0875929325',103),(282,'davie_y@mail.com','0898622868','','Micha','friend','0842527828',115),(326,'amitah_s@mail.com','0838577520','023343340','Natchaporn','daughter','0830259259',110),(333,'sunan_a@mail.com','0856626740','023431335','Chutinan','friend','0858112651',101),(403,'eric_z@mail.com','0869339846','','Minami','spouse','0854557435',117),(505,'malika_s@mail.com','0870456365','029803085','Praprai','friend','0874942257',107),(564,'carlos_a@mail.com','0857366238','029514450','Swanson','mother','0881959706',113),(620,'geetika_c@mail.com','0828051373','028630738','Vethica','mother','0866897157',112),(658,'jonathan_k@mail.com','0864462398','024711593','Karen','mother','0801406911',118),(677,'vivek_b@mail.com','0886185316','','Vethica','spouse','0872634741',111),(678,'puttipat_s@mail.com','0822446335','','Petchra','spouse','0853631124',106),(686,'micah_l@mail.com','0842527828','','Davie','friend','0898622868',114),(721,'jiwon_k@mail.com','0835515591','024209820','Giju','spouse','0875173851',120),(818,'minami_c@mail.com','0854557435','028060521','Eric','spouse','0869339846',116),(828,'natee_m@mail.com','0882340098','029124780','Potjamarn','friend','0806173506',108),(919,'petchra_t@mail.com','0853631124','021672532','Puttipat','spouse','0822446335',105),(967,'tulaya_k@mail.com','0862779436','024191174','Chotinan','son','0857299637',109);
/*!40000 ALTER TABLE `contact_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EMP_ID` int NOT NULL,
  `FName` varchar(250) NOT NULL,
  `MName` varchar(250) DEFAULT NULL,
  `LName` varchar(250) NOT NULL,
  `title` varchar(100) NOT NULL,
  `DOB` date NOT NULL,
  `Egender` char(1) NOT NULL,
  `employment_date` date NOT NULL,
  `phone_number` bigint DEFAULT NULL,
  `salary` bigint DEFAULT NULL,
  `SEMP_ID` int DEFAULT NULL,
  PRIMARY KEY (`EMP_ID`),
  KEY `supervisor_emp_id` (`SEMP_ID`),
  CONSTRAINT `supervisor_emp_id` FOREIGN KEY (`SEMP_ID`) REFERENCES `employee` (`EMP_ID`),
  CONSTRAINT `Egender` CHECK ((`Egender` in (_utf8mb4'M',_utf8mb4'F')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (632277,'Tanmeti','Suthama','Chitwitchaporn','Director','1978-07-13','M','2009-11-30',844286375,2000000,632298),(632278,'Nuengrutai','','Rattanabanshi','Chief executive officer','1975-10-01','M','2017-10-03',885567065,4815157,632278),(632279,'Soabaskorn','','Mechaimak','Chief information officer','1976-07-14','M','2007-09-19',877601687,2934742,632279),(632280,'Sasiwinon','','Rattanabanshi','Executive Secretary To President','1981-04-08','F','2014-04-16',804316382,200000,632278),(632281,'Thanyara','','Kaeynanoon','','1999-10-19','F','2015-12-24',862284178,250000,632310),(632282,'Tookta','','Chearavanont','','1996-09-18','F','2017-12-03',832928918,250000,632305),(632283,'Sinn','','Sudham','','1991-08-03','F','2005-03-03',870697011,645000,632307),(632284,'Intira','Pranee','Iemtadanai','Supervisor','1979-01-11','F','2008-06-25',823684119,151000,632298),(632285,'Pimchanok','','Wuttanidai','Director','1977-12-25','F','2017-04-11',823343665,2000000,632279),(632286,'Yindee','','Prateung','Supervisor','1991-02-02','F','2011-08-25',887691784,743000,632308),(632287,'Sukanda','Prasert','Palathai','Supervisor','1991-10-22','F','2008-12-27',826746697,790000,632277),(632288,'Badinton','','Phatipatanawong','','1991-12-15','M','2006-06-17',858839097,450000,632286),(632289,'Chakrabandhu','','Sivaraksa','','1987-08-15','M','2010-06-09',876591707,1900000,632303),(632290,'Sunaroj','Vinayak','Sethi','Supervisor','1979-11-29','M','2013-10-14',863579329,140000,632298),(632291,'Phisan','','Toktumsonteen','','1989-12-03','M','2005-12-14',888299754,850000,632294),(632292,'Kittikorn','','Chaipoowapat','','1995-12-27','M','2018-01-31',826985335,250000,632305),(632293,'Sasikarn','','Ekaluck','Supervisor','1983-09-22','F','2019-02-17',809024830,2500000,632298),(632294,'Yupin','','Montri','Supervisor','1985-02-19','F','2006-05-20',825710375,2500000,632296),(632295,'Saowapa','','Warisanawan','','1986-03-22','F','2009-09-01',833436071,2000000,632313),(632296,'Vikenti','Joseph','Makhovnick','Chief operations officer','1978-06-04','M','2005-03-31',822491628,2900000,632296),(632297,'Phisani','','Sindudeja','','1998-03-27','M','2008-09-09',854089755,250000,632305),(632298,'Kanokrat','','Kasamsun','Chief marketing officer','1978-10-14','F','2018-10-31',897614287,2900000,632298),(632299,'Burapol','','Mintonki','','1999-04-01','M','2009-10-07',827064328,250000,632312),(632300,'Manjusha ','Viki','Jain','Supervisor','1979-09-30','M','2012-05-23',890876782,151000,632279),(632301,'Sanjana','Malik','Prabhakar','Supervisor','1982-07-03','F','2014-04-18',877200909,2500000,632279),(632302,'Sonali','Suzi','Garg','','1997-12-18','F','2012-02-18',856030527,250000,632310),(632303,'Ajay','','Sehgal','Supervisor','1983-09-17','M','2012-11-24',873237493,2500000,632279),(632304,'Dhanajay ','','Bhari','','1994-04-10','M','2012-12-25',868252690,435000,632286),(632305,'Ayush','Kruti','Jain','Supervisor','1995-03-29','M','2005-08-21',808435764,300000,632279),(632306,'Mohini','Mikka','Das','','1997-05-19','F','2012-04-25',841525429,250000,632312),(632307,'Kajal','Narukka','Nazareth','Supervisor','1991-02-05','F','2008-09-24',835617064,800000,632285),(632308,'Pan','','Jung-Hwa','Director','1979-09-26','F','2009-04-15',895029367,2000000,632296),(632309,'Yong','','Hae','','1993-01-07','F','2008-06-26',829736985,500000,632287),(632310,'Seo','','Hajoon','Supervisor','1996-03-11','M','2015-01-22',874287687,300000,632296),(632311,'Ryan','Bihari','Sethi','Supervisor','1980-06-08','M','2015-07-11',826684270,140000,632279),(632312,'Nae','','Man-Shik','Supervisor','1995-11-24','M','2005-04-22',855729175,300000,632298),(632313,'Don','Christopher','Chul','Supervisor','1982-11-22','M','2012-05-29',805382006,2500000,632298),(632314,'Karen','Mitchell','Lewis','','1987-03-24','F','2007-07-26',869318155,1900000,632313),(632315,'Noe','','Billard','Human Resource','1995-09-15','M','2012-06-12',883391960,150000,632336),(632316,'Armani','Manu','Lawson','Chief financial officer','1975-11-12','M','2017-08-17',827471743,4440000,632316),(632317,'Kanokwan','','Suprachan','','1993-07-15','F','2015-04-09',820868107,668200,632307),(632318,'Chaimongkol','','Puttinachon','','1988-08-17','M','2016-05-26',845980397,1800000,632293),(632319,'Jirapong','','Pongprakert','','1992-05-17','M','2005-06-16',860988876,540000,632287),(632320,'Amronray','','Yingmekin','Supervisor','1980-06-08','F','2010-06-04',893845665,151000,632296),(632321,'Ajay','Bihalni','Sethi','','1987-10-17','M','2017-11-18',861322181,2000000,632301),(632322,'Ratthana','','Rattikanawong','','2002-10-29','M','2017-10-20',843798590,58000,632290),(632323,'Putinard','','Wongkarung','','1989-02-01','M','2019-04-16',865779350,58000,632311),(632324,'Pattiphan','','Karuncharnan','','1987-11-21','M','2013-02-15',802152620,58000,632320),(632325,'Angkhana','','Buraphanin','','1988-03-27','M','2008-05-07',883383060,90000,632284),(632326,'Puttipong','','Narakhanwong','','1987-10-16','M','2008-10-28',843387304,110000,632300),(632327,'Monklong','Bhanthai','Paireerak','Supervisor','1991-10-13','M','2016-11-25',885045688,325000,632298),(632328,'Rungruedeen','','Yingyungyong','Supervisor','1992-09-20','F','2013-08-02',849228668,325000,632296),(632329,'Pattama','','Thammungkong','','2001-05-05','M','2009-03-22',811956913,150000,632336),(632330,'Tuptim','','Thaibanguaoy','','2002-10-27','F','2008-10-21',838355664,150000,632327),(632331,'Niyom','','Sungkong','','1996-07-06','M','2017-12-29',818936568,150000,632328),(632332,'Adung','Sraya','Sethi','','1995-12-29','F','2016-12-01',818731169,150000,632327),(632333,'Thanit','','Kingkradeng','','2002-11-13','M','2008-07-13',894595800,150000,632328),(632334,'Pundareek','','Suprija','','1993-07-28','F','2015-01-23',888744664,150000,632328),(632335,'Nissorn','Chayunart','Ponhpaiboon','','1995-11-21','M','2009-06-05',819458049,150000,632336),(632336,'Saowatharn','','Rardchawat','Supervisor','1990-06-25','F','2016-11-28',878508073,325000,632279);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_address`
--

DROP TABLE IF EXISTS `employee_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_address` (
  `EEMP_ID` int NOT NULL,
  `EMP_AID` int NOT NULL,
  `number` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `county` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  PRIMARY KEY (`EEMP_ID`,`EMP_AID`),
  KEY `emp_address_id` (`EMP_AID`),
  CONSTRAINT `employee_address_ibfk_1` FOREIGN KEY (`EEMP_ID`) REFERENCES `employee` (`EMP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_address`
--

LOCK TABLES `employee_address` WRITE;
/*!40000 ALTER TABLE `employee_address` DISABLE KEYS */;
INSERT INTO `employee_address` VALUES (632277,1265,'640/29','New Taksin','Klong Ton Sa','Bangkok','Thailand','10600'),(632278,1271,'2489','New Phetburi','Suanluang','Bangkok','Thailand','10250'),(632279,1269,'1138/51-52','Rama 3','Yan Nawa','Bangkok','Thailand','10120'),(632280,1293,'35/16 Soi 124','Ladprao','Wangthonglang','Bangkok','Thailand','10310'),(632281,1272,'59 Soi 13','Charoennakorn Road','Khlongsan','Bangkok','Thailand','10600'),(632282,1277,'592/1 Soi Suanplu 5','South Sathorn','Thung Maha Maek','Bangkok','Thailand','10120'),(632283,1239,'281/16 ','Suriwong','Suriyawong','Bangkok','Thailand','10500'),(632284,1262,'604/3','Phetburi 12','Payathai','Bangkok','Thailand','10400'),(632285,1266,'29 Soi Chalermsuk','Rachadaphisek','Ladyao','Bangkok','Thailand','10900'),(632286,1240,'Room 505','Chaengwatana','Pakkred','Bangkok','Thailand','11120'),(632287,1241,'15/87-9 Gp 9','Ladprao 53','Lad Prao','Bangkok','Thailand','10230'),(632288,1237,'31/1 Soi Pracha','Uthit 54','Bangmod','Bangkok','Thailand','10140'),(632289,1245,'130/11 Soi 18','Lardyao','Chatuchak','Bangkok','Thailand','10900'),(632290,1259,'565','Sukhumvit','Klongton','Bangkok','Thailand','10110'),(632291,1243,'11/5 Soi 13','Sukhumvit','Klongtoey','Bangkok','Thailand','10110'),(632292,1278,'1875/617 Soi Panurangsee','Charansnidvongs','Bang Plad','Bangkok','Thailand','10700'),(632293,1250,'18 Soi Sirithamma','New Rd Wang Buraphapirom','Phra Nakhon','Bangkok','Thailand','10200'),(632294,1249,'33/5 Soi 19','Sukhumvit','Khlong Toei','Bangkok','Thailand','10110'),(632295,1248,'778/15','Phaholyothin','Chatuchak','Bangkok','Thailand','10900'),(632296,1267,'15 Soi Charoennakorn 32/1','Charoennakorn','Klongsan','Bangkok','Thailand','10600'),(632297,1274,'146-152','Damrongruk Road','Khlongmahanak','Bangkok','Thailand','10100'),(632298,1268,'323','Silom','Bang Rak','Bangkok','Thailand','10500'),(632299,1273,'169-171 Soi Sukhumvit 62/1','Sukhumvit','Prakhanong','Bangkok','Thailand','10260'),(632300,1263,'640/29','New Taksin Klong Ton','Sa Khlong San','Bangkok','Thailand','10600'),(632301,1253,'673/159 Soi Pattanakarn 30','Pattanakarn','Bangkok','Bangkok','Thailand','10250'),(632302,1275,'28/15 Soi 36','Sukhumvit','Khlong Toei','Bangkok','Thailand','10110'),(632303,1251,'2/243 Soi 14','Ramintra','Tha Rang','Bangkok','Thailand','10220'),(632304,1234,'10/1 Soi Farmwatana','Rama 4','Prakhanong','Bangkok','Thailand','10110'),(632305,1281,'32 Soi Santisuk','Latphrao 98','Latphrao','Bangkok','Thailand','10230'),(632306,1276,'677/88 Soi 5/1','Latphrao','Latyao','Bangkok','Thailand','10900'),(632307,1242,'21/4 Soi','Sukhumvit 29','Klongtoey','Bangkok','Thailand','10110'),(632308,1264,'29 Soi Chalermsuk','Rachadaphisek','Ladyao','Bangkok','Thailand','10900'),(632309,1235,'60/38-39','Ramintra 56','Kannayao','Bangkok','Thailand','10230'),(632310,1279,'283','Larnluang','Wat Sommanas','Bangkok','Thailand','10100'),(632311,1260,'121/13 Soi Sabaichai Suthisarnvinichai','Sam Saen Nork','Huai Khwang','Bangkok','Thailand','10320'),(632312,1280,'26/3 Soi Atthakarnprasith','South Sathorn','Thung Maha Maek','Bangkok','Thailand','10120'),(632313,1252,'3 St Louis Soi 3','Chan','Sathorn','Bangkok','Thailand','10120'),(632314,1246,'1/99 Soi Ekasathaporn','Sukhaphibal 1','Bang Born','Bangkok','Thailand','10150'),(632315,1288,'297-299 Charoennakorn 10','Klongtonsai','Bangkok','Bangkok','Thailand','10600'),(632316,1270,'135/1 Soi Kasemsuwan','Sukhumvit 50','Phra Khanong','Bangkok','Thailand','10250'),(632317,1236,'216/6','Suksawad','Bangoakok','Bangkok','Thailand','10104'),(632318,1244,'198 Soi Sawang','Mahanakorn','Mahaprautaram','Bangkok','Thailand','10500'),(632319,1238,'501/77 ','Nanglinchee','Chongnonsi','Bangkok','Thailand','10120'),(632320,1261,'110/32-33 Soi 23','Pracharat Sai 1','Bangkok','Bangkok','Thailand','10800'),(632321,1247,'306/9-10 Soi Kiatichai','Asoke-Dindaeng','Din Daeng','Bangkok','Thailand','10320'),(632322,1254,'154/8 Soi 1','Sukhumwit','Klongtoey Nua Watthana','Bangkok','Thailand','10110'),(632323,1255,'691 Happylandsai 1','Klong Chan','Bang Kapi','Bangkok','Thailand','10240'),(632324,1256,'16/48 Soi Vajana','Daokanong-Chomthong','Chomthong','Bangkok','Thailand','10150'),(632325,1257,'224/2-3 Dinsaw','Sao Chingchar','Phra Nakhon','Bangkok','Thailand','10200'),(632326,1258,'161-163 Chula Soi 30','Banthadthong','Wangmai','Bangkok','Thailand','10330'),(632327,1291,'1604/2 Songwad Talad No','Samphantha Wong','Phan','Bangkok','Thailand','10100'),(632328,1290,'50 Soi Ketnuth','Ladprao 64','Wangthonglang','Bangkok','Thailand','10310'),(632329,1284,'99/168 Ladprao 41','Lardyao','Chatuchak','Bangkok','Thailand','10900'),(632330,1283,'68/30-1','Silom','Bangrak','Bangkok','Thailand','10500'),(632331,1285,'28/5 Soi Liabklongthabchang','Ladkrabang','Minburi','Bangkok','Thailand','10510'),(632332,1286,'6 Soi Songphra','Rama 4','Mahapruektaram','Bangkok','Thailand','10500'),(632333,1282,'135/20-21','Surawong','Bangkok','Bangkok','Thailand','10500'),(632334,1289,'36/51','Srinakarin','Suan Luang','Bangkok','Thailand','10250'),(632335,1287,'2/9 Silom 13','Silom','Bangkok','Bangkok','Thailand','10500'),(632336,1292,'9/1-2','Kampaengphet','Chatuchak','Bangkok','Thailand','10900');
/*!40000 ALTER TABLE `employee_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_schedule`
--

DROP TABLE IF EXISTS `flight_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flight_schedule` (
  `FLTS_ID` int NOT NULL,
  `FLTCode` char(20) NOT NULL,
  `ScheduleDept_time` datetime NOT NULL,
  `ScheduleArr_time` datetime NOT NULL,
  `FLT_date` date NOT NULL,
  `airline_name` varchar(100) NOT NULL,
  `terminal` char(1) NOT NULL,
  `checkin_counter` char(3) NOT NULL,
  `status` varchar(30) NOT NULL,
  PRIMARY KEY (`FLTS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_schedule`
--

LOCK TABLES `flight_schedule` WRITE;
/*!40000 ALTER TABLE `flight_schedule` DISABLE KEYS */;
INSERT INTO `flight_schedule` VALUES (650035,'SQ713','2022-10-27 23:15:00','2022-10-28 00:18:00','2022-10-27','Singapore Airlines','I','F2','En-Route'),(650823,'PG279','2022-10-29 20:05:00','2022-10-29 21:10:00','2022-10-29','Bangkok Airways','D','F10','En-Route'),(650997,'PG172','2022-10-27 12:40:00','2022-10-27 13:55:00','2022-10-27','Bangkok Airways','2','F13','Landed Late'),(651104,'VZ307','2022-10-25 09:00:00','2022-10-25 10:55:00','2022-10-25','Thai Vietjet Air','C','F2','Landed Late'),(651180,'PG164','2022-10-30 10:10:00','2022-10-30 11:25:00','2022-10-30','Bangkok Airways','C','F5','Landed Late'),(652153,'PG220','2022-10-24 19:46:00','2022-10-24 21:14:00','2022-10-24','Bangkok Airways','B','F8','Landed on time'),(653004,'VZ137','2022-10-26 12:30:00','2022-10-26 14:00:00','2022-10-26','Thai Vietjet Air','1','C7','Landed on time'),(653156,'PG962','2022-10-23 12:10:00','2022-10-23 14:15:00','2022-10-31','Singapore Airlines','1','A2','En-Route'),(653265,'VJ805','2022-10-23 08:00:00','2022-10-23 09:20:00','2022-10-30','Thai Vietjet Air','C','F13','En-Route'),(653389,'ZA936','2022-10-23 19:41:00','2022-10-23 20:36:00','2022-10-30','Sky Angkor Airlines','I','H15','Landed on time'),(654040,'PG907','2022-10-27 11:30:00','2022-10-27 12:45:00','2022-10-27','Sky Angkor Airlines','B','F7','Landed Late'),(654177,'PG258','2022-10-31 12:55:00','2022-10-31 13:50:00','2022-10-31','Bangkok Airways','D','F7','En-Route'),(654235,'PG191','2022-10-28 20:46:00','2022-10-28 21:15:00','2022-10-28','Bangkok Airways','C','F12','En-Route'),(654398,'PG961','2022-11-01 09:25:00','2022-11-01 11:20:00','2022-11-01','Bangkok Airways','1','F13','En-Route'),(654488,'PG704','2022-10-22 11:40:00','2022-10-22 13:10:00','2022-10-22','Myanmar Airways International','1','A11','Landed Late'),(654676,'PG284','2022-10-26 09:30:00','2022-10-26 10:40:00','2022-10-26','Bangkok Airways','2','F13','Landed on time'),(655108,'8M350','2022-10-29 20:30:00','2022-10-29 21:45:00','2022-10-29','Myanmar Airways International','I','A1','En-Route'),(655225,'ZA679','2022-10-29 19:15:00','2022-10-29 20:20:00','2022-10-29','Sky Angkor Airlines','C','F3','Landed on time'),(655993,'SQ709','2022-11-01 19:15:00','2022-11-01 21:10:00','2022-11-01','Singapore Airlines','A','F2','En-Route'),(656432,'PG219','2022-10-26 10:35:00','2022-10-26 11:55:00','2022-10-26','Bangkok Airways','C','F15','Landed on time'),(656556,'PG264','2022-10-24 20:00:00','2022-10-24 21:05:00','2022-10-24','Bangkok Airways','B','F9','Landed on time'),(657845,'PG908','2022-10-22 12:35:00','2022-10-22 13:55:00','2022-10-22','Cambodia Angkor Air','I','B12','Landed on time'),(657976,'TR671','2022-10-28 12:30:00','2022-10-28 13:25:00','2022-10-28','Tigerair','B','F1','En-Route'),(658114,'PG308','2022-10-30 18:30:00','2022-10-30 19:30:00','2022-10-30','Bangkok Airways','1','F12','Landed on time'),(658173,'PG934','2022-11-01 08:35:00','2022-11-01 09:50:00','2022-11-01','Myanmar Airways International','I','F1','Landed on time'),(658189,'8M351','2022-10-26 15:00:00','2022-10-26 16:15:00','2022-10-26','Myanmar Airways International','A','A5','Landed Late'),(658344,'PG174','2022-10-31 13:25:00','2022-10-31 15:00:00','2022-10-31','Bangkok Airways','C','F14','En-Route'),(659260,'8M332','2022-10-26 12:25:00','2022-10-26 13:45:00','2022-10-26','Myanmar Airways International','B','F3','Landed on time'),(659358,'PG214','2022-10-30 17:30:00','2022-10-30 18:50:00','2022-10-30','Bangkok Airways','2','F11','Landed on time'),(659925,'ZA1679','2022-10-29 20:00:00','2022-10-29 21:20:00','2022-10-29','Sky Angkor Airlines','A','F5','Landed Late');
/*!40000 ALTER TABLE `flight_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flyerbonus_membership`
--

DROP TABLE IF EXISTS `flyerbonus_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flyerbonus_membership` (
  `FLYER_ID` int NOT NULL,
  `passwd` varchar(100) NOT NULL,
  `MEM_discount` int NOT NULL,
  `preferred_lang` varchar(20) NOT NULL DEFAULT 'Thai',
  `ML_ID` int NOT NULL,
  `FLPAX_ID` int NOT NULL,
  `signup_date` date DEFAULT NULL,
  PRIMARY KEY (`FLYER_ID`,`ML_ID`,`FLPAX_ID`),
  KEY `ML_ID` (`ML_ID`),
  KEY `FLPAX_ID` (`FLPAX_ID`),
  CONSTRAINT `flyerbonus_membership_ibfk_1` FOREIGN KEY (`ML_ID`) REFERENCES `membership_level` (`ML_ID`),
  CONSTRAINT `flyerbonus_membership_ibfk_2` FOREIGN KEY (`FLPAX_ID`) REFERENCES `passenger` (`PAX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flyerbonus_membership`
--

LOCK TABLES `flyerbonus_membership` WRITE;
/*!40000 ALTER TABLE `flyerbonus_membership` DISABLE KEYS */;
INSERT INTO `flyerbonus_membership` VALUES (60152100,'Nakarin103',8,'Thai',57256567,103,'2020-07-16'),(60152101,'Amitah110',10,'Thai',68378934,110,'2020-12-14'),(60152109,'Giju119',5,'English',97863546,119,'2022-01-24'),(60152111,'Taweerat102',5,'Thai',97863546,102,'2022-05-30'),(60152118,'Vivek111',10,'English',68378934,111,'2020-10-14'),(60152119,'Malika170',5,'English',97863546,107,'2021-12-19'),(60152201,'Minami116',5,'English',97863546,116,'2021-01-28'),(60152207,'Micah114',8,'English',57256567,114,'2020-11-04'),(60152210,'Jonathan118',8,'English',57256567,118,'2021-03-23'),(60152211,'Petchra105',5,'Thai',97863546,105,'2021-03-09');
/*!40000 ALTER TABLE `flyerbonus_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foreign_passenger`
--

DROP TABLE IF EXISTS `foreign_passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foreign_passenger` (
  `FPAX_ID` int NOT NULL,
  `visa_number` varchar(15) NOT NULL,
  `nationality` varchar(15) NOT NULL,
  PRIMARY KEY (`FPAX_ID`,`visa_number`),
  CONSTRAINT `foreign_passenger_ibfk_1` FOREIGN KEY (`FPAX_ID`) REFERENCES `passenger` (`PAX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foreign_passenger`
--

LOCK TABLES `foreign_passenger` WRITE;
/*!40000 ALTER TABLE `foreign_passenger` DISABLE KEYS */;
INSERT INTO `foreign_passenger` VALUES (110,'76345240','Indian'),(111,'67690686','Indian'),(112,'87128669','Indian'),(113,'16517894','Indian'),(114,'34213619','Chinese'),(115,'37763659','Chinese'),(116,'31350813','Korean'),(117,'85523087','Chinese'),(118,'52684003','Korean'),(119,'86120784','Korean'),(120,'81721391','Korean');
/*!40000 ALTER TABLE `foreign_passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_engineer`
--

DROP TABLE IF EXISTS `maintenance_engineer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance_engineer` (
  `MEMP_ID` int NOT NULL,
  `pratiotioner_license` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MEMP_ID`),
  CONSTRAINT `maintenance_engineer_ibfk_1` FOREIGN KEY (`MEMP_ID`) REFERENCES `employee` (`EMP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_engineer`
--

LOCK TABLES `maintenance_engineer` WRITE;
/*!40000 ALTER TABLE `maintenance_engineer` DISABLE KEYS */;
INSERT INTO `maintenance_engineer` VALUES (632284,'Category B2'),(632290,'Category B3'),(632300,'Category A'),(632311,'Category B1'),(632320,'Category B1'),(632322,'Category B1'),(632323,'Category B3'),(632324,'Category C'),(632325,'Category C'),(632326,'Category A');
/*!40000 ALTER TABLE `maintenance_engineer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenancee_check_airplane`
--

DROP TABLE IF EXISTS `maintenancee_check_airplane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenancee_check_airplane` (
  `M_EMP_ID` int NOT NULL,
  `AIRP_ID` char(6) NOT NULL,
  PRIMARY KEY (`M_EMP_ID`,`AIRP_ID`),
  KEY `AIRP_ID` (`AIRP_ID`),
  CONSTRAINT `maintenancee_check_airplane_ibfk_1` FOREIGN KEY (`M_EMP_ID`) REFERENCES `maintenance_engineer` (`MEMP_ID`),
  CONSTRAINT `maintenancee_check_airplane_ibfk_2` FOREIGN KEY (`AIRP_ID`) REFERENCES `airplane` (`AIRP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenancee_check_airplane`
--

LOCK TABLES `maintenancee_check_airplane` WRITE;
/*!40000 ALTER TABLE `maintenancee_check_airplane` DISABLE KEYS */;
INSERT INTO `maintenancee_check_airplane` VALUES (632300,'880455'),(632323,'880455'),(632324,'880455'),(632311,'88084F'),(632322,'88084F'),(632323,'88084F'),(632290,'880C4A'),(632323,'880C4A'),(632325,'880C4A'),(632290,'881056'),(632311,'881056'),(632325,'881056'),(632320,'8832B0'),(632322,'8832B0'),(632325,'8832B0'),(632284,'8832B1'),(632324,'8832B1'),(632326,'8832B1'),(632284,'88434E'),(632320,'88434E'),(632324,'88434E'),(632300,'88530C'),(632311,'88530C'),(632326,'88530C'),(632290,'885966'),(632322,'885966'),(632326,'885966'),(632284,'88596D'),(632300,'88596D'),(632320,'88596D');
/*!40000 ALTER TABLE `maintenancee_check_airplane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership_level`
--

DROP TABLE IF EXISTS `membership_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership_level` (
  `ML_ID` int NOT NULL,
  `mem_name` varchar(20) NOT NULL,
  `qualifying_point` int NOT NULL,
  `qualifying_sector` int NOT NULL,
  `validation_period` int NOT NULL,
  PRIMARY KEY (`ML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership_level`
--

LOCK TABLES `membership_level` WRITE;
/*!40000 ALTER TABLE `membership_level` DISABLE KEYS */;
INSERT INTO `membership_level` VALUES (57256567,'Premium',12500,35,12),(68378934,'Premium Plus',40000,50,12),(97863546,'Priority',0,0,0);
/*!40000 ALTER TABLE `membership_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `network_planning`
--

DROP TABLE IF EXISTS `network_planning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `network_planning` (
  `NEMP_ID` int NOT NULL,
  `algorithm_level` varchar(20) NOT NULL,
  PRIMARY KEY (`NEMP_ID`),
  CONSTRAINT `network_planning_ibfk_1` FOREIGN KEY (`NEMP_ID`) REFERENCES `employee` (`EMP_ID`),
  CONSTRAINT `algorithm_level` CHECK ((`algorithm_level` in (_utf8mb4'Novice',_utf8mb4'Moderate',_utf8mb4'Expert')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `network_planning`
--

LOCK TABLES `network_planning` WRITE;
/*!40000 ALTER TABLE `network_planning` DISABLE KEYS */;
INSERT INTO `network_planning` VALUES (632281,'Novice'),(632282,'Moderate'),(632292,'Expert'),(632297,'Moderate'),(632299,'Novice'),(632302,'Moderate'),(632305,'Expert'),(632306,'Moderate'),(632310,'Expert'),(632312,'Expert');
/*!40000 ALTER TABLE `network_planning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger` (
  `PAX_ID` int NOT NULL,
  `FName` varchar(250) NOT NULL,
  `MName` varchar(250) DEFAULT NULL,
  `LName` varchar(250) NOT NULL,
  `Pgender` char(1) NOT NULL,
  `passport_num` varchar(25) NOT NULL,
  `DOB` date NOT NULL,
  PRIMARY KEY (`PAX_ID`),
  CONSTRAINT `Pgender` CHECK ((`Pgender` in (_utf8mb4'M',_utf8mb4'F')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (101,'Sunan','Jaijing','Aromdee','M','AA6342205','1991-06-04'),(102,'Taweerat','','Poolvaraluck','M','AA6235110','1987-06-06'),(103,'Nakarin','','Chaiyansan','M','AA2143376','1991-04-14'),(104,'Jirattikarn','Malina','Kasamsun','F','AA1234546','1989-11-30'),(105,'Petchra','','Thanwareth','F','AA6326695','1993-03-13'),(106,'Puttipat','','Srisai','M','AA9874323','1998-02-23'),(107,'Malika','','Srisai','F','AA1594533','1988-07-04'),(108,'Natee','','Maleenon','M','AA6474058','1987-06-27'),(109,'Tulaya','Jennifer','Khumpa','F','AA1923452','1977-03-14'),(110,'Amitah','Anika','Singh','F','J8369854','1975-09-19'),(111,'Vivek','Yuraj','Bhatia','M','J8565534','1984-08-23'),(112,'Geetika','','Chauhan','F','J8325112','2003-12-23'),(113,'Carlos','James','Arya','M','J8436611','1973-08-17'),(114,'Micah','Jones','Li','M','G34545410','1970-04-13'),(115,'Davie','Sanjaya','Yang','M','G39450453','1990-04-20'),(116,'Minami','Christine','Chung','F','M79004324','1996-04-11'),(117,'Eric','Wanno','Zhao','M','E05123434','1992-05-17'),(118,'Jonathan','Joseph','Kim','M','M49343554','1976-11-20'),(119,'Giju','Jhohan','Yoon','F','M55604532','2000-07-14'),(120,'Jiwon','','Kim','M','M70656734','1982-02-08');
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger_address`
--

DROP TABLE IF EXISTS `passenger_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger_address` (
  `PAPAX_ID` int NOT NULL,
  `PAX_AID` int NOT NULL,
  `number` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `county` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  PRIMARY KEY (`PAPAX_ID`,`PAX_AID`),
  KEY `pass_address_id` (`PAX_AID`),
  CONSTRAINT `passenger_address_ibfk_1` FOREIGN KEY (`PAPAX_ID`) REFERENCES `passenger` (`PAX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger_address`
--

LOCK TABLES `passenger_address` WRITE;
/*!40000 ALTER TABLE `passenger_address` DISABLE KEYS */;
INSERT INTO `passenger_address` VALUES (101,5678,'322 Sukhothai 2','Suan Chitlada','Dusit','Bangkok','Thailand','10110'),(102,5679,'365/2-3','Phrasumen','Bavornnives','Bangkok','Thailand','10200'),(103,5680,'1770-1772','Sukhumvit','Prakhanong','Bangkok','Thailand','10250'),(104,5681,'64/18 Soi Sainampueng','Sukhumvit','Klongtoey','Bangkok','Thailand','10110'),(105,5682,'231 9Th Floor The Park Place Ath Building','Ratchadamri','Pathumwan','Bangkok','Thailand','10330'),(106,5683,'8/25-27','Kanchanapisek','Bangkhae','Bangkok','Thailand','10160'),(107,5684,'95/397-8 Soi Chiangkong','Rama 3','Chong Nonsree','Bangkok','Thailand','10120'),(108,5685,'98/205 Laksee Village','Chaengwatana','Laksi','Bangkok','Thailand','10210'),(109,5686,'314/23','Rajaprarop','Phayathai','Bangkok','Thailand','10400'),(110,5687,'144/110 Soi Uthit 1','Klong Chan','Bang Kapi','Bangkok','Thailand','10240'),(111,5688,'23/2 Moo 3 Soi Phalai','Chaofa','Muang','Phuket','Thailand','83000'),(112,5689,'Moo 5','Kan Ham','Uthai','Phra Nakhon Si Ayutth','Thailand','13210'),(113,5690,'126/19-20 Soi Ekamai','Sukhumvit','Klongton Nua','Bangkok','Thailand','10110'),(114,5691,'54','Montree','Ladyai','Phuket','Thailand','83000'),(115,5692,'32/45-6 Soi 8','Charansanitwong','Bangkokyai','Bangkok','Thailand','10200'),(116,5693,'189 Soi Asoke','Sukhumvit','Watthana','Bangkok','Thailand','10110'),(117,5694,'28/9 Moo 10','Ekachai','Bangbon','Bangkok','Thailand','10150'),(118,5695,'89/493 Soi Wat','Chalermphrakiat 3','Bangsrimuang','Nonthaburi','Thailand','11000'),(119,5696,'501/77','Nanglinchee','Chongnonsi','Bangkok','Thailand','10120'),(120,5697,'1020/123 Soi 57','Prachauthit','Bang Mod','Bangkok','Thailand','10140');
/*!40000 ALTER TABLE `passenger_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `PYMT_ID` int NOT NULL,
  `PYMT_datetime` datetime NOT NULL,
  `PYMT_mode` varchar(20) NOT NULL,
  `service_charge` int NOT NULL DEFAULT '0',
  `discount` int NOT NULL DEFAULT '0',
  `PPAX_ID` int NOT NULL,
  PRIMARY KEY (`PYMT_ID`,`PPAX_ID`),
  KEY `PPAX_ID` (`PPAX_ID`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`PPAX_ID`) REFERENCES `passenger` (`PAX_ID`),
  CONSTRAINT `PYMT_mode` CHECK ((`PYMT_mode` in (_utf8mb4'ATM',_utf8mb4'Debit',_utf8mb4'Credit',_utf8mb4'counter',_utf8mb4'ibanking')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (112022,'2022-07-08 12:09:11','ATM',25,0,101),(121212,'2022-07-30 22:59:11','Credit',50,200,106),(138878,'2022-08-26 12:36:11','Credit',0,200,114),(181824,'2022-08-02 22:47:02','counter',50,0,107),(212417,'2022-07-22 02:55:55','Debit',20,500,104),(231842,'2022-09-10 09:06:35','Credit',50,200,119),(234685,'2022-07-11 17:21:09','Debit',20,500,101),(243675,'2022-08-11 04:05:53','Debit',20,500,119),(245806,'2022-08-29 05:33:07','ATM',25,0,115),(251478,'2022-08-14 14:19:01','Credit',0,200,111),(251846,'2022-07-09 10:15:19','Debit',20,500,101),(253685,'2022-08-27 20:29:58','ibanking',0,0,114),(253685,'2022-09-06 08:07:42','ATM',25,0,118),(253687,'2022-08-03 07:03:32','ibanking',0,0,107),(254178,'2022-08-12 21:52:51','ibanking',0,0,110),(254178,'2022-08-17 20:50:35','Credit',50,200,112),(254178,'2022-08-27 23:29:37','ibanking',0,0,115),(254631,'2022-08-24 04:42:51','Debit',20,500,114),(254698,'2022-07-22 16:44:19','counter',50,0,105),(254816,'2022-08-03 10:46:27','ATM',25,0,108),(256321,'2022-08-16 05:02:03','Debit',20,500,111),(256367,'2022-08-30 17:54:55','ibanking',0,0,116),(256368,'2022-08-09 12:45:56','ATM',25,0,110),(258965,'2022-08-04 20:54:15','ibanking',0,0,108),(284152,'2022-08-06 22:48:44','Debit',20,500,109),(315859,'2022-09-05 12:54:29','Credit',50,200,117),(325689,'2022-08-18 10:31:37','Credit',0,200,112),(364215,'2022-08-01 16:41:02','Credit',0,200,106),(364521,'2022-07-28 12:00:00','ATM',25,0,105),(417852,'2022-08-11 16:38:45','counter',50,0,110),(447573,'2022-07-21 10:43:34','ATM',25,0,103),(452168,'2022-07-22 16:44:19','Debit',20,500,103),(471542,'2022-08-05 08:07:36','Debit',20,500,109),(513346,'2022-07-24 08:22:21','ATM',25,0,104),(517528,'2022-08-22 08:10:22','Credit',50,200,113),(528741,'2022-08-31 16:43:36','ATM',25,0,116),(541782,'2022-08-04 23:19:47','ibanking',0,0,108),(542123,'2022-07-19 12:00:22','ibanking',0,0,103),(542187,'2022-09-08 12:29:35','ibanking',0,0,118),(543673,'2022-08-15 09:11:57','Debit',20,500,120),(545168,'2022-07-27 17:11:32','ibanking',0,0,105),(554218,'2022-08-08 21:47:28','Credit',50,200,109),(567285,'2022-07-31 12:09:11','Debit',20,500,106),(646506,'2022-08-17 09:26:03','Debit',20,500,112),(646882,'2022-08-31 08:14:59','ibanking',0,0,116),(784125,'2022-08-17 09:26:03','Debit',20,500,111),(796502,'2022-08-23 13:16:47','Debit',20,500,113),(824150,'2022-09-03 10:23:14','Debit',20,500,117),(826829,'2022-09-12 23:15:28','ATM',25,0,120),(843468,'2022-09-14 08:37:34','ibanking',0,0,120),(845136,'2022-07-23 04:49:48','Credit',50,200,104),(846321,'2022-09-09 00:10:03','ATM',25,0,119),(846588,'2022-09-01 23:42:03','Debit',20,500,117),(852142,'2022-08-20 00:53:02','ibanking',0,0,113),(852439,'2022-07-15 15:29:12','ATM',25,0,102),(854210,'2022-08-01 13:58:00','ATM',25,0,107),(854725,'2022-08-27 10:02:17','Credit',50,0,115),(866458,'2022-07-17 20:30:09','counter',50,0,102),(881662,'2022-09-07 20:37:12','counter',50,0,118),(965820,'2022-07-14 12:26:13','Credit',50,200,102);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilot`
--

DROP TABLE IF EXISTS `pilot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pilot` (
  `PEMP_ID` int NOT NULL,
  `year_of_experience` int NOT NULL,
  `license` char(4) NOT NULL,
  `english_certification` int NOT NULL,
  PRIMARY KEY (`PEMP_ID`),
  CONSTRAINT `pilot_ibfk_1` FOREIGN KEY (`PEMP_ID`) REFERENCES `air_crew` (`AEMP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilot`
--

LOCK TABLES `pilot` WRITE;
/*!40000 ALTER TABLE `pilot` DISABLE KEYS */;
INSERT INTO `pilot` VALUES (632289,10,'PPL',5),(632293,4,'CPL',3),(632294,2,'CPL',6),(632295,9,'ATPL',3),(632301,5,'PPL',5),(632303,9,'PPL',4),(632313,7,'ATPL',5),(632314,7,'ATPL',5),(632318,3,'CPL',5),(632321,3,'CPL',6);
/*!40000 ALTER TABLE `pilot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pilot_fly_flightsch`
--

DROP TABLE IF EXISTS `pilot_fly_flightsch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pilot_fly_flightsch` (
  `P_EMP_ID` int NOT NULL,
  `FLTS_ID` int NOT NULL,
  `cockpit_position` varchar(20) NOT NULL,
  PRIMARY KEY (`P_EMP_ID`,`FLTS_ID`),
  KEY `FLTS_ID` (`FLTS_ID`),
  CONSTRAINT `pilot_fly_flightsch_ibfk_1` FOREIGN KEY (`P_EMP_ID`) REFERENCES `pilot` (`PEMP_ID`),
  CONSTRAINT `pilot_fly_flightsch_ibfk_2` FOREIGN KEY (`FLTS_ID`) REFERENCES `flight_schedule` (`FLTS_ID`),
  CONSTRAINT `cockpit_position` CHECK ((`cockpit_position` in (_utf8mb4'Captain',_utf8mb4'Co-pilot')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pilot_fly_flightsch`
--

LOCK TABLES `pilot_fly_flightsch` WRITE;
/*!40000 ALTER TABLE `pilot_fly_flightsch` DISABLE KEYS */;
INSERT INTO `pilot_fly_flightsch` VALUES (632289,650823,'Co-pilot'),(632289,651104,'Co-pilot'),(632289,652153,'Co-pilot'),(632289,653265,'Captain'),(632289,657976,'Co-pilot'),(632289,658344,'Co-pilot'),(632293,653156,'Captain'),(632293,653389,'Captain'),(632293,657976,'Captain'),(632293,659260,'Co-pilot'),(632293,659358,'Captain'),(632293,659925,'Captain'),(632294,651180,'Co-pilot'),(632294,654235,'Co-pilot'),(632294,655108,'Co-pilot'),(632294,656556,'Co-pilot'),(632294,658173,'Co-pilot'),(632294,658189,'Co-pilot'),(632295,651180,'Captain'),(632295,654040,'Captain'),(632295,654235,'Captain'),(632295,654676,'Co-pilot'),(632295,657845,'Co-pilot'),(632295,658173,'Captain'),(632301,650035,'Co-pilot'),(632301,655225,'Co-pilot'),(632301,655993,'Captain'),(632301,656556,'Captain'),(632301,658114,'Co-pilot'),(632301,659260,'Captain'),(632303,651104,'Captain'),(632303,654398,'Co-pilot'),(632303,654488,'Captain'),(632303,655993,'Co-pilot'),(632303,659358,'Co-pilot'),(632303,659925,'Co-pilot'),(632313,650035,'Captain'),(632313,653156,'Co-pilot'),(632313,653389,'Co-pilot'),(632313,655225,'Captain'),(632313,658114,'Captain'),(632313,658189,'Captain'),(632314,650997,'Captain'),(632314,653004,'Co-pilot'),(632314,653265,'Co-pilot'),(632314,654177,'Captain'),(632314,654488,'Co-pilot'),(632314,656432,'Captain'),(632318,650823,'Captain'),(632318,652153,'Captain'),(632318,654040,'Co-pilot'),(632318,654398,'Captain'),(632318,654676,'Captain'),(632318,658344,'Captain'),(632321,650997,'Co-pilot'),(632321,653004,'Captain'),(632321,654177,'Co-pilot'),(632321,655108,'Captain'),(632321,656432,'Co-pilot'),(632321,657845,'Captain');
/*!40000 ALTER TABLE `pilot_fly_flightsch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `route` (
  `R_ID` int NOT NULL,
  `distance` int NOT NULL,
  `route_type` varchar(30) NOT NULL,
  `point` int NOT NULL,
  `DEPT_AIRPT` char(4) NOT NULL,
  `ARR_AIRPT` char(4) NOT NULL,
  `N_EMP_ID` int NOT NULL,
  PRIMARY KEY (`R_ID`),
  KEY `DEPT_AIRPT` (`DEPT_AIRPT`),
  KEY `ARR_AIRPT` (`ARR_AIRPT`),
  KEY `N_EMP_ID` (`N_EMP_ID`),
  CONSTRAINT `route_ibfk_1` FOREIGN KEY (`DEPT_AIRPT`) REFERENCES `airport` (`AIRPT_ID`),
  CONSTRAINT `route_ibfk_2` FOREIGN KEY (`ARR_AIRPT`) REFERENCES `airport` (`AIRPT_ID`),
  CONSTRAINT `route_ibfk_3` FOREIGN KEY (`N_EMP_ID`) REFERENCES `employee` (`EMP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (640083,592,'International',50,'VTSM','VDSR',632310),(640480,406,'Domestic',20,'VTPO','VTBS',632282),(640760,1410,'International',50,'VTBS','WSSS',632282),(641589,594,'Domestic',50,'VTBS','VTCC',632281),(641923,633,'International',50,'VTCT','VVNB',632292),(642076,504,'International',50,'VDPP','VTBS',632305),(643026,231,'Domestic',10,'VTBO','VTBS',632306),(644480,504,'International',20,'VTBS','VDPP',632297),(644725,333,'International',20,'VTBS','VDSR',632302),(645642,766,'International',50,'VTCC','VVNB',632310),(646846,361,'Domestic',20,'VTBU','VTSM',632312),(647701,716,'International',50,'VTBS','VVTS',632306),(648043,249,'Domestic',10,'VTSP','VTSM',632312),(648870,463,'Domestic',20,'VTSM','VTBS',632292),(649853,671,'Domestic',50,'VTBS','VTSP',632299);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `Seat_ID` int NOT NULL,
  `row_num` char(10) NOT NULL,
  `ST_ID` int NOT NULL,
  PRIMARY KEY (`Seat_ID`,`ST_ID`),
  KEY `ST_ID` (`ST_ID`),
  CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`ST_ID`) REFERENCES `seat_type` (`SeatT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES (11111,'C21',302),(12141,'E7',304),(12726,'E1',305),(13401,'A12',303),(19637,'B12',303),(20411,'F3',305),(21325,'B20',302),(21511,'B10',304),(24142,'B11',303),(25806,'E20',302),(27858,'A21',302),(29406,'E3',305),(29666,'B8',304),(29965,'D8',304),(31243,'D11',303),(32937,'F22',301),(36004,'E22',301),(40207,'E10',304),(41936,'A3',305),(42190,'A1',305),(42240,'E21',302),(43988,'A2',305),(44456,'D7',304),(44755,'D20',302),(44897,'A7',304),(46308,'E2',305),(47480,'A20',302),(49254,'F7',304),(49667,'C20',302),(50924,'F21',302),(52034,'F20',302),(52672,'C8',304),(53342,'C22',301),(53531,'C11',303),(58068,'C12',303),(59315,'F2',305),(59475,'F10',304),(60992,'A8',304),(61476,'A11',303),(63048,'F11',303),(64342,'E8',304),(66131,'D12',303),(67672,'B7',304),(67783,'B22',301),(71003,'D10',304),(71229,'F8',304),(77178,'F12',303),(77498,'D22',301),(78760,'B3',305),(83116,'E12',303),(84262,'E11',303),(84804,'A10',304),(85917,'C7',304),(86222,'D21',302),(87593,'B21',302),(88205,'A22',301),(88600,'F1',305),(93799,'B2',305),(95130,'B1',305),(95770,'C10',304);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat_type`
--

DROP TABLE IF EXISTS `seat_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat_type` (
  `SeatT_ID` int NOT NULL,
  `Sname` varchar(100) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`SeatT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat_type`
--

LOCK TABLES `seat_type` WRITE;
/*!40000 ALTER TABLE `seat_type` DISABLE KEYS */;
INSERT INTO `seat_type` VALUES (301,'Economy',2500),(302,'EconomyLL',3000),(303,'EconomyC',3500),(304,'Business',20000),(305,'First',30000);
/*!40000 ALTER TABLE `seat_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thai_passenger`
--

DROP TABLE IF EXISTS `thai_passenger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thai_passenger` (
  `TPAX_ID` int NOT NULL,
  `national_ID` varchar(15) NOT NULL,
  PRIMARY KEY (`TPAX_ID`,`national_ID`),
  CONSTRAINT `thai_passenger_ibfk_1` FOREIGN KEY (`TPAX_ID`) REFERENCES `passenger` (`PAX_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thai_passenger`
--

LOCK TABLES `thai_passenger` WRITE;
/*!40000 ALTER TABLE `thai_passenger` DISABLE KEYS */;
INSERT INTO `thai_passenger` VALUES (101,'2905000663917'),(102,'2677775213485'),(103,'2361103442290'),(104,'1598498054337'),(105,'1602098789836'),(106,'2508441121022'),(107,'2807581223544'),(108,'2610339688532'),(109,'1608527719452');
/*!40000 ALTER TABLE `thai_passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `TCK_ID` int NOT NULL,
  `reservation_date` date NOT NULL,
  `PYMT_ID` int NOT NULL,
  `Seat_ID` int NOT NULL,
  `FLTS_ID` int NOT NULL,
  PRIMARY KEY (`TCK_ID`),
  KEY `PYMT_ID` (`PYMT_ID`),
  KEY `Seat_ID` (`Seat_ID`),
  KEY `FLTS_ID` (`FLTS_ID`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`PYMT_ID`) REFERENCES `payment` (`PYMT_ID`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`Seat_ID`) REFERENCES `seat` (`Seat_ID`),
  CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`FLTS_ID`) REFERENCES `flight_schedule` (`FLTS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (100809,'2022-08-04',541782,40207,654676),(112998,'2022-08-18',325689,50924,659358),(118838,'2022-08-01',854210,27858,659358),(171716,'2022-08-11',417852,41936,653265),(199819,'2022-08-08',554218,59475,655108),(214325,'2022-07-09',251846,71003,654488),(229988,'2022-08-17',254178,42240,651180),(244345,'2022-08-06',284152,46308,653004),(272898,'2022-08-24',254631,53342,650823),(287782,'2022-08-05',471542,88600,651104),(288374,'2022-07-30',121212,43988,651180),(299877,'2022-07-27',545168,44755,658189),(300008,'2022-07-28',364521,52034,659260),(309077,'2022-08-03',253687,71229,654040),(324578,'2022-07-08',112022,77178,657845),(339876,'2022-08-01',364215,95770,654398),(378483,'2022-08-09',256368,95130,650823),(395874,'2022-08-03',254816,21325,658114),(399800,'2022-07-24',513346,42190,650035),(400708,'2022-08-04',258965,53531,656432),(445577,'2022-08-16',256321,86222,654177),(454367,'2022-08-26',138878,88600,654235),(485983,'2022-09-12',826829,12726,650997),(494988,'2022-08-22',517528,67783,656556),(553209,'2022-07-15',852439,59315,653156),(555678,'2022-08-02',181824,24142,655993),(642785,'2022-07-17',866458,78760,653389),(648282,'2022-09-06',253685,93799,652153),(656787,'2022-08-12',254178,11111,658344),(734682,'2022-08-05',471542,83116,656556),(746391,'2022-07-23',845136,47480,657976),(788424,'2022-07-22',212417,61476,655225),(794739,'2022-08-27',854725,93799,650997),(805839,'2022-07-19',542123,84804,654177),(829348,'2022-08-30',256367,21511,654235),(837292,'2022-08-27',254178,43988,652153),(909866,'2022-08-20',852142,88205,658114),(978865,'2022-07-14',965820,25806,658344),(989533,'2022-07-21',447573,87593,659925),(989872,'2022-07-31',567285,49667,658173);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel_insurance`
--

DROP TABLE IF EXISTS `travel_insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travel_insurance` (
  `TI_ID` int NOT NULL,
  `issued_date` date NOT NULL,
  `travel_num` int NOT NULL,
  `exp_date` int NOT NULL,
  `dept_city` char(3) NOT NULL,
  `dest_city` char(3) NOT NULL,
  `trip_type` varchar(20) NOT NULL,
  `coverage_amount` int NOT NULL,
  `categories` varchar(200) NOT NULL,
  `special_description` varchar(250) DEFAULT NULL,
  `PYMT_ID` int NOT NULL,
  PRIMARY KEY (`TI_ID`,`PYMT_ID`),
  KEY `PYMT_ID` (`PYMT_ID`),
  CONSTRAINT `travel_insurance_ibfk_1` FOREIGN KEY (`PYMT_ID`) REFERENCES `payment` (`PYMT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_insurance`
--

LOCK TABLES `travel_insurance` WRITE;
/*!40000 ALTER TABLE `travel_insurance` DISABLE KEYS */;
INSERT INTO `travel_insurance` VALUES (135732,'2022-08-11',1,90,'BKK','CNX','one way',500000,'Personal Liability ','',243675),(136885,'2022-08-17',2,90,'USM','REP','Round',20000,'Loss or Damage of Bagage','',784125),(233456,'2022-08-27',1,90,'CNX','HAN','one way',0,'Trip Cancellation ','Ticket price',253685),(334598,'2022-09-05',2,90,'BKK','CNX','Round',500000,'Personal Liability ','',315859),(456824,'2022-08-14',2,90,'CEI','HAN','Round',10000,'Bagage Delay','Every 6 hours/1000 THB',251478),(567964,'2022-07-22',1,90,'BKK','SIN','one way',500000,'Medical Expense','',452168),(578974,'2022-07-11',1,90,'BKK','CNX','one way',1000000,'Loss of Life','',234685),(668974,'2022-08-23',1,90,'THS','BKK','one way',0,'Trip Cancellation ','Ticket price',796502),(897534,'2022-08-17',1,90,'BKK','HKT','one way',0,'Trip Cancellation ','Ticket price',646506),(987541,'2022-08-15',2,90,'BKK','CNX','Round',500000,'Personal Liability ','',543673);
/*!40000 ALTER TABLE `travel_insurance` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-23 21:39:52
