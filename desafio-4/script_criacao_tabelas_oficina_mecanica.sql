-- script para criação das tabelas da oficina
show databases;
create database oficina;
use oficina;

-- cria tabela clientes
create table clientes(
	id_cliente int auto_increment primary key,		
	nome varchar(45) not null,
	cpf char(9) not null,
	constraint unique_cpf_cliente unique (cpf)
);
-- alter table  clientes auto_increment=1;

-- desc clients;

-- cria tabela veiculos
create table veiculos(
	id_veiculo int auto_increment primary key,
	id_cliente int,
	placa char(7) not null,
	marca_modelo varchar(25) not null,
	ano YEAR not null default '2000',
	constraint fk_veiculo_cliente foreign key (id_cliente) references clientes(id_cliente),
	constraint unique_placa_veiculo unique (placa)
);

drop table veiculos;


-- cria tabela equipes
create table equipes(
	id_equipe int auto_increment primary key,
	descricao varchar(45) not null
);


-- cria tabela mecanicos
create table mecanicos(
	id_mecanico int auto_increment primary key,
	id_equipe int,	
	nome varchar(45) not null,
	endereco varchar(45) not null,
	especialidade varchar(45) not null,
	constraint fk_mecanico_equipe foreign key (id_equipe) references equipes(id_equipe)
);


-- cria tabela ordens_de_serviço
create table ordens_de_servico(
	numero_os int auto_increment primary key,
	id_equipe int,
	valor_total float not null default 100,
	data_emissao DATE DEFAULT (CURRENT_DATE),
	data_conclusao DATE DEFAULT (CURRENT_DATE + INTERVAL 5 DAY),
	status_os enum('Aguardando Avaliação','Avaliada','Aguardando Autorização','Em processamento','Finalizada') default 'Aguardando Avaliação',
	autorizacao_cliente enum('Aguardando Autorização', 'Autorizado') default 'Aguardando Autorização',
	constraint fk_os_equipe foreign key (id_equipe) references equipes(id_equipe)
);


-- cria tabela veiculo_os
create table veiculo_os(
	id_veiculo int,
	numero_os int,
	primary key (id_veiculo, numero_os),
	constraint fk_veiculo_os_veiculo foreign key (id_veiculo) references veiculos(id_veiculo),
	constraint fk_veiculo_os_os foreign key (numero_os) references ordens_de_servico(numero_os)
);

-- cria tabela serviços
create table servicos(
	id_servico int auto_increment primary key,
	descricao varchar(45) not null,
	valor float not null default 100
);

-- cria tabela servicos_executados
create table servicos_executados(
	id_servico int,
	numero_os int,
	primary key (numero_os, id_servico),
	constraint fk_servicos_executados_servico foreign key (id_servico) references servicos(id_servico),
	constraint fk_servicos_executados_os foreign key (numero_os) references ordens_de_servico(numero_os)
);


-- cria tabela peças
create table pecas(
	id_peca int auto_increment primary key,
	descricao varchar(45) not null,
	valor float not null default 10
);


-- cria tabela pecas_trocadas
create table pecas_trocadas(
	id_peca int,
	numero_os int,
	primary key (numero_os, id_peca),
	constraint fk_pecas_trocadas_servico foreign key (id_peca) references pecas(id_peca),
	constraint fk_pecas_trocadas_os foreign key (numero_os) references ordens_de_servico(numero_os)
);


-- confere as informações das tabelas
show tables;

-- confere as informações das foreign keys
show databases;
use information_schema;
show tables;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'ecommerce';

