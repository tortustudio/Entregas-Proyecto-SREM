-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: localhost    Database: TortuStudioProyecto
-- ------------------------------------------------------
-- Server version	8.0.34-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `TortuStudioProyecto`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `TortuStudioProyecto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `TortuStudioProyecto`;

--
-- Table structure for table `Administrador`
--

DROP TABLE IF EXISTS `Administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Administrador` (
  `ci` varchar(11) NOT NULL,
  PRIMARY KEY (`ci`),
  CONSTRAINT `Administrador_ibfk_1` FOREIGN KEY (`ci`) REFERENCES `Usuarios` (`ci`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administrador`
--

LOCK TABLES `Administrador` WRITE;
/*!40000 ALTER TABLE `Administrador` DISABLE KEYS */;
INSERT INTO `Administrador` VALUES ('2.314.567-8'),('5.531.976-5');
/*!40000 ALTER TABLE `Administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Administrativo`
--

DROP TABLE IF EXISTS `Administrativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Administrativo` (
  `ci` varchar(11) NOT NULL,
  PRIMARY KEY (`ci`),
  CONSTRAINT `Administrativo_ibfk_1` FOREIGN KEY (`ci`) REFERENCES `Usuarios` (`ci`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Administrativo`
--

LOCK TABLES `Administrativo` WRITE;
/*!40000 ALTER TABLE `Administrativo` DISABLE KEYS */;
INSERT INTO `Administrativo` VALUES ('5.577.427-2'),('5.619.104-3'),('9.875.264-5');
/*!40000 ALTER TABLE `Administrativo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contado`
--

DROP TABLE IF EXISTS `Contado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contado` (
  `cod_pago` int NOT NULL,
  PRIMARY KEY (`cod_pago`),
  CONSTRAINT `Contado_ibfk_1` FOREIGN KEY (`cod_pago`) REFERENCES `metodo_de_pago` (`cod_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contado`
--

LOCK TABLES `Contado` WRITE;
/*!40000 ALTER TABLE `Contado` DISABLE KEYS */;
INSERT INTO `Contado` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);
/*!40000 ALTER TABLE `Contado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Controla`
--

DROP TABLE IF EXISTS `Controla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Controla` (
  `cod` varchar(11) NOT NULL,
  `cod_reserva` int NOT NULL,
  PRIMARY KEY (`cod`,`cod_reserva`),
  KEY `cod_reserva` (`cod_reserva`),
  CONSTRAINT `Controla_ibfk_1` FOREIGN KEY (`cod_reserva`) REFERENCES `Reserva` (`cod_reserva`),
  CONSTRAINT `Controla_ibfk_2` FOREIGN KEY (`cod`) REFERENCES `Usuarios` (`ci`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Controla`
--

LOCK TABLES `Controla` WRITE;
/*!40000 ALTER TABLE `Controla` DISABLE KEYS */;
INSERT INTO `Controla` VALUES ('5.619.104-3',1),('5.531.976-5',2),('5.577.427-2',3),('2.314.567-8',4),('9.875.264-5',5),('5.619.104-3',6),('5.531.976-5',7),('5.577.427-2',8),('2.314.567-8',9),('9.875.264-5',10);
/*!40000 ALTER TABLE `Controla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Crea`
--

DROP TABLE IF EXISTS `Crea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Crea` (
  `cod_Usu` varchar(11) NOT NULL,
  `cod_Admin` varchar(11) NOT NULL,
  PRIMARY KEY (`cod_Usu`),
  KEY `cod_Admin` (`cod_Admin`),
  CONSTRAINT `Crea_ibfk_1` FOREIGN KEY (`cod_Usu`) REFERENCES `Usuarios` (`ci`),
  CONSTRAINT `Crea_ibfk_2` FOREIGN KEY (`cod_Admin`) REFERENCES `Administrador` (`ci`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Crea`
--

LOCK TABLES `Crea` WRITE;
/*!40000 ALTER TABLE `Crea` DISABLE KEYS */;
INSERT INTO `Crea` VALUES ('9.875.264-5','2.314.567-8'),('5.577.427-2','5.531.976-5'),('5.619.104-3','5.531.976-5');
/*!40000 ALTER TABLE `Crea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cuenta_corriente`
--

DROP TABLE IF EXISTS `Cuenta_corriente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cuenta_corriente` (
  `cod_pago` int NOT NULL,
  `cod_cuenta` int NOT NULL,
  PRIMARY KEY (`cod_pago`,`cod_cuenta`),
  CONSTRAINT `Cuenta_corriente_ibfk_1` FOREIGN KEY (`cod_pago`) REFERENCES `metodo_de_pago` (`cod_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cuenta_corriente`
--

LOCK TABLES `Cuenta_corriente` WRITE;
/*!40000 ALTER TABLE `Cuenta_corriente` DISABLE KEYS */;
INSERT INTO `Cuenta_corriente` VALUES (1,101),(2,102),(3,103),(4,104),(5,105),(6,106),(7,107),(8,108),(9,109),(10,110);
/*!40000 ALTER TABLE `Cuenta_corriente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empresa`
--

DROP TABLE IF EXISTS `Empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empresa` (
  `RUT` varchar(12) NOT NULL,
  `nom_ficticio` varchar(255) NOT NULL,
  `razon_social` varchar(255) NOT NULL,
  `baja` tinyint(1) NOT NULL DEFAULT (1),
  `lista_negra` tinyint(1) NOT NULL DEFAULT (1),
  PRIMARY KEY (`RUT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empresa`
--

LOCK TABLES `Empresa` WRITE;
/*!40000 ALTER TABLE `Empresa` DISABLE KEYS */;
INSERT INTO `Empresa` VALUES ('1111111111','Empresa D','Empresa D S.A.',1,1),('1234567890','Empresa A','Empresa A S.A.',1,1),('2222222222','Empresa I','Empresa I S.A.',1,1),('4444444444','Empresa J','Empresa J S.A.',1,1),('5555555555','Empresa C','Empresa C S.A.',1,1),('6666666666','Empresa H','Empresa H S.A.',1,1),('7777777777','Empresa F','Empresa F S.A.',1,1),('8888888888','Empresa G','Empresa G S.A.',1,1),('9876543210','Empresa B','Empresa B S.A.',1,1),('9999999999','Empresa E','Empresa E S.A.',1,1);
/*!40000 ALTER TABLE `Empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empresa_direccion`
--

DROP TABLE IF EXISTS `Empresa_direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empresa_direccion` (
  `RUT` varchar(12) NOT NULL,
  `calle` varchar(255) NOT NULL,
  `n_puerta` varchar(7) NOT NULL,
  `Esquina` varchar(255) NOT NULL,
  PRIMARY KEY (`RUT`),
  CONSTRAINT `Empresa_direccion_ibfk_1` FOREIGN KEY (`RUT`) REFERENCES `Empresa` (`RUT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empresa_direccion`
--

LOCK TABLES `Empresa_direccion` WRITE;
/*!40000 ALTER TABLE `Empresa_direccion` DISABLE KEYS */;
INSERT INTO `Empresa_direccion` VALUES ('1111111111','Calle D','101','Esquina D'),('1234567890','Calle A','123','Esquina A'),('2222222222','Calle I','606','Esquina I'),('4444444444','Calle J','707','Esquina J'),('5555555555','Calle C','789','Esquina C'),('6666666666','Calle H','505','Esquina H'),('7777777777','Calle F','303','Esquina F'),('8888888888','Calle G','404','Esquina G'),('9876543210','Calle B','456','Esquina B'),('9999999999','Calle E','202','Esquina E');
/*!40000 ALTER TABLE `Empresa_direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genera`
--

DROP TABLE IF EXISTS `Genera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genera` (
  `RUT` varchar(12) NOT NULL,
  `cod_reserva` int NOT NULL,
  PRIMARY KEY (`RUT`,`cod_reserva`),
  KEY `cod_reserva` (`cod_reserva`),
  CONSTRAINT `Genera_ibfk_1` FOREIGN KEY (`RUT`) REFERENCES `Empresa` (`RUT`),
  CONSTRAINT `Genera_ibfk_2` FOREIGN KEY (`cod_reserva`) REFERENCES `Reserva` (`cod_reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genera`
--

LOCK TABLES `Genera` WRITE;
/*!40000 ALTER TABLE `Genera` DISABLE KEYS */;
INSERT INTO `Genera` VALUES ('1234567890',1),('9876543210',2),('5555555555',3),('1111111111',4),('9999999999',5),('7777777777',6),('8888888888',7),('6666666666',8),('2222222222',9),('4444444444',10);
/*!40000 ALTER TABLE `Genera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Precisa`
--

DROP TABLE IF EXISTS `Precisa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Precisa` (
  `cod_reserva` int NOT NULL,
  `CI_chofer` varchar(11) NOT NULL,
  PRIMARY KEY (`cod_reserva`,`CI_chofer`),
  KEY `CI_chofer` (`CI_chofer`),
  CONSTRAINT `Precisa_ibfk_1` FOREIGN KEY (`cod_reserva`) REFERENCES `Reserva` (`cod_reserva`),
  CONSTRAINT `Precisa_ibfk_2` FOREIGN KEY (`CI_chofer`) REFERENCES `chofer` (`CI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Precisa`
--

LOCK TABLES `Precisa` WRITE;
/*!40000 ALTER TABLE `Precisa` DISABLE KEYS */;
INSERT INTO `Precisa` VALUES (1,'1.234.567-8'),(2,'1.234.567-8'),(4,'1.234.567-8'),(5,'1.234.567-8'),(10,'2.345.678-9'),(3,'3.456.789-0'),(6,'8.765.432-1'),(7,'8.765.432-1'),(8,'8.765.432-1'),(9,'9.876.543-2');
/*!40000 ALTER TABLE `Precisa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reserva`
--

DROP TABLE IF EXISTS `Reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reserva` (
  `cod_reserva` int NOT NULL AUTO_INCREMENT,
  `comentario` text,
  `destino` varchar(255) NOT NULL,
  `origen` varchar(255) NOT NULL,
  `hora` time NOT NULL,
  `fecha` date NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `costo` int NOT NULL,
  `baja` tinyint(1) NOT NULL DEFAULT (1),
  PRIMARY KEY (`cod_reserva`),
  CONSTRAINT `Reserva_chk_1` CHECK ((`tipo` in (_utf8mb4'Empresa',_utf8mb4'Particular')))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reserva`
--

LOCK TABLES `Reserva` WRITE;
/*!40000 ALTER TABLE `Reserva` DISABLE KEYS */;
INSERT INTO `Reserva` VALUES (1,'Comentario1','Destino1','Origen1','12:00:00','2024-05-01','Empresa',100,1),(2,'Comentario2','Destino2','Origen2','14:30:00','2023-09-01','Empresa',150,1),(3,'Comentario3','Destino3','Origen3','16:45:00','2023-08-13','Empresa',120,1),(4,'Comentario4','Destino4','Origen4','09:15:00','2023-08-24','Empresa',200,1),(5,'Comentario5','Destino5','Origen5','11:30:00','2023-08-04','Empresa',180,1),(6,'Comentario6','Destino6','Origen6','13:20:00','2022-12-06','Particular',130,1),(7,'Comentario7','Destino7','Origen7','15:10:00','2022-05-07','Particular',170,1),(8,'Comentario8','Destino8','Origen8','17:00:00','2023-02-08','Particular',190,1),(9,'Comentario9','Destino9','Origen9','18:30:00','2024-04-09','Particular',140,1),(10,'Comentario10','Destino10','Origen10','20:15:00','2333-08-10','Particular',160,1);
/*!40000 ALTER TABLE `Reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reserva_pasajero`
--

DROP TABLE IF EXISTS `Reserva_pasajero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reserva_pasajero` (
  `cod_reserva` int NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Apellido` varchar(255) NOT NULL,
  `tel` varchar(11) NOT NULL,
  PRIMARY KEY (`cod_reserva`,`tel`),
  CONSTRAINT `Reserva_pasajero_ibfk_1` FOREIGN KEY (`cod_reserva`) REFERENCES `Reserva` (`cod_reserva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reserva_pasajero`
--

LOCK TABLES `Reserva_pasajero` WRITE;
/*!40000 ALTER TABLE `Reserva_pasajero` DISABLE KEYS */;
INSERT INTO `Reserva_pasajero` VALUES (1,'Pasajero1','Apellido1','1111111111'),(2,'Pasajero2','Apellido2','1111111111'),(3,'Pasajero3','Apellido3','3333333333'),(4,'Pasajero4','Apellido4','4444444444'),(5,'Pasajero5','Apellido5','5555555555'),(6,'Pasajero6','Apellido6','6666666666'),(7,'Pasajero7','Apellido7','7777777777'),(8,'Pasajero8','Apellido8','8888888888'),(9,'Pasajero9','Apellido9','9999999999'),(10,'Pasajero10','Apellido10','0000000000');
/*!40000 ALTER TABLE `Reserva_pasajero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sesiones`
--

DROP TABLE IF EXISTS `Sesiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sesiones` (
  `ci_u` varchar(11) NOT NULL,
  PRIMARY KEY (`ci_u`),
  CONSTRAINT `Sesiones_ibfk_1` FOREIGN KEY (`ci_u`) REFERENCES `Usuarios` (`ci`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sesiones`
--

LOCK TABLES `Sesiones` WRITE;
/*!40000 ALTER TABLE `Sesiones` DISABLE KEYS */;
INSERT INTO `Sesiones` VALUES ('5.577.427-2');
/*!40000 ALTER TABLE `Sesiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tarjeta`
--

DROP TABLE IF EXISTS `Tarjeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tarjeta` (
  `cod_pago` int NOT NULL,
  `num_tarjeta` varchar(22) NOT NULL,
  PRIMARY KEY (`cod_pago`,`num_tarjeta`),
  CONSTRAINT `Tarjeta_ibfk_1` FOREIGN KEY (`cod_pago`) REFERENCES `metodo_de_pago` (`cod_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tarjeta`
--

LOCK TABLES `Tarjeta` WRITE;
/*!40000 ALTER TABLE `Tarjeta` DISABLE KEYS */;
INSERT INTO `Tarjeta` VALUES (1,'1111111111111111111111'),(2,'2222222222222222222222'),(3,'3333333333333333333333'),(4,'4444444444444444444444'),(5,'5555555555555555555555'),(6,'6666666666666666666666'),(7,'7777777777777777777777'),(8,'8888888888888888888888'),(9,'9999999999999999999999'),(10,'0000000000000000000000');
/*!40000 ALTER TABLE `Tarjeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transferencia`
--

DROP TABLE IF EXISTS `Transferencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transferencia` (
  `cod_pago` int NOT NULL,
  `num_cuenta` varchar(20) NOT NULL,
  PRIMARY KEY (`cod_pago`,`num_cuenta`),
  CONSTRAINT `Transferencia_ibfk_1` FOREIGN KEY (`cod_pago`) REFERENCES `metodo_de_pago` (`cod_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transferencia`
--

LOCK TABLES `Transferencia` WRITE;
/*!40000 ALTER TABLE `Transferencia` DISABLE KEYS */;
INSERT INTO `Transferencia` VALUES (1,'1111111111'),(2,'2222222222'),(3,'3333333333'),(4,'4444444444'),(5,'5555555555'),(6,'6666666666'),(7,'7777777777'),(8,'8888888888'),(9,'9999999999'),(10,'0000000000');
/*!40000 ALTER TABLE `Transferencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuarios` (
  `nom_usu` varchar(30) NOT NULL,
  `contrasena` varchar(8) NOT NULL,
  `tipo` varchar(20) NOT NULL DEFAULT (_utf8mb4'Administrativo'),
  `apellido` varchar(255) NOT NULL,
  `ci` varchar(11) NOT NULL,
  `baja` tinyint(1) NOT NULL DEFAULT (1),
  `estado` tinyint(1) NOT NULL DEFAULT (1),
  PRIMARY KEY (`ci`),
  CONSTRAINT `Usuarios_chk_1` CHECK ((`tipo` in (_utf8mb4'Administrador',_utf8mb4'Administrativo')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios`
--

LOCK TABLES `Usuarios` WRITE;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios` VALUES ('Marta','marta987','Administrador','Capretti','2.314.567-8',1,1),('Emiliano','12345','Administrador','Mandacen','5.531.976-5',1,1),('Fernando','tortu123','Administrativo','Pertierra','5.577.427-2',1,1),('Facundo','facu123','Administrativo','Vastakas','5.619.104-3',1,1),('Natalia','chilena1','Administrativo','Torres','9.875.264-5',1,1);
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios_tel`
--

DROP TABLE IF EXISTS `Usuarios_tel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuarios_tel` (
  `ci` varchar(11) NOT NULL,
  `tel` varchar(11) NOT NULL,
  PRIMARY KEY (`ci`,`tel`),
  CONSTRAINT `Usuarios_tel_ibfk_1` FOREIGN KEY (`ci`) REFERENCES `Usuarios` (`ci`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios_tel`
--

LOCK TABLES `Usuarios_tel` WRITE;
/*!40000 ALTER TABLE `Usuarios_tel` DISABLE KEYS */;
INSERT INTO `Usuarios_tel` VALUES ('2.314.567-8','555-456-789'),('5.531.976-5','555-234-567'),('5.577.427-2','555-345-678'),('5.619.104-3','555-123-456'),('9.875.264-5','555-567-890');
/*!40000 ALTER TABLE `Usuarios_tel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chofer`
--

DROP TABLE IF EXISTS `chofer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chofer` (
  `CI` varchar(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `c_salud` date NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `fecha_de_vencimiento_libreta_conducir` date NOT NULL,
  `matricula` varchar(20) NOT NULL,
  `baja` tinyint(1) NOT NULL DEFAULT (1),
  `estado` tinyint(1) NOT NULL DEFAULT (1),
  PRIMARY KEY (`CI`),
  KEY `matricula` (`matricula`),
  CONSTRAINT `chofer_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `coche` (`matricula`),
  CONSTRAINT `chofer_chk_1` CHECK ((`tipo` in (_utf8mb4'particular',_utf8mb4'contratado')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chofer`
--

LOCK TABLES `chofer` WRITE;
/*!40000 ALTER TABLE `chofer` DISABLE KEYS */;
INSERT INTO `chofer` VALUES ('1.234.567-8','Juan','Pérez','2024-10-01','particular','2025-05-15','SRE1234',1,0),('2.345.678-9','Ana','Martínez','2024-10-05','contratado','2025-06-20','SRE5678',1,1),('3.456.789-0','Carlos','Rodríguez','2025-01-12','particular','2024-08-25','SRE7890',1,1),('8.765.432-1','María','González','2025-03-15','contratado','2024-12-10','SRE9678',1,1),('9.876.543-2','Pedro','López','2024-11-20','particular','2025-09-30','SRE4321',1,1);
/*!40000 ALTER TABLE `chofer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chofer_tel`
--

DROP TABLE IF EXISTS `chofer_tel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chofer_tel` (
  `CI` varchar(11) NOT NULL,
  `tel` varchar(11) NOT NULL,
  PRIMARY KEY (`CI`,`tel`),
  CONSTRAINT `chofer_tel_ibfk_1` FOREIGN KEY (`CI`) REFERENCES `chofer` (`CI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chofer_tel`
--

LOCK TABLES `chofer_tel` WRITE;
/*!40000 ALTER TABLE `chofer_tel` DISABLE KEYS */;
INSERT INTO `chofer_tel` VALUES ('1.234.567-8','093-234-567'),('2.345.678-9','093-890-123'),('3.456.789-0','093-456-789'),('8.765.432-1','093-876-543'),('9.876.543-2','093-345-678');
/*!40000 ALTER TABLE `chofer_tel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coche`
--

DROP TABLE IF EXISTS `coche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coche` (
  `matricula` varchar(20) NOT NULL,
  `marca` varchar(255) DEFAULT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `c_pasajeros` int DEFAULT NULL,
  `n_padron` int DEFAULT NULL,
  `baja` tinyint(1) NOT NULL DEFAULT (1),
  `seguro_coche` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`matricula`),
  CONSTRAINT `coche_chk_1` CHECK ((`seguro_coche` in (_utf8mb4'total',_utf8mb4'parcial',_utf8mb4'por terceros')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coche`
--

LOCK TABLES `coche` WRITE;
/*!40000 ALTER TABLE `coche` DISABLE KEYS */;
INSERT INTO `coche` VALUES ('SRE1234','Ford','Focus',5,1234567,1,'total'),('SRE4321','Chevrolet','Cruze',5,2345678,1,'por terceros'),('SRE5678','Honda','Civic',4,7890123,1,'parcial'),('SRE7890','Volkswagen','Jetta',5,3456789,1,'total'),('SRE9678','Toyota','Corolla',4,9876543,1,'parcial');
/*!40000 ALTER TABLE `coche` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa_tel`
--

DROP TABLE IF EXISTS `empresa_tel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresa_tel` (
  `RUT` varchar(12) NOT NULL,
  `tel` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`RUT`),
  CONSTRAINT `empresa_tel_ibfk_1` FOREIGN KEY (`RUT`) REFERENCES `Empresa` (`RUT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa_tel`
--

LOCK TABLES `empresa_tel` WRITE;
/*!40000 ALTER TABLE `empresa_tel` DISABLE KEYS */;
INSERT INTO `empresa_tel` VALUES ('1111111111','111-111-111'),('1234567890','123-456-890'),('2222222222','222-222-222'),('4444444444','444-444-444'),('5555555555','555-555-555'),('6666666666','666-666-666'),('7777777777','777-777-777'),('8888888888','888-888-888'),('9876543210','987-654-210'),('9999999999','999-999-999');
/*!40000 ALTER TABLE `empresa_tel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mantenimiento_coche`
--

DROP TABLE IF EXISTS `mantenimiento_coche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mantenimiento_coche` (
  `cod` int NOT NULL AUTO_INCREMENT,
  `concepto` enum('GASOIL','CAMBIO ACEITE','ELECTRICISTA','ALINEACIÓN Y BALANCEO','CAMBIO DE CUBIERTA','GOMERÍA','CAMBIO DE CORREA','FRENOS','EMBRAGUE','CHAPISTA','OTROS') DEFAULT NULL,
  `baja` tinyint(1) NOT NULL DEFAULT (1),
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mantenimiento_coche`
--

LOCK TABLES `mantenimiento_coche` WRITE;
/*!40000 ALTER TABLE `mantenimiento_coche` DISABLE KEYS */;
INSERT INTO `mantenimiento_coche` VALUES (1,'GASOIL',1),(2,'CAMBIO ACEITE',1),(3,'ELECTRICISTA',1),(4,'ALINEACIÓN Y BALANCEO',1),(5,'CAMBIO DE CUBIERTA',1);
/*!40000 ALTER TABLE `mantenimiento_coche` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_de_pago`
--

DROP TABLE IF EXISTS `metodo_de_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_de_pago` (
  `cod_pago` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`cod_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_de_pago`
--

LOCK TABLES `metodo_de_pago` WRITE;
/*!40000 ALTER TABLE `metodo_de_pago` DISABLE KEYS */;
INSERT INTO `metodo_de_pago` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);
/*!40000 ALTER TABLE `metodo_de_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `necesita`
--

DROP TABLE IF EXISTS `necesita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `necesita` (
  `cod_reserva` int NOT NULL,
  `cod` int DEFAULT NULL,
  PRIMARY KEY (`cod_reserva`),
  KEY `cod` (`cod`),
  CONSTRAINT `necesita_ibfk_1` FOREIGN KEY (`cod_reserva`) REFERENCES `Genera` (`cod_reserva`),
  CONSTRAINT `necesita_ibfk_2` FOREIGN KEY (`cod`) REFERENCES `metodo_de_pago` (`cod_pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `necesita`
--

LOCK TABLES `necesita` WRITE;
/*!40000 ALTER TABLE `necesita` DISABLE KEYS */;
INSERT INTO `necesita` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `necesita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poseen`
--

