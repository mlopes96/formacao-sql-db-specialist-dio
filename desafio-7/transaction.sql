/*
PARTE 1 – TRANSAÇÕES 
Objetivo: Neste desafio você irá lidar com transações para executar modificações na base de dados. 
Sendo assim, vamos relembrar como executar uma transação. Primeiramente, é preciso desabilitar o autocommit do MySQL. 
Caso contrário, cada instrução SQL executada será confirmada. 

CODE 1
Essa primeira transação pode ser executada sem utilizar outros recursos como procedures. 
Dessa forma, você irá executar statements de consultas e modificações de dados persistidos no banco de dados via transações.  
*/
use ecommerce;

SET @@autocommit = off; 

-- Dá o start na transação
START TRANSACTION;
	SAVEPOINT before_transaction_produtos_por_fornecedores;
	-- Insere novos produtos fornecidos pelo fornecedor 1
	insert into produtos_por_fornecedores (id_produto, id_fornecedor, quantidade, custo_produto_fornecedor) values 
    (22, 1, 100, 15.9), (23, 1, 100, 10.9);
    
    -- Cria o savepoint
	SAVEPOINT insert_in_produtos_por_fornecedores_01;
    
    -- Mostra se os novos produtos foram inseridos no banco
    select * from produtos_por_fornecedores;
    
    -- Insere os produtos no estoque 1
	insert into produtos_por_estoques(id_produto, id_estoque, quantidade, custo_produto_estoque) values
	(22, 1, 100, 15.9), (23, 1, 100, 10.9);
    
    -- Cria o savepoint
	SAVEPOINT insert_in_produtos_por_estoques_01;
    
	-- Mostra se os novos produtos foram inseridos no banco
    select * from produtos_por_estoques;


-- ROLLBACK TO SAVEPOINT insercao_em_order;
rollback to savepoint before_transaction_produtos_por_fornecedores;
rollback to savepoint insert_in_produtos_por_fornecedores_01;
rollback to savepoint insert_in_produtos_por_estoques_01;

-- Comita as modificações
COMMIT;

-- Ativa novamente o autocommit
SET @@autocommit = 1; 