create database DB_L15_01172023
use DB_L15_01172023

create table tblRegistration
(
rid int primary key identity,
name varchar(100),
age int
)

create proc sp_tblRegistration_Insert
@name varchar(100),
@age int
as 
begin 
insert into tblRegistration(name,age)values(@name,@age)
end

create proc sp_tblRegistration_BindGrid
as
begin
select * from tblRegistration
end

delete from tblRegistration where rid in (10,11) -- only 5,9 will delete means specific rows.
delete from tblRegistration where rid between 6 and 8 -- it delete all rows in between

