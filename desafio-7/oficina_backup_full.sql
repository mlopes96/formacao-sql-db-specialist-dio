-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: localhost    Database: oficina_backup
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Current Database: `oficina_backup`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `oficina_backup` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `oficina_backup`;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `cpf` char(9) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `unique_cpf_cliente` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Maria Silva da Silva','123456789'),(2,'Mario Jose Rocha','134567892'),(3,'Jose Rocha Silva','146578923'),(4,'Pedro Jose Silva','156578924'),(5,'Maiara Pedroso','156578925');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipes`
--

DROP TABLE IF EXISTS `equipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipes` (
  `id_equipe` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`id_equipe`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipes`
--

LOCK TABLES `equipes` WRITE;
/*!40000 ALTER TABLE `equipes` DISABLE KEYS */;
INSERT INTO `equipes` VALUES (1,'Revisão Geral'),(2,'Manutenção Geral'),(3,'Mecânica Automotiva'),(4,'Estética Automotiva');
/*!40000 ALTER TABLE `equipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mecanicos`
--

DROP TABLE IF EXISTS `mecanicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mecanicos` (
  `id_mecanico` int NOT NULL AUTO_INCREMENT,
  `id_equipe` int DEFAULT NULL,
  `nome` varchar(45) NOT NULL,
  `endereco` varchar(45) NOT NULL,
  `especialidade` varchar(45) NOT NULL,
  PRIMARY KEY (`id_mecanico`),
  KEY `fk_mecanico_equipe` (`id_equipe`),
  CONSTRAINT `fk_mecanico_equipe` FOREIGN KEY (`id_equipe`) REFERENCES `equipes` (`id_equipe`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mecanicos`
--

LOCK TABLES `mecanicos` WRITE;
/*!40000 ALTER TABLE `mecanicos` DISABLE KEYS */;
INSERT INTO `mecanicos` VALUES (1,1,'Maria Silva','Rua dos Silvas, N99, Cidade Baixa','Revisão Geral'),(2,1,'Mario José','Rua dos Joses, N45, Cidade Alta','Troca de Óleo e Filtros'),(3,2,'Pedro José Silva','Rua dos Silvas, N85, Cidade Baixa','Ar Condicionado Automotivo'),(4,2,'Maiara Pedroso','Rua dos Pedrosos, N55, Cidade Alta','Elétrica Automotiva'),(5,3,'José Rocha','Rua dos Silvas, N55, Cidade Baixa','Mecânica Geral'),(6,3,'João Silva','Rua dos Silvas, N35, Cidade Baixa','Mecânica Geral'),(7,4,'Mário José','Rua dos Josés, N25,  Cidade Alta','Pintura Geral'),(8,4,'Lucas Pedroso','Rua dos Pedrosos, N75, Cidade Baixa','Polimento Automotivo');
/*!40000 ALTER TABLE `mecanicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordens_de_servico`
--

DROP TABLE IF EXISTS `ordens_de_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordens_de_servico` (
  `numero_os` int NOT NULL AUTO_INCREMENT,
  `id_equipe` int DEFAULT NULL,
  `valor_total` float NOT NULL DEFAULT '100',
  `data_emissao` date DEFAULT (curdate()),
  `data_conclusao` date DEFAULT ((curdate() + interval 5 day)),
  `status_os` enum('Aguardando Avaliação','Avaliada','Aguardando Autorização','Em processamento','Finalizada') DEFAULT 'Aguardando Avaliação',
  `autorizacao_cliente` enum('Aguardando Autorização','Autorizado') DEFAULT 'Aguardando Autorização',
  PRIMARY KEY (`numero_os`),
  KEY `fk_os_equipe` (`id_equipe`),
  CONSTRAINT `fk_os_equipe` FOREIGN KEY (`id_equipe`) REFERENCES `equipes` (`id_equipe`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordens_de_servico`
--

LOCK TABLES `ordens_de_servico` WRITE;
/*!40000 ALTER TABLE `ordens_de_servico` DISABLE KEYS */;
INSERT INTO `ordens_de_servico` VALUES (1,1,250,'2023-11-18','2023-11-25','Em processamento','Autorizado'),(2,1,350,'2023-11-18','2023-11-23','Aguardando Autorização','Aguardando Autorização'),(3,3,1000,'2023-11-18','2023-11-30','Avaliada','Autorizado'),(4,2,260,'2023-11-18','2023-11-23','Aguardando Autorização','Aguardando Autorização'),(5,2,300,'2023-11-18','2023-11-23','Em processamento','Autorizado'),(6,4,1600,'2023-11-18','2023-11-30','Aguardando Autorização','Aguardando Autorização');
/*!40000 ALTER TABLE `ordens_de_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pecas`
--

DROP TABLE IF EXISTS `pecas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pecas` (
  `id_peca` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  `valor` float NOT NULL DEFAULT '10',
  PRIMARY KEY (`id_peca`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pecas`
--

LOCK TABLES `pecas` WRITE;
/*!40000 ALTER TABLE `pecas` DISABLE KEYS */;
INSERT INTO `pecas` VALUES (1,'Óleo Automotivo Basic',25),(2,'Óleo Automotivo Premium',50),(3,'Filtro para Motor',50),(4,'Filtro Ar Condicionado',10),(5,'Conjunto de Lampâdas Automotivas',50),(6,'Conjunto de Peças para Motor',450),(7,'Kit de Tintas para Pintura Geral',550),(8,'Kit de Tintas para Reparos',250);
/*!40000 ALTER TABLE `pecas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pecas_trocadas`
--

DROP TABLE IF EXISTS `pecas_trocadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pecas_trocadas` (
  `id_peca` int NOT NULL,
  `numero_os` int NOT NULL,
  PRIMARY KEY (`numero_os`,`id_peca`),
  KEY `fk_pecas_trocadas_servico` (`id_peca`),
  CONSTRAINT `fk_pecas_trocadas_os` FOREIGN KEY (`numero_os`) REFERENCES `ordens_de_servico` (`numero_os`),
  CONSTRAINT `fk_pecas_trocadas_servico` FOREIGN KEY (`id_peca`) REFERENCES `pecas` (`id_peca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pecas_trocadas`
--

LOCK TABLES `pecas_trocadas` WRITE;
/*!40000 ALTER TABLE `pecas_trocadas` DISABLE KEYS */;
INSERT INTO `pecas_trocadas` VALUES (2,2),(3,2),(4,4),(5,5),(6,3),(7,6);
/*!40000 ALTER TABLE `pecas_trocadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicos`
--

DROP TABLE IF EXISTS `servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicos` (
  `id_servico` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  `valor` float NOT NULL DEFAULT '100',
  PRIMARY KEY (`id_servico`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicos`
--

LOCK TABLES `servicos` WRITE;
/*!40000 ALTER TABLE `servicos` DISABLE KEYS */;
INSERT INTO `servicos` VALUES (1,'Revisão Geral 20 itens',150),(2,'Revisão Geral 40 itens',250),(3,'Troca de Óleo e Filtros',100),(4,'Troca de Filtro Ar Condicionado',100),(5,'Manutenção Elétrica Geral',250),(6,'Manutenção Ar Condicionado',250),(7,'Manutenção Motor',550),(8,'Pintura Geral',1050),(9,'Reparos na Pintura',450),(10,'Polimento Automotivo',250);
/*!40000 ALTER TABLE `servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicos_executados`
--

DROP TABLE IF EXISTS `servicos_executados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicos_executados` (
  `id_servico` int NOT NULL,
  `numero_os` int NOT NULL,
  PRIMARY KEY (`numero_os`,`id_servico`),
  KEY `fk_servicos_executados_servico` (`id_servico`),
  CONSTRAINT `fk_servicos_executados_os` FOREIGN KEY (`numero_os`) REFERENCES `ordens_de_servico` (`numero_os`),
  CONSTRAINT `fk_servicos_executados_servico` FOREIGN KEY (`id_servico`) REFERENCES `servicos` (`id_servico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicos_executados`
--

LOCK TABLES `servicos_executados` WRITE;
/*!40000 ALTER TABLE `servicos_executados` DISABLE KEYS */;
INSERT INTO `servicos_executados` VALUES (1,2),(2,1),(3,2),(5,5),(6,4),(7,3),(8,6);
/*!40000 ALTER TABLE `servicos_executados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo_os`
--

DROP TABLE IF EXISTS `veiculo_os`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculo_os` (
  `id_veiculo` int NOT NULL,
  `numero_os` int NOT NULL,
  PRIMARY KEY (`id_veiculo`,`numero_os`),
  KEY `fk_veiculo_os_os` (`numero_os`),
  CONSTRAINT `fk_veiculo_os_os` FOREIGN KEY (`numero_os`) REFERENCES `ordens_de_servico` (`numero_os`),
  CONSTRAINT `fk_veiculo_os_veiculo` FOREIGN KEY (`id_veiculo`) REFERENCES `veiculos` (`id_veiculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo_os`
--

LOCK TABLES `veiculo_os` WRITE;
/*!40000 ALTER TABLE `veiculo_os` DISABLE KEYS */;
INSERT INTO `veiculo_os` VALUES (1,1),(2,2),(3,3),(4,4),(7,5),(8,6);
/*!40000 ALTER TABLE `veiculo_os` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculos`
--

DROP TABLE IF EXISTS `veiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veiculos` (
  `id_veiculo` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `placa` char(7) NOT NULL,
  `marca_modelo` varchar(25) NOT NULL,
  `ano` year NOT NULL DEFAULT '2000',
  PRIMARY KEY (`id_veiculo`),
  UNIQUE KEY `unique_placa_veiculo` (`placa`),
  KEY `fk_veiculo_cliente` (`id_cliente`),
  CONSTRAINT `fk_veiculo_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculos`
--

LOCK TABLES `veiculos` WRITE;
/*!40000 ALTER TABLE `veiculos` DISABLE KEYS */;
INSERT INTO `veiculos` VALUES (1,1,'ABCD123','Ford Mustang',1980),(2,1,'ABCD124','Ford Ecosport',2005),(3,2,'ABCD125','VW Gol',2000),(4,3,'ABCD126','VW Voyage',2000),(5,4,'ABCD127','Chevrolet Onix',2022),(6,5,'ABCD128','Chevrolet Cruze',2015),(7,4,'ABCD129','VW Passat',1985),(8,5,'ABCD120','Chevrolet Camaro',1969);
/*!40000 ALTER TABLE `veiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'oficina_backup'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-29  0:36:41
