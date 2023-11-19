-- inserção de dados nas tabelas do ecommerce
use ecommerce;

show tables;
-- insert tabela clientes
-- tipo, documento, nome, endereco
insert into clientes (tipo, documento, nome, endereco) values
	('PF',  123456789, 'Maria Silva da Silva','Rua dos Silvas, N79, Cidade Baixa - Cidade das Rosas'),
	('PF',  134567892, 'Mario Jose Rocha','Rua dos Joses, N45, Cidade Alta - Cidade das Rosas'),
	('PF',  146578923, 'Jose Rocha Silva','Rua dos Silvas, N55, Cidade Baixa - Cidade das Rosas'),
	('PF',  156578924, 'Pedro Jose Silva','Rua dos Silvas, N45, Cidade Baixa - Cidade das Rosas'),
	('PF',  156578925, 'Maiara Pedroso','Rua dos Pedrosos, N55, Cidade Alta - Cidade das Rosas'),
	('PJ',  14678923555556, 'Comercio dos Silvas','Rua dos Silvas, N5, Cidade Baixa - Cidade das Rosas'),
	('PJ',  14678923555557, 'Comercio dos Rochas','Rua dos Joses, N25, Cidade Alta - Cidade das Rosas'),
	('PJ',  14678923555558, 'Venda do Silva','Rua dos Silvas, N40, Cidade Baixa - Cidade das Rosas')
;
select * from clientes;

-- insert tabela forma_pagamento
-- forma_pagamento enum('Pix', 'Cartao', 'Boleto', 'Debito')
insert into forma_pagamento (id_cliente, forma_pagamento ) values
	(9 ,'Pix'), (10 ,'Pix'), (11 ,'Pix'), (12 ,'Cartao'), (13 ,'Cartao'),
    (14 ,'Boleto'), (15 ,'Boleto'), (16 ,'Boleto'), (9 ,'Debito'), (10 ,'Cartao')
;
select * from forma_pagamento;

-- insert tabela produtos
-- descricao, valor, categoria('Alimentos','Brinquedos','Livros','Móveis','Eletrônicos','Limpeza','Vestuário')
insert into produtos (descricao, categoria, valor) values
	('Viagem ao Centro da Terra', default, 29.90),
	('Da Terra a Lua', default, 24.90),
	('Volta ao Mundo em 180 dias', default, 19.90),
	('Carrinho com controle remoto', 'Brinquedos', 59.90),
	('Coleção Boneco do Chaves', 'Brinquedos', 99.90),
	('Coleção Turma da Mônica', 'Brinquedos', 109.90),
	('Sofá Retrátil', 'Móveis', 1199.90),
	('Conjunto de Sofá', 'Móveis', 1899.90),
	('Rack para TV', 'Móveis', 599.90),
	('Smart TV 40"', 'Eletrônicos', 2599.90),
	('Videogame Joga Muito', 'Eletrônicos', 499.90),
	('Smartphone Tudo em 1', 'Eletrônicos', 899.90),
	('Desinfetante 3 em 1 Sanitudo', 'Limpeza', 9.90),
	('Água Sanitária Sanitudo', 'Limpeza', 6.90),
	('Vassoura Varritudo', 'Limpeza', 25.90),
	('Camiseta Uniforme', 'Vestuário', 35.90),
	('Camiseta Branca', 'Vestuário', 25.90),
	('Calça Uniforme', 'Vestuário', 85.90)
;
select * from produtos;

-- insert tabela estoques
insert into estoques (local) values
	('Rua dos Joses, N150, Cidade Alta - Cidade das Rosas'),
	('Rua dos Silvas, N145, Cidade Baixa - Cidade das Rosas')
;
select * from estoques;


-- insert tabela fornecedores
insert into fornecedores (razao_social, cnpj) values
	('Editora do Saber', 14678923555511),
	('Fábrica de Móveis Silva', 14678923555555),
	('Fábrica de Brinquedos Pedroso', 14678923555566),
	('Fábrica de Produtos de Limpeza Sanitudo', 14678923555577),
	('Importadora de Eletrônicos ImportaTudo', 14678923555588)
