use master;
drop database if exists x_biggest_single_number;
create database x_biggest_single_number;
go
use x_biggest_single_number;
go

create table MyNumbers (
	num int not null
);

insert into MyNumbers (num) values
(8),
(8),
(3),
(4),
(1),
(4),
(5),
(6);


-- biggest single number that appears only once in the table

-- expected output
--------------------------------------------------------
-- num
--------------------------------------------------------
-- 6

 
-- solution 1
with cte as 
(
  select num
  from MyNumbers
  group by num
  having count(num) = 1
)
select
  case when count(*) > 0 then max(num)
  else null
  end as num
from cte;


delete from MyNumbers;
insert into MyNumbers (num) values
(8),
(8),
(7),
(7),
(3),
(3),
(3);

-- expected output
--------------------------------------------------------
-- num
--------------------------------------------------------
-- null

-- solution 1
with cte as 
(
  select num
  from MyNumbers
  group by num
  having count(num) = 1
)
select
  case when count(*) > 1 then max(num)
  else null
  end as num
from cte;
