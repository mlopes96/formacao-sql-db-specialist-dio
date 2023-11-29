-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce_backup
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
-- Current Database: `ecommerce_backup`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ecommerce_backup` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ecommerce_backup`;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `tipo` enum('PF','PJ') NOT NULL,
  `documento` varchar(14) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `endereco` varchar(65) NOT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `unique_documento_cliente` (`documento`),
  KEY `cliente_nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (9,'PF','123456789','Maria Silva da Silva','Rua dos Silvas, N79, Cidade Baixa - Cidade das Rosas'),(10,'PF','134567892','Mario Jose Rocha','Rua dos Joses, N45, Cidade Alta - Cidade das Rosas'),(11,'PF','146578923','Jose Rocha Silva','Rua dos Silvas, N55, Cidade Baixa - Cidade das Rosas'),(12,'PF','156578924','Pedro Jose Silva','Rua dos Silvas, N45, Cidade Baixa - Cidade das Rosas'),(13,'PF','156578925','Maiara Pedroso','Rua dos Pedrosos, N55, Cidade Alta - Cidade das Rosas'),(14,'PJ','14678923555556','Comercio dos Silvas','Rua dos Silvas, N5, Cidade Baixa - Cidade das Rosas'),(15,'PJ','14678923555557','Comercio dos Rochas','Rua dos Joses, N25, Cidade Alta - Cidade das Rosas'),(16,'PJ','14678923555558','Venda do Silva','Rua dos Silvas, N40, Cidade Baixa - Cidade das Rosas');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `insert_desativado` BEFORE DELETE ON `clientes` FOR EACH ROW begin 
		insert into clientes_desativados (id_cliente, tipo, documento, nome, endereco) values (old.id_cliente, old.tipo, old.documento, old.nome, old.endereco);
	end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `clientes_desativados`
--

DROP TABLE IF EXISTS `clientes_desativados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes_desativados` (
  `id_cliente` int DEFAULT NULL,
  `tipo` enum('PF','PJ') NOT NULL,
  `documento` varchar(14) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `endereco` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes_desativados`
--

