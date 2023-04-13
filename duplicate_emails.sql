use master;
drop database if exists x_duplicate_emails;
create database x_duplicate_emails;
go
use x_duplicate_emails;
go

create table Person(
	id int not null,
	email varchar(50) not null,
    primary key (id)
);

insert into Person (id, email) values
(1, 'a@b.com'),
(2, 'c@d.com'),
(3, 'a@b.com');


-- expected output
--------------------------------------------------------
-- Email
--------------------------------------------------------
-- a@b.com

-- solution 1
select p.email as Email
from Person p
group by p.email
having count(distinct p.id) > 1;

-- solution 2
select distinct p1.email as Email
from Person p1 
join Person p2 on p1.email = p2.email and p1.id <> p2.id;

-- solution 3
select p1.email as Email
from Person p1 
join Person p2 on p1.email = p2.email and p1.id <> p2.id and p1.id < p2.id;


