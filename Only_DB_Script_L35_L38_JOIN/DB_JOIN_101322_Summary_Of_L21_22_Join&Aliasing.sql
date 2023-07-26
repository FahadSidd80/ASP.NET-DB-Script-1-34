create database DB_JOIN_101322
use DB_JOIN_101322
  --- Practice Lecture---- Summary of JOIN AND ALIASING
create table Employee
(
empid int primary key identity,
name varchar(100),
salary int,
country int
)

delete  Employee

drop table Employee



create table tblcountry
(
cid int primary key identity,
cname varchar(100)
)

insert into Employee(name,salary,country)values('Fahad',20000,'1')

truncate table Employee
select * from Employee

insert into Employee(name,salary,country)values('Fahad',20000,'1')
insert into Employee(name,salary,country)values('Ali',40000,'2')
insert into Employee(name,salary,country)values('Siddiqui',230,'3')
insert into Employee(name,salary,country)values('Hamza',2340,'4')
insert into Employee(name,salary,country)values('Abdullah',22334,'5')

insert into tblcountry(cname)values('India')
insert into tblcountry(cname)values('Pakistan')
insert into tblcountry(cname)values('USA')
insert into tblcountry(cname)values('Canada')
insert into tblcountry(cname)values('UAE')

select * from Employee join tblcountry on Employee.country= tblcountry.cid
select * from Employee inner join tblcountry on Employee.country=tblcountry.cid
select * from Employee left join tblcountry on Employee.country=tblcountry.cid
select * from Employee left outer join tblcountry on Employee.country= tblcountry.cid
select * from Employee right join tblcountry on Employee.country=tblcountry.cid
select * from Employee right outer join tblcountry on Employee.country=tblcountry.cid
select * from Employee full join tblcountry on Employee.country=tblcountry.cid
select * from Employee full outer join tblcountry on Employee.country=tblcountry.cid
select * from Employee cross join tblcountry 


-- ALiasing------------

select name as EmployeeName from Employee
select Employee.empid as EmployeeID, Employee.name as EmployeeName  , salary as EmployeeSalary from Employee

select Employee.empid as EmployeeID , Employee.name as EmployeeName , salary as EmployeeSalary, cname as CountryName from EMployee 
join tblcountry on EMployee.country= tblcountry.cid


