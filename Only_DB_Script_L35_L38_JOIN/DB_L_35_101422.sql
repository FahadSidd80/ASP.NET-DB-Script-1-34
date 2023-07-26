create database DB_L_35_101422
use DB_L_35_101422

create table Employee
(
empid int primary key identity,
name varchar(100),
gender varchar(100),
salary int,
department varchar(50),
)

insert into Employee(name,gender,salary,department)values('Fahad','Male',23000,'IT')
insert into Employee(name,gender,salary,department)values('ALi','Male',29000,'Sales')
insert into Employee(name,gender,salary,department)values('Hamza','Male',29800,'R&D')
insert into Employee(name,gender,salary,department)values('Abdul','Male',27600,'BPO')
insert into Employee(name,gender,salary,department)values('Zainab','Female',20000,'ADM')
insert into Employee(name,gender,salary,department)values('Suraj','Male',25400,'IT')
insert into Employee(name,gender,salary,department)values('Chandan','Male',27600,'ADM')
insert into Employee(name,gender,salary,department)values('Fatima','Female',27800,'Sales')
insert into Employee(name,gender,salary,department)values('Zikra','Female',21200,'R&D')
insert into Employee(name,gender,salary,department)values('Sania','Female',23000,'IT')
insert into Employee(name,gender,salary,department)values('Abc','Other',90800,'Sales')
insert into Employee(name,gender,salary,department)values('pqr','Other',98200,'R&D')
insert into Employee(name,gender,salary,department)values('xyz','Other',29700,'IT')


select * from Employee

truncate table Employee

--- Group by command and Sum function-------------

select name,salary,gender from Employee
select sum(salary) from Employee -- salary sum query using SUM() Function.

select sum(salary) from Employee
group by gender

select sum(salary) as Total_Salary from Employee  -- aliasing --  table name is optional
group by gender

select sum(salary) Total_Salary from Employee group by gender  -- here AS is optional  -- as is optional
select gender, sum(salary) Total_Salary from Employee group by gender

select department, sum(salary) from Employee group by department
select department, sum(salary) as Total_Salary_Department from Employee group by department

select department, sum(salary) Total_salary from Employee group by department

-- person count using Count function

select gender, count(*) from Employee group by gender

select gender EmployeeGender , count(*) from Employee group by gender
select gender EmployeeGender, count(*) as Total_Employee from Employee group by gender

select gender EmployeeGender , count(*)  Total_Employee from employee group by gender

select department EmpDepartment, count(*) Total_EMployee from employee group by department

select department as EmpDepartment , count(*) as Total_Employee from Employee group by department

select department as EmpDeptmnt, count(1) as Total_Emp from EMployee group by department

select department as EmpDepartment , count(2) as Total_EMp from Employee group by department

select department as EmpDepartment , count(*) as Total_EMp from Employee group by department


select gender as EMpGender , count(*) as Genderwise from EMployee group by gender
select department as EmpDepartment  , count(*)  From EMployee group by department



-------------------------------------------------------------------------------------------------
-- Rule of group by 
--Jab hum group by lagaenge tab only 2 type ke column  ko hi select kar sakenge
--1. Jo column  pe group by laga ho
--2. Jo column kisi aggregate function ke andar ho

-- eg --  
select gender,  sum(salary) as Total_Salary from EMployee group by gender
select * from EMployee

select department as EmpDepartment , count(*) as Total_EMp from Employee group by department
select department, count(*), gender, sum(salary) as Total_Salary from Employee group by gender, department
select  gender as EmpGender from Employee group by gender

select count(name) as Total_Emp,count(department), gender, sum(salary) as Total_Salary from Employee group by gender

select department as DepartmntName, count(department) as Total_Emp , SUM(salary) Total_Salary from Employee group by department
select gender as Emp_Gender , count(gender) as Total_gender ,sum(salary) as Total_Salary from Employee group by gender
--------

select department, gender as Emp_Gender , count(gender) as Total_gender ,sum(salary) as Total_Salary from Employee group by gender, department

select gender,department  from Employee group by department,gender
----------------------------------------------------------------------------------------------------------------------------------------------------------------

--Difference in  Where and Having 

-- having is used to make condition on table and group-- in short without group there is no having
-- means agar group by nahi hai to having bhi nahi hoga kyo ki having to condition group pe lagata hai.
-- Where is used to put condition on table -- In short without table there is no where
select * from Employee

select gender as Emp_Gender , count(gender) as Total_gender ,sum(salary) as Total_Salary
from Employee where salary>27000 
group by gender 


select gender as Emp_Gender , count(gender) as Total_gender ,sum(salary) as Total_Salary
from Employee where salary>27000 
group by gender having sum(salary)>100000

----------------------------------------------------------------------------------------------
-- How to remove duplicate record
delete from Employee where not empid  in (select max(empid) from Employee group by name,gender,salary,department)

delete from Employee where  empid not in (select max(empid) from Employee group by name,gender,salary,department)

delete from Employee where empid not in (select min(empid) from Employee group by name,gender,salary,department)
select min(empid) from Employee group by  name,gender,salary,department

select * from Employee
delete from employee where empid  in (28,29)
delete from employee where empid in (select * from Employee)
--------------------------------------------------------------------------------------------------------------------
-- Agregate funsctions
select * from Employee
select sum(salary) as Total_salary from Employee
select max(salary) as Max_Salary from Employee
select min(salary) as Min_Salary from employee
select avg(salary) as Avg_Salary from Employee
select COUNT(salary) as No_Of_Salary from Employee

--------------------------------------------------------------------------------------------
-- Alphabetical order means Ascending order me column ke records ko dekhna
-- Everything is in ascending order by default and we can make in deccending order as well
-- by default table ka record id ke basis pe hota hai kyo ki wo primary key hoti hai

select * from Employee order by name 
select * from Employee order by name  desc

select * from Employee order by salary
select * from Employee order by department
select * from Employee order by salary desc

select name from Employee order by name
select name as EmpName from Employee order by name

-------------------------------------------------------------------------------------------
-- How to know anything about nothing  by using top keyword.. means without 
-- knowing anything about table how we can find top data of table

select  top(2) * from Employee
-- Bottom se
select * from Employee order by empid desc
select top(2) *  from Employee order by empid desc

---------------------------------------------------------------------------------------------
-- How to find third highest salary
-- with aggregate function
-- without aggregate function


-- There are 4 types of table also--
-- 1. Permanent, Derived, Magic, temporary
-- with aggregate functionn by using derived table
select min(salary) as Third_Highest_Salary from
(select  top(3) salary from Employee order by salary desc)ABC  -- This ABC table is called derived table because we assume it not create it so we can apply only some limited function on it.

-- without using aggregate functions
select * from
(select top(3) salary from Employee order by salary desc) Derived_table order by salary asc  -- Derived table is in descending order


-- Third Highest salary without using aggregate function.

select top(1) salary as Third_Highest_Salary from
(select top(3) salary from Employee order by salary desc) Derived_table order by salary asc

select top(1) salary from 
(select top(3) salary from Employee order by salary desc) ABC order by salary asc

------------------------------------------------------------------------------------------------------------