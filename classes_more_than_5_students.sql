use master;
drop database if exists x_classes_more_than_5_students;
create database x_classes_more_than_5_students;
go
use x_classes_more_than_5_students;
go

create table Courses (
	student varchar(50) not null,
	class varchar(50) not null,
    primary key (student, class)
);

insert into Courses (student, class) values
('A', 'Math'),
('B', 'English'),
('C', 'Math'),
('D', 'Biology'),
('E', 'Math'),
('F', 'Computer'),
('G', 'Math'),
('H', 'Math'),
('I', 'Math');


-- classes that have at least five student

-- expected output
--------------------------------------------------------
-- class
--------------------------------------------------------
-- Math


-- solution 1
select class
from Courses
group by class
having count(student) >= 5;






