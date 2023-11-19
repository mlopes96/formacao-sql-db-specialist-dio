-- script para consulta dos dados armazenados nas tabelas da oficina
show databases;
create database oficina;
use oficina;


-- Veículos com Ordem de Serviço
select v.id_veiculo, v.placa, v.marca_modelo, os.numero_os
from veiculos v
join veiculo_os os on v.id_veiculo = os.id_veiculo;


-- Veículos sem nenhuma Ordem de Serviço
select v.id_veiculo, v.placa, v.marca_modelo
from veiculos v
where v.id_veiculo not in (select os.id_veiculo from veiculo_os os);


-- Clientes com Ordem de Serviço que ainda estão Aguardando Autorização
select c.nome, 
case when os.autorizacao_cliente = 'Aguardando Autorização' then 'Contatar Cliente'
else '' end as status,  concat(v.marca_modelo, ', ano ', v.ano) carro, os.valor_total, os.status_os,
date_format(os.data_emissao, '%d/%m/%Y') as data_emissao, date_format(os.data_conclusao, '%d/%m/%Y') as data_previsao 
from veiculos v
join clientes c on c.id_cliente = v.id_cliente
join veiculo_os v_o on v.id_veiculo = v_o.id_veiculo
join ordens_de_servico os on os.numero_os = v_o.numero_os
where os.autorizacao_cliente = 'Aguardando Autorização';


-- Contagem de Ordens de Serviço por Status da OS
select count(numero_os), status_os
from ordens_de_servico os
group by os.status_os
order by count(numero_os) desc;


-- Contagem de Ordens de Serviço por Status com mais de 2 OS
select count(numero_os), status_os
from ordens_de_servico os
group by os.status_os
having count(numero_os) >= 2
order by count(numero_os) desc;


-- Veículos com previsao de entrega nos próximos 7 dias
SELECT c.nome, concat(v.marca_modelo, ', ano ', v.ano, ', placa ', v.placa) carro, 
date_format(os.data_conclusao, '%d/%m/%Y') previsao_entrega, os.status_os, os.valor_total
FROM ordens_de_servico os 
join veiculo_os v_o on os.numero_os = v_o.numero_os
join veiculos v on v.id_veiculo = v_o.id_veiculo
join clientes c on c.id_cliente = v.id_cliente
WHERE os.data_conclusao <= (CURRENT_DATE + INTERVAL 7 DAY)
order by previsao_entrega;


-- Veículos com previsao de entrega para depois dos próximos 10 dias
SELECT c.nome, concat(v.marca_modelo, ', ano ', v.ano, ', placa ', v.placa) carro, 
date_format(os.data_conclusao, '%d/%m/%Y') previsao_entrega, os.status_os, os.valor_total
FROM ordens_de_servico os 
join veiculo_os v_o on os.numero_os = v_o.numero_os
join veiculos v on v.id_veiculo = v_o.id_veiculo
join clientes c on c.id_cliente = v.id_cliente
WHERE os.data_conclusao >= (CURRENT_DATE + INTERVAL 10 DAY)
order by previsao_entrega;


-- Relação de equipes e mecânicos 
select e.descricao equipe, m.nome, m.endereco
from equipes e 
join mecanicos m on e.id_equipe = m.id_equipe;


-- Soma do valor total das OS por equipes
select e.descricao equipe, count(os.numero_os) qtd_os, sum(os.valor_total) as soma_valor_total
from ordens_de_servico os
join equipes e on e.id_equipe = os.id_equipe
group by e.id_equipe
order by sum(os.valor_total) desc;


-- Soma do valor total das OS por equipes que tiveram mais de 2 OS
select e.descricao equipe, count(os.numero_os) qtd_os, sum(os.valor_total) as soma_valor_total
from ordens_de_servico os
join equipes e on e.id_equipe = os.id_equipe
group by e.id_equipe
having count(os.numero_os) >= 2
order by sum(os.valor_total) desc;


-- Serviços e peças que serão trocadas em cada carro que está com OS aberta
SELECT servicos.cliente, servicos.carro, servicos.numero_os, servicos.valor_total,
 servicos.servicos, servicos.valor_servicos, pecas.pecas, pecas.valor_pecas
FROM 
(
  SELECT c.nome cliente, concat(v.marca_modelo, ', ano ', v.ano, ', placa ', v.placa) carro,
  os.numero_os, os.valor_total, GROUP_CONCAT(DISTINCT ser.descricao) servicos, SUM(DISTINCT ser.valor) valor_servicos
  FROM ordens_de_servico os 
  join veiculo_os v_o on os.numero_os = v_o.numero_os
  join veiculos v on v.id_veiculo = v_o.id_veiculo
  join clientes c on c.id_cliente = v.id_cliente
  left join servicos_executados s_e on s_e.numero_os = os.numero_os
  left join servicos ser on ser.id_servico = s_e.id_servico
  GROUP BY c.nome, carro, numero_os, os.valor_total
) servicos
JOIN 
(
  SELECT os.numero_os, GROUP_CONCAT(p.descricao) pecas, SUM(p.valor) valor_pecas
  FROM ordens_de_servico os 
  left join pecas_trocadas p_t on p_t.numero_os = os.numero_os
  left join pecas p on p.id_peca = p_t.id_peca
  GROUP BY numero_os
) pecas ON servicos.numero_os = pecas.numero_os
order by servicos.carro;
