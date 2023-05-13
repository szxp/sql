use master;
drop database if exists x_bank_account_summary_2;
create database x_bank_account_summary_2;
go
use x_bank_account_summary_2;
go

create table Users (
  account int,
  name varchar(50),
  primary key(account)
);

create table Transactions (
  trans_id int,
  account int,
  amount int,
  transacted_on date
  primary key(trans_id)
);

insert into Users 
(account, name) values
(900001, 'Alice'),
(900002, 'Bob'),
(900003, 'Charlie');

insert into Transactions 
(trans_id, account, amount, transacted_on) values
(1, 900001, 7000, '2020-08-01'),
(2, 900001, 7000, '2020-09-01'),
(3, 900001, -3000, '2020-09-02'),
(4, 900002, 1000, '2020-09-12'),
(5, 900003, 6000, '2020-08-07'),
(6, 900003, 6000, '2020-09-07'),
(7, 900003, -4000, '2020-09-11');


-- the name and balance of users with a balance higher than 10000

-- name   balance
-- Alice	11000

-- solution 1
select u.name, sum(t.amount) as balance
from Users u 
left join Transactions t on t.account = u.account
group by u.account, u.name
having sum(t.amount) > 10000
;
