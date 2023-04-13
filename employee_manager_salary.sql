use master;
drop database if exists x_employee_manager_salary;
create database x_employee_manager_salary;
go
use x_employee_manager_salary;
go

create table Employee(
	id int not null,
	name varchar(50) not null,
	salary int not null,
    managerId int,
    primary key (id)
);

insert into Employee (id, name, salary, managerId) values
(1, 'Joe',   70000, 3),
(2, 'Henry', 80000, 4),
(3, 'Sam',   60000, null),
(4, 'Max',   90000, null);

-- expected output
--------------------------------------------------------
-- Employee
--------------------------------------------------------
-- Joe

select e.name as Employee
from Employee e 
join Employee m on e.managerId = m.id
where e.salary > m.salary;

