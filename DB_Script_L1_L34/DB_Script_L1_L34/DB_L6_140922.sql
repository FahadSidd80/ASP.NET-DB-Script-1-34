create database DB_L6_140922
 use DB_L6_140922

 create table Employee
 (
 empid int primary key identity,
 name varchar(100),
 age int,
 city varchar(100)
 )

 select * from Employee