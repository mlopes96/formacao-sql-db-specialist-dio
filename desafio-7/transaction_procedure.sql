/*
PARTE 2 - TRANSAÇÃO COM PROCEDURE 
Você deverá criar outra transação, contudo, esta será definida dentro de uma procedure. 
Neste caso, assim como no exemplo em aula, deverá haver uma verificação de erro. 
Essa verificação irá acarretar um ROLLBACK, total ou parcial (SAVEPOINT). 
*/
use ecommerce;

-- Delete para testes da transação
delete from produtos_por_fornecedores where id_produto = 22;
delete from produtos_por_fornecedores where id_produto = 23;

-- Confere as informações inseridas nas tabelas
select * from produtos_por_fornecedores;
select * from produtos_por_estoques;

-- Delete da procedure
drop procedure insert_novos_produtos;

-- Chamada da procedure
call insert_novos_produtos();

-- Criação da procedure
DELIMITER //
CREATE PROCEDURE insert_novos_produtos()
BEGIN
	-- Cria a variável para controle do erro 
   DECLARE erro_sql BOOLEAN DEFAULT FALSE;

    -- Declara o handler de exceções SQL e seta erro_sql = true 
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro_sql = TRUE;

    START TRANSACTION;
    -- Cria o savepoint 01
    SAVEPOINT before_transaction_01;

    -- Insere novos produtos fornecidos pelo fornecedor 1
    INSERT INTO produtos_por_fornecedores (id_produto, id_fornecedor, quantidade, custo_produto_fornecedor) 
    VALUES (22, 1, 100, 15.9), (23, 1, 100, 10.9);

    IF erro_sql = FALSE THEN
       -- Se não ocorrer nenhum erro então insere os produtos no estoque 1
		insert into produtos_por_estoques(id_produto, id_estoque, quantidade, custo_produto_estoque) 
        values (14, 1, 100, 15.9), (15, 1, 100, 10.9);
        
        SELECT 'Transação bem sucedida!' AS Resultado;
    
    ELSE
		-- Se ocorrer um erro desfaz a transação
        ROLLBACK TO SAVEPOINT before_transaction_01;
        SELECT 'Erro na transação!' AS Resultado;
    
    END IF;
    
END //
DELIMITER ;