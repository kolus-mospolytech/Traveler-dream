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
VALUES (4, 'Агент'),
       (3, 'Администратор'),
       (2, 'Бухгалтер'),
       (1, 'Менеджер');
/*!40000 ALTER TABLE `auth_group`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `stuff_position`
--

LOCK TABLES `stuff_position` WRITE;
/*!40000 ALTER TABLE `stuff_position`
    DISABLE KEYS */;
INSERT INTO `stuff_position`
VALUES (4, 'Агент'),
       (3, 'Администратор'),
       (2, 'Бухгалтер'),
       (1, 'Менеджер');
/*!40000 ALTER TABLE `stuff_position`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_bill`
--

# LOCK TABLES `db_bill` WRITE;
# /*!40000 ALTER TABLE `db_bill`
#     DISABLE KEYS */;
# /*!40000 ALTER TABLE `db_bill`
#     ENABLE KEYS */;
# UNLOCK TABLES;

--
-- Dumping data for table `db_businessprocess`
--

# LOCK TABLES `db_businessprocess` WRITE;
# /*!40000 ALTER TABLE `db_businessprocess`
#     DISABLE KEYS */;
# /*!40000 ALTER TABLE `db_businessprocess`
#     ENABLE KEYS */;
# UNLOCK TABLES;

--
-- Dumping data for table `hotels_city`
--

LOCK TABLES `hotels_city` WRITE;
/*!40000 ALTER TABLE `hotels_city`
    DISABLE KEYS */;
INSERT INTO `hotels_city`
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
/*!40000 ALTER TABLE `hotels_city`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `clients_client`
--

LOCK TABLES `clients_client` WRITE;
/*!40000 ALTER TABLE `clients_client`
    DISABLE KEYS */;
INSERT INTO `clients_client`
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
/*!40000 ALTER TABLE `clients_client`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `clients_status`
--

LOCK TABLES `clients_status` WRITE;
/*!40000 ALTER TABLE `clients_status`
    DISABLE KEYS */;
INSERT INTO `clients_status`
VALUES (1, 'Обычный', NULL),
       (2, 'Привилегированный', NULL),
       (3, 'VIP', NULL);
/*!40000 ALTER TABLE `clients_status`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_contract`
--

# LOCK TABLES `db_contract` WRITE;
# /*!40000 ALTER TABLE `db_contract`
#     DISABLE KEYS */;
# /*!40000 ALTER TABLE `db_contract`
#     ENABLE KEYS */;
# UNLOCK TABLES;

--
-- Dumping data for table `hotels_country`
--

LOCK TABLES `hotels_country` WRITE;
/*!40000 ALTER TABLE `hotels_country`
    DISABLE KEYS */;
INSERT INTO `hotels_country`
VALUES (1, 'Германия'),
       (2, 'Италия'),
       (3, 'Испания'),
       (4, 'Словения'),
       (5, 'Болгария');
/*!40000 ALTER TABLE `hotels_country`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_currency`
--

# LOCK TABLES `db_currency` WRITE;
# /*!40000 ALTER TABLE `db_currency`
#     DISABLE KEYS */;
# /*!40000 ALTER TABLE `db_currency`
#     ENABLE KEYS */;
# UNLOCK TABLES;

--
-- Dumping data for table `db_employee`
--

LOCK TABLES `stuff_employee` WRITE;
/*!40000 ALTER TABLE `stuff_employee`
    DISABLE KEYS */;
