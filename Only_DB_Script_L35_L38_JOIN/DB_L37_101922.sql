create database DB_L37_101922

use DB_L37_101922

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


--------------------------------------------------------------------------------------------------
-- Function in SQL

create function Fn_2(@dob date)
returns int
as
begin
	declare @age int
	select @age= DATEDIFF(YEAR,@dob,getdate())
	return @age
end

select dbo.fn_2('09-06-1999') as Age 



------------------------------------------------------------------------------------
create function func_2(@take_Dob date)
returns int
as
begin
	declare @age int
	select  @age = DATEDIFF(YEAR,@take_Dob,GETDATE())
	return @age
end

select dbo.func_2('09-06-1999') As Age_In_Year
select dbo.func_2('08-15-1947') as Independent_Year
----------------------------------------------------------------------------------------------------
select * from Employee

select datediff(year,'07-01-2022','06-30-2023')
select datediff(MONTH,'07-01-2022','06-30-2023')
select datediff(DAY,'07-01-2022','06-30-2023')
----------------------------------------------------------------------------------------------------

select dob from Employee -- we always take dob because it always remain same and return age by using function

alter table Employee add  dob date
update Employee set gender =1 where id=1
update Employee set gender =2 where id=2
update Employee set gender =1 where id=3
update Employee set gender =2 where id=4
update Employee set gender =1 where id=5
update Employee set gender =2 where id=6
update Employee set gender =3 where id=7
update Employee set gender =3 where id=8
update Employee set gender =1 where id=9
update Employee set gender =1 where id=10

select id,name,gender,salary,department,dob from Employee

select id,name,gender,salary,department,dbo.Fn_2(dob) as Age from Employee


select dob from Employee

create proc sp_Employee_Get  --- Eval Me AGE likhna hai
as
begin
--select id,name,gender,salary,department,dbo.Fn_2(dob) as Age from Employee  -- function procedure ke andar likha hua hai.
select id,name,gender,salary,department,convert(varchar(100),dob, 106) as DOB,dbo.Fn_2(dob) as Age from Employee
end

exec sp_Employee_Get  -- we can only execute procedure not print/Select it.

select sp_Employee_Get  -- not work -- we can not write any procedure in select statement becz procedure call nahi hota
--but functions ko procedure ke andar likh sakte hai.

select dbo.Fn_2(dob) from Employee -- will work 

exec dbo.Fn_2(dob) from Employee  -- not work  procedure sirf execute hota hai.. so procedure ko call nahi kar sakte hai.
-------------------------------------------------------------------------------------------------------------------------------------
 select * from Employee

 create function FN_Gender(@gender int)
 returns  varchar(50)  -- output parameter ke retun me Last me 'S ' hota hai.....................
 as
 begin
	declare @GNAME varchar(50)
	if(@gender=1)
		begin
		set @GNAME='Male'
		end
	else if(@gender=2)
		begin
		set @GNAME = 'Female'
		end
	else if(@gender=3)
		begin
		set @GNAME = 'Other'
		end
	return @GNAME
 end

 alter proc sp_Employee_Gender_Get
 as
 begin
 select id,name,dbo.FN_Gender(gender) as Gender,salary,department,dob from Employee
 end

 exec sp_Employee_Gender_Get

 -------------------------------------------------------------------------------------------------
 alter table Employee alter column age varchar(100)
 ---------------------------------------------------------------

 select * from Employee
 select name,department from EMployee

 select (name+department) Details from Employee -- it is concatenation by using + sign
 select (name+'  '+department)Details from Employee  -- for some space
 select (name+SPACE(10)+department)Concatenation_OF_Columns from Employee 
 ----------------------------------------------------------------------------------------
 ------
 select (name+SPACE(5)+department+SPACE(5)+salary) from Employee
 --- through error reson is that  -- 
 -- kyo ki yahan column  ke type se matlab nahi hai yahan SALARY ke column me
 --jo value hai ussse matolab hai yahan column me integer value hai and integer value 
 --abhi varchar me nahi hai and only varchar value hi ek saath  me 
 select (name+SPACE(5)+department+SPACE(5)+convert(varchar(100), salary)) Concatenation from Employee
 select convert(varchar(100), salary) from Employee  -- yahan pe column ka type same hai but yahan pe column  ke andar ki value ka type change ho gaya hai.. int ot varchar hua hai
-- but actual me by default table me int hi hai.
select convert(int,name) from Employee -- Conversion failed when converting the varchar value 'alok srivastava' to data type int.
--failed  -- cant covert it from varchar to int 
-- INT to varchar always possible in column ki value ke case me.
-- but varchar to int tabhi possible hai jab column me value na ho ya fir int value padi ho.
-- Cast function
select cast(salary as varchar(100)) from Employee
select (name+SPACE(5)+department+SPACE(5)+cast(salary as varchar(100))) Concatenation from Employee

-- difference in  Convert and cast
select GETDATE()  -- O/P : 2022-10-20 18:56:26.847  date time format like int 
select convert(varchar(50), getdate())  -- O/P : Oct 20 2022  6:56PM varchar format
select cast(GETDATE() as varchar(100)) -- Oct 20 2022  6:57PM

select convert(varchar(100), GETDATE(), 101)-- Format is changed due to 101 code 10/20/2022
select convert(varchar(100), GETDATE(), 103)-- Format is changed due to 101 code 20/10/2022
select convert(varchar(100), GETDATE(), 106)-- Format is changed due to 101 code 20 Oct 2022 best way
-- convert function me ye 3rd parameter use kar sakte hai ye 100 to 132 0r 33 tak jaata hai itni tarak ke date format nikal sakte hai
---------------------------------------------------------------------------------------------------------------------------------------------------
-- temporaray table
-- 1. Local temporaray table
-- 2. Global temporaray table


create table #student  --  Local temporaray table
(
id int primary key identity,
name varchar(100),
age int
)

insert into #Student(name,age)values('Fahad', 23)
insert into #Student(name,age)values('Ali', 22)
insert into #Student(name,age)values('Siddiqui', 21)
insert into #Student(name,age)values('Hamza', 26)

select * from #student

--  Local temporaray table
-- 1. cannot be accessed or use by another user/New Query window
-- 2. can be created with same name by different user
-- 3. cannot be craeted with same name by same user
-- 4. can be destroyed automatically when we go to another window
-- 5. stored path-- database/System Database/tempdb/temporary table/#Student
-- 6. Every table created with unique id

 -- 2. Global temporaray table

-- 1. can be accessed or use by another user/New Query window
-- 2. cannot be created with same name by different user but used by different user
-- 3. cannot be craeted with same name by same user
-- 4. cannot be destroyed automatically when we go to another window
-- 5. stored path-- database/System Database/tempdb/temporary table/#Student
-- 6. Every table created only one  time in same folder 

create table ##student  --  Global temporaray table
(
id int primary key identity,
name varchar(100),
age int
)

insert into ##Student(name,age)values('Fahad', 23)
insert into ##Student(name,age)values('Ali', 22)
insert into ##Student(name,age)values('Siddiqui', 21)
insert into ##Student(name,age)values('Hamza', 26)

select * from #student



