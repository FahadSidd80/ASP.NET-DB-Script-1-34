create database DB_L37_21OCT2022
use DB_L37_21OCT2022

-- L38 


create table Employee
(
id int primary key identity,
name varchar(50),
gender varchar(50),
salary int,
department varchar(50)
)

insert into Employee(name,gender,salary,department)values('alok srivastava','male',400,'IT')
insert into Employee(name,gender,salary,department)values('rubina khan','female',800,'HR')
insert into Employee(name,gender,salary,department)values('Ashutosh kumar','male',300,'IT')
insert into Employee(name,gender,salary,department)values('pooja','female',500,'Sales')
insert into Employee(name,gender,salary,department)values('Biraj','male',700,'HR')
insert into Employee(name,gender,salary,department)values('chintu','female',600,'Sales')
insert into Employee(name,gender,salary,department)values('pp','other',450,'IT')
insert into Employee(name,gender,salary,department)values('kk','other',550,'HR')
insert into Employee(name,gender,salary,department)values('Dayanand','male',350,'Sales')
insert into Employee(name,gender,salary,department)values('Anwar','male',650,'HR')

select * from Employee
------------------------------------------------------------------------------------------------------
update Employee set name ='Fahad' where id=7
begin transaction -- begin transaction ko use karte hai query return karne ke liye even karne ke baad bhi return  ho jaega
update Employee set name ='Siddiqui' where id=8
commit transaction

-- Practical approach for begin transaction


