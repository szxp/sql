use master;
drop database if exists x_queries_quality;
create database x_queries_quality;
go
use x_queries_quality;
go

create table Queries (
  query_name varchar(50) not null,
  result varchar(50) not null,
  position int not null,
  rating int not null
);

insert into Queries 
(query_name, result, position, rating) values
('Dog', 'Golden Retriever', 1,    5),
('Dog', 'German Shepherd',  2,    5),
('Dog', 'Mule',             200,  1),
('Cat', 'Shirazi',          5,    2),
('Cat', 'Siamese',          3,    3),
('Cat', 'Sphynx',           7,    4);


-- quality: the average of the ratio between query rating and its position
-- poor query percentage: the percentage of all queries with rating less than 3
-- find each query_name, quality, poor_query_percentage, rounded to 2 decimal places

-- expected output
--------------------------------------------------------
-- query_name   quality   poor_query_percentage
--------------------------------------------------------
-- Dog          2.50      33.33
-- Cat          0.66      33.33


-- solution 1
select 
  query_name, 
  cast(avg(round(rating / cast(position as numeric), 2)) as numeric(19,2)) as quality,
  cast(((select cast(count(query_name) as numeric(19,2)) from Queries where rating < 3) / (select cast(count(query_name) as numeric(19,2)) from Queries)) * 100.0 as numeric(19,2)) as poor_query_percentage
from Queries
group by query_name;

-- another solution: with common table expression
