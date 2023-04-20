use master;
drop database if exists x_swap_salary;
create database x_swap_salary;
go
use x_swap_salary;
go

create table Salary (
	id int not null,
	name varchar(50) not null,
  sex varchar(50) not null,
  salary int,
  primary key (id)
);

insert into Salary (id, name, sex, salary) values
(1, 'A', 'm', 2500),
(2, 'B', 'f', 1500),
(3, 'C', 'm', 5500),
(4, 'D', 'f', 50);


-- swap all 'f' and 'm' with a single update

-- expected output
--------------------------------------------------------
-- id   name  sex salary
--------------------------------------------------------
-- 1    A     f   2500
-- 2    B     m   1500
-- 3    C     f   5500
-- 4    D     m   500


-- solution 1
update Salary set sex = (case when sex = 'f' then 'm' else 'f' end);

select * from Salary;


