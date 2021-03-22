-- MariaDB dump 10.18  Distrib 10.5.8-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: hyacinth
-- ------------------------------------------------------
-- Server version	10.5.8-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_Employee_Admin` FOREIGN KEY (`ID`) REFERENCES `employee` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (50);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ambulance`
--

DROP TABLE IF EXISTS `ambulance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ambulance` (
  `ID` int(11) NOT NULL,
  `lastMaintenance` datetime DEFAULT NULL,
  `totalDistance` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ambulance`
--

LOCK TABLES `ambulance` WRITE;
/*!40000 ALTER TABLE `ambulance` DISABLE KEYS */;
INSERT INTO `ambulance` VALUES (1,'2018-01-01 00:00:04',3),(2,'2020-08-28 03:13:14',8725910),(3,'2018-01-01 00:00:08',7),(4,'2019-06-12 19:41:07',8561610),(5,'2019-07-07 13:20:04',1711720),(6,NULL,734547),(7,'2021-03-11 20:03:42',7017220),(8,'2018-11-25 05:40:55',8649100),(9,'2020-11-22 14:54:40',7689120),(10,'2018-09-28 21:38:56',938980),(11,'2019-12-12 01:22:41',638),(12,'2018-01-01 00:10:39',3399),(13,'2018-01-01 00:56:40',9835410),(14,'2019-11-03 19:04:14',65),(15,'2018-01-01 00:01:06',414),(16,'2018-01-01 00:06:55',7797850),(17,'2019-09-28 08:56:18',24),(18,'2018-01-01 00:00:25',5724260),(19,'2019-03-21 06:33:58',8694940),(20,'2020-09-22 19:40:11',3453),(21,'2018-01-01 00:57:34',7748),(22,'2018-01-01 02:09:09',9947960),(23,'2018-07-05 02:30:44',8745),(24,'2018-01-01 02:25:46',1364150),(25,'2019-01-11 01:25:52',9),(26,'2018-01-01 00:00:10',5568200),(27,'2020-11-18 23:44:22',4818420),(28,'2020-08-22 16:40:09',8530190),(29,'2019-03-07 20:29:33',9852830),(30,'2019-05-16 16:12:09',7106440),(31,'2020-11-09 00:55:37',3),(32,'2018-01-01 00:00:04',9316640),(33,'2018-08-19 02:15:27',990),(34,'2018-01-01 00:16:31',8255100),(35,'2020-07-10 17:30:30',149950),(36,'2019-10-11 04:38:18',2175560),(37,'2018-06-10 23:33:07',6697450),(38,'2020-06-01 13:18:47',9714700),(39,'2020-10-10 12:32:50',601),(40,'2018-01-01 00:10:02',7194),(41,'2018-01-01 01:59:55',9496030),(42,'2021-02-27 10:03:35',37),(43,'2018-01-01 00:00:38',12),(44,'2018-01-01 00:00:13',7217160),(45,NULL,5544820),(46,'2020-08-12 06:45:30',5492470),(47,NULL,306),(48,'2019-07-04 12:12:31',7734640),(49,'2020-10-09 12:12:57',439),(50,'2018-01-01 00:05:07',3681770);
/*!40000 ALTER TABLE `ambulance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment` (
  `ID` int(11) NOT NULL,
  `startTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `endTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remarks` varchar(40) DEFAULT NULL,
  `invoiceId` int(11) NOT NULL,
  `prescriptionId` int(11) NOT NULL,
  `consultationId` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `invoiceId` (`invoiceId`),
  UNIQUE KEY `prescriptionId` (`prescriptionId`),
  KEY `FK_Consultation_Appointment` (`consultationId`),
  CONSTRAINT `FK_Consultation_Appointment` FOREIGN KEY (`consultationId`) REFERENCES `consultation` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Invoice_Appointment` FOREIGN KEY (`invoiceId`) REFERENCES `invoice` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Prescription_Appointment` FOREIGN KEY (`prescriptionId`) REFERENCES `prescription` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (1,'2018-08-19 01:29:33','2018-08-20 17:16:33','Molestias voluptatem dolores.\r\n',48,36,3),(2,'2018-05-22 11:47:07','2018-05-23 01:35:33','Ut voluptatem et. Ab corporis.',44,49,16),(3,'2017-12-31 19:49:23','2018-01-01 07:44:51','Doloribus temporibus eum;',50,27,11),(4,'2018-08-30 00:15:59','2018-09-01 01:28:19','Quaerat assumenda.\r\n',39,47,11),(5,'2018-05-17 21:34:49','2018-05-18 16:30:25','Tempore aut eos. Quo commodi.\r\n',24,11,3),(6,'2018-10-13 05:40:32','2018-10-13 08:26:22','Eveniet atque aut. Sapiente!\r\n',30,20,16),(7,'2019-07-23 12:18:46','2019-07-26 00:24:44','Quod totam quos. Qui.\r\n',25,45,27),(8,'2018-08-10 16:40:49','2018-08-12 09:04:06','Voluptatem deleniti ut.\r\n',34,42,1),(9,'2018-08-24 06:31:49','2018-08-25 22:58:28','Est ut autem. Accusamus...\r\n',31,37,2),(10,'2020-03-19 00:23:25','2020-03-20 00:22:39','Sit at est. Fugiat earum.\r\n',40,48,3),(11,'2017-12-31 18:30:07','2017-12-31 20:15:44','Impedit rem adipisci. Hic;',46,50,4),(12,'2020-04-24 06:27:13','2020-04-25 03:44:31','Sequi ut eum. Quam aut.',6,43,29),(13,'2018-10-08 03:35:09','2018-10-09 21:26:00','Harum et quod; consequatur.\r\n',49,38,20),(14,'2020-07-13 07:46:28','2020-07-14 23:29:37','Et sunt sed.\r\nDeserunt.\r\n',1,15,16),(15,'2019-09-27 20:33:06','2019-09-28 19:26:06','Rem vero esse. Eius laudantium.',47,46,7),(16,'2020-04-30 11:13:03','2020-05-02 11:37:44','In voluptatem molestiae.\r\n',45,21,17),(17,'2018-12-19 01:28:21','2018-12-21 17:20:19','Suscipit repellat eum. Id.\r\n',16,6,8),(18,'2017-12-31 19:30:32','2018-01-02 02:43:42','Placeat quia fuga. Itaque.\r\n',22,16,10),(19,'2019-03-07 09:30:42','2019-03-09 18:19:05','Ipsam architecto.\r\n',7,33,10),(20,'2018-02-03 19:28:33','2018-02-05 13:16:03','Unde laboriosam molestias.',35,28,4),(21,'2019-07-02 04:14:19','2019-07-04 19:05:54','Vel beatae unde.\r\nSed.\r\n',41,44,12),(22,'2019-11-26 01:44:48','2019-11-26 09:40:26','Perspiciatis ad nulla.\r\n',26,1,25),(23,'2020-12-29 20:19:26','2020-12-30 09:30:24','Et quisquam sunt. Sed.',2,7,10),(24,'2017-12-31 18:44:28','2018-01-03 05:23:35','Sed et est; aliquid.\r\n',17,23,19),(25,'2017-12-31 18:30:07','2018-01-01 03:54:43',NULL,12,29,8),(26,'2020-10-20 21:22:54','2020-10-23 13:03:54',NULL,32,22,4),(27,'2021-02-16 20:51:49','2021-02-18 17:47:54','Animi dolorum aut.\r\n',18,24,2),(28,'2019-01-02 01:27:00','2019-01-03 16:19:55','Provident sed velit.\r\n',8,39,2),(29,'2018-03-19 18:33:42','2018-03-19 19:16:03','Corrupti laborum;\r\n',13,2,8),(30,'2017-12-31 18:30:12','2018-01-02 20:02:59','Et voluptates quibusdam.\r\n',27,17,2),(31,'2018-09-04 16:58:28','2018-09-04 18:34:14','Deleniti vitae facere. Error.\r\n',36,12,10),(32,'2020-12-13 07:26:50','2020-12-14 01:56:30','Adipisci voluptate.\r\n',3,30,7),(33,'2018-03-07 06:34:59','2018-03-08 03:59:16','Enim voluptatum.\r\n',33,18,15),(34,'2019-10-11 11:26:58','2019-10-11 14:29:17','Quam est ut. Vero...\r\n',28,25,20),(35,'2018-08-14 19:45:09','2018-08-16 06:43:09','Obcaecati sed assumenda.\r\n',23,13,23),(36,'2017-12-31 18:44:57','2018-01-02 09:22:28','Dolores vero quam. Tenetur;\r\n',42,34,22),(37,'2020-05-20 15:58:18','2020-05-21 14:06:08','Dolore est qui;\r\n',29,19,14),(38,'2018-03-16 19:06:51','2018-03-18 05:28:54','Unde animi obcaecati.\r\n',9,40,19),(39,'2019-08-18 15:05:55','2019-08-20 19:43:53','Nihil id ut.\r\nPossimus.\r\n',4,14,15),(40,'2019-07-08 20:19:27','2019-07-09 23:43:06','Veniam veritatis.\r\n',10,35,15),(41,'2018-07-22 01:35:36','2018-07-22 14:12:09','Magni harum molestiae.\r\n',37,31,21),(42,'2017-12-31 18:31:02','2017-12-31 20:33:01','Consequatur facilis sed.\r\n',43,41,19),(43,'2018-07-14 10:49:23','2018-07-16 01:26:43','Nihil voluptatem.\r\n',5,8,11),(44,'2019-01-11 13:46:39','2019-01-11 22:47:18','Rem sit quis.\r\nAut fugit.',19,26,23),(45,'2019-03-15 15:05:32','2019-03-18 08:57:28','Non consequatur.\r\n',14,3,16),(46,'2021-03-12 12:57:55','2021-03-12 15:32:23','Rerum aut nesciunt. Eius!\r\n',11,9,23),(47,'2020-09-23 02:29:23','2020-09-23 10:50:07','Ad natus ut.',38,32,24),(48,'2019-11-29 11:45:21','2019-12-01 08:33:15','Tempora culpa cumque...\r\n',20,4,14),(49,'2018-03-23 00:07:44','2018-03-23 05:43:23','Unde quas culpa. Iste.\r\n',15,10,11),(50,'2018-08-04 13:13:33','2018-08-06 08:08:59','Vero temporibus quis.\r\n',21,5,17);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assists`
--

DROP TABLE IF EXISTS `assists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assists` (
  `nurseId` int(11) NOT NULL,
  `diagnosticsID` int(11) NOT NULL,
  PRIMARY KEY (`nurseId`,`diagnosticsID`),
  KEY `FK_Diagnostics_Assists` (`diagnosticsID`),
  CONSTRAINT `FK_Diagnostics_Assists` FOREIGN KEY (`diagnosticsID`) REFERENCES `diagnostics` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Nurse_Assists` FOREIGN KEY (`nurseId`) REFERENCES `nurse` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assists`
--

LOCK TABLES `assists` WRITE;
/*!40000 ALTER TABLE `assists` DISABLE KEYS */;
INSERT INTO `assists` VALUES (30,1),(30,2),(30,3),(30,4),(30,5),(31,2),(31,3),(31,4),(31,5),(31,6),(32,3),(32,4),(32,5),(32,6),(32,7),(33,4),(33,5),(33,6),(33,7),(33,8),(34,5),(34,6),(34,7),(34,8),(34,9),(35,6),(35,7),(35,8),(35,9),(35,10),(36,7),(36,8),(36,9),(36,10),(36,11),(37,8),(37,9),(37,10),(37,11),(37,12),(38,9),(38,10),(38,11),(38,12),(38,13),(39,10),(39,11),(39,12),(39,13),(39,14);
/*!40000 ALTER TABLE `assists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultation`
--

DROP TABLE IF EXISTS `consultation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultation` (
  `ID` int(11) NOT NULL,
  `problem` varchar(40) DEFAULT NULL,
  `doctorID` int(11) DEFAULT NULL,
  `patientID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Doctor_Consultation` (`doctorID`),
  KEY `FK_Patient_Consultation` (`patientID`),
  CONSTRAINT `FK_Doctor_Consultation` FOREIGN KEY (`doctorID`) REFERENCES `doctor` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Patient_Consultation` FOREIGN KEY (`patientID`) REFERENCES `patient` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultation`
--

LOCK TABLES `consultation` WRITE;
/*!40000 ALTER TABLE `consultation` DISABLE KEYS */;
INSERT INTO `consultation` VALUES (1,'Omnis et quis.\r\nNulla;',20,23),(2,'Non omnis et; deleniti quae?',7,22),(3,'Cumque qui recusandae;\r\n',17,17),(4,'Voluptatem vel enim. Vel.\r\n',4,12),(5,'Nobis impedit quisquam. A.\r\n',26,43),(6,'Culpa saepe facere.\r\n',29,47),(7,'Dolor sit sint. Repellat quia.',23,29),(8,'Ullam nihil ut. Saepe est;\r\n',21,38),(9,'Illum cumque veritatis.\r\n',27,4),(10,'Eum iste natus. Id.\r\n',18,24),(11,'Voluptatem suscipit harum.\r\n',1,30),(12,'Provident doloribus itaque.',5,45),(13,NULL,24,10),(14,'Eos soluta autem;\r\n',2,18),(15,'Iste sit nesciunt nam.',15,50),(16,'Est architecto quas. Ut!\r\n',28,25),(17,'Neque natus deleniti...\r\nMagnam.',11,48),(18,'Qui error aspernatur. Earum.\r\n',8,46),(19,'Ab molestias hic. Repellendus.',12,49),(20,'Nam ut maxime.\r\nOdit quia.\r\n',9,44),(21,'Et eum quod. Et provident!\r\n',6,39),(22,'Cumque unde dolore. Odit;\r\n',25,34),(23,'Magnam consequuntur beatae.\r\n',3,5),(24,'Voluptas et veniam. Et ullam.',22,11),(25,'Et vitae esse facere sed eos.',19,31),(26,'Aut tempore maiores.\r\n',16,26),(27,'Aliquid facere aliquam at.',13,13),(28,'Sed et iure. Error eum placeat!',10,6),(29,'Ut sed rerum. Voluptatem ipsum.',14,1);
/*!40000 ALTER TABLE `consultation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contains`
--

DROP TABLE IF EXISTS `contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contains` (
  `diagnosticsID` int(11) NOT NULL,
  `prescriptionID` int(11) NOT NULL,
  PRIMARY KEY (`diagnosticsID`,`prescriptionID`),
  KEY `FK_Prescription_Contains` (`prescriptionID`),
  CONSTRAINT `FK_Diagnostics_Contains` FOREIGN KEY (`diagnosticsID`) REFERENCES `diagnostics` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Prescription_Contains` FOREIGN KEY (`prescriptionID`) REFERENCES `prescription` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contains`
--

LOCK TABLES `contains` WRITE;
/*!40000 ALTER TABLE `contains` DISABLE KEYS */;
INSERT INTO `contains` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50);
/*!40000 ALTER TABLE `contains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnostics`
--

DROP TABLE IF EXISTS `diagnostics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diagnostics` (
  `ID` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnostics`
--

LOCK TABLES `diagnostics` WRITE;
/*!40000 ALTER TABLE `diagnostics` DISABLE KEYS */;
INSERT INTO `diagnostics` VALUES (1,'ECG','Molestiae.'),(2,'ECG','Eos molestiae.'),(3,'Vaccine','Est repellat.'),(4,'Scan','Excepturi et.'),(5,'First Aid','Laboriosam.'),(6,'Surgery','Laboriosam.'),(7,'Scan','Fugit.'),(8,'ECG','Atque velit.'),(9,'Surgery','Autem.'),(10,'Scan','Delectus.'),(11,'Scan','Omnis in.'),(12,'First Aid','Sint provident.'),(13,'Surgery','Vero amet qui.'),(14,'Scan','Qui illo sequi.'),(15,'Vaccine','Magni dolore...'),(16,'Surgery','Rerum sunt.'),(17,'Vaccine','Ut ipsum.'),(18,'Vaccine','Officia.'),(19,'First Aid','Ut iusto.'),(20,'Surgery','Non.'),(21,'ECG','Odit deleniti.'),(22,'ECG','Adipisci in.'),(23,'Scan','Quam error.'),(24,'Surgery','Repudiandae.'),(25,'First Aid','Quasi quisquam.'),(26,'ECG','Blanditiis...'),(27,'Surgery','Nobis quo.'),(28,'ECG','Nulla sed id.'),(29,'ECG','Dolor.'),(30,'Scan','Dolores.'),(31,'ECG','Excepturi amet.'),(32,'Vaccine','Beatae tenetur.'),(33,'First Aid','Accusamus.'),(34,'First Aid','Alias et.'),(35,'Scan','Blanditiis.'),(36,'Surgery','Beatae.'),(37,'First Aid','Est quia.'),(38,'Scan','Recusandae.'),(39,'ECG','Velit tempora.'),(40,'First Aid','Assumenda.'),(41,'Scan','Quo aut omnis.'),(42,'Surgery','Architecto qui.'),(43,'Surgery','Provident.'),(44,'Surgery','Debitis nam.'),(45,'Scan','Cum delectus.'),(46,'Scan','Voluptatibus.'),(47,'Surgery','Quae veritatis.'),(48,'Surgery','Amet.'),(49,'First Aid','Et sed.'),(50,'Surgery','Quae eius...');
/*!40000 ALTER TABLE `diagnostics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `ID` int(11) NOT NULL,
  `qualification` varchar(30) NOT NULL,
  `license` varchar(30) NOT NULL,
  `bio` varchar(300) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `specialization` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_Employee_Doctor` FOREIGN KEY (`ID`) REFERENCES `employee` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'Paediatrics','VG88508545','Sed aut quis.\r\nBeatae suscipit consequatur. Eos vitae et. Eos omnis laborum! Aut ab et. Tempora vitae corrupti. Omnis unde qui! Distinctio adipisci cumque. Fugit quis ducimus!\r\nAsperiores cum voluptatem.',0,'Family Practice'),(2,'Tuberculosis and Respiratory d','MV67988583','Maiores voluptatem odit. Sint est beatae! Voluptas vel quo. Libero provident fugiat! Unde blanditiis fugiat. Fugit nihil dignissimos! Ratione voluptas minima; sed aut est.\r\nProvident ut quibusdam. Temporibus possimus dolorem.',0,'Endocrinology'),(3,'Bachelor of Medicine, Bachelor','SP04631043','Odit sed, velit voluptas iste eius natus et veritatis vitae commodi aspernatur enim. Fuga neque et. Ullam error dolores! Sed deleniti sit. Odio iusto sapiente! Rerum quis voluptates. Ut omnis sit.',0,'Family Practice'),(4,'Palliative Medicine','AU43835063','Sed est eos. Alias est aut.\r\nCommodi voluptas quasi. Sed sint esse. Mollitia ea tenetur? Quam ut sit. Molestiae voluptatem ex! Ducimus est ipsa. Corporis sed id! Facilis dignissimos quae.',1,'Orthopedic Surgery'),(5,'Obstetrics and Gynaecology','MH50132113','Autem est at; culpa eum non. Unde commodi iste? Rem quia sed. Eum nihil nobis! Consequatur natus distinctio. Est quia error. Quas et eaque. Sed deleniti est; unde delectus tempore.\r\n',1,'Chiropractor'),(6,'Biochemistry','UK63146980','Rerum deleniti et natus animi corporis. Soluta quisquam ipsum fugiat iste dolor unde explicabo libero et quam non sit a velit cum reiciendis dolore qui; voluptas quia enim. Dolore aut consequuntur! Aliquam debitis molestiae.',0,'Family Practice'),(7,'Bachelor of Medicine, Bachelor','VN09336507','Nisi ut nisi.\r\nUt modi aspernatur. Necessitatibus sint rerum. Excepturi assumenda obcaecati. Ducimus dolorum iusto. Sed eaque autem; mollitia sunt impedit. Ipsam cum iste. Et veritatis praesentium. Alias quia sed!\r\n',0,'Otolaryngology'),(8,'Dermatology, Venerology and Le','TJ17459860','Voluptatem porro incidunt. Libero fugiat ipsum. Sit distinctio iste. Vero est omnis. Et non in? Perspiciatis sit explicabo. Ullam perferendis beatae. Unde ea pariatur.\r\nSunt quisquam iste. Dolorem consectetur culpa.\r\n',0,'Dermatology'),(9,'Biochemistry','ZT32280402','Ea quod maxime...\r\nQuia rerum error. Natus autem rerum. Non nemo nobis. Enim obcaecati libero. Neque numquam in; inventore impedit inventore.\r\nQui nisi quasi; quas qui sed; obcaecati tenetur nobis.\r\n',0,'Cardiology'),(10,'Dermatology','MD13668520','Omnis dolores inventore.\r\nEt delectus labore. Nostrum enim dolor. Sit iste nihil! Id voluptates aut. Quia distinctio totam.\r\nAut totam accusantium. Tempore impedit inventore...\r\nExcepturi atque voluptate. Qui vero error.',1,'Cardiology'),(11,'Biochemistry','EU11297181','Error a voluptatem. Nisi non ut. Deserunt magnam et! Omnis harum pariatur; error sed qui. Nihil id qui? Et est officiis. Velit illo dicta.\r\nUt quis aut. Et excepturi sit.',0,'Anesthesiology'),(12,'Forensic Medicine','KZ44294515','Quaerat dolor voluptates. Nobis illum rerum. Et explicabo vel. Et omnis magnam! Et magnam qui. Architecto iste ut? Libero voluptatem corrupti! Molestiae dolor quis. Expedita perspiciatis sed.\r\nEt quod amet.\r\n',0,'Hematology'),(13,'Physiology','KM57568616','Ut maiores aut. Dolor sed dolores. Sit magnam enim!\r\nPerspiciatis aliquid illo. Quaerat unde ut. Sunt ea quasi; magnam tempora fugit. Aut alias voluptatem. Delectus et dolorem.\r\nNemo odit aut.',0,'Hematology'),(14,'Laryngology','VE79885001','Maiores enim quibusdam. Magni maxime sit. Error sit nihil; nesciunt ea voluptatem. Quo sint impedit? Laboriosam iste sit. Quibusdam eaque voluptate. Consequuntur enim dolores? Qui quidem ut.\r\nQuod aut qui;\r\n',1,'Cardiology'),(15,'Cardiology','HO56641352','Expedita totam omnis. Libero eaque aperiam!\r\nSuscipit omnis qui.\r\nAmet tenetur incidunt. Natus consectetur tenetur. Sit quas perspiciatis. Quo quia sed. Ipsa voluptatem in. Est eaque voluptatem. Nemo maiores recusandae!\r\n',1,'Oncology'),(16,'Neurology','HR10684963','Fuga tenetur aspernatur. Corporis rerum hic; dolor alias totam. Quos quibusdam voluptatem? Dolor quasi quia. Quisquam eos et! Impedit sed nam. Velit quisquam omnis. Rerum autem exercitationem.\r\nSapiente porro facere.',1,'Cardiology'),(17,'Cardiac-Anaesthesiology','NJ35726514','Dolorum culpa aut velit eius vero perspiciatis quos sed. Possimus error sint.\r\nArchitecto sit quae. Excepturi ad nam; sequi ea rerum. Dolorem odit impedit? Tenetur sit eum. Voluptas facere autem;',1,'Orthopedic Surgery'),(18,'Transfusion Medicine','QM98826790','Non unde sed. Aliquam natus perspiciatis? Modi eum autem...\r\nQuia dolorem eos. Aut eum expedita! Quis aut quod.\r\nError sit quia.\r\nAliquam ea fugiat. Illum aut illum? Est doloremque natus.',1,'Neurology'),(19,'Microbiology','BX35716855','Quasi optio eos. Quas error alias! Ut unde debitis. Odio sit earum.\r\nSaepe eos impedit. Sequi non dolores. Nisi non exercitationem. Consequuntur sed accusamus.\r\nMinima eum deserunt. Accusamus neque quam.',1,'Osteopathy D.O.'),(20,'Pathology','TG81447384','Officiis repudiandae qui. Quasi vitae perspiciatis. Voluptatem perspiciatis neque. Dolor facilis saepe? Voluptatibus non quam. Omnis rem velit? Et voluptas amet.\r\nAut omnis aut. Vero molestiae laudantium. Id omnis at.\r\n',1,'Hematology'),(21,'Transfusion Medicine','ZR48301587','Quas blanditiis omnis. Obcaecati nihil adipisci. Voluptatem officiis perspiciatis.\r\nDicta maiores quis. Sapiente nemo optio? Illum sunt nesciunt. Ut et modi...\r\nSimilique harum qui. Voluptates impedit facere. Eum non at.',0,'Neurology'),(22,'Pharmacology','PX29278758','Aspernatur aut est. Voluptatem ad at; ad sunt doloremque? Velit mollitia tempore. Unde non sed; ea ipsam officiis. Temporibus delectus inventore; culpa placeat alias.\r\nHic omnis ut. Sit voluptas sunt.\r\n',1,'Otorhinolaryngology'),(23,'Palliative Medicine','RX05425483','Sunt dolorem autem. Temporibus blanditiis nisi. Aut molestias dolores. Quia illum consequuntur. Rerum ut voluptatibus. Sit explicabo quidem...\r\nUt quia debitis. Omnis asperiores nisi; veritatis voluptatem iusto? Nemo vel voluptatibus.\r\n',1,'Family Medicine'),(24,'Bachelor of Dental Surgery','QX18714675','Molestias et sed. Eveniet nulla unde qui dolor et aut illum. Natus blanditiis, sed eaque repellat minus ullam tempora mollitia facilis qui iure deserunt. Non necessitatibus sunt. Voluptas aut rem.',0,'Orthopedic Surgery'),(25,'ENT','FW49582781','Commodi placeat maxime. Iste molestias possimus! Velit molestiae aut. Dolorum nihil sint; explicabo et nisi; et est maiores. Sed nostrum rerum. Temporibus architecto aspernatur! Consequatur sapiente perspiciatis? Temporibus voluptas...\r\n',0,'Dermatology'),(26,'Pathology','IA88188511','Sint dolores voluptatem. Deserunt esse nesciunt. Voluptas enim natus? Sed corrupti repudiandae! Numquam velit unde. Voluptas consequatur ut!\r\nConsequuntur saepe maxime. Ullam sint harum! Omnis minus molestiae. Quia sed illum.',0,'General Practice'),(27,'Bachelor of Medicine, Bachelor','WP21851838','Quia aliquid nulla. Sit quae aut. Odio quis nemo. Natus numquam ipsum.\r\nNon deleniti facilis. Debitis laboriosam error? Accusamus aut ut. Qui ut magni. Ab neque consequatur. Consectetur perferendis et.',1,'General Practice'),(28,'Radio-Therapy','YN95297320','Et iste dolor. Odit ducimus aspernatur. Perferendis veniam vel. Natus vitae dolores! Quae perspiciatis quaerat. Est tempora enim. Et ipsam laboriosam.\r\nVoluptatem sunt omnis. Vel error a? Autem distinctio est;\r\n',0,'Gastroenterology'),(29,'Biochemistry','MC37694303','Eaque veritatis sit et ratione enim vel aspernatur, soluta necessitatibus aut enim explicabo aperiam aut quaerat reiciendis quo; et quasi rem eius dolor eius quia fugit enim velit et voluptate ut dolorum ut quis et aliquam ut.\r\nNulla.',1,'Gastroenterology');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `driver` (
  `ID` int(11) NOT NULL,
  `experience` int(5) NOT NULL,
  `licenseNo` varchar(10) NOT NULL,
  `successRate` float DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_Employee_Driver` FOREIGN KEY (`ID`) REFERENCES `employee` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
INSERT INTO `driver` VALUES (40,21,'LN16865292',54),(41,9,'HD77175554',13),(42,0,'VS33891242',0),(43,10,'RI76549790',45),(44,46,'VH70339236',54),(45,19,'PH64900878',4),(46,12,'GZ72455322',93),(47,2,'ZN43766515',23),(48,7,'HG60505824',7),(49,15,'AV59419291',53);
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drugs`
--

DROP TABLE IF EXISTS `drugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drugs` (
  `prescriptionID` int(11) NOT NULL,
  `pharmacyID` int(11) NOT NULL,
  PRIMARY KEY (`prescriptionID`,`pharmacyID`),
  KEY `FK_Pharmacy_Drugs` (`pharmacyID`),
  CONSTRAINT `FK_Pharmacy_Drugs` FOREIGN KEY (`pharmacyID`) REFERENCES `pharmacy` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Prescription_Drugs` FOREIGN KEY (`prescriptionID`) REFERENCES `prescription` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drugs`
--

LOCK TABLES `drugs` WRITE;
/*!40000 ALTER TABLE `drugs` DISABLE KEYS */;
INSERT INTO `drugs` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50);
/*!40000 ALTER TABLE `drugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `ID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` longtext NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `sex` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Abdul Franz','MJ/H07xTu2OsQuNZJgrHQA==','+91 65263-18990','Sherry_XFranz94@nowh','Railway Arch 7','Male'),(2,'Dana Bethea','LUJLGxAFBZfeAhy8OBPwkw==','+91 02768-98343','Bud.Albrecht@nowhere','Railway Arch 27C','Female'),(3,'Jeromy Vanburen','pdwGEoMSRw5/BJ46rQFMlw==','+91 24204-24783','Russell@example.com','Flats 1-9','Male'),(4,'Adan May','Q6ozdL7Lb25yWVKxoMBL6g==','+91 37716-82515','AbelLott@example.com','Suite 94','Male'),(5,'Charline Berman','oWIYH6vVWOQrJzqE1BwJYQ==','+91 01815-20021','Harvey@example.com','Arch 3','Male'),(6,'Roosevelt Lloyd','J8PzIxVyebBlI8d6mImZ1g==','+91 63501-66022','MargotCroft43@exampl','Flat 64','Male'),(7,'Carson Burley','xBTVDGItYZox6p4tjt/K4A==','+91 83395-04219','exmq9758@example.com','Flat 9','Male'),(8,'Gabriel Cheatham','jGpcljmOgpgW+e5/sxfllw==','+91 50257-66020','Ocampo@example.com','Suite 6','Male'),(9,'Elfrieda Fennell','iHWRdNgH+XzOnxeQHfK2cw==','+91 55216-13486','Ellis_Batiste76@exam','Railway Arch 91','Male'),(10,'Antone Coles','UiYX2cz28eSmNL5F3zZcTQ==','+91 76208-02624','AbbyCreamer@example.','Flat 6','Male'),(11,'Adelaida Mcfall','VnaAWmWke8MIqDXnN1ElIg==','+91 19807-96493','BelindaCAtchison@exa','Railway Arch 5','Female'),(12,'Annemarie Bess','hYmxOxhx5Qh3tXNMbW1dtw==','+91 76948-57053','Annett.Ahmed@example','Suite 72','Female'),(13,'Vincenzo Pugh','fy7fL6ghvibafwQGwQ/8lw==','+91 58855-57017','izwgel258@example.co','Railway Arch 8','Male'),(14,'Shon Abbott','Nf6IBfJAjqm0BIgW3DVWAg==','+91 67947-11169','AlaneAldrich24@examp','Railway Arch 62','Male'),(15,'Rickie Gamble','t+o6mvEj5FjdNd5TAZ1THA==','+91 48909-92975','Valdez2@nowhere.com','Flats B-D','Female'),(16,'Darwin Warden','r9ISK1F8bKjdIESOmuspUw==','+91 74637-52861','Williemae_S.Arroyo77','Unit 24-37','Female'),(17,'Mario Wilde','D47PkLPuidX2N7FYClUUAQ==','+91 66795-69443','Addie_Mullins@exampl','Flats 1-8','Male'),(18,'Wilburn Copeland','agxLUhkk/Tucww1VqorMKw==','+91 85236-28901','Burks943@example.com','Arch 9','Male'),(19,'Madison Aguirre','CWh4nsoG+qVOS1tU7cn5cg==','+91 22280-68632','Adam.Thomson6@nowher','Railway Arch 57','Male'),(20,'Carmelita Piper','/MDNLo7V/Req32AqzlYcLQ==','+91 61193-47111','Bartholomew@nowhere.','Railway Arch 1','Female'),(21,'Edwin Minor','ih2UcRG9z/vRkkm/vIewmg==','+91 43664-61837','Ackerman294@example.','Arch 16','Female'),(22,'Delisa Dejesus','GWiR6lzWh1CenFJOdlWF4w==','+91 07228-74593','Sammons293@example.c','Railway Arch 5','Male'),(23,'Alonzo Buckley','jXMsqRT2U20O/xbd26/AYg==','+91 55746-96466','JulesI.Slone@example','Flats 1-7','Female'),(24,'Analisa Crowder','5gFWaYJpSHD3vDZJRicGtA==','+91 54353-62758','HenryLloyd@nowhere.c','Railway Arch 22A','Female'),(25,'Rose Counts','gmIbLqDxHDOz0TqgPVlAJQ==','+91 61409-08662','GaylordKnapp@example','Flats 2-7','Female'),(26,'Adam Burrows','3t8V/0Oh7JDhYQnuAev0AQ==','+91 78909-45150','booowtxk_ppghdzzueq@','Railway Arch 7','Male'),(27,'Sanda Mattison','qERZSa3Z7pWcS57G1W9L+Q==','+91 43933-79559','DudleyKnapp@example.','Arch 58','Female'),(28,'Jarrod Crowley','C8qcloLZmFzdvZsg06Fq+Q==','+91 64878-35253','AnitraHCade793@examp','Arch 8','Male'),(29,'Aide Abrams','r5RxcOBxZHC/UecwcAUgnA==','+91 98428-41417','toivfefs.zbud@nowher','Railway Arch 27','Male'),(30,'Monroe Castaneda','JFkte1hijrzELmlnyWQ32w==','+91 94716-07132','EmmittMDewey@nowhere','Unit 5, Block C','Male'),(31,'Dorthey Abernathy','wUYUcdhkeCoajceYrr+S6Q==','+91 03270-83885','RickWarren@nowhere.c','Railway Arch 38C','Female'),(32,'Tomas Acker','0HdxK+9brlyOGbVU7thT+A==','+91 75013-04783','LianaMattingly43@exa','Arch 24','Male'),(33,'Wyatt Blackburn','qMBy8QdjUHqqgWGpvp54Vw==','+91 68777-01659','Natalya_Donaldson74@','Railway Arch 7','Male'),(34,'Alberta Beavers','7Uz3IXLXfilz2HhFliDDOA==','+91 85045-59610','Jordan.PVenable@exam','Railway Arch 9','Female'),(35,'Adah Chesser','cJrXjgO/1vaCFvvolEM/MA==','+91 70197-62662','CoraParr@example.com','Railway Arch 4','Female'),(36,'Major Kimmel','l6Z4tltAhF595VVlNKP+xQ==','+91 64640-93484','John_FGregg@example.','Railway Arch 65','Male'),(37,'Abraham Amador','NPG8/GR8+ikx9bHnjYAR0g==','+91 89691-12680','LowellNavarrete28@ex','Flats 1-8','Male'),(38,'Sergio Acosta','wUYUcdhkeCoajceYrr+S6Q==','+91 68212-15084','KareyChisolm@example','Railway Arch 1','Male'),(39,'Britt Treadway','bI4KAKwxJnm+zVfI0ERpJQ==','+91 37893-84031','xwrrh5@example.com','Railway Arch 5','Male'),(40,'Gregory Leeper','pGw7VPLJhxzYHa96kySZwA==','+91 28008-74197','Camp@nowhere.com','Railway Arch 4','Male'),(41,'Glynis Valdez','RROgb6kmGjuoT3ttBa1CCg==','+91 77066-64320','ntcxqcgw_xzmypko@exa','Arch 30B','Male'),(42,'Fairy Obrien','Pa8bhfttbPsnCa9H6U3pEg==','+91 51454-67847','McginnisY@nowhere.co','Arch 26','Female'),(43,'Daniela Alcorn','ECiSLXjmTLR0jxtukZ/y3A==','+91 00947-50644','Monty.Dewey7@example','Arch 9','Female'),(44,'Lenny Alcala','XoBRJI6cJiBWnzCn7Z6jmg==','+91 92625-34029','Krueger@example.com','Flats 4-8','Male'),(45,'Kamala Abernathy','GrJfZZjEMim7CxEBWPkNpQ==','+91 75848-80274','LeighDelong@example.','Railway Arch 3','Male'),(46,'Naomi Hibbard','0Qy2EMBK6VADjClgSENzfw==','+91 89630-05438','obultsi6@nowhere.com','Flat 29','Male'),(47,'Milford Dodd','ArorzvfkZi5YHiQoZ1mtNA==','+91 02262-71707','AbdulSwan4@example.c','Railway Arch 3','Female'),(48,'Cindy Shores','bBOyi09Fk6X2uHhqlR92PA==','+91 47597-70265','Keenan.Crandall8@exa','Flats 1-7','Male'),(49,'Devin Holiday','hCtZdFvZBkKW6y6a8GPPLQ==','+91 84521-09716','Alford839@nowhere.co','Unit 21-49','Male'),(50,'Jann Navarrete','9P2MoQMy4rRD09fSPI7RFg==','+91 16252-16243','Sherley_Hyland187@ex','Suite 5','Male');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `ID` int(11) NOT NULL,
  `amount` float NOT NULL,
  `isPaid` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (1,6349570,1),(2,691,0),(3,3729050,1),(4,5117100,1),(5,7417,1),(6,3211930,0),(7,2132180,1),(8,8,0),(9,6943770,1),(10,2113600,1),(11,759,0),(12,3898,0),(13,8621010,1),(14,2758430,1),(15,572,1),(16,1012350,1),(17,5591090,1),(18,8937820,1),(19,497772,1),(20,5278050,1),(21,4420750,1),(22,6761690,1),(23,5205800,1),(24,4343080,1),(25,4752440,0),(26,1619590,1),(27,6631170,0),(28,7784990,1),(29,7149190,1),(30,7660060,0),(31,435,0),(32,9943980,0),(33,6775960,0),(34,6893950,1),(35,1394660,0),(36,5496730,1),(37,6230,1),(38,7465360,1),(39,6407960,0),(40,372,0),(41,1139700,1),(42,1761960,1),(43,3977180,1),(44,2408840,1),(45,37,0),(46,2771310,1),(47,47,1),(48,54800,0),(49,6984,1),(50,7838260,0);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journey`
--

DROP TABLE IF EXISTS `journey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journey` (
  `driverID` int(11) NOT NULL,
  `ambulanceId` int(11) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  PRIMARY KEY (`driverID`,`ambulanceId`),
  KEY `FK_Ambulance_Journey` (`ambulanceId`),
  CONSTRAINT `FK_Ambulance_Journey` FOREIGN KEY (`ambulanceId`) REFERENCES `ambulance` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Driver_Journey` FOREIGN KEY (`driverID`) REFERENCES `driver` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journey`
--

LOCK TABLES `journey` WRITE;
/*!40000 ALTER TABLE `journey` DISABLE KEYS */;
INSERT INTO `journey` VALUES (40,1,'Apt. 454 554 Shukla Mount Delhi',NULL,NULL),(40,2,'Suite 066 22270 Tapan Falls Goa','2020-09-25 17:36:17','2020-09-25 23:43:20'),(40,3,'Suite 513 041 Sinha Mission Himachal Pradesh','2018-01-01 00:51:43','2018-01-01 05:28:24'),(40,4,'Apt. 636 55090 Dwivedi Throughway Chhattisgarh',NULL,NULL),(40,5,'Apt. 475 0161 Susheel Plains Andra Pradesh','2018-06-12 08:16:04','2018-06-12 15:15:18'),(41,2,'Suite 313 4652 Kamla Knolls Gujarat','2018-01-01 00:07:17','2018-01-01 06:34:51'),(41,3,'Suite 843 44392 Khatri Street Odisha','2018-01-01 00:05:31','2018-01-01 00:22:20'),(41,4,'Suite 556 7050 Varma Ridge Telangana','2018-01-01 00:01:08','2018-01-01 01:34:35'),(41,5,'Apt. 454 554 Shukla Mount Delhi','2018-03-30 03:49:24',NULL),(41,6,'Suite 955 7717 Aanandinii Court Manipur','2019-10-09 06:15:47','2019-10-09 06:42:57'),(42,3,'Apt. 262 54352 Sher Wells Daman and Diu','2018-01-01 00:01:24','2018-01-01 03:58:54'),(42,4,'Suite 303 03461 Subodh Brook Uttar Pradesh','2020-06-22 04:16:23','2020-06-22 06:02:20'),(42,5,'Apt. 332 403 Abhaidev Orchard Karnataka','2018-09-12 07:25:24','2018-09-12 10:58:03'),(42,6,'Apt. 868 574 Susheel Forge Meghalaya','2020-08-18 10:37:50','2020-08-18 14:30:20'),(42,7,'Apt. 425 5995 Priyala Mall Punjab','2019-02-15 22:45:08','2019-02-16 01:52:53'),(43,4,'Suite 513 041 Sinha Mission Himachal Pradesh','2018-01-01 00:14:09','2018-01-01 05:32:14'),(43,5,'Apt. 808 013 Tandon Parks Tamil Nadu','2021-02-04 02:47:10','2021-02-04 07:27:42'),(43,6,'Apt. 455 827 Khatri Dam Meghalaya','2020-07-06 20:06:44','2020-07-06 21:11:26'),(43,7,'Suite 635 346 Verma Ridges West Bengal','2019-10-05 07:43:28','2019-10-05 11:35:01'),(43,8,'Suite 303 03461 Subodh Brook Uttar Pradesh','2018-01-01 00:00:04',NULL),(44,5,'Apt. 908 56804 Vasudha Drives Arunachal Pradesh','2020-08-24 13:39:28','2020-08-24 19:43:58'),(44,6,'Apt. 332 403 Abhaidev Orchard Karnataka','2018-01-01 00:11:29','2018-01-01 04:29:19'),(44,7,'Suite 792 4237 Siddhran Curve Assam','2019-03-11 14:19:20','2019-03-11 14:35:13'),(44,8,'Apt. 584 56358 Subhashini Stream Manipur','2018-01-01 00:05:58','2018-01-01 04:09:49'),(44,9,'Suite 378 8144 Naval Ferry Delhi','2018-04-04 00:17:36','2018-04-04 00:47:14'),(45,6,'Suite 887 78067 Mangalya Lakes Karnataka','2020-06-13 00:16:07','2020-06-13 02:02:35'),(45,7,'Suite 066 22270 Tapan Falls Goa','2019-09-22 21:06:34','2019-09-23 02:40:44'),(45,8,'Apt. 581 865 Gajbaahu Well Maharashtra',NULL,NULL),(45,9,'Suite 066 22270 Tapan Falls Goa','2018-01-01 01:45:17','2018-01-01 05:20:05'),(45,10,'Apt. 455 827 Khatri Dam Meghalaya',NULL,NULL),(46,7,'Suite 183 240 Khanna Glens Tamil Nadu','2018-01-01 00:15:45',NULL),(46,8,'Suite 348 75387 Atreyee Mountain Maharashtra','2018-01-01 00:01:35','2018-01-01 04:14:14'),(46,9,'Suite 049 28831 Gandhi Plains Andra Pradesh','2018-03-10 05:40:25','2018-03-10 12:24:23'),(46,10,'Apt. 581 865 Gajbaahu Well Maharashtra','2018-01-01 00:14:49','2018-01-01 00:37:30'),(46,11,'Suite 557 293 Anish Fall Madya Pradesh','2020-11-10 14:21:33','2020-11-10 15:05:03'),(47,8,'Apt. 868 574 Susheel Forge Meghalaya','2021-01-13 14:38:06','2021-01-13 20:00:22'),(47,9,'Suite 955 7717 Aanandinii Court Manipur','2018-12-31 13:40:46','2018-12-31 14:35:21'),(47,10,'Apt. 455 827 Khatri Dam Meghalaya','2021-01-29 18:57:20','2021-01-29 22:19:12'),(47,11,'Apt. 708 392 Jagathi Shoal Rajasthan',NULL,NULL),(47,12,'Apt. 425 5995 Priyala Mall Punjab','2020-06-22 10:48:48','2020-06-22 12:47:50'),(48,9,'Suite 887 78067 Mangalya Lakes Karnataka','2018-05-03 09:37:34','2018-05-03 16:26:45'),(48,10,'Apt. 893 2712 Amaresh Mills Daman and Diu','2019-01-07 20:19:24','2019-01-08 01:32:41'),(48,11,'Suite 183 240 Khanna Glens Tamil Nadu','2020-11-04 05:24:32','2020-11-04 10:28:17'),(48,12,'Apt. 584 56358 Subhashini Stream Manipur','2018-08-28 03:33:56','2018-08-28 07:34:06'),(48,13,'Apt. 893 2712 Amaresh Mills Daman and Diu','2019-02-16 18:38:56','2019-02-17 00:40:47'),(49,10,'Suite 556 7050 Varma Ridge Telangana','2019-06-29 18:04:59','2019-06-29 23:48:33'),(49,11,'Suite 378 8144 Naval Ferry Delhi','2019-10-22 10:35:27','2019-10-22 14:51:00'),(49,12,'Apt. 636 55090 Dwivedi Throughway Chhattisgarh','2018-01-01 01:53:46','2018-01-01 02:17:55'),(49,13,'Apt. 403 706 Nair Island Madya Pradesh','2020-03-05 23:56:56',NULL),(49,14,'Apt. 649 556 Iyengar Estate Pondicherr','2020-12-22 22:16:58','2020-12-23 04:05:50');
/*!40000 ALTER TABLE `journey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nurse` (
  `ID` int(11) NOT NULL,
  `qualification` varchar(30) NOT NULL,
  `license` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_Employee_Nurse` FOREIGN KEY (`ID`) REFERENCES `employee` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse`
--

LOCK TABLES `nurse` WRITE;
/*!40000 ALTER TABLE `nurse` DISABLE KEYS */;
INSERT INTO `nurse` VALUES (30,'Advanced Diploma in Ophthalmic','VZ55085593'),(31,'Advanced Diploma in Ophthalmic','RI70996649'),(32,'Diploma in Neuro Nursing','CC29717864'),(33,'Advanced Diploma in Ophthalmic','JV30308957'),(34,'Diploma in Neuro Nursing','PV58267114'),(35,'Advanced Diploma in Ophthalmic','FG90265853'),(36,'Advanced Diploma in Ophthalmic','BZ71931039'),(37,'Diploma in Neuro Nursing','AX01516568'),(38,'Advanced Diploma in Ophthalmic','AR77354200'),(39,'Diploma in Emergency and Traum','RA60814409');
/*!40000 ALTER TABLE `nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `ID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` longtext NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `medicalHistory` varchar(300) DEFAULT NULL,
  `marital` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Charmaine Stock','aReDlhzEsQhHqRuDdQEq4g==','+91 63822-70877','CharmaineZStock@exam','Suite 183 240 Khanna','Male','Est ut accusantium. Blanditiis minima voluptatibus? At ex omnis! Laborum ut aperiam.\r\nSit aut velit. Autem nostrum dolor! Omnis dolor architecto; dicta provident consequatur.\r\nCulpa sint ipsam. Unde est et;',1),(2,'Matthew Hoffman','U9HMRHdAq0EQxabv3BvP8Q==','+91 69082-18984','Gaylord.UMacklin@exa','Suite 066 22270 Tapa','Female','Necessitatibus laboriosam vel. In quidem molestiae. Quae odio minus. Sed est quisquam. Aut voluptatem quaerat. Ut quae fugit! Nihil asperiores facilis; necessitatibus dolore obcaecati. Dolorem provident non. Commodi et debitis!\r\n',1),(3,'Jacinta Yanez','pjuqszJPYxEfM0nFh6GLYw==','+91 69526-85897','KyokoAdams@example.c','Suite 635 346 Verma ','Female','Quam neque eaque minus. Repellat ut quibusdam nihil eligendi voluptatem et iste laboriosam.\r\nNon omnis excepturi et in tenetur; iusto ut nisi? Culpa possimus exercitationem. Adipisci dicta eveniet! Dolor sed nihil.',0),(4,'Drew Perry','BzsFFjLsbnYYdy8B3xpAAw==','+91 70596-66885','JudieCasas149@exampl','Apt. 636 55090 Dwive','Male','Porro error iste. Voluptatem sed hic. Aperiam sit numquam! Maxime explicabo dignissimos. Voluptatem ut quis...\r\nMagnam voluptatem sint; ut rerum sed. Iste aliquam voluptas; architecto quos ex; aperiam qui at.',1),(5,'Kyoko Adams','HHXt6AEfw2ioZulrgB/q1w==','+91 55678-52167','DallasSperry@example','Suite 757 6414 Shukl','Male',NULL,NULL),(6,'Renea Russo','tNu6iFoEpFCASKe3O+mMkg==','+91 57985-03668','tnpq9785@example.com','Apt. 262 54352 Sher ','Male','Eum voluptatem fuga. Dolores iste ut! Doloremque ratione est. Fugit nihil modi.\r\nEnim similique voluptatem. Sed autem esse; laudantium accusamus tenetur.\r\nAd qui commodi. Blanditiis quasi numquam. Vel vitae unde!',0),(7,'Isidra Kirchner','cV4p2szKkFNy9Lj+B6jgkg==','+91 72170-61447','MarisolICecil@exampl','Suite 557 293 Anish ','Female',NULL,NULL),(8,'Donita Huff','3ipBPaLbFoJ305WO6WZCrg==','+91 73259-83466','AbbieWebber@example.','Suite 792 4237 Siddh','Male','Ab cumque corporis aut est. Impedit maxime et voluptatem omnis. Et ut laborum! Voluptatem ullam nam quas, quia et soluta quia cumque dolorum. Et consectetur in. Maxime ut ea. Qui dolorem corporis. Est quia repellendus!',1),(9,'Rosendo Lunsford','GkmaHmB5G3NChwzaLmuAlg==','+91 16704-64416','Deidre.Dixon285@exam','Suite 049 28831 Gand','Female',NULL,1),(10,'Cesar Edge','ZfNAimUI/XcOgqbyBmCoGw==','+91 11373-69682','AdelaidaX.Hadley89@n','Apt. 403 706 Nair Is','Female','Unde reprehenderit molestiae. Labore dolor suscipit. Non fugiat aliquam. Fuga ad quo.\r\nError dolorum hic. Nesciunt voluptatibus ut! Voluptatem error aut.\r\nAliquid voluptatem sequi. Ea magni nisi. Voluptatum vel ut;',1),(11,'Paul Medeiros','jyY6cM0ZzfYMZngNyAWDLw==','+91 26600-34852','HermelindaBAbernathy','Apt. 808 013 Tandon ','Male','Reprehenderit quia esse consequatur nostrum. Sunt qui odio voluptatem dignissimos necessitatibus? Sed iusto sed ipsa voluptatem reprehenderit cupiditate numquam aut! Iste consequatur quia. Quasi ullam sed. Corrupti magnam quod. Et.',1),(12,'Theodora Munn','y78E/VFF4DaIOzPBA9C7MQ==','+91 34629-00719','Robertson2@example.c','Apt. 287 8655 Tagore','Female',NULL,0),(13,'Keenan Gatewood','suT2RLpuwV3w1ox4vcY7uQ==','+91 26474-39287','JoeLowell@example.co','Apt. 401 26463 Trive','Female','Totam rerum est perspiciatis dolore non veniam aliquid. Ducimus odio in? Non omnis ratione.\r\nUllam et veniam. Asperiores molestiae modi! Nisi fuga voluptatem. Veritatis totam temporibus. Quia non debitis. Omnis in ipsam.',1),(14,'Arlyne Wheeler','BznQV23Gn78rctoGIAuLRg==','+91 08829-69975','Robbyn_Mabry523@nowh','Apt. 398 962 Malti P','Male','Quidem et consequatur. Voluptatum aspernatur sunt. Blanditiis repellat omnis! Rem voluptas voluptatem.\r\nVeritatis fugit aliquam. Alias ex laboriosam. Dolores natus eos! Dolore est vitae? Dolorum quia quisquam. Quia ut quasi.',0),(15,'Alysa Paulson','XZobw+Lzq7E3ijk110l18w==','+91 31366-38614','AubreyAbrams@example','Apt. 250 6184 Chidaa','Female','Aliquam eos libero sit et. Consectetur assumenda est! Asperiores et labore. Inventore ex perspiciatis. Iste laboriosam eveniet. Quia veritatis laborum.\r\nVel qui repellendus. Quia ipsam ea? Aut facilis sit. Reprehenderit omnis perspiciatis.',1),(16,'Alton Calloway','1haczmQGSSy7IMq1rxSziA==','+91 44699-74356','Eliseo.Blue81@exampl','Suite 635 346 Verma ','Male','Dolorem animi vel. Vel consequuntur enim? Consectetur eos qui. Nesciunt dolore tenetur? Quae voluptatem aut. Alias porro aspernatur. Autem fugiat accusamus. Unde dolorum quis. Iste vero quod.\r\nIusto reprehenderit natus.',0),(17,'Arnoldo Handy','dQqGt6W9cPm5YG3751wekQ==','+91 96880-07426','Ervin2@example.com','Apt. 403 706 Nair Is','Female','Inventore dolorum reprehenderit. Quasi enim distinctio. Aut sit illo! Est ut reprehenderit? Quos quo omnis! Quia praesentium in...\r\nOmnis assumenda quis; dolor doloremque ipsum? Explicabo vero ea; error et saepe.',1),(18,'Charlie Sallee','xMcvq8V55wmDGP8nBd/v4g==','+91 35762-16219','MaxCobb@example.com','Apt. 635 96897 Pilla','Female',NULL,NULL),(19,'Margit Sales','p7Pe6ksXb65ETLiFSu99DQ==','+91 73040-95630','Diana.Archibald@nowh','Suite 378 8144 Naval','Male','Odit voluptatem error fuga voluptate qui quisquam ut assumenda. Culpa cupiditate quidem repellendus eos.\r\nMinus officia quia nobis esse. Ipsam voluptatem delectus rerum harum hic omnis commodi enim. Praesentium magnam et...',1),(20,'Louvenia Evers','qwVqBOJWnzhN2VbAkpgdCg==','+91 72342-59406','Canady444@nowhere.co','Apt. 455 827 Khatri ','Male','Voluptatibus sit a. Et expedita deserunt? Adipisci sed voluptatem. Excepturi aspernatur soluta! Voluptas soluta fugiat? Molestiae iste nobis! Tempora aliquam dolores...\r\nVoluptatem fuga excepturi. Sit quos consequatur. Perspiciatis aut;\r\n',0),(21,'Neda Mcqueen','VDxlKAtmxpJXrqAcFUV1Xg==','+91 15063-40794','Mcmahan645@nowhere.c','Suite 513 041 Sinha ','Female','Natus ullam quasi fuga ducimus.\r\nPerspiciatis sunt, rerum perferendis molestiae eum et sapiente porro saepe.\r\nQuaerat ut sed est accusantium culpa delectus est eveniet odio.',1),(22,'Jospeh Story','IwQFxT/Z/xHBIf8qarZNRw==','+91 05388-07666','TambraCoughlin74@exa','Apt. 455 827 Khatri ','Female','Vitae dolor assumenda eveniet id sit cupiditate excepturi. Aut qui quos ut explicabo sed nihil sit.\r\nExplicabo minima accusantium. Non porro dolor. Impedit eligendi quae; non quo perspiciatis. Cumque asperiores sequi.',1),(23,'Winfred Ornelas','oTF3NdVg3M2onUm0zYMFHA==','+91 31238-39388','Schmitz@nowhere.com','Apt. 635 96897 Pilla','Male','Ratione inventore non sed. Cupiditate rerum ipsam. Eos cumque et. Velit debitis officiis. Et numquam pariatur. Soluta in totam.\r\nMollitia ea consequatur. Non et quasi. Fuga enim voluptatum. Illum illo voluptatem.',1),(24,'Daniel Gates','s68bPzRMRriodngXqayFuQ==','+91 24461-32764','Elliott_Russell9@now','Apt. 455 827 Khatri ','Male','Dolores culpa eligendi; illo iste nam? Voluptatem quod ab. Et beatae qui.\r\nSequi et aliquam. Natus aut hic. Autem facilis quisquam. Quia iste et! Suscipit aspernatur error. Dolores ad omnis?\r\n',1),(25,'Abraham Connolly','9ebN3M0OXwMXLfzn6LXNPg==','+91 14071-87321','Baughman@example.com','Suite 557 293 Anish ','Female','Ea amet aliquam qui et suscipit nulla et aut est. Dolor magnam deleniti; veritatis similique provident.\r\nBeatae nobis quia. Culpa nihil perspiciatis! Magnam iste assumenda. Unde deserunt mollitia. Debitis ut hic.\r\nEum dolorem dolore.',1),(26,'Vivien Fisk','tjlL+u8GsSiaGK3RmTZhtw==','+91 60891-78505','Allyn.C.Moser1@examp','Suite 843 44392 Khat','Female','Voluptatem blanditiis aliquam quo. Quod labore sit. Sequi vitae aut. Non quis molestiae perferendis voluptatum. Sed repudiandae consectetur dolores nobis et. Libero blanditiis cumque. Aut ipsum quidem!\r\nMollitia fugit doloremque.',1),(27,'Adelaida Isbell','3UNS2qMEB2W2D8vM5T0gtQ==','+91 44224-01122','Coombs61@nowhere.com','Apt. 448 0779 Patel ','Male','Aliquam repellat repellendus. Omnis voluptatem rem! Iusto tempora ut. Quisquam eius saepe. Ut facere sapiente. Beatae consequuntur nesciunt.\r\nDoloribus qui non. Consequatur corporis id. Sunt a quia; rem labore ut.',1),(28,'Alden Fincher','cSpSvF5/jcPLXeFX27CBUQ==','+91 67517-32402','Doty61@nowhere.com','Apt. 908 56804 Vasud','Female','Voluptatibus modi adipisci tempore iste. Sunt sint deserunt modi error! Ut perspiciatis sed nesciunt dolorum non consequatur. Deserunt est officia labore cumque enim dolor omnis possimus magnam! Ratione ut quia.',1),(29,'Garry Deaton','jdXz7SnJBkECPkPlszzcug==','+91 52881-48731','AdahVZepeda@example.','Suite 313 4652 Kamla','Male','Natus ea earum dolorem perspiciatis dignissimos dolor corrupti aliquid. Qui minus quia. Qui sit aut. Laborum sequi autem? Consequuntur adipisci laboriosam. Est cupiditate numquam! Quo sed voluptates? Iste earum non.',1),(30,'Janene Turney','Lm8aTKoKBx9t7UMmfjvs5w==','+91 02265-37912','JunieBundy@example.c','Apt. 595 30928 Bhadr','Male','Recusandae sunt vel. Repellat omnis sit. Autem aliquid asperiores! Quas consequatur obcaecati. Dolor ut repellat. Itaque minima ratione! Ullam accusamus nesciunt.\r\nError ea autem; debitis atque est. Nemo obcaecati rem.',1),(31,'Cyndi Mcmillen','nXz8PpIXTgP6YGzo3EhrZA==','+91 50967-76764','Singer@nowhere.com','Apt. 454 554 Shukla ','Male',NULL,0),(32,'Jorge Abney','XSYZ1d8wzcu2b9PsOgBV1w==','+91 68592-79202','Myrtis_Wilke541@nowh','Apt. 908 56804 Vasud','Male',NULL,0),(33,'Terica Corley','Qpan7umNw2/smu4R/2+VCg==','+91 04499-32044','DelmarMcdade@example','Suite 124 9837 Deeva','Female','Deleniti harum ut sunt natus. Aspernatur ipsam aut veritatis. Itaque et aperiam aut mollitia at nesciunt neque quia! Rem saepe error. Et necessitatibus hic. Illum tempora nisi! Architecto perspiciatis rerum.',1),(34,'Noel Fulton','b047GFEfkke9YuPy4RXC5w==','+91 93676-44462','Marcella_Carlton@now','Apt. 454 554 Shukla ','Male','Voluptatibus mollitia officiis. Fugiat libero quidem! Cupiditate impedit inventore. Iure nemo aut. Aut sed ut. Et iste eaque. Natus recusandae optio! Eius repellendus voluptatibus.\r\nEst cumque voluptatem. Voluptatem quis a.',0),(35,'Frederic Rasmussen','VpW95iOoLgd6G+J4BSAaaw==','+91 08396-43341','Odell6@nowhere.com','Suite 802 155 Naik I','Male','Eveniet beatae in. Enim unde deleniti? Et soluta omnis! Quaerat consequatur quaerat. Accusantium voluptas est. Omnis iure libero. Dolore voluptas totam. Fugiat culpa at.\r\nUt doloremque velit. Est unde explicabo;',1),(36,'Antoine Adams','BIzdg1fueOKsh/CkJdJ6gQ==','+91 92936-09127','Barbara.Moran@exampl','Apt. 595 30928 Bhadr','Female','Omnis atque recusandae. Non aut doloremque. Debitis et labore. Et nemo consequuntur. Magnam aut consectetur; maxime quo qui. Sed sit at.\r\nEa amet nihil. Et corporis sed; fugit consequatur et.\r\n',0),(37,'Denise Coyle','OU08fIsrkPmZo+fcywI1pQ==','+91 12390-35175','Melvin_Seymour263@ex','Suite 049 28831 Gand','Male',NULL,0),(38,'Stefan Acker','6K0DHVfdViUoETIktRb38Q==','+91 23223-09328','Badger24@example.com','Apt. 636 55090 Dwive','Female','Nulla sit ad. Dolor consectetur ducimus. Sunt praesentium quae. Quis dignissimos autem! Eveniet culpa quia.\r\nDolorum eveniet rerum. Inventore sit natus. Fuga eius et. Sed error necessitatibus. Asperiores distinctio tempora.',0),(39,'Richard Cho','0JADGT5sdNzFPX9tx7WRHg==','+91 82657-89548','JonelleBair8@nowhere','Apt. 455 827 Khatri ','Female','Excepturi dolores expedita. Reprehenderit sit suscipit. Fugit consequuntur voluptatem! Voluptatem voluptas est; voluptatem natus repellat. Explicabo eos alias.\r\nSit error rerum. In laboriosam vero. Sit vero iure.\r\nIste eos sit.',0),(40,'Gary Legg','pzTJTW4EbEZn/qV3WMW29g==','+91 46112-29370','miujm4@example.com','Apt. 173 673 Chandra','Male','Nam eaque ut. At quis et. Temporibus aut omnis; aspernatur adipisci doloribus. Nisi voluptas odit? Quos aperiam iure.\r\nAccusantium porro eos. Veniam officiis laboriosam? Accusantium eius molestiae. Quidem quibusdam rerum.\r\n',1),(41,'Mariko Warfield','UZZ0L975g4N8ZIvAiOlfqg==','+91 06104-74687','Adame@example.com','Apt. 808 013 Tandon ','Male','Deleniti iste pariatur voluptate minus natus iure; praesentium accusamus voluptatem.\r\nExplicabo est illo. Aut eaque voluptatem. Quia dolores culpa. Adipisci accusamus numquam. Culpa voluptatem veritatis! Alias atque in. Libero unde qui.',1),(42,'Alfonzo Michel','u7WuctirvBt+kUFf78exuw==','+91 94466-93283','CarlitaRBoyer@exampl','Apt. 635 96897 Pilla','Female',NULL,NULL),(43,'Ginny Acker','vLT5SvZpuFdIAeT3c2ELrg==','+91 84450-78280','Rider@nowhere.com','Apt. 448 0779 Patel ','Female','Sed nulla doloribus. Temporibus et maxime! Alias error mollitia. Dicta optio est. Ea accusantium ut. Enim unde non. Quam expedita totam.\r\nVoluptatem ex consequatur. Qui expedita inventore! Reiciendis fugit eum.',0),(44,'Alethia Capps','i4TOE3E742Px4RXUkk7FCQ==','+91 86050-76006','Dick587@example.com','Apt. 649 556 Iyengar','Male','Accusantium voluptate illum. Dolor numquam voluptatem ea! In recusandae doloribus.\r\nExercitationem est odit. Error dolores dolore. Accusamus nam aut.\r\nDolorum distinctio eligendi; ipsam autem fugit. Ea labore quidem. Quia commodi quam!',0),(45,'Adolph Starr','Clad4WuJeLJhfyzigjXW4Q==','+91 68937-52795','Clayton.Buss22@examp','Apt. 454 554 Shukla ','Male','Molestias repudiandae beatae. Perferendis maiores rem; minus earum animi. Dolor quam quisquam; qui voluptate cupiditate. Sunt quae eveniet. Voluptatem porro sed! Magni sed vel. Ratione iusto rerum!\r\nQuaerat optio dolore.\r\n',1),(46,'April Calabrese','kODoDrEIh1KuqAJ0kWzCLg==','+91 33225-10826','llxnyhgv5720@example','Suite 348 75387 Atre','Male','Atque aut natus pariatur reprehenderit sit molestias voluptas. Est eveniet tempore. Hic et aut; doloremque atque vel. Soluta eligendi beatae. Tempora itaque modi. Provident sit eveniet! Fugit sunt necessitatibus. Eaque vero veniam! Iusto.',0),(47,'Reagan Cousins','LsRMF1dd7nZMHPzjEBDtOA==','+91 50172-29851','oqsfvejo69@example.c','Apt. 262 54352 Sher ','Female',NULL,NULL),(48,'Diana Archibald','GhVtCRyJEqbmwlyptcq+wQ==','+91 92382-02028','Alia.Lugo17@example.','Apt. 908 56804 Vasud','Female','Aliquid voluptates assumenda; dolorem dolores quae. Blanditiis inventore in.\r\nAut sit nihil. Veniam eligendi totam; modi distinctio omnis; numquam doloribus eum. Non accusantium molestiae. Voluptatem omnis veritatis! Eius deleniti magni.\r\n',0),(49,'Lakisha Betancourt','0pK1OOmY7W3+Y03K6sd/Yg==','+91 11114-36457','ClaudiePrice86@examp','Apt. 893 2712 Amares','Female','Debitis atque et rerum omnis et vel aliquam quisquam deserunt; qui eos debitis? Eveniet nisi quia. Sed odit aut? Est velit ut.\r\nEum obcaecati aut. Distinctio sunt dolor. Aliquid quos ut...',1),(50,'Charlena Rasmussen','fxWyPnOsHJ2l+E7cov1lrQ==','+91 80094-74152','ifevtumq_mmvwynn@exa','Apt. 893 2712 Amares','Female',NULL,NULL);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pharmacy`
--

DROP TABLE IF EXISTS `pharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pharmacy` (
  `ID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `category` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pharmacy`
--

LOCK TABLES `pharmacy` WRITE;
/*!40000 ALTER TABLE `pharmacy` DISABLE KEYS */;
INSERT INTO `pharmacy` VALUES (1,'Losasonfast','Tranquilizers'),(2,'Epihydrovase','Oral contraceptives'),(3,'Acatravant','Hormone replacements'),(4,'Rythmoperifen','Statins'),(5,'Losataino','Tranquilizers'),(6,'Zapracarpamlol','Statins'),(7,'Hepaoxevant','Statins'),(8,'Irilonzol','Antibiotics'),(9,'Exosilne','Antipyretics'),(10,'Indathromyne','Oral contraceptives'),(11,'Intermatec','Antibiotics'),(12,'Moxisoprocose','Antiseptics'),(13,'Ecothromyvir','Antipyretics'),(14,'Iprobutamzon','Stimulants'),(15,'Konizofen','Mood stabilizers'),(16,'Aprocarpamrex','Tranquilizers'),(17,'Calcipuriphane','Antibiotics'),(18,'Herpehydrodene','Mood stabilizers'),(19,'Neozonor','Mood stabilizers'),(20,'Lisipadorm','Mood stabilizers'),(21,'Levotate','Antipyretics'),(22,'Zytotazyl','Stimulants'),(23,'Alloperadene','Analgesics'),(24,'Prothromynon','Stimulants'),(25,'Osadrovex','Mood stabilizers'),(26,'Redusildar','Antibiotics'),(27,'Dermagophane','Antimalarial drugs'),(28,'Miniperimuc','Antibiotics'),(29,'Diperinide','Antipyretics'),(30,'Acamalam','Antiseptics'),(31,'Abesidex','Stimulants'),(32,'Acisopronor','Hormone replacements'),(33,'Dioxedine','Statins'),(34,'Acesonnal','Tranquilizers'),(35,'Adeltradine','Hormone replacements'),(36,'Enachloridehex','Statins'),(37,'Halofavase','Statins'),(38,'Velonadene','Antimalarial drugs'),(39,'Micopazol','Antibiotics'),(40,'Noratanque','Stimulants'),(41,'Micobutamvant','Stimulants'),(42,'Losatrane','Mood stabilizers'),(43,'Eryhydrobid','Statins'),(44,'Metrosiltex','Analgesics'),(45,'Baynisol','Antibiotics'),(46,'Metronibid','Antiseptics'),(47,'Metonaphane','Antimalarial drugs'),(48,'Polynazol','Mood stabilizers'),(49,'Dermasoprorex','Mood stabilizers'),(50,'Simemaban','Hormone replacements');
/*!40000 ALTER TABLE `pharmacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prescription` (
  `ID` int(11) NOT NULL,
  `timeStamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (1,'2019-03-11 20:17:34'),(2,'2017-12-31 18:31:29'),(3,'2019-03-20 01:02:50'),(4,'2017-12-31 18:30:54'),(5,'2019-10-04 20:26:31'),(6,'2020-08-31 03:55:59'),(7,'2019-08-27 22:30:45'),(8,'2018-09-20 19:06:51'),(9,'2018-09-30 14:33:35'),(10,'2018-12-28 22:27:28'),(11,'2020-08-08 04:49:32'),(12,'2019-12-30 04:09:46'),(13,'2018-02-04 14:00:12'),(14,'2020-04-29 02:50:33'),(15,'2018-12-13 21:41:42'),(16,'2020-08-10 09:56:47'),(17,'2018-12-02 15:40:56'),(18,'2019-11-30 13:19:14'),(19,'2018-12-03 16:31:01'),(20,'2019-01-07 12:43:19'),(21,'2019-09-25 06:13:24'),(22,'2018-04-10 04:32:13'),(23,'2018-03-27 01:49:38'),(24,'2018-09-16 03:24:29'),(25,'2020-02-03 10:05:54'),(26,'2021-03-04 06:20:28'),(27,'2017-12-31 18:30:04'),(28,'2018-10-14 05:23:42'),(29,'2017-12-31 18:51:08'),(30,'2018-09-09 16:49:46'),(31,'2020-05-25 20:43:18'),(32,'2019-03-22 18:15:52'),(33,'2017-12-31 18:30:07'),(34,'2020-09-15 13:04:04'),(35,'2019-10-05 23:37:23'),(36,'2020-09-01 07:44:32'),(37,'2017-12-31 20:16:37'),(38,'2017-12-31 18:38:53'),(39,'2020-10-21 08:14:59'),(40,'2017-12-31 18:30:09'),(41,'2019-02-20 12:42:47'),(42,'2020-04-11 22:30:02'),(43,'2017-12-31 19:21:57'),(44,'2020-07-05 03:17:47'),(45,'2021-02-20 07:25:03'),(46,'2020-02-11 16:27:45'),(47,'2018-08-14 23:07:23'),(48,'2020-05-24 09:10:23'),(49,'2019-06-30 15:40:00'),(50,'2019-09-17 18:16:53');
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplies`
--

DROP TABLE IF EXISTS `supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplies` (
  `drugID` int(11) NOT NULL,
  `vendorID` int(11) NOT NULL,
  `price` float NOT NULL,
  `orderTime` datetime NOT NULL,
  `supplyTime` datetime DEFAULT NULL,
  PRIMARY KEY (`drugID`,`vendorID`),
  KEY `FK_Vendor_Supplies` (`vendorID`),
  CONSTRAINT `FK_Pharmacy_Supplies` FOREIGN KEY (`drugID`) REFERENCES `pharmacy` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Vendor_Supplies` FOREIGN KEY (`vendorID`) REFERENCES `vendor` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplies`
--

LOCK TABLES `supplies` WRITE;
/*!40000 ALTER TABLE `supplies` DISABLE KEYS */;
INSERT INTO `supplies` VALUES (1,1,7609080,'2018-12-01 00:10:01',NULL),(2,2,8500500,'2020-08-20 10:24:50','2020-08-21 07:14:30'),(3,3,5,'2018-01-01 00:00:06',NULL),(4,4,5,'2018-01-01 00:00:06','2018-01-05 04:04:15'),(5,5,8965770,'2019-10-09 05:14:04','2019-10-13 10:30:40'),(6,6,6666770,'2019-03-03 21:54:13','2019-03-10 06:27:58'),(7,7,7996570,'2018-09-15 03:43:58','2018-09-16 16:45:38'),(8,8,4302900,'2018-04-10 06:13:18','2018-04-12 07:08:16'),(9,9,108,'2018-01-01 00:01:49','2018-01-06 02:05:36'),(10,10,9763180,'2018-10-21 18:32:16','2018-10-27 10:10:40'),(11,11,1829450,'2020-10-18 21:19:50','2020-10-21 21:54:18'),(12,12,7517900,'2019-04-04 01:49:06','2019-04-08 19:16:13'),(13,13,8,'2018-01-01 00:00:09','2018-01-03 06:26:28'),(14,14,4392190,'2019-05-16 07:22:13','2019-05-19 21:04:55'),(15,15,8843970,'2020-01-15 13:03:37','2020-01-19 13:30:17'),(16,16,8957840,'2020-12-05 16:09:42','2020-12-06 16:05:02'),(17,17,0,'2018-01-01 00:00:01','2018-01-04 18:00:58'),(18,18,5917560,'2019-07-22 12:16:08','2019-07-28 05:45:36'),(19,19,2516,'2018-01-01 00:41:57','2018-01-06 16:43:48'),(20,20,3746040,'2018-09-10 09:04:29','2018-09-16 08:08:35'),(21,21,2110260,'2020-12-30 22:53:58','2021-01-04 13:58:57'),(22,22,611397,'2018-08-17 05:54:19','2018-08-21 20:22:00'),(23,23,6482730,'2021-02-15 02:19:13','2021-02-17 05:51:30'),(24,24,5986210,'2019-02-17 05:03:35','2019-02-19 01:11:54'),(25,25,1504810,'2020-07-01 00:17:25','2020-07-03 09:12:29'),(26,26,8937580,'2020-05-18 19:57:10','2020-05-24 16:09:50'),(27,27,9898850,'2018-10-13 00:27:25','2018-10-18 19:09:04'),(28,28,1628120,'2019-01-01 02:08:14','2019-01-04 01:50:02'),(29,29,1677640,'2020-11-17 01:39:01','2020-11-22 02:51:29'),(30,30,7761960,'2019-09-25 22:43:04','2019-09-27 23:16:21'),(31,31,1340780,'2020-01-11 19:58:10','2020-01-15 22:16:51'),(32,32,1,'2018-01-01 00:00:02','2018-01-04 16:03:07'),(33,33,2936900,'2019-11-15 20:35:40','2019-11-22 12:51:14'),(34,34,9,'2018-01-01 00:00:10','2018-01-06 08:37:28'),(35,35,5090820,'2020-12-01 23:32:06','2020-12-06 19:15:41'),(36,36,4830320,'2020-02-03 12:08:35',NULL),(37,37,6214930,'2020-08-13 05:36:38','2020-08-19 07:41:40'),(38,38,192,'2018-01-01 00:03:13','2018-01-03 17:50:03'),(39,39,32078,'2021-02-09 20:36:26','2021-02-16 11:04:45'),(40,40,7585620,'2018-02-27 06:33:16','2018-03-03 18:25:33'),(41,41,1096250,'2020-11-18 10:12:30','2020-11-18 19:51:32'),(42,42,6763,'2018-01-01 01:52:44','2018-01-05 23:22:03'),(43,43,8528440,'2018-07-07 02:47:03','2018-07-11 23:31:11'),(44,44,2979790,'2018-01-26 07:48:40','2018-01-26 22:40:40'),(45,45,196,'2018-01-01 00:03:17','2018-01-05 15:51:05'),(46,46,5741680,'2018-12-03 11:18:51','2018-12-05 04:07:28'),(47,47,90,'2018-01-01 00:01:31','2018-01-04 05:44:45'),(48,48,7,'2018-01-01 00:00:08','2018-01-04 08:51:38'),(49,49,7677770,'2019-01-18 04:49:00',NULL),(50,50,5229870,'2019-09-27 00:24:27','2019-10-03 02:19:10');
/*!40000 ALTER TABLE `supplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Email` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
INSERT INTO `vendor` VALUES (1,'United Space Research Co.','+91 15335-','1-6 James Court, Rowlands Gill, Northamptonshire DA2 8BD','Dia.Stover@nowhere.c'),(2,'City Wave Energy Co.','+91 31745-','8B Blackhorse Lane, Telford, Gloucestershire BN60 4WQ','BrendanBradford465@n'),(3,'Pacific Z-Mobile Inc.','+91 60352-','32-29 Amersham Road, Portsmouth, Herefordshire PL78 6UT','Mallory.Reynoso@exam'),(4,'Professional High-Technologies Corp.','+91 47210-','1-8 Bellevue Road, Abbots Langley, Gwynedd CW4 7BN','AbrahamLankford582@n'),(5,'First Cars Group','+91 77237-','4 Czar Street, Nairn, Surrey WN2 1VZ','cwxi39@example.com'),(6,'West Wave Resources Co.','+91 56076-','23-56 Abbey Road, Westerham, Berkshire HG2 8SR','Baldwin@example.com'),(7,'Canadian Instruments Group','+91 76678-','5 Camberwell Grove, Purfleet, Ayrshire HP37 3GE','Gema.Loy23@nowhere.c'),(8,'First Engineering Inc.','+91 44918-','22-17 Bromley Road, Ardgay, Gloucestershire BL3 2EG','Michel@nowhere.com'),(9,'American Instruments Group','+91 41061-','9B Ashmead Road, Newry, Herefordshire GL82 1NX','Krause791@nowhere.co'),(10,'Australian O-Mobile Inc.','+91 24274-','3 Morton Court, Mablethorpe, Peeblesshire PO84 7JH','Metzger28@example.co'),(11,'East Y-Mobile Group','+91 48514-','6 Roupell Street, Henley-on-Thames, Herefordshire CR86 7JZ','JerryAbernathy@examp'),(12,'Australian Heating Co.','+91 37015-','2 Packet Boat Lane, Aberdeen, Clwyd SN97 6BG','vtcr16@example.com'),(13,'Special Computers Inc.','+91 03665-','9 Ashley Road, Peterborough, Worcestershire NN5 8BY','Sachiko_Akin@example'),(14,'American Automotive Corporation','+91 03207-','23 Kennington Lane, Ballachulish, Gwynedd EX34 8PJ','JeneeRamsay79@nowher'),(15,'South Development Co.','+91 75510-','51 Churton Street, Peterborough, East Lothian TF40 8PV','TobyFenner@example.c'),(16,'Pacific Space Explore Inc.','+91 68567-','7C Marshall Street, Lydbury North, Kirkcudbrightshire PE9 3ED','Vashti_RWelker@examp'),(17,'Future X-Mobile Group','+91 31955-','1 Appleby Close, St Ives, Kinross-shire S4 5FJ','Abney277@example.com'),(18,'Australian F-Mobile Group','+91 78471-','72 A-C Cambridge Street, Castlewellan, Surrey SN7 9PN','CassK84@example.com'),(19,'General Space Explore Corp.','+91 60531-','4-8 Craven Park Road, Rowley Regis, Buckinghamshire CA90 6NN','AdalineXCushman@exam'),(20,'Future Space Research Corp.','+91 17885-','35-39 Eustace Road, Blackpool, Banffshire CR3 2JT','Joy_Booker@example.c'),(21,'Smart Equipment Co.','+91 29072-','6A Altior Court, Crawley, Dumfriesshire CV22 5PJ','Collene.Olsen@exampl'),(22,'Canadian Data Corp.','+91 19197-','24-27 Chamomile Court, Sunderland, Oxfordshire HX7 6SZ','MaxBoykin99@example.'),(23,'Pacific Goods Inc.','+91 95700-','15-46 Heath Road, Stockport, Tyrone DG5 8AB','Ada.Forman51@example'),(24,'City X-Mobile Corp.','+91 22239-','1-8 Nine Elms Lane, Stoke-on-Trent, Clwyd WN1 9BS','DallasJacques@exampl'),(25,'Future Space Research Corporation','+91 91236-','43-36 Milligan Street, Stockport, Sutherland TQ2 7NX','awsjyzvh.ovtixosbir@'),(26,'American Space Research Inc.','+91 13671-','2-8 Bellevue Road, Reading, Bute HG56 5PP','Mcneal@example.com'),(27,'Federal O-Mobile Corporation','+91 20129-','2-8 Eindhoven Close, Borth, Orkney LE3 2RP','Pendergrass@example.'),(28,'Federal Telecommunications Corp.','+91 09278-','44-27 Abbey Lane, Bagillt, Caithness ME16 3RZ','ErickFulmer@example.'),(29,'Canadian O-Mobile Corporation','+91 05701-','52-47 Londis Commercial Way, Huddersfield, Hampshire DH88 5GG','Prichard75@nowhere.c'),(30,'Creative Space Research Inc.','+91 95698-','3 Abbey Road, South Norwood, Dorset SK4 4DV','Abraham@nowhere.com'),(31,'Future Solar Energy Co.','+91 50401-','43-57 Sherwood Avenue, Bishopbriggs, Dyfed BL18 2ND','Burt96@nowhere.com'),(32,'General High-Technologies Inc.','+91 21406-','14-18 Britannia Walk, Tiverton, Tyrone TF4 5EX','ttqy4@example.com'),(33,'West Space Explore Corporation','+91 63970-','6 Abercairn Road, Derby, Merseyside DT8 5AV','LutherWithers@nowher'),(34,'Flexible High-Technologies Corporation','+91 91670-','4-9 Boston Road, London, Somerset SM55 6DB','BarkleyH563@example.'),(35,'Global Space Explore Group','+91 77476-','32-46 Londis Commercial Way, Stoke-on-Trent, Northumberland SG88 3VJ','Strauss1@example.com'),(36,'Domestic 4G Wireless Co.','+91 56073-','13-37 Crucifix Lane, Sutton Coldfield, Fife DY63 1US','Donte_Walton@example'),(37,'Home 5G Wireless Inc.','+91 33616-','1-8 Balham High Road, Plymouth, Aberdeenshire MK6 9HF','Vicky_Tharp@nowhere.'),(38,'Canadian High-Technologies Co.','+91 48046-','44-46 Alie Street, Dudley, Dunbartonshire TQ65 3RJ','AbbySchreiber@nowher'),(39,'WorldWide B-Mobile Inc.','+91 55831-','53-36 Stonhouse Street, Exeter, Westmorland LD6 4FW','grsyviuh23@example.c'),(40,'Global Media Co.','+91 47910-','4-8 Great Cambridge Road, Hawes, Inverness-shire WV79 7VB','Bass315@example.com'),(41,'City High-Technologies Group','+91 51128-','32-49 St John\'s Road, Sconser, Peeblesshire TF5 5SF','Carman1@nowhere.com'),(42,'Canadian Mobile Co.','+91 44972-','5B Vaughan Road, Caersws, Bute IM3 3YB','BryanDelatorre56@exa'),(43,'Creative Space Explore Corporation','+91 07525-','3-7 Blue Arrow, Stroud, Gwent IP7 1JX','MccartneyA@example.c'),(44,'Federal E-Mobile Corporation','+91 97073-','2-6 Ruscoe Road, Uckfield, Banffshire HU40 4UB','DonellaAbreu@example'),(45,'Beyond Space Explore Group','+91 50701-','5 Alfred Road, Cambridge, Middlesex KY74 6VE','Keith@example.com'),(46,'Canadian High-Technologies Group','+91 84790-','2-7 Easex Road, Reading, Argyll IP76 9TD','CoreyLeake@example.c'),(47,'Special Engineering Inc.','+91 37052-','3-9 Wellesley Road, Gloucester, Kinross-shire TD6 3GP','Arnulfo.EBattaglia@e'),(48,'International High-Technologies Group','+91 12817-','81D Abbotsbury Road, Peterborough, Angus PE51 5RD','Cesar_Jimenez4@examp'),(49,'Global High-Technologies Group','+91 81727-','32-58 Bedwell Close, Blackpool, Shropshire BB50 6GN','Ahmed.Abney@example.'),(50,'General Services Inc.','+91 25165-','47 Ada Street, Bournemouth, Argyll WC1 2YD','IrwinCrocker4@exampl');
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-22 13:16:37
