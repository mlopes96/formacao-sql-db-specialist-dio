/*
Parte 1 – Personalizando acessos com views 

Neste desafio você irá criar visões para os seguintes cenários 
Número de empregados por departamento e localidade 
Lista de departamentos e seus gerentes 
Projetos com maior número de empregados (ex: por ordenação desc) 
Lista de projetos, departamentos e gerentes 
Quais empregados possuem dependentes e se são gerentes 

Além disso, serão definidas as permissões de acesso as views de acordo com o tipo de conta de usuários. Lembre-se que as views ficam armazaneadas no banco de dados como uma “tabela”. Assim podemos definir permissão de acesso a este item do banco de dados.  
*/

use company_constraints;
show tables;

select * from works_on;
select * from departament;
select * from dept_locations;
select * from employee;
select * from dependent;

-- Número de empregados por departamento e localidade 
create or replace view v_emp_dept_location as
	SELECT d.Dname, location, count(Lname) employees
	FROM employee e 
	join departament d on e.Dno = d.Dnumber
	group by Dname, location
;

select * from v_emp_dept_location;


-- Quais são os departamentos por cidade? 
create or replace view v_dept_location as
	select Dname, Dlocation
	from departament d
	join dept_locations l on d.Dnumber = l.Dnumber
;

select * from v_dept_location;


-- Lista de departamentos e seus gerentes 
create or replace view v_dept_manager as
	select Dname, concat(Fname, ' ', Lname) Manager
	from departament d
	join employee e on e.Ssn = d.Mgr_ssn
;

select * from v_dept_manager;


-- Lista de projetos, departamentos e gerentes 
create or replace view v_project_dept_manager as
	select p.Pname, Dname, concat(Fname, ' ', Lname) Manager
	from departament d
	join employee e on e.Ssn = d.Mgr_ssn
	join project p on p.Dnum = d.Dnumber
;

select * from v_project_dept_manager;


-- Projetos com maior número de empregados (ex: por ordenação desc) 
create or replace view v_project_employee as
	select Pname, count(Essn) employees
	from works_on
	join project on Pno = Pnumber 
	group by Pname
	order by employees desc
;

select * from v_project_employee;


-- Quais empregados possuem dependentes e se são gerentes 
create or replace view v_dependent_employee as
	select concat(e.Fname, ' ', e.Lname) Employee, d.Dependent_name, d.Relationship,
	case  when Mgr_ssn = Ssn then 'Manager'
	else '' end as Manager
	from dependent d
	join employee e on d.Essn = e.Ssn
	left join departament dep on e.Ssn = dep.Mgr_ssn
;

select * from v_dependent_employee;


-- Cria os usuários e fornece as permissões de acesso às views criadas
use mysql;
show tables;
select * from user;

-- Cria o usuário employee e dá acesso para visualizar apenas 2 views
create user 'employee'@localhost identified by '123456789';
GRANT SELECT ON company_constraints.v_dept_location TO 'employee'@'localhost';
GRANT SELECT ON company_constraints.v_dept_manager TO 'employee'@'localhost';

-- Cria o usuário manager e dá acesso para visualizar todas as views
create user 'manager'@localhost identified by '123456789';
GRANT SELECT ON company_constraints.v_dependent_employee TO 'manager'@'localhost';
GRANT SELECT ON company_constraints.v_project_employee TO 'manager'@'localhost';
GRANT SELECT ON company_constraints.v_project_dept_manager TO 'manager'@'localhost';
GRANT SELECT ON company_constraints.v_dept_manager TO 'manager'@'localhost';
GRANT SELECT ON company_constraints.v_dept_location TO 'manager'@'localhost';
GRANT SELECT ON company_constraints.v_emp_dept_location TO 'manager'@'localhost';
