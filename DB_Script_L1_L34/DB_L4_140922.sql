create database DB_L3_140922
use DB_L3_140922

create table Employee
(
id int primary key identity,
name varchar(100),
city varchar(100),
age int
)
select * from Employee