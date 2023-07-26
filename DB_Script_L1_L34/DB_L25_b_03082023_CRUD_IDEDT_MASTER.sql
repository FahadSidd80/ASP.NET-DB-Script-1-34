create database DB_L25_b_03082023_CRUD_IDEDT_MASTER
use DB_L25_b_03082023_CRUD_IDEDT_MASTER

create table Registration(
id int primary key identity,
name varchar(100),
age int,
gender int,
country int,
State int
)

create proc sp_Insert_registration
@name varchar(100),
@age int,
@gender int,
@country int,
@state int
as 
begin
insert into Registration(name,age,gender,country,State)values(@name,@age,@gender,@country,@state)
end


create proc sp_Update_registration
@uid int,
@name varchar(100),
@age int,
@gender int,
@country int,
@state int
as 
begin
update Registration  set name=@name,age=@age,gender=@gender,country=@country,state=@state where id=@uid
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
join tblState on Registration.State=tblState.sid
end

--alter proc sp_Get_registration
--as 
--begin
--select *,('Emp'+convert(varchar(50),id)) as pppp from Registration join tblcountry on Registration.country=tblcountry.cid
--join tblState on Registration.State=tblState.sid
--end

--select ('Emp'+convert(varchar(50),id)) as Empid,name,age,gender,country,State from Registration

create proc sp_Edit_Registration
@eid int
as
begin
select * from Registration where id=@eid
end
---------------------------------------------------------------------------------------------




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




delete  from Registration where id=9 and state=NULL

create table tblState(
cid int,-- FK -- cid act as FK.
sid int primary key identity,-- PK
sname varchar(100)
)

insert into tblState(cid,sname)values(1,'Bihar')
insert into tblState(cid,sname)values(1,'Kerala')
insert into tblState(cid,sname)values(1,'Maharastra')
insert into tblState(cid,sname)values(2,'Quetta')
insert into tblState(cid,sname)values(2,'Rawalpindi')
insert into tblState(cid,sname)values(3,'Atlanta')
insert into tblState(cid,sname)values(4,'Ontario')
insert into tblState(cid,sname)values(5,'Yastuv')
insert into tblState(cid,sname)values(6,'Moscow')

create proc sp_tblState_Get
@countryid int
as
begin
select * from tblState where cid= @countryid
end


-----------------------------------------------------------------------------------------------------

--database knowledge -- L25 me

alter proc sp_Get_registration
as 
begin
select *,UPPER(LEFT(name,1))+SUBSTRING(name,2,100) as CapName,ROW_NUMBER()over(order by id)as SerialNumber from Registration join tblcountry on Registration.country=tblcountry.cid
join tblState on Registration.State=tblState.sid
--order by name
--order by age desc
end

----------------------------------------------------------------------------------------------------------------------------------------
select id,name,age,gender,country,State,ROW_NUMBER()over(order by id) as SerialNumber
from Registration

select id,UPPER(LEFT(name,1))+SUBSTRING(name,2,100) as CapName,age,gender,country,State,ROW_NUMBER()over(order by id) as SerialNumber
from Registration

select name from Registration

select UPPER(name) from Registration

select UPPER(LEFT(name,2)) from Registration

select UPPER(RIGHT(name,2)) from Registration
select LOWER(RIGHT(name,2)) from Registration

select LEFT(name,2) from Registration

select 7-- select is equal to print

select 'Fahad'

select UPPER ('FAHAD')

select LOWER ('FAHAD')

select LOWER (LEFT('FAHAD',3))

select UPPER (RIGHT('FAHAD',3))

select SUBSTRING('Fahad Siddiqui',10,3)

select SUBSTRING('Fahad Siddiqui',10,3)
select REPLACE('Fahad Siddiqui','diq','sss')

select REPLACE('Fahad Siddiqui','diq','sssff')
select REPLACE('Fahad Siddiqui','Siddiqui','Ali') as NwName

select REPLACE('Fahadsid@gmail.com','com','in')
select REPLACE('Column_Name','com','in')

select STUFF('7518891337',1,8,'*********')
select STUFF('7518891337',1,8,'*********') mobile from Registration

select REVERSE('Fahad')
select REPLICATE('Fahad  ',5)