INSERT INTO `stuff_employee`
VALUES (1, 'pbkdf2_sha256$260000$jFXMZ0d2GEGLLMWyCRjz5s$4tasx9w4wknxxAL51uVeZBn7KZYQm9sIS7MDncCJtdg=',
        '2021-12-07 13:15:53.847383', 1, 'root', 'Админов А.А.', 'Админов Админ Админович', 'Мужчина', '2021-12-06',
        'avatars/look.png', 1, 1, '2021-12-05 22:05:14.280086', 3, 1),
       (2, 'pbkdf2_sha256$260000$nuQvslQdfwcc352uiZRqLO$aFcDTocVUp7aVOhf8DpLMc+L6wyVgg15dbQ3S2qp8Cg=',
        '2021-12-07 13:15:31.485921', 0, 'ZEwTY6zA', 'Иванов А.А.', 'Иванов Александр Александрович', 'Мужчина',
        '1961-11-01', 'avatars/Фото_Иванов.jpg', 1, 1, '2021-12-06 01:29:43', 1, 1),
       (3, 'pbkdf2_sha256$260000$v68c1NBQUv2rZIg5hoLWqE$z+Mvjrql8aRHEUMC1yC0HRrGV2uKc3/BF2PBLzj2IXI=', null, 0,
        'x53wLVmQ', 'Сидоров К.Л.', 'Сидоров Константин Леонидович', 'Мужчина', '1984-11-20',
        'avatars/Фото_Сидоров.jpg', 1, 1, '2021-12-06 01:29:43', 1, 1),
       (4, 'pbkdf2_sha256$260000$NY4ty0YgnYp0eWStqEL2DI$esyLSxC0nDWghcmZrm+oUrLIFbS7AYIIYsoQXyR7Nr4=', null, 0,
        'tVM3j5Bg', 'Федорова М.И.', 'Федорова Мария Ивановна', 'Женщина', '1992-07-23', 'avatars/Фото_Федорова.jpg', 1,
        1, '2021-12-06 01:29:43', 2, 1),
       (5, 'pbkdf2_sha256$260000$gCL0FTnLTuA2OVDoYxvIh2$uPvBUG5S6/89SPE+8vzSaIidpyVurEdZF2jkFP/bxuc=', null, 0,
        'D9SMea4d', 'Константинов А.Л.', 'Константинов Артем Леонидович', 'Мужчина', '1986-01-10',
        'avatars/Фото_Константинов.jpg', 1, 1, '2021-12-06 01:29:43', 3, 1),
       (6, 'pbkdf2_sha256$260000$S2yUXxH85L1USMgbjlwIkv$uz9Oy8FbL8WdHamjpe84DWJThFzDvWfE5qezIAmtVLE=', null, 0,
        'CtMd7p2P', 'Романенко И.С.', 'Романенко Ирина Сергеевна', 'Женщина', '1979-05-25', '', 1, 1,
        '2021-12-06 01:29:43', 1, 2),
       (7, 'pbkdf2_sha256$260000$snxSVomma8TSL0WwVPkw5b$mT2R2xusL1q1vm9Bnx3ZpEse9O9/WkSQei86rR/mEIs=',
        '2021-12-06 09:02:20.063172', 0, 'nPszc6Wh', 'Зоммер Г. Я.', 'Зоммер Генрих Янович', 'Мужчина', '2000-02-12',
        '', 1, 1, '2021-12-06 01:29:43', 2, 2),
       (8, 'pbkdf2_sha256$260000$iLuQ6aL2nVlsNuxSjlRS7d$JuvHalilx6zidrwSc/wxZBQY6msULNYLAuiyBZImauU=', null, 0,
        'FmfbC7N9', 'Николаев С.С.', 'Николаев Сергей Сергеевич', 'Мужчина', '1980-05-01', '', 1, 1,
        '2021-12-06 01:29:43', 3, 2),
       (9, 'pbkdf2_sha256$260000$UL05OyswFmvjnHNVuKTJS6$allrTtFOEmeUp/3st+7fC+rP/M5wICpHEnwTr83NiMw=', null, 0,
        'uC38vsAQ', 'Филатов И.В.', 'Филатов Игорь Владимирович', 'Мужчина', '1983-05-02', '', 1, 1,
        '2021-12-06 01:29:43', 1, 3),
       (10, 'pbkdf2_sha256$260000$tRXh66yinC06oKmwSbOTAk$9E2v0p+RS8n3ukrJVuBf1eL5re5bJN/vTLKtAD14Kl0=', null, 0,
        'MAuUQ4sk', 'Крохин М. И.', 'Крохин Михаил Измайлович', 'Мужчина', '2000-10-12', '', 1, 1,
        '2021-12-06 01:29:43', 2, 3),
       (11, 'pbkdf2_sha256$260000$lKzKzC6hlPk74JTajMKhAE$M4EXXd6exgDz3TLkvP7J7KFHItcRgjFFd8lHxDF547Q=', null, 0,
        'rz7tQsWF', 'Петров Р. С.', 'Петров Роман Семенович', 'Мужчина', '1965-11-01', '', 1, 1, '2021-12-06 01:29:43',
        4, 3),
       (12, 'pbkdf2_sha256$260000$wfCmiDCTlG1okqSImpBmMw$ulEe5nPG9KGl5G5F+BEDBwU/RLq6HCOZGE4yiv6/EZ8=', null, 0,
        'DUSKm5Mf', 'Одинцова В. И.', 'Одинцова Варвара Ивановна', 'Женщина', '1980-11-07', '', 1, 1,
        '2021-12-06 01:29:43', 4, 3),
       (13, 'pbkdf2_sha256$260000$eSGXbiLcHNxoLdpANFw4Ov$sK63pNaN5YefwhQF4S9vWrWW07bryX2w8rQWQCtBa0c=', null, 0,
        'nMTQDv9k', 'Ливидников К. С.', 'Ливидников Константин Сергеевич', 'Мужчина', '1992-10-23', '', 1, 1,
        '2021-12-06 01:29:43', 4, 1),
       (14, 'pbkdf2_sha256$260000$6dFGZHVFnCILFireTQvQ6u$de2O1r2uXihewA9L+Y+SOzrUHLlqOP+p2+UqvpOMIHs=', null, 0,
        'Jnj5XKP7', 'Липко Г. Г.', 'Липко Галина Григорьевна', 'Женщина', '1983-07-10', '', 1, 1, '2021-12-06 01:29:43',
        4, 2),
       (15, 'pbkdf2_sha256$260000$Z28HCmXOtKELJMJ2iZw30S$y6gZ5VWzzL9Fu8ozxcNsSuQLBIDRBuQ9UmReN+gwljY=', null, 0,
        'RANd4kcx', 'Броншнейн А. М.', 'Броншнейн Александр Михайлович', 'Мужчина', '1979-05-11', '', 1, 1,
        '2021-12-06 01:29:43', 4, 2),
       (16, 'pbkdf2_sha256$260000$m9drpzD4Zt6Op7qpaMWbP6$jvpdQdPc72nZbpabh3PhS+u+IT8QXbNSLUgoPs4sbCw=', null, 0,
        'vD8MJdAX', 'Виценко А. А.', 'Виценко Анатолий Анатольевич', 'Мужчина', '2000-12-12', '', 1, 1,
        '2021-12-06 01:29:43', 4, 2),
       (17, 'pbkdf2_sha256$260000$uuj8PMhYxR3Dx4AiHmDWYu$gszWJfTRs65qBjJYi4BpCrbODZDnuLYDS/XBjCncpxo=', null, 0,
        'UGP9v6hR', 'Виценко М. А.', 'Виценко Маргарита Александровна', 'Женщина', '1998-06-01', '', 1, 1,
        '2021-12-06 01:29:43', 4, 2),
       (18, 'pbkdf2_sha256$260000$LAOLjxiXCnUYEGCR6kquQP$kgG2TEjsv0oDJgJHcVguNTrV4x2nl2GVIVYld+zoe+M=', null, 0,
        'kolus', 'kolus', 'kolus', 'Мужчина', '2021-12-07', '', 1, 1, '2021-12-07 13:16:47.970716', 3, 1);
