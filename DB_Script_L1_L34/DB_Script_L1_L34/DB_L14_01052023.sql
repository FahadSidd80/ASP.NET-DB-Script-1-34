create database DB_L14_01052023
use DB_L14_01052023

create table tblStudent
(
sid int primary key identity,
name varchar(100),
age int,
salary int,
mobileno bigint
)

create proc sp_tblStudent_Insert
@name varchar(100),
@age int,
@salary int,
@mobileno bigint
as
begin
insert into tblStudent(name,age,salary,mobileno)values(@name,@age,@salary,@mobileno)
end

create proc sp_tblStudent_Get
as
begin
select * from tblStudent
end

create proc sp_tblStudent_Delete
@did int
as
begin
delete from tblStudent where sid=@did
end
