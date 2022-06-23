-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: apocalipsis99
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
-- Table structure for table `humano`
--

DROP TABLE IF EXISTS `humano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `humano` (
  `idHumano` varchar(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `sexo` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `peso` float DEFAULT NULL,
  `fuerza` float DEFAULT NULL,
  `carga` float DEFAULT NULL,
  `idPareja` varchar(11) DEFAULT NULL,
  `idVirus` int DEFAULT NULL,
  `tiempoInfectado` time DEFAULT NULL,
  `numeroVictimas` int DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `ataque` varchar(11) DEFAULT NULL,
  `idVariante` int DEFAULT NULL,
  PRIMARY KEY (`idHumano`),
  KEY `fk_Humano_Virus1_idx` (`idVirus`),
  CONSTRAINT `fk_Humano_Virus1` FOREIGN KEY (`idVirus`) REFERENCES `virus` (`idVirus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `humano`
--

LOCK TABLES `humano` WRITE;
/*!40000 ALTER TABLE `humano` DISABLE KEYS */;
INSERT INTO `humano` VALUES ('12345678912','Pedro','Sanchez','masculino','superviviente',80,100,NULL,'12345678913',NULL,NULL,NULL,NULL,NULL,NULL),('12345678913','Ana','Peralta','femenino','superviviente',60,80,NULL,'12345678912',NULL,NULL,NULL,NULL,NULL,NULL),('12345678914','David','Visbal','masculino','superviviente',80,100,NULL,'12345678915',NULL,NULL,NULL,NULL,NULL,NULL),('12345678915','Ariana','Grande','femenino','superviviente',60,80,NULL,'31519774738',NULL,NULL,NULL,NULL,NULL,NULL),('12345678916','Anuel','Perca','masculino','superviviente',100,105,NULL,'12345678917',NULL,NULL,NULL,'nino',NULL,NULL),('12345678917','Ale','Guille','femenino','superviviente',700,50,NULL,'12345678916',NULL,NULL,NULL,'demoledor',NULL,NULL),('12345678918','Marco','Lopez','masculino','superviviente',80,100,NULL,'12345678919',NULL,NULL,NULL,'rapido',NULL,NULL),('12345678919','Maller','Pequena','femenino','superviviente',60,80,NULL,NULL,NULL,NULL,NULL,'normal',NULL,NULL),('22345678910','Nicoll','Ramos','femenino','zombie',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('22345678911','Pablo','Alboran','masculino','zombie',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('22345678912','Dua','Quispe','femenino','zombie',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('22345678913','Camilo','Cesto','masculino','zombie',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('22345678914','Alexa','Lapa','femenino','zombie',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('31519774738','Jorge11','Guillen','masculino','superviviente',100,100,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `humano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objeto`
--

DROP TABLE IF EXISTS `objeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objeto` (
  `idObjeto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `masa` float NOT NULL,
  `tipo` varchar(10) DEFAULT NULL,
  `efectividad` decimal(5,1) DEFAULT NULL,
  `demoledor` double DEFAULT NULL,
  `rapido` double DEFAULT NULL,
  `nino` double DEFAULT NULL,
  `normal` double DEFAULT NULL,
  `otro` double DEFAULT NULL,
  PRIMARY KEY (`idObjeto`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objeto`
--

LOCK TABLES `objeto` WRITE;
/*!40000 ALTER TABLE `objeto` DISABLE KEYS */;
INSERT INTO `objeto` VALUES (1,'cuchillo',1,'normal',NULL,NULL,NULL,NULL,NULL,NULL),(2,'pala',1,'normal',NULL,NULL,NULL,NULL,NULL,NULL),(3,'soga',1,'normal',NULL,NULL,NULL,NULL,NULL,NULL),(4,'pistola',1,'normal',NULL,NULL,NULL,NULL,NULL,NULL),(5,'escopeta',1,'normal',NULL,NULL,NULL,NULL,NULL,NULL),(6,'vacuna tipo 1',0.1,'vacuna',95.5,NULL,NULL,NULL,NULL,NULL),(7,'vacuna tipo 2',0.3,'vacuna',80.9,NULL,NULL,NULL,NULL,NULL),(8,'vacuna tipo 3',0.2,'vacuna',70.5,NULL,NULL,NULL,NULL,NULL),(9,'vacuna tipo 4',0.4,'vacuna',99.9,NULL,NULL,NULL,NULL,NULL),(10,'vacuna tipo 5',0.1,'vacuna',30.3,NULL,NULL,NULL,NULL,NULL),(11,'cuchillo',1,'normal',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `objeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objetoporhumano`
--

DROP TABLE IF EXISTS `objetoporhumano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `objetoporhumano` (
  `idHumano` varchar(11) NOT NULL,
  `idObjeto` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`idHumano`,`idObjeto`),
  KEY `fk_Humano_has_Objeto_Objeto1_idx` (`idObjeto`),
  KEY `fk_Humano_has_Objeto_Humano_idx` (`idHumano`),
  CONSTRAINT `fk_Humano_has_Objeto_Humano` FOREIGN KEY (`idHumano`) REFERENCES `humano` (`idHumano`),
  CONSTRAINT `fk_Humano_has_Objeto_Objeto1` FOREIGN KEY (`idObjeto`) REFERENCES `objeto` (`idObjeto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objetoporhumano`
--

LOCK TABLES `objetoporhumano` WRITE;
/*!40000 ALTER TABLE `objetoporhumano` DISABLE KEYS */;
INSERT INTO `objetoporhumano` VALUES ('12345678912',2,1),('12345678912',3,1),('12345678912',4,1),('12345678913',2,3),('12345678913',4,1),('12345678914',2,3),('12345678915',2,3),('12345678916',2,3),('12345678917',5,1),('12345678918',4,1),('12345678918',6,1),('12345678919',6,1);
/*!40000 ALTER TABLE `objetoporhumano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variante`
--

DROP TABLE IF EXISTS `variante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `variante` (
  `idVariante` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `idVirus` int NOT NULL,
  PRIMARY KEY (`idVariante`),
  KEY `fk_Variante_Virus1_idx` (`idVirus`),
  CONSTRAINT `fk_Variante_Virus1` FOREIGN KEY (`idVirus`) REFERENCES `virus` (`idVirus`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variante`
--

LOCK TABLES `variante` WRITE;
/*!40000 ALTER TABLE `variante` DISABLE KEYS */;
INSERT INTO `variante` VALUES (1,'omicron',1),(2,'megatron',2),(3,'pokemon',3),(4,'digimon',4);
/*!40000 ALTER TABLE `variante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `virus`
--

DROP TABLE IF EXISTS `virus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `virus` (
  `idVirus` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `activo` varchar(3) NOT NULL,
  PRIMARY KEY (`idVirus`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `virus`
--

LOCK TABLES `virus` WRITE;
/*!40000 ALTER TABLE `virus` DISABLE KEYS */;
INSERT INTO `virus` VALUES (1,'covid','si'),(2,'lepra','si'),(3,'sida','no'),(4,'mono','no'),(5,'vacas','si');
/*!40000 ALTER TABLE `virus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-22 23:52:48
