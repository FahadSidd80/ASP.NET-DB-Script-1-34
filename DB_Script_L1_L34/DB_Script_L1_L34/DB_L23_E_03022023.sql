create database DB_L23_E_03022023
use DB_L23_E_03022023

create table Registration(
id int primary key identity,
name varchar(100),
age int,
gender int,
country int
)

create table tblcountry(
cid int primary key identity,
cname varchar(100),
)
insert into tblcountry(cname)values('India')
insert into tblcountry(cname)values('Pakistan')
insert into tblcountry(cname)values('USA')
insert into tblcountry(cname)values('Canada')
insert into tblcountry(cname)values('Japan')
insert into tblcountry(cname)values('Russia')

create proc sp_Get_tblcountry
as 
begin
select * from tblcountry 
end

create proc sp_Insert_registration
@name varchar(100),
@age int,
@gender int,
@country int
as 
begin
insert into Registration(name,age,gender,country)values(@name,@age,@gender,@country)
end

create proc sp_delete_registration
@did int
as 
begin
delete from Registration where id=@did
end

create proc sp_Get_registration
as 
begin
select * from Registration join tblcountry on Registration.country=tblcountry.cid
end