use master;
drop database if exists x_combine_two_tables;
create database x_combine_two_tables;
go
use x_combine_two_tables;
go

create table Person(
	personId int not null,
	lastName varchar(50) not null,
	firstName varchar(50) not null,
    primary key (personId)
);

create table Address (
	addressId int not null,
	personId int not null,
	city varchar(50) not null,
	state varchar(50) not null,
    primary key (addressId)
);

insert into Person (personId, lastName, firstName) values
(1, 'Wang', 'Allen'),
(2, 'Alice', 'Bob');

insert into Address (addressId, personId, city, state) values
(1, 2, 'New York City', 'New York'),
(2, 3, 'LeetCode', 'California');

-- expected output
--------------------------------------------------------
-- firstName	lastName	    city	        state
--------------------------------------------------------
-- Allen	    Wang	        NULL	        NULL
-- Bob	        Alice	        New York City	New York

select p.firstName, p.lastName, a.city, a.state
from Person p 
left join Address a on p.personId = a.personId;
