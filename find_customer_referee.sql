use master;
drop database if exists x_find_customer_referee;
create database x_find_customer_referee;
go
use x_find_customer_referee;
go

create table Customer (
	id int not null,
	name varchar(50) not null,
    referee_id int,
    primary key (id)
);

alter table Customer
    add constraint FK_Customer_referee_id
    foreign key (referee_id)
    references Customer (id);


insert into Customer (id, name, referee_id) values
(1, 'Will', null),
(2, 'Jane', null),
(3, 'Alex', 2),
(4, 'Bill', null),
(5, 'Zack', 1),
(6, 'Mark', 2);


-- ids of Customer that are not referred by the customer with id = 2

-- expected output
--------------------------------------------------------
-- name
--------------------------------------------------------
-- Will
-- Jane
-- Bill
-- Zack

-- solution 1
select name
from Customer
where referee_id is null or referee_id <> 2;





