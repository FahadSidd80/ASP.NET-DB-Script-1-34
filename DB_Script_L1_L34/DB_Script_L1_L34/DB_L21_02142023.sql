create database DB_L21_02142023
use DB_L21_02142023

create table tblEmployee
(
empid int primary key identity,
name varchar(100),
country int
)

create proc sp_Insert_tblEmployee
@name varchar(100),
@countryid int
as
begin
insert into tblEmployee(name,country)values(@name,@countryid)
end

alter proc sp_DisplayGrid_tblEmployee
as
begin
select * from tblEmployee join tblCountry on tblEmployee.country=tblCountry.cid
end

create proc sp_Delete_tblEmployee
@did int
as
begin
delete from tblEmployee where empid=@did
end

create proc sp_Edit_tblEmployee
@eid int
as
begin
select * from tblEmployee where empid=@eid
end

create proc sp_Update_tblEmployee
@uid int,
@name varchar(100),
@countryid int
as
begin
update tblEmployee set name=@name,country=@countryid where empid=@uid
end

-----------------------------------------------------------------------------






create table tblCountry
(
cid int primary key identity,
cname varchar(100)
)

insert into tblCountry(cname)values('India')
insert into tblCountry(cname)values('Pakistan')
insert into tblCountry(cname)values('USA')
insert into tblCountry(cname)values('Canada')
insert into tblCountry(cname)values('Russia')
insert into tblCountry(cname)values('UAE')
insert into tblCountry(cname)values('Qatar')

create proc sp_DisplayCountry_tblCountry
as
begin
select * from tblCountry
end