-- Criação de views para o cenário de ecommerce
use ecommerce;

-- View com a Relação de produtos fornecedores e estoques
create view v_prod_forn_estq as
	select p.descricao produto, p.valor valor_venda, p.categoria, f.razao_social fornecedor,
	case when e.id_estoque = 1 then 'Estoque 1'
	when e.id_estoque = 2 then 'Estoque 2'
	else '' end as estoque,
	pe.quantidade qtd_em_estoque, pe.custo_produto_estoque
	from produtos p
	join produtos_por_fornecedores pf on pf.id_produto = p.id_produto
	join fornecedores f on f.id_fornecedor = pf.id_fornecedor
	join produtos_por_estoques pe on pe.id_produto = p.id_produto
	join estoques e on e.id_estoque = pe.id_estoque
;

select * from v_prod_forn_estq;

-- Relação de nomes dos fornecedores e nomes dos produtos;
create view v_prod_forn as
	select f.razao_social fornecedor, p.descricao produto, p.categoria
	from produtos p
	join produtos_por_fornecedores pf on pf.id_produto = p.id_produto
	join fornecedores f on f.id_fornecedor = pf.id_fornecedor
	order by f.razao_social
;

select * from v_prod_forn;

-- Relação de nomes dos vendedores e nomes dos produtos;
create view v_prod_vend as
	select v.nome, p.descricao produto, p.categoria
	from produtos p
	join produtos_por_vendedores pv on pv.id_produto = p.id_produto
	join vendedores v on v.id_vendedor = pv.id_vendedor
	order by v.nome
;

select * from v_prod_vend;

-- Liberação de acesso para as views do ecommerce
use mysql;
select * from user;

-- Cria o usuário employee e dá acesso para visualizar apenas 2 views
create user 'ecommerce'@localhost identified by '123456';
GRANT SELECT ON ecommerce.v_prod_forn_estq TO 'ecommerce'@'localhost';
GRANT SELECT ON ecommerce.v_prod_forn TO 'ecommerce'@'localhost';
GRANT SELECT ON ecommerce.v_prod_vend TO 'ecommerce'@'localhost';