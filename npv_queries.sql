use master;
drop database if exists x_npv_queries;
create database x_npv_queries;
go
use x_npv_queries;
go

create table NPV (
  id int,
  year int,
  npv int,
  primary key (id, year)
);

create table Queries (
  id int,
  year int,
  distance int
  primary key (id, year)
);

insert into NPV 
(id, year, npv) values
(1, 2018, 100),
(7, 2020, 30),
(13, 2019, 40),
(1, 2019, 113),
(2, 2008, 121),
(3, 2009, 12),
(11, 2020, 99),
(7, 2019, 0);

insert into Queries 
(id, year) values
(1, 2019),
(2, 2008),
(3, 2009),
(7, 2018),
(7, 2019),
(7, 2020),
(13, 2019);

-- npv of each query


-- solution 1
select q.id, q.year, coalesce(n.npv, 0)
from Queries q
left join NPV n on q.id = n.id and q.year = n.year
;
