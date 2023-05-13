use master;
drop database if exists x_employee_unique_id;
create database x_employee_unique_id;
go
use x_employee_unique_id;
go

create table Employees (
  id int,
  name varchar(50),
  primary key (id)
);

create table EmployeeUNI (
  id int,
  unique_id int,
  primary key (id, unique_id)
);

insert into Employees 
(id, name) values
(1, 'Alice'),
(7, 'Bob'),
(11, 'Meir'),
(90, 'Winston'),
(3, 'Jonathan');

insert into EmployeeUNI 
(id, unique_id) values
(3, 1),
(11, 2),
(90, 3);


-- show the unique id of each user, if a user does not have a unique id just show null

-- expected output
--------------------------------------------------------
-- unique_id  name
--------------------------------------------------------
-- null       Alice
-- null       Bob
-- 2          Meir
-- 3          Winston
-- 1          Jonathan

-- solution 1
select u.unique_id, e.name
from Employees e 
left join EmployeeUNI u on e.id = u.id
;
