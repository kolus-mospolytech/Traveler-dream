-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dev
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group`
    DISABLE KEYS */;
INSERT INTO `auth_group`
VALUES (1, 'Manager'),
       (2, 'Accountant'),
       (3, 'Administrator'),
       (4, 'Agent');
/*!40000 ALTER TABLE `auth_group`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_bill`
--

LOCK TABLES `db_bill` WRITE;
/*!40000 ALTER TABLE `db_bill`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `db_bill`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_businessprocess`
--

LOCK TABLES `db_businessprocess` WRITE;
/*!40000 ALTER TABLE `db_businessprocess`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `db_businessprocess`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_city`
--

LOCK TABLES `db_city` WRITE;
/*!40000 ALTER TABLE `db_city`
    DISABLE KEYS */;
INSERT INTO `db_city`
VALUES (1, 'Берлин', 1),
       (2, 'Баден-Баден', 1),
       (3, 'Дрезден', 1),
       (4, 'Милан', 2),
       (5, 'Флоренция', 2),
       (6, 'Рим', 2),
       (7, 'Мадрид', 3),
       (8, 'Малага', 3),
       (9, 'Валенсия', 3),
       (10, 'Любляна', 4),
       (11, 'Свети Влас', 5);
/*!40000 ALTER TABLE `db_city`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_client`
--

LOCK TABLES `db_client` WRITE;
/*!40000 ALTER TABLE `db_client`
    DISABLE KEYS */;
INSERT INTO `db_client`
VALUES (1, 'Вышегородцев С.И.', 'Вышегородцев Сергей Иванович', 'Мужчина', 1),
       (2, 'Смирнова Т.И.', 'Смирнова Татьяна Ивановка', 'Женщина', 1),
       (3, 'Смотрила Е.В.', 'Смотрила Елена Владимировна', 'Женщина', 1),
       (4, 'Гвоздев Р.Е.', 'Гвоздев Роман Евгеньевич', 'Мужчина', 1),
       (5, 'Шевченко Г.М.', 'Шевченко Георгий Михайлович', 'Мужчина', 1),
       (6, 'Ким Е.С.', 'Ким Евгений Славнович', 'Мужчина', 1),
       (7, 'Симонов В.Г.', 'Симонов Вячеслав Григорьевич', 'Мужчина', 1),
       (8, 'Довженко М.Г.', 'Довженко Михаил Григорьевич', 'Мужчина', 1),
       (9, 'Гусев В.Ф.', 'Гусев Владмир Федорович', 'Мужчина', 1),
       (10, 'Гусева Л.М.', 'Гусева Людмила Михайловна', 'Женщина', 1);
/*!40000 ALTER TABLE `db_client`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_clientstatus`
--

LOCK TABLES `db_clientstatus` WRITE;
/*!40000 ALTER TABLE `db_clientstatus`
    DISABLE KEYS */;
INSERT INTO `db_clientstatus`
VALUES (1, 'Обычный', NULL),
       (2, 'Привилегированный', NULL),
       (3, 'VIP', NULL);
/*!40000 ALTER TABLE `db_clientstatus`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_contract`
--

LOCK TABLES `db_contract` WRITE;
/*!40000 ALTER TABLE `db_contract`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `db_contract`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_country`
--

LOCK TABLES `db_country` WRITE;
/*!40000 ALTER TABLE `db_country`
    DISABLE KEYS */;
INSERT INTO `db_country`
VALUES (1, 'Германия'),
       (2, 'Италия'),
       (3, 'Испания'),
       (4, 'Словения'),
       (5, 'Болгария');
/*!40000 ALTER TABLE `db_country`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_currency`
--

LOCK TABLES `db_currency` WRITE;
/*!40000 ALTER TABLE `db_currency`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `db_currency`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_employee`
--

LOCK TABLES `db_employee` WRITE;
/*!40000 ALTER TABLE `db_employee`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `db_employee`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_employee_groups`
--

LOCK TABLES `db_employee_groups` WRITE;
/*!40000 ALTER TABLE `db_employee_groups`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `db_employee_groups`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_employee_user_permissions`
--

LOCK TABLES `db_employee_user_permissions` WRITE;
/*!40000 ALTER TABLE `db_employee_user_permissions`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `db_employee_user_permissions`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_feedingtype`
--

LOCK TABLES `db_feedingtype` WRITE;
/*!40000 ALTER TABLE `db_feedingtype`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `db_feedingtype`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_hotel`
--

LOCK TABLES `db_hotel` WRITE;
/*!40000 ALTER TABLE `db_hotel`
    DISABLE KEYS */;
