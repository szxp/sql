use master;
drop database if exists x_customers_never_ordered;
create database x_customers_never_ordered;
go
use x_customers_never_ordered;
go

create table Customers (
	id int not null,
	name varchar(50) not null,
    primary key (id)
);

create table Orders (
	id int not null,
	customerId int not null,
    primary key (id)
);

alter table Orders
    add constraint FK_Orders_customerId
    foreign key (customerId)
    references Customers (id);

insert into Customers (id, name) values
(1, 'Joe'),
(2, 'Henry'),
(3, 'Sam'),
(4, 'Max');

insert into Orders (id, customerId) values
(1, 3),
(2, 1);


-- expected output
--------------------------------------------------------
-- Customers
--------------------------------------------------------
-- Henry
-- Max

-- solution 1
select c.name as Customers
from Customers c
left join Orders o on c.id = o.customerId
where o.id is null;

-- solution 2
select c.name as Customers
from Customers c
where c.id not in (
	select customerId from Orders
);




