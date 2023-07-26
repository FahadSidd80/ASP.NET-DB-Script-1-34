create database DB_L7_150922
use DB_L7_150922

create table Registration
(
rid int primary key identity,
name varchar(100),
gender varchar(100),
age int
)
select * from Registration