/* 
Parte 2 – Criando gatilhos para cenário de Ecommerce
Sabemos que a criação de triggers está associadas a ações que podem ser tomadas em momento anterior ou posterior a inserção, ou atualização dos dados. 
Além disso, em casos de remoção podemos utilizar as triggers. Sendo assim, crie as seguintes triggers para o cenário de company. 

Triggers de atualização: before update statement
Desconto por causa da Black Fiday

Triggers de remoção: before delete statement
Usuários podem excluir suas contas por algum motivo. Dessa forma, para não perder as informações sobre estes usuários, crie um gatilho before remove 
*/
use ecommerce;
show tables;

show triggers from ecommerce;

-- Triggers de atualização: before update statement
# Desconto em razão da Black Fiday
delimiter \\ 
create trigger black_friday before insert on ecommerce.produtos 
for each row 
	begin 
		case new.categoria
			when 'Livros' then set new.valor = new.valor * 0.90; 
            when 'Eletrônicos' then set new.valor = new.valor * 0.95; 
			when 'Brinquedos' then set new.valor = new.valor * 0.75; 
		end case; 
	end \\ 
delimiter ;  

drop trigger black_friday;

-- Insert produtos
insert into produtos (descricao, valor, categoria) values ('Produto de Exemplo', 20, 'Brinquedos');
insert into produtos (descricao, valor, categoria) values ('Manual de Algoritmos', 20, 'Livros');
insert into produtos (descricao, valor, categoria) values ('Smartphone', 2000, 'Eletrônicos');

select * from produtos;


-- Triggers de remoção: before delete statement
# Usuários podem excluir suas contas por algum motivo. 
# Dessa forma, para não perder as informações sobre estes usuários, crie um gatilho before remove.

-- Cria nova tabela para os clientes desativados
create table clientes_desativados(
	id_cliente int,
	tipo enum('PF','PJ') not null,
	documento varchar(14) not null,
	nome varchar(45) not null,
	endereco varchar (65) not null
);

-- Cria a trigger
delimiter \\ 
create trigger insert_desativado before delete on ecommerce.clientes
for each row 
	begin 
		insert into clientes_desativados (id_cliente, tipo, documento, nome, endereco) values (old.id_cliente, old.tipo, old.documento, old.nome, old.endereco);
	end \\ 
delimiter ;  

drop trigger insert_desativado;

-- Insere novos clientes
insert into clientes (tipo, documento, nome, endereco) values
	('PF',  123456777, 'Maria Silva Teste','Rua dos Silvas, N79, Cidade Baixa - Cidade das Rosas'),
    ('PJ',  123456755, 'Teste PJ','Rua dos Silvas, N79, Cidade Baixa - Cidade das Rosas');
select * from clientes;

-- Testa trigger
DELETE FROM clientes WHERE id_cliente = 17;
DELETE FROM clientes WHERE id_cliente = 18;

select * from clientes_desativados;