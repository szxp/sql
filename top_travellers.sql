use master;
drop database if exists x_top_travellers;
create database x_top_travellers;
go
use x_top_travellers;
go

create table Users (
  id int,
  name varchar(50),
  primary key (id)
);

create table Rides (
  id int,
  user_id int,
  distance int
  primary key (id)
);

insert into Users 
(id, name) values
(1, 'Alice'),
(2, 'Bob'),
(3, 'Alex'),
(4, 'Donald'),
(7, 'Lee'),
(13, 'Jonathan'),
(19, 'Elvis');

insert into Rides 
(id, user_id, distance) values
(1, 1, 120),
(2, 2, 317),
(3, 3, 222),
(4, 7, 100),
(5, 13, 312),
(6, 19, 50),
(7, 7, 120),
(8, 19, 400),
(9, 7, 230);


-- report the distance travelled by ech user, ordered by travelled_distance in descending order, name in ascending

-- name     travelled_distance
-- Elvis	  450
-- Lee	    450
-- Bob	    317
-- Jonathan	312
-- Alex	    222
-- Alice	  120
-- Donald 	0

-- solution 1
select u.name, sum(coalesce(r.distance, 0)) as travelled_distance
from Users u
left join Rides r on u.id = r.user_id
group by u.id, u.name
order by travelled_distance desc, u.name asc
;
