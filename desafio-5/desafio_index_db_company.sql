use company_constraints;
/*
Criação de índices para consultas para o cenário de company com as perguntas (queries sql) para recuperação de informações. Sendo assim, dentro do script será criado os índices com base na consulta SQL.  

O que será levado em consideração para criação dos índices? 
Quais os dados mais acessados 
Quais os dados mais relevantes no contexto 

Lembre-se da função do índice... ele impacta diretamente na velocidade da buca pelas informações no SGBD. Crie apenas aqueles que são importantes. Sendo assim, adicione um README dentro do repositório do Github explicando os motivos que o levaram a criar tais índices.
ALTER TABLE customer ADD UNIQUE index_email(email); 
CREATE INDEX index_ativo_hash ON exemplo(ativo) USING HASH; 

Perguntas:  
Qual o departamento com maior número de pessoas? 
Quais são os departamentos por cidade? 
Relação de empregrados por departamento 
*/
 show tables;
 
-- Qual o departamento com maior número de pessoas? 
SELECT d.Dname, count(Ssn) qtd_employee
FROM employee e 
join departament d on e.Dno = d.Dnumber
group by d.Dnumber
order by  qtd_employee desc limit 1;

-- O índice criado para otimizar essa consulta foi sobre o nome do departamento
ALTER TABLE departament ADD UNIQUE index_departament(Dname); 
show index from departament;


-- Relação de empregados por departamento 
SELECT d.Dname, concat(Fname, ' ', Lname) as employee
FROM employee e 
join departament d on e.Dno = d.Dnumber
order by Dname;

-- O índice criado para otimizar essa consulta foi sobre o nome do departamento
-- O índice criado para otimizar essa consulta foi sobre o nome do departamento
ALTER TABLE departament ADD UNIQUE index_departament(Dname); 
show index from departament;


-- Quais são os departamentos por cidade? 
select Dname, Dlocation
from departament d
join dept_locations l on d.Dnumber = l.Dnumber;

-- O índice criado para otimizar essa consulta foi sobre o nome da cidade
ALTER TABLE dept_locations ADD INDEX index_location(Dlocation); 
show index from dept_locations;