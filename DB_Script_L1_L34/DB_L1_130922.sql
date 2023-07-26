create database DB130922_L1
use DB130922_L1

create table Student 
(
id int primary key identity,  -- Primary Key never Null never duplicate & Identity means Autoincrement
name varchar(100), -- column type varchar means both integer and character value
city varchar(100),
age int  -- int means only ineteger
)


insert into Student(name,city,age)values('Fahad','Sultanpur',22)
insert into Student(name,city,age)values('Hamza','kanpur',28)
insert into Student(name,city,age)values('Asna','Kanpur',26)

select * from Student

update student set name='Fahad Ali', city='Delhi' , age='25' where id=1
update student set name='Hamza Ali', city='  Agra' , age='15' where id=2 --White Space is also considered

update student set name='fatima Siddiqui', city='Noida', age=12 where id=3

delete from Student where id=4
-------------------------------------------------------------------------------------------------------------------------
insert student (name,city,age) values('Abdullah','Hyderabad',23) -- into is optional in Insert query
delete student where id=8 -- from is optional in delete query
update student set name='fatima Siddiqui', city='Noida', age=12 where id=3
