use master;
drop database if exists x_big_countries;
create database x_big_countries;
go
use x_big_countries;
go

create table World (
	name varchar(50) not null,
	continent varchar(50) not null,
	area bigint not null,
	population bigint not null,
	gdp bigint not null,
    primary key (name)
);

insert into World (name, continent, area, population, gdp) values
('Afghanistan', 'Asia', 652230, 25500100, 20343000000),
('Albania', 'Europe', 28748, 2831741, 12960000000),
('Algeria', 'Africa', 2381741, 37100000, 188681000000),
('Andorra', 'Europe', 468, 78115, 3712000000),
('Angola', 'Africa', 1246700, 20609294, 100990000000);


-- big countries 
-- if it has an area of at least three million, 
-- or if it has a population of at least twenty-five million

-- expected output
--------------------------------------------------------
-- name			population		area
--------------------------------------------------------
-- Afghanistan	25500100		652230
-- Algeria		37100000		2381741

-- solution 1
select name, population, area
from World
where area >= 3000000 or population >= 25000000;






