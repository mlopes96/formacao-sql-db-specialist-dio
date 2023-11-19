-- inserção de dados nas tabelas da oficina mecanica
use oficina;
show tables;

-- insert tabela clientes
insert into clientes (cpf, nome) values
	(123456789, 'Maria Silva da Silva'),
	(134567892, 'Mario Jose Rocha'),
	(146578923, 'Jose Rocha Silva'),
	(156578924, 'Pedro Jose Silva'),
	(156578925, 'Maiara Pedroso')
;
select * from clientes;

-- insert tabela veiculos
insert into veiculos (id_cliente, placa, marca_modelo, ano) values
	(1, 'ABCD123', 'Ford Mustang', 1980),
	(1, 'ABCD124', 'Ford Ecosport', 2005),
	(2, 'ABCD125', 'VW Gol', default),
    (3, 'ABCD126', 'VW Voyage', default),
    (4, 'ABCD127', 'Chevrolet Onix', 2022),
    (5, 'ABCD128', 'Chevrolet Cruze', 2015),
    (4, 'ABCD129', 'VW Passat', 1985),
    (5, 'ABCD120', 'Chevrolet Camaro', 1969)
;
select * from veiculos;

-- insert tabela equipes
insert into equipes (descricao) values
	('Revisão Completa'), ('Reparos Gerais'), ('Manutenção Geral'), ('Pintura Geral')
;

-- altera a descricao das equipes
update equipes set descricao = 'Revisão Geral' where id_equipe = 1; 
update equipes set descricao = 'Manutenção Geral' where id_equipe = 2; 
update equipes set descricao = 'Mecânica Automotiva' where id_equipe = 3; 
update equipes set descricao = 'Estética Automotiva' where id_equipe = 4; 
select * from equipes;

-- insert tabela mecanicos
insert into mecanicos (id_equipe, nome, endereco, especialidade) values
	(1, 'Maria Silva','Rua dos Silvas, N99, Cidade Baixa', 'Revisão Geral'),
	(1, 'Mario José','Rua dos Joses, N45, Cidade Alta', 'Troca de Óleo e Filtros'),
	(2, 'Pedro José Silva','Rua dos Silvas, N85, Cidade Baixa', 'Ar Condicionado Automotivo'),
	(2, 'Maiara Pedroso','Rua dos Pedrosos, N55, Cidade Alta', 'Elétrica Automotiva'),
    (3, 'José Rocha','Rua dos Silvas, N55, Cidade Baixa', 'Mecânica Geral'),
    (3, 'João Silva','Rua dos Silvas, N35, Cidade Baixa', 'Mecânica Geral'),
    (4, 'Mário José','Rua dos Josés, N25,  Cidade Alta', 'Pintura Geral'),
    (4, 'Lucas Pedroso','Rua dos Pedrosos, N75, Cidade Baixa', 'Polimento Automotivo')
;
select * from mecanicos;


-- insert tabela serviços
insert into servicos(descricao, valor) values
	('Revisão Geral 20 itens', 150),
    ('Revisão Geral 40 itens', 250),
    ('Troca de Óleo e Filtros', default),
	('Troca de Filtro Ar Condicionado', default),
    ('Manutenção Elétrica Geral', 250),
    ('Manutenção Ar Condicionado', 250),
	('Manutenção Motor', 550),
    ('Pintura Geral', 1050),
    ('Reparos na Pintura', 450),
    ('Polimento Automotivo', 250)
;
select * from servicos;

-- insert tabela peças
insert into pecas(descricao, valor) values
	('Óleo Automotivo Basic', 25),
    ('Óleo Automotivo Premium', 50),
    ('Filtro para Motor', 50),
	('Filtro Ar Condicionado', default),
    ('Lâmpada Automotiva', default),
    ('Conjunto de Peças para Motor', 450),
    ('Kit de Tintas para Pintura Geral', 550),
    ('Kit de Tintas para Reparos', 250)
;
select * from pecas;

update pecas
set descricao = 'Conjunto de Lampâdas Automotivas', valor = 50
where id_peca = 5;

-- insert tabela ordens_de_serviço
-- status_os enum('Aguardando Avaliação','Avaliada','Aguardando Autorização','Em processamento','Finalizada') default 'Aguardando Avaliação',
-- autorizacao_cliente enum('Aguardando Autorização', 'Autorizado') default 'Aguardando Autorização',
insert into ordens_de_servico (id_equipe, valor_total, data_emissao, data_conclusao, status_os, autorizacao_cliente) values
	-- (1, 250, default, default,  default,  default),
    -- (1, 350, default, default,  default,  default),
    -- (3, 1000, default, default,  default,  default)
    -- (2, 260, default, default,  default,  default)
    -- (2, 300, default, default,  default,  default)
    -- (4, 1600, default, default,  default,  default)
;
select * from ordens_de_servico;

-- atualiza as informações de algumas os
update ordens_de_servico 
set data_conclusao = '2023-11-25'
where numero_os in (1); 


-- insert tabela veiculo_os
select * from veiculo_os;
insert into veiculo_os (id_veiculo, numero_os) values
	-- (1, 1), (2,2), (3, 3), (4, 4), (7, 5), (8, 6)
    ;

-- insert tabela servicos_executados
select * from servicos_executados;
insert into servicos_executados (id_servico, numero_os) values
	-- (2, 1), (1, 2), (3, 2), (7, 3), (6, 4), (5,5), (8, 6)
    ;

-- insert tabela pecas_trocadas
select * from pecas_trocadas;
insert into pecas_trocadas(id_peca, numero_os) values
	-- (2, 2), (3, 2), (6, 3), (4, 4), (5,5), (7, 6)
;

