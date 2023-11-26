/* 
Parte 2 – Criando gatilhos para cenário de company
Sabemos que a criação de triggers está associadas a ações que podem ser tomadas em momento anterior ou posterior a inserção, ou atualização dos dados. 
Além disso, em casos de remoção podemos utilizar as triggers. Sendo assim, crie as seguintes triggers para o cenário de company. 

Triggers de atualização: before update statement
Atribuindo aumento de salário para um dept específico = 1 salary = salary * 1.20;

Triggers de remoção: before delete statement
salvando em outra tabela os employees demitidos usando old.attribute
*/
use company_constraints;
show tables;

show triggers from company_constraints;

-- Triggers de atualização: before update statement
# Atribuindo aumento de salário de acordo com o departamento do funcionário
delimiter \\ 
create trigger salary_dept before insert on company_constraints.employee 
for each row 
	begin 
		case new.Dno 
			when 1 then set new.Salary = new.Salary * 1.20; 
			when 2 then set new.Salary = new.Salary * 1.10;
            when 3 then set new.Salary = new.Salary * 1.05;
            when 4 then set new.Salary = new.Salary * 1.05;
            when 5 then set new.Salary = new.Salary * 1.05;
		end case; 
	end \\ 
delimiter ;  

drop trigger salary_dept;

-- Insert employee on dept 
insert into employee (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno) values 
			('Ahmad2', 'V', 'Jabbar', 987987988, null, null, null, 25000, null, 1);

insert into employee (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno) values 
			('Ahmad3', 'V', 'Jabbar', 987987955, null, null, null, 25000, null, 3);

select * from employee;


-- Triggers de remoção: before delete statement
# Salvando em outra tabela os employees demitidos
-- Cria nova tabela 
create table employee_fired(
	Fname varchar(15) not null,
    Lname varchar(15) not null,
    Ssn char(9) primary key, 
    Dno int not null
);

-- Cria a trigger
delimiter \\ 
create trigger insert_fired before delete on company_constraints.employee 
for each row 
	begin 
		insert into employee_fired (Fname,  Lname,  Ssn, Dno) values (old.Fname, old.Lname, old.Ssn, old.Dno);
	end \\ 
delimiter ;  

-- Testa trigger
DELETE FROM employee WHERE Ssn = '987987955';
DELETE FROM employee WHERE Ssn = '987987988';

select * from employee_fired;