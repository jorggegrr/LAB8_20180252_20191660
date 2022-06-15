-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lab6sw1
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista` (
  `idartista` int NOT NULL AUTO_INCREMENT,
  `nombre_artista` varchar(30) NOT NULL,
  `instrumento` varchar(3) NOT NULL,
  `banda` varchar(3) NOT NULL,
  PRIMARY KEY (`idartista`),
  KEY `fk_artista_instrumento1_idx` (`instrumento`),
  KEY `fk_artista_banda1_idx` (`banda`),
  CONSTRAINT `fk_artista_banda1` FOREIGN KEY (`banda`) REFERENCES `banda` (`idbanda`),
  CONSTRAINT `fk_artista_instrumento1` FOREIGN KEY (`instrumento`) REFERENCES `instrumento` (`idinstrumento`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
INSERT INTO `artista` VALUES (1,'Hayley Williams','VOC','PAR'),(2,'Patrick Stump','VOC','FOB'),(3,'Brendon Urie','VOC','PAD'),(4,'Gerard Way','VOC','MCR'),(5,'Billie Joe Armstrong','VOC','GND'),(6,'Chester Bennington','VOC','LPK'),(7,'Pierre Bouvier','VOC','SPN'),(8,'Anthony Kiedis','VOC','RCP'),(9,'Liam Gallagher','VOC','OSS'),(10,'Adam Levine','VOC','MRN'),(11,'Tre Cool','DRM','GND'),(12,'Nicole Row','BSS','PAD'),(13,'Mike Naran','GUI','PAD'),(14,'Mike Dirnt','BSS','GND'),(15,'Joe Trohman','GUI','FOB');
/*!40000 ALTER TABLE `artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banda`
--

DROP TABLE IF EXISTS `banda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banda` (
  `idbanda` varchar(3) NOT NULL,
  `nombre_banda` varchar(30) NOT NULL,
  `artista_lider` int DEFAULT NULL,
  PRIMARY KEY (`idbanda`),
  KEY `fk_banda_artista1_idx` (`artista_lider`),
  CONSTRAINT `fk_banda_artista1` FOREIGN KEY (`artista_lider`) REFERENCES `artista` (`idartista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banda`
--

LOCK TABLES `banda` WRITE;
/*!40000 ALTER TABLE `banda` DISABLE KEYS */;
INSERT INTO `banda` VALUES ('FOB','Fall Out Boy',2),('GND','Green Day',5),('LPK','Linkin Park',6),('MCR','My Chemical Romance',4),('MRN','Maroon 5',10),('OSS','Oasis',9),('PAD','Panic! at the Disco',3),('PAR','Paramore',1),('RCP','Red Hot Chili Peppers',8),('SPN','Simple Plan',7);
/*!40000 ALTER TABLE `banda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancion`
--

DROP TABLE IF EXISTS `cancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancion` (
  `idcancion` int NOT NULL AUTO_INCREMENT,
  `nombre_cancion` varchar(40) NOT NULL,
  `banda` varchar(3) NOT NULL,
  `cancion_favorita` varchar(2) NOT NULL DEFAULT 'no',
  `lista` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idcancion`),
  KEY `fk_cancion_banda1_idx` (`banda`),
  CONSTRAINT `fk_cancion_banda1` FOREIGN KEY (`banda`) REFERENCES `banda` (`idbanda`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancion`
--

LOCK TABLES `cancion` WRITE;
/*!40000 ALTER TABLE `cancion` DISABLE KEYS */;
INSERT INTO `cancion` VALUES (8,'Dance, Dance','FOB','no',NULL),(9,'This Ain\'t a Scene, It\'s An Arms Race','FOB','no',NULL),(10,'Dead on Arrival','FOB','no',NULL),(11,'Sugar, We\'re Goin Down','FOB','no',NULL),(12,'Thnks fr th Mmrs','FOB','no',NULL),(13,'I Don\'t Care','FOB','no',NULL),(14,'America\'s Suitehearts','FOB','no',NULL),(15,'What A Catch, Donnie','FOB','no',NULL),(16,'American Idiot','GND','no',NULL),(17,'Wake Me up When September Ends','GND','no',NULL),(18,'Know Your Enemy','GND','no',NULL),(19,'21 Guns','GND','no',NULL),(20,'21st Century Breakdown','GND','no',NULL),(21,'Basket Case','GND','no',NULL),(22,'Boulevard of Broken Dreams','GND','no',NULL),(23,'That\'s What You Get','PAR','no',NULL),(24,'crushcrushcrush','PAR','no',NULL),(25,'Ignorance','PAR','no',NULL),(26,'Playing God','PAR','no',NULL),(27,'Brick by Boring Brick','PAR','no',NULL),(28,'The Only Exception','PAR','no',NULL),(29,'Misery Business','PAR','no',NULL),(30,'Decode','PAR','no',NULL),(31,'Shadow of the Day','LPK','no',NULL),(32,'In the End','LPK','no',NULL),(33,'Numb','LPK','no',NULL),(34,'What I\'ve Done','LPK','no',NULL),(35,'New Divide','LPK','no',NULL),(36,'Waiting for the End','LPK','no',NULL),(37,'Welcome to the Black Parade','MCR','no',NULL),(38,'Teenagers','MCR','no',NULL),(39,'Disenchanted','MCR','no',NULL),(40,'SING','MCR','no',NULL),(41,'Desolation Row','MCR','no',NULL),(42,'Don\'t Look Back in Anger','OSS','no',NULL),(43,'Wonderwall','OSS','no',NULL),(44,'Whatever','OSS','no',NULL),(45,'But It\'s Better If You Do','PAD','no',NULL),(46,'I Write Sins Not Tragedies','PAD','no',NULL),(47,'Nine in the Afternoon','PAD','no',NULL),(48,'New Perspective','PAD','no',NULL),(49,'Time to Dance','PAD','no',NULL),(50,'By the Way','RCP','no',NULL),(51,'Californication','RCP','no',NULL),(52,'Dani California','RCP','no',NULL),(53,'I\'m Just a Kid','SPN','no',NULL),(54,'Perfect','SPN','no',NULL),(55,'Untitled','SPN','no',NULL),(56,'Crazy','SPN','no',NULL),(57,'Save You','SPN','no',NULL),(58,'Welcome to My Life','SPN','no',NULL),(59,'Your Love Is a Lie','SPN','no',NULL),(60,'When I\'m Gone','SPN','no',NULL),(61,'Saturday','FOB','no',NULL),(62,'Grand Theft Autumn / Where Is Your Boy ','FOB','no',NULL),(63,'The Take Over, The Breaks Over','FOB','no',NULL),(64,'Alpha Dog','FOB','no',NULL),(65,'From Now On We Are Enemies','FOB','no',NULL);
/*!40000 ALTER TABLE `cancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `idciudad` varchar(3) NOT NULL,
  `nombre_ciudad` varchar(20) NOT NULL,
  `pais` varchar(3) NOT NULL,
  PRIMARY KEY (`idciudad`),
  KEY `fk_ciudad_pais1_idx` (`pais`),
  CONSTRAINT `fk_ciudad_pais1` FOREIGN KEY (`pais`) REFERENCES `pais` (`idpais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES ('BOG','Bogotá','COL'),('BSA','Buenos Aires','ARG'),('CDM','Ciudad de México','MEX'),('GDJ','Guadalajara','MEX'),('LMA','Lima','PER'),('MOV','Montevideo','URU'),('SAN','Santiago','CHL'),('TJN','Tijuana','MEX');
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instrumento`
--

DROP TABLE IF EXISTS `instrumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instrumento` (
  `idinstrumento` varchar(3) NOT NULL,
  `nombre_inst` varchar(20) NOT NULL,
  PRIMARY KEY (`idinstrumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instrumento`
--

LOCK TABLES `instrumento` WRITE;
/*!40000 ALTER TABLE `instrumento` DISABLE KEYS */;
INSERT INTO `instrumento` VALUES ('BSS','Bajo'),('DRM','Bateria'),('GUI','Guitarra'),('VOC','Voz');
/*!40000 ALTER TABLE `instrumento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `idpais` varchar(3) NOT NULL,
  `nombre_pais` varchar(20) NOT NULL,
  PRIMARY KEY (`idpais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES ('ARG','Argentina'),('BOL','Bolivia'),('BRA','Brasil'),('CHL','Chile'),('COL','Colombia'),('CRI','Costa Rica'),('CUB','Cuba'),('DOM','República Dominicana'),('ECU','Ecuador'),('GTM','Guatemala'),('HND','Honduras'),('MEX','México'),('NIC','Nicaragua'),('PAN','Panamá'),('PER','Perú'),('PRI','Puerto Rico'),('PRY','Paraguay'),('SLV','El Salvador'),('URU','Uruguay'),('VEN','Venezuela');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reproduccion`
--

DROP TABLE IF EXISTS `reproduccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reproduccion` (
  `idreproduccion` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `cancion_idcancion` int NOT NULL,
  PRIMARY KEY (`idreproduccion`),
  KEY `fk_reproduccion_cancion1_idx` (`cancion_idcancion`),
  CONSTRAINT `fk_reproduccion_cancion1` FOREIGN KEY (`cancion_idcancion`) REFERENCES `cancion` (`idcancion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reproduccion`
--

LOCK TABLES `reproduccion` WRITE;
/*!40000 ALTER TABLE `reproduccion` DISABLE KEYS */;
INSERT INTO `reproduccion` VALUES (1,'2021-11-04',8),(2,'2021-11-04',8),(3,'2021-11-04',9),(4,'2021-11-04',9),(5,'2021-11-04',9),(6,'2021-11-04',10),(7,'2021-11-04',10),(8,'2021-11-04',10),(9,'2021-11-04',10),(10,'2021-11-04',11),(11,'2021-11-04',11),(12,'2021-11-04',12),(13,'2021-11-04',12),(14,'2021-11-04',13),(15,'2021-11-04',13),(16,'2021-11-04',14),(17,'2021-11-04',15),(18,'2021-11-04',15),(19,'2021-11-04',15),(20,'2021-11-04',15),(21,'2021-11-04',15),(22,'2021-11-04',16),(23,'2021-11-04',16),(24,'2021-11-04',10),(25,'2021-11-04',10),(26,'2021-11-04',11),(27,'2021-11-04',11),(28,'2021-11-04',10),(29,'2021-11-04',16),(30,'2021-11-04',16);
/*!40000 ALTER TABLE `reproduccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour`
--

DROP TABLE IF EXISTS `tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour` (
  `idtour` int NOT NULL AUTO_INCREMENT,
  `nombre_tour` varchar(30) NOT NULL,
  `banda` varchar(3) NOT NULL,
  PRIMARY KEY (`idtour`),
  KEY `fk_tour_banda1_idx` (`banda`),
  CONSTRAINT `fk_tour_banda1` FOREIGN KEY (`banda`) REFERENCES `banda` (`idbanda`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour`
--

LOCK TABLES `tour` WRITE;
/*!40000 ALTER TABLE `tour` DISABLE KEYS */;
INSERT INTO `tour` VALUES (1,'One More Light World Tour','LPK'),(2,'Dig Out Your Soul Tour','OSS');
/*!40000 ALTER TABLE `tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tours_por_ciudad`
--

DROP TABLE IF EXISTS `tours_por_ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tours_por_ciudad` (
  `tour` int NOT NULL,
  `ciudad` varchar(3) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`tour`,`ciudad`),
  KEY `fk_tour_has_ciudad_ciudad1_idx` (`ciudad`),
  KEY `fk_tour_has_ciudad_tour1_idx` (`tour`),
  CONSTRAINT `fk_tour_has_ciudad_ciudad1` FOREIGN KEY (`ciudad`) REFERENCES `ciudad` (`idciudad`),
  CONSTRAINT `fk_tour_has_ciudad_tour1` FOREIGN KEY (`tour`) REFERENCES `tour` (`idtour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tours_por_ciudad`
--

LOCK TABLES `tours_por_ciudad` WRITE;
/*!40000 ALTER TABLE `tours_por_ciudad` DISABLE KEYS */;
INSERT INTO `tours_por_ciudad` VALUES (1,'BSA','2017-05-06'),(1,'SAN','2017-05-09'),(2,'LMA','2009-04-30');
/*!40000 ALTER TABLE `tours_por_ciudad` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-14 20:43:19
