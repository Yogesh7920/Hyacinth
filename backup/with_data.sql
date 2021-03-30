-- MariaDB dump 10.19  Distrib 10.5.9-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Hyacinth
-- ------------------------------------------------------
-- Server version	10.5.9-MariaDB-1:10.5.9+maria~focal

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
-- Table structure for table `Admin`
--

DROP TABLE IF EXISTS `Admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Admin` (
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_Employee_Admin` FOREIGN KEY (`ID`) REFERENCES `Employee` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Admin`
--

LOCK TABLES `Admin` WRITE;
/*!40000 ALTER TABLE `Admin` DISABLE KEYS */;
INSERT INTO `Admin` VALUES (30);
/*!40000 ALTER TABLE `Admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ambulance`
--

DROP TABLE IF EXISTS `Ambulance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ambulance` (
  `ID` int(11) NOT NULL,
  `lastMaintenance` datetime DEFAULT NULL,
  `totalDistance` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ambulance`
--

LOCK TABLES `Ambulance` WRITE;
/*!40000 ALTER TABLE `Ambulance` DISABLE KEYS */;
INSERT INTO `Ambulance` VALUES (1,'2018-01-01 00:00:04',3),(2,'2020-08-28 03:13:14',8725910),(3,'2018-01-01 00:00:08',7),(4,'2019-06-12 19:41:07',8561610),(5,'2019-07-07 13:20:04',1711720),(6,NULL,734547),(7,'2021-03-11 20:03:42',7017220),(8,'2018-11-25 05:40:55',8649100),(9,'2020-11-22 14:54:40',7689120),(10,'2018-09-28 21:38:56',938980),(11,'2019-12-12 01:22:41',638),(12,'2018-01-01 00:10:39',3399),(13,'2018-01-01 00:56:40',9835410),(14,'2019-11-03 19:04:14',65),(15,'2018-01-01 00:01:06',414),(16,'2018-01-01 00:06:55',7797850),(17,'2019-09-28 08:56:18',24),(18,'2018-01-01 00:00:25',5724260),(19,'2019-03-21 06:33:58',8694940),(20,'2020-09-22 19:40:11',3453),(21,'2018-01-01 00:57:34',7748),(22,'2018-01-01 02:09:09',9947960),(23,'2018-07-05 02:30:44',8745),(24,'2018-01-01 02:25:46',1364150),(25,'2019-01-11 01:25:52',9),(26,'2018-01-01 00:00:10',5568200),(27,'2020-11-18 23:44:22',4818420),(28,'2020-08-22 16:40:09',8530190),(29,NULL,9852830),(30,NULL,7106440);
/*!40000 ALTER TABLE `Ambulance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Appointment`
--

DROP TABLE IF EXISTS `Appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Appointment` (
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
  CONSTRAINT `FK_Consultation_Appointment` FOREIGN KEY (`consultationId`) REFERENCES `Consultation` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Invoice_Appointment` FOREIGN KEY (`invoiceId`) REFERENCES `Invoice` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Prescription_Appointment` FOREIGN KEY (`prescriptionId`) REFERENCES `Prescription` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `DateTimeCheck` CHECK (`endTime` > `startTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Appointment`
--

LOCK TABLES `Appointment` WRITE;
/*!40000 ALTER TABLE `Appointment` DISABLE KEYS */;
INSERT INTO `Appointment` VALUES (1,'2019-12-10 03:10:12','2019-12-12 16:40:44','Molestias voluptatem dolores.\r\n',48,36,7),(2,'2019-11-12 03:31:17','2019-11-12 14:20:37','Ut voluptatem et. Ab corporis.',44,49,28),(3,'2018-01-01 01:19:23','2018-01-04 15:09:58','Doloribus temporibus eum;',50,27,27),(4,'2018-11-13 06:30:15','2018-11-16 21:59:57','Quaerat assumenda.\r\n',39,47,45),(5,'2020-06-19 17:15:44','2020-06-21 10:40:18','Tempore aut eos. Quo commodi.\r\n',24,11,1),(6,'2020-07-24 05:28:57','2020-07-26 22:36:55','Eveniet atque aut. Sapiente!\r\n',30,20,28),(7,'2018-07-31 11:11:14','2018-08-01 08:02:32','Quod totam quos. Qui.\r\n',25,45,21),(8,'2018-11-29 03:31:13','2018-11-30 19:43:58','Voluptatem deleniti ut.\r\n',34,42,23),(9,'2019-08-27 08:59:11','2019-08-29 10:39:36','Est ut autem. Accusamus...\r\n',31,37,42),(10,'2020-09-28 05:23:14','2020-09-29 12:55:14','Sit at est. Fugiat earum.\r\n',40,48,11),(11,'2018-01-01 00:00:07','2018-01-04 14:02:02','Impedit rem adipisci. Hic;',46,50,4),(12,'2018-04-15 19:19:02','2018-04-16 08:23:00','Sequi ut eum. Quam aut.',6,43,37),(13,'2019-07-01 22:21:10','2019-07-02 14:12:17','Harum et quod; consequatur.\r\n',49,38,8),(14,'2021-01-09 23:42:50','2021-01-13 01:17:31','Et sunt sed.\r\nDeserunt.\r\n',1,15,21),(15,'2021-03-06 09:01:03','2021-03-08 02:45:03','Rem vero esse. Eius laudantium.',47,46,42),(16,'2020-04-15 20:50:43','2020-04-19 04:28:53','In voluptatem molestiae.\r\n',45,21,3),(17,'2019-12-26 13:56:36','2019-12-29 15:04:32','Suscipit repellat eum. Id.\r\n',16,6,5),(18,'2018-01-01 01:00:32','2018-01-02 04:32:58','Placeat quia fuga. Itaque.\r\n',22,16,24),(19,'2019-10-29 14:04:06','2019-11-02 12:27:13','Ipsam architecto.\r\n',7,33,33),(20,'2020-01-05 18:53:12','2020-01-08 18:27:42','Unde laboriosam molestias.',35,28,33),(21,'2019-09-15 07:57:59','2019-09-15 21:13:21','Vel beatae unde.\r\nSed.\r\n',41,44,4),(22,'2018-08-09 15:08:25','2018-08-13 10:28:52','Perspiciatis ad nulla.\r\n',26,1,32),(23,'2018-12-19 17:35:45','2018-12-23 00:43:05','Et quisquam sunt. Sed.',2,7,22),(24,'2018-01-01 00:14:28','2018-01-02 15:30:38','Sed et est; aliquid.\r\n',17,23,23),(25,'2018-01-01 00:00:07','2018-01-04 07:40:25',NULL,12,29,47),(26,'2018-10-06 08:50:13','2018-10-08 03:28:31',NULL,32,22,13),(27,'2018-08-19 05:38:57','2018-08-22 20:25:23','Animi dolorum aut.\r\n',18,24,41),(28,'2018-10-10 12:03:55','2018-10-12 02:54:01','Provident sed velit.\r\n',8,39,40),(29,'2018-05-29 04:27:36','2018-05-31 05:16:29','Corrupti laborum;\r\n',13,2,37),(30,'2018-01-01 00:00:12','2018-01-04 07:39:47','Et voluptates quibusdam.\r\n',27,17,47),(31,'2020-09-05 13:45:44','2020-09-06 20:25:07','Deleniti vitae facere. Error.\r\n',36,12,13),(32,'2019-09-16 14:43:50','2019-09-20 08:01:38','Adipisci voluptate.\r\n',3,30,46),(33,'2019-01-02 06:58:08','2019-01-02 22:35:24','Enim voluptatum.\r\n',33,18,19),(34,'2020-06-22 07:35:41','2020-06-25 14:14:09','Quam est ut. Vero...\r\n',28,25,28),(35,'2018-07-13 10:05:13','2018-07-16 06:03:55','Obcaecati sed assumenda.\r\n',23,13,19),(36,'2018-01-01 00:14:57','2018-01-01 16:08:29','Dolores vero quam. Tenetur;\r\n',42,34,19),(37,'2018-09-26 13:41:43','2018-09-28 17:16:04','Dolore est qui;\r\n',29,19,4),(38,'2019-10-06 21:12:41','2019-10-09 07:16:13','Unde animi obcaecati.\r\n',9,40,20),(39,'2019-11-20 14:45:17','2019-11-22 15:03:12','Nihil id ut.\r\nPossimus.\r\n',4,14,43),(40,'2018-01-27 07:51:42','2018-01-27 17:26:45','Veniam veritatis.\r\n',10,35,1),(41,'2018-02-28 22:49:53','2018-03-02 09:31:19','Magni harum molestiae.\r\n',37,31,20),(42,'2018-01-01 00:01:02','2018-01-03 20:36:05','Consequatur facilis sed.\r\n',43,41,17),(43,'2019-06-21 20:22:15','2019-06-23 18:13:57','Nihil voluptatem.\r\n',5,8,12),(44,'2021-01-07 19:03:21','2021-01-10 20:07:33','Rem sit quis.\r\nAut fugit.',19,26,15),(45,'2018-03-24 11:12:12','2018-03-28 06:20:05','Non consequatur.\r\n',14,3,4),(46,'2019-03-02 03:44:59','2019-03-05 12:50:42','Rerum aut nesciunt. Eius!\r\n',11,9,47),(47,'2020-10-02 16:07:17','2020-10-04 22:23:55','Ad natus ut.',38,32,8),(48,'2018-08-28 09:17:48','2018-08-30 22:55:38','Tempora culpa cumque...\r\n',20,4,48),(49,'2018-02-02 05:51:53','2018-02-02 18:45:39','Unde quas culpa. Iste.\r\n',15,10,2),(50,'2019-03-25 08:54:38','2019-03-27 02:29:28','Vero temporibus quis.\r\n',21,5,17);
/*!40000 ALTER TABLE `Appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Assists`
--

DROP TABLE IF EXISTS `Assists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Assists` (
  `nurseId` int(11) NOT NULL,
  `diagnosticsID` int(11) NOT NULL,
  PRIMARY KEY (`nurseId`,`diagnosticsID`),
  KEY `FK_Diagnostics_Assists` (`diagnosticsID`),
  CONSTRAINT `FK_Diagnostics_Assists` FOREIGN KEY (`diagnosticsID`) REFERENCES `Diagnostics` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Nurse_Assists` FOREIGN KEY (`nurseId`) REFERENCES `Nurse` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assists`
--

LOCK TABLES `Assists` WRITE;
/*!40000 ALTER TABLE `Assists` DISABLE KEYS */;
INSERT INTO `Assists` VALUES (16,1),(16,2),(16,3),(16,4),(16,5),(17,2),(17,3),(17,4),(17,5),(17,6),(18,3),(18,4),(18,5),(18,6),(18,7),(19,4),(19,5),(19,6),(19,7),(19,8),(20,5),(20,6),(20,7),(20,8),(20,9),(21,6),(21,7),(21,8),(21,9),(21,10),(22,7),(22,8),(22,9),(22,10),(22,11),(23,8),(23,9),(23,10),(23,11),(23,12),(24,9),(24,10),(24,11),(24,12),(24,13),(25,10),(25,11),(25,12),(25,13),(25,14);
/*!40000 ALTER TABLE `Assists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Consultation`
--

DROP TABLE IF EXISTS `Consultation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Consultation` (
  `ID` int(11) NOT NULL,
  `problem` varchar(40) DEFAULT NULL,
  `doctorID` int(11) DEFAULT NULL,
  `patientID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Doctor_Consultation` (`doctorID`),
  KEY `FK_Patient_Consultation` (`patientID`),
  CONSTRAINT `FK_Doctor_Consultation` FOREIGN KEY (`doctorID`) REFERENCES `Doctor` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Patient_Consultation` FOREIGN KEY (`patientID`) REFERENCES `Patient` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Consultation`
--

LOCK TABLES `Consultation` WRITE;
/*!40000 ALTER TABLE `Consultation` DISABLE KEYS */;
INSERT INTO `Consultation` VALUES (1,'Omnis et quis.\r\nNulla;',15,29),(2,'Non omnis et; deleniti quae?',7,4),(3,'Cumque qui recusandae;\r\n',4,24),(4,'Voluptatem vel enim. Vel.\r\n',4,10),(5,'Nobis impedit quisquam. A.\r\n',1,50),(6,'Culpa saepe facere.\r\n',1,50),(7,'Dolor sit sint. Repellat quia.',7,41),(8,'Ullam nihil ut. Saepe est;\r\n',3,36),(9,'Illum cumque veritatis.\r\n',14,5),(10,'Eum iste natus. Id.\r\n',7,42),(11,'Voluptatem suscipit harum.\r\n',10,11),(12,'Provident doloribus itaque.',13,6),(13,NULL,7,46),(14,'Eos soluta autem;\r\n',6,37),(15,'Iste sit nesciunt nam.',4,22),(16,'Est architecto quas. Ut!\r\n',2,46),(17,'Neque natus deleniti...\r\nMagnam.',9,1),(18,'Qui error aspernatur. Earum.\r\n',1,43),(19,'Ab molestias hic. Repellendus.',3,38),(20,'Nam ut maxime.\r\nOdit quia.\r\n',3,29),(21,'Et eum quod. Et provident!\r\n',5,24),(22,'Cumque unde dolore. Odit;\r\n',4,44),(23,'Magnam consequuntur beatae.\r\n',1,49),(24,'Voluptas et veniam. Et ullam.',12,39),(25,'Et vitae esse facere sed eos.',2,30),(26,'Aut tempore maiores.\r\n',3,25),(27,'Aliquid facere aliquam at.',2,34),(28,'Sed et iure. Error eum placeat!',4,47),(29,'Ut sed rerum. Voluptatem ipsum.',11,22),(30,'At illum distinctio. Enim ex.\r\n',2,17),(31,'Perspiciatis cum praesentium.\r\n',9,12),(32,'Ut inventore molestiae.\r\n',6,40),(33,'Consequatur molestias.\r\n',1,7),(34,'Amet quia consequuntur. Ut!',3,35),(35,'Et voluptas eos. Qui tempora.\r\n',6,18),(36,'Dolorum animi amet.\r\n',5,17),(37,'Et ut qui. Adipisci quo velit?',2,45),(38,'Vel hic necessitatibus.\r\n',6,49),(39,'Sit aperiam voluptas. Itaque.\r\n',5,30),(40,'Ut labore delectus.\r\n',8,25),(41,'Voluptas illum voluptate;\r\n',9,12),(42,'Vero et excepturi ducimus ut.',8,47),(43,'Molestiae ducimus est.',8,2),(44,'Deleniti atque dignissimos.\r\n',6,18),(45,'Rerum fugit ut; sit eaque.',7,31),(46,'Perferendis in iusto.\r\n',5,13),(47,'Et in ut.\r\nEst sint est.\r\n',5,8),(48,'Qui corporis omnis. Eligendi.\r\n',9,13),(49,'Totam et est. Asperiores.\r\n',9,26),(50,'Quo unde sit. Unde accusamus.\r\n',8,31);
/*!40000 ALTER TABLE `Consultation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contains`
--

DROP TABLE IF EXISTS `Contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contains` (
  `diagnosticsID` int(11) NOT NULL,
  `prescriptionID` int(11) NOT NULL,
  PRIMARY KEY (`diagnosticsID`,`prescriptionID`),
  KEY `FK_Prescription_Contains` (`prescriptionID`),
  CONSTRAINT `FK_Diagnostics_Contains` FOREIGN KEY (`diagnosticsID`) REFERENCES `Diagnostics` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Prescription_Contains` FOREIGN KEY (`prescriptionID`) REFERENCES `Prescription` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contains`
--

LOCK TABLES `Contains` WRITE;
/*!40000 ALTER TABLE `Contains` DISABLE KEYS */;
INSERT INTO `Contains` VALUES (1,1),(1,2),(2,2),(2,3),(3,3),(3,4),(4,4),(4,5),(5,5),(5,6),(6,6),(6,7),(7,7),(7,8),(8,8),(8,9),(9,9),(9,10),(10,10),(10,11),(11,11),(11,12),(12,12),(12,13),(13,13),(13,14),(14,14),(14,15),(15,15),(15,16),(16,16),(16,17),(17,17),(17,18),(18,18),(18,19),(19,19),(19,20),(20,20),(20,21),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30);
/*!40000 ALTER TABLE `Contains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Diagnostics`
--

DROP TABLE IF EXISTS `Diagnostics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Diagnostics` (
  `ID` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Diagnostics`
--

LOCK TABLES `Diagnostics` WRITE;
/*!40000 ALTER TABLE `Diagnostics` DISABLE KEYS */;
INSERT INTO `Diagnostics` VALUES (1,'ECG','Molestiae.'),(2,'ECG','Eos molestiae.'),(3,'Vaccine','Est repellat.'),(4,'Scan','Excepturi et.'),(5,'First Aid','Laboriosam.'),(6,'Surgery','Laboriosam.'),(7,'Scan','Fugit.'),(8,'ECG','Atque velit.'),(9,'Surgery','Autem.'),(10,'Scan','Delectus.'),(11,'Scan','Omnis in.'),(12,'First Aid','Sint provident.'),(13,'Surgery','Vero amet qui.'),(14,'Scan','Qui illo sequi.'),(15,'Vaccine','Magni dolore...'),(16,'Surgery','Rerum sunt.'),(17,'Vaccine','Ut ipsum.'),(18,'Vaccine','Officia.'),(19,'First Aid','Ut iusto.'),(20,'Surgery','Non.'),(21,'ECG','Odit deleniti.'),(22,'ECG','Adipisci in.'),(23,'Scan','Quam error.'),(24,'Surgery','Repudiandae.'),(25,'First Aid','Quasi quisquam.'),(26,'ECG','Blanditiis...'),(27,'Surgery','Nobis quo.'),(28,'ECG','Nulla sed id.'),(29,'ECG','Dolor.'),(30,'Scan','Dolores.');
/*!40000 ALTER TABLE `Diagnostics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Doctor`
--

DROP TABLE IF EXISTS `Doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Doctor` (
  `ID` int(11) NOT NULL,
  `qualification` varchar(30) NOT NULL,
  `license` varchar(30) NOT NULL,
  `bio` varchar(300) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `specialization` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_Employee_Doctor` FOREIGN KEY (`ID`) REFERENCES `Employee` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Doctor`
--

LOCK TABLES `Doctor` WRITE;
/*!40000 ALTER TABLE `Doctor` DISABLE KEYS */;
INSERT INTO `Doctor` VALUES (1,'Paediatrics','VG88508545','Sed aut quis.\r\nBeatae suscipit consequatur. Eos vitae et. Eos omnis laborum! Aut ab et. Tempora vitae corrupti. Omnis unde qui! Distinctio adipisci cumque. Fugit quis ducimus!\r\nAsperiores cum voluptatem.',0,'Family Practice'),(2,'Tuberculosis and Respiratory d','MV67988583','Maiores voluptatem odit. Sint est beatae! Voluptas vel quo. Libero provident fugiat! Unde blanditiis fugiat. Fugit nihil dignissimos! Ratione voluptas minima; sed aut est.\r\nProvident ut quibusdam. Temporibus possimus dolorem.',0,'Endocrinology'),(3,'Bachelor of Medicine, Bachelor','SP04631043','Odit sed, velit voluptas iste eius natus et veritatis vitae commodi aspernatur enim. Fuga neque et. Ullam error dolores! Sed deleniti sit. Odio iusto sapiente! Rerum quis voluptates. Ut omnis sit.',0,'Family Practice'),(4,'Palliative Medicine','AU43835063','Sed est eos. Alias est aut.\r\nCommodi voluptas quasi. Sed sint esse. Mollitia ea tenetur? Quam ut sit. Molestiae voluptatem ex! Ducimus est ipsa. Corporis sed id! Facilis dignissimos quae.',1,'Orthopedic Surgery'),(5,'Obstetrics and Gynaecology','MH50132113','Autem est at; culpa eum non. Unde commodi iste? Rem quia sed. Eum nihil nobis! Consequatur natus distinctio. Est quia error. Quas et eaque. Sed deleniti est; unde delectus tempore.\r\n',1,'Chiropractor'),(6,'Biochemistry','UK63146980','Rerum deleniti et natus animi corporis. Soluta quisquam ipsum fugiat iste dolor unde explicabo libero et quam non sit a velit cum reiciendis dolore qui; voluptas quia enim. Dolore aut consequuntur! Aliquam debitis molestiae.',0,'Family Practice'),(7,'Bachelor of Medicine, Bachelor','VN09336507','Nisi ut nisi.\r\nUt modi aspernatur. Necessitatibus sint rerum. Excepturi assumenda obcaecati. Ducimus dolorum iusto. Sed eaque autem; mollitia sunt impedit. Ipsam cum iste. Et veritatis praesentium. Alias quia sed!\r\n',0,'Otolaryngology'),(8,'Dermatology, Venerology and Le','TJ17459860','Voluptatem porro incidunt. Libero fugiat ipsum. Sit distinctio iste. Vero est omnis. Et non in? Perspiciatis sit explicabo. Ullam perferendis beatae. Unde ea pariatur.\r\nSunt quisquam iste. Dolorem consectetur culpa.\r\n',0,'Dermatology'),(9,'Biochemistry','ZT32280402','Ea quod maxime...\r\nQuia rerum error. Natus autem rerum. Non nemo nobis. Enim obcaecati libero. Neque numquam in; inventore impedit inventore.\r\nQui nisi quasi; quas qui sed; obcaecati tenetur nobis.\r\n',0,'Cardiology'),(10,'Dermatology','MD13668520','Omnis dolores inventore.\r\nEt delectus labore. Nostrum enim dolor. Sit iste nihil! Id voluptates aut. Quia distinctio totam.\r\nAut totam accusantium. Tempore impedit inventore...\r\nExcepturi atque voluptate. Qui vero error.',1,'Cardiology'),(11,'Biochemistry','EU11297181','Error a voluptatem. Nisi non ut. Deserunt magnam et! Omnis harum pariatur; error sed qui. Nihil id qui? Et est officiis. Velit illo dicta.\r\nUt quis aut. Et excepturi sit.',0,'Anesthesiology'),(12,'Forensic Medicine','KZ44294515','Quaerat dolor voluptates. Nobis illum rerum. Et explicabo vel. Et omnis magnam! Et magnam qui. Architecto iste ut? Libero voluptatem corrupti! Molestiae dolor quis. Expedita perspiciatis sed.\r\nEt quod amet.\r\n',0,'Hematology'),(13,'Physiology','KM57568616','Ut maiores aut. Dolor sed dolores. Sit magnam enim!\r\nPerspiciatis aliquid illo. Quaerat unde ut. Sunt ea quasi; magnam tempora fugit. Aut alias voluptatem. Delectus et dolorem.\r\nNemo odit aut.',0,'Hematology'),(14,'Laryngology','VE79885001','Maiores enim quibusdam. Magni maxime sit. Error sit nihil; nesciunt ea voluptatem. Quo sint impedit? Laboriosam iste sit. Quibusdam eaque voluptate. Consequuntur enim dolores? Qui quidem ut.\r\nQuod aut qui;\r\n',1,'Cardiology'),(15,'Cardiology','HO56641352','Expedita totam omnis. Libero eaque aperiam!\r\nSuscipit omnis qui.\r\nAmet tenetur incidunt. Natus consectetur tenetur. Sit quas perspiciatis. Quo quia sed. Ipsa voluptatem in. Est eaque voluptatem. Nemo maiores recusandae!\r\n',1,'Oncology');
/*!40000 ALTER TABLE `Doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Driver`
--

DROP TABLE IF EXISTS `Driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Driver` (
  `ID` int(11) NOT NULL,
  `experience` int(5) NOT NULL,
  `licenseNo` varchar(10) NOT NULL,
  `successRate` float DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_Employee_Driver` FOREIGN KEY (`ID`) REFERENCES `Employee` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Driver`
--

LOCK TABLES `Driver` WRITE;
/*!40000 ALTER TABLE `Driver` DISABLE KEYS */;
INSERT INTO `Driver` VALUES (26,21,'LN16865292',54),(27,9,'HD77175554',13),(28,0,'VS33891242',0),(29,10,'RI76549790',45);
/*!40000 ALTER TABLE `Driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Drugs`
--

DROP TABLE IF EXISTS `Drugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Drugs` (
  `prescriptionID` int(11) NOT NULL,
  `pharmacyID` int(11) NOT NULL,
  PRIMARY KEY (`prescriptionID`,`pharmacyID`),
  KEY `FK_Pharmacy_Drugs` (`pharmacyID`),
  CONSTRAINT `FK_Pharmacy_Drugs` FOREIGN KEY (`pharmacyID`) REFERENCES `Pharmacy` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Prescription_Drugs` FOREIGN KEY (`prescriptionID`) REFERENCES `Prescription` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Drugs`
--

LOCK TABLES `Drugs` WRITE;
/*!40000 ALTER TABLE `Drugs` DISABLE KEYS */;
INSERT INTO `Drugs` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30),(31,31),(32,32),(33,33),(34,34),(35,35),(36,36),(37,37),(38,38),(39,39),(40,40),(41,41),(42,42),(43,43),(44,44),(45,45),(46,46),(47,47),(48,48),(49,49),(50,50);
/*!40000 ALTER TABLE `Drugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `ID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` longtext NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(20) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `salary` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `SexCheck` CHECK (`sex` in ('Male','Female','Other')),
  CONSTRAINT `PhoneCheck` CHECK (`phone` regexp '^[+]91 [6-9][[:digit:]]{9}$')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,'Abdul Franz','MJ/H07xTu2OsQuNZJgrHQA==','+91 6526359966','Sherry_XFranz94@nowhere.com','Railway Arch 7','Male',3397522),(2,'Dana Bethea','LUJLGxAFBZfeAhy8OBPwkw==','+91 6276875343','Nance@nowhere.com','Railway Arch 27C','Male',3984551),(3,'Jeromy Vanburen','pdwGEoMSRw5/BJ46rQFMlw==','+91 8420416516','ShannonAbney@example.com','Flats 1-9','Male',1828164),(4,'Adan May','Q6ozdL7Lb25yWVKxoMBL6g==','+91 7770548164','Celina_Cota428@example.com','Suite 94','Male',5806368),(5,'Charline Berman','oWIYH6vVWOQrJzqE1BwJYQ==','+91 9055163400','Stephens6@example.com','Arch 3','Male',3892884),(6,'Roosevelt Lloyd','J8PzIxVyebBlI8d6mImZ1g==','+91 8863501623','GainesM@nowhere.com','Flat 64','Male',341191),(7,'Carson Burley','xBTVDGItYZox6p4tjt/K4A==','+91 9445684470','Aguirre@example.com','Flat 9','Male',1091397),(8,'Gabriel Cheatham','jGpcljmOgpgW+e5/sxfllw==','+91 8816502572','Tomlinson@nowhere.com','Suite 6','Male',585477),(9,'Elfrieda Fennell','iHWRdNgH+XzOnxeQHfK2cw==','+91 7375552166','Lanny.Boehm592@nowhere.com','Railway Arch 91','Male',4128323),(10,'Antone Coles','UiYX2cz28eSmNL5F3zZcTQ==','+91 9210631867','KylaBoehm@nowhere.com','Flat 6','Male',4432160),(11,'Adelaida Mcfall','VnaAWmWke8MIqDXnN1ElIg==','+91 7750357597','Boyles241@nowhere.com','Railway Arch 5','Male',3613662),(12,'Annemarie Bess','hYmxOxhx5Qh3tXNMbW1dtw==','+91 8920743961','ofyrhsa3820@example.com','Suite 72','Male',5453680),(13,'Vincenzo Pugh','fy7fL6ghvibafwQGwQ/8lw==','+91 8322458855','Foster_Boehm@example.com','Railway Arch 8','Male',1371042),(14,'Shon Abbott','Nf6IBfJAjqm0BIgW3DVWAg==','+91 8828756077','Ken_Cunningham633@example.com','Railway Arch 62','Male',3062983),(15,'Rickie Gamble','t+o6mvEj5FjdNd5TAZ1THA==','+91 6616948625','LouanneMoeller@example.com','Flats B-D','Male',5303608),(16,'Darwin Warden','r9ISK1F8bKjdIESOmuspUw==','+91 8170967291','KennethGoodrich@example.com','Unit 24-37','Male',5267955),(17,'Mario Wilde','D47PkLPuidX2N7FYClUUAQ==','+91 6133695204','Merritt296@nowhere.com','Flats 1-8','Male',2078984),(18,'Wilburn Copeland','agxLUhkk/Tucww1VqorMKw==','+91 8269921508','Brower@example.com','Arch 9','Male',1619309),(19,'Madison Aguirre','CWh4nsoG+qVOS1tU7cn5cg==','+91 7353999498','djhpctwf7367@example.com','Railway Arch 57','Male',594445),(20,'Carmelita Piper','/MDNLo7V/Req32AqzlYcLQ==','+91 6979291001','Boss219@example.com','Railway Arch 1','Male',3619084),(21,'Edwin Minor','ih2UcRG9z/vRkkm/vIewmg==','+91 7119908073','Ambrose_Milton2@example.com','Arch 16','Male',5163556),(22,'Delisa Dejesus','GWiR6lzWh1CenFJOdlWF4w==','+91 7806870694','Lazaro.G.Fine1@nowhere.com','Railway Arch 5','Male',5830293),(23,'Alonzo Buckley','jXMsqRT2U20O/xbd26/AYg==','+91 6368042685','xppgpca9@example.com','Flats 1-7','Male',2174279),(24,'Analisa Crowder','5gFWaYJpSHD3vDZJRicGtA==','+91 8673971189','DylanLittleton@example.com','Railway Arch 22A','Male',4560461),(25,'Rose Counts','gmIbLqDxHDOz0TqgPVlAJQ==','+91 9204022578','Ritter@example.com','Flats 2-7','Male',2182116),(26,'Adam Burrows','3t8V/0Oh7JDhYQnuAev0AQ==','+91 6314842079','Evers@example.com','Railway Arch 7','Male',2651907),(27,'Sanda Mattison','qERZSa3Z7pWcS57G1W9L+Q==','+91 7219545150','Beale@nowhere.com','Arch 58','Male',404629),(28,'Jarrod Crowley','C8qcloLZmFzdvZsg06Fq+Q==','+91 8393339559','StevieValerio@example.com','Arch 8','Male',1932554),(29,'Aide Abrams','r5RxcOBxZHC/UecwcAUgnA==','+91 6487877620','Beau_Shipley@example.com','Railway Arch 27','Male',3437497),(30,'Monroe Castaneda','JFkte1hijrzELmlnyWQ32w==','+91 9293541425','GilleyD@example.com','Unit 5, Block C','Male',4005081);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoice`
--

DROP TABLE IF EXISTS `Invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoice` (
  `ID` int(11) NOT NULL,
  `amount` float NOT NULL,
  `isPaid` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoice`
--

LOCK TABLES `Invoice` WRITE;
/*!40000 ALTER TABLE `Invoice` DISABLE KEYS */;
INSERT INTO `Invoice` VALUES (1,6349570,1),(2,691,0),(3,3729050,1),(4,5117100,1),(5,7417,1),(6,3211930,0),(7,2132180,1),(8,8,0),(9,6943770,1),(10,2113600,1),(11,759,0),(12,3898,0),(13,8621010,1),(14,2758430,1),(15,572,1),(16,1012350,1),(17,5591090,1),(18,8937820,1),(19,497772,1),(20,5278050,1),(21,4420750,1),(22,6761690,1),(23,5205800,1),(24,4343080,1),(25,4752440,0),(26,1619590,1),(27,6631170,0),(28,7784990,1),(29,7149190,1),(30,7660060,0),(31,435,0),(32,9943980,0),(33,6775960,0),(34,6893950,1),(35,1394660,0),(36,5496730,1),(37,6230,1),(38,7465360,1),(39,6407960,0),(40,372,0),(41,1139700,1),(42,1761960,1),(43,3977180,1),(44,2408840,1),(45,37,0),(46,2771310,1),(47,47,1),(48,54800,0),(49,6984,1),(50,7838260,0);
/*!40000 ALTER TABLE `Invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Journey`
--

DROP TABLE IF EXISTS `Journey`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Journey` (
  `driverID` int(11) NOT NULL,
  `ambulanceId` int(11) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  PRIMARY KEY (`driverID`,`ambulanceId`),
  KEY `FK_Ambulance_Journey` (`ambulanceId`),
  CONSTRAINT `FK_Ambulance_Journey` FOREIGN KEY (`ambulanceId`) REFERENCES `Ambulance` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Driver_Journey` FOREIGN KEY (`driverID`) REFERENCES `Driver` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `DateTimeCheck` CHECK (`endTime` > `startTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Journey`
--

LOCK TABLES `Journey` WRITE;
/*!40000 ALTER TABLE `Journey` DISABLE KEYS */;
INSERT INTO `Journey` VALUES (26,1,'Apt. 454 554 Shukla Mount Delhi','2019-10-10 12:20:21','2019-10-11 10:28:00'),(26,2,'Apt. 908 56804 Vasudha Drives Arunachal Pradesh','2018-01-01 00:00:02','2018-01-02 10:55:30'),(26,3,'Suite 887 78067 Mangalya Lakes Karnataka','2020-03-28 23:16:07','2020-03-31 03:32:19'),(26,4,'Suite 303 03461 Subodh Brook Uttar Pradesh','2019-11-22 07:01:22','2019-11-22 11:43:40'),(26,5,'Suite 348 75387 Atreyee Mountain Maharashtra','2020-12-12 14:25:31','2020-12-13 08:21:31'),(26,6,'Suite 513 041 Sinha Mission Himachal Pradesh','2018-01-01 00:14:34','2018-01-02 15:35:17'),(26,7,'Suite 792 4237 Siddhran Curve Assam','2018-08-08 14:36:22','2018-08-09 20:05:15'),(26,8,'Suite 183 240 Khanna Glens Tamil Nadu','2018-01-01 00:00:13','2018-01-02 17:38:27'),(26,9,'Apt. 868 574 Susheel Forge Meghalaya','2018-02-11 08:41:20','2018-02-12 14:54:53'),(26,10,'Apt. 581 865 Gajbaahu Well Maharashtra','2018-09-29 04:03:36','2018-10-01 11:48:07'),(26,11,'Apt. 475 0161 Susheel Plains Andra Pradesh','2019-04-27 01:51:30','2019-04-29 23:57:50'),(26,12,'Suite 378 8144 Naval Ferry Delhi','2018-01-22 10:21:09','2018-01-23 06:02:59'),(26,13,'Apt. 893 2712 Amaresh Mills Daman and Diu','2020-11-25 13:28:50','2020-11-25 16:18:25'),(27,2,'Suite 313 4652 Kamla Knolls Gujarat','2018-01-01 00:00:03','2018-01-03 07:58:49'),(27,3,'Suite 887 78067 Mangalya Lakes Karnataka','2018-01-01 02:40:28','2018-01-03 20:09:36'),(27,4,'Suite 556 7050 Varma Ridge Telangana','2020-10-20 08:14:57','2020-10-22 13:24:18'),(27,5,'Apt. 808 013 Tandon Parks Tamil Nadu','2020-03-22 14:28:00','2020-03-24 18:05:01'),(27,6,'Suite 955 7717 Aanandinii Court Manipur','2020-03-15 09:33:48','2020-03-16 07:56:51'),(27,7,'Suite 556 7050 Varma Ridge Telangana','2020-08-27 15:09:03','2020-08-27 22:23:39'),(27,8,'Apt. 581 865 Gajbaahu Well Maharashtra','2018-01-01 01:16:14','2018-01-03 04:33:35'),(27,9,'Apt. 636 55090 Dwivedi Throughway Chhattisgarh','2018-12-05 06:59:19','2018-12-08 04:13:54'),(27,10,'Suite 635 346 Verma Ridges West Bengal','2020-01-07 22:56:21','2020-01-09 20:59:52'),(27,11,'Apt. 708 392 Jagathi Shoal Rajasthan','2019-10-08 08:20:32','2019-10-08 17:08:57'),(27,12,'Suite 955 7717 Aanandinii Court Manipur','2018-07-30 08:00:02','2018-07-30 22:17:12'),(27,13,'Apt. 455 827 Khatri Dam Meghalaya','2019-07-29 17:41:45','2019-08-01 08:33:12'),(27,14,'Apt. 649 556 Iyengar Estate Pondicherr','2020-02-12 23:34:31','2020-02-14 10:12:38'),(28,3,'Apt. 262 54352 Sher Wells Daman and Diu','2018-01-01 00:11:38','2018-01-02 03:54:07'),(28,4,'Suite 183 240 Khanna Glens Tamil Nadu','2018-01-01 01:25:02','2018-01-02 12:35:31'),(28,5,'Suite 066 22270 Tapan Falls Goa','2018-12-07 19:21:23','2018-12-09 21:59:21'),(28,6,'Apt. 332 403 Abhaidev Orchard Karnataka','2018-10-21 13:12:18','2018-10-23 13:54:47'),(28,7,'Apt. 893 2712 Amaresh Mills Daman and Diu','2019-02-10 10:35:53','2019-02-11 02:49:53'),(28,8,'Apt. 332 403 Abhaidev Orchard Karnataka','2018-01-01 02:26:29','2018-01-03 13:26:26'),(28,9,'Suite 049 28831 Gandhi Plains Andra Pradesh','2019-06-14 07:21:59','2019-06-15 04:26:29'),(28,10,'Apt. 636 55090 Dwivedi Throughway Chhattisgarh','2020-03-23 20:19:17','2020-03-24 10:33:51'),(28,11,'Apt. 584 56358 Subhashini Stream Manipur','2018-12-06 15:29:11','2018-12-09 09:22:17'),(28,12,'Apt. 584 56358 Subhashini Stream Manipur','2021-01-04 18:45:01','2021-01-05 22:06:27'),(28,13,'Apt. 425 5995 Priyala Mall Punjab','2018-01-01 00:00:02','2018-01-02 20:37:13'),(28,14,'Suite 557 293 Anish Fall Madya Pradesh','2018-02-16 14:10:01','2018-02-18 15:02:30'),(29,4,'Suite 513 041 Sinha Mission Himachal Pradesh','2018-01-01 00:01:11','2018-01-01 01:49:14'),(29,5,'Apt. 868 574 Susheel Forge Meghalaya','2019-08-05 18:55:41','2019-08-06 13:17:51'),(29,6,'Suite 843 44392 Khatri Street Odisha','2020-08-15 20:55:58','2020-08-18 06:06:31'),(29,7,'Suite 066 22270 Tapan Falls Goa','2018-01-01 00:02:30','2018-01-02 06:04:57'),(29,8,'Suite 378 8144 Naval Ferry Delhi','2020-02-11 20:47:18','2020-02-12 20:43:02'),(29,9,'Apt. 455 827 Khatri Dam Meghalaya','2018-01-01 01:14:06','2018-01-03 05:15:09'),(29,10,'Apt. 455 827 Khatri Dam Meghalaya','2020-12-21 22:56:22','2020-12-23 13:40:01'),(29,11,'Apt. 454 554 Shukla Mount Delhi','2018-08-13 07:55:14','2018-08-15 15:13:11'),(29,12,'Suite 066 22270 Tapan Falls Goa','2020-10-26 11:25:54','2020-10-28 22:29:18'),(29,13,'Apt. 403 706 Nair Island Madya Pradesh','2018-02-21 06:54:11','2018-02-22 09:06:00'),(29,14,'Suite 303 03461 Subodh Brook Uttar Pradesh','2018-01-01 01:36:59','2018-01-01 04:39:40'),(29,15,'Apt. 425 5995 Priyala Mall Punjab','2019-12-17 20:18:31','2019-12-18 20:46:22');
/*!40000 ALTER TABLE `Journey` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nurse`
--

DROP TABLE IF EXISTS `Nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Nurse` (
  `ID` int(11) NOT NULL,
  `qualification` varchar(30) NOT NULL,
  `license` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `FK_Employee_Nurse` FOREIGN KEY (`ID`) REFERENCES `Employee` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nurse`
--

LOCK TABLES `Nurse` WRITE;
/*!40000 ALTER TABLE `Nurse` DISABLE KEYS */;
INSERT INTO `Nurse` VALUES (16,'Advanced Diploma in Ophthalmic','VZ55085593'),(17,'Advanced Diploma in Ophthalmic','RI70996649'),(18,'Diploma in Neuro Nursing','CC29717864'),(19,'Advanced Diploma in Ophthalmic','JV30308957'),(20,'Diploma in Neuro Nursing','PV58267114'),(21,'Advanced Diploma in Ophthalmic','FG90265853'),(22,'Advanced Diploma in Ophthalmic','BZ71931039'),(23,'Diploma in Neuro Nursing','AX01516568'),(24,'Advanced Diploma in Ophthalmic','AR77354200'),(25,'Diploma in Emergency and Traum','RA60814409');
/*!40000 ALTER TABLE `Nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patient` (
  `ID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` longtext NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `medicalHistory` varchar(300) DEFAULT NULL,
  `marital` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `SexCheck` CHECK (`sex` in ('Male','Female','Other')),
  CONSTRAINT `PhoneCheck` CHECK (`phone` regexp '^[+]91 [6-9][[:digit:]]{9}$')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patient`
--

LOCK TABLES `Patient` WRITE;
/*!40000 ALTER TABLE `Patient` DISABLE KEYS */;
INSERT INTO `Patient` VALUES (1,'Charmaine Stock','aReDlhzEsQhHqRuDdQEq4g==','+91 9014729523','ArnoldG.Ambrose455@e','Suite 183 240 Khanna','Male','Est ut accusantium. Blanditiis minima voluptatibus? At ex omnis! Laborum ut aperiam.\r\nSit aut velit. Autem nostrum dolor! Omnis dolor architecto; dicta provident consequatur.\r\nCulpa sint ipsam. Unde est et;',1),(2,'Matthew Hoffman','U9HMRHdAq0EQxabv3BvP8Q==','+91 6989704164','Donohue@example.com','Suite 066 22270 Tapa','Male','Necessitatibus laboriosam vel. In quidem molestiae. Quae odio minus. Sed est quisquam. Aut voluptatem quaerat. Ut quae fugit! Nihil asperiores facilis; necessitatibus dolore obcaecati. Dolorem provident non. Commodi et debitis!\r\n',1),(3,'Jacinta Yanez','pjuqszJPYxEfM0nFh6GLYw==','+91 7688048180','ijxgor627@nowhere.co','Suite 635 346 Verma ','Male','Quam neque eaque minus. Repellat ut quibusdam nihil eligendi voluptatem et iste laboriosam.\r\nNon omnis excepturi et in tenetur; iusto ut nisi? Culpa possimus exercitationem. Adipisci dicta eveniet! Dolor sed nihil.',0),(4,'Drew Perry','BzsFFjLsbnYYdy8B3xpAAw==','+91 8689947710','Simpson68@example.co','Apt. 636 55090 Dwive','Male','Porro error iste. Voluptatem sed hic. Aperiam sit numquam! Maxime explicabo dignissimos. Voluptatem ut quis...\r\nMagnam voluptatem sint; ut rerum sed. Iste aliquam voluptas; architecto quos ex; aperiam qui at.',1),(5,'Kyoko Adams','HHXt6AEfw2ioZulrgB/q1w==','+91 7504894545','Shepard247@example.c','Suite 757 6414 Shukl','Male',NULL,NULL),(6,'Renea Russo','tNu6iFoEpFCASKe3O+mMkg==','+91 8451959534','Baum@nowhere.com','Apt. 262 54352 Sher ','Male','Eum voluptatem fuga. Dolores iste ut! Doloremque ratione est. Fugit nihil modi.\r\nEnim similique voluptatem. Sed autem esse; laudantium accusamus tenetur.\r\nAd qui commodi. Blanditiis quasi numquam. Vel vitae unde!',0),(7,'Isidra Kirchner','cV4p2szKkFNy9Lj+B6jgkg==','+91 7140079209','StefanySoto784@nowhe','Suite 557 293 Anish ','Male',NULL,NULL),(8,'Donita Huff','3ipBPaLbFoJ305WO6WZCrg==','+91 7067111749','TommyeBussey@nowhere','Suite 792 4237 Siddh','Male','Ab cumque corporis aut est. Impedit maxime et voluptatem omnis. Et ut laborum! Voluptatem ullam nam quas, quia et soluta quia cumque dolorum. Et consectetur in. Maxime ut ea. Qui dolorem corporis. Est quia repellendus!',1),(9,'Rosendo Lunsford','GkmaHmB5G3NChwzaLmuAlg==','+91 6655643583','ddaub3@example.com','Suite 049 28831 Gand','Male',NULL,1),(10,'Cesar Edge','ZfNAimUI/XcOgqbyBmCoGw==','+91 9103203005','LenNaquin948@example','Apt. 403 706 Nair Is','Male','Unde reprehenderit molestiae. Labore dolor suscipit. Non fugiat aliquam. Fuga ad quo.\r\nError dolorum hic. Nesciunt voluptatibus ut! Voluptatem error aut.\r\nAliquid voluptatem sequi. Ea magni nisi. Voluptatum vel ut;',1),(11,'Paul Medeiros','jyY6cM0ZzfYMZngNyAWDLw==','+91 8503569180','LeroyWLoomis@nowhere','Apt. 808 013 Tandon ','Male','Reprehenderit quia esse consequatur nostrum. Sunt qui odio voluptatem dignissimos necessitatibus? Sed iusto sed ipsa voluptatem reprehenderit cupiditate numquam aut! Iste consequatur quia. Quasi ullam sed. Corrupti magnam quod. Et.',1),(12,'Theodora Munn','y78E/VFF4DaIOzPBA9C7MQ==','+91 6802155404','Hartley@nowhere.com','Apt. 287 8655 Tagore','Male',NULL,0),(13,'Keenan Gatewood','suT2RLpuwV3w1ox4vcY7uQ==','+91 7575251871','Abernathy@nowhere.co','Apt. 401 26463 Trive','Male','Totam rerum est perspiciatis dolore non veniam aliquid. Ducimus odio in? Non omnis ratione.\r\nUllam et veniam. Asperiores molestiae modi! Nisi fuga voluptatem. Veritatis totam temporibus. Quia non debitis. Omnis in ipsam.',1),(14,'Arlyne Wheeler','BznQV23Gn78rctoGIAuLRg==','+91 6620693760','Delma.Oconnell@examp','Apt. 398 962 Malti P','Male','Quidem et consequatur. Voluptatum aspernatur sunt. Blanditiis repellat omnis! Rem voluptas voluptatem.\r\nVeritatis fugit aliquam. Alias ex laboriosam. Dolores natus eos! Dolore est vitae? Dolorum quia quisquam. Quia ut quasi.',0),(15,'Alysa Paulson','XZobw+Lzq7E3ijk110l18w==','+91 9782595215','Kelley@example.com','Apt. 250 6184 Chidaa','Male','Aliquam eos libero sit et. Consectetur assumenda est! Asperiores et labore. Inventore ex perspiciatis. Iste laboriosam eveniet. Quia veritatis laborum.\r\nVel qui repellendus. Quia ipsam ea? Aut facilis sit. Reprehenderit omnis perspiciatis.',1),(16,'Alton Calloway','1haczmQGSSy7IMq1rxSziA==','+91 8573428598','CarlCronin@example.c','Suite 635 346 Verma ','Male','Dolorem animi vel. Vel consequuntur enim? Consectetur eos qui. Nesciunt dolore tenetur? Quae voluptatem aut. Alias porro aspernatur. Autem fugiat accusamus. Unde dolorum quis. Iste vero quod.\r\nIusto reprehenderit natus.',0),(17,'Arnoldo Handy','dQqGt6W9cPm5YG3751wekQ==','+91 6521362978','Henry.ZAltman@exampl','Apt. 403 706 Nair Is','Male','Inventore dolorum reprehenderit. Quasi enim distinctio. Aut sit illo! Est ut reprehenderit? Quos quo omnis! Quia praesentium in...\r\nOmnis assumenda quis; dolor doloremque ipsum? Explicabo vero ea; error et saepe.',1),(18,'Charlie Sallee','xMcvq8V55wmDGP8nBd/v4g==','+91 8281019569','TristanCisneros44@ex','Apt. 635 96897 Pilla','Male',NULL,NULL),(19,'Margit Sales','p7Pe6ksXb65ETLiFSu99DQ==','+91 8494333037','Hyman.Creamer@nowher','Suite 378 8144 Naval','Male','Odit voluptatem error fuga voluptate qui quisquam ut assumenda. Culpa cupiditate quidem repellendus eos.\r\nMinus officia quia nobis esse. Ipsam voluptatem delectus rerum harum hic omnis commodi enim. Praesentium magnam et...',1),(20,'Louvenia Evers','qwVqBOJWnzhN2VbAkpgdCg==','+91 7153222267','AlfredDuarte9@exampl','Apt. 455 827 Khatri ','Male','Voluptatibus sit a. Et expedita deserunt? Adipisci sed voluptatem. Excepturi aspernatur soluta! Voluptas soluta fugiat? Molestiae iste nobis! Tempora aliquam dolores...\r\nVoluptatem fuga excepturi. Sit quos consequatur. Perspiciatis aut;\r\n',0),(21,'Neda Mcqueen','VDxlKAtmxpJXrqAcFUV1Xg==','+91 6319439982','gxyp844@nowhere.com','Suite 513 041 Sinha ','Male','Natus ullam quasi fuga ducimus.\r\nPerspiciatis sunt, rerum perferendis molestiae eum et sapiente porro saepe.\r\nQuaerat ut sed est accusantium culpa delectus est eveniet odio.',1),(22,'Jospeh Story','IwQFxT/Z/xHBIf8qarZNRw==','+91 9991337708','Ackerman@example.com','Apt. 455 827 Khatri ','Male','Vitae dolor assumenda eveniet id sit cupiditate excepturi. Aut qui quos ut explicabo sed nihil sit.\r\nExplicabo minima accusantium. Non porro dolor. Impedit eligendi quae; non quo perspiciatis. Cumque asperiores sequi.',1),(23,'Winfred Ornelas','oTF3NdVg3M2onUm0zYMFHA==','+91 7934224190','Benitez@example.com','Apt. 635 96897 Pilla','Male','Ratione inventore non sed. Cupiditate rerum ipsam. Eos cumque et. Velit debitis officiis. Et numquam pariatur. Soluta in totam.\r\nMollitia ea consequatur. Non et quasi. Fuga enim voluptatum. Illum illo voluptatem.',1),(24,'Daniel Gates','s68bPzRMRriodngXqayFuQ==','+91 9092633624','AriannaOjeda8@nowher','Apt. 455 827 Khatri ','Male','Dolores culpa eligendi; illo iste nam? Voluptatem quod ab. Et beatae qui.\r\nSequi et aliquam. Natus aut hic. Autem facilis quisquam. Quia iste et! Suscipit aspernatur error. Dolores ad omnis?\r\n',1),(25,'Abraham Connolly','9ebN3M0OXwMXLfzn6LXNPg==','+91 9010375103','wqax5623@example.com','Suite 557 293 Anish ','Male','Ea amet aliquam qui et suscipit nulla et aut est. Dolor magnam deleniti; veritatis similique provident.\r\nBeatae nobis quia. Culpa nihil perspiciatis! Magnam iste assumenda. Unde deserunt mollitia. Debitis ut hic.\r\nEum dolorem dolore.',1),(26,'Vivien Fisk','tjlL+u8GsSiaGK3RmTZhtw==','+91 7083027432','RolandGerman@example','Suite 843 44392 Khat','Male','Voluptatem blanditiis aliquam quo. Quod labore sit. Sequi vitae aut. Non quis molestiae perferendis voluptatum. Sed repudiandae consectetur dolores nobis et. Libero blanditiis cumque. Aut ipsum quidem!\r\nMollitia fugit doloremque.',1),(27,'Adelaida Isbell','3UNS2qMEB2W2D8vM5T0gtQ==','+91 7060993404','Rojas@example.com','Apt. 448 0779 Patel ','Male','Aliquam repellat repellendus. Omnis voluptatem rem! Iusto tempora ut. Quisquam eius saepe. Ut facere sapiente. Beatae consequuntur nesciunt.\r\nDoloribus qui non. Consequatur corporis id. Sunt a quia; rem labore ut.',1),(28,'Alden Fincher','cSpSvF5/jcPLXeFX27CBUQ==','+91 8034378388','yotoftpj4@example.co','Apt. 908 56804 Vasud','Male','Voluptatibus modi adipisci tempore iste. Sunt sint deserunt modi error! Ut perspiciatis sed nesciunt dolorum non consequatur. Deserunt est officia labore cumque enim dolor omnis possimus magnam! Ratione ut quia.',1),(29,'Garry Deaton','jdXz7SnJBkECPkPlszzcug==','+91 9210850012','Allan@example.com','Suite 313 4652 Kamla','Male','Natus ea earum dolorem perspiciatis dignissimos dolor corrupti aliquid. Qui minus quia. Qui sit aut. Laborum sequi autem? Consequuntur adipisci laboriosam. Est cupiditate numquam! Quo sed voluptates? Iste earum non.',1),(30,'Janene Turney','Lm8aTKoKBx9t7UMmfjvs5w==','+91 8070579830','Abdul_Alarcon@exampl','Apt. 595 30928 Bhadr','Male','Recusandae sunt vel. Repellat omnis sit. Autem aliquid asperiores! Quas consequatur obcaecati. Dolor ut repellat. Itaque minima ratione! Ullam accusamus nesciunt.\r\nError ea autem; debitis atque est. Nemo obcaecati rem.',1),(31,'Cyndi Mcmillen','nXz8PpIXTgP6YGzo3EhrZA==','+91 9131742824','mtdcgowm.gqxl@exampl','Apt. 454 554 Shukla ','Male',NULL,0),(32,'Jorge Abney','XSYZ1d8wzcu2b9PsOgBV1w==','+91 9226430878','Halsey59@example.com','Apt. 908 56804 Vasud','Male',NULL,0),(33,'Terica Corley','Qpan7umNw2/smu4R/2+VCg==','+91 7845683724','Ferraro729@example.c','Suite 124 9837 Deeva','Male','Deleniti harum ut sunt natus. Aspernatur ipsam aut veritatis. Itaque et aperiam aut mollitia at nesciunt neque quia! Rem saepe error. Et necessitatibus hic. Illum tempora nisi! Architecto perspiciatis rerum.',1),(34,'Noel Fulton','b047GFEfkke9YuPy4RXC5w==','+91 7584834170','Boothe@example.com','Apt. 454 554 Shukla ','Male','Voluptatibus mollitia officiis. Fugiat libero quidem! Cupiditate impedit inventore. Iure nemo aut. Aut sed ut. Et iste eaque. Natus recusandae optio! Eius repellendus voluptatibus.\r\nEst cumque voluptatem. Voluptatem quis a.',0),(35,'Frederic Rasmussen','VpW95iOoLgd6G+J4BSAaaw==','+91 8380793507','Adena_Ellison257@exa','Suite 802 155 Naik I','Male','Eveniet beatae in. Enim unde deleniti? Et soluta omnis! Quaerat consequatur quaerat. Accusantium voluptas est. Omnis iure libero. Dolore voluptas totam. Fugiat culpa at.\r\nUt doloremque velit. Est unde explicabo;',1),(36,'Antoine Adams','BIzdg1fueOKsh/CkJdJ6gQ==','+91 7922308372','Tracy@example.com','Apt. 595 30928 Bhadr','Male','Omnis atque recusandae. Non aut doloremque. Debitis et labore. Et nemo consequuntur. Magnam aut consectetur; maxime quo qui. Sed sit at.\r\nEa amet nihil. Et corporis sed; fugit consequatur et.\r\n',0),(37,'Denise Coyle','OU08fIsrkPmZo+fcywI1pQ==','+91 8517214984','pxajygbj.gelk@nowher','Suite 049 28831 Gand','Male',NULL,0),(38,'Stefan Acker','6K0DHVfdViUoETIktRb38Q==','+91 6305749722','JanieceBurchett@exam','Apt. 636 55090 Dwive','Male','Nulla sit ad. Dolor consectetur ducimus. Sunt praesentium quae. Quis dignissimos autem! Eveniet culpa quia.\r\nDolorum eveniet rerum. Inventore sit natus. Fuga eius et. Sed error necessitatibus. Asperiores distinctio tempora.',0),(39,'Richard Cho','0JADGT5sdNzFPX9tx7WRHg==','+91 7410627697','Audra_Seifert@nowher','Apt. 455 827 Khatri ','Male','Excepturi dolores expedita. Reprehenderit sit suscipit. Fugit consequuntur voluptatem! Voluptatem voluptas est; voluptatem natus repellat. Explicabo eos alias.\r\nSit error rerum. In laboriosam vero. Sit vero iure.\r\nIste eos sit.',0),(40,'Gary Legg','pzTJTW4EbEZn/qV3WMW29g==','+91 9962339899','Norman@example.com','Apt. 173 673 Chandra','Male','Nam eaque ut. At quis et. Temporibus aut omnis; aspernatur adipisci doloribus. Nisi voluptas odit? Quos aperiam iure.\r\nAccusantium porro eos. Veniam officiis laboriosam? Accusantium eius molestiae. Quidem quibusdam rerum.\r\n',1),(41,'Mariko Warfield','UZZ0L975g4N8ZIvAiOlfqg==','+91 6791527981','kzjyz4440@example.co','Apt. 808 013 Tandon ','Male','Deleniti iste pariatur voluptate minus natus iure; praesentium accusamus voluptatem.\r\nExplicabo est illo. Aut eaque voluptatem. Quia dolores culpa. Adipisci accusamus numquam. Culpa voluptatem veritatis! Alias atque in. Libero unde qui.',1),(42,'Alfonzo Michel','u7WuctirvBt+kUFf78exuw==','+91 6068196835','SuzetteAckerman@nowh','Apt. 635 96897 Pilla','Male',NULL,NULL),(43,'Ginny Acker','vLT5SvZpuFdIAeT3c2ELrg==','+91 6325927274','Abbott@example.com','Apt. 448 0779 Patel ','Male','Sed nulla doloribus. Temporibus et maxime! Alias error mollitia. Dicta optio est. Ea accusantium ut. Enim unde non. Quam expedita totam.\r\nVoluptatem ex consequatur. Qui expedita inventore! Reiciendis fugit eum.',0),(44,'Alethia Capps','i4TOE3E742Px4RXUkk7FCQ==','+91 9940800153','TommieStack@example.','Apt. 649 556 Iyengar','Male','Accusantium voluptate illum. Dolor numquam voluptatem ea! In recusandae doloribus.\r\nExercitationem est odit. Error dolores dolore. Accusamus nam aut.\r\nDolorum distinctio eligendi; ipsam autem fugit. Ea labore quidem. Quia commodi quam!',0),(45,'Adolph Starr','Clad4WuJeLJhfyzigjXW4Q==','+91 9162268315','QuintinHeadley664@ex','Apt. 454 554 Shukla ','Male','Molestias repudiandae beatae. Perferendis maiores rem; minus earum animi. Dolor quam quisquam; qui voluptate cupiditate. Sunt quae eveniet. Voluptatem porro sed! Magni sed vel. Ratione iusto rerum!\r\nQuaerat optio dolore.\r\n',1),(46,'April Calabrese','kODoDrEIh1KuqAJ0kWzCLg==','+91 9391638937','Aletha_Archer@exampl','Suite 348 75387 Atre','Male','Atque aut natus pariatur reprehenderit sit molestias voluptas. Est eveniet tempore. Hic et aut; doloremque atque vel. Soluta eligendi beatae. Tempora itaque modi. Provident sit eveniet! Fugit sunt necessitatibus. Eaque vero veniam! Iusto.',0),(47,'Reagan Cousins','LsRMF1dd7nZMHPzjEBDtOA==','+91 6644953229','WillettR814@example.','Apt. 262 54352 Sher ','Male',NULL,NULL),(48,'Diana Archibald','GhVtCRyJEqbmwlyptcq+wQ==','+91 7179116696','LozanoC24@nowhere.co','Apt. 908 56804 Vasud','Male','Aliquid voluptates assumenda; dolorem dolores quae. Blanditiis inventore in.\r\nAut sit nihil. Veniam eligendi totam; modi distinctio omnis; numquam doloribus eum. Non accusantium molestiae. Voluptatem omnis veritatis! Eius deleniti magni.\r\n',0),(49,'Lakisha Betancourt','0pK1OOmY7W3+Y03K6sd/Yg==','+91 9634935111','Randell_TBrandt5@exa','Apt. 893 2712 Amares','Male','Debitis atque et rerum omnis et vel aliquam quisquam deserunt; qui eos debitis? Eveniet nisi quia. Sed odit aut? Est velit ut.\r\nEum obcaecati aut. Distinctio sunt dolor. Aliquid quos ut...',1),(50,'Charlena Rasmussen','fxWyPnOsHJ2l+E7cov1lrQ==','+91 6556464329','HershelBrent952@nowh','Apt. 893 2712 Amares','Male',NULL,NULL);
/*!40000 ALTER TABLE `Patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pharmacy`
--

DROP TABLE IF EXISTS `Pharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pharmacy` (
  `ID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `category` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pharmacy`
--

LOCK TABLES `Pharmacy` WRITE;
/*!40000 ALTER TABLE `Pharmacy` DISABLE KEYS */;
INSERT INTO `Pharmacy` VALUES (1,'Losasonfast','Tranquilizers'),(2,'Epihydrovase','Oral contraceptives'),(3,'Acatravant','Hormone replacements'),(4,'Rythmoperifen','Statins'),(5,'Losataino','Tranquilizers'),(6,'Zapracarpamlol','Statins'),(7,'Hepaoxevant','Statins'),(8,'Irilonzol','Antibiotics'),(9,'Exosilne','Antipyretics'),(10,'Indathromyne','Oral contraceptives'),(11,'Intermatec','Antibiotics'),(12,'Moxisoprocose','Antiseptics'),(13,'Ecothromyvir','Antipyretics'),(14,'Iprobutamzon','Stimulants'),(15,'Konizofen','Mood stabilizers'),(16,'Aprocarpamrex','Tranquilizers'),(17,'Calcipuriphane','Antibiotics'),(18,'Herpehydrodene','Mood stabilizers'),(19,'Neozonor','Mood stabilizers'),(20,'Lisipadorm','Mood stabilizers'),(21,'Levotate','Antipyretics'),(22,'Zytotazyl','Stimulants'),(23,'Alloperadene','Analgesics'),(24,'Prothromynon','Stimulants'),(25,'Osadrovex','Mood stabilizers'),(26,'Redusildar','Antibiotics'),(27,'Dermagophane','Antimalarial drugs'),(28,'Miniperimuc','Antibiotics'),(29,'Diperinide','Antipyretics'),(30,'Acamalam','Antiseptics'),(31,'Abesidex','Stimulants'),(32,'Acisopronor','Hormone replacements'),(33,'Dioxedine','Statins'),(34,'Acesonnal','Tranquilizers'),(35,'Adeltradine','Hormone replacements'),(36,'Enachloridehex','Statins'),(37,'Halofavase','Statins'),(38,'Velonadene','Antimalarial drugs'),(39,'Micopazol','Antibiotics'),(40,'Noratanque','Stimulants'),(41,'Micobutamvant','Stimulants'),(42,'Losatrane','Mood stabilizers'),(43,'Eryhydrobid','Statins'),(44,'Metrosiltex','Analgesics'),(45,'Baynisol','Antibiotics'),(46,'Metronibid','Antiseptics'),(47,'Metonaphane','Antimalarial drugs'),(48,'Polynazol','Mood stabilizers'),(49,'Dermasoprorex','Mood stabilizers'),(50,'Simemaban','Hormone replacements');
/*!40000 ALTER TABLE `Pharmacy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Prescription`
--

DROP TABLE IF EXISTS `Prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prescription` (
  `ID` int(11) NOT NULL,
  `timeStamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Prescription`
--

LOCK TABLES `Prescription` WRITE;
/*!40000 ALTER TABLE `Prescription` DISABLE KEYS */;
INSERT INTO `Prescription` VALUES (1,'2019-03-12 01:47:34'),(2,'2018-01-01 00:01:29'),(3,'2019-03-20 06:32:50'),(4,'2018-01-01 00:00:54'),(5,'2019-10-05 01:56:31'),(6,'2020-08-31 09:25:59'),(7,'2019-08-28 04:00:45'),(8,'2018-09-21 00:36:51'),(9,'2018-09-30 20:03:35'),(10,'2018-12-29 03:57:28'),(11,'2020-08-08 10:19:32'),(12,'2019-12-30 09:39:46'),(13,'2018-02-04 19:30:12'),(14,'2020-04-29 08:20:33'),(15,'2018-12-14 03:11:42'),(16,'2020-08-10 15:26:47'),(17,'2018-12-02 21:10:56'),(18,'2019-11-30 18:49:14'),(19,'2018-12-03 22:01:01'),(20,'2019-01-07 18:13:19'),(21,'2019-09-25 11:43:24'),(22,'2018-04-10 10:02:13'),(23,'2018-03-27 07:19:38'),(24,'2018-09-16 08:54:29'),(25,'2020-02-03 15:35:54'),(26,'2021-03-04 11:50:28'),(27,'2018-01-01 00:00:04'),(28,'2018-10-14 10:53:42'),(29,'2018-01-01 00:21:08'),(30,'2018-09-09 22:19:46'),(31,'2020-05-26 02:13:18'),(32,'2019-03-22 23:45:52'),(33,'2018-01-01 00:00:07'),(34,'2020-09-15 18:34:04'),(35,'2019-10-06 05:07:23'),(36,'2020-09-01 13:14:32'),(37,'2018-01-01 01:46:37'),(38,'2018-01-01 00:08:53'),(39,'2020-10-21 13:44:59'),(40,'2018-01-01 00:00:09'),(41,'2019-02-20 18:12:47'),(42,'2020-04-12 04:00:02'),(43,'2018-01-01 00:51:57'),(44,'2020-07-05 08:47:47'),(45,'2021-02-20 12:55:03'),(46,'2020-02-11 21:57:45'),(47,'2018-08-15 04:37:23'),(48,'2020-05-24 14:40:23'),(49,'2019-06-30 21:10:00'),(50,'2019-09-17 23:46:53');
/*!40000 ALTER TABLE `Prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplies`
--

DROP TABLE IF EXISTS `Supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Supplies` (
  `drugID` int(11) NOT NULL,
  `vendorID` int(11) NOT NULL,
  `price` float NOT NULL,
  `orderTime` datetime NOT NULL,
  `supplyTime` datetime DEFAULT NULL,
  PRIMARY KEY (`drugID`,`vendorID`),
  KEY `FK_Vendor_Supplies` (`vendorID`),
  CONSTRAINT `FK_Pharmacy_Supplies` FOREIGN KEY (`drugID`) REFERENCES `Pharmacy` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Vendor_Supplies` FOREIGN KEY (`vendorID`) REFERENCES `Vendor` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `DateTimeCheck` CHECK (`supplyTime` > `orderTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplies`
--

LOCK TABLES `Supplies` WRITE;
/*!40000 ALTER TABLE `Supplies` DISABLE KEYS */;
INSERT INTO `Supplies` VALUES (1,1,7609080,'2018-01-01 00:01:12','2018-01-02 19:44:06'),(2,2,8500500,'2020-06-01 01:30:41','2020-06-05 21:43:31'),(3,3,5,'2018-01-01 00:01:01','2018-01-03 05:12:05'),(4,4,5,'2018-01-01 00:00:59','2018-01-04 02:43:48'),(5,5,8965770,'2019-05-14 01:49:01','2019-05-18 21:18:08'),(6,6,6666770,'2018-06-22 01:51:32','2018-06-28 12:48:52'),(7,7,7996570,'2018-01-01 00:01:04','2018-01-07 14:08:35'),(8,8,4302900,'2019-06-18 08:24:04','2019-06-24 07:22:00'),(9,9,108,'2018-08-04 05:35:41','2018-08-08 21:01:17'),(10,10,9763180,'2021-02-27 03:23:05','2021-03-02 04:05:05'),(11,11,1829450,'2019-01-21 05:17:55','2019-01-26 08:18:12'),(12,12,7517900,'2020-09-14 21:38:09','2020-09-19 13:56:35'),(13,13,8,'2019-01-22 16:43:00','2019-01-28 22:09:52'),(14,14,4392190,'2018-01-01 00:00:41','2018-01-03 09:23:28'),(15,15,8843970,'2018-01-01 00:26:02','2018-01-04 10:56:20'),(16,16,8957840,'2019-01-08 13:48:52','2019-01-13 12:37:03'),(17,17,0,'2020-11-04 14:23:06','2020-11-06 15:52:41'),(18,18,5917560,'2019-07-22 20:13:28','2019-07-24 16:56:40'),(19,19,2516,'2018-02-15 05:33:12','2018-02-19 11:34:51'),(20,20,3746040,'2018-01-01 00:00:08','2018-01-02 16:01:37'),(21,21,2110260,'2019-01-18 08:52:33','2019-01-24 18:36:18'),(22,22,611397,'2019-02-08 03:58:55','2019-02-11 06:27:21'),(23,23,6482730,'2018-01-13 13:33:34','2018-01-16 11:19:28'),(24,24,5986210,'2021-03-10 16:58:15','2021-03-15 18:29:49'),(25,25,1504810,'2018-05-30 00:59:11','2018-06-02 16:36:20'),(26,26,8937580,'2020-01-10 21:35:59','2020-01-14 02:00:50'),(27,27,9898850,'2019-09-09 00:08:10','2019-09-11 11:26:34'),(28,28,1628120,'2020-12-15 06:39:14','2020-12-20 07:01:49'),(29,29,1677640,'2019-10-03 16:25:56','2019-10-04 18:44:18'),(30,30,7761960,'2021-01-20 19:08:06','2021-01-24 14:55:39'),(31,31,1340780,'2018-01-01 00:00:03','2018-01-07 09:57:13'),(32,32,1,'2018-01-01 00:00:08','2018-01-04 21:37:20'),(33,33,2936900,'2018-01-01 00:00:03','2018-01-02 23:37:16'),(34,34,9,'2021-01-01 22:30:38','2021-01-05 02:11:19'),(35,35,5090820,'2020-02-22 01:04:26','2020-02-27 13:33:42'),(36,36,4830320,'2018-12-15 06:22:28','2018-12-16 23:19:40'),(37,37,6214930,'2018-01-01 00:00:01','2018-01-06 05:32:04'),(38,38,192,'2021-01-17 08:17:10','2021-01-21 13:37:54'),(39,39,32078,'2018-08-03 12:55:23','2018-08-09 13:20:29'),(40,40,7585620,'2019-08-23 03:25:57','2019-08-28 04:52:02'),(41,41,1096250,'2018-01-01 00:01:36','2018-01-03 14:58:37'),(42,42,6763,'2018-07-20 21:04:19','2018-07-23 09:11:01'),(43,43,8528440,'2021-02-20 00:10:54','2021-02-22 01:56:49'),(44,44,2979790,'2018-05-12 16:19:36','2018-05-14 13:15:25'),(45,45,196,'2019-08-15 13:14:27','2019-08-19 04:31:50'),(46,46,5741680,'2019-10-22 04:21:14','2019-10-28 17:21:15'),(47,47,90,'2019-02-22 19:50:50','2019-02-27 00:20:34'),(48,48,7,'2018-08-09 02:48:25','2018-08-14 04:59:22'),(49,49,7677770,'2019-02-27 04:17:28','2019-03-02 11:16:36'),(50,50,5229870,'2021-01-15 03:52:44','2021-01-21 16:44:41');
/*!40000 ALTER TABLE `Supplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vendor`
--

DROP TABLE IF EXISTS `Vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vendor` (
  `ID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `PhoneCheck` CHECK (`phone` regexp '^[+]91 [6-9][[:digit:]]{9}$')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vendor`
--

LOCK TABLES `Vendor` WRITE;
/*!40000 ALTER TABLE `Vendor` DISABLE KEYS */;
INSERT INTO `Vendor` VALUES (1,'South X-Mobile Group','+91 7663103413','4-7 Effra Road, Newbiggin, Inverness-shire BR8 3JV','Rayford917@example.c'),(2,'First High-Technologies Group','+91 9721513259','2 Sing Way, Ormskirk, Oxfordshire WA55 2PP','BeverlyAshton4@nowhe'),(3,'Professional High-Technologies Corporation','+91 6009175946','3-8 Aynhoe Road, Malpas, Angus KY2 5FN','vmjm2541@example.com'),(4,'American Space Explore Corp.','+91 6540293773','35-19 Glenhill Close, Abbots Langley, Sussex BD6 8VU','Russell_Cunningham@e'),(5,'American Space Research Group','+91 7685086027','45-48 Antill Road, Solihull, Somerset MK8 5PT','FosterBaylor@nowhere'),(6,'Domestic Business Group','+91 7784839238','12-18 Stamford Street, Brighton, Cheshire TQ57 9WQ','AdelleCheek@example.'),(7,'National Products Inc.','+91 9782825747','42-26 Abyssinia Close, Gloucester, West Midlands SY1 5FX','Cardenas@example.com'),(8,'Advanced Broadcasting Group','+91 8390184999','34-56 Macclesfield Street, Rotherham, Renfrewshire S9 9WS','NevadaMcnamara@examp'),(9,'Global Space Explore Inc.','+91 6206460689','37 A-E Putney Hill, Cowes, Dunbartonshire WA1 3ZA','KyraMontes8@nowhere.'),(10,'South Space Explore Group','+91 8200371242','14-27 Darwin Road, Aberlour, Sussex WN93 8AN','VincenzoAndersen@exa'),(11,'Flexible Y-Mobile Corporation','+91 9610583536','5-9 Bedford Way, Thornton-Cleveleys, Tyrone HG90 5AH','Easterling@example.c'),(12,'Domestic Space Explore Inc.','+91 6288897903','2 Henrietta Street, Bournemouth, Merseyside PO33 9SQ','Brock9@example.com'),(13,'First Space Explore Corporation','+91 7248192938','8 Sutherland Grove, Coventry, Moray CV9 5UA','gwrd24@example.com'),(14,'First Delivery Inc.','+91 6729170564','22-28 Hackney Road, Barrow-in-Furness, Kinross-shire PR9 7PV','Boynton@example.com'),(15,'United Space Explore Inc.','+91 8584431906','9 Abbey Road, Crianlarich, Renfrewshire WR9 1YR','Abel@nowhere.com'),(16,'Australian Media Group','+91 6088047586','2-7 Great Queen Street, Ongar, Rutland RM47 5FX','Champion@example.com'),(17,'Future Instruments Corporation','+91 7131797692','5-9 Leicester Street, West Bromwich, Norfolk PA1 3XZ','eqscddmq.kpgj@nowher'),(18,'Flexible Space Explore Group','+91 6837142700','5 Devons Road, Newmarket, West Midlands BB32 4WH','lhvgt946@example.com'),(19,'International High-Technologies Corp.','+91 9130008759','3 Woodcote Road, Willenhall, Cornwall MK9 8FZ','JericaHawk@example.c'),(20,'National High-Technologies Inc.','+91 7579952333','1-9 Abbey Street, Oxford, Armagh CA9 8PP','Jacquiline.Loftis571'),(21,'Creative Engineering Corporation','+91 8105230236','14-28 Preston Road, Helensburgh, Peeblesshire CO61 7FV','Donny_Bourque241@exa'),(22,'North Industry Co.','+91 7657009858','3-9 Apollo Court, Staines, County Durham BL48 9QB','David.Burrow@example'),(23,'United High-Technologies Group','+91 8502669881','1 Montague Avenue, Dumfries, Inverness-shire TN9 6DV','Cornell5@example.com'),(24,'City Renewable Power Inc.','+91 9651206673','4-6 North End Road, Bristol, Staffordshire SP84 1XA','CassaundraAcevedo@no'),(25,'Flexible High-Technologies Inc.','+91 7337238474','8A Heath Road, Wallingford, Moray PH76 4FD','Carrier@example.com'),(26,'Domestic Industry Inc.','+91 9562883367','419 Fountain Square, Castle Douglas, Aberdeenshire OL74 6PQ','LorrineIBarfield@exa'),(27,'City Space Research Inc.','+91 6295940139','55-37 Gillett Square, Tarporley, Middlesex BB65 8AX','Jacques.Griffiths43@'),(28,'Professional High-Technologies Corporation','+91 8438798175','4 Glengall Road, Chippenham, Shropshire DY7 3JE','Claude_Cagle@example'),(29,'WorldWide Goods Corporation','+91 7709829583','44-26 Britannia Walk, Blackpool, Ayrshire CH6 4WN','ShaunOsullivan@examp'),(30,'Advanced Space Research Corp.','+91 9019481118','211E Culverden Road, Aberfeldy, Worcestershire MK6 9BV','Luvenia_Andrus@examp'),(31,'Future 3G Wireless Corp.','+91 7560085886','15 A-D Windham Road, Walsall, Gwynedd SE6 6QX','ArthurCarvalho15@exa'),(32,'Beyond Partners Inc.','+91 8976216081','9 A-E Denman Street, Swindon, Cheshire TD55 3RJ','ForresterU74@example'),(33,'Federal Entertainment Corporation','+91 6695940864','5-7 Forty Hill, Northampton, Bedfordshire IP54 4QF','Rhoades249@example.c'),(34,'Domestic Space Research Inc.','+91 9463335362','55-16 Abbeville Road, Sheffield, Berkshire CT41 2FN','JaysonBostic@nowhere'),(35,'Beyond High-Technologies Co.','+91 9991055830','90 Brettenham Avenue, Leicester, Westmorland WR37 8RB','AbrahamDuvall@exampl'),(36,'WorldWide Research Inc.','+91 8896423403','41-38 Kingston Road, Manchester, Berkshire BA8 8DB','Vera@example.com'),(37,'Pacific High-Technologies Inc.','+91 7901276626','7A Lewsiham Way, Welshpool, Roxburghshire BL8 2AZ','Huntington@example.c'),(38,'WorldWide B-Mobile Corporation','+91 6049885347','4-8 Fitzroy Street, Cambridge, Dorset MK79 1ZB','Zella_Douglas@exampl'),(39,'Home Space Research Inc.','+91 6648323139','8 A-C Hainault Road, Preston, Middlesex SO6 2JD','wkgd8082@example.com'),(40,'Pacific 2G Wireless Co.','+91 7465287652','6 Elford Close, Plymouth, Argyll SO2 1FH','Trinidad594@example.'),(41,'First High-Technologies Co.','+91 8358347191','4 A-C Holland Park Avenue, Rotherhithe, Peeblesshire S49 2UU','Abel@example.com'),(42,'Creative Materials Inc.','+91 7576033612','53-39 Burnley Road, Aberdovey, Ross OX12 7AF','Fredericks831@exampl'),(43,'Federal Partners Corporation','+91 9276340649','4-8 Abbotsbury Road, Dudley, Cambridgeshire BB4 9BX','AnnikaAbrams@example'),(44,'Canadian Space Research Group','+91 9898791142','4 Fountain Square, Bristol, Hertfordshire IV20 6NP','Leon_Nettles@nowhere'),(45,'North Investment Corp.','+91 9152531707','4-7 Ada Street, Broadstone, Norfolk CV35 7ER','MurilloA622@example.'),(46,'Advanced I-Mobile Inc.','+91 8723253628','12-37 Torrens Street, Cambridge, Midlothian BL61 8DG','Day@nowhere.com'),(47,'Global K-Mobile Group','+91 7557303783','2 Jews Row, Bolton, Shetland LL1 3HF','Bloom@example.com'),(48,'General Instruments Co.','+91 6378297126','88 Great Dover Street, Muswell Hill, Berwickshire IV22 4TZ','MadgeOutlaw@example.'),(49,'Australian Space Research Group','+91 8787920881','3-7 Beachborough Road, Leicester, Clwyd PH7 7FA','NicholasAdams@exampl'),(50,'Beyond Broadcasting Inc.','+91 9402301974','9 A-E Bleak Street, Liverpool, Cornwall PL63 9GJ','Joe_Abernathy@exampl');
/*!40000 ALTER TABLE `Vendor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-23  8:30:53