;
select * from fornecedores;

-- insert tabela vendedores
insert into vendedores (nome, documento, localizacao) values
	('Livraria do Saber', 14678923555522, 'Rua dos Silvas, N10, Cidade Baixa - Cidade das Rosas'),
	('Fábrica de Móveis Silva', 14678923555555, 'Rua dos Silvas, N20, Cidade Baixa - Cidade das Rosas'),
	('Loja de Brinquedos Pedroso', 14678923556655,  'Rua dos Pedrosos, N25, Cidade Alta - Cidade das Rosas')
;
select * from vendedores;

-- insert produtos_por_fornecedores
insert into produtos_por_fornecedores (id_produto, id_fornecedor, quantidade, custo_produto_fornecedor) values
	(1, 1, 100, 14.9), (2, 1, 100, 9.9), 
	(4, 3, 10, 39.9), (5, 3, 10, 69.9),
    (8, 2, 10, 1099.9), (9, 2, 10, 169.9),
    (10, 5, 10, 1499.9), (11, 5, 10, 169.9), (12, 5, 20, 469.9),
    (13, 4, 100, 4.9), (14, 4, 100, 2.9), (15, 4, 100, 14.9)
;
select * from produtos_por_fornecedores;

-- insert produtos_por_vendedores
insert into produtos_por_vendedores (id_produto, id_vendedor, quantidade) values
	(3, 1, 50), (6, 3, 10), (7, 2, 15)
;
select * from produtos_por_vendedores;
    
-- insert produtos_por_estoques
insert into produtos_por_estoques(id_produto, id_estoque, quantidade, custo_produto_estoque) values
	(1, 1, 100, 14.9), (2, 1, 100, 9.9), 
	(4, 1, 10, 39.9), (5, 1, 10, 69.9),
    (8, 2, 10, 1099.9), (9, 2, 10, 169.9),
    (10, 2, 10, 1499.9), (11, 2, 10, 169.9), (12, 2, 20, 469.9),
    (13, 1, 100, 4.9), (14, 1, 100, 2.9), (15, 1, 100, 14.9)
;
select * from produtos_por_estoques;

-- insert tabela pedidos
-- status_pedido enum('Cancelado','Confirmado','Em processamento') default 'Em processamento'
-- status_entrega enum('Enviado','Aguardando Envio','Em Transporte', 'Recebido') default 'Aguardando Envio'
insert into pedidos (id_cliente, id_forma_pagamento, valor_total, valor_entrega, status_pedido, status_entrega, codigo_rastreio) values 
	(9, 1, 899.9, default, default , default, 'A10000001'),
    (10, 10, 2599.9, default, default , default, 'A10000002'),
    (12, 4, 89.8, default, default , default, 'A10000003'),
	(14, 10, 144.4, default, default , default, 'A10000004')
;

-- atualiza as informações de alguns pedidos
update pedidos 
set status_pedido = 'Confirmado', status_entrega = 'Recebido'
where id_pedido = 7; 

select * from  pedidos;

-- insere mais itens na tabela pedidos
insert into pedidos (id_cliente, id_forma_pagamento, valor_total, valor_entrega, status_pedido, status_entrega, codigo_rastreio) values 
	(9, 1, 499.9, default, default , default, 'A10000005'),
    (10, 10, 599.9, default, default , default, 'A10000006'),
    (11, 3, 1199.9, default, default , default, 'A10000007'),
    (13, 5, 125.8, default, default , default, 'A100000010'),
	(15, 7, 3199.8, default, default , default, 'A10000008'),
    (16, 8, 899.9, default, default , default, 'A10000009')
;
select * from  pedidos;
    
-- insere dados na tabela produtos_por_pedidos
insert into produtos_por_pedidos (id_produto, id_pedido, quantidade) values
	(11, 5, 1), (9, 6, 1), (7, 7, 1), 
    (5, 8, 1), (15, 8 ,1), 
    (9, 9, 1), (10, 9, 1),
    (12, 10, 1)
;
select * from  produtos_por_pedidos;
  

