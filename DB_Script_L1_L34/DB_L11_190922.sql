create database DB_L11_190922 
use DB_L11_190922

create table Student
(
id int primary key identity,
name varchar(100),
age int
)

-- Procedure in Single way----

create proc sp_Student
@action varchar(50)=null,
@id int=0,
@name varchar(100)=null,
@age int=0
as
begin
	if(@action='Insert')
	begin
	insert into Student(name,age)values(@name,@age)
	end

	else if(@action='Display')
	begin
	select * from Student
	end

	else if(@action='Delete')
	begin
	delete from Student where id=@id
	end

	else if(@action='Edit')
	begin
	select * from student where id=@id
	end
		
	else if(@action='Update')
	begin
	update Student set name =@name, age=@age where id=@id
	end
end