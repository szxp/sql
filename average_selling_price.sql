use master;
drop database if exists x_average_selling_price;
create database x_average_selling_price;
go
use x_average_selling_price;
go

create table Prices (
  product_id int,
  start_date date,
  end_date date,
  price int
);

create table UnitsSold (
  product_id int,
  purchase_date date,
  units int,
);


insert into Prices 
(product_id, start_date, end_date, price) values
(1, '2019-02-17', '2019-02-28', 5),
(1, '2019-03-01', '2019-03-22', 20),
(2, '2019-02-01', '2019-02-20', 15),
(2, '2019-02-21', '2019-03-31', 30);

insert into UnitsSold 
(product_id, purchase_date, units) values
(1, '2019-02-25', 100),
(1, '2019-03-01', 15),
(2, '2019-02-10', 200),
(2, '2019-03-22', 30);

-- average selling price for each product rounded to 2 decimals

-- expected output
--------------------------------------------------------
-- product_id   average_price
--------------------------------------------------------
-- 1	          6.96
-- 2	          16.96

-- solution 1
select u.product_id, cast(sum(p.price * u.units) / cast(sum (u.units) as numeric) as numeric(38,2)) as average_price
from UnitsSold u 
join Prices p on p.product_id = u.product_id and p.start_date <= u.purchase_date and u.purchase_date <= p.end_date
group by u.product_id
;
