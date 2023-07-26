create database DB_L29_03182023_Ckeckbox_IMG_Dwnload
use DB_L29_03182023_Ckeckbox_IMG_Dwnload

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
@hobbies varchar(100)=null,
@resume varchar(100)=null
as
begin
	if(@action='INS')
	begin
		insert into UserRegistration(name,email,password,gender,hobbies,resume)values(@name,@email,@password,@gender,@hobbies,@resume)
	end
	else if(@action='SELECT')
	begin
		select ROW_NUMBER()over(order by uid) as SerialNumber,* from UserRegistration
	end
	else if(@action='Edit')
	begin
	select * from UserRegistration where uid= @eid
	end
	else if(@action='Update')
	begin
	update UserRegistration set name=@name,email=@email,password=@password,gender=@gender,hobbies=@hobbies,resume=@resume where uid = @uid
	end
	else if(@action='Delete')
	begin
	delete from UserRegistration where uid=@did
	end
end
