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

begin transaction -- only execute for temporary changes until we stop/Commit the transaction
update Employee set name ='Fahad' where id=8
commit transaction  -- used for stop the query

--Practical Example
Create table Items
(
itemid int primary key identity,
itemname varchar(100),
itemprice int,
itemqty int
)

insert into Items(itemname,itemprice,itemqty)values('Laptop',300,100)
insert into Items(itemname,itemprice,itemqty)values('LED',200,500)
insert into Items(itemname,itemprice,itemqty)values('TV',400,600)
select * from Items

create table sold
(
soldid int primary key identity,
itemid int,  -- old id act as foreign key
qty int -- new value
)

alter proc sp_Sold_Items_transaction
@itemid int,
@qty int
as
begin
	begin try
	begin transaction
	insert into sold(itemid,qty)values(@itemid,@qty)
	update Items set itemqty=itemqty-@qty where itemid='kkk'
	commit transaction
	print 'Transaction Successfull !!!'
	end try

	begin catch
	rollback transaction
	print 'Transaction Failed !!!'
	end catch
	
end

exec sp_Sold_Items_transaction 2,50
select * from Items
select * from sold

alter proc sp_Proc_transaction
@solditemid int,
@soldquantity int
as 
begin
	begin try
		begin transaction
		insert into sold(itemid,qty)values(@solditemid,@soldquantity)
		update Items set itemqty=itemqty-@soldquantity where itemid= @solditemid
		commit transaction
		print 'Transaction Successfull !!'
	end try
	begin catch
	rollback transaction
	print 'Transaction Failed'
	end catch
	
end

exec sp_Proc_transaction 3,20


select * from Items
select * from sold

select itemname as ItemName,itemprice as ItemPrice,itemqty LeftQuantity,qty as SoldQuantity from Items join sold on items.itemid = sold.itemid
----------------------------------------------------------------------------------------------------------------------------------------------------------------
select * from Employee
----Procedure can returns a value but only int value not non-int like varchar, date time
-- but we have another alternate way jo ki output keyword hota hai SQL me varchar value value return karwaane ke liye.

create proc sp_Employee_retrn
@id int
as
begin
select salary from EMployee where id=@id
end


exec sp_Employee_retrn 4  -- but ot returns only  column not a specific value  salary 500
----------------------------------------------------------------------------------------
create proc sp_Employee_salary  -- wants only specific int value
@id int
as
begin
declare @p int
select @p = salary from Employee where id=@id
return @p
end

declare @k int
exec @k=sp_Employee_salary 8
print @k  -- prints only 550 i.e. int value 550 khalis
-------------------------------------------------------------------------------
-- ERROR for getting name
alter proc sp_Employee_name  -- wants only specific varchar value
@id int
as
begin
declare @p varchar(50)
select @p = name from Employee where id=@id
return @p
end

declare @k varchar(100)
exec @k=sp_Employee_name 8
print @k  -- prints  this error ::: Conversion failed when converting the varchar value 'Fahad' to data type int.
------------------------------------------------------------------------------------------------------------------
--OUTPUT  0r OUT Parameter

create proc sp_Employee_name_Output  -- wants only specific varchar value
@id int,
@m varchar(100) output
as
begin
select @m = name from Employee where id=@id
end

declare @k varchar(100)
exec sp_Employee_name_Output 8,@k out  -- Fahad
print @k
--------------------------------------------------------------------------------------------
-- Difference b/w Procedure and Function

--1. Procedure may or may not return
-- but function always return

--2. function return always and any type of value is liye function me output key word nahi hota kyo ki wo sab return hi kar raha
--  but procedure always return only INT value never retrn varchar value and isi liye procedure me output keyword hota hai

--3. Function me only SELECT Query chala sakte hai
-- but Procedre koi bhi query chala sakte hai

--4. Function ke andar aap procedure use nahi kar sakte aap
-- but procedure ke andar function use kar sakte hai

--and aur bhi bahot hai 7-8 on google

--Only trigger left in database aur 3-4 class bacha tha... Trigger most important hai usme se.


