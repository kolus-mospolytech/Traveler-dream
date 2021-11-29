-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dev
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `Bill`
--

DROP TABLE IF EXISTS `Bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bill` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `creation_date` datetime(6) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `payed` int NOT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bill`
--

LOCK TABLES `Bill` WRITE;
/*!40000 ALTER TABLE `Bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BusinessProcess`
--

DROP TABLE IF EXISTS `BusinessProcess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BusinessProcess` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `creation_date` datetime(6) NOT NULL,
  `update_date` datetime(6) NOT NULL,
  `agreement` bigint NOT NULL,
  `bill` bigint DEFAULT NULL,
  `contract` bigint DEFAULT NULL,
  `status` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `BusinessProcess_id_agreement_status_366b8cec_uniq` (`id`,`agreement`,`status`),
  KEY `BusinessProcess_agreement_461d4cfe_fk_PreliminaryAgreement_id` (`agreement`),
  KEY `BusinessProcess_bill_c663754a_fk_Bill_id` (`bill`),
  KEY `BusinessProcess_contract_a81437fa_fk_Contract_id` (`contract`),
  KEY `BusinessProcess_status_fb71b657_fk_ProcessStatus_id` (`status`),
  CONSTRAINT `BusinessProcess_agreement_461d4cfe_fk_PreliminaryAgreement_id` FOREIGN KEY (`agreement`) REFERENCES `PreliminaryAgreement` (`id`),
  CONSTRAINT `BusinessProcess_bill_c663754a_fk_Bill_id` FOREIGN KEY (`bill`) REFERENCES `Bill` (`id`),
  CONSTRAINT `BusinessProcess_contract_a81437fa_fk_Contract_id` FOREIGN KEY (`contract`) REFERENCES `Contract` (`id`),
  CONSTRAINT `BusinessProcess_status_fb71b657_fk_ProcessStatus_id` FOREIGN KEY (`status`) REFERENCES `ProcessStatus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BusinessProcess`
--

LOCK TABLES `BusinessProcess` WRITE;
/*!40000 ALTER TABLE `BusinessProcess` DISABLE KEYS */;
/*!40000 ALTER TABLE `BusinessProcess` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `City`
--

DROP TABLE IF EXISTS `City`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `City` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `City_id_country_87501c65_uniq` (`id`,`country`),
  KEY `City_country_a7824272_fk_Country_id` (`country`),
  CONSTRAINT `City_country_a7824272_fk_Country_id` FOREIGN KEY (`country`) REFERENCES `Country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `City`
--

