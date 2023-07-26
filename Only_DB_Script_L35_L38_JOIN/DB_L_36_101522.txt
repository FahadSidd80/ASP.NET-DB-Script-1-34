create database DB_L_36_101522

use DB_L_36_101522

-- lecture 36

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
insert into Employee(name,gender,salary,department)values('Danish','Female',21200,'R&D')
insert into Employee(name,gender,salary,department)values('Sania','Female',23000,'IT')
insert into Employee(name,gender,salary,department)values('momammad','Female',23000,'IT')

--------------------------------------------------------------------------------------------------

select * from Employee

-- Swapping values of column eachother
 update Employee set name=gender, gender=name

 -- replace male with female and female with male
 update Employee set gender = 
 case 
 when gender='male' then 'female'
 when gender='female' then 'male'
 end-- But upper case me column ki baaki left value NULL ho jaegi

 update Employee set gender =
 case 
 when gender='male' then 'female'
 when gender='female' then 'male'
 else gender
 end
 select * from Employee
 -----------------------------------------------------------------------------------------------------
 -- ASCII vale and CHAR vale function

 select ASCII('A')
 select CHAR(65)

 select ascii('B')
 select CHAR(66)

 select ASCII('@')
 select ASCII('#')
  select ASCII('$')
   select ASCII('%')
    select ASCII('&')
	 select ASCII('!')
	  select ASCII('?')
	   select ASCII('/')
	    select ASCII('')
		 select ASCII('')
		  select ASCII('')
		   select ASCII('')

-- LOOP in SQL--
-- NOTE :- Only WHILE Loop is supported in SQL

-- By using while loop print value from A to Z

declare @start int
set @start = 65
while(@start<91)

begin
	print CHAR(@start)
	set @start = @start +1
end

declare @var int

set @var=0

while(@var < 100)
begin
	print Char(@var)
	set @var= @var + 1
end

declare @varr int

set @varr=33

while(@varr < 2000)
begin
	print Char(@varr) 
	set @varr= @varr + 1
end


select ASCII('!')


declare  @x int
set @x = 33
while(@x <=100)
begin
	print char(@x)
	set @x = @x+1
end



declare @y int
set @y = 65
while(@y <91)
begin
	print Char(@y)
	set @y=@y+1
end

-----------------------------------------------------------------------------------
create  table Student
(
sid int primary key identity,
sname varchar(100),
salary int
)

insert into student select * from Employee -- RUN Only when both table have same structure 
insert into Student(sname,salary) select name, salary from Employee
insert into Employee(name) select sname from Student
select * from Student
select * from Employee
------------------------------------------------------------------------------------------------

select * into product from Employee  -- yahan pe table pahle se maujood nahi thi ek hi time pe create and insert ho gaya record
select* from product
select * into Library from Employee where 1=2 -- Universal Lie
select * from Library
select * into registration from Employee
-------------------------------------------------------------------------------------------------
-- Wild card operators-- like command Ke saath use hone waale operators are called hi wild card operator

select * from Employee
select * from Employee where name='Fahad' 
select * from Employee where name='Fahad' or name='Hamza' or name='Ali' or department='IT'
select * from Employee where name='Fahad' and department='IT'
select * from Employee where name='Fahad' and department='IT' or name='Sania' and department='IT' and salary='23000'

select * from Employee where name like 'al%' -- % means kuch bhi
select * from Employee where name like 'Fa%' -- 1 pe F & 2nd Pe A

select * from Employee where name like 's%'

select * from Employee where name like '%a' -- starting me kuch bhi nut last me A
select * from Employee where name like '_a%' -- means 2nd pe A and last me kuch bhi
select * from Employee where name like '___a%' -- 4th pe A and last me kuch bhi
select * from Employee where name like '%a_' -- Statr me kuch bhi but last 2nd pe A
select * from Employee where name like '__m__' -- start se 3rd pe M and last se 3rd pe M
select * from Employee where name like '__%a' -- Last me A but aage se kuch bhi
select * from Employee where name like '%a' -- both have same OPT
select * from Employee where name like 'a%' or name like 'd%' -- name start with A Or D
select * from Employee where name like '[a,b,c,d,s,h]%' -- Name start with letter in block
select * from Employee where name like '[a,z]%' -- name start with only a & z
select * from Employee where name like '[a-z]%' -- name between A & Z including A & Z also
select * from Employee where name not like '[a,d]%' -- name not starts with A & D Baaki sab
select * from Employee where name like '[^a,d]%' -- name not starts with A & D Baaki sab

--------------------------------------------------------------------------------------------------------------

select * from Employee where name like 'a%'
select * from Employee where name like '%a'
select * from Employee where name like '_a%'
select * from Employee where name like '%a_'
select * from Employee where name like 'a%' or name like 'd%'
select * from Employee where name like '[a,d]%' 
select * from Employee where name like '[a-d]%' 
select * from Employee where name not like '[a,d]%' 
select * from Employee where name like '[^a,d]%' 
-------------------------------------------------------------------------------------------------
select * from sys.objects where type = 'U' -- For permamnet table
select * from sys.objects where type = 'P' --  For procedure
select * from sys.objects where type = 'PK' -- For primary key
select * from sys.objects where type = 'F' -- for function
select * from sys.databases

