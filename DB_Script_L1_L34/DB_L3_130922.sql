create database DB130922_L2
use DB130922_L2

create table Student
(
id int primary key identity,
name varchar(100),
rollno int,
age int,
city varchar(100)
)

select * from student