create database DB_L19_01092023
use DB_L19_01092023

create table Registration
(
id int primary key identity,
name varchar(100),
bloodgroup int,
course int
)

create proc  sp_Registration_Insert

@name varchar(100),
@bloodgroup int,
@course int
as
begin
insert into Registration(name,bloodgroup,course)values(@name,@bloodgroup,@course)
end

alter proc  sp_Registration_Get
as
begin
select * from Registration 
join tblBloodgroup on Registration.bloodgroup = tblBloodgroup.bid
join tblCourse on Registration.course = tblCourse.cid
end

create table tblBloodgroup
(
bid int primary key identity,
bname varchar(100)
)

insert into tblBloodgroup(bname)values('A+')
insert into tblBloodgroup(bname)values('B+')
insert into tblBloodgroup(bname)values('AB+')
insert into tblBloodgroup(bname)values('O+')
insert into tblBloodgroup(bname)values('A-')
insert into tblBloodgroup(bname)values('B-')
insert into tblBloodgroup(bname)values('AB-')
insert into tblBloodgroup(bname)values('O-')

select * from tblBloodgroup

create proc  sp_tblBloodgroup_Get
as
begin
select * from tblBloodgroup
end

exec sp_tblBloodgroup_Get(select * from tblBloodgroup)


create table tblCourse
(
cid int primary key identity,
cname varchar(100)
)

insert into tblCourse(cname)values('BBA')
insert into tblCourse(cname)values('MBA')
insert into tblCourse(cname)values('B.Tech')
insert into tblCourse(cname)values('M.Tech')
insert into tblCourse(cname)values('BCA')
insert into tblCourse(cname)values('MCA')
insert into tblCourse(cname)values('MBBS')
insert into tblCourse(cname)values('BUMS')

select * from tblCourse
select * from tblBloodgroup

create proc  sp_tblCourse_Get
as
begin
select * from tblCourse
end

select * from Registration
select * from tblBloodgroup

select * from Registration 
join tblBloodgroup on Registration.bloodgroup = tblBloodgroup.bid
join tblCourse on Registration.course = tblCourse.cid
