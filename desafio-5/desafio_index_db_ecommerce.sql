use ecommerce;
show tables;
select * from produtos;
select * from clientes;
select * from fornecedores;
select * from vendedores;

-- Índice criado para otimizar a consulta dos clientes
ALTER TABLE clientes ADD INDEX cliente_nome(nome); 
show index from clientes;

-- Índice criado para otimizar a consulta dos produtos
ALTER TABLE produtos ADD INDEX produto(descricao); 
show index from produtos;

-- Índice criado para otimizar a consulta dos fornecedores
ALTER TABLE fornecedores ADD UNIQUE INDEX fornecedore(razao_social); 
drop index fornecedore on fornecedores;
ALTER TABLE fornecedores ADD UNIQUE INDEX fornecedor(razao_social); 
show index from fornecedores;

-- Índice criado para otimizar a consulta dos vendedores
ALTER TABLE vendedores ADD UNIQUE INDEX vendedor(nome); 
show index from vendedores;