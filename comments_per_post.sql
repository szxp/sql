use master;
drop database if exists x_comments_per_post;
create database x_comments_per_post;
go
use x_comments_per_post;
go

create table Submissions (
  sub_id int not null,
  parent_id int
);

insert into Submissions 
(sub_id, parent_id) values
(1, null),
(2, null),
(1, null),
(12, null),
(3, 1),
(5, 2),
(3, 1),
(4, 1),
(9, 1),
(10, 2),
(6, 7);

-- number of comments per post

-- expected output
--------------------------------------------------------
-- post_id    number_of_comments
--------------------------------------------------------
-- 1          3
-- 2          2
-- 12         0


-- solution 1
with Post (post_id) as (
  select distinct(sub_id) from Submissions where parent_id is null
)
select p.post_id, count(distinct c.sub_id) as number_of_comments
from Post p left join Submissions c on c.parent_id = p.post_id
group by p.post_id;


