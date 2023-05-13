use master;
drop database if exists x_session_bar_chart;
create database x_session_bar_chart;
go
use x_session_bar_chart;
go

create table Sessions (
  session_id int,
  duration int,
  primary key (session_id)
);

insert into Sessions 
(session_id, duration) values
(1, 30),
(2, 199),
(3, 299),
(4, 580),
(5, 1000);

-- bins: [0-5>, [5-10>, [10-15>, 15 or more
-- report the (bin, total)

-- bin        total
-- [0-5>      3
-- [5-10>	    1
-- [10-15>	  0
-- 15 or more	1

-- solution 1
with Bin(name, min_dur, max_dur) as (
  select '[0-5>', 0, 5*60
  union all
  select '[5-10>', 5*60, 10*60
  union all 
  select '[10-15>', 10*60, 15*60
  union all
  select '15 or more', 15*60, null
)
select b.name, count(s.session_id) as total
from Bin b 
left join Sessions s on (b.max_dur is not null and b.min_dur <= s.duration and s.duration < b.max_dur) or (b.max_dur is null and b.min_dur <= s.duration)
group by b.name
;