/*!40000 ALTER TABLE `stuff_employee`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_employee_groups`
--

# LOCK TABLES `stuff_employee_groups` WRITE;
# /*!40000 ALTER TABLE `stuff_employee_groups`
#     DISABLE KEYS */;
# INSERT INTO `stuff_employee_groups`
# VALUES (26, 1, 3),
#        (19, 2, 1),
#        (21, 3, 1),
#        (22, 4, 2),
#        (20, 5, 3),
#        (2, 6, 1),
#        (9, 7, 2),
#        (5, 8, 3),
#        (13, 9, 1),
#        (7, 10, 2),
#        (18, 11, 4),
#        (4, 12, 4),
#        (8, 13, 4),
#        (6, 14, 4),
#        (10, 15, 4),
#        (15, 16, 4),
#        (14, 17, 4),
#        (27, 18, 3);
# /*!40000 ALTER TABLE `stuff_employee_groups`
#     ENABLE KEYS */;
# UNLOCK TABLES;

--
-- Dumping data for table `db_employee_user_permissions`
--

# LOCK TABLES `db_employee_user_permissions` WRITE;
# /*!40000 ALTER TABLE `db_employee_user_permissions`
#     DISABLE KEYS */;
# /*!40000 ALTER TABLE `db_employee_user_permissions`
#     ENABLE KEYS */;
# UNLOCK TABLES;

--
-- Dumping data for table `db_feedingtype`
--

# LOCK TABLES `db_feedingtype` WRITE;
# /*!40000 ALTER TABLE `db_feedingtype`
#     DISABLE KEYS */;
# /*!40000 ALTER TABLE `db_feedingtype`
#     ENABLE KEYS */;
# UNLOCK TABLES;

--
-- Dumping data for table `hotels_hotel`
--

LOCK TABLES `hotels_hotel` WRITE;
/*!40000 ALTER TABLE `hotels_hotel`
    DISABLE KEYS */;
INSERT INTO `hotels_hotel`
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
/*!40000 ALTER TABLE `hotels_hotel`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `hotels_hoteltype`
--

LOCK TABLES `hotels_hoteltype` WRITE;
/*!40000 ALTER TABLE `hotels_hoteltype`
    DISABLE KEYS */;
INSERT INTO `hotels_hoteltype`
VALUES (1, '1', NULL),
       (2, '3', NULL),
       (3, '4', NULL),
       (4, '5', NULL),
       (5, 'Апартаменты', NULL);
/*!40000 ALTER TABLE `hotels_hoteltype`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `clients_passport`
--

LOCK TABLES `clients_passport` WRITE;
/*!40000 ALTER TABLE `clients_passport`
    DISABLE KEYS */;
INSERT INTO `clients_passport`
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
/*!40000 ALTER TABLE `clients_passport`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_organization`
--

LOCK TABLES `stuff_organization` WRITE;
/*!40000 ALTER TABLE `stuff_organization`
    DISABLE KEYS */;
INSERT INTO `stuff_organization`
VALUES (1, 'Офис', 'Москва, Верхняя Красносельская улица 38/19с1', '7(495)520-94-38', NULL),
       (2, 'Филиал №1', 'Рязань, улица Маяковского, 115', '7(4912)54-32-90', NULL),
       (3, 'Филиал №2', 'Тула, улица Вересаева, 10А', '7(4872)14-47-80', NULL);
/*!40000 ALTER TABLE `stuff_organization`
    ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `db_preliminaryagreement`
--

# LOCK TABLES `db_agreement` WRITE;
# /*!40000 ALTER TABLE `db_agreement`
#     DISABLE KEYS */;
# /*!40000 ALTER TABLE `db_agreement`
#     ENABLE KEYS */;
# UNLOCK TABLES;

--
-- Dumping data for table `db_processstatus`
--

# LOCK TABLES `db_processstatus` WRITE;
# /*!40000 ALTER TABLE `db_processstatus`
#     DISABLE KEYS */;
# /*!40000 ALTER TABLE `db_processstatus`
#     ENABLE KEYS */;
# UNLOCK TABLES;

--
-- Dumping data for table `db_roomtype`
--

# LOCK TABLES `db_roomtype` WRITE;
# /*!40000 ALTER TABLE `db_roomtype`
#     DISABLE KEYS */;
# /*!40000 ALTER TABLE `db_roomtype`
#     ENABLE KEYS */;
# UNLOCK TABLES;

--
-- Dumping data for table `db_tourhotel`
--

# LOCK TABLES `db_tourhotel` WRITE;
# /*!40000 ALTER TABLE `db_tourhotel`
#     DISABLE KEYS */;
# /*!40000 ALTER TABLE `db_tourhotel`
#     ENABLE KEYS */;
# UNLOCK TABLES;

--
-- Dumping data for table `db_tourist`
--

# LOCK TABLES `db_tourist` WRITE;
# /*!40000 ALTER TABLE `db_tourist`
#     DISABLE KEYS */;
# /*!40000 ALTER TABLE `db_tourist`
#     ENABLE KEYS */;
# UNLOCK TABLES;

/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2021-11-30 19:16:29
