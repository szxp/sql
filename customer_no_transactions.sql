use master;
drop database if exists x_customer_no_transactions;
create database x_customer_no_transactions;
go
use x_customer_no_transactions;
go

create table Visits (
  visit_id int,
  customer_id int,
  primary key(visit_id)
);

create table Transactions (
  transaction_id int,
  visit_id int,
  amount int,
  primary key(transaction_id)
);

insert into Visits 
(visit_id, customer_id) values
(1, 23),
(2, 9),
(4, 30),
(5, 54),
(6, 96),
(7, 54),
(8, 54);

insert into Transactions 
(transaction_id, visit_id, amount) values
(2, 5, 310),
(3, 5, 300),
(9, 5, 200),
(12, 1, 910),
(13, 2, 970);


-- the ids of the customers who visited without making any transactions and the number of times they made these types of visits

-- customer_id  count_no_trans
-- 54	          2
-- 30	          1
-- 96	          1

-- solution 1
select v.customer_id, count(v.visit_id) as count_no_trans
from Visits v 
left join Transactions t on t.visit_id = v.visit_id
where t.transaction_id is null
group by v.customer_id
order by count_no_trans desc, v.customer_id asc
;
