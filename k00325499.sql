CREATE DATABASE  IF NOT EXISTS `k00325499_autorent` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `k00325499_autorent`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: k00325499_autorent
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `administrator`
--

DROP TABLE IF EXISTS `administrator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrator` (
  `AdminID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `PasswordHash` char(64) DEFAULT NULL,
  PRIMARY KEY (`AdminID`),
  UNIQUE KEY `email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrator`
--

LOCK TABLES `administrator` WRITE;
/*!40000 ALTER TABLE `administrator` DISABLE KEYS */;
INSERT INTO `administrator` VALUES (1,'Maksym Shevchuk','k00325499@student.tus.ie','afe35b0dca1c805c74e744ce4bb0d466267934deefa87fd91c79fd5ea434679a');
/*!40000 ALTER TABLE `administrator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `car` (
  `CarID` int(11) NOT NULL AUTO_INCREMENT,
  `RegistrationNumber` varchar(20) NOT NULL,
  `Make` varchar(50) DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `CarTypeID` int(11) NOT NULL,
  `CurrentLocationID` int(11) NOT NULL,
  `IsActive` enum('active','removed') NOT NULL,
  PRIMARY KEY (`CarID`),
  UNIQUE KEY `registration_number_UNIQUE` (`RegistrationNumber`),
  KEY `fk_Car_CarType_idx` (`CarTypeID`),
  KEY `fk_Car_CurrentLocation_idx` (`CurrentLocationID`),
  CONSTRAINT `fk_Car_CarType` FOREIGN KEY (`CarTypeID`) REFERENCES `cartype` (`CarTypeID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Car_CurrentLocation` FOREIGN KEY (`CurrentLocationID`) REFERENCES `location` (`LocationID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (1,'201-D-45231','Toyota','Yaris',1,1,'active'),(2,'191-D-88312','Honda','Civic',2,2,'active'),(3,'182-D-22991','Volkswagen','Golf',1,3,'active'),(4,'201-C-55321','Hyundai','i30',1,4,'active'),(5,'192-C-99872','Ford','Focus',2,5,'active'),(6,'181-C-44112','Skoda','Octavia',2,6,'active'),(7,'201-G-77231','Toyota','Corolla',2,7,'active'),(8,'191-G-53382','Nissan','Qashqai',3,8,'active'),(9,'181-L-88291','Kia','Sportage',3,9,'active'),(10,'202-L-11942','BMW','X1',3,10,'active'),(11,'201-W-66541','Volkswagen','Passat',2,11,'active'),(12,'192-W-23261','Audi','A4',2,12,'active'),(13,'191-KK-53321','Hyundai','Tucson',3,13,'active'),(14,'181-KK-11091','Mazda','CX-5',3,14,'active'),(15,'202-WX-77211','Toyota','Avensis',2,15,'active'),(16,'182-WX-33911','Ford','Mondeo',2,16,'active'),(17,'192-SO-55231','Renault','Clio',1,17,'active'),(18,'201-SO-66391','Peugeot','208',1,18,'active'),(19,'202-MO-88741','Volkswagen','Tiguan',3,19,'active'),(20,'191-MO-33121','Toyota','RAV4',3,20,'active'),(21,'182-KY-99721','Skoda','Karoq',3,21,'active'),(22,'201-KY-44191','Nissan','Juke',1,22,'active'),(23,'192-MH-65412','Opel','Astra',2,23,'active'),(24,'181-MH-77892','Ford','Kuga',3,24,'active'),(25,'202-DL-44231','Toyota','Camry',2,25,'active'),(26,'201-DL-99211','Honda','HR-V',3,26,'active'),(27,'192-TA-55111','Kia','Ceed',1,27,'active'),(28,'181-TA-77221','Hyundai','i20',1,28,'active'),(29,'202-RN-33091','Mazda','3',2,29,'active'),(30,'201-RN-66412','Volkswagen','Polo',1,30,'active'),(31,'06-L-1937','Volkswagen','Golf',1,3,'active');
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartype`
--

DROP TABLE IF EXISTS `cartype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartype` (
  `CarTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `TypeName` varchar(20) NOT NULL,
  `Description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`CarTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartype`
--

LOCK TABLES `cartype` WRITE;
/*!40000 ALTER TABLE `cartype` DISABLE KEYS */;
INSERT INTO `cartype` VALUES (1,'Compact','Small economical city car'),(2,'Saloon','Standard mid-size sedan'),(3,'SUV','Large SUV with spacious interior');
/*!40000 ALTER TABLE `cartype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `county`
--

DROP TABLE IF EXISTS `county`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `county` (
  `CountyID` int(11) NOT NULL AUTO_INCREMENT,
  `CountyName` varchar(50) NOT NULL,
  PRIMARY KEY (`CountyID`),
  UNIQUE KEY `CountyName_UNIQUE` (`CountyName`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `county`
--

LOCK TABLES `county` WRITE;
/*!40000 ALTER TABLE `county` DISABLE KEYS */;
INSERT INTO `county` VALUES (1,'Carlow'),(2,'Cavan'),(3,'Clare'),(4,'Cork'),(5,'Donegal'),(6,'Dublin'),(7,'Galway'),(8,'Kerry'),(9,'Kildare'),(10,'Kilkenny'),(11,'Laois'),(12,'Leitrim'),(13,'Limerick'),(14,'Longford'),(15,'Louth'),(16,'Mayo'),(17,'Meath'),(18,'Monaghan'),(19,'Offaly'),(20,'Roscommon'),(21,'Sligo'),(22,'Tipperary'),(23,'Waterford'),(24,'Westmeath'),(25,'Wexford'),(26,'Wicklow');
/*!40000 ALTER TABLE `county` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `PasswordHash` char(64) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Address1` varchar(45) DEFAULT NULL,
  `Address2` varchar(45) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL,
  `Status` enum('active','suspended') DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `email_UNIQUE` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'John','Murphy','john.murphy@example.com','e6c3da5b206634d7f3f3586d747ffdb36b5c675757b380c6a5fe5c570c714349','+353 85 432 9912','12 Oakfield Drive',NULL,'Dublin','active'),(2,'Sarah','Byrne','sarah.byrne@example.com','3e85f51777cb3b4b2f600b8ef9bfe046d61286a9020058e7e659caa0cd220bae','+353 87 991 2203','45 Greenpark Avenue',NULL,'Cork','active'),(3,'David','O\'Connor','d.oconnor@example.com','14f8f4bb8c0e79a02670a5fea5682da717a5b3d3dc7b1706f7a4bab9afae18c2','+353 86 550 7710','78 Willowbank Road',NULL,'Galway','active'),(4,'Emma','Walsh','emma.walsh@example.com','7b462dba75b60eb1791903774e9c2d5b602cfe76d54e907e1a04436b65db7153','+353 89 442 3371','9 Lakeshore View',NULL,'Limerick','active'),(5,'James','Kelly','j.kelly@example.com','d5b64690663f2177ef0da201b741b84cd4659fdcb7fa2e2440c4f1e4ee8b2aba','+353 87 778 1129','6 Meadowbrook Lane',NULL,'Waterford','active'),(6,'Aoife','Doyle','aoife.doyle@example.com','40f2261fe5449414e3edaed143143911c3a8cef7399b847b8d4562d0761acb98','+353 85 123 9981','14 Briarhill Close',NULL,'Kilkenny','active'),(7,'Michael','Lynch','m.lynch@example.com','6ab0e13a1e9ad288a66e460ee0413b3254519b59df5ea1fdf87025abd760bd6c','+353 86 430 2211','55 Ashfield Gardens',NULL,'Wexford','active'),(8,'Laura','Healy','laura.healy@example.com','50d16a9e4ff2d7f55746ef45869ce8753756b92f8cd86c5af69e944fb15197de','+353 89 772 1140','33 Seaview Rise',NULL,'Sligo','active'),(9,'Patrick','Moore','patrick.moore@example.com','70d8fa5af17c2cde85ca7c97d21033973317e0ad0788963381f4b137fe52089b','+353 85 447 6612','8 Castlewood Road',NULL,'Castlebar','active'),(10,'Niamh','Fitzgerald','niamh.fitz@example.com','4cb0510dfde6b126e37c6b17c25b3cfb91ba7da7bc352788eb8d16c6044c4c55','+353 86 320 9041','91 Riverside Court',NULL,'Tralee','active'),(11,'Conor','Reilly','conor.reilly@example.com','077efb197cf650d8c91a57570331bc53ede7d99788b8c16cd10541dec3eaee17','+353 87 550 1123','17 Hazel Grove',NULL,'Navan','active'),(12,'Lisa','Murray','lisa.murray@example.com','34100ae20573867408fb45f76c038a97613abd99525e9a217d1935845b06d574','+353 85 998 2010','3 Cloverfield Row',NULL,'Letterkenny','active'),(13,'Brian','Quinn','brian.quinn@example.com','14b96435dfb32f8c12cbb389551214e78a2cbd5c9d03445a645262ca0562ba38','+353 86 770 4412','42 Oakridge Park',NULL,'Clonmel','active'),(14,'Hannah','Kavanagh','h.kavanagh@example.com','9e4abdc9e53d8e116e9e2f0f7b07ea8a8cae223f3ceecfad5f0f065d0d103835','+353 89 612 7704','29 Brookside Drive',NULL,'Roscommon','active'),(15,'Shane','O\'Reilly','shane.oreilly@example.com','6f2a47cefed09e2476d503dc5d58b89b7feb1e135afc65bec331e07df48651ee','+353 87 334 5590','50 Greenpark Close',NULL,'Dundalk','active'),(16,'Eoin','Wilson','eoin.wilson@example.com','a4bc1681ede19eaf086d31b784b2773defd8d21fc68165c809eb4895f92667d6','+353 85 933 1744','9 Ashwood Grove',NULL,'Naas','active'),(17,'Katie','Brennan','katie.brennan@example.com','34cc5d2847e479a3e4a261b7a9e32a73035ec2b1f78b9f4e00f2303bb0194b62','+353 86 550 8821','5 Silverstream Lane',NULL,'Ennis','active'),(18,'Mark','Dunne','mark.dunne@example.com','0672431547cf9473e75da07d02f795649d3dd21e3e9618d60dbafc212fb1ecbb','+353 89 498 7712','12 Orchard Rise',NULL,'Monaghan','active'),(19,'Rebecca','Flynn','rebecca.flynn@example.com','abb70cb0b65eec041053bac9426144a96b1af8a2d67ce1e1e0fa803d3133244d','+353 85 221 4480','31 Maple View',NULL,'Cavan','active'),(20,'Thomas','Nolan','thomas.nolan@example.com','4cf3c6cd1ec37f60f2fe630232963c39113b9ea6fd3aabdf10a18bb447e43fa8','+353 86 903 4411','67 Millmount Road',NULL,'Carrick-on-Shannon','active'),(21,'Aisling','Hayes','aisling.hayes@example.com','e0dc2e9ece1c8e53042d959e35957edd318261b50cf97679ef027e24730e0bfa','+353 89 441 2231','22 The Paddocks',NULL,'Tullamore','active'),(22,'Darragh','O\'Neill','darragh.oneill@example.com','0ceee866627ec8639dcf5d0b26bb87bb63444bbffa9d12e907186f42649826e1','+353 87 310 4418','8 Hillcrest Park',NULL,'Mullingar','active'),(23,'Molly','Roche','molly.roche@example.com','84948e5cacbcfa8b42cd34e787d5423185a9a87fcaeb789209b23d5f873889ee','+353 86 742 5599','4 Chestnut Grove',NULL,'Bray','active'),(24,'Luke','Power','luke.power@example.com','5ac40966ef84d3bb9c653a4048dec816cf4a92441c9cfb5f36f32b90a07eda92','+353 85 772 6612','91 Oakview Road',NULL,'Longford','active'),(25,'Jennifer','Ward','jennifer.ward@example.com','0f5ee06f024cd886269bd9bccfade6fca3f24ec10c2b80df4cd82d33126ad01e','+353 87 500 9044','3 Springhill Court',NULL,'Carlow','active'),(26,'Oliver','Shaw','oliver.shaw@example.com','82fc6a89bd540a46ccb517e265091d23cd6e4dfe7caa1d10e365d2347405c995','+353 86 990 7732','66 Beechwood Lane',NULL,'Portlaoise','active'),(27,'Clare','Armstrong','clare.armstrong@example.com','0fc1a2fab8e35533a57f17169e2472c15e63dc2659705b0eee896f168b3de2eb','+353 89 660 8744','39 Parkside Crescent',NULL,'Swords','active'),(28,'Mark','Donnelly','mark.donnelly87@mail.ie','028f30b7d7b4f8aed20df2a2cdbf12ff7bbe441bf5e14c436b5b13c017cebb53','085-674-9932','14 Oakview Drive',NULL,'Dublin','active'),(29,'Emma','Ward','emma.ward92@outlook.ie','8200cc03c0095199a56984bc2edef296cb661a7bfcc543b995329dea08a7dd07','083-712-4550','22 Riverlane Court','Apt 3B','Cork','active'),(30,'Patrick','O’Brien','patrick.obrien101@gmail.com','6ca13d52ca70c883e0f0bb101e425a89e8624f69b5d5f72e36e1f1b8d3d48e02','089-927-6114','45 Glenwood Park',NULL,'Galway','suspended'),(31,'Dmitro','Oconel','<shane.oreilly@example.com','9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08','085-354-1987','14 Dangle street',NULL,'Limerick','active'),(33,'Sean','Callan','sean.obrien@gmail.com','30d076b7f9fd6bc6a352ce0906f3d9f3ad54052564e00cfed3c3b1b2386d6de9','0876123456','12 St. Patrick Street',NULL,'Limerick','active'),(34,'John','Colm','johnColm@gmail.com','6fec2a9601d5b3581c94f2150fc07fa3d6e45808079428354b868e412b76e6bb','0857123456','63 Baker Street',NULL,'Corck','active');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `FeedbackID` int(11) NOT NULL AUTO_INCREMENT,
  `Rating` int(11) NOT NULL,
  `Comment` text DEFAULT NULL,
  `CreatedAt` datetime NOT NULL,
  `ReservationID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  PRIMARY KEY (`FeedbackID`),
  UNIQUE KEY `ReservationID` (`ReservationID`),
  KEY `fk_Feedback_Reservation_idx` (`ReservationID`),
  KEY `fk_Feedback_Customer_idx` (`CustomerID`),
  CONSTRAINT `fk_Feedback_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Feedback_Reservation` FOREIGN KEY (`ReservationID`) REFERENCES `reservation` (`ReservationID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,5,'Very smooth process, car was clean and ready.','2024-03-02 10:25:11',1,5),(2,4,'Everything ok, staff was helpful.','2024-06-12 14:40:33',2,12),(3,3,'Car was fine but pickup took longer than expected.','2024-03-10 09:18:05',3,7),(4,5,'No issues at all, would rent again.','2024-04-21 16:02:44',4,9),(5,2,'Car was not very clean on arrival.','2024-05-12 11:33:20',5,18),(6,4,'Good value for money.','2024-03-24 15:19:52',6,2),(7,5,'Excellent service at the desk.','2024-10-19 12:01:09',7,21),(8,3,'Return process was a bit confusing.','2024-01-27 17:44:31',8,10),(9,4,'Car drove well, no problems.','2024-06-22 13:05:27',9,1),(10,5,'Friendly staff and quick pickup.','2024-03-31 09:56:40',10,24),(11,4,'Happy with the rental overall.','2024-08-26 18:20:14',11,16),(12,3,'Small scratch on the car but was already noted.','2024-04-16 10:45:03',12,20),(13,5,'Great car, very comfortable.','2024-11-09 19:32:55',13,6),(14,4,'Pickup location easy to find.','2024-12-18 08:41:22',14,27),(15,2,'Waiting time at pickup was too long.','2024-02-11 14:10:09',15,19),(16,4,'All documents were prepared in advance.','2024-07-30 09:27:48',16,28),(17,5,'Everything perfect from start to finish.','2024-09-13 13:58:37',17,8),(18,3,NULL,'2024-05-20 16:12:00',18,11),(19,4,'Return took only a few minutes.','2024-10-30 11:05:29',19,17),(20,5,'Car exceeded expectations.','2024-06-15 10:22:44',20,4),(21,4,'Car was ready at pickup and the process went smoothly.','2024-07-20 10:32:11',21,15),(22,3,'Decent overall, but the inside could have been a bit cleaner.','2024-06-02 14:12:40',22,9),(23,5,'Great service and quick handover. No complaints at all.','2024-08-11 09:55:27',23,4),(24,4,'Everything worked fine, return was simple and fast.','2024-09-03 17:18:03',24,12),(25,2,'Had to wait longer than expected at the desk.','2024-05-14 13:44:59',25,18),(26,5,'Very friendly staff and the car was in excellent condition.','2024-10-22 12:08:55',26,7),(27,3,'The car performed okay, but the fuel consumption was higher than listed.','2024-07-01 15:21:10',27,20),(28,4,'Pickup location was easy to find and staff were helpful.','2024-08-29 11:33:22',28,25),(29,5,'Smooth rental experience, would recommend.','2024-12-01 08:40:12',29,3),(30,3,'Return process took a bit longer than usual but overall fine.','2024-09-16 16:05:44',30,11);
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `LocationID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Address` varchar(150) NOT NULL,
  `CountyID` int(11) NOT NULL,
  PRIMARY KEY (`LocationID`),
  KEY `fk_Location_County_idx` (`CountyID`),
  CONSTRAINT `fk_Location_County` FOREIGN KEY (`CountyID`) REFERENCES `county` (`CountyID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Dublin Central Office','Dublin','12 Riverpark Street',6),(2,'Dublin Airport Branch','Dublin','89 Airfield Road',6),(3,'Dublin East Point Desk','Dublin','45 Seaview Crescent',6),(4,'Cork City Centre','Cork','22 Market Lane',4),(5,'Cork Harbour Branch','Cork','7 Harbour View Road',4),(6,'Cork Airport Office','Cork','15 Terminal Drive',4),(7,'Galway Riverside Office','Galway','14 Brookfield Avenue',7),(8,'Galway West Park','Galway','39 Oakridge Park',7),(9,'Limerick Downtown','Limerick','8 Castlebrook Street',13),(10,'Limerick Station Office','Limerick','110 Station View Road',13),(11,'Waterford Main Branch','Waterford','55 Greenway Road',23),(12,'Waterford East Office','Waterford','18 Lakeside Drive',23),(13,'Kilkenny Centre','Kilkenny','27 Highgate Close',10),(14,'Kilkenny North Branch','Kilkenny','44 Millbrook Avenue',10),(15,'Wexford Harbour Office','Wexford','9 Bayview Terrace',25),(16,'Wexford Retail Park','Wexford','33 Pinefield Road',25),(17,'Sligo Central Branch','Sligo','21 Riverside Court',21),(18,'Sligo Business Park','Sligo','77 Hazel Grove',21),(19,'Mayo West Office','Castlebar','16 Ashfield Park',16),(20,'Mayo North Branch','Ballina','48 Meadowlands Road',16),(21,'Kerry Killarney Office','Killarney','12 Lakeshore Avenue',8),(22,'Kerry Tralee Centre','Tralee','90 Hillview Road',8),(23,'Meath Navan Office','Navan','14 Churchwell Street',17),(24,'Meath South Branch','Ashbourne','26 Briarhill Grove',17),(25,'Donegal Bay Branch','Donegal Town','5 Clonbridge Road',5),(26,'Donegal North Centre','Letterkenny','61 Old Mill View',5),(27,'Tipperary Town Office','Tipperary','23 Willowbank Lane',22),(28,'Tipperary South Branch','Clonmel','71 Greenpark Avenue',22),(29,'Roscommon Central Office','Roscommon','18 Silverwood Drive',20),(30,'Roscommon North Branch','Boyle','29 Meadowview Crescent',20);
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `MessageID` int(11) NOT NULL AUTO_INCREMENT,
  `MessageText` text NOT NULL,
  `SentAt` datetime NOT NULL,
  `SenderID` int(11) NOT NULL,
  `ReceiverID` int(11) NOT NULL,
  PRIMARY KEY (`MessageID`),
  KEY `fk_Message_Sender_idx` (`SenderID`),
  KEY `fk_Message_Receiver_idx` (`ReceiverID`),
  CONSTRAINT `fk_Message_Receiver` FOREIGN KEY (`ReceiverID`) REFERENCES `customer` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Message_Sender` FOREIGN KEY (`SenderID`) REFERENCES `customer` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'Please confirm pickup time.','2024-01-05 09:14:22',3,12),(2,'Can you send me the details again?','2024-01-11 16:33:10',8,5),(3,'Thanks.','2024-01-18 12:02:55',2,14),(4,'Need to update my booking.','2024-02-02 10:44:19',11,7),(5,'Ok, got it.','2024-02-12 14:20:15',4,1),(6,'Is the car ready now?','2024-02-26 17:03:41',15,9),(7,'Please advise.','2024-03-03 11:29:33',6,20),(8,'I will be there in 15 minutes.','2024-03-15 08:57:10',10,3),(9,'Where do I leave the keys?','2024-03-29 18:12:44',9,25),(10,'Sent the documents.','2024-04-04 13:11:22',18,6),(11,'Can I change the return time?','2024-04-20 09:41:05',14,22),(12,'Let me know if anything else is required.','2024-05-01 15:50:33',7,19),(13,'All good on my side.','2024-05-09 10:25:11',13,4),(14,'Received, thank you.','2024-05-21 19:44:02',1,15),(15,'Is insurance included?','2024-06-02 11:12:28',21,8),(16,'Everything was fine, thanks.','2024-06-14 17:55:44',12,30),(17,'Can I add one more driver?','2024-06-25 08:21:09',28,10),(18,'What fuel type is required?','2024-07-06 13:32:15',5,13),(19,'Please confirm drop-off location.','2024-07-22 16:48:51',22,17),(20,'I am running late.','2024-08-03 09:40:32',29,26),(21,'Car returned.','2024-08-16 12:03:22',30,11),(22,'Is GPS available?','2024-08-28 18:22:19',16,2),(23,'No issues from my side.','2024-09-07 14:15:40',24,23),(24,'Please check the availability.','2024-09-19 11:20:17',20,27),(25,'Thanks for letting me know.','2024-10-01 10:41:12',17,18),(26,'I left something in the car.','2024-10-14 09:55:49',26,21),(27,'Can you call me?','2024-10-30 13:08:03',19,29),(28,'Ready for pickup.','2024-11-12 08:44:17',23,16),(29,'Please update me.','2024-11-27 15:38:55',27,24),(30,'All set.','2024-12-08 10:02:18',25,28),(31,'Is the car available earlier?','2024-06-11 10:15:22',7,12),(32,'Thanks for the quick reply!','2024-06-11 10:18:49',12,7),(33,'Can I extend my rental by one day?','2024-08-03 14:55:31',3,18),(34,'Your reservation is confirmed.','2024-08-03 15:02:40',18,3),(35,'Can I change pickup location?','2024-09-12 09:34:12',21,5),(36,'Pickup location updated successfully.','2024-09-12 09:40:33',5,21),(37,'Do you offer child seats?','2024-10-22 13:11:20',8,14),(38,'Yes, child seats are available.','2024-10-22 13:15:02',14,8),(39,'Thanks for helping with my booking!','2024-11-29 17:44:55',19,2),(40,'Any feedback about the recent rental?','2024-11-30 10:05:13',2,19);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation` (
  `ReservationID` int(11) NOT NULL AUTO_INCREMENT,
  `CarID` int(11) NOT NULL,
  `DateFrom` date NOT NULL,
  `DateTo` date NOT NULL,
  `Status` enum('pending','confirmed','cancelled') NOT NULL,
  `CreatedAt` datetime NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `PickupLocationID` int(11) NOT NULL,
  `ReturnLocationID` int(11) NOT NULL,
  PRIMARY KEY (`ReservationID`),
  KEY `fk_Reservation_Customer_idx` (`CustomerID`),
  KEY `fk_Reservation_Car_idx` (`CarID`),
  KEY `fk_Reservation_PickupLocation_idx` (`PickupLocationID`),
  KEY `fk_Reservation_ReturnLocation_idx` (`ReturnLocationID`),
  CONSTRAINT `fk_Reservation_Car` FOREIGN KEY (`CarID`) REFERENCES `car` (`CarID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservation_Customer` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservation_PickupLocation` FOREIGN KEY (`PickupLocationID`) REFERENCES `location` (`LocationID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reservation_ReturnLocation` FOREIGN KEY (`ReturnLocationID`) REFERENCES `location` (`LocationID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,1,'2024-02-10','2024-02-15','confirmed','2024-01-28 14:22:10',5,1,3),(2,1,'2024-06-05','2024-06-11','confirmed','2024-05-20 10:12:55',12,2,4),(3,2,'2024-03-01','2024-03-07','pending','2024-02-21 09:44:01',7,4,6),(4,3,'2024-04-12','2024-04-19','confirmed','2024-03-30 16:11:29',9,5,5),(5,4,'2024-05-03','2024-05-10','cancelled','2024-04-25 19:31:55',18,4,7),(6,4,'2024-09-15','2024-09-22','confirmed','2024-08-30 12:42:20',3,4,5),(7,5,'2024-07-01','2024-07-08','confirmed','2024-06-20 08:12:15',14,6,8),(8,6,'2024-03-18','2024-03-23','confirmed','2024-03-05 17:03:54',2,5,5),(9,7,'2024-10-11','2024-10-17','pending','2024-09-28 11:18:22',21,7,9),(10,8,'2024-01-20','2024-01-25','cancelled','2024-01-15 09:47:11',10,8,8),(11,8,'2024-08-02','2024-08-10','confirmed','2024-07-20 13:11:51',25,9,10),(12,9,'2024-06-14','2024-06-20','confirmed','2024-06-01 10:00:55',1,11,13),(13,10,'2024-03-25','2024-03-30','pending','2024-03-17 20:41:32',24,12,12),(14,11,'2024-08-19','2024-08-24','confirmed','2024-08-03 14:10:01',16,13,15),(15,12,'2024-04-06','2024-04-14','confirmed','2024-03-25 09:55:22',20,12,14),(16,13,'2024-11-01','2024-11-07','pending','2024-10-21 10:18:29',6,10,11),(17,14,'2024-12-10','2024-12-16','confirmed','2024-11-29 12:01:12',27,16,18),(18,15,'2024-02-02','2024-02-09','cancelled','2024-01-26 13:19:33',19,15,15),(19,16,'2024-07-22','2024-07-29','confirmed','2024-07-10 08:32:54',28,18,17),(20,17,'2024-09-03','2024-09-10','confirmed','2024-08-27 19:14:35',8,17,16),(21,18,'2024-05-11','2024-05-18','pending','2024-05-01 11:44:22',11,19,19),(22,19,'2024-10-21','2024-10-29','confirmed','2024-10-10 14:22:58',17,20,21),(23,20,'2024-06-01','2024-06-08','confirmed','2024-05-21 16:29:14',4,22,22),(24,21,'2024-03-08','2024-03-14','cancelled','2024-02-28 12:42:51',13,21,20),(25,21,'2024-12-05','2024-12-12','confirmed','2024-11-24 15:51:50',30,23,24),(26,22,'2024-11-14','2024-11-20','confirmed','2024-11-05 09:28:41',22,24,25),(27,23,'2024-04-18','2024-04-26','confirmed','2024-04-07 17:39:55',23,26,27),(28,24,'2024-09-19','2024-09-25','pending','2024-09-09 20:03:44',29,25,23),(29,25,'2024-01-14','2024-01-19','confirmed','2024-01-05 09:11:30',15,27,28),(30,26,'2024-05-21','2024-05-29','confirmed','2024-05-10 11:55:18',26,28,30),(31,27,'2024-02-15','2024-02-22','confirmed','2024-02-05 10:49:22',3,29,29),(32,28,'2024-08-08','2024-08-14','pending','2024-07-30 18:00:33',2,30,30),(33,29,'2024-06-17','2024-06-25','confirmed','2024-06-06 15:20:55',6,12,11),(34,30,'2024-10-04','2024-10-12','confirmed','2024-09-22 09:14:01',9,18,19),(37,1,'2024-12-01','2024-12-03','confirmed','2025-11-30 00:18:46',1,1,1),(38,1,'2024-12-10','2024-12-12','confirmed','2025-11-30 00:36:31',1,1,1),(39,1,'2024-12-20','2024-12-25','confirmed','2025-11-30 15:54:13',5,3,3);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `ServiceID` int(11) NOT NULL AUTO_INCREMENT,
  `CarID` int(11) NOT NULL,
  `ServiceFrom` date NOT NULL,
  `ServiceTo` date NOT NULL,
  `Description` varchar(200) NOT NULL,
  PRIMARY KEY (`ServiceID`),
  KEY `fk_Service_Car_idx` (`CarID`),
  CONSTRAINT `fk_Service_Car` FOREIGN KEY (`CarID`) REFERENCES `car` (`CarID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,1,'2024-03-01','2024-03-04','Oil change & filter replacement'),(2,2,'2024-04-10','2024-04-13','Brake system inspection'),(3,3,'2024-05-20','2024-05-23','Engine diagnostics and tuning'),(4,4,'2024-07-02','2024-07-05','Air conditioning system service'),(5,5,'2024-08-15','2024-08-18','Full tyre replacement'),(6,6,'2024-09-01','2024-09-04','Battery testing and replacement'),(7,7,'2024-10-22','2024-10-26','Suspension check and alignment'),(8,8,'2024-11-05','2024-11-07','Transmission oil service'),(9,9,'2024-12-12','2024-12-15','Interior deep cleaning'),(10,10,'2025-01-18','2025-01-20','Windshield wiper & fluid replacement'),(11,11,'2025-02-02','2025-02-05','General safety inspection'),(12,12,'2025-03-06','2025-03-09','Brake pad replacement'),(13,13,'2025-04-14','2025-04-17','Engine oil pressure check'),(14,14,'2025-05-22','2025-05-25','Fuel system cleaning'),(15,15,'2025-06-03','2025-06-06','Replace rear tyres and alignment'),(16,1,'2025-02-10','2025-02-13','Tyre rotation and balancing'),(17,3,'2025-03-18','2025-03-21','Front brake disc replacement'),(18,4,'2025-04-02','2025-04-05','Coolant system flush'),(19,6,'2025-05-11','2025-05-14','Air filter and cabin filter replacement'),(20,7,'2025-06-20','2025-06-23','Engine oil and spark plug change'),(21,8,'2025-07-08','2025-07-11','Wheel alignment & balancing'),(22,9,'2025-08-15','2025-08-18','AC refrigerant refill'),(23,10,'2025-09-04','2025-09-07','Front suspension inspection'),(24,11,'2025-10-19','2025-10-22','Battery replacement'),(25,12,'2025-11-11','2025-11-14','Timing belt inspection'),(26,13,'2025-12-01','2025-12-04','Brake fluid replacement'),(27,14,'2026-01-06','2026-01-09','Clutch system inspection'),(28,15,'2026-02-14','2026-02-17','Gearbox oil replacement'),(29,16,'2026-03-03','2026-03-06','Full vehicle diagnostic'),(30,18,'2026-04-12','2026-04-15','Rear tyre replacement'),(31,3,'2024-06-01','2024-06-05',''),(32,31,'2025-11-01','2025-11-07','');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'k00325499_autorent'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_add_car` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_add_car`(
	IN p_RegNumber VARCHAR(20),
    IN p_Make VARCHAR(45),
    IN p_Model VARCHAR(45),
    IN p_CarTypeID INT,
    IN p_CurrentLocID INT 
    
)
BEGIN
    IF (SELECT COUNT(*) FROM car WHERE RegistrationNumber = p_RegNumber) > 0 THEN
        SELECT 'Car already in fleet' AS Message, FALSE AS Result;
        
    ELSE
        INSERT INTO car
            (RegistrationNumber, Make, Model, CarTypeID, CurrentLocationID)
        VALUES
            (p_RegNumber, p_Make, p_Model, p_CarTypeID, p_CurrentLocID);
        SELECT 'Car Added to fleet' AS Message, TRUE AS Result;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_reserve` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_car_reserve`(
    IN p_CarID INT,
    IN p_CustomerID INT,
    IN p_From DATE,
    IN p_To DATE,
    IN p_PickupLoc INT,
    IN p_ReturnLoc INT
)
BEGIN
    IF (SELECT COUNT(*)
        FROM reservation
        WHERE CarID = p_CarID
        AND NOT (p_To < DateFrom OR p_From > DateTo)) > 0 THEN
        SELECT 'Car not available for rental at specified dates' AS Message, FALSE AS Result;

    ELSEIF (
        SELECT COUNT(*)
        FROM service
        WHERE CarID = p_CarID
        AND NOT (p_To < ServiceFrom OR p_From > ServiceTo)) > 0 THEN
        
        SELECT 'Car not available for rental at specified dates' AS Message, FALSE AS Result;
        
    ELSE
        INSERT INTO reservation
        (CarID, CustomerID, DateFrom, DateTo, PickupLocationID, ReturnLocationID, Status, CreatedAt)
        VALUES
        (p_CarID, p_CustomerID, p_From, p_To, p_PickupLoc, p_ReturnLoc, 'confirmed', NOW());

        SELECT 'Car reservation confirmed' AS Message, TRUE AS Result;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_car_service` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_car_service`(
    IN p_CarID INT,
    IN p_From DATE,
    IN p_To DATE
)
BEGIN
    IF (SELECT COUNT(*)
        FROM reservation
        WHERE CarID = p_CarID
        AND NOT (p_To < DateFrom OR p_From > DateTo)) > 0 THEN
        
        SELECT 'Car not available for service at specified dates' AS Message, FALSE AS Result;
    
    ELSEIF (
        SELECT COUNT(*)
        FROM service
        WHERE CarID = p_CarID
        AND NOT (p_To < ServiceFrom OR p_From > ServiceTo)) > 0 THEN
        
        SELECT 'Car not available for service at specified dates' AS Message, FALSE AS Result;

    ELSE
        INSERT INTO service (CarID, ServiceFrom, ServiceTo)
        VALUES (p_CarID, p_From, p_To);

        SELECT 'Cars reserved for service' AS Message, TRUE AS Result;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_check_availability` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_check_availability`(
    IN p_DateFrom DATE,
    IN p_DateTo DATE
)
BEGIN
    SELECT 
        c.CarID,
        c.RegistrationNumber,
        c.Make,
        c.Model,
        t.TypeName,
        'Cars available' AS Message
    FROM car c
    JOIN cartype t ON c.CarTypeID = t.CarTypeID
    WHERE c.CarID NOT IN (
        SELECT CarID
        FROM reservation
        WHERE NOT (p_DateTo < DateFrom OR p_DateFrom > DateTo))
    AND c.CarID NOT IN (
        SELECT CarID
        FROM service
        WHERE NOT (p_DateTo < ServiceFrom OR p_DateFrom > ServiceTo));
        
    IF ROW_COUNT() = 0 THEN
        SELECT 'No cars available at specified dates' AS Message, FALSE AS Result;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_register_customer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_register_customer`(
    IN p_FirstName VARCHAR(45),
    IN p_LastName VARCHAR(45),
    IN p_Email VARCHAR(100),
    IN p_PasswordHash CHAR(64),
    IN p_Phone VARCHAR(20),
    IN p_Address1 VARCHAR(45),
    IN p_Address2 VARCHAR(45),
    IN p_City VARCHAR(50)
)
BEGIN
    IF (SELECT COUNT(*) FROM customer WHERE Email = p_Email) > 0 THEN
        SELECT 
            'Email address already in use' AS Message,
            FALSE AS Result;
            
    ELSE
        INSERT INTO customer
        (FirstName, LastName, Email, PasswordHash, Phone, Address1, Address2, City, Status)
        VALUES
        (p_FirstName, p_LastName, p_Email, p_PasswordHash, p_Phone, p_Address1, p_Address2, p_City, 'active');

        SELECT 
            'Customer Added' AS Message,
            TRUE AS Result;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-30 18:02:00
