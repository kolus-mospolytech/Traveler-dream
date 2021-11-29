-- MariaDB dump 10.19  Distrib 10.6.5-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: TravelerDream
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `Bill`
--

DROP TABLE IF EXISTS `Bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `creation_date` datetime NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `payed` tinyint NOT NULL DEFAULT '0',
  `payment_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bill`
--

LOCK TABLES `Bill` WRITE;
/*!40000 ALTER TABLE `Bill` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BirthCertificate`
--

DROP TABLE IF EXISTS `BirthCertificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BirthCertificate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client` int NOT NULL,
  `series` varchar(5) NOT NULL,
  `number` decimal(6,0) unsigned NOT NULL,
  `issue_date` date NOT NULL,
  `surname` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `patronymic` varchar(45) DEFAULT NULL,
  `birth_date` date NOT NULL,
  `birth_place` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`client`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `client_UNIQUE` (`client`),
  KEY `fk_BirthCertificate_Client1_idx` (`client`),
  CONSTRAINT `fk_BirthCertificate_Client1` FOREIGN KEY (`client`) REFERENCES `Client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BirthCertificate`
--

LOCK TABLES `BirthCertificate` WRITE;
/*!40000 ALTER TABLE `BirthCertificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `BirthCertificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BusinessProcess`
--

DROP TABLE IF EXISTS `BusinessProcess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BusinessProcess` (
  `id` int NOT NULL,
  `agreement` int NOT NULL,
  `status` int NOT NULL,
  `contract` int DEFAULT NULL,
  `bill` int DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `creation_date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`,`agreement`,`status`),
  KEY `fk_BusinessProcess_PreliminaryAgreement1_idx` (`agreement`),
  KEY `fk_BusinessProcess_Contract1_idx` (`contract`),
  KEY `fk_BusinessProcess_Bill1_idx` (`bill`),
  KEY `fk_BusinessProcess_ProcessStatus1_idx` (`status`),
  CONSTRAINT `fk_BusinessProcess_Bill1` FOREIGN KEY (`bill`) REFERENCES `Bill` (`id`),
  CONSTRAINT `fk_BusinessProcess_Contract1` FOREIGN KEY (`contract`) REFERENCES `Contract` (`id`),
  CONSTRAINT `fk_BusinessProcess_PreliminaryAgreement1` FOREIGN KEY (`agreement`) REFERENCES `PreliminaryAgreement` (`id`),
  CONSTRAINT `fk_BusinessProcess_ProcessStatus1` FOREIGN KEY (`status`) REFERENCES `ProcessStatus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `City` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country` int NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`country`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_City_Country1_idx` (`country`),
  CONSTRAINT `fk_City_Country1` FOREIGN KEY (`country`) REFERENCES `Country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `City`
--

LOCK TABLES `City` WRITE;
/*!40000 ALTER TABLE `City` DISABLE KEYS */;
INSERT INTO `City` VALUES (1,1,'Берлин'),(2,1,'Баден-Баден'),(3,1,'Дрезден'),(4,2,'Милан'),(5,2,'Флоренция'),(6,2,'Рим'),(7,3,'Мадрид'),(8,3,'Малага'),(9,3,'Валенсия'),(10,4,'Любляна'),(11,5,'Свети Влас');
/*!40000 ALTER TABLE `City` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Client`
--

DROP TABLE IF EXISTS `Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `sex` enum('М','Ж') NOT NULL,
  `birth_date` date NOT NULL,
  `birth_place` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`status`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_Client_Status1_idx` (`status`),
  CONSTRAINT `fk_Client_Status1` FOREIGN KEY (`status`) REFERENCES `ClientStatus` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client`
--

LOCK TABLES `Client` WRITE;
/*!40000 ALTER TABLE `Client` DISABLE KEYS */;
INSERT INTO `Client` VALUES (1,1,'Вышегородцев С.И.','Вышегородцев Сергей Иванович','М','1977-12-02','Курск'),(2,1,'Смирнова Т.И.','Смирнова Татьяна Ивановка','Ж','1980-05-25','Курск'),(3,1,'Смотрила Е.В.','Смотрила Елена Владимировна','Ж','1998-09-28','Курск'),(4,1,'Гвоздев Р.Е.','Гвоздев Роман Евгеньевич','М','1966-05-20','Москва'),(5,1,'Шевченко Г.М.','Шевченко Георгий Михайлович','М','1961-07-12','Москва'),(6,1,'Ким Е.С.','Ким Евгений Славнович','М','1996-03-15','Москва'),(7,1,'Симонов В.Г.','Симонов Вячеслав Григорьевич','М','1995-11-18','Москва'),(8,1,'Довженко М.Г.','Довженко Михаил Григорьевич','М','1987-09-14','Краснодар'),(9,1,'Гусев В.Ф.','Гусев Владмир Федорович','М','1988-04-25','Краснодар'),(10,1,'Гусева Л.М.','Гусева Людмила Михайловна','Ж','1989-04-22','Краснодар');
/*!40000 ALTER TABLE `Client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClientStatus`
--

DROP TABLE IF EXISTS `ClientStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClientStatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contract` (
  `id` int NOT NULL AUTO_INCREMENT,
  `currency` int NOT NULL,
  `creation_date` datetime NOT NULL,
  `cost` decimal(9,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_Contract_Currency1_idx` (`currency`),
  CONSTRAINT `fk_Contract_Currency1` FOREIGN KEY (`currency`) REFERENCES `Currency` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Country` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Currency` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `code` varchar(3) NOT NULL,
  `rate` decimal(5,2) NOT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `position` int NOT NULL,
  `organization` int NOT NULL,
  `login` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(45) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `sex` enum('М','Ж') NOT NULL,
  `birth_date` date NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`position`,`organization`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `login_UNIQUE` (`login`),
  KEY `fk_Employee_Position_idx` (`position`),
  KEY `fk_Employee_Organization1_idx` (`organization`),
  CONSTRAINT `fk_Employee_Organization1` FOREIGN KEY (`organization`) REFERENCES `Organization` (`id`),
  CONSTRAINT `fk_Employee_Position` FOREIGN KEY (`position`) REFERENCES `Position` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,1,1,'ZEwTY6zA','UN2Lv9bW','Иванов А.А.','Иванов Александр Александрович','М','1961-11-01',NULL),(2,1,1,'x53wLVmQ','b9zJc3Np','Сидоров К.Л.','Сидоров Константин Леонидович','М','1984-11-20',NULL),(3,2,1,'tVM3j5Bg','Yf8UGjbZ','Федорова М.И.','Федорова Мария Ивановна','Ж','1992-07-23',NULL),(4,3,1,'D9SMea4d','gmGx9vEN','Константинов А.Л. ','Константинов Артем Леонидович','М','1986-01-10',NULL),(5,1,2,'CtMd7p2P','yCzBYM4x','Романенко И.С.','Романенко Ирина Сергеевна','Ж','1979-05-25',NULL),(6,2,2,'nPszc6Wh','rbe4YL2B','Зоммер Г. Я.','Зоммер Генрих Янович','М','2000-02-12',NULL),(7,3,2,'FmfbC7N9','Hjm6pZ3F','Николаев С.С.','Николаев Сергей Сергеевич','М','1980-05-01',NULL),(8,1,3,'uC38vsAQ','tyM7Wswa','Филатов И.В.','Филатов Игорь Владимирович','М','1983-05-02',NULL),(9,2,3,'MAuUQ4sk','cpnZg2Tu','Крохин М. И.','Крохин Михаил Измайлович','М','2000-10-12',NULL),(10,4,3,'rz7tQsWF','gx5qV86B','Петров','Петров Роман Семенович','М','1965-11-01',NULL),(11,4,3,'DUSKm5Mf','UNkRh4z5','Одинцова В. И.','Одинцова Варвара Ивановна','Ж','1980-11-07',NULL),(12,4,1,'nMTQDv9k','QeuSB7dj','Ливидников К. С.','Ливидников Константин Сергеевич','М','1992-10-23',NULL),(13,4,2,'Jnj5XKP7','wGku3sD6','Липко Г. Г.','Липко Галина Григорьевна','Ж','1983-07-10',NULL),(14,4,2,'RANd4kcx','fw4KU6Bq','Броншнейн А. М.','Броншнейн Александр Михайлович','М','1979-05-11',NULL),(15,4,2,'vD8MJdAX','nY59xAwc','Виценко А. А.','Виценко Анатолий Анатольевич','М','2000-12-12',NULL),(16,4,2,'UGP9v6hR','TqZAD62N','Виценко М. А.','Виценко Маргарита Александровна','Ж','1998-06-01',NULL);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FeedingType`
--

DROP TABLE IF EXISTS `FeedingType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FeedingType` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hotel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city` int NOT NULL,
  `type` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`city`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_Hotel_City1_idx` (`city`),
  KEY `fk_Hotel_HotelType1_idx` (`type`),
  CONSTRAINT `fk_Hotel_City1` FOREIGN KEY (`city`) REFERENCES `City` (`id`),
  CONSTRAINT `fk_Hotel_HotelType1` FOREIGN KEY (`type`) REFERENCES `HotelType` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hotel`
--

LOCK TABLES `Hotel` WRITE;
/*!40000 ALTER TABLE `Hotel` DISABLE KEYS */;
INSERT INTO `Hotel` VALUES (1,1,2,'ECONTEL HOTEL Berlin***','Sömmeringstraße 24-Sömmeringstraße 24-26, Шарлоттенбург-Вильмерсдорф, 10589 Берлин, Германия'),(2,1,2,'Leonardo Hotel Berlin***','Wilmersdorfer Str. 32, Шарлоттенбург-Вильмерсдорф, 10585 Берлин, Германия'),(3,1,4,'Sheraton Berlin Grand Hotel Esplanade*****','Lützowufer 15, Митте, 10785 Берлин, Германия'),(4,2,3,'Radisson Blu Badischer Hof Hotel','Lange Str. 47, 76530 Baden-Baden, Германия'),(5,2,3,'Leonardo Royal Hotel Baden- Baden','Falkenstr. 2, 76530 Баден-Баден, Германия'),(6,3,1,'Cityherberge','Lingnerallee 3, 01069 Дрезден, Германия'),(7,3,2,'Holiday Inn Express Dresden City Centre','Dr-Kuelz Ring 15a, Старый город, 01067 Дрезден, Германия'),(8,4,3,'Hotel Da Vinci','Via Senigallia 6, 20161 Милан, Италия'),(9,4,3,'Hotel Berna','Via Napo Torriani 18, Центральный вокзал, 20124 Милан, Италия'),(10,5,2,'Hotel Royal ','Via delle Ruote 52, 50129 Флоренция, Италия'),(11,5,5,'Palazzo San Lorenzo','13 Borgo San Lorenzo, Сан-Лоренцо, 50123 Флоренция, Италия'),(12,6,2,'Hotel Gabriella','Via Palestro 88, Вокзал Термини, 00185 Рим, Италия'),(13,6,4,'Grand Hotel Plaza','Via del Corso 126, Спанья, 00186 Рим, Италия'),(14,7,4,'Eurostars Madrid Tower','Castellana, 259B, Фуэнкарраль – Эль-Пардо, 28046 Мадрид, Испания'),(15,8,2,'Holiday Inn Express Málaga Airport','Avenida de Velazquez 294, Exit 3B Road MA-21, Churriana, 29004 Малага, Испания'),(16,9,3,'Hotel Valencia Center','Avenida de Francia, 33, Camins al Grau, 46023 Валенсия, Испания'),(17,10,2,'City Hotel Ljubljana','Dalmatinova Street 15, 1000 Любляна, Словения'),(18,10,3,'Urban Hotel','4 Štefanova ulica, 1000 Любляна, Словения'),(19,11,4,'Комплекс Райский сад','Центральной дороги, 8250 Свети-Влас, Болгария');
/*!40000 ALTER TABLE `Hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HotelType`
--

DROP TABLE IF EXISTS `HotelType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HotelType` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `InternationalPassport` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client` int NOT NULL,
  `type` varchar(3) NOT NULL,
  `state` varchar(3) NOT NULL,
  `series` decimal(2,0) unsigned NOT NULL,
  `number` decimal(7,0) unsigned NOT NULL,
  `surname` varchar(45) NOT NULL,
  `given_name` varchar(45) NOT NULL,
  `nationality` varchar(45) NOT NULL,
  `birth_date` date NOT NULL,
  `sex` enum('М','Ж') NOT NULL,
  `birth_place` varchar(45) NOT NULL,
  `issue_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `authority` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`client`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `client_UNIQUE` (`client`),
  KEY `fk_InternationalPassport_Client1_idx` (`client`),
  CONSTRAINT `fk_InternationalPassport_Client1` FOREIGN KEY (`client`) REFERENCES `Client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `InternationalPassport`
--

LOCK TABLES `InternationalPassport` WRITE;
/*!40000 ALTER TABLE `InternationalPassport` DISABLE KEYS */;
INSERT INTO `InternationalPassport` VALUES (1,1,'P','RUS',51,9874563,'Вышегородцев','Сергей','Российская Федерация','1977-12-02','М','Курск','2010-10-02','2020-10-01','УФМС'),(2,2,'P','RUS',51,1478529,'Смирнова','Татьяна','Российская Федерация','1980-05-25','Ж','Курск','2013-03-29','2023-03-28','УФМС'),(3,3,'P','RUS',51,2589631,'Смотрила','Елена','Российская Федерация','1998-09-28','Ж','Курск','2017-02-28','2027-02-27','УФМС'),(4,4,'P','RUS',71,3692581,'Гвоздев','Роман','Российская Федерация','1966-05-20','М','Москва','2010-12-12','2020-12-11','УФМС'),(5,5,'P','RUS',71,8523691,'Шевченко','Георгий','Российская Федерация','1961-07-12','М','Москва','2016-03-02','2026-03-01','УФМС'),(6,6,'P','RUS',71,1236542,'Ким','Евгений','Российская Федерация','1996-03-15','М','Москва','2014-06-02','2019-06-01','УФМС'),(7,7,'P','RUS',71,7894562,'Симонов','Вячеслав','Российская Федерация','1995-11-18','М','Москва','2017-04-06','2027-04-05','УФМС'),(8,8,'P','RUS',49,9873215,'Довженко','Михаил','Российская Федерация','1987-09-14','М','Краснодар','2017-06-16','2027-06-15','УФМС'),(9,9,'P','RUS',49,2563214,'Гусев','Владмир','Российская Федерация','1988-04-25','М','Краснодар','2010-12-05','2020-12-04','УФМС'),(10,10,'P','RUS',49,3652365,'Гусева','Людмила','Российская Федерация','1989-04-22','Ж','Краснодар','2010-12-05','2020-12-04','УФМС');
/*!40000 ALTER TABLE `InternationalPassport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Organization`
--

DROP TABLE IF EXISTS `Organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Organization` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `mail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
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
-- Table structure for table `Passport`
--

DROP TABLE IF EXISTS `Passport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Passport` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client` int NOT NULL,
  `series` decimal(4,0) unsigned NOT NULL,
  `number` decimal(6,0) unsigned NOT NULL,
  `authority` varchar(255) NOT NULL,
  `issue_date` date NOT NULL,
  `authority_code` decimal(6,0) unsigned NOT NULL,
  `surname` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `patronymic` varchar(45) DEFAULT NULL,
  `sex` enum('М','Ж') NOT NULL,
  `birth_date` date NOT NULL,
  `birth_place` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`client`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `client_UNIQUE` (`client`),
  KEY `fk_Passport_Client1_idx` (`client`),
  CONSTRAINT `fk_Passport_Client1` FOREIGN KEY (`client`) REFERENCES `Client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Passport`
--

LOCK TABLES `Passport` WRITE;
/*!40000 ALTER TABLE `Passport` DISABLE KEYS */;
/*!40000 ALTER TABLE `Passport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Position`
--

DROP TABLE IF EXISTS `Position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Position` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Position`
--

LOCK TABLES `Position` WRITE;
/*!40000 ALTER TABLE `Position` DISABLE KEYS */;
INSERT INTO `Position` VALUES (1,'Менеджер',NULL),(2,'Бухгалтер',NULL),(3,'Администратор',NULL),(4,'Агент',NULL);
/*!40000 ALTER TABLE `Position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PreliminaryAgreement`
--

DROP TABLE IF EXISTS `PreliminaryAgreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PreliminaryAgreement` (
  `id` int NOT NULL,
  `organization` int NOT NULL,
  `employee` int DEFAULT NULL,
  `client` int NOT NULL,
  `creation_date` datetime NOT NULL,
  `trip_start` date NOT NULL,
  `trip_end` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_PreliminaryAgreement_Organization1_idx` (`organization`),
  KEY `fk_PreliminaryAgreement_Employee1_idx` (`employee`),
  KEY `fk_PreliminaryAgreement_Client1_idx` (`client`),
  CONSTRAINT `fk_PreliminaryAgreement_Client1` FOREIGN KEY (`client`) REFERENCES `Client` (`id`),
  CONSTRAINT `fk_PreliminaryAgreement_Employee1` FOREIGN KEY (`employee`) REFERENCES `Employee` (`id`),
  CONSTRAINT `fk_PreliminaryAgreement_Organization1` FOREIGN KEY (`organization`) REFERENCES `Organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ProcessStatus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RoomType` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TourHotel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `agreement` int NOT NULL,
  `hotel` int NOT NULL,
  `room_type` int NOT NULL,
  `feeding_type` int NOT NULL,
  `order` decimal(2,0) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`id`,`agreement`,`hotel`),
  UNIQUE KEY `TourHotelcol_UNIQUE` (`id`),
  KEY `fk_TourHotel_PreliminaryAgreement1_idx` (`agreement`),
  KEY `fk_TourHotel_Hotel1_idx` (`hotel`),
  KEY `fk_TourHotel_RoomType1_idx` (`room_type`),
  KEY `fk_TourHotel_FeedingType1_idx` (`feeding_type`),
  CONSTRAINT `fk_TourHotel_FeedingType1` FOREIGN KEY (`feeding_type`) REFERENCES `FeedingType` (`id`),
  CONSTRAINT `fk_TourHotel_Hotel1` FOREIGN KEY (`hotel`) REFERENCES `Hotel` (`id`),
  CONSTRAINT `fk_TourHotel_PreliminaryAgreement1` FOREIGN KEY (`agreement`) REFERENCES `PreliminaryAgreement` (`id`),
  CONSTRAINT `fk_TourHotel_RoomType1` FOREIGN KEY (`room_type`) REFERENCES `RoomType` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tourist` (
  `contract` int NOT NULL,
  `client` int NOT NULL,
  PRIMARY KEY (`contract`,`client`),
  KEY `fk_Tourist_Client1_idx` (`client`),
  CONSTRAINT `fk_Tourist_Client1` FOREIGN KEY (`client`) REFERENCES `Client` (`id`),
  CONSTRAINT `fk_Tourist_Contract1` FOREIGN KEY (`contract`) REFERENCES `Contract` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tourist`
--

LOCK TABLES `Tourist` WRITE;
/*!40000 ALTER TABLE `Tourist` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tourist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-20  2:16:05
