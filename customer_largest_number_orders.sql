use master;
drop database if exists x_customer_largest_number_orders;
create database x_customer_largest_number_orders;
go
use x_customer_largest_number_orders;
go

create table Orders (
	order_number int not null,
	customer_number int not null,
    primary key (order_number)
);

insert into Orders (order_number, customer_number) values
(1, 1),
(2, 2),
(3, 3),
(4, 3);


-- custmomer_number who has placed the largest or orders

-- expected output
--------------------------------------------------------
-- customer_number
--------------------------------------------------------
-- 3

-- solution 1
select customer_number
from Orders
where order_number = (select max(order_number) from Orders);