LOCK TABLES `clientes_desativados` WRITE;
/*!40000 ALTER TABLE `clientes_desativados` DISABLE KEYS */;
INSERT INTO `clientes_desativados` VALUES (17,'PF','123456777','Maria Silva Teste','Rua dos Silvas, N79, Cidade Baixa - Cidade das Rosas'),(18,'PJ','123456755','Teste PJ','Rua dos Silvas, N79, Cidade Baixa - Cidade das Rosas');
/*!40000 ALTER TABLE `clientes_desativados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estoques`
--

DROP TABLE IF EXISTS `estoques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoques` (
  `id_estoque` int NOT NULL AUTO_INCREMENT,
  `local` varchar(155) NOT NULL,
  PRIMARY KEY (`id_estoque`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estoques`
--

LOCK TABLES `estoques` WRITE;
/*!40000 ALTER TABLE `estoques` DISABLE KEYS */;
INSERT INTO `estoques` VALUES (1,'Rua dos Joses, N150, Cidade Alta - Cidade das Rosas'),(2,'Rua dos Silvas, N145, Cidade Baixa - Cidade das Rosas');
/*!40000 ALTER TABLE `estoques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forma_pagamento`
--

DROP TABLE IF EXISTS `forma_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forma_pagamento` (
  `id_forma_pagamento` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `forma_pagamento` enum('Pix','Cartao','Boleto','Debito') DEFAULT NULL,
  PRIMARY KEY (`id_forma_pagamento`),
  KEY `fk_pagamento_cliente` (`id_cliente`),
  CONSTRAINT `fk_pagamento_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forma_pagamento`
--

LOCK TABLES `forma_pagamento` WRITE;
/*!40000 ALTER TABLE `forma_pagamento` DISABLE KEYS */;
INSERT INTO `forma_pagamento` VALUES (1,9,'Pix'),(2,10,'Pix'),(3,11,'Pix'),(4,12,'Cartao'),(5,13,'Cartao'),(6,14,'Boleto'),(7,15,'Boleto'),(8,16,'Boleto'),(9,9,'Debito'),(10,10,'Cartao');
/*!40000 ALTER TABLE `forma_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedores`
--

DROP TABLE IF EXISTS `fornecedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedores` (
  `id_fornecedor` int NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(55) NOT NULL,
  `cnpj` char(14) NOT NULL,
  PRIMARY KEY (`id_fornecedor`),
  UNIQUE KEY `unique_cnpj` (`cnpj`),
  UNIQUE KEY `fornecedor` (`razao_social`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedores`
--

LOCK TABLES `fornecedores` WRITE;
/*!40000 ALTER TABLE `fornecedores` DISABLE KEYS */;
INSERT INTO `fornecedores` VALUES (1,'Editora do Saber','14678923555511'),(2,'Fábrica de Móveis Silva','14678923555555'),(3,'Fábrica de Brinquedos Pedroso','14678923555566'),(4,'Fábrica de Produtos de Limpeza Sanitudo','14678923555577'),(5,'Importadora de Eletrônicos ImportaTudo','14678923555588');
/*!40000 ALTER TABLE `fornecedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `valor_total` float NOT NULL,
  `valor_entrega` float DEFAULT '10',
  `status_pedido` enum('Cancelado','Confirmado','Em processamento') DEFAULT 'Em processamento',
  `status_entrega` enum('Enviado','Aguardando Envio','Em Transporte','Recebido') DEFAULT 'Aguardando Envio',
  `codigo_rastreio` varchar(15) DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  `id_forma_pagamento` int DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_pedidos_cliente` (`id_cliente`),
  KEY `fk_pedidos_pagamento` (`id_forma_pagamento`),
  CONSTRAINT `fk_pedidos_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `fk_pedidos_pagamento` FOREIGN KEY (`id_forma_pagamento`) REFERENCES `forma_pagamento` (`id_forma_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,899.9,10,'Confirmado','Em Transporte','A10000001',9,1),(2,2599.9,10,'Em processamento','Aguardando Envio','A10000002',10,10),(3,89.8,10,'Cancelado','Aguardando Envio','A10000003',12,4),(4,144.4,10,'Em processamento','Aguardando Envio','A10000004',14,10),(5,499.9,10,'Confirmado','Em Transporte','A10000005',9,1),(6,599.9,10,'Confirmado','Enviado','A10000006',10,10),(7,1199.9,10,'Confirmado','Recebido','A10000007',11,3),(8,125.8,10,'Confirmado','Recebido','A100000010',13,5),(9,3199.8,10,'Em processamento','Aguardando Envio','A10000008',15,7),(10,899.9,10,'Em processamento','Aguardando Envio','A10000009',16,8);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id_produto` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  `valor` float NOT NULL,
  `categoria` enum('Alimentos','Brinquedos','Livros','Móveis','Eletrônicos','Limpeza','Vestuário') NOT NULL DEFAULT 'Livros',
  PRIMARY KEY (`id_produto`),
  KEY `produto` (`descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Viagem ao Centro da Terra',29.9,'Livros'),(2,'Da Terra a Lua',24.9,'Livros'),(3,'Volta ao Mundo em 180 dias',19.9,'Livros'),(4,'Carrinho com controle remoto',59.9,'Brinquedos'),(5,'Coleção Boneco do Chaves',99.9,'Brinquedos'),(6,'Coleção Turma da Mônica',109.9,'Brinquedos'),(7,'Sofá Retrátil',1199.9,'Móveis'),(8,'Conjunto de Sofá',1899.9,'Móveis'),(9,'Rack para TV',599.9,'Móveis'),(10,'Smart TV 40\"',2599.9,'Eletrônicos'),(11,'Videogame Joga Muito',499.9,'Eletrônicos'),(12,'Smartphone Tudo em 1',899.9,'Eletrônicos'),(13,'Desinfetante 3 em 1 Sanitudo',9.9,'Limpeza'),(14,'Água Sanitária Sanitudo',6.9,'Limpeza'),(15,'Vassoura Varritudo',25.9,'Limpeza'),(16,'Camiseta Uniforme',35.9,'Vestuário'),(17,'Camiseta Branca',25.9,'Vestuário'),(18,'Calça Uniforme',85.9,'Vestuário'),(22,'Produto de Exemplo',15,'Brinquedos'),(23,'Manual de Algoritmos',18,'Livros'),(24,'Smartphone',1900,'Eletrônicos');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `black_friday` BEFORE INSERT ON `produtos` FOR EACH ROW begin 
		case new.categoria
			when 'Livros' then set new.valor = new.valor * 0.90; 
            when 'Eletrônicos' then set new.valor = new.valor * 0.95; 
             when 'Brinquedos' then set new.valor = new.valor * 0.75; 
		end case; 
	end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `produtos_por_estoques`
--

DROP TABLE IF EXISTS `produtos_por_estoques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos_por_estoques` (
  `id_produto` int NOT NULL,
  `id_estoque` int NOT NULL,
  `quantidade` int DEFAULT '1',
  `custo_produto_estoque` float NOT NULL,
  PRIMARY KEY (`id_produto`,`id_estoque`),
  KEY `fk_produtos_estoques_estoque` (`id_estoque`),
  CONSTRAINT `fk_produtos_estoques_estoque` FOREIGN KEY (`id_estoque`) REFERENCES `estoques` (`id_estoque`),
  CONSTRAINT `fk_produtos_estoques_produto` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos_por_estoques`
--

LOCK TABLES `produtos_por_estoques` WRITE;
/*!40000 ALTER TABLE `produtos_por_estoques` DISABLE KEYS */;
INSERT INTO `produtos_por_estoques` VALUES (1,1,100,14.9),(2,1,100,9.9),(4,1,10,39.9),(5,1,10,69.9),(8,2,10,1099.9),(9,2,10,169.9),(10,2,10,1499.9),(11,2,10,169.9),(12,2,20,469.9),(13,1,100,4.9),(14,1,100,2.9),(15,1,100,14.9),(22,1,100,15.9),(23,1,100,10.9);
/*!40000 ALTER TABLE `produtos_por_estoques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos_por_fornecedores`
--

DROP TABLE IF EXISTS `produtos_por_fornecedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos_por_fornecedores` (
  `id_produto` int NOT NULL,
  `id_fornecedor` int NOT NULL,
  `quantidade` int DEFAULT '1',
  `custo_produto_fornecedor` float NOT NULL,
  PRIMARY KEY (`id_produto`,`id_fornecedor`),
  KEY `fk_produtos_fornecedores_fornecedor` (`id_fornecedor`),
  CONSTRAINT `fk_produtos_fornecedores_fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedores` (`id_fornecedor`),
  CONSTRAINT `fk_produtos_fornecedores_produto` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos_por_fornecedores`
--

LOCK TABLES `produtos_por_fornecedores` WRITE;
/*!40000 ALTER TABLE `produtos_por_fornecedores` DISABLE KEYS */;
INSERT INTO `produtos_por_fornecedores` VALUES (1,1,100,14.9),(2,1,100,9.9),(4,3,10,39.9),(5,3,10,69.9),(8,2,10,1099.9),(9,2,10,169.9),(10,5,10,1499.9),(11,5,10,169.9),(12,5,20,469.9),(13,4,100,4.9),(14,4,100,2.9),(15,4,100,14.9),(22,1,100,15.9),(23,1,100,10.9);
/*!40000 ALTER TABLE `produtos_por_fornecedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos_por_pedidos`
--

DROP TABLE IF EXISTS `produtos_por_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos_por_pedidos` (
  `id_produto` int NOT NULL,
  `id_pedido` int NOT NULL,
  `quantidade` int DEFAULT '1',
  PRIMARY KEY (`id_produto`,`id_pedido`),
  KEY `fk_produtos_pedidos_pedido` (`id_pedido`),
  CONSTRAINT `fk_produtos_pedidos_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  CONSTRAINT `fk_produtos_pedidos_produto` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos_por_pedidos`
--

LOCK TABLES `produtos_por_pedidos` WRITE;
/*!40000 ALTER TABLE `produtos_por_pedidos` DISABLE KEYS */;
INSERT INTO `produtos_por_pedidos` VALUES (1,3,1),(4,3,1),(5,8,1),(7,7,1),(9,6,1),(9,9,1),(10,2,1),(10,9,1),(11,5,1),(12,1,1),(12,10,1),(13,4,5),(14,4,10),(15,4,1),(15,8,1);
/*!40000 ALTER TABLE `produtos_por_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos_por_vendedores`
--

DROP TABLE IF EXISTS `produtos_por_vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos_por_vendedores` (
  `id_produto` int NOT NULL,
  `id_vendedor` int NOT NULL,
  `quantidade` int DEFAULT '1',
  PRIMARY KEY (`id_produto`,`id_vendedor`),
  KEY `fk_produtos_vendedores_vendedor` (`id_vendedor`),
  CONSTRAINT `fk_produtos_vendedores_produto` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`),
  CONSTRAINT `fk_produtos_vendedores_vendedor` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedores` (`id_vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos_por_vendedores`
--

LOCK TABLES `produtos_por_vendedores` WRITE;
/*!40000 ALTER TABLE `produtos_por_vendedores` DISABLE KEYS */;
INSERT INTO `produtos_por_vendedores` VALUES (3,1,50),(6,3,10),(7,2,15);
/*!40000 ALTER TABLE `produtos_por_vendedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_prod_forn`
--

DROP TABLE IF EXISTS `v_prod_forn`;
/*!50001 DROP VIEW IF EXISTS `v_prod_forn`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_prod_forn` AS SELECT 
 1 AS `fornecedor`,
 1 AS `produto`,
 1 AS `categoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_prod_forn_estq`
--

DROP TABLE IF EXISTS `v_prod_forn_estq`;
/*!50001 DROP VIEW IF EXISTS `v_prod_forn_estq`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_prod_forn_estq` AS SELECT 
 1 AS `produto`,
 1 AS `valor_venda`,
 1 AS `categoria`,
 1 AS `fornecedor`,
 1 AS `estoque`,
 1 AS `qtd_em_estoque`,
 1 AS `custo_produto_estoque`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_prod_vend`
--

DROP TABLE IF EXISTS `v_prod_vend`;
/*!50001 DROP VIEW IF EXISTS `v_prod_vend`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_prod_vend` AS SELECT 
 1 AS `nome`,
 1 AS `produto`,
 1 AS `categoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vendedores`
--

DROP TABLE IF EXISTS `vendedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedores` (
  `id_vendedor` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(55) NOT NULL,
  `documento` varchar(14) NOT NULL,
  `localizacao` varchar(65) DEFAULT NULL,
  PRIMARY KEY (`id_vendedor`),
  UNIQUE KEY `unique_documento_vendedor` (`documento`),
  UNIQUE KEY `vendedor` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedores`
--

LOCK TABLES `vendedores` WRITE;
/*!40000 ALTER TABLE `vendedores` DISABLE KEYS */;
INSERT INTO `vendedores` VALUES (1,'Livraria do Saber','14678923555522','Rua dos Silvas, N10, Cidade Baixa - Cidade das Rosas'),(2,'Fábrica de Móveis Silva','14678923555555','Rua dos Silvas, N20, Cidade Baixa - Cidade das Rosas'),(3,'Loja de Brinquedos Pedroso','14678923556655','Rua dos Pedrosos, N25, Cidade Alta - Cidade das Rosas');
/*!40000 ALTER TABLE `vendedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `ecommerce_backup`
--

USE `ecommerce_backup`;

--
-- Final view structure for view `v_prod_forn`
--

/*!50001 DROP VIEW IF EXISTS `v_prod_forn`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_prod_forn` AS select `f`.`razao_social` AS `fornecedor`,`p`.`descricao` AS `produto`,`p`.`categoria` AS `categoria` from ((`produtos` `p` join `produtos_por_fornecedores` `pf` on((`pf`.`id_produto` = `p`.`id_produto`))) join `fornecedores` `f` on((`f`.`id_fornecedor` = `pf`.`id_fornecedor`))) order by `f`.`razao_social` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_prod_forn_estq`
--

/*!50001 DROP VIEW IF EXISTS `v_prod_forn_estq`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_prod_forn_estq` AS select `p`.`descricao` AS `produto`,`p`.`valor` AS `valor_venda`,`p`.`categoria` AS `categoria`,`f`.`razao_social` AS `fornecedor`,(case when (`e`.`id_estoque` = 1) then 'Estoque 1' when (`e`.`id_estoque` = 2) then 'Estoque 2' else '' end) AS `estoque`,`pe`.`quantidade` AS `qtd_em_estoque`,`pe`.`custo_produto_estoque` AS `custo_produto_estoque` from ((((`produtos` `p` join `produtos_por_fornecedores` `pf` on((`pf`.`id_produto` = `p`.`id_produto`))) join `fornecedores` `f` on((`f`.`id_fornecedor` = `pf`.`id_fornecedor`))) join `produtos_por_estoques` `pe` on((`pe`.`id_produto` = `p`.`id_produto`))) join `estoques` `e` on((`e`.`id_estoque` = `pe`.`id_estoque`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_prod_vend`
--

/*!50001 DROP VIEW IF EXISTS `v_prod_vend`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_prod_vend` AS select `v`.`nome` AS `nome`,`p`.`descricao` AS `produto`,`p`.`categoria` AS `categoria` from ((`produtos` `p` join `produtos_por_vendedores` `pv` on((`pv`.`id_produto` = `p`.`id_produto`))) join `vendedores` `v` on((`v`.`id_vendedor` = `pv`.`id_vendedor`))) order by `v`.`nome` */;
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

-- Dump completed on 2023-11-29  0:00:19
