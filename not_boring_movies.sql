use master;
drop database if exists x_not_boring_movies;
create database x_not_boring_movies;
go
use x_not_boring_movies;
go

create table Cinema (
	id int not null,
	movie varchar(50) not null,
  description varchar(50) not null,
  rating numeric(19,2),
  primary key (id)
);

insert into Cinema (id, movie, description, rating) values
(1, 'War', 'great 3D', 8.9),
(2, 'Science', 'fiction', 8.5),
(3, 'irish', 'boring', 6.2),
(4, 'Ice song', 'Fantasy', 8.6),
(5, 'House card', 'Interesting', 9.1);


-- movie with an odd-numbered id and a description 
-- that is not "boring" in decending rating order

-- expected output
--------------------------------------------------------
-- id   movie       description   rating
--------------------------------------------------------
-- 5    House card  Interesting   9.1
-- 1    War         great 3D      8.9


-- solution 1
select id, movie, description, rating
from Cinema
where id%2 = 1 and description <> 'boring'
order by rating desc;


