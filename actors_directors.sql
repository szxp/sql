use master;
drop database if exists x_actors_directors;
create database x_actors_directors;
go
use x_actors_directors;
go

create table ActorDirector (
	actor_id int not null,
	director_id int not null,
  timestamp int not null,
  primary key (timestamp)
);

insert into ActorDirector (actor_id, director_id, timestamp) values
(1, 1, 0),
(1, 1, 1),
(1, 1, 2),
(1, 2, 3),
(1, 2, 4),
(2, 1, 5),
(2, 1, 6);


-- the pairs (actor_id, director_id) where they have cooperated at least three times

-- expected output
--------------------------------------------------------
-- actor_id   director_id
--------------------------------------------------------
-- 1          1


-- solution 1
select actor_id, director_id
from ActorDirector
group by actor_id, director_id
having count(timestamp) >= 3;

