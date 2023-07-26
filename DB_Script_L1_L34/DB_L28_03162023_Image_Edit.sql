create database DB_L28_03162023_Image_Edit
use DB_L28_03162023_Image_Edit

create table tblEMployee
(
empid int primary key identity,
name varchar(50),
age int,
img varchar(100) 
)

alter proc sp_tblEmployee
@action varchar(50)=null,
@empid int=0,
@name varchar(50)=null,
@age int=0,
@img varchar(100)=null,
@uid int=0
as
begin
	if(@action='INS')
	begin
		insert into tblEmployee(name,age,img)values(@name,@age,@img)
	end
	else if(@action='SELECT')
	begin
		select * from tblEmployee
	end
	else if(@action='Edit')
	begin
	select * from tblEmployee where empid= @empid
	end
	else if(@action='Update')
	begin
	update tblEMployee set name=@name,age=@age,img=@img where empid = @uid
	end
end

