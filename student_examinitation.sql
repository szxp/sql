use master;
drop database if exists x_student_examinitation;
create database x_student_examinitation;
go
use x_student_examinitation;
go

create table Students (
  student_id int,
  student_name varchar(50),
  primary key (student_id)
);

create table Subjects (
  subject_name varchar(50)
);

create table Examinations (
  student_id int,
  subject_name varchar(50)
);

insert into Students 
(student_id, student_name) values
(1, 'Alice'),
(2, 'Bob'),
(13, 'John'),
(6, 'Alex');

insert into Subjects 
(subject_name) values
('Math'),
('Physics'),
('Programming');

insert into Examinations 
(student_id, subject_name) values
(1, 'Math'),
(1, 'Physics'),
(1, 'Programming'),
(2, 'Programming'),
(1, 'Physics'),
(1,  'Math'),
(13, 'Math'),
(13, 'Programming'),
(13, 'Physics'),
(2,  'Math'),
(1,  'Math');


-- the number of times each student attended each exam

-- expected output
--------------------------------------------------------
-- student_id     student_name    subject_name  attended_exams
--------------------------------------------------------
-- 1              Alice           Math          3 
-- 1              Alice           Physics       2 
-- 1              Alice           Programming   1
-- 2              Bob             Math          1
-- 2              Bob             Physics       0
-- 2              Bob             Programming   1
-- 6              Alex            Math          0
-- 6              Alex            Physics       0
-- 6              Alex            Programming   0
-- 13             John            Math          1
-- 13             John            Physics       1
-- 13             John            Programming   1

-- solution 1
select st.student_id, st.student_name, su.subject_name, count(e.subject_name) as attended_exams
from Students st 
cross join Subjects su
left join Examinations e on st.student_id = e.student_id and su.subject_name = e.subject_name
group by st.student_id, st.student_name, su.subject_name 
order by st.student_id, su.subject_name
;
