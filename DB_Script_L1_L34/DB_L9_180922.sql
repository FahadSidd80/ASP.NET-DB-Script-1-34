create database DB_L9_180922
use DB_L9_180922

create table Registration
(
id int primary key identity,
name varchar(100),
course varchar(100),
age int
)

create proc sp_Insert_Registration
@name varchar(100),
@course varchar(100),
@age int
as
begin
insert into Registration(name,course,age)values(@name,@course,@age)
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
@course varchar(100),
@age int
as 
begin
update Registration set name=@name,course=@course,age=@age where id=@id
end

select * from registration