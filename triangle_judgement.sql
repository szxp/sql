use master;
drop database if exists x_triangle_judgement;
create database x_triangle_judgement;
go
use x_triangle_judgement;
go

create table Triangle (
	x int not null,
	y int not null,
    z int not null
    primary key (x, y, z)
);

insert into Triangle (x, y, z) values
(13, 15, 30),
(10, 20, 15);


-- every three line segments whether they can form a triangle

-- expected output
--------------------------------------------------------
-- x    y   z   triangle
--------------------------------------------------------
-- 13   15  30  No
-- 10   20  15  Yes


-- solution 1
select x, y, z, 
  case 
    when (x+y>z) and (y+z>x) and (z+x>y) then 'Yes'
    else 'No'
  end as Triangle
from Triangle;


