create database DB_JOIN_131022
use DB_JOIN_131022
---lecture No 21

create table Employee
(
empid int  primary key identity,
name varchar(100),
country int
)
-- Changing varchar of Country column
alter table Employee alter column country varchar(100)

create table tblCountry
(
cid int primary key identity,
cname varchar(100)
)

insert into Employee(name,country)values('Fahad','1')
insert into Employee(name,country)values('Hamza','2')
insert into Employee(name,country)values('Ali','3')
insert into Employee(name,country)values('Faraz','4')
insert into Employee(name,country)values('Almas','5')
insert into Employee(name,country)values('Aman','6')
insert into Employee(name,country)values('Abhishek',8)


insert into tblCountry(cname)values('India')
insert into tblCountry(cname)values('Pakistan')
insert into tblCountry(cname)values('USA')
insert into tblCountry(cname)values('Canada')
insert into tblCountry(cname)values('Russia')
insert into tblCountry(cname)values('UAE')
insert into tblCountry(cname)values('Egypt')

select * from Employee
select * from tblCountry

select * from Employee join tblCountry on Employee.country=tblCountry.cid
----------------------------------------------------------------------

--create table Employee_2
--(
--empid int  primary key identity,
--name varchar(100),
--country int  
--)
-- In one table only 1 pK and identity is allowed.
-----------------------------------------------------------------------

--create table tblCountry_3
--(
--cid varchar primary key,
--cname varchar(100)
--)
--------------------------------------------
--create table tblCountry_2
--(
--cid varchar(100) primary key,
--cname varchar(100)
--)



--insert into tblCountry_3(cid,cname)values(1,'India')
--insert into tblCountry_3(cid,cname)values('2','Pakistan')
--insert into tblCountry_3(cid,cname)values('9','USA')
--insert into tblCountry_3(cid,cname)values('10','Canada')
--insert into tblCountry_2(cid,cname)values('','Russia')
--insert into tblCountry_2(cid,cname)values('','UAE')
--insert into tblCountry_2(cid,cname)values('','Egypt')

--select * from TblCountry_3
--------------------------------------------------------------