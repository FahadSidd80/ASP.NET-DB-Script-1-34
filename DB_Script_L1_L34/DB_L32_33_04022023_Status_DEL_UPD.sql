create database DB_L32_33_04022023_Status_DEL_UPD
use DB_L32_33_04022023_Status_DEL_UPD

create table UserRegistration
(
uid int primary key identity,
name varchar(50),
email varchar(100),
password varchar(100) ,
gender int,
hobbies varchar(100)-- alter
)
alter table UserRegistration alter column hobbies varchar(100) -- query to change column Type of exixting column in table
alter table UserRegistration add  resume varchar(100)  -- Query to add new column in exixting table

alter proc sp_UserRegistration
@action varchar(50)=null,
@uid int=0,
@eid int=0,
@did int=0,
@name varchar(50)=null,
@email varchar(100)=null,
@password varchar(100)=null,
@gender int=0,
@hobbies varchar(100)=null

as
begin
	if(@action='INS')
	begin
		insert into UserRegistration(name,email,password,gender,hobbies,inserted_date)values(@name,@email,@password,@gender,@hobbies,GETDATE()) -- GETDATE is a predefined funtion in SQL. is used to inserted current date.
	end
	else if(@action='SELECT')
	begin
		select ROW_NUMBER()over(order by uid) as SerialNumber,* from UserRegistration where status = 0
	end
	else if(@action='Edit')
	begin
	select * from UserRegistration where uid= @eid
	end
	else if(@action='Update')
	begin
	update UserRegistration set name=@name,email=@email,password=@password,gender=@gender,hobbies=@hobbies where uid = @uid
	end
	else if(@action='Delete')
	begin
	--delete from UserRegistration where uid=@did
	update UserRegistration set status = 1 where uid=@did
	end
end
-----------------------------------------LOGINPAGE CODE----------------------------
create proc sp_UserRegistartion_LogIn
@action varchar(100)=null,
@email varchar(100)=null,
@password varchar(100)=null

as
begin
	if(@action='SelectLogin')
	begin
		select * from UserRegistration where email=@email and password=@password
	end
	
end

--------------
create proc sp_User_ChangePassword
@action varchar(100)=null,
@oldpassword varchar(100)=null,
@newpassword varchar(100)=null,
@pid int=0
as
begin
	if(@action='Updatepassword')
	begin
		update UserRegistration set password=@newpassword where uid=@pid and password=@oldpassword
	end

end

--select * from UserRegistration where email='Abdul@gmail.com' and password='abdil123'

create proc sp_EmailValid_Userreg
@email varchar(100)
as
begin
select * from UserRegistration where email=@email
end

-----------------------------------------------------------------------------------------

-- Jab bhi koi table banaaenge to usme hamesha inserteddate and status jaroor honge.

select * from sys.objects where type='U' -- user defined table/ No of table in that DB
select * from sys.objects where type='P' -- no od sp's in that DB

alter table UserRegistration add inserted_date date, status int default  0

truncate table Userregistration
--status 0 - insert and 1 means delete

update UserRegistration set status= 0 where uid in (3,4)