use master;
drop database if exists x_reported_posts;
create database x_reported_posts;
go
use x_reported_posts;
go

create table Actions (
	user_id int not null,
  post_id int not null,
  action_date date,
  action varchar(50), -- 'view', 'like', 'reaction', 'comment', 'report', 'share'
  extra varchar(50)
);

insert into Actions (user_id, post_id, action_date, action, extra) values
(1, 1, '2019-07-01', 'view', null),
(1, 1, '2019-07-01', 'like', null),
(1, 1, '2019-07-01', 'share', null),
(2, 4, '2019-07-04', 'view', null),
(2, 4, '2019-07-04', 'report', 'spam'),
(3, 4, '2019-07-04', 'view', null),
(3, 4, '2019-07-04', 'report', 'spam'),
(4, 3, '2019-07-02', 'view', null),
(4, 2, '2019-07-02', 'report', 'spam'),
(5, 2, '2019-07-04', 'view', null),
(5, 2, '2019-07-04', 'report', 'racism'),
(5, 5, '2019-07-04', 'view', null),
(5, 5, '2019-07-04', 'report', 'racism');


-- the number of posts reported yesterday for each report reason
-- assume today is 2019-07-05

-- expected output
--------------------------------------------------------
-- report_reason  report_count
--------------------------------------------------------
-- spam           1
-- racism         2


-- solution 1
select extra as report_reason, count(distinct post_id) as report_count
from Actions
where action_date = '2019-07-04' and action = 'report' and extra is not null
group by extra;

