use master;
drop database if exists x_Departments_invalid_departments;
create database x_Departments_invalid_departments;
go
use x_Departments_invalid_departments;
go

create table Departments (
  id int,
  name varchar(50),
  primary key (id)
);

create table Students (
  id int,
  name varchar(50),
  department_id int,
  primary key (id)
);

insert into Departments 
(id, name) values
(1, 'Electrical Engineering'),
(7, 'Computer Engineering'),
(13, 'Business Administration');

insert into Students 
(id, name, department_id) values
(23, 'Alice', 1),
(1, 'Bob', 7),
(5, 'Jennifer', 13),
(2, 'John', 14),
(4, 'Jasmine', 77),
(3, 'Steve', 74),
(6, 'Luis', 1),
(8, 'Jonathan', 7),
(7, 'Daiana', 33),
(11, 'Madelynn', 1);


-- the id and the name of all students who are enrolled in departments that no longer exist

-- expected output
--------------------------------------------------------
-- id     name
--------------------------------------------------------
-- 2      John
-- 7      Dainana
-- 4      Jasmine
-- 3      Steve

-- solution 1
select s.id, s.name
from Students s 
left join Departments d on s.department_id = d.id
where d.id is null;
;