INSERT INTO `db_hotel`
VALUES (1, 'ECONTEL HOTEL Berlin***',
        'Sömmeringstraße 24-Sömmeringstraße 24-26, Шарлоттенбург-Вильмерсдорф, 10589 Берлин, Германия', 1, 2),
       (2, 'Leonardo Hotel Berlin***', 'Wilmersdorfer Str. 32, Шарлоттенбург-Вильмерсдорф, 10585 Берлин, Германия', 1,
        2),
       (3, 'Sheraton Berlin Grand Hotel Esplanade*****', 'Lützowufer 15, Митте, 10785 Берлин, Германия', 1, 4),
       (4, 'Radisson Blu Badischer Hof Hotel', 'Lange Str. 47, 76530 Baden-Baden, Германия', 2, 3),
       (5, 'Leonardo Royal Hotel Baden- Baden', 'Falkenstr. 2, 76530 Баден-Баден, Германия', 2, 3),
       (6, 'Cityherberge', 'Lingnerallee 3, 01069 Дрезден, Германия', 3, 1),
       (7, 'Holiday Inn Express Dresden City Centre', 'Dr-Kuelz Ring 15a, Старый город, 01067 Дрезден, Германия', 3, 2),
       (8, 'Hotel Da Vinci', 'Via Senigallia 6, 20161 Милан, Италия', 4, 3),
       (9, 'Hotel Berna', 'Via Napo Torriani 18, Центральный вокзал, 20124 Милан, Италия', 4, 3),
       (10, 'Hotel Royal ', 'Via delle Ruote 52, 50129 Флоренция, Италия', 5, 2),
       (11, 'Palazzo San Lorenzo', '13 Borgo San Lorenzo, Сан-Лоренцо, 50123 Флоренция, Италия', 5, 5),
       (12, 'Hotel Gabriella', 'Via Palestro 88, Вокзал Термини, 00185 Рим, Италия', 6, 2),
       (13, 'Grand Hotel Plaza', 'Via del Corso 126, Спанья, 00186 Рим, Италия', 6, 4),
       (14, 'Eurostars Madrid Tower', 'Castellana, 259B, Фуэнкарраль – Эль-Пардо, 28046 Мадрид, Испания', 7, 4),
       (15, 'Holiday Inn Express Málaga Airport',
        'Avenida de Velazquez 294, Exit 3B Road MA-21, Churriana, 29004 Малага, Испания', 8, 2),
       (16, 'Hotel Valencia Center', 'Avenida de Francia, 33, Camins al Grau, 46023 Валенсия, Испания', 9, 3),
       (17, 'City Hotel Ljubljana', 'Dalmatinova Street 15, 1000 Любляна, Словения', 10, 2),
       (18, 'Urban Hotel', '4 Štefanova ulica, 1000 Любляна, Словения', 10, 3),
       (19, 'Комплекс Райский сад', 'Центральной дороги, 8250 Свети-Влас, Болгария', 11, 4);
/*!40000 ALTER TABLE `db_hotel`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_hoteltype`
--

LOCK TABLES `db_hoteltype` WRITE;
/*!40000 ALTER TABLE `db_hoteltype`
    DISABLE KEYS */;
INSERT INTO `db_hoteltype`
VALUES (1, '1', NULL),
       (2, '3', NULL),
       (3, '4', NULL),
       (4, '5', NULL),
       (5, 'Апартаменты', NULL);
/*!40000 ALTER TABLE `db_hoteltype`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_internationalpassport`
--

LOCK TABLES `db_internationalpassport` WRITE;
/*!40000 ALTER TABLE `db_internationalpassport`
    DISABLE KEYS */;
INSERT INTO `db_internationalpassport`
VALUES (1, 51, 9874563, '1977-12-02', 'Курск', '2010-10-02', '2020-10-01', 'УФМС', 1),
       (2, 51, 1478529, '1980-05-25', 'Курск', '2013-03-29', '2023-03-28', 'УФМС', 2),
       (3, 51, 2589631, '1998-09-28', 'Курск', '2017-02-28', '2027-02-27', 'УФМС', 3),
       (4, 71, 3692581, '1966-05-20', 'Москва', '2010-12-12', '2020-12-11', 'УФМС', 4),
       (5, 71, 8523691, '1961-07-12', 'Москва', '2016-03-02', '2026-03-01', 'УФМС', 5),
       (6, 71, 1236542, '1996-03-15', 'Москва', '2014-06-02', '2019-06-01', 'УФМС', 6),
       (7, 71, 7894562, '1995-11-18', 'Москва', '2017-04-06', '2027-04-05', 'УФМС', 7),
       (8, 49, 9873215, '1987-09-14', 'Краснодар', '2017-06-16', '2027-06-15', 'УФМС', 8),
       (9, 49, 2563214, '1988-04-25', 'Краснодар', '2010-12-05', '2020-12-04', 'УФМС', 9),
       (10, 49, 3652365, '1989-04-22', 'Краснодар', '2010-12-05', '2020-12-04', 'УФМС', 10);
/*!40000 ALTER TABLE `db_internationalpassport`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_organization`
--

LOCK TABLES `db_organization` WRITE;
/*!40000 ALTER TABLE `db_organization`
    DISABLE KEYS */;
INSERT INTO `db_organization`
VALUES (1, 'Офис', 'Москва, Верхняя Красносельская улица 38/19с1', '7(495)520-94-38', NULL),
       (2, 'Филиал №1', 'Рязань, улица Маяковского, 115', '7(4912)54-32-90', NULL),
       (3, 'Филиал №2', 'Тула, улица Вересаева, 10А', '7(4872)14-47-80', NULL);
/*!40000 ALTER TABLE `db_organization`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_preliminaryagreement`
--

LOCK TABLES `db_preliminaryagreement` WRITE;
/*!40000 ALTER TABLE `db_preliminaryagreement`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `db_preliminaryagreement`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_processstatus`
--

LOCK TABLES `db_processstatus` WRITE;
/*!40000 ALTER TABLE `db_processstatus`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `db_processstatus`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_roomtype`
--

LOCK TABLES `db_roomtype` WRITE;
/*!40000 ALTER TABLE `db_roomtype`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `db_roomtype`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_tourhotel`
--

LOCK TABLES `db_tourhotel` WRITE;
/*!40000 ALTER TABLE `db_tourhotel`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `db_tourhotel`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_tourist`
--

LOCK TABLES `db_tourist` WRITE;
/*!40000 ALTER TABLE `db_tourist`
    DISABLE KEYS */;
/*!40000 ALTER TABLE `db_tourist`
    ENABLE KEYS */;
UNLOCK TABLES;

/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2021-11-30 19:16:29
