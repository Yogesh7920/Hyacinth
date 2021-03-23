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
  CONSTRAINT `FK_Prescription_Appointment` FOREIGN KEY (`prescriptionId`) REFERENCES `prescription` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `DateTimeCheck` CHECK (`endTime` > `startTime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `email` varchar(255) NOT NULL,
  `address` varchar(20) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `salary` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `SexCheck` CHECK (`sex` in ('Male','Female','Other')),
  CONSTRAINT `PhoneCheck` CHECK (`phone` regexp '^[+]91 [6-9][[:digit:]]{9}$')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `FK_Driver_Journey` FOREIGN KEY (`driverID`) REFERENCES `driver` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `DateTimeCheck` CHECK (`endTime` > `startTime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  PRIMARY KEY (`ID`),
  CONSTRAINT `SexCheck` CHECK (`sex` in ('Male','Female','Other')),
  CONSTRAINT `PhoneCheck` CHECK (`phone` regexp '^[+]91 [6-9][[:digit:]]{9}$')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `FK_Vendor_Supplies` FOREIGN KEY (`vendorID`) REFERENCES `vendor` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `DateTimeCheck` CHECK (`supplyTime` > `orderTime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendor` (
  `ID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `PhoneCheck` CHECK (`phone` regexp '^[+]91 [6-9][[:digit:]]{9}$')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-23 13:54:07
