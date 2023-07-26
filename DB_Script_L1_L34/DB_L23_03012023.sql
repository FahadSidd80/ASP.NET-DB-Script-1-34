create database DB_L22_02142023
use DB_L22_02142023

create table tblRegistration
(
rid int primary key identity,
name varchar(100),
age int,
gender int,
course int,
country int
)
alter table tblRegistration add  bloodgroup int;

alter proc sp_tblRegistration
@action varchar(50)=null,
@did int=0,
@eid int=0,
@uid int=0,
@name varchar(100)=null,
@age int=0,
@genderid int=0,
@courseid int=0,
@countryid int=0,
@bloodgroupid int=0
as
begin
	if(@action ='Insert')
		begin
			insert into tblRegistration(name,age,gender,course,country,bloodgroup)values(@name,@age,@genderid,@courseid,@countryid,@bloodgroupid)
		end
	else if (@action='Delete')
		begin
		delete from tblRegistration where rid=@did
		end
	else if(@action ='Edit')
		begin
		select * from tblRegistration where rid=@eid
		end
	else if(@action='Update')
		begin
		update tblRegistration set name=@name,age=@age,gender=@genderid,course=@courseid,country=@countryid,bloodgroup=@bloodgroupid where rid=@uid
		end
	else if(@action='GridGet')
		begin
			select * from tblRegistration r
			join tblCourse cr on r.course=cr.crid
			join tblCountry cn on r.country=cn.cnid
			join tblBloodgroup b on r.bloodgroup = b.bid
		end
end


create table tblCourse
(
crid int primary key identity,
crname varchar(100)
)
insert into tblCourse(crname)values('MBA')
insert into tblCourse(crname)values('BBA')
insert into tblCourse(crname)values('B.TECH')
insert into tblCourse(crname)values('M.TECH')
insert into tblCourse(crname)values('MBBS')
insert into tblCourse(crname)values('BUMS')

create table tblCountry
(
cnid int primary key identity,
cnname varchar(100)
)
insert into tblCountry(cnname)values('India')
insert into tblCountry(cnname)values('Pakisatn')
insert into tblCountry(cnname)values('USA')
insert into tblCountry(cnname)values('Canada')
insert into tblCountry(cnname)values('Germany')
insert into tblCountry(cnname)values('UAE')

create table tblBloodgroup
(
bid int primary key identity,
bname varchar(100)
)
insert into tblBloodgroup(bname)values('O+')
insert into tblBloodgroup(bname)values('A+')
insert into tblBloodgroup(bname)values('B+')
insert into tblBloodgroup(bname)values('O-')
insert into tblBloodgroup(bname)values('A-')
insert into tblBloodgroup(bname)values('B-')

alter proc sp_tblRegist_gender_Course_country
@action varchar(50)=null
as
begin
	
	if(@action = 'CourseGet')
		begin
			select * from tblCourse
		end
	else if(@action='CountryGet')
		begin
			select * from tblCountry
		end
	else if(@action='BloodGroupGet')
		begin
			select * from tblBloodgroup
		end
end