DROP TABLE IF EXISTS `poseen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `poseen` (
  `RUT` varchar(12) NOT NULL,
  `cod_cuenta` int DEFAULT NULL,
  `cod_pago` int DEFAULT NULL,
  `saldo` int DEFAULT '0',
  PRIMARY KEY (`RUT`),
  KEY `cod_pago` (`cod_pago`,`cod_cuenta`),
  CONSTRAINT `poseen_ibfk_1` FOREIGN KEY (`cod_pago`, `cod_cuenta`) REFERENCES `Cuenta_corriente` (`cod_pago`, `cod_cuenta`),
  CONSTRAINT `poseen_ibfk_2` FOREIGN KEY (`RUT`) REFERENCES `Empresa` (`RUT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poseen`
--

LOCK TABLES `poseen` WRITE;
/*!40000 ALTER TABLE `poseen` DISABLE KEYS */;
INSERT INTO `poseen` VALUES ('1111111111',104,4,80000),('1234567890',101,1,50000),('2222222222',109,9,130000),('4444444444',110,10,140000),('5555555555',103,3,70000),('6666666666',108,8,120000),('7777777777',106,6,100000),('8888888888',107,7,110000),('9876543210',102,2,60000),('9999999999',105,5,90000);
/*!40000 ALTER TABLE `poseen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienen`
--

DROP TABLE IF EXISTS `tienen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tienen` (
  `matricula` varchar(9) NOT NULL,
  `cod` int NOT NULL,
  `fecha` date NOT NULL,
  `importe` int NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`matricula`,`cod`),
  KEY `cod` (`cod`),
  CONSTRAINT `tienen_ibfk_1` FOREIGN KEY (`matricula`) REFERENCES `coche` (`matricula`),
  CONSTRAINT `tienen_ibfk_2` FOREIGN KEY (`cod`) REFERENCES `mantenimiento_coche` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienen`
--

LOCK TABLES `tienen` WRITE;
/*!40000 ALTER TABLE `tienen` DISABLE KEYS */;
INSERT INTO `tienen` VALUES ('SRE1234',1,'2023-10-10',150,'Cambio de aceite y filtros'),('SRE4321',3,'2023-08-15',100,'Alineación y balanceo'),('SRE5678',4,'2023-07-25',300,'Cambio de cubiertas'),('SRE7890',5,'2023-06-30',120,'Revisión de frenos'),('SRE9678',2,'2023-09-20',200,'Reparación eléctrica');
/*!40000 ALTER TABLE `tienen` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-14 23:58:59
