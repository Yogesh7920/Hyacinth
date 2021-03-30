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
  `adminID` int(11) NOT NULL,
  PRIMARY KEY (`adminID`),
  CONSTRAINT `FK_Employee_Admin` FOREIGN KEY (`adminID`) REFERENCES `Employee` (`employeeID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `AdminInfo`
--

DROP TABLE IF EXISTS `AdminInfo`;
/*!50001 DROP VIEW IF EXISTS `AdminInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `AdminInfo` (
  `adminID` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `address` tinyint NOT NULL,
  `sex` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Ambulance`
--

DROP TABLE IF EXISTS `Ambulance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ambulance` (
  `ambulanceID` int(11) NOT NULL,
  `lastMaintenance` datetime DEFAULT NULL,
  `totalDistance` float DEFAULT NULL,
  PRIMARY KEY (`ambulanceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Appointment`
--

DROP TABLE IF EXISTS `Appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Appointment` (
  `appointmentID` int(11) NOT NULL,
  `startTime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `endTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remarks` varchar(40) DEFAULT NULL,
  `invoiceId` int(11) NOT NULL,
  `prescriptionId` int(11) NOT NULL,
  `consultationId` int(11) NOT NULL,
  PRIMARY KEY (`appointmentID`),
  UNIQUE KEY `invoiceId` (`invoiceId`),
  UNIQUE KEY `prescriptionId` (`prescriptionId`),
  KEY `FK_Consultation_Appointment` (`consultationId`),
  CONSTRAINT `FK_Consultation_Appointment` FOREIGN KEY (`consultationId`) REFERENCES `Consultation` (`consultationID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Invoice_Appointment` FOREIGN KEY (`invoiceId`) REFERENCES `Invoice` (`invoiceID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Prescription_Appointment` FOREIGN KEY (`prescriptionId`) REFERENCES `Prescription` (`prescriptionID`) ON DELETE CASCADE,
  CONSTRAINT `DateTimeCheck` CHECK (`endTime` > `startTime`)
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
  CONSTRAINT `FK_Diagnostics_Assists` FOREIGN KEY (`diagnosticsID`) REFERENCES `Diagnostics` (`diagnosticsID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Nurse_Assists` FOREIGN KEY (`nurseId`) REFERENCES `Nurse` (`nurseID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Consultation`
--

DROP TABLE IF EXISTS `Consultation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Consultation` (
  `consultationID` int(11) NOT NULL,
  `problem` varchar(40) DEFAULT NULL,
  `doctorID` int(11) DEFAULT NULL,
  `patientID` int(11) DEFAULT NULL,
  PRIMARY KEY (`consultationID`),
  KEY `FK_Doctor_Consultation` (`doctorID`),
  KEY `FK_Patient_Consultation` (`patientID`),
  CONSTRAINT `FK_Doctor_Consultation` FOREIGN KEY (`doctorID`) REFERENCES `Doctor` (`doctorID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Patient_Consultation` FOREIGN KEY (`patientID`) REFERENCES `Patient` (`patientID`) ON DELETE CASCADE
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
  CONSTRAINT `FK_Diagnostics_Contains` FOREIGN KEY (`diagnosticsID`) REFERENCES `Diagnostics` (`diagnosticsID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Prescription_Contains` FOREIGN KEY (`prescriptionID`) REFERENCES `Prescription` (`prescriptionID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Diagnostics`
--

DROP TABLE IF EXISTS `Diagnostics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Diagnostics` (
  `diagnosticsID` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`diagnosticsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Doctor`
--

DROP TABLE IF EXISTS `Doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Doctor` (
  `doctorID` int(11) NOT NULL,
  `qualification` varchar(30) NOT NULL,
  `license` varchar(30) NOT NULL,
  `bio` varchar(300) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `specialization` varchar(30) NOT NULL,
  PRIMARY KEY (`doctorID`),
  CONSTRAINT `FK_Employee_Doctor` FOREIGN KEY (`doctorID`) REFERENCES `Employee` (`employeeID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `DoctorInfo`
--

DROP TABLE IF EXISTS `DoctorInfo`;
/*!50001 DROP VIEW IF EXISTS `DoctorInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `DoctorInfo` (
  `doctorID` tinyint NOT NULL,
  `doctorName` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `address` tinyint NOT NULL,
  `sex` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `DoctorPatientInfo`
--

DROP TABLE IF EXISTS `DoctorPatientInfo`;
/*!50001 DROP VIEW IF EXISTS `DoctorPatientInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `DoctorPatientInfo` (
  `pharmacyID` tinyint NOT NULL,
  `prescriptionId` tinyint NOT NULL,
  `consultationID` tinyint NOT NULL,
  `doctorID` tinyint NOT NULL,
  `doctorName` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `address` tinyint NOT NULL,
  `sex` tinyint NOT NULL,
  `problem` tinyint NOT NULL,
  `patientID` tinyint NOT NULL,
  `appointmentID` tinyint NOT NULL,
  `startTime` tinyint NOT NULL,
  `endTime` tinyint NOT NULL,
  `remarks` tinyint NOT NULL,
  `invoiceId` tinyint NOT NULL,
  `timeStamp` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `category` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Driver`
--

DROP TABLE IF EXISTS `Driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Driver` (
  `driverID` int(11) NOT NULL,
  `experience` int(5) NOT NULL,
  `licenseNo` varchar(10) NOT NULL,
  `successRate` float DEFAULT NULL,
  PRIMARY KEY (`driverID`),
  CONSTRAINT `FK_Employee_Driver` FOREIGN KEY (`driverID`) REFERENCES `Employee` (`employeeID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `DriverInfo`
--

DROP TABLE IF EXISTS `DriverInfo`;
/*!50001 DROP VIEW IF EXISTS `DriverInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `DriverInfo` (
  `driverID` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `address` tinyint NOT NULL,
  `sex` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `DriverJourneyInfo`
--

DROP TABLE IF EXISTS `DriverJourneyInfo`;
/*!50001 DROP VIEW IF EXISTS `DriverJourneyInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `DriverJourneyInfo` (
  `driverID` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `address` tinyint NOT NULL,
  `sex` tinyint NOT NULL,
  `ambulanceID` tinyint NOT NULL,
  `lastMaintenance` tinyint NOT NULL,
  `totalDistance` tinyint NOT NULL,
  `startTime` tinyint NOT NULL,
  `endTime` tinyint NOT NULL,
  `journeyAddress` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
  CONSTRAINT `FK_Pharmacy_Drugs` FOREIGN KEY (`pharmacyID`) REFERENCES `Pharmacy` (`pharmacyID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Prescription_Drugs` FOREIGN KEY (`prescriptionID`) REFERENCES `Prescription` (`prescriptionID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `employeeID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` longtext NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(20) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `salary` int(11) NOT NULL,
  PRIMARY KEY (`employeeID`),
  CONSTRAINT `SexCheck` CHECK (`sex` in ('Male','Female','Other')),
  CONSTRAINT `PhoneCheck` CHECK (`phone` regexp '^[+]91 [6-9][[:digit:]]{9}$')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Invoice`
--

DROP TABLE IF EXISTS `Invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoice` (
  `invoiceID` int(11) NOT NULL,
  `amount` float NOT NULL,
  `isPaid` tinyint(1) NOT NULL,
  PRIMARY KEY (`invoiceID`)
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
  CONSTRAINT `FK_Ambulance_Journey` FOREIGN KEY (`ambulanceId`) REFERENCES `Ambulance` (`ambulanceID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Driver_Journey` FOREIGN KEY (`driverID`) REFERENCES `Driver` (`driverID`) ON DELETE CASCADE,
  CONSTRAINT `DateTimeCheck` CHECK (`endTime` > `startTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Nurse`
--

DROP TABLE IF EXISTS `Nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Nurse` (
  `nurseID` int(11) NOT NULL,
  `qualification` varchar(30) NOT NULL,
  `license` varchar(30) NOT NULL,
  PRIMARY KEY (`nurseID`),
  CONSTRAINT `FK_Employee_Nurse` FOREIGN KEY (`nurseID`) REFERENCES `Employee` (`employeeID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `NurseDiagnosticsInfo`
--

DROP TABLE IF EXISTS `NurseDiagnosticsInfo`;
/*!50001 DROP VIEW IF EXISTS `NurseDiagnosticsInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `NurseDiagnosticsInfo` (
  `nurseID` tinyint NOT NULL,
  `qualification` tinyint NOT NULL,
  `license` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `address` tinyint NOT NULL,
  `sex` tinyint NOT NULL,
  `diagnosticsID` tinyint NOT NULL,
  `category` tinyint NOT NULL,
  `diagnostics` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `NurseInfo`
--

DROP TABLE IF EXISTS `NurseInfo`;
/*!50001 DROP VIEW IF EXISTS `NurseInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `NurseInfo` (
  `nurseID` tinyint NOT NULL,
  `qualification` tinyint NOT NULL,
  `license` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `address` tinyint NOT NULL,
  `sex` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Patient`
--

DROP TABLE IF EXISTS `Patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patient` (
  `patientID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` longtext NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `sex` varchar(20) NOT NULL,
  `medicalHistory` varchar(300) DEFAULT NULL,
  `marital` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`patientID`),
  CONSTRAINT `SexCheck` CHECK (`sex` in ('Male','Female','Other')),
  CONSTRAINT `PhoneCheck` CHECK (`phone` regexp '^[+]91 [6-9][[:digit:]]{9}$')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `PatientDoctorInfo`
--

DROP TABLE IF EXISTS `PatientDoctorInfo`;
/*!50001 DROP VIEW IF EXISTS `PatientDoctorInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `PatientDoctorInfo` (
  `pharmacyID` tinyint NOT NULL,
  `prescriptionId` tinyint NOT NULL,
  `invoiceId` tinyint NOT NULL,
  `consultationID` tinyint NOT NULL,
  `patientID` tinyint NOT NULL,
  `patientName` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `address` tinyint NOT NULL,
  `sex` tinyint NOT NULL,
  `medicalHistory` tinyint NOT NULL,
  `marital` tinyint NOT NULL,
  `problem` tinyint NOT NULL,
  `doctorID` tinyint NOT NULL,
  `appointmentID` tinyint NOT NULL,
  `startTime` tinyint NOT NULL,
  `endTime` tinyint NOT NULL,
  `remarks` tinyint NOT NULL,
  `amount` tinyint NOT NULL,
  `isPaid` tinyint NOT NULL,
  `timeStamp` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `category` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `PatientInfo`
--

DROP TABLE IF EXISTS `PatientInfo`;
/*!50001 DROP VIEW IF EXISTS `PatientInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `PatientInfo` (
  `patientID` tinyint NOT NULL,
  `patientName` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `address` tinyint NOT NULL,
  `sex` tinyint NOT NULL,
  `medicalHistory` tinyint NOT NULL,
  `marital` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Pharmacy`
--

DROP TABLE IF EXISTS `Pharmacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pharmacy` (
  `pharmacyID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `category` varchar(20) NOT NULL,
  PRIMARY KEY (`pharmacyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Prescription`
--

DROP TABLE IF EXISTS `Prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Prescription` (
  `prescriptionID` int(11) NOT NULL,
  `timeStamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`prescriptionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Supplies`
--

DROP TABLE IF EXISTS `Supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Supplies` (
  `pharmacyID` int(11) NOT NULL,
  `vendorID` int(11) NOT NULL,
  `price` float NOT NULL,
  `orderTime` datetime NOT NULL,
  `supplyTime` datetime DEFAULT NULL,
  PRIMARY KEY (`pharmacyID`,`vendorID`),
  KEY `FK_Vendor_Supplies` (`vendorID`),
  CONSTRAINT `FK_Pharmacy_Supplies` FOREIGN KEY (`pharmacyID`) REFERENCES `Pharmacy` (`pharmacyID`) ON DELETE CASCADE,
  CONSTRAINT `FK_Vendor_Supplies` FOREIGN KEY (`vendorID`) REFERENCES `Vendor` (`vendorID`) ON DELETE CASCADE,
  CONSTRAINT `DateTimeCheck` CHECK (`supplyTime` > `orderTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Vendor`
--

DROP TABLE IF EXISTS `Vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vendor` (
  `vendorID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(20) NOT NULL,
  PRIMARY KEY (`vendorID`),
  CONSTRAINT `PhoneCheck` CHECK (`phone` regexp '^[+]91 [6-9][[:digit:]]{9}$')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `VendorDrugInfo`
--

DROP TABLE IF EXISTS `VendorDrugInfo`;
/*!50001 DROP VIEW IF EXISTS `VendorDrugInfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `VendorDrugInfo` (
  `vendorID` tinyint NOT NULL,
  `pharmacyID` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `phone` tinyint NOT NULL,
  `address` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `price` tinyint NOT NULL,
  `orderTime` tinyint NOT NULL,
  `supplyTime` tinyint NOT NULL,
  `drugName` tinyint NOT NULL,
  `category` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `AdminInfo`
--

/*!50001 DROP TABLE IF EXISTS `AdminInfo`*/;
/*!50001 DROP VIEW IF EXISTS `AdminInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `AdminInfo` AS (select `a`.`adminID` AS `adminID`,`e`.`name` AS `name`,`e`.`phone` AS `phone`,`e`.`email` AS `email`,`e`.`address` AS `address`,`e`.`sex` AS `sex` from (`Admin` `a` join `Employee` `e` on(`a`.`adminID` = `e`.`employeeID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `DoctorInfo`
--

/*!50001 DROP TABLE IF EXISTS `DoctorInfo`*/;
/*!50001 DROP VIEW IF EXISTS `DoctorInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `DoctorInfo` AS (select `d`.`doctorID` AS `doctorID`,`e`.`name` AS `doctorName`,`e`.`phone` AS `phone`,`e`.`email` AS `email`,`e`.`address` AS `address`,`e`.`sex` AS `sex` from (`Doctor` `d` join `Employee` `e` on(`d`.`doctorID` = `e`.`employeeID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `DoctorPatientInfo`
--

/*!50001 DROP TABLE IF EXISTS `DoctorPatientInfo`*/;
/*!50001 DROP VIEW IF EXISTS `DoctorPatientInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `DoctorPatientInfo` AS (select `D`.`pharmacyID` AS `pharmacyID`,`A`.`prescriptionId` AS `prescriptionId`,`C`.`consultationID` AS `consultationID`,`DoctorInfo`.`doctorID` AS `doctorID`,`DoctorInfo`.`doctorName` AS `doctorName`,`DoctorInfo`.`phone` AS `phone`,`DoctorInfo`.`email` AS `email`,`DoctorInfo`.`address` AS `address`,`DoctorInfo`.`sex` AS `sex`,`C`.`problem` AS `problem`,`C`.`patientID` AS `patientID`,`A`.`appointmentID` AS `appointmentID`,`A`.`startTime` AS `startTime`,`A`.`endTime` AS `endTime`,`A`.`remarks` AS `remarks`,`A`.`invoiceId` AS `invoiceId`,`Pr`.`timeStamp` AS `timeStamp`,`Ph`.`name` AS `name`,`Ph`.`category` AS `category` from (((((`DoctorInfo` join `Consultation` `C` on(`DoctorInfo`.`doctorID` = `C`.`doctorID`)) join `Appointment` `A` on(`C`.`consultationID` = `A`.`consultationId`)) join `Prescription` `Pr` on(`A`.`prescriptionId` = `Pr`.`prescriptionID`)) join `Drugs` `D` on(`A`.`prescriptionId` = `D`.`prescriptionID`)) join `Pharmacy` `Ph` on(`D`.`pharmacyID` = `Ph`.`pharmacyID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `DriverInfo`
--

/*!50001 DROP TABLE IF EXISTS `DriverInfo`*/;
/*!50001 DROP VIEW IF EXISTS `DriverInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `DriverInfo` AS (select `d`.`driverID` AS `driverID`,`e`.`name` AS `name`,`e`.`phone` AS `phone`,`e`.`email` AS `email`,`e`.`address` AS `address`,`e`.`sex` AS `sex` from (`Driver` `d` join `Employee` `e` on(`d`.`driverID` = `e`.`employeeID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `DriverJourneyInfo`
--

/*!50001 DROP TABLE IF EXISTS `DriverJourneyInfo`*/;
/*!50001 DROP VIEW IF EXISTS `DriverJourneyInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `DriverJourneyInfo` AS (select `DriverInfo`.`driverID` AS `driverID`,`DriverInfo`.`name` AS `name`,`DriverInfo`.`phone` AS `phone`,`DriverInfo`.`email` AS `email`,`DriverInfo`.`address` AS `address`,`DriverInfo`.`sex` AS `sex`,`Ambulance`.`ambulanceID` AS `ambulanceID`,`Ambulance`.`lastMaintenance` AS `lastMaintenance`,`Ambulance`.`totalDistance` AS `totalDistance`,`Journey`.`startTime` AS `startTime`,`Journey`.`endTime` AS `endTime`,`Journey`.`address` AS `journeyAddress` from ((`DriverInfo` join `Journey` on(`DriverInfo`.`driverID` = `Journey`.`driverID`)) join `Ambulance` on(`Journey`.`ambulanceId` = `Ambulance`.`ambulanceID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `NurseDiagnosticsInfo`
--

/*!50001 DROP TABLE IF EXISTS `NurseDiagnosticsInfo`*/;
/*!50001 DROP VIEW IF EXISTS `NurseDiagnosticsInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `NurseDiagnosticsInfo` AS (select `NurseInfo`.`nurseID` AS `nurseID`,`NurseInfo`.`qualification` AS `qualification`,`NurseInfo`.`license` AS `license`,`NurseInfo`.`name` AS `name`,`NurseInfo`.`phone` AS `phone`,`NurseInfo`.`email` AS `email`,`NurseInfo`.`address` AS `address`,`NurseInfo`.`sex` AS `sex`,`Diagnostics`.`diagnosticsID` AS `diagnosticsID`,`Diagnostics`.`category` AS `category`,`Diagnostics`.`name` AS `diagnostics` from ((`NurseInfo` join `Assists` on(`NurseInfo`.`nurseID` = `Assists`.`nurseId`)) join `Diagnostics` on(`Assists`.`diagnosticsID` = `Diagnostics`.`diagnosticsID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `NurseInfo`
--

/*!50001 DROP TABLE IF EXISTS `NurseInfo`*/;
/*!50001 DROP VIEW IF EXISTS `NurseInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `NurseInfo` AS (select `n`.`nurseID` AS `nurseID`,`n`.`qualification` AS `qualification`,`n`.`license` AS `license`,`e`.`name` AS `name`,`e`.`phone` AS `phone`,`e`.`email` AS `email`,`e`.`address` AS `address`,`e`.`sex` AS `sex` from (`Nurse` `n` join `Employee` `e` on(`n`.`nurseID` = `e`.`employeeID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `PatientDoctorInfo`
--

/*!50001 DROP TABLE IF EXISTS `PatientDoctorInfo`*/;
/*!50001 DROP VIEW IF EXISTS `PatientDoctorInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `PatientDoctorInfo` AS (select `D`.`pharmacyID` AS `pharmacyID`,`A`.`prescriptionId` AS `prescriptionId`,`A`.`invoiceId` AS `invoiceId`,`C`.`consultationID` AS `consultationID`,`PatientInfo`.`patientID` AS `patientID`,`PatientInfo`.`patientName` AS `patientName`,`PatientInfo`.`phone` AS `phone`,`PatientInfo`.`email` AS `email`,`PatientInfo`.`address` AS `address`,`PatientInfo`.`sex` AS `sex`,`PatientInfo`.`medicalHistory` AS `medicalHistory`,`PatientInfo`.`marital` AS `marital`,`C`.`problem` AS `problem`,`C`.`doctorID` AS `doctorID`,`A`.`appointmentID` AS `appointmentID`,`A`.`startTime` AS `startTime`,`A`.`endTime` AS `endTime`,`A`.`remarks` AS `remarks`,`I`.`amount` AS `amount`,`I`.`isPaid` AS `isPaid`,`P`.`timeStamp` AS `timeStamp`,`Ph`.`name` AS `name`,`Ph`.`category` AS `category` from ((((((`PatientInfo` join `Consultation` `C` on(`PatientInfo`.`patientID` = `C`.`patientID`)) join `Appointment` `A` on(`C`.`consultationID` = `A`.`consultationId`)) join `Invoice` `I` on(`A`.`invoiceId` = `I`.`invoiceID`)) join `Prescription` `P` on(`A`.`prescriptionId` = `P`.`prescriptionID`)) join `Drugs` `D` on(`A`.`prescriptionId` = `D`.`prescriptionID`)) join `Pharmacy` `Ph` on(`D`.`pharmacyID` = `Ph`.`pharmacyID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `PatientInfo`
--

/*!50001 DROP TABLE IF EXISTS `PatientInfo`*/;
/*!50001 DROP VIEW IF EXISTS `PatientInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `PatientInfo` AS (select `Patient`.`patientID` AS `patientID`,`Patient`.`name` AS `patientName`,`Patient`.`phone` AS `phone`,`Patient`.`email` AS `email`,`Patient`.`address` AS `address`,`Patient`.`sex` AS `sex`,`Patient`.`medicalHistory` AS `medicalHistory`,`Patient`.`marital` AS `marital` from `Patient`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `VendorDrugInfo`
--

/*!50001 DROP TABLE IF EXISTS `VendorDrugInfo`*/;
/*!50001 DROP VIEW IF EXISTS `VendorDrugInfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `VendorDrugInfo` AS (select `Vendor`.`vendorID` AS `vendorID`,`p`.`pharmacyID` AS `pharmacyID`,`Vendor`.`name` AS `name`,`Vendor`.`phone` AS `phone`,`Vendor`.`address` AS `address`,`Vendor`.`email` AS `email`,`s`.`price` AS `price`,`s`.`orderTime` AS `orderTime`,`s`.`supplyTime` AS `supplyTime`,`p`.`name` AS `drugName`,`p`.`category` AS `category` from ((`Vendor` join `Supplies` `s` on(`Vendor`.`vendorID` = `s`.`vendorID`)) join `Pharmacy` `p` on(`s`.`pharmacyID` = `p`.`pharmacyID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-30  6:18:13
