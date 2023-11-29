-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.35
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
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
-- Dumping routines for database 'ecommerce'
--
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_novos_produtos`()
BEGIN
	-- Cria a variável para controle do erro 
   DECLARE erro_sql BOOLEAN DEFAULT FALSE;

    -- Declara o handler de exceções SQL e seta erro_sql = true 
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro_sql = TRUE;

    START TRANSACTION;
    -- Cria o savepoint 01
    SAVEPOINT before_transaction_01;

    -- Insere novos produtos fornecidos pelo fornecedor 1
    INSERT INTO produtos_por_fornecedores (id_produto, id_fornecedor, quantidade, custo_produto_fornecedor) VALUES 
        (22, 1, 100, 15.9), (23, 1, 100, 10.9);

    IF erro_sql = FALSE THEN
       -- Insere os produtos no estoque 1
		insert into produtos_por_estoques(id_produto, id_estoque, quantidade, custo_produto_estoque) values
		(14, 1, 100, 15.9), (15, 1, 100, 10.9);
        SELECT 'Transação bem sucedida!' AS Resultado;
    ELSE
        ROLLBACK TO SAVEPOINT before_transaction_01;
        SELECT 'Erro na transação!' AS Resultado;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_produtos`(
	in opcao_p int,
    in id_prod_p int,
	in desc_p varchar(255),
    in valor_p float,
    in categ_p enum('Alimentos','Brinquedos','Livros','Móveis','Eletrônicos','Limpeza','Vestuário')
)
begin
	-- opcao 1 = insert
	if opcao_p = 1 then
		if (length(desc_p) > 0) and (length (valor_p) > 0) and (length(categ_p) > 0) then 
			insert into produtos (descricao, categoria, valor) values (desc_p, categ_p, valor_p);
			select 'Produto inserido!' as Message;
		else
			select 'Os dados fornecidos não podem estar vazios!' as Message_error;
		end if;
	-- opcao 2 = update
	elseif opcao_p = 2 then
		if id_prod_p IS NOT NULL AND id_prod_p <> '' then
			if (length(desc_p) > 0) or (length (valor_p) > 0) or (length(categ_p) > 0) then 
				UPDATE produtos SET 
				descricao = IF(desc_p IS NOT NULL AND desc_p <> '', desc_p, descricao),
				categoria = IF(categ_p IS NOT NULL AND categ_p <> '', categ_p, categoria),
				valor = IF(valor_p IS NOT NULL AND valor_p <> '', valor_p, valor)
				WHERE id_produto = id_prod_p;
				select 'Produto atualizado!' as Message, descricao, valor, categoria from produtos where id_produto = id_prod_p;
			else
				select 'Pelo menos uma informação precisa ser atualizada!' as Message_error;
			end if;
		else
			select 'O ID do Produto não pode estar vazio!' as Message_error;
		end if;
	-- opção 3 = delete
    elseif opcao_p = 3 then
		if id_prod_p IS NOT NULL AND id_prod_p <> '' then
			delete from produtos where id_produto = id_prod_p;
			select 'Produto deletado!' as Message;
		else
			select 'O ID do Produto não pode estar vazio!' as Message_error;
		end if;            
    else
		select 'Opção inválida!' as Message_error;
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-29  0:14:25
