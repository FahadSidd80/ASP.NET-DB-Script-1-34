create database DB_L18_01262023
use DB_L18_01262023

create table tblRegistration
(
rid int primary key identity,
name varchar(50),
gender varchar(50),
country varchar(50)
)


create proc sp_tblregistration
@action varchar(50)=null,
@name varchar(50)=null,
@gender varchar(50)=null,
@country varchar(50)=null
as
begin
	if(@action = 'INSERT')
	begin
	insert into tblRegistration(name,gender,country)values(@name,@gender,@country)
	end
	else if(@action = 'DISPLAY')
	begin
	select * from tblRegistration
	end
end



















--------------------------------------------------
create proc sp_tblRegistration  -- teacher sp
@action varchar(50)=null,
@id int=0,
@name varchar(50)=null,
@gender varchar(50)=null,
@country varchar(50)=null
as
begin
	if(@action='INSERT')
		begin
			insert into tblRegistration(name,gender,country)values(@name,@gender,@country)
		end
	else if(@action='DISPLAY')
		begin
			select * from tblRegistration
		end
end


truncate table Registration