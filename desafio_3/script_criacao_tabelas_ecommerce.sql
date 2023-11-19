create database ecommerce;
use ecommerce;

-- cria tabela clientes
create table clientes(
	id_cliente int auto_increment primary key,
	tipo enum('PF','PJ') not null,
	documento varchar(14) not null,
	nome varchar(45) not null,
	endereco varchar (65) not null,
	constraint unique_documento_cliente unique (documento)
);
-- alter table  clientes auto_increment=1;
-- desc clients;

-- cria tabela produtos
create table produtos(
	id_produto int auto_increment primary key,
	descricao varchar(255) not null,
	valor float not null,
	categoria enum('Alimentos','Brinquedos','Livros','Móveis','Eletrônicos','Limpeza','Vestuário') not null default 'Livros'
);
-- alter table produtos auto_increment=1;

-- cria tabela forma_pagamento
create table forma_pagamento(
	id_forma_pagamento int auto_increment primary key,
	id_cliente int,  
	forma_pagamento enum('Pix', 'Cartao', 'Boleto', 'Debito'),
	constraint fk_pagamento_cliente foreign key (id_cliente) references clientes(id_cliente)
);
-- alter table forma_pagamento auto_increment=1;
-- desc forma_pagamento;


-- cria tabela pedidos
create table pedidos(
	id_pedido int auto_increment primary key,
	valor_total float not null,
	valor_entrega float default 10,
	status_pedido enum('Cancelado','Confirmado','Em processamento') default 'Em processamento',
	status_entrega enum('Enviado','Aguardando Envio','Em Transporte', 'Recebido') default 'Aguardando Envio',
	codigo_rastreio varchar(15),
	id_cliente int,
	id_forma_pagamento int,
	constraint fk_pedidos_cliente foreign key (id_cliente) references clientes(id_cliente),
	constraint fk_pedidos_pagamento foreign key (id_forma_pagamento) references forma_pagamento(id_forma_pagamento)
);
-- alter table pedidos auto_increment=1;

-- cria tabela estoques
create table estoques(
	id_estoque int auto_increment primary key,
	local varchar(155) not null
);
-- alter table estoques auto_increment=1;


-- cria tabela fornecedores
create table fornecedores(
	id_fornecedor int auto_increment primary key,
	razao_social varchar(55) not null,
	cnpj char(14) not null,
 	constraint unique_cnpj unique (cnpj)
);
-- alter table fornecedores auto_increment=1;

-- criar tabela vendedores
create table vendedores(
	id_vendedor int auto_increment primary key,
	nome varchar(55) not null,
	documento varchar(14) not null,
	localizacao varchar (65),
 	constraint unique_documento_vendedor unique (documento)
);
-- alter table vendedores auto_increment=1;

-- tabelas de relacionamentos muitos para muitos

-- cria tabela produtos_por_pedidos
create table produtos_por_pedidos(
	id_produto int,
	id_pedido int,
	quantidade int default 1,
	primary key (id_produto, id_pedido),
	constraint fk_produtos_pedidos_produto foreign key (id_produto) references produtos(id_produto),
	constraint fk_produtos_pedidos_pedido foreign key (id_pedido) references pedidos(id_pedido)
);


-- cria tabela produtos_por_vendedores
create table produtos_por_vendedores(
	id_produto int,
	id_vendedor int,
	quantidade int default 1,
	primary key (id_produto, id_vendedor),
	constraint fk_produtos_vendedores_produto foreign key (id_produto) references produtos(id_produto),
	constraint fk_produtos_vendedores_vendedor foreign key (id_vendedor) references vendedores(id_vendedor)
);


-- cria tabela produtos_por_fornecedores
create table produtos_por_fornecedores(
	id_produto int,
	id_fornecedor int,
	quantidade int default 1,
	custo_produto_fornecedor float not null,
	primary key (id_produto, id_fornecedor),
	constraint fk_produtos_fornecedores_produto foreign key (id_produto) references produtos(id_produto),
	constraint fk_produtos_fornecedores_fornecedor foreign key (id_fornecedor) references fornecedores(id_fornecedor)
);


-- cria tabela produtos_por_estoques
create table produtos_por_estoques(
	id_produto int,
	id_estoque int,
	quantidade int default 1,
	custo_produto_estoque float not null,
	primary key (id_produto, id_estoque),
	constraint fk_produtos_estoques_produto foreign key (id_produto) references produtos(id_produto),
	constraint fk_produtos_estoques_estoque foreign key (id_estoque) references estoques(id_estoque)
);


-- confere as informações das foreign keys
show tables;

show databases;
use information_schema;
show tables;
desc referential_constraints;
select * from referential_constraints where constraint_schema = 'ecommerce';

