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
  CONSTRAINT `FK_Prescription_Appointment` FOREIGN KEY (`prescriptionId`) REFERENCES `Prescription` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  `email` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `salary` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `FK_Driver_Journey` FOREIGN KEY (`driverID`) REFERENCES `Driver` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  CONSTRAINT `FK_Vendor_Supplies` FOREIGN KEY (`vendorID`) REFERENCES `Vendor` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Vendor`
--

DROP TABLE IF EXISTS `Vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vendor` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Email` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-22 10:42:11
