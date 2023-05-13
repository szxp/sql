use master;
drop database if exists x_warehouse_manager;
create database x_warehouse_manager;
go
use x_warehouse_manager;
go

create table Warehouse (
  name varchar(50),
  product_id int,
  units int,
  primary key(name, product_id)
);

create table Products (
  product_id int,
  product_name varchar(50),
  width int,
  length int,
  height int,
  primary key(product_id)
);

insert into Warehouse 
(name, product_id, units) values
('LCHouse1', 1, 1),
('LCHouse1', 2, 10),
('LCHouse1', 3, 5),
('LCHouse2', 1, 2),
('LCHouse2', 2, 2),
('LCHouse3', 4, 1);

insert into Products 
(product_id, product_name, width, length, height) values
(1, 'LC-TV', 5, 50, 40),
(2, 'LC-KeyChain', 5, 5, 5),
(3, 'LC-Phone', 2, 10, 10),
(4, 'LC-T-Shirt', 4, 10, 20);

-- the number of cubic feet of volume the inventory occupies in each warehouse

-- warehouse_name volume
-- LCHouse1	      12250
-- LCHouse2	      20250
-- LCHouse3	      800

-- solution 1
select w.name as warehouse_name, sum(p.width * p.height * p.length * w.units) as volume
from Warehouse w
join Products p on w.product_id = p.product_id
group by w.name
order by w.name
;