LOCK TABLES `City` WRITE;
/*!40000 ALTER TABLE `City` DISABLE KEYS */;
INSERT INTO `City` VALUES (1,'Берлин',1),(2,'Баден-Баден',1),(3,'Дрезден',1),(4,'Милан',2),(5,'Флоренция',2),(6,'Рим',2),(7,'Мадрид',3),(8,'Малага',3),(9,'Валенсия',3),(10,'Любляна',4),(11,'Свети Влас',5);
/*!40000 ALTER TABLE `City` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Client`
--

DROP TABLE IF EXISTS `Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Client` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Client_id_status_fdb3ba5d_uniq` (`id`,`status`),
  KEY `Client_status_4fae9caa_fk_ClientStatus_id` (`status`),
  CONSTRAINT `Client_status_4fae9caa_fk_ClientStatus_id` FOREIGN KEY (`status`) REFERENCES `ClientStatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client`
--

LOCK TABLES `Client` WRITE;
/*!40000 ALTER TABLE `Client` DISABLE KEYS */;
INSERT INTO `Client` VALUES (1,'Вышегородцев С.И.','Вышегородцев Сергей Иванович','М',1),(2,'Смирнова Т.И.','Смирнова Татьяна Ивановка','Ж',1),(3,'Смотрила Е.В.','Смотрила Елена Владимировна','Ж',1),(4,'Гвоздев Р.Е.','Гвоздев Роман Евгеньевич','М',1),(5,'Шевченко Г.М.','Шевченко Георгий Михайлович','М',1),(6,'Ким Е.С.','Ким Евгений Славнович','М',1),(7,'Симонов В.Г.','Симонов Вячеслав Григорьевич','М',1),(8,'Довженко М.Г.','Довженко Михаил Григорьевич','М',1),(9,'Гусев В.Ф.','Гусев Владмир Федорович','М',1),(10,'Гусева Л.М.','Гусева Людмила Михайловна','Ж',1);
/*!40000 ALTER TABLE `Client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClientStatus`
--

DROP TABLE IF EXISTS `ClientStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ClientStatus` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClientStatus`
--

LOCK TABLES `ClientStatus` WRITE;
/*!40000 ALTER TABLE `ClientStatus` DISABLE KEYS */;
INSERT INTO `ClientStatus` VALUES (1,'Обычный',NULL),(2,'Привилегированный',NULL),(3,'VIP',NULL);
/*!40000 ALTER TABLE `ClientStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contract`
--

DROP TABLE IF EXISTS `Contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contract` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `creation_date` datetime(6) NOT NULL,
  `cost` decimal(9,2) NOT NULL,
  `currency` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Contract_currency_307f7e23_fk_Currency_id` (`currency`),
  CONSTRAINT `Contract_currency_307f7e23_fk_Currency_id` FOREIGN KEY (`currency`) REFERENCES `Currency` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contract`
--

LOCK TABLES `Contract` WRITE;
/*!40000 ALTER TABLE `Contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `Contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Country`
--

DROP TABLE IF EXISTS `Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Country` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Country`
--

LOCK TABLES `Country` WRITE;
/*!40000 ALTER TABLE `Country` DISABLE KEYS */;
INSERT INTO `Country` VALUES (1,'Германия'),(2,'Италия'),(3,'Испания'),(4,'Словения'),(5,'Болгария');
/*!40000 ALTER TABLE `Country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Currency`
--

DROP TABLE IF EXISTS `Currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Currency` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(5,2) NOT NULL,
  `update_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Currency`
--

LOCK TABLES `Currency` WRITE;
/*!40000 ALTER TABLE `Currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `Currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `photo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organization` bigint NOT NULL,
  `position` bigint NOT NULL,
  `user` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`),
  UNIQUE KEY `Employee_id_position_organization_968d78e2_uniq` (`id`,`position`,`organization`),
  KEY `Employee_organization_21e29660_fk_Organization_id` (`organization`),
  KEY `Employee_position_d2a25463_fk_Position_id` (`position`),
  CONSTRAINT `Employee_organization_21e29660_fk_Organization_id` FOREIGN KEY (`organization`) REFERENCES `Organization` (`id`),
  CONSTRAINT `Employee_position_d2a25463_fk_Position_id` FOREIGN KEY (`position`) REFERENCES `Position` (`id`),
  CONSTRAINT `Employee_user_983a9ecd_fk_auth_user_id` FOREIGN KEY (`user`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FeedingType`
--

DROP TABLE IF EXISTS `FeedingType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FeedingType` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FeedingType`
--

LOCK TABLES `FeedingType` WRITE;
/*!40000 ALTER TABLE `FeedingType` DISABLE KEYS */;
/*!40000 ALTER TABLE `FeedingType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hotel`
--

DROP TABLE IF EXISTS `Hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hotel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` bigint NOT NULL,
  `type` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Hotel_id_city_de5d8bb9_uniq` (`id`,`city`),
  KEY `Hotel_city_b398a426_fk_City_id` (`city`),
  KEY `Hotel_type_e3bad62d_fk_HotelType_id` (`type`),
  CONSTRAINT `Hotel_city_b398a426_fk_City_id` FOREIGN KEY (`city`) REFERENCES `City` (`id`),
  CONSTRAINT `Hotel_type_e3bad62d_fk_HotelType_id` FOREIGN KEY (`type`) REFERENCES `HotelType` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hotel`
--

LOCK TABLES `Hotel` WRITE;
/*!40000 ALTER TABLE `Hotel` DISABLE KEYS */;
INSERT INTO `Hotel` VALUES (1,'ECONTEL HOTEL Berlin***','Sömmeringstraße 24-Sömmeringstraße 24-26, Шарлоттенбург-Вильмерсдорф, 10589 Берлин, Германия',1,2),(2,'Leonardo Hotel Berlin***','Wilmersdorfer Str. 32, Шарлоттенбург-Вильмерсдорф, 10585 Берлин, Германия',1,2),(3,'Sheraton Berlin Grand Hotel Esplanade*****','Lützowufer 15, Митте, 10785 Берлин, Германия',1,4),(4,'Radisson Blu Badischer Hof Hotel','Lange Str. 47, 76530 Baden-Baden, Германия',2,3),(5,'Leonardo Royal Hotel Baden- Baden','Falkenstr. 2, 76530 Баден-Баден, Германия',2,3),(6,'Cityherberge','Lingnerallee 3, 01069 Дрезден, Германия',3,1),(7,'Holiday Inn Express Dresden City Centre','Dr-Kuelz Ring 15a, Старый город, 01067 Дрезден, Германия',3,2),(8,'Hotel Da Vinci','Via Senigallia 6, 20161 Милан, Италия',4,3),(9,'Hotel Berna','Via Napo Torriani 18, Центральный вокзал, 20124 Милан, Италия',4,3),(10,'Hotel Royal ','Via delle Ruote 52, 50129 Флоренция, Италия',5,2),(11,'Palazzo San Lorenzo','13 Borgo San Lorenzo, Сан-Лоренцо, 50123 Флоренция, Италия',5,5),(12,'Hotel Gabriella','Via Palestro 88, Вокзал Термини, 00185 Рим, Италия',6,2),(13,'Grand Hotel Plaza','Via del Corso 126, Спанья, 00186 Рим, Италия',6,4),(14,'Eurostars Madrid Tower','Castellana, 259B, Фуэнкарраль – Эль-Пардо, 28046 Мадрид, Испания',7,4),(15,'Holiday Inn Express Málaga Airport','Avenida de Velazquez 294, Exit 3B Road MA-21, Churriana, 29004 Малага, Испания',8,2),(16,'Hotel Valencia Center','Avenida de Francia, 33, Camins al Grau, 46023 Валенсия, Испания',9,3),(17,'City Hotel Ljubljana','Dalmatinova Street 15, 1000 Любляна, Словения',10,2),(18,'Urban Hotel','4 Štefanova ulica, 1000 Любляна, Словения',10,3),(19,'Комплекс Райский сад','Центральной дороги, 8250 Свети-Влас, Болгария',11,4);
/*!40000 ALTER TABLE `Hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HotelType`
--

DROP TABLE IF EXISTS `HotelType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HotelType` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelType`
--

LOCK TABLES `HotelType` WRITE;
/*!40000 ALTER TABLE `HotelType` DISABLE KEYS */;
INSERT INTO `HotelType` VALUES (1,'1',NULL),(2,'3',NULL),(3,'4',NULL),(4,'5',NULL),(5,'Апартаменты',NULL);
/*!40000 ALTER TABLE `HotelType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `InternationalPassport`
--

DROP TABLE IF EXISTS `InternationalPassport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `InternationalPassport` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `series` decimal(2,0) NOT NULL,
  `number` decimal(7,0) NOT NULL,
  `birth_date` date NOT NULL,
  `birth_place` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issue_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `authority` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client` (`client`),
  UNIQUE KEY `InternationalPassport_id_client_a73bd7a8_uniq` (`id`,`client`),
  CONSTRAINT `InternationalPassport_client_aa085ea0_fk_Client_id` FOREIGN KEY (`client`) REFERENCES `Client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InternationalPassport`
--

LOCK TABLES `InternationalPassport` WRITE;
/*!40000 ALTER TABLE `InternationalPassport` DISABLE KEYS */;
INSERT INTO `InternationalPassport` VALUES (1,51,9874563,'1977-12-02','Курск','2010-10-02','2020-10-01','УФМС',1),(2,51,1478529,'1980-05-25','Курск','2013-03-29','2023-03-28','УФМС',2),(3,51,2589631,'1998-09-28','Курск','2017-02-28','2027-02-27','УФМС',3),(4,71,3692581,'1966-05-20','Москва','2010-12-12','2020-12-11','УФМС',4),(5,71,8523691,'1961-07-12','Москва','2016-03-02','2026-03-01','УФМС',5),(6,71,1236542,'1996-03-15','Москва','2014-06-02','2019-06-01','УФМС',6),(7,71,7894562,'1995-11-18','Москва','2017-04-06','2027-04-05','УФМС',7),(8,49,9873215,'1987-09-14','Краснодар','2017-06-16','2027-06-15','УФМС',8),(9,49,2563214,'1988-04-25','Краснодар','2010-12-05','2020-12-04','УФМС',9),(10,49,3652365,'1989-04-22','Краснодар','2010-12-05','2020-12-04','УФМС',10);
/*!40000 ALTER TABLE `InternationalPassport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Organization`
--

DROP TABLE IF EXISTS `Organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Organization` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Organization`
--

LOCK TABLES `Organization` WRITE;
/*!40000 ALTER TABLE `Organization` DISABLE KEYS */;
INSERT INTO `Organization` VALUES (1,'Офис','Москва, Верхняя Красносельская улица 38/19с1','7(495)520-94-38',NULL),(2,'Филиал №1','Рязань, улица Маяковского, 115','7(4912)54-32-90',NULL),(3,'Филиал №2','Тула, улица Вересаева, 10А','7(4872)14-47-80',NULL);
/*!40000 ALTER TABLE `Organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Position`
--

DROP TABLE IF EXISTS `Position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Position` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `group` (`group`),
  CONSTRAINT `Position_group_5a2be28b_fk_auth_group_id` FOREIGN KEY (`group`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Position`
--

LOCK TABLES `Position` WRITE;
/*!40000 ALTER TABLE `Position` DISABLE KEYS */;
INSERT INTO `Position` VALUES (1,'Менеджер',NULL,1),(2,'Бухгалтер',NULL,2),(3,'Администратор',NULL,3),(4,'Агент',NULL,4);
/*!40000 ALTER TABLE `Position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PreliminaryAgreement`
--

DROP TABLE IF EXISTS `PreliminaryAgreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PreliminaryAgreement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `creation_date` datetime(6) NOT NULL,
  `trip_start` date NOT NULL,
  `trip_end` date NOT NULL,
  `client` bigint NOT NULL,
  `employee` bigint DEFAULT NULL,
  `organization` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PreliminaryAgreement_client_182240ad_fk_Client_id` (`client`),
  KEY `PreliminaryAgreement_employee_0c457aca_fk_Employee_id` (`employee`),
  KEY `PreliminaryAgreement_organization_816ec6b0_fk_Organization_id` (`organization`),
  CONSTRAINT `PreliminaryAgreement_client_182240ad_fk_Client_id` FOREIGN KEY (`client`) REFERENCES `Client` (`id`),
  CONSTRAINT `PreliminaryAgreement_employee_0c457aca_fk_Employee_id` FOREIGN KEY (`employee`) REFERENCES `Employee` (`id`),
  CONSTRAINT `PreliminaryAgreement_organization_816ec6b0_fk_Organization_id` FOREIGN KEY (`organization`) REFERENCES `Organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PreliminaryAgreement`
--

LOCK TABLES `PreliminaryAgreement` WRITE;
/*!40000 ALTER TABLE `PreliminaryAgreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `PreliminaryAgreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProcessStatus`
--

DROP TABLE IF EXISTS `ProcessStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProcessStatus` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProcessStatus`
--

LOCK TABLES `ProcessStatus` WRITE;
/*!40000 ALTER TABLE `ProcessStatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `ProcessStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RoomType`
--

DROP TABLE IF EXISTS `RoomType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RoomType` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RoomType`
--

LOCK TABLES `RoomType` WRITE;
/*!40000 ALTER TABLE `RoomType` DISABLE KEYS */;
/*!40000 ALTER TABLE `RoomType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TourHotel`
--

DROP TABLE IF EXISTS `TourHotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TourHotel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order` decimal(2,0) NOT NULL,
  `start_date` datetime(6) NOT NULL,
  `end_date` datetime(6) NOT NULL,
  `agreement` bigint NOT NULL,
  `feeding_type` bigint NOT NULL,
  `hotel` bigint NOT NULL,
  `room_type` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `TourHotel_id_agreement_hotel_28e2140f_uniq` (`id`,`agreement`,`hotel`),
  KEY `TourHotel_agreement_a7cc2514_fk_PreliminaryAgreement_id` (`agreement`),
  KEY `TourHotel_feeding_type_41e99a9a_fk_FeedingType_id` (`feeding_type`),
  KEY `TourHotel_hotel_e7ab05ee_fk_Hotel_id` (`hotel`),
  KEY `TourHotel_room_type_da400920_fk_RoomType_id` (`room_type`),
  CONSTRAINT `TourHotel_agreement_a7cc2514_fk_PreliminaryAgreement_id` FOREIGN KEY (`agreement`) REFERENCES `PreliminaryAgreement` (`id`),
  CONSTRAINT `TourHotel_feeding_type_41e99a9a_fk_FeedingType_id` FOREIGN KEY (`feeding_type`) REFERENCES `FeedingType` (`id`),
  CONSTRAINT `TourHotel_hotel_e7ab05ee_fk_Hotel_id` FOREIGN KEY (`hotel`) REFERENCES `Hotel` (`id`),
  CONSTRAINT `TourHotel_room_type_da400920_fk_RoomType_id` FOREIGN KEY (`room_type`) REFERENCES `RoomType` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TourHotel`
--

LOCK TABLES `TourHotel` WRITE;
/*!40000 ALTER TABLE `TourHotel` DISABLE KEYS */;
/*!40000 ALTER TABLE `TourHotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tourist`
--

DROP TABLE IF EXISTS `Tourist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tourist` (
  `contract` bigint NOT NULL,
  `client` bigint NOT NULL,
  PRIMARY KEY (`contract`),
  UNIQUE KEY `Tourist_contract_client_a3c00004_uniq` (`contract`,`client`),
  KEY `Tourist_client_88269bf8_fk_Client_id` (`client`),
  CONSTRAINT `Tourist_client_88269bf8_fk_Client_id` FOREIGN KEY (`client`) REFERENCES `Client` (`id`),
  CONSTRAINT `Tourist_contract_20e01fdc_fk_Contract_id` FOREIGN KEY (`contract`) REFERENCES `Contract` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tourist`
--

LOCK TABLES `Tourist` WRITE;
/*!40000 ALTER TABLE `Tourist` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tourist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'Accountant'),(3,'Administrator'),(4,'Agent'),(1,'Manager');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Чек',7,'add_bill'),(26,'Can change Чек',7,'change_bill'),(27,'Can delete Чек',7,'delete_bill'),(28,'Can view Чек',7,'view_bill'),(29,'Can add Город',8,'add_city'),(30,'Can change Город',8,'change_city'),(31,'Can delete Город',8,'delete_city'),(32,'Can view Город',8,'view_city'),(33,'Can add Клиент',9,'add_client'),(34,'Can change Клиент',9,'change_client'),(35,'Can delete Клиент',9,'delete_client'),(36,'Can view Клиент',9,'view_client'),(37,'Can add Статус Клиента',10,'add_clientstatus'),(38,'Can change Статус Клиента',10,'change_clientstatus'),(39,'Can delete Статус Клиента',10,'delete_clientstatus'),(40,'Can view Статус Клиента',10,'view_clientstatus'),(41,'Can add Страна',11,'add_country'),(42,'Can change Страна',11,'change_country'),(43,'Can delete Страна',11,'delete_country'),(44,'Can view Страна',11,'view_country'),(45,'Can add Валюта',12,'add_currency'),(46,'Can change Валюта',12,'change_currency'),(47,'Can delete Валюта',12,'delete_currency'),(48,'Can view Валюта',12,'view_currency'),(49,'Can add Сотрудник',13,'add_employee'),(50,'Can change Сотрудник',13,'change_employee'),(51,'Can delete Сотрудник',13,'delete_employee'),(52,'Can view Сотрудник',13,'view_employee'),(53,'Can add Тип Питания',14,'add_feedingtype'),(54,'Can change Тип Питания',14,'change_feedingtype'),(55,'Can delete Тип Питания',14,'delete_feedingtype'),(56,'Can view Тип Питания',14,'view_feedingtype'),(57,'Can add Тип Отеля',15,'add_hoteltype'),(58,'Can change Тип Отеля',15,'change_hoteltype'),(59,'Can delete Тип Отеля',15,'delete_hoteltype'),(60,'Can view Тип Отеля',15,'view_hoteltype'),(61,'Can add Организация',16,'add_organization'),(62,'Can change Организация',16,'change_organization'),(63,'Can delete Организация',16,'delete_organization'),(64,'Can view Организация',16,'view_organization'),(65,'Can add Предварительное Соглашение',17,'add_preliminaryagreement'),(66,'Can change Предварительное Соглашение',17,'change_preliminaryagreement'),(67,'Can delete Предварительное Соглашение',17,'delete_preliminaryagreement'),(68,'Can view Предварительное Соглашение',17,'view_preliminaryagreement'),(69,'Can add Статус Процесса',18,'add_processstatus'),(70,'Can change Статус Процесса',18,'change_processstatus'),(71,'Can delete Статус Процесса',18,'delete_processstatus'),(72,'Can view Статус Процесса',18,'view_processstatus'),(73,'Can add Тип Комнаты',19,'add_roomtype'),(74,'Can change Тип Комнаты',19,'change_roomtype'),(75,'Can delete Тип Комнаты',19,'delete_roomtype'),(76,'Can view Тип Комнаты',19,'view_roomtype'),(77,'Can add Должность',20,'add_position'),(78,'Can change Должность',20,'change_position'),(79,'Can delete Должность',20,'delete_position'),(80,'Can view Должность',20,'view_position'),(81,'Can add Отель',21,'add_hotel'),(82,'Can change Отель',21,'change_hotel'),(83,'Can delete Отель',21,'delete_hotel'),(84,'Can view Отель',21,'view_hotel'),(85,'Can add Договор',22,'add_contract'),(86,'Can change Договор',22,'change_contract'),(87,'Can delete Договор',22,'delete_contract'),(88,'Can view Договор',22,'view_contract'),(89,'Can add tour hotel',23,'add_tourhotel'),(90,'Can change tour hotel',23,'change_tourhotel'),(91,'Can delete tour hotel',23,'delete_tourhotel'),(92,'Can view tour hotel',23,'view_tourhotel'),(93,'Can add international passport',24,'add_internationalpassport'),(94,'Can change international passport',24,'change_internationalpassport'),(95,'Can delete international passport',24,'delete_internationalpassport'),(96,'Can view international passport',24,'view_internationalpassport'),(97,'Can add Бизнес процесс',25,'add_businessprocess'),(98,'Can change Бизнес процесс',25,'change_businessprocess'),(99,'Can delete Бизнес процесс',25,'delete_businessprocess'),(100,'Can view Бизнес процесс',25,'view_businessprocess'),(101,'Can add Турист',26,'add_tourist'),(102,'Can change Турист',26,'change_tourist'),(103,'Can delete Турист',26,'delete_tourist'),(104,'Can view Турист',26,'view_tourist');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$RHr18lS4HR3za18RlCptuR$UDVuEULodNmG57CfdfHFEZno9HllmwaUOdVVf8GPWXo=','2021-11-29 08:55:17.583041',1,'root','','','',1,1,'2021-11-29 08:36:02.377304'),(3,'UN2Lv9bW',NULL,0,'ZEwTY6zA','','','',0,1,'2021-11-29 11:45:11.000000'),(4,'b9zJc3Np',NULL,0,'x53wLVmQ','','','',0,1,'2021-11-29 11:45:11.000000'),(5,'Yf8UGjbZ',NULL,0,'tVM3j5Bg','','','',0,1,'2021-11-29 11:45:11.000000'),(6,'gmGx9vEN',NULL,0,'D9SMea4d','','','',0,1,'2021-11-29 11:45:11.000000'),(7,'yCzBYM4x',NULL,0,'CtMd7p2P','','','',0,1,'2021-11-29 11:45:11.000000'),(8,'rbe4YL2B',NULL,0,'nPszc6Wh','','','',0,1,'2021-11-29 11:45:11.000000'),(9,'Hjm6pZ3F',NULL,0,'FmfbC7N9','','','',0,1,'2021-11-29 11:45:11.000000'),(10,'tyM7Wswa',NULL,0,'uC38vsAQ','','','',0,1,'2021-11-29 11:45:11.000000'),(11,'cpnZg2Tu',NULL,0,'MAuUQ4sk','','','',0,1,'2021-11-29 11:45:11.000000'),(12,'gx5qV86B',NULL,0,'rz7tQsWF','','','',0,1,'2021-11-29 11:45:11.000000'),(13,'UNkRh4z5',NULL,0,'DUSKm5Mf','','','',0,1,'2021-11-29 11:45:11.000000'),(14,'QeuSB7dj',NULL,0,'nMTQDv9k','','','',0,1,'2021-11-29 11:45:11.000000'),(15,'wGku3sD6',NULL,0,'Jnj5XKP7','','','',0,1,'2021-11-29 11:45:11.000000'),(16,'fw4KU6Bq',NULL,0,'RANd4kcx','','','',0,1,'2021-11-29 11:45:11.000000'),(17,'nY59xAwc',NULL,0,'vD8MJdAX','','','',0,1,'2021-11-29 11:45:11.000000'),(18,'TqZAD62N',NULL,0,'UGP9v6hR','','','',0,1,'2021-11-29 11:45:11.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-11-29 08:41:32.991021','2','roblox',2,'[{\"changed\": {\"fields\": [\"password\"]}}]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'db','bill'),(25,'db','businessprocess'),(8,'db','city'),(9,'db','client'),(10,'db','clientstatus'),(22,'db','contract'),(11,'db','country'),(12,'db','currency'),(13,'db','employee'),(14,'db','feedingtype'),(21,'db','hotel'),(15,'db','hoteltype'),(24,'db','internationalpassport'),(16,'db','organization'),(20,'db','position'),(17,'db','preliminaryagreement'),(18,'db','processstatus'),(19,'db','roomtype'),(23,'db','tourhotel'),(26,'db','tourist'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-11-29 08:01:04.976610'),(2,'auth','0001_initial','2021-11-29 08:01:05.451756'),(3,'admin','0001_initial','2021-11-29 08:01:05.561890'),(4,'admin','0002_logentry_remove_auto_add','2021-11-29 08:01:05.569782'),(5,'admin','0003_logentry_add_action_flag_choices','2021-11-29 08:01:05.577770'),(6,'contenttypes','0002_remove_content_type_name','2021-11-29 08:01:05.654477'),(7,'auth','0002_alter_permission_name_max_length','2021-11-29 08:01:05.700899'),(8,'auth','0003_alter_user_email_max_length','2021-11-29 08:01:05.718688'),(9,'auth','0004_alter_user_username_opts','2021-11-29 08:01:05.725755'),(10,'auth','0005_alter_user_last_login_null','2021-11-29 08:01:05.767425'),(11,'auth','0006_require_contenttypes_0002','2021-11-29 08:01:05.772017'),(12,'auth','0007_alter_validators_add_error_messages','2021-11-29 08:01:05.778818'),(13,'auth','0008_alter_user_username_max_length','2021-11-29 08:01:05.824658'),(14,'auth','0009_alter_user_last_name_max_length','2021-11-29 08:01:05.872137'),(15,'auth','0010_alter_group_name_max_length','2021-11-29 08:01:05.887993'),(16,'auth','0011_update_proxy_permissions','2021-11-29 08:01:05.895274'),(17,'auth','0012_alter_user_first_name_max_length','2021-11-29 08:01:05.942619'),(18,'sessions','0001_initial','2021-11-29 08:01:05.974999'),(19,'db','0001_initial','2021-11-29 08:01:28.287876');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('a28w6qj6l6b3tapl8adu8da7m8gwylcq','.eJxVjMsOwiAQAP-FsyHyWKAevfsNze4CUjWQlPZk_HdD0oNeZybzFjPuW5n3ntZ5ieIilDj9MkJ-pjpEfGC9N8mtbutCciTysF3eWkyv69H-DQr2MrbJZbIMFgE0BUQ9MXOKTMYRYlDZ5QBowTMamPzZZ6VNdNYFHY334vMFCf04NA:1mrcRR:75zhfjb7Hx_jfp_1Q8l_uplQ0AGi8FE7LY76tVeQQj8','2021-12-13 08:55:17.586420');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-29 13:39:22
