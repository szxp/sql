use master;
drop database if exists x_consecutive_available_seats;
create database x_consecutive_available_seats;
go
use x_consecutive_available_seats;
go

create table Cinema (
	seat_id int not null,
	free bit not null,
    primary key (seat_id)
);


insert into Cinema (seat_id, free) values
(1, 1),
(2, 0),
(3, 1),
(4, 1),
(5, 1);


-- expected output
--------------------------------------------------------
-- seat_id
--------------------------------------------------------
-- 3
-- 4
-- 5

-- solution 1
select r.seat_id
from (select
	*,
	lead(free) over (order by seat_id) as nextFree,
	lag(free) over (order by seat_id) as prevFree
from Cinema) as r
where r.free = 1 and (r.nextFree = 1 or r.prevFree = 1);
