use master;
drop database if exists x_sold_product_date;
create database x_sold_product_date;
go
use x_sold_product_date;
go

create table Activities (
  sell_date date,
  product varchar(50)
);

insert into Activities 
(sell_date, product) values
('2020-05-30', 'Headphone'),
('2020-06-01', 'Pencil'),
('2020-06-02', 'Mask'),
('2020-05-30', 'Basketball'),
('2020-06-01', 'Bible'),
('2020-06-02', 'Mask'),
('2020-05-30', 'T-Shirt');

-- for each date the number of different products sold and their names
-- names should be sorted lexicographically

-- sell_date  num_sold  products
-- 2020-05-30	3	        Basketball,Headphone,T-Shirt
-- 2020-06-01	2	        Bible,Pencil
-- 2020-06-02	1	        Mask

-- solution 1
with Sold(sell_date, product) as (
  select sell_date, product
  from Activities 
  group by sell_date, product
)
select sell_date, count(distinct product) as num_sold, string_agg(product, ',') as products
from Sold 
group by sell_date
;
