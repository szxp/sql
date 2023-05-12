use master;
drop database if exists x_team_size;
create database x_team_size;
go
use x_team_size;
go

create table Employee (
  employee_id int,
  team_id int,
  primary key (employee_id)
);

insert into Employee 
(employee_id, team_id) values
(1, 8),
(2, 8),
(3, 8),
(4, 7),
(5, 9),
(6, 9);


-- the team size of each of the employees

-- expected output
--------------------------------------------------------
-- employee_id    team_id
--------------------------------------------------------
-- 1              3 
-- 2              3 
-- 3              3 
-- 4              1 
-- 5              2 
-- 6              2 

-- solution 1
with Team (team_id, size) as (
  select team_id, count(employee_id)
  from Employee
  group by team_id
)
select e.employee_id, t.size
from Employee e 
join Team t on e.team_id = t.team_id
order by e.employee_id asc
;

select employee_id, count(team_id) over(partition by team_id order by team_id) as size
from Employee
order by employee_id asc
;