----------------------------------------------------------------------------------------------------

delete from Employee where empid > 12
delete  from Employee where empid = 11-- but delete means only all column value delete hogi na and id rahegi but useless ho jaegi kyo ki id as a PK hai na shayad
truncate table Employee  -- truncate means poora record with id from table se delete hoga
-------------------------------------------------------------------------------------------------------
-- DATE related Query

select GETDATE()  -- Will give today date -- like this-- 2022-10-17 17:14:23.290  -- format _ YYYY-MM-D  24 Hr format - Hr-Mn-Sc-Ms

select DATEPART(DAY,GETDATE())  -- Gives only today date -- means poore din ka ek part
select DATEPART(MONTH,GETDATE()) -- gives Month
select DATEPART(YEAR,GETDATE()) -- year
select DATEPART(MONTH,GETDATE()) -- MONTH

select DATEPART(YEAR,GETDATE()) as Today_Year
select DATEPART(MONTH,GETDATE()) as Today_Month
select DATEPART(DAY,GETDATE()) as today_date

-----------------------------------------------------------------------------------------
select DATENAME(DW,GETDATE()) as Today_Day

select DATEPART(DW,GETDATE())
select DATENAME(DW,GETDATE()) -- Day of week- Monday  by using DATENAME Function
select DATEPART(DW,'08-15-1947') -- Gives day acc to number

select DATENAME(DW,'08-15-1947') as That_Day_Name

select DATENAME(DW,'08-15-1947')
-----------------------------------------------------------------------------------------------
-- DATEADD Function ki help se koi bhi date add ya ghata sakte hai

select DATEADD(DAY,5,GETDATE())
select DATEADD(DAY,5,getdate())

select DATEADD(YEAR,5,GETDATE())
select DATEADD(YEAR,10,GETDATE()) -- 10 YEAR DATE WOULD BE -- LATER 2032-10-17 17:37:00.313

select DATEADD(YEAR,-6,GETDATE()) -- 6 years back 
select DATEADD(YEAR,-23,GETDATE())
------------------------------------------------------------------------------------------------

SELECT * FROM TBL WHERE INSERTED_DATE BETWEEN  DATEADD(DAY,-6,GETDATE()) AND GETDATE()

--------------------------------------------------------------------------------------------------
-- DATEDIFF Function give difference between any two DATE

SELECT DATEDIFF(YEAR,'08-15-1947',GETDATE())
select DATEDIFF(YEAR,'08-15-1947',GETDATE()) as Total_Years
--------------------------------------------------------------------------------
--Age:
--23 years 1 months 11 days
--or 277 months 11 days
--or 1206 weeks 0 days
--or 8,442 days
--or 202,608 hours
--or 12,156,480 minutes
--or 729,388,800 seconds

select DATEDIFF(YEAR,'09-06-1999', GETDATE()) as DOB_Year  -- returns Int value as year
select DATEDIFF(MONTH,'09-06-1999',getdate()) as DOB_Months 
select DATEDIFF(DAY,'09-06-1999',getdate()) as DOB_Date -- means kiten din ho gaye aaj tak
select DATEDIFF(DW,'09-06-1999',GETDATE()) as DOB_Days -- means kiten din ho gaye aaj tak
select DATEDIFF(HOUR,'09-06-1999',GETDATE()) as Total_Hours -- means itne ghante ho gaye
select datediff(MINUTE,'09-06-1999',getdate()) as Total_Minutes
select DATEDIFF(SECOND,'09-06-1999',getdate()) as Total_Second
select DATEDIFF(MILLISECOND,'09-06-1999',GETDATE()) as Total_Millisecond -- failed

SELECT DATEDIFF(YEAR,'09-08-1995',GETDATE())
SELECT DATEDIFF(DAY,'09-08-1995',GETDATE())
SELECT DATEDIFF(HOUR,'09-08-1995',GETDATE())
-----------------------------------------------------------------------------------------------------


SELECT * FROM TBL WHERE INSERTED_DATE BETWEEN  DATEADD(DAY,-6,GETDATE()) AND GETDATE() -- 6 din pahle ka record
select * from tbl where INSERTED_DATE between DATEADD(DAY,-10,getdate()) and GETDATE() -- 10 din pahle ka

-----------------------------------------------------------------------------------------------------------

-- Function In SQL
-- Always retun something never void by default like in coding function

create function fn_1(@DOB DATE)  -- @DOB is var of DATE type
returns int
-- return varchar(100)
as 
begin 
	declare @Age int
	select @Age = DATEDIFF(YEAR,@DOB,GETDATE())
	return @Age
end

select DBO.Fn_1('09-06-1999')
select DBO.Fn_1('08-15-1947')
--------------------------------------------------------------------------------------------------------------

