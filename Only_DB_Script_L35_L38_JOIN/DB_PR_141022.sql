create database DB_PR_141022
use DB_PR_141022
-- lecture 22
create table Employee
(
empid int primary key identity,
name varchar(100),
city int,
gender int,
course int
)

insert into Employee(name,city,gender,course)values('Fahad',1,1,1)
insert into Employee(name,city,gender,course)values('Ali',1,2,2)
insert into Employee(name,city,gender,course)values('hamza',2,3,3)
insert into Employee(name,city,gender,course)values('Abdul',3,1,4)
insert into Employee(name,city,gender,course)values('Aman',4,2,5)
insert into Employee(name,city,gender,course)values('Nayab',5,3,6)
insert into Employee(name,city,gender,course)values('Naim',6,2,7)

select * from Employee

create table tblcourse
(
cid int primary key identity,
coursename varchar(100)
)

create table tblgender
(
gid int primary key identity,
gname varchar(100)
)

create table tblcity
(
ctid int primary key identity,
cityname varchar(100)
)

insert into tblcourse(coursename)values('MBA')
insert into tblcourse(coursename)values('BCA')
insert into tblcourse(coursename)values('MCA')
insert into tblcourse(coursename)values('LLB')
insert into tblcourse(coursename)values('CA')
insert into tblcourse(coursename)values('BBM')
insert into tblcourse(coursename)values('MBBS')
insert into tblcourse(coursename)values('BUMS')



insert into tblcity(cityname)values('Kanpur')
insert into tblcity(cityname)values('Lucknow')
insert into tblcity(cityname)values('Delhi')
insert into tblcity(cityname)values('Noida')
insert into tblcity(cityname)values('Bareily')
insert into tblcity(cityname)values('Unnao')
insert into tblcity(cityname)values('GB nagar')
insert into tblcity(cityname)values('Patna')


insert into tblgender(gname)values('Male')
insert into tblgender(gname)values('Female')
insert into tblgender(gname)values('Others')

select * from Employee
join tblcourse on Employee.course = tblcourse.cid
join tblgender on Employee.gender = tblgender.gid
join tblcity on Employee.city = tblcity.ctid

select  
*
from Employee
join tblcourse on Employee.course = tblcourse.cid
join tblgender on Employee.gender = tblgender.gid
join tblcity on Employee.city = tblcity.ctid


-- AS is optional in Aliasing............................

select Employee.empid as EmployeeID, Employee.name as EmployeeName, Employee.city as EmployeeCity, 
Employee.gender as EmployeeGender, Employee.course as EmployeeCourse  from Employee


select Employee.empid  EmployeeID, Employee.name  EmployeeName, Employee.city  EmployeeCity, 
Employee.gender  EmployeeGender, Employee.course  EmployeeCourse  from Employee



select empid  EmployeeID, name  EmployeeName, city  EmployeeCity, 
gender  EmployeeGender, course  EmployeeCourse  from Employee  ----- Table name is optional also in aliasing

select empid  EmployeeID, name  EmployeeName, city  EmployeeCity, 
gender  EmployeeGender, course  EmployeeCourse  from Employee




