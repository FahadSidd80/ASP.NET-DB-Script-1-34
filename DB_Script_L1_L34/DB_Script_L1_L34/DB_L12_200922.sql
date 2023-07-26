create database DB_L12_200922
use DB_L12_200922

create table Employee
(
empid int primary key identity,
name varchar(100),
city varchar(100),
age int
)

create proc sp_Employee_Insert
@name varchar(100),
@city varchar(100),
@age int
as
begin
insert Employee(name,city,age)Values(@name,@city,@age)
end

select * from Employee