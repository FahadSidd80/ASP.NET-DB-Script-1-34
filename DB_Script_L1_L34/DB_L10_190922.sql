create database DB_L10_190922 
use DB_L10_190922

create table 




create table Registration
(
id int primary key identity,
name varchar(100),
city varchar(100),
salary int,
age int
)

create proc sp_Insert_Registration
@name varchar(100),
@city varchar(100),
@salary int,
@age int
as
begin
insert into Registration(name,city,salary,age)values(@name,@city,@salary,@age)
end

create proc sp_Display_Registration
as 
begin
select * from Registration
end

create proc sp_Delete_Registration
@id int
as 
begin
delete from registration where id=@id
end

create proc sp_Edit_Registration
@id int
as
begin
select * from Registration where id=@id
end

create proc sp_Update_registration
@id int,
@name varchar(100),
@city varchar(100),
@salary int,
@age int
as 
begin
update Registration set name=@name,city=@city,salary=@salary,age=@age where id=@id
end

select * from registration