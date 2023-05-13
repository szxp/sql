use master;
drop database if exists x_unique_orders_customers;
create database x_unique_orders_customers;
go
use x_unique_orders_customers;
go

create table Orders (
  order_id int,
  order_date date,
  customer_id int,
  invoice int,
  primary key(order_id)
);

insert into Orders 
(order_id, order_date, customer_id, invoice) values
(1, '2020-09-15', 1, 30),
(2, '2020-09-17', 2, 90),
(3, '2020-10-06', 3, 20),
(4, '2020-10-20', 3, 21),
(5, '2020-11-10', 1, 10),
(6, '2020-11-21', 2, 15),
(7, '2020-12-01', 4, 55),
(8, '2020-12-03', 4, 77),
(9, '2021-01-07', 3, 31),
(10, '2021-01-15', 2, 20);

-- the number of unique orders and the number of unique customers with invoices > $20 for each different month

-- month    order_count customer_count
-- 2020-09	2	          2
-- 2020-10	1	          1
-- 2020-12	2	          1
-- 2021-01	1	          1

-- solution 1
select 
  substring(convert(varchar, order_date), 0, 8) as month,
  count(distinct order_id) as order_count,
  count(distinct customer_id) as customer_count
from Orders
where invoice > 20
group by substring(convert(varchar, order_date), 0, 8)
order by month
;