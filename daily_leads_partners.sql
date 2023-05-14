use master;
drop database if exists x_daily_leads_partners;
create database x_daily_leads_partners;
go
use x_daily_leads_partners;
go

create table DailySales (
  date_id date,
  make_name varchar(50),
  lead_id int,
  partner_id int
);

insert into DailySales 
(date_id, make_name, lead_id, partner_id) values
('2020-12-08', 'toyota', 0, 1),
('2020-12-08', 'toyota', 1, 0),
('2020-12-08', 'toyota', 1, 2),
('2020-12-07', 'toyota', 0, 2),
('2020-12-07', 'toyota', 0, 1),
('2020-12-08', 'honda',  1, 2),
('2020-12-08', 'honda',  2, 1),
('2020-12-07', 'honda',  0, 1),
('2020-12-07', 'honda',  1, 2),
('2020-12-07', 'honda',  2, 1);

-- for each date_id and make_name return the number of distinct lead_ids and distinct partner_ids

-- date_id    make_name unique_leads  unique_partners
-- 2020-12-07	honda     3	            2
-- 2020-12-07	toyota	  1	            2
-- 2020-12-08	honda     2	            2
-- 2020-12-08	toyota	  2	            3

-- solution 1
select
  date_id,
  make_name,
  count(distinct lead_id) as unique_leads,
  count(distinct partner_id) as unique_partners
from DailySales
group by date_id, make_name
order by date_id, make_name
;
