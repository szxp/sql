use master;
drop database if exists x_employee_bonus;
create database x_employee_bonus;
go
use x_employee_bonus;
go

create table Employee (
	empId int not null,
	name varchar(50) not null,
    supervisor int,
	salary int not null,
    primary key (empId)
);

create table Bonus (
	empId int not null,
	bonus int not null,
    primary key (empId)
);

alter table Employee
    add constraint FK_Employee_supervisor
    foreign key (supervisor)
    references Employee (empId);

alter table Bonus
    add constraint FK_Bonus_empId
    foreign key (empId)
    references Employee (empId);


insert into Employee (empId, name, supervisor, salary) values
(3, 'Brad', null, 4000),
(1, 'John',	3, 1000),
(2, 'Dan', 	3, 2000),
(4, 'Thomas', 3,  4000);

insert into Bonus (empId, bonus) values
(2, 500),
(4, 2000);


-- name and bonus amount of each employee with a bonus less than 1000

-- expected output
--------------------------------------------------------
-- name		bonus
--------------------------------------------------------
-- Brad		null
-- John		null
-- Dan		500

select e.name, b.bonus
from Employee e 
left join Bonus b on e.empId = b.empId
where b.bonus is null or b.bonus < 1000;


