create database DB_L8_170922
use DB_L8_170922

create table Employee
(
id int primary key identity,
name varchar(100),
city varchar(100),
age int
)

create procedure sp_Insert_Employee
@a varchar(100),
@b varchar(100),
@c int
as
begin
insert into Employee(name,city,age)values(@a,@b,@c)
end

create proc sp_Delete_Employee
@a int
as
begin
delete from Employee where id=@a
end

