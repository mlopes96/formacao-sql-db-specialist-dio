-- Consulta dos dados do ecommerce
use ecommerce;
show tables;


-- Quantos pedidos foram feitos por cada cliente?
select c.nome cliente, count(p.id_pedido) qtd_pedidos, TRUNCATE(sum(p.valor_total), 2) gasto_total
from clientes c
join pedidos p on c.id_cliente = p.id_cliente
group by c.id_cliente;


 -- Média de valor gasto por cliente
select c.nome cliente, ROUND(avg(p.valor_total), 2) media_gasto
from clientes c
join pedidos p on c.id_cliente = p.id_cliente
group by c.nome;


-- Clientes que fizeram 2 ou mais pedidos
select c.nome cliente, count(p.id_pedido) qtd_pedidos, 
TRUNCATE(sum(p.valor_total), 2) gasto_total
from clientes c
join pedidos p on c.id_cliente = p.id_cliente
group by c.id_cliente
having count(p.id_pedido) >= 2;


-- Quantidade de clientes por tipo de conta
 select tipo, count(id_cliente) qtd
 from clientes
 group by tipo;
 
 
 -- Total faturado por tipo de cliente
select c.tipo, count(p.id_pedido) qtd_pedidos, ROUND(sum(p.valor_total), 2) total_faturado
from clientes c
join pedidos p on c.id_cliente = p.id_cliente
group by c.tipo;


-- Algum vendedor também é fornecedor?
select v.nome, v.documento
from vendedores v
where v.documento in (select cnpj from fornecedores);


-- Relação de produtos fornecedores e estoques
select p.descricao produto, p.valor valor_venda, p.categoria, f.razao_social fornecedor,
case when e.id_estoque = 1 then 'Estoque 1'
when e.id_estoque = 2 then 'Estoque 2'
else '' end as estoque,
pe.quantidade qtd_em_estoque, pe.custo_produto_estoque
from produtos p
join produtos_por_fornecedores pf on pf.id_produto = p.id_produto
join fornecedores f on f.id_fornecedor = pf.id_fornecedor
join produtos_por_estoques pe on pe.id_produto = p.id_produto
join estoques e on e.id_estoque = pe.id_estoque;


-- Relação de nomes dos fornecedores e nomes dos produtos;
select f.razao_social fornecedor, p.descricao produto, p.categoria
from produtos p
join produtos_por_fornecedores pf on pf.id_produto = p.id_produto
join fornecedores f on f.id_fornecedor = pf.id_fornecedor
order by f.razao_social;


-- Relação de nomes dos vendedores e nomes dos produtos;
select v.nome, p.descricao produto, p.categoria
from produtos p
join produtos_por_vendedores pv on pv.id_produto = p.id_produto
join vendedores v on v.id_vendedor = pv.id_vendedor
order by v.nome;


-- Cupom de desconto com base no valor da última compra para clientes que pagaram com Pix, Boleto ou Debito
select c.nome, p.id_pedido, p.valor_total,
case when fp.forma_pagamento = 'Pix' or fp.forma_pagamento = 'Debito' then ROUND((p.valor_total*10)/100, 2)
when fp.forma_pagamento = 'Boleto' then ROUND((p.valor_total*5)/100, 2)
else '' end as cupom
from clientes c
join pedidos p on c.id_cliente = p.id_cliente
join forma_pagamento fp on fp.id_forma_pagamento = p.id_forma_pagamento
where fp.forma_pagamento in ('Pix', 'Boleto', 'Debito');
 
 
 -- Status das entregas dos pedidos
 select status_entrega, count(id_pedido) pedidos
 from pedidos
 group by status_entrega
 order by pedidos desc;
 

-- Select das tabelas
select * from clientes;
select * from forma_pagamento;
select * from pedidos;
select * from fornecedores;
select * from vendedores;
select * from produtos_por_fornecedores;
select * from produtos;