create database DB_L17_02082023
use DB_L17_02082023

create table registration
(
rid int primary  key identity,
name varchar(100),
city varchar(100),
salary int
)

create proc sp_Insert_registration
@name varchar(100),
@city varchar(100),
@salary int
as
begin
insert into registration values(@name,@city,@salary)
--insert into registration(name,city,salary) values(@name,@city,@salary)
end

create proc sp_Display_registration
as
begin
select * from registration
end

Alter proc sp_Delete_registration
@did int 
as
begin
delete  from registration where rid=@did
end

create proc sp_Edit_registration
@eid int
as
begin
select * from registration where rid=@eid
end

create proc sp_Update_registration
@uid int,
@name varchar(100),
@city varchar(100),
@salary int
as
begin
update  registration set name=@name,city=@city,salary=@salary where rid =@uid
end
